#include "types.h"
#include "user.h"
#include "x86.h"

int
thread_create(void (*start_routine)(void*, void*), void *arg1, void *arg2)
{
  void *stack;

  stack = malloc(PGSIZE * 2);
  if(stack == 0)
    return -1;

  // Page-align the stack.
  stack = (void*)(((uint)stack + PGSIZE - 1) & ~(PGSIZE - 1));

  return clone(start_routine, arg1, arg2, stack);
}

int
thread_join(void)
{
  void *stack;
  int pid;

  pid = join(&stack);
  if(pid > 0)
    free(stack);
  return pid;
}

void
lock_init(struct lock *lk)
{
  lk->locked = 0;
}

void
lock_acquire(struct lock *lk)
{
  while(xchg(&lk->locked, 1) != 0)
    ;
  __sync_synchronize();
}

void
lock_release(struct lock *lk)
{
  __sync_synchronize();
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
}
