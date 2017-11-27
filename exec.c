#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "defs.h"
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
  char *s, *last;
  int i, off;
  uint argc, sz, sp, ustack[3+MAXARG+1];
  uint szstack;         //sz but for new stack
  struct elfhdr elf;
//Describes single unnammed file holds metadata (file type size, num blocks)
//inodes are layed out sequentially on disk at sb.startinode. each inode has 
//a number inicating its postition on disk.
  struct inode *ip;
//program section header
  struct proghdr ph;
//pde_t page directory entry unsigned int.
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
//checks if there enough space to accommodate a log entry
  begin_op();
//follows pathname until endpoint if file (file directory or device)
  if((ip = namei(path)) == 0){
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
//reads inode from disk sets ip valid
  ilock(ip);
  pgdir = 0;

  // Check ELF header == Executable and linkable format
//readi read data from inode caller must hold ip->lock
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
    goto bad;
//page directory entry struct
//sets up kernel part of page table setup kvm
  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0; 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    //Reads inode
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
      continue;
    if(ph.memsz < ph.filesz)
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
      goto bad;
    //sets sz == to new size of allocated memory
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
  end_op();
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  //Made modifications here had sz  change from sz pg round up(sz)
  sz = PGROUNDUP(sz);
  //szstack = KERNBASE - (PGSIZE*3);//sets stack pointer to point to two pages
  if((szstack = allocuvm(pgdir, KERNBASE- 3*PGSIZE, KERNBASE-PGSIZE)) == 0)
    goto bad;
//clear pte_u on page used to create an inaccessaible page beneath the userstack
  clearpteu(pgdir, (char*)(szstack-2*PGSIZE));
  //Later should probably change this to be at 0x40000000 rather than one below
  //stack...
  curproc->startstack = szstack;//top of stack ie highest address
  sp = szstack;
  //below kernbase rather than sz to move stack

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    //Stack grows downwards already!!!!
if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
  curproc->sz = sz;
  curproc->tf->eip = elf.entry;  // main
  curproc->tf->esp = sp;
  //curproc->endstack = sp;//current bottom of stack!
  switchuvm(curproc);
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
}
