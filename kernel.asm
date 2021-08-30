
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 f0 2d 10 80       	mov    $0x80102df0,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
{
80100049:	83 ec 14             	sub    $0x14,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	c7 44 24 04 20 6e 10 	movl   $0x80106e20,0x4(%esp)
80100053:	80 
80100054:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010005b:	e8 f0 3f 00 00       	call   80104050 <initlock>
  bcache.head.next = &bcache.head;
80100060:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
  bcache.head.prev = &bcache.head;
80100065:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
8010006c:	fc 10 80 
  bcache.head.next = &bcache.head;
8010006f:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
80100076:	fc 10 80 
80100079:	eb 09                	jmp    80100084 <binit+0x44>
8010007b:	90                   	nop
8010007c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 da                	mov    %ebx,%edx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100082:	89 c3                	mov    %eax,%ebx
80100084:	8d 43 0c             	lea    0xc(%ebx),%eax
    b->next = bcache.head.next;
80100087:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008a:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100091:	89 04 24             	mov    %eax,(%esp)
80100094:	c7 44 24 04 27 6e 10 	movl   $0x80106e27,0x4(%esp)
8010009b:	80 
8010009c:	e8 9f 3e 00 00       	call   80103f40 <initsleeplock>
    bcache.head.next->prev = b;
801000a1:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
801000a6:	89 58 50             	mov    %ebx,0x50(%eax)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a9:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000af:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
    bcache.head.next = b;
801000b4:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000ba:	75 c4                	jne    80100080 <binit+0x40>
  }
}
801000bc:	83 c4 14             	add    $0x14,%esp
801000bf:	5b                   	pop    %ebx
801000c0:	5d                   	pop    %ebp
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 1c             	sub    $0x1c,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&bcache.lock);
801000dc:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
{
801000e3:	8b 7d 0c             	mov    0xc(%ebp),%edi
  acquire(&bcache.lock);
801000e6:	e8 55 40 00 00       	call   80104140 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000eb:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000f1:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f7:	75 12                	jne    8010010b <bread+0x3b>
801000f9:	eb 25                	jmp    80100120 <bread+0x50>
801000fb:	90                   	nop
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 58                	jmp    80100188 <bread+0xb8>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 4d                	je     80100188 <bread+0xb8>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
80100161:	e8 ca 40 00 00       	call   80104230 <release>
      acquiresleep(&b->lock);
80100166:	8d 43 0c             	lea    0xc(%ebx),%eax
80100169:	89 04 24             	mov    %eax,(%esp)
8010016c:	e8 0f 3e 00 00       	call   80103f80 <acquiresleep>
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100171:	f6 03 02             	testb  $0x2,(%ebx)
80100174:	75 08                	jne    8010017e <bread+0xae>
    iderw(b);
80100176:	89 1c 24             	mov    %ebx,(%esp)
80100179:	e8 a2 1f 00 00       	call   80102120 <iderw>
  }
  return b;
}
8010017e:	83 c4 1c             	add    $0x1c,%esp
80100181:	89 d8                	mov    %ebx,%eax
80100183:	5b                   	pop    %ebx
80100184:	5e                   	pop    %esi
80100185:	5f                   	pop    %edi
80100186:	5d                   	pop    %ebp
80100187:	c3                   	ret    
  panic("bget: no buffers");
80100188:	c7 04 24 2e 6e 10 80 	movl   $0x80106e2e,(%esp)
8010018f:	e8 cc 01 00 00       	call   80100360 <panic>
80100194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010019a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801001a0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 14             	sub    $0x14,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	89 04 24             	mov    %eax,(%esp)
801001b0:	e8 6b 3e 00 00       	call   80104020 <holdingsleep>
801001b5:	85 c0                	test   %eax,%eax
801001b7:	74 10                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001b9:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bc:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001bf:	83 c4 14             	add    $0x14,%esp
801001c2:	5b                   	pop    %ebx
801001c3:	5d                   	pop    %ebp
  iderw(b);
801001c4:	e9 57 1f 00 00       	jmp    80102120 <iderw>
    panic("bwrite");
801001c9:	c7 04 24 3f 6e 10 80 	movl   $0x80106e3f,(%esp)
801001d0:	e8 8b 01 00 00       	call   80100360 <panic>
801001d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	83 ec 10             	sub    $0x10,%esp
801001e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	89 34 24             	mov    %esi,(%esp)
801001f1:	e8 2a 3e 00 00       	call   80104020 <holdingsleep>
801001f6:	85 c0                	test   %eax,%eax
801001f8:	74 5b                	je     80100255 <brelse+0x75>
    panic("brelse");

  releasesleep(&b->lock);
801001fa:	89 34 24             	mov    %esi,(%esp)
801001fd:	e8 de 3d 00 00       	call   80103fe0 <releasesleep>

  acquire(&bcache.lock);
80100202:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
80100209:	e8 32 3f 00 00       	call   80104140 <acquire>
  b->refcnt--;
  if (b->refcnt == 0) {
8010020e:	83 6b 4c 01          	subl   $0x1,0x4c(%ebx)
80100212:	75 2f                	jne    80100243 <brelse+0x63>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100214:	8b 43 54             	mov    0x54(%ebx),%eax
80100217:	8b 53 50             	mov    0x50(%ebx),%edx
8010021a:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
8010021d:	8b 43 50             	mov    0x50(%ebx),%eax
80100220:	8b 53 54             	mov    0x54(%ebx),%edx
80100223:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100226:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
    b->prev = &bcache.head;
8010022b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
    b->next = bcache.head.next;
80100232:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
80100235:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
8010023a:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
8010023d:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
  }
  
  release(&bcache.lock);
80100243:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
}
8010024a:	83 c4 10             	add    $0x10,%esp
8010024d:	5b                   	pop    %ebx
8010024e:	5e                   	pop    %esi
8010024f:	5d                   	pop    %ebp
  release(&bcache.lock);
80100250:	e9 db 3f 00 00       	jmp    80104230 <release>
    panic("brelse");
80100255:	c7 04 24 46 6e 10 80 	movl   $0x80106e46,(%esp)
8010025c:	e8 ff 00 00 00       	call   80100360 <panic>
80100261:	66 90                	xchg   %ax,%ax
80100263:	66 90                	xchg   %ax,%ax
80100265:	66 90                	xchg   %ax,%ax
80100267:	66 90                	xchg   %ax,%ax
80100269:	66 90                	xchg   %ax,%ax
8010026b:	66 90                	xchg   %ax,%ax
8010026d:	66 90                	xchg   %ax,%ax
8010026f:	90                   	nop

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 1c             	sub    $0x1c,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	89 3c 24             	mov    %edi,(%esp)
80100282:	e8 09 15 00 00       	call   80101790 <iunlock>
  target = n;
  acquire(&cons.lock);
80100287:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028e:	e8 ad 3e 00 00       	call   80104140 <acquire>
  while(n > 0){
80100293:	8b 55 10             	mov    0x10(%ebp),%edx
80100296:	85 d2                	test   %edx,%edx
80100298:	0f 8e bc 00 00 00    	jle    8010035a <consoleread+0xea>
8010029e:	8b 5d 10             	mov    0x10(%ebp),%ebx
801002a1:	eb 25                	jmp    801002c8 <consoleread+0x58>
801002a3:	90                   	nop
801002a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(input.r == input.w){
      if(myproc()->killed){
801002a8:	e8 f3 33 00 00       	call   801036a0 <myproc>
801002ad:	8b 40 24             	mov    0x24(%eax),%eax
801002b0:	85 c0                	test   %eax,%eax
801002b2:	75 74                	jne    80100328 <consoleread+0xb8>
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b4:	c7 44 24 04 20 a5 10 	movl   $0x8010a520,0x4(%esp)
801002bb:	80 
801002bc:	c7 04 24 a0 ff 10 80 	movl   $0x8010ffa0,(%esp)
801002c3:	e8 38 39 00 00       	call   80103c00 <sleep>
    while(input.r == input.w){
801002c8:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002cd:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002d3:	74 d3                	je     801002a8 <consoleread+0x38>
    }
    c = input.buf[input.r++ % INPUT_BUF];
801002d5:	8d 50 01             	lea    0x1(%eax),%edx
801002d8:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
801002de:	89 c2                	mov    %eax,%edx
801002e0:	83 e2 7f             	and    $0x7f,%edx
801002e3:	0f b6 8a 20 ff 10 80 	movzbl -0x7fef00e0(%edx),%ecx
801002ea:	0f be d1             	movsbl %cl,%edx
    if(c == C('D')){  // EOF
801002ed:	83 fa 04             	cmp    $0x4,%edx
801002f0:	74 57                	je     80100349 <consoleread+0xd9>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
801002f2:	83 c6 01             	add    $0x1,%esi
    --n;
801002f5:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
801002f8:	83 fa 0a             	cmp    $0xa,%edx
    *dst++ = c;
801002fb:	88 4e ff             	mov    %cl,-0x1(%esi)
    if(c == '\n')
801002fe:	74 53                	je     80100353 <consoleread+0xe3>
  while(n > 0){
80100300:	85 db                	test   %ebx,%ebx
80100302:	75 c4                	jne    801002c8 <consoleread+0x58>
80100304:	8b 45 10             	mov    0x10(%ebp),%eax
      break;
  }
  release(&cons.lock);
80100307:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010030e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100311:	e8 1a 3f 00 00       	call   80104230 <release>
  ilock(ip);
80100316:	89 3c 24             	mov    %edi,(%esp)
80100319:	e8 92 13 00 00       	call   801016b0 <ilock>
8010031e:	8b 45 e4             	mov    -0x1c(%ebp),%eax

  return target - n;
80100321:	eb 1e                	jmp    80100341 <consoleread+0xd1>
80100323:	90                   	nop
80100324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        release(&cons.lock);
80100328:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010032f:	e8 fc 3e 00 00       	call   80104230 <release>
        ilock(ip);
80100334:	89 3c 24             	mov    %edi,(%esp)
80100337:	e8 74 13 00 00       	call   801016b0 <ilock>
        return -1;
8010033c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100341:	83 c4 1c             	add    $0x1c,%esp
80100344:	5b                   	pop    %ebx
80100345:	5e                   	pop    %esi
80100346:	5f                   	pop    %edi
80100347:	5d                   	pop    %ebp
80100348:	c3                   	ret    
      if(n < target){
80100349:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010034c:	76 05                	jbe    80100353 <consoleread+0xe3>
        input.r--;
8010034e:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100353:	8b 45 10             	mov    0x10(%ebp),%eax
80100356:	29 d8                	sub    %ebx,%eax
80100358:	eb ad                	jmp    80100307 <consoleread+0x97>
  while(n > 0){
8010035a:	31 c0                	xor    %eax,%eax
8010035c:	eb a9                	jmp    80100307 <consoleread+0x97>
8010035e:	66 90                	xchg   %ax,%ax

80100360 <panic>:
{
80100360:	55                   	push   %ebp
80100361:	89 e5                	mov    %esp,%ebp
80100363:	56                   	push   %esi
80100364:	53                   	push   %ebx
80100365:	83 ec 40             	sub    $0x40,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100368:	fa                   	cli    
  cons.locking = 0;
80100369:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100370:	00 00 00 
  getcallerpcs(&s, pcs);
80100373:	8d 5d d0             	lea    -0x30(%ebp),%ebx
  cprintf("lapicid %d: panic: ", lapicid());
80100376:	e8 e5 23 00 00       	call   80102760 <lapicid>
8010037b:	8d 75 f8             	lea    -0x8(%ebp),%esi
8010037e:	c7 04 24 4d 6e 10 80 	movl   $0x80106e4d,(%esp)
80100385:	89 44 24 04          	mov    %eax,0x4(%esp)
80100389:	e8 c2 02 00 00       	call   80100650 <cprintf>
  cprintf(s);
8010038e:	8b 45 08             	mov    0x8(%ebp),%eax
80100391:	89 04 24             	mov    %eax,(%esp)
80100394:	e8 b7 02 00 00       	call   80100650 <cprintf>
  cprintf("\n");
80100399:	c7 04 24 ed 75 10 80 	movl   $0x801075ed,(%esp)
801003a0:	e8 ab 02 00 00       	call   80100650 <cprintf>
  getcallerpcs(&s, pcs);
801003a5:	8d 45 08             	lea    0x8(%ebp),%eax
801003a8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801003ac:	89 04 24             	mov    %eax,(%esp)
801003af:	e8 bc 3c 00 00       	call   80104070 <getcallerpcs>
801003b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf(" %p", pcs[i]);
801003b8:	8b 03                	mov    (%ebx),%eax
801003ba:	83 c3 04             	add    $0x4,%ebx
801003bd:	c7 04 24 61 6e 10 80 	movl   $0x80106e61,(%esp)
801003c4:	89 44 24 04          	mov    %eax,0x4(%esp)
801003c8:	e8 83 02 00 00       	call   80100650 <cprintf>
  for(i=0; i<10; i++)
801003cd:	39 f3                	cmp    %esi,%ebx
801003cf:	75 e7                	jne    801003b8 <panic+0x58>
  panicked = 1; // freeze other CPU
801003d1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003d8:	00 00 00 
801003db:	eb fe                	jmp    801003db <panic+0x7b>
801003dd:	8d 76 00             	lea    0x0(%esi),%esi

801003e0 <consputc>:
  if(panicked){
801003e0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003e6:	85 d2                	test   %edx,%edx
801003e8:	74 06                	je     801003f0 <consputc+0x10>
801003ea:	fa                   	cli    
801003eb:	eb fe                	jmp    801003eb <consputc+0xb>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi
{
801003f0:	55                   	push   %ebp
801003f1:	89 e5                	mov    %esp,%ebp
801003f3:	57                   	push   %edi
801003f4:	56                   	push   %esi
801003f5:	53                   	push   %ebx
801003f6:	89 c3                	mov    %eax,%ebx
801003f8:	83 ec 1c             	sub    $0x1c,%esp
  if(c == BACKSPACE){
801003fb:	3d 00 01 00 00       	cmp    $0x100,%eax
80100400:	0f 84 ac 00 00 00    	je     801004b2 <consputc+0xd2>
    uartputc(c);
80100406:	89 04 24             	mov    %eax,(%esp)
80100409:	e8 32 54 00 00       	call   80105840 <uartputc>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010040e:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100413:	b8 0e 00 00 00       	mov    $0xe,%eax
80100418:	89 fa                	mov    %edi,%edx
8010041a:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010041b:	be d5 03 00 00       	mov    $0x3d5,%esi
80100420:	89 f2                	mov    %esi,%edx
80100422:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100423:	0f b6 c8             	movzbl %al,%ecx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100426:	89 fa                	mov    %edi,%edx
80100428:	c1 e1 08             	shl    $0x8,%ecx
8010042b:	b8 0f 00 00 00       	mov    $0xf,%eax
80100430:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100431:	89 f2                	mov    %esi,%edx
80100433:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
80100434:	0f b6 c0             	movzbl %al,%eax
80100437:	09 c1                	or     %eax,%ecx
  if(c == '\n')
80100439:	83 fb 0a             	cmp    $0xa,%ebx
8010043c:	0f 84 0d 01 00 00    	je     8010054f <consputc+0x16f>
  else if(c == BACKSPACE){
80100442:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
80100448:	0f 84 e8 00 00 00    	je     80100536 <consputc+0x156>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
8010044e:	0f b6 db             	movzbl %bl,%ebx
80100451:	80 cf 07             	or     $0x7,%bh
80100454:	8d 79 01             	lea    0x1(%ecx),%edi
80100457:	66 89 9c 09 00 80 0b 	mov    %bx,-0x7ff48000(%ecx,%ecx,1)
8010045e:	80 
  if(pos < 0 || pos > 25*80)
8010045f:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
80100465:	0f 87 bf 00 00 00    	ja     8010052a <consputc+0x14a>
  if((pos/80) >= 24){  // Scroll up.
8010046b:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100471:	7f 68                	jg     801004db <consputc+0xfb>
80100473:	89 f8                	mov    %edi,%eax
80100475:	89 fb                	mov    %edi,%ebx
80100477:	c1 e8 08             	shr    $0x8,%eax
8010047a:	89 c6                	mov    %eax,%esi
8010047c:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100483:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100488:	b8 0e 00 00 00       	mov    $0xe,%eax
8010048d:	89 fa                	mov    %edi,%edx
8010048f:	ee                   	out    %al,(%dx)
80100490:	89 f0                	mov    %esi,%eax
80100492:	b2 d5                	mov    $0xd5,%dl
80100494:	ee                   	out    %al,(%dx)
80100495:	b8 0f 00 00 00       	mov    $0xf,%eax
8010049a:	89 fa                	mov    %edi,%edx
8010049c:	ee                   	out    %al,(%dx)
8010049d:	89 d8                	mov    %ebx,%eax
8010049f:	b2 d5                	mov    $0xd5,%dl
801004a1:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004a2:	b8 20 07 00 00       	mov    $0x720,%eax
801004a7:	66 89 01             	mov    %ax,(%ecx)
}
801004aa:	83 c4 1c             	add    $0x1c,%esp
801004ad:	5b                   	pop    %ebx
801004ae:	5e                   	pop    %esi
801004af:	5f                   	pop    %edi
801004b0:	5d                   	pop    %ebp
801004b1:	c3                   	ret    
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004b2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004b9:	e8 82 53 00 00       	call   80105840 <uartputc>
801004be:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004c5:	e8 76 53 00 00       	call   80105840 <uartputc>
801004ca:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004d1:	e8 6a 53 00 00       	call   80105840 <uartputc>
801004d6:	e9 33 ff ff ff       	jmp    8010040e <consputc+0x2e>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004db:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
801004e2:	00 
    pos -= 80;
801004e3:	8d 5f b0             	lea    -0x50(%edi),%ebx
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004e6:	c7 44 24 04 a0 80 0b 	movl   $0x800b80a0,0x4(%esp)
801004ed:	80 
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801004ee:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f5:	c7 04 24 00 80 0b 80 	movl   $0x800b8000,(%esp)
801004fc:	e8 1f 3e 00 00       	call   80104320 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100501:	b8 d0 07 00 00       	mov    $0x7d0,%eax
80100506:	29 f8                	sub    %edi,%eax
80100508:	01 c0                	add    %eax,%eax
8010050a:	89 34 24             	mov    %esi,(%esp)
8010050d:	89 44 24 08          	mov    %eax,0x8(%esp)
80100511:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100518:	00 
80100519:	e8 62 3d 00 00       	call   80104280 <memset>
8010051e:	89 f1                	mov    %esi,%ecx
80100520:	be 07 00 00 00       	mov    $0x7,%esi
80100525:	e9 59 ff ff ff       	jmp    80100483 <consputc+0xa3>
    panic("pos under/overflow");
8010052a:	c7 04 24 65 6e 10 80 	movl   $0x80106e65,(%esp)
80100531:	e8 2a fe ff ff       	call   80100360 <panic>
    if(pos > 0) --pos;
80100536:	85 c9                	test   %ecx,%ecx
80100538:	8d 79 ff             	lea    -0x1(%ecx),%edi
8010053b:	0f 85 1e ff ff ff    	jne    8010045f <consputc+0x7f>
80100541:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
80100546:	31 db                	xor    %ebx,%ebx
80100548:	31 f6                	xor    %esi,%esi
8010054a:	e9 34 ff ff ff       	jmp    80100483 <consputc+0xa3>
    pos += 80 - pos%80;
8010054f:	89 c8                	mov    %ecx,%eax
80100551:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100556:	f7 ea                	imul   %edx
80100558:	c1 ea 05             	shr    $0x5,%edx
8010055b:	8d 04 92             	lea    (%edx,%edx,4),%eax
8010055e:	c1 e0 04             	shl    $0x4,%eax
80100561:	8d 78 50             	lea    0x50(%eax),%edi
80100564:	e9 f6 fe ff ff       	jmp    8010045f <consputc+0x7f>
80100569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100570 <printint>:
{
80100570:	55                   	push   %ebp
80100571:	89 e5                	mov    %esp,%ebp
80100573:	57                   	push   %edi
80100574:	56                   	push   %esi
80100575:	89 d6                	mov    %edx,%esi
80100577:	53                   	push   %ebx
80100578:	83 ec 1c             	sub    $0x1c,%esp
  if(sign && (sign = xx < 0))
8010057b:	85 c9                	test   %ecx,%ecx
8010057d:	74 61                	je     801005e0 <printint+0x70>
8010057f:	85 c0                	test   %eax,%eax
80100581:	79 5d                	jns    801005e0 <printint+0x70>
    x = -xx;
80100583:	f7 d8                	neg    %eax
80100585:	bf 01 00 00 00       	mov    $0x1,%edi
  i = 0;
8010058a:	31 c9                	xor    %ecx,%ecx
8010058c:	eb 04                	jmp    80100592 <printint+0x22>
8010058e:	66 90                	xchg   %ax,%ax
    buf[i++] = digits[x % base];
80100590:	89 d9                	mov    %ebx,%ecx
80100592:	31 d2                	xor    %edx,%edx
80100594:	f7 f6                	div    %esi
80100596:	8d 59 01             	lea    0x1(%ecx),%ebx
80100599:	0f b6 92 90 6e 10 80 	movzbl -0x7fef9170(%edx),%edx
  }while((x /= base) != 0);
801005a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
801005a2:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
  }while((x /= base) != 0);
801005a6:	75 e8                	jne    80100590 <printint+0x20>
  if(sign)
801005a8:	85 ff                	test   %edi,%edi
    buf[i++] = digits[x % base];
801005aa:	89 d8                	mov    %ebx,%eax
  if(sign)
801005ac:	74 08                	je     801005b6 <printint+0x46>
    buf[i++] = '-';
801005ae:	8d 59 02             	lea    0x2(%ecx),%ebx
801005b1:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
  while(--i >= 0)
801005b6:	83 eb 01             	sub    $0x1,%ebx
801005b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    consputc(buf[i]);
801005c0:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
  while(--i >= 0)
801005c5:	83 eb 01             	sub    $0x1,%ebx
    consputc(buf[i]);
801005c8:	e8 13 fe ff ff       	call   801003e0 <consputc>
  while(--i >= 0)
801005cd:	83 fb ff             	cmp    $0xffffffff,%ebx
801005d0:	75 ee                	jne    801005c0 <printint+0x50>
}
801005d2:	83 c4 1c             	add    $0x1c,%esp
801005d5:	5b                   	pop    %ebx
801005d6:	5e                   	pop    %esi
801005d7:	5f                   	pop    %edi
801005d8:	5d                   	pop    %ebp
801005d9:	c3                   	ret    
801005da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    x = xx;
801005e0:	31 ff                	xor    %edi,%edi
801005e2:	eb a6                	jmp    8010058a <printint+0x1a>
801005e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801005f0 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
801005f0:	55                   	push   %ebp
801005f1:	89 e5                	mov    %esp,%ebp
801005f3:	57                   	push   %edi
801005f4:	56                   	push   %esi
801005f5:	53                   	push   %ebx
801005f6:	83 ec 1c             	sub    $0x1c,%esp
  int i;

  iunlock(ip);
801005f9:	8b 45 08             	mov    0x8(%ebp),%eax
{
801005fc:	8b 75 10             	mov    0x10(%ebp),%esi
  iunlock(ip);
801005ff:	89 04 24             	mov    %eax,(%esp)
80100602:	e8 89 11 00 00       	call   80101790 <iunlock>
  acquire(&cons.lock);
80100607:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010060e:	e8 2d 3b 00 00       	call   80104140 <acquire>
80100613:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100616:	85 f6                	test   %esi,%esi
80100618:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010061b:	7e 12                	jle    8010062f <consolewrite+0x3f>
8010061d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100620:	0f b6 07             	movzbl (%edi),%eax
80100623:	83 c7 01             	add    $0x1,%edi
80100626:	e8 b5 fd ff ff       	call   801003e0 <consputc>
  for(i = 0; i < n; i++)
8010062b:	39 df                	cmp    %ebx,%edi
8010062d:	75 f1                	jne    80100620 <consolewrite+0x30>
  release(&cons.lock);
8010062f:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100636:	e8 f5 3b 00 00       	call   80104230 <release>
  ilock(ip);
8010063b:	8b 45 08             	mov    0x8(%ebp),%eax
8010063e:	89 04 24             	mov    %eax,(%esp)
80100641:	e8 6a 10 00 00       	call   801016b0 <ilock>

  return n;
}
80100646:	83 c4 1c             	add    $0x1c,%esp
80100649:	89 f0                	mov    %esi,%eax
8010064b:	5b                   	pop    %ebx
8010064c:	5e                   	pop    %esi
8010064d:	5f                   	pop    %edi
8010064e:	5d                   	pop    %ebp
8010064f:	c3                   	ret    

80100650 <cprintf>:
{
80100650:	55                   	push   %ebp
80100651:	89 e5                	mov    %esp,%ebp
80100653:	57                   	push   %edi
80100654:	56                   	push   %esi
80100655:	53                   	push   %ebx
80100656:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
80100659:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010065e:	85 c0                	test   %eax,%eax
  locking = cons.locking;
80100660:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100663:	0f 85 27 01 00 00    	jne    80100790 <cprintf+0x140>
  if (fmt == 0)
80100669:	8b 45 08             	mov    0x8(%ebp),%eax
8010066c:	85 c0                	test   %eax,%eax
8010066e:	89 c1                	mov    %eax,%ecx
80100670:	0f 84 2b 01 00 00    	je     801007a1 <cprintf+0x151>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100676:	0f b6 00             	movzbl (%eax),%eax
80100679:	31 db                	xor    %ebx,%ebx
8010067b:	89 cf                	mov    %ecx,%edi
8010067d:	8d 75 0c             	lea    0xc(%ebp),%esi
80100680:	85 c0                	test   %eax,%eax
80100682:	75 4c                	jne    801006d0 <cprintf+0x80>
80100684:	eb 5f                	jmp    801006e5 <cprintf+0x95>
80100686:	66 90                	xchg   %ax,%ax
    c = fmt[++i] & 0xff;
80100688:	83 c3 01             	add    $0x1,%ebx
8010068b:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
8010068f:	85 d2                	test   %edx,%edx
80100691:	74 52                	je     801006e5 <cprintf+0x95>
    switch(c){
80100693:	83 fa 70             	cmp    $0x70,%edx
80100696:	74 72                	je     8010070a <cprintf+0xba>
80100698:	7f 66                	jg     80100700 <cprintf+0xb0>
8010069a:	83 fa 25             	cmp    $0x25,%edx
8010069d:	8d 76 00             	lea    0x0(%esi),%esi
801006a0:	0f 84 a2 00 00 00    	je     80100748 <cprintf+0xf8>
801006a6:	83 fa 64             	cmp    $0x64,%edx
801006a9:	75 7d                	jne    80100728 <cprintf+0xd8>
      printint(*argp++, 10, 1);
801006ab:	8d 46 04             	lea    0x4(%esi),%eax
801006ae:	b9 01 00 00 00       	mov    $0x1,%ecx
801006b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006b6:	8b 06                	mov    (%esi),%eax
801006b8:	ba 0a 00 00 00       	mov    $0xa,%edx
801006bd:	e8 ae fe ff ff       	call   80100570 <printint>
801006c2:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006c5:	83 c3 01             	add    $0x1,%ebx
801006c8:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006cc:	85 c0                	test   %eax,%eax
801006ce:	74 15                	je     801006e5 <cprintf+0x95>
    if(c != '%'){
801006d0:	83 f8 25             	cmp    $0x25,%eax
801006d3:	74 b3                	je     80100688 <cprintf+0x38>
      consputc(c);
801006d5:	e8 06 fd ff ff       	call   801003e0 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006da:	83 c3 01             	add    $0x1,%ebx
801006dd:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e1:	85 c0                	test   %eax,%eax
801006e3:	75 eb                	jne    801006d0 <cprintf+0x80>
  if(locking)
801006e5:	8b 45 e0             	mov    -0x20(%ebp),%eax
801006e8:	85 c0                	test   %eax,%eax
801006ea:	74 0c                	je     801006f8 <cprintf+0xa8>
    release(&cons.lock);
801006ec:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801006f3:	e8 38 3b 00 00       	call   80104230 <release>
}
801006f8:	83 c4 1c             	add    $0x1c,%esp
801006fb:	5b                   	pop    %ebx
801006fc:	5e                   	pop    %esi
801006fd:	5f                   	pop    %edi
801006fe:	5d                   	pop    %ebp
801006ff:	c3                   	ret    
    switch(c){
80100700:	83 fa 73             	cmp    $0x73,%edx
80100703:	74 53                	je     80100758 <cprintf+0x108>
80100705:	83 fa 78             	cmp    $0x78,%edx
80100708:	75 1e                	jne    80100728 <cprintf+0xd8>
      printint(*argp++, 16, 0);
8010070a:	8d 46 04             	lea    0x4(%esi),%eax
8010070d:	31 c9                	xor    %ecx,%ecx
8010070f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100712:	8b 06                	mov    (%esi),%eax
80100714:	ba 10 00 00 00       	mov    $0x10,%edx
80100719:	e8 52 fe ff ff       	call   80100570 <printint>
8010071e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100721:	eb a2                	jmp    801006c5 <cprintf+0x75>
80100723:	90                   	nop
80100724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100728:	b8 25 00 00 00       	mov    $0x25,%eax
8010072d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100730:	e8 ab fc ff ff       	call   801003e0 <consputc>
      consputc(c);
80100735:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100738:	89 d0                	mov    %edx,%eax
8010073a:	e8 a1 fc ff ff       	call   801003e0 <consputc>
8010073f:	eb 99                	jmp    801006da <cprintf+0x8a>
80100741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	e8 8e fc ff ff       	call   801003e0 <consputc>
      break;
80100752:	e9 6e ff ff ff       	jmp    801006c5 <cprintf+0x75>
80100757:	90                   	nop
      if((s = (char*)*argp++) == 0)
80100758:	8d 46 04             	lea    0x4(%esi),%eax
8010075b:	8b 36                	mov    (%esi),%esi
8010075d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100760:	b8 78 6e 10 80       	mov    $0x80106e78,%eax
80100765:	85 f6                	test   %esi,%esi
80100767:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
8010076a:	0f be 06             	movsbl (%esi),%eax
8010076d:	84 c0                	test   %al,%al
8010076f:	74 16                	je     80100787 <cprintf+0x137>
80100771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100778:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
8010077b:	e8 60 fc ff ff       	call   801003e0 <consputc>
      for(; *s; s++)
80100780:	0f be 06             	movsbl (%esi),%eax
80100783:	84 c0                	test   %al,%al
80100785:	75 f1                	jne    80100778 <cprintf+0x128>
      if((s = (char*)*argp++) == 0)
80100787:	8b 75 e4             	mov    -0x1c(%ebp),%esi
8010078a:	e9 36 ff ff ff       	jmp    801006c5 <cprintf+0x75>
8010078f:	90                   	nop
    acquire(&cons.lock);
80100790:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100797:	e8 a4 39 00 00       	call   80104140 <acquire>
8010079c:	e9 c8 fe ff ff       	jmp    80100669 <cprintf+0x19>
    panic("null fmt");
801007a1:	c7 04 24 7f 6e 10 80 	movl   $0x80106e7f,(%esp)
801007a8:	e8 b3 fb ff ff       	call   80100360 <panic>
801007ad:	8d 76 00             	lea    0x0(%esi),%esi

801007b0 <consoleintr>:
{
801007b0:	55                   	push   %ebp
801007b1:	89 e5                	mov    %esp,%ebp
801007b3:	57                   	push   %edi
801007b4:	56                   	push   %esi
  int c, doprocdump = 0;
801007b5:	31 f6                	xor    %esi,%esi
{
801007b7:	53                   	push   %ebx
801007b8:	83 ec 1c             	sub    $0x1c,%esp
801007bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&cons.lock);
801007be:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801007c5:	e8 76 39 00 00       	call   80104140 <acquire>
801007ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  while((c = getc()) >= 0){
801007d0:	ff d3                	call   *%ebx
801007d2:	85 c0                	test   %eax,%eax
801007d4:	89 c7                	mov    %eax,%edi
801007d6:	78 48                	js     80100820 <consoleintr+0x70>
    switch(c){
801007d8:	83 ff 10             	cmp    $0x10,%edi
801007db:	0f 84 2f 01 00 00    	je     80100910 <consoleintr+0x160>
801007e1:	7e 5d                	jle    80100840 <consoleintr+0x90>
801007e3:	83 ff 15             	cmp    $0x15,%edi
801007e6:	0f 84 d4 00 00 00    	je     801008c0 <consoleintr+0x110>
801007ec:	83 ff 7f             	cmp    $0x7f,%edi
801007ef:	90                   	nop
801007f0:	75 53                	jne    80100845 <consoleintr+0x95>
      if(input.e != input.w){
801007f2:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801007f7:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801007fd:	74 d1                	je     801007d0 <consoleintr+0x20>
        input.e--;
801007ff:	83 e8 01             	sub    $0x1,%eax
80100802:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
80100807:	b8 00 01 00 00       	mov    $0x100,%eax
8010080c:	e8 cf fb ff ff       	call   801003e0 <consputc>
  while((c = getc()) >= 0){
80100811:	ff d3                	call   *%ebx
80100813:	85 c0                	test   %eax,%eax
80100815:	89 c7                	mov    %eax,%edi
80100817:	79 bf                	jns    801007d8 <consoleintr+0x28>
80100819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&cons.lock);
80100820:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100827:	e8 04 3a 00 00       	call   80104230 <release>
  if(doprocdump) {
8010082c:	85 f6                	test   %esi,%esi
8010082e:	0f 85 ec 00 00 00    	jne    80100920 <consoleintr+0x170>
}
80100834:	83 c4 1c             	add    $0x1c,%esp
80100837:	5b                   	pop    %ebx
80100838:	5e                   	pop    %esi
80100839:	5f                   	pop    %edi
8010083a:	5d                   	pop    %ebp
8010083b:	c3                   	ret    
8010083c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    switch(c){
80100840:	83 ff 08             	cmp    $0x8,%edi
80100843:	74 ad                	je     801007f2 <consoleintr+0x42>
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100845:	85 ff                	test   %edi,%edi
80100847:	74 87                	je     801007d0 <consoleintr+0x20>
80100849:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010084e:	89 c2                	mov    %eax,%edx
80100850:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
80100856:	83 fa 7f             	cmp    $0x7f,%edx
80100859:	0f 87 71 ff ff ff    	ja     801007d0 <consoleintr+0x20>
        input.buf[input.e++ % INPUT_BUF] = c;
8010085f:	8d 50 01             	lea    0x1(%eax),%edx
80100862:	83 e0 7f             	and    $0x7f,%eax
        c = (c == '\r') ? '\n' : c;
80100865:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
80100868:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
        c = (c == '\r') ? '\n' : c;
8010086e:	0f 84 b8 00 00 00    	je     8010092c <consoleintr+0x17c>
        input.buf[input.e++ % INPUT_BUF] = c;
80100874:	89 f9                	mov    %edi,%ecx
80100876:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
        consputc(c);
8010087c:	89 f8                	mov    %edi,%eax
8010087e:	e8 5d fb ff ff       	call   801003e0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
80100883:	83 ff 04             	cmp    $0x4,%edi
80100886:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010088b:	74 19                	je     801008a6 <consoleintr+0xf6>
8010088d:	83 ff 0a             	cmp    $0xa,%edi
80100890:	74 14                	je     801008a6 <consoleintr+0xf6>
80100892:	8b 0d a0 ff 10 80    	mov    0x8010ffa0,%ecx
80100898:	8d 91 80 00 00 00    	lea    0x80(%ecx),%edx
8010089e:	39 d0                	cmp    %edx,%eax
801008a0:	0f 85 2a ff ff ff    	jne    801007d0 <consoleintr+0x20>
          wakeup(&input.r);
801008a6:	c7 04 24 a0 ff 10 80 	movl   $0x8010ffa0,(%esp)
          input.w = input.e;
801008ad:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
          wakeup(&input.r);
801008b2:	e8 d9 34 00 00       	call   80103d90 <wakeup>
801008b7:	e9 14 ff ff ff       	jmp    801007d0 <consoleintr+0x20>
801008bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      while(input.e != input.w &&
801008c0:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801008c5:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801008cb:	75 2b                	jne    801008f8 <consoleintr+0x148>
801008cd:	e9 fe fe ff ff       	jmp    801007d0 <consoleintr+0x20>
801008d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        input.e--;
801008d8:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
801008dd:	b8 00 01 00 00       	mov    $0x100,%eax
801008e2:	e8 f9 fa ff ff       	call   801003e0 <consputc>
      while(input.e != input.w &&
801008e7:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801008ec:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801008f2:	0f 84 d8 fe ff ff    	je     801007d0 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
801008f8:	83 e8 01             	sub    $0x1,%eax
801008fb:	89 c2                	mov    %eax,%edx
801008fd:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100900:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
80100907:	75 cf                	jne    801008d8 <consoleintr+0x128>
80100909:	e9 c2 fe ff ff       	jmp    801007d0 <consoleintr+0x20>
8010090e:	66 90                	xchg   %ax,%ax
      doprocdump = 1;
80100910:	be 01 00 00 00       	mov    $0x1,%esi
80100915:	e9 b6 fe ff ff       	jmp    801007d0 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}
80100920:	83 c4 1c             	add    $0x1c,%esp
80100923:	5b                   	pop    %ebx
80100924:	5e                   	pop    %esi
80100925:	5f                   	pop    %edi
80100926:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100927:	e9 44 35 00 00       	jmp    80103e70 <procdump>
        input.buf[input.e++ % INPUT_BUF] = c;
8010092c:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
        consputc(c);
80100933:	b8 0a 00 00 00       	mov    $0xa,%eax
80100938:	e8 a3 fa ff ff       	call   801003e0 <consputc>
8010093d:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100942:	e9 5f ff ff ff       	jmp    801008a6 <consoleintr+0xf6>
80100947:	89 f6                	mov    %esi,%esi
80100949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100950 <consoleinit>:

void
consoleinit(void)
{
80100950:	55                   	push   %ebp
80100951:	89 e5                	mov    %esp,%ebp
80100953:	83 ec 18             	sub    $0x18,%esp
  initlock(&cons.lock, "console");
80100956:	c7 44 24 04 88 6e 10 	movl   $0x80106e88,0x4(%esp)
8010095d:	80 
8010095e:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100965:	e8 e6 36 00 00       	call   80104050 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
8010096a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100971:	00 
80100972:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  devsw[CONSOLE].write = consolewrite;
80100979:	c7 05 6c 09 11 80 f0 	movl   $0x801005f0,0x8011096c
80100980:	05 10 80 
  devsw[CONSOLE].read = consoleread;
80100983:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
8010098a:	02 10 80 
  cons.locking = 1;
8010098d:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
80100994:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
80100997:	e8 14 19 00 00       	call   801022b0 <ioapicenable>
}
8010099c:	c9                   	leave  
8010099d:	c3                   	ret    
8010099e:	66 90                	xchg   %ax,%ax

801009a0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	57                   	push   %edi
801009a4:	56                   	push   %esi
801009a5:	53                   	push   %ebx
801009a6:	81 ec 2c 01 00 00    	sub    $0x12c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009ac:	e8 ef 2c 00 00       	call   801036a0 <myproc>
801009b1:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
801009b7:	e8 54 21 00 00       	call   80102b10 <begin_op>

  if((ip = namei(path)) == 0){
801009bc:	8b 45 08             	mov    0x8(%ebp),%eax
801009bf:	89 04 24             	mov    %eax,(%esp)
801009c2:	e8 39 15 00 00       	call   80101f00 <namei>
801009c7:	85 c0                	test   %eax,%eax
801009c9:	89 c3                	mov    %eax,%ebx
801009cb:	0f 84 bd 01 00 00    	je     80100b8e <exec+0x1ee>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
801009d1:	89 04 24             	mov    %eax,(%esp)
801009d4:	e8 d7 0c 00 00       	call   801016b0 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
801009d9:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
801009df:	c7 44 24 0c 34 00 00 	movl   $0x34,0xc(%esp)
801009e6:	00 
801009e7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801009ee:	00 
801009ef:	89 44 24 04          	mov    %eax,0x4(%esp)
801009f3:	89 1c 24             	mov    %ebx,(%esp)
801009f6:	e8 65 0f 00 00       	call   80101960 <readi>
801009fb:	83 f8 34             	cmp    $0x34,%eax
801009fe:	74 20                	je     80100a20 <exec+0x80>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a00:	89 1c 24             	mov    %ebx,(%esp)
80100a03:	e8 08 0f 00 00       	call   80101910 <iunlockput>
    end_op();
80100a08:	e8 73 21 00 00       	call   80102b80 <end_op>
  }
  return -1;
80100a0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a12:	81 c4 2c 01 00 00    	add    $0x12c,%esp
80100a18:	5b                   	pop    %ebx
80100a19:	5e                   	pop    %esi
80100a1a:	5f                   	pop    %edi
80100a1b:	5d                   	pop    %ebp
80100a1c:	c3                   	ret    
80100a1d:	8d 76 00             	lea    0x0(%esi),%esi
  if(elf.magic != ELF_MAGIC)
80100a20:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a27:	45 4c 46 
80100a2a:	75 d4                	jne    80100a00 <exec+0x60>
  if((pgdir = setupkvm()) == 0)
80100a2c:	e8 1f 60 00 00       	call   80106a50 <setupkvm>
80100a31:	85 c0                	test   %eax,%eax
80100a33:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a39:	74 c5                	je     80100a00 <exec+0x60>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a3b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a42:	00 
80100a43:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
  sz = 0;
80100a49:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a50:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a53:	0f 84 da 00 00 00    	je     80100b33 <exec+0x193>
80100a59:	31 ff                	xor    %edi,%edi
80100a5b:	eb 18                	jmp    80100a75 <exec+0xd5>
80100a5d:	8d 76 00             	lea    0x0(%esi),%esi
80100a60:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100a67:	83 c7 01             	add    $0x1,%edi
80100a6a:	83 c6 20             	add    $0x20,%esi
80100a6d:	39 f8                	cmp    %edi,%eax
80100a6f:	0f 8e be 00 00 00    	jle    80100b33 <exec+0x193>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100a75:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100a7b:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
80100a82:	00 
80100a83:	89 74 24 08          	mov    %esi,0x8(%esp)
80100a87:	89 44 24 04          	mov    %eax,0x4(%esp)
80100a8b:	89 1c 24             	mov    %ebx,(%esp)
80100a8e:	e8 cd 0e 00 00       	call   80101960 <readi>
80100a93:	83 f8 20             	cmp    $0x20,%eax
80100a96:	0f 85 84 00 00 00    	jne    80100b20 <exec+0x180>
    if(ph.type != ELF_PROG_LOAD)
80100a9c:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100aa3:	75 bb                	jne    80100a60 <exec+0xc0>
    if(ph.memsz < ph.filesz)
80100aa5:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100aab:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ab1:	72 6d                	jb     80100b20 <exec+0x180>
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100ab3:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ab9:	72 65                	jb     80100b20 <exec+0x180>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100abb:	89 44 24 08          	mov    %eax,0x8(%esp)
80100abf:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100ac5:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ac9:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100acf:	89 04 24             	mov    %eax,(%esp)
80100ad2:	e8 c9 5d 00 00       	call   801068a0 <allocuvm>
80100ad7:	85 c0                	test   %eax,%eax
80100ad9:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100adf:	74 3f                	je     80100b20 <exec+0x180>
    if(ph.vaddr % PGSIZE != 0)
80100ae1:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100ae7:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100aec:	75 32                	jne    80100b20 <exec+0x180>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100aee:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
80100af4:	89 44 24 04          	mov    %eax,0x4(%esp)
80100af8:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100afe:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80100b02:	89 54 24 10          	mov    %edx,0x10(%esp)
80100b06:	8b 95 08 ff ff ff    	mov    -0xf8(%ebp),%edx
80100b0c:	89 04 24             	mov    %eax,(%esp)
80100b0f:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100b13:	e8 c8 5c 00 00       	call   801067e0 <loaduvm>
80100b18:	85 c0                	test   %eax,%eax
80100b1a:	0f 89 40 ff ff ff    	jns    80100a60 <exec+0xc0>
    freevm(pgdir);
80100b20:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b26:	89 04 24             	mov    %eax,(%esp)
80100b29:	e8 a2 5e 00 00       	call   801069d0 <freevm>
80100b2e:	e9 cd fe ff ff       	jmp    80100a00 <exec+0x60>
  iunlockput(ip);
80100b33:	89 1c 24             	mov    %ebx,(%esp)
80100b36:	e8 d5 0d 00 00       	call   80101910 <iunlockput>
80100b3b:	90                   	nop
80100b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  end_op();
80100b40:	e8 3b 20 00 00       	call   80102b80 <end_op>
  curproc->num_pages = 1;
80100b45:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100b4b:	c7 40 7c 01 00 00 00 	movl   $0x1,0x7c(%eax)
  if((sp = allocuvm(pgdir, top, KERNBASE)) == 0)
80100b52:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b58:	c7 44 24 08 00 00 00 	movl   $0x80000000,0x8(%esp)
80100b5f:	80 
80100b60:	c7 44 24 04 00 e0 ff 	movl   $0x7fffe000,0x4(%esp)
80100b67:	7f 
80100b68:	89 04 24             	mov    %eax,(%esp)
80100b6b:	e8 30 5d 00 00       	call   801068a0 <allocuvm>
80100b70:	85 c0                	test   %eax,%eax
80100b72:	89 c3                	mov    %eax,%ebx
80100b74:	75 33                	jne    80100ba9 <exec+0x209>
    freevm(pgdir);
80100b76:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b7c:	89 04 24             	mov    %eax,(%esp)
80100b7f:	e8 4c 5e 00 00       	call   801069d0 <freevm>
  return -1;
80100b84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b89:	e9 84 fe ff ff       	jmp    80100a12 <exec+0x72>
    end_op();
80100b8e:	e8 ed 1f 00 00       	call   80102b80 <end_op>
    cprintf("exec: fail\n");
80100b93:	c7 04 24 a1 6e 10 80 	movl   $0x80106ea1,(%esp)
80100b9a:	e8 b1 fa ff ff       	call   80100650 <cprintf>
    return -1;
80100b9f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100ba4:	e9 69 fe ff ff       	jmp    80100a12 <exec+0x72>
  clearpteu(pgdir, (char*)(KERNBASE));
80100ba9:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100baf:	c7 44 24 04 00 00 00 	movl   $0x80000000,0x4(%esp)
80100bb6:	80 
80100bb7:	89 04 24             	mov    %eax,(%esp)
80100bba:	e8 41 5f 00 00       	call   80106b00 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100bbf:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bc2:	8b 00                	mov    (%eax),%eax
80100bc4:	85 c0                	test   %eax,%eax
80100bc6:	0f 84 61 01 00 00    	je     80100d2d <exec+0x38d>
80100bcc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80100bcf:	31 d2                	xor    %edx,%edx
80100bd1:	8d 71 04             	lea    0x4(%ecx),%esi
80100bd4:	89 cf                	mov    %ecx,%edi
80100bd6:	89 d1                	mov    %edx,%ecx
80100bd8:	89 f2                	mov    %esi,%edx
80100bda:	89 fe                	mov    %edi,%esi
80100bdc:	89 cf                	mov    %ecx,%edi
80100bde:	eb 08                	jmp    80100be8 <exec+0x248>
80100be0:	83 c2 04             	add    $0x4,%edx
    if(argc >= MAXARG)
80100be3:	83 ff 20             	cmp    $0x20,%edi
80100be6:	74 8e                	je     80100b76 <exec+0x1d6>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100be8:	89 04 24             	mov    %eax,(%esp)
80100beb:	89 95 e8 fe ff ff    	mov    %edx,-0x118(%ebp)
80100bf1:	e8 aa 38 00 00       	call   801044a0 <strlen>
80100bf6:	f7 d0                	not    %eax
80100bf8:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bfa:	8b 06                	mov    (%esi),%eax
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100bfc:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bff:	89 04 24             	mov    %eax,(%esp)
80100c02:	e8 99 38 00 00       	call   801044a0 <strlen>
80100c07:	83 c0 01             	add    $0x1,%eax
80100c0a:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c0e:	8b 06                	mov    (%esi),%eax
80100c10:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100c14:	89 44 24 08          	mov    %eax,0x8(%esp)
80100c18:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100c1e:	89 04 24             	mov    %eax,(%esp)
80100c21:	e8 ea 60 00 00       	call   80106d10 <copyout>
80100c26:	85 c0                	test   %eax,%eax
80100c28:	0f 88 48 ff ff ff    	js     80100b76 <exec+0x1d6>
  for(argc = 0; argv[argc]; argc++) {
80100c2e:	8b 95 e8 fe ff ff    	mov    -0x118(%ebp),%edx
    ustack[3+argc] = sp;
80100c34:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100c3a:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100c41:	83 c7 01             	add    $0x1,%edi
80100c44:	8b 02                	mov    (%edx),%eax
80100c46:	89 d6                	mov    %edx,%esi
80100c48:	85 c0                	test   %eax,%eax
80100c4a:	75 94                	jne    80100be0 <exec+0x240>
80100c4c:	89 fa                	mov    %edi,%edx
  ustack[3+argc] = 0;
80100c4e:	c7 84 95 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edx,4)
80100c55:	00 00 00 00 
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c59:	8d 04 95 04 00 00 00 	lea    0x4(,%edx,4),%eax
  ustack[1] = argc;
80100c60:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c66:	89 da                	mov    %ebx,%edx
80100c68:	29 c2                	sub    %eax,%edx
  sp -= (3+argc+1) * 4;
80100c6a:	83 c0 0c             	add    $0xc,%eax
80100c6d:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c6f:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c73:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100c79:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80100c7d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  ustack[0] = 0xffffffff;  // fake return PC
80100c81:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c88:	ff ff ff 
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c8b:	89 04 24             	mov    %eax,(%esp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c8e:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c94:	e8 77 60 00 00       	call   80106d10 <copyout>
80100c99:	85 c0                	test   %eax,%eax
80100c9b:	0f 88 d5 fe ff ff    	js     80100b76 <exec+0x1d6>
  for(last=s=path; *s; s++)
80100ca1:	8b 45 08             	mov    0x8(%ebp),%eax
80100ca4:	0f b6 10             	movzbl (%eax),%edx
80100ca7:	84 d2                	test   %dl,%dl
80100ca9:	74 19                	je     80100cc4 <exec+0x324>
80100cab:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cae:	83 c0 01             	add    $0x1,%eax
      last = s+1;
80100cb1:	80 fa 2f             	cmp    $0x2f,%dl
  for(last=s=path; *s; s++)
80100cb4:	0f b6 10             	movzbl (%eax),%edx
      last = s+1;
80100cb7:	0f 44 c8             	cmove  %eax,%ecx
80100cba:	83 c0 01             	add    $0x1,%eax
  for(last=s=path; *s; s++)
80100cbd:	84 d2                	test   %dl,%dl
80100cbf:	75 f0                	jne    80100cb1 <exec+0x311>
80100cc1:	89 4d 08             	mov    %ecx,0x8(%ebp)
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cc4:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cca:	8b 45 08             	mov    0x8(%ebp),%eax
80100ccd:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80100cd4:	00 
80100cd5:	89 44 24 04          	mov    %eax,0x4(%esp)
80100cd9:	89 f8                	mov    %edi,%eax
80100cdb:	83 c0 6c             	add    $0x6c,%eax
80100cde:	89 04 24             	mov    %eax,(%esp)
80100ce1:	e8 7a 37 00 00       	call   80104460 <safestrcpy>
  sz = PGROUNDUP(sz);
80100ce6:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  curproc->pgdir = pgdir;
80100cec:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
  oldpgdir = curproc->pgdir;
80100cf2:	8b 77 04             	mov    0x4(%edi),%esi
  sz = PGROUNDUP(sz);
80100cf5:	05 ff 0f 00 00       	add    $0xfff,%eax
80100cfa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100cff:	89 07                	mov    %eax,(%edi)
  curproc->tf->eip = elf.entry;  // main
80100d01:	8b 47 18             	mov    0x18(%edi),%eax
  curproc->pgdir = pgdir;
80100d04:	89 57 04             	mov    %edx,0x4(%edi)
  curproc->tf->eip = elf.entry;  // main
80100d07:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d0d:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d10:	8b 47 18             	mov    0x18(%edi),%eax
80100d13:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d16:	89 3c 24             	mov    %edi,(%esp)
80100d19:	e8 32 59 00 00       	call   80106650 <switchuvm>
  freevm(oldpgdir);
80100d1e:	89 34 24             	mov    %esi,(%esp)
80100d21:	e8 aa 5c 00 00       	call   801069d0 <freevm>
  return 0;
80100d26:	31 c0                	xor    %eax,%eax
80100d28:	e9 e5 fc ff ff       	jmp    80100a12 <exec+0x72>
  for(argc = 0; argv[argc]; argc++) {
80100d2d:	31 d2                	xor    %edx,%edx
80100d2f:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100d35:	e9 14 ff ff ff       	jmp    80100c4e <exec+0x2ae>
80100d3a:	66 90                	xchg   %ax,%ax
80100d3c:	66 90                	xchg   %ax,%ax
80100d3e:	66 90                	xchg   %ax,%ax

80100d40 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	83 ec 18             	sub    $0x18,%esp
  initlock(&ftable.lock, "ftable");
80100d46:	c7 44 24 04 ad 6e 10 	movl   $0x80106ead,0x4(%esp)
80100d4d:	80 
80100d4e:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100d55:	e8 f6 32 00 00       	call   80104050 <initlock>
}
80100d5a:	c9                   	leave  
80100d5b:	c3                   	ret    
80100d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100d60 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d64:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
{
80100d69:	83 ec 14             	sub    $0x14,%esp
  acquire(&ftable.lock);
80100d6c:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100d73:	e8 c8 33 00 00       	call   80104140 <acquire>
80100d78:	eb 11                	jmp    80100d8b <filealloc+0x2b>
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d80:	83 c3 18             	add    $0x18,%ebx
80100d83:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100d89:	74 25                	je     80100db0 <filealloc+0x50>
    if(f->ref == 0){
80100d8b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d8e:	85 c0                	test   %eax,%eax
80100d90:	75 ee                	jne    80100d80 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100d92:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
      f->ref = 1;
80100d99:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100da0:	e8 8b 34 00 00       	call   80104230 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100da5:	83 c4 14             	add    $0x14,%esp
      return f;
80100da8:	89 d8                	mov    %ebx,%eax
}
80100daa:	5b                   	pop    %ebx
80100dab:	5d                   	pop    %ebp
80100dac:	c3                   	ret    
80100dad:	8d 76 00             	lea    0x0(%esi),%esi
  release(&ftable.lock);
80100db0:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100db7:	e8 74 34 00 00       	call   80104230 <release>
}
80100dbc:	83 c4 14             	add    $0x14,%esp
  return 0;
80100dbf:	31 c0                	xor    %eax,%eax
}
80100dc1:	5b                   	pop    %ebx
80100dc2:	5d                   	pop    %ebp
80100dc3:	c3                   	ret    
80100dc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100dca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100dd0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	53                   	push   %ebx
80100dd4:	83 ec 14             	sub    $0x14,%esp
80100dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dda:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100de1:	e8 5a 33 00 00       	call   80104140 <acquire>
  if(f->ref < 1)
80100de6:	8b 43 04             	mov    0x4(%ebx),%eax
80100de9:	85 c0                	test   %eax,%eax
80100deb:	7e 1a                	jle    80100e07 <filedup+0x37>
    panic("filedup");
  f->ref++;
80100ded:	83 c0 01             	add    $0x1,%eax
80100df0:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100df3:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100dfa:	e8 31 34 00 00       	call   80104230 <release>
  return f;
}
80100dff:	83 c4 14             	add    $0x14,%esp
80100e02:	89 d8                	mov    %ebx,%eax
80100e04:	5b                   	pop    %ebx
80100e05:	5d                   	pop    %ebp
80100e06:	c3                   	ret    
    panic("filedup");
80100e07:	c7 04 24 b4 6e 10 80 	movl   $0x80106eb4,(%esp)
80100e0e:	e8 4d f5 ff ff       	call   80100360 <panic>
80100e13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	57                   	push   %edi
80100e24:	56                   	push   %esi
80100e25:	53                   	push   %ebx
80100e26:	83 ec 1c             	sub    $0x1c,%esp
80100e29:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e2c:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100e33:	e8 08 33 00 00       	call   80104140 <acquire>
  if(f->ref < 1)
80100e38:	8b 57 04             	mov    0x4(%edi),%edx
80100e3b:	85 d2                	test   %edx,%edx
80100e3d:	0f 8e 89 00 00 00    	jle    80100ecc <fileclose+0xac>
    panic("fileclose");
  if(--f->ref > 0){
80100e43:	83 ea 01             	sub    $0x1,%edx
80100e46:	85 d2                	test   %edx,%edx
80100e48:	89 57 04             	mov    %edx,0x4(%edi)
80100e4b:	74 13                	je     80100e60 <fileclose+0x40>
    release(&ftable.lock);
80100e4d:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e54:	83 c4 1c             	add    $0x1c,%esp
80100e57:	5b                   	pop    %ebx
80100e58:	5e                   	pop    %esi
80100e59:	5f                   	pop    %edi
80100e5a:	5d                   	pop    %ebp
    release(&ftable.lock);
80100e5b:	e9 d0 33 00 00       	jmp    80104230 <release>
  ff = *f;
80100e60:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e64:	8b 37                	mov    (%edi),%esi
80100e66:	8b 5f 0c             	mov    0xc(%edi),%ebx
  f->type = FD_NONE;
80100e69:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
  ff = *f;
80100e6f:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e72:	8b 47 10             	mov    0x10(%edi),%eax
  release(&ftable.lock);
80100e75:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
  ff = *f;
80100e7c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100e7f:	e8 ac 33 00 00       	call   80104230 <release>
  if(ff.type == FD_PIPE)
80100e84:	83 fe 01             	cmp    $0x1,%esi
80100e87:	74 0f                	je     80100e98 <fileclose+0x78>
  else if(ff.type == FD_INODE){
80100e89:	83 fe 02             	cmp    $0x2,%esi
80100e8c:	74 22                	je     80100eb0 <fileclose+0x90>
}
80100e8e:	83 c4 1c             	add    $0x1c,%esp
80100e91:	5b                   	pop    %ebx
80100e92:	5e                   	pop    %esi
80100e93:	5f                   	pop    %edi
80100e94:	5d                   	pop    %ebp
80100e95:	c3                   	ret    
80100e96:	66 90                	xchg   %ax,%ax
    pipeclose(ff.pipe, ff.writable);
80100e98:	0f be 75 e7          	movsbl -0x19(%ebp),%esi
80100e9c:	89 1c 24             	mov    %ebx,(%esp)
80100e9f:	89 74 24 04          	mov    %esi,0x4(%esp)
80100ea3:	e8 b8 23 00 00       	call   80103260 <pipeclose>
80100ea8:	eb e4                	jmp    80100e8e <fileclose+0x6e>
80100eaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    begin_op();
80100eb0:	e8 5b 1c 00 00       	call   80102b10 <begin_op>
    iput(ff.ip);
80100eb5:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100eb8:	89 04 24             	mov    %eax,(%esp)
80100ebb:	e8 10 09 00 00       	call   801017d0 <iput>
}
80100ec0:	83 c4 1c             	add    $0x1c,%esp
80100ec3:	5b                   	pop    %ebx
80100ec4:	5e                   	pop    %esi
80100ec5:	5f                   	pop    %edi
80100ec6:	5d                   	pop    %ebp
    end_op();
80100ec7:	e9 b4 1c 00 00       	jmp    80102b80 <end_op>
    panic("fileclose");
80100ecc:	c7 04 24 bc 6e 10 80 	movl   $0x80106ebc,(%esp)
80100ed3:	e8 88 f4 ff ff       	call   80100360 <panic>
80100ed8:	90                   	nop
80100ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100ee0 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100ee0:	55                   	push   %ebp
80100ee1:	89 e5                	mov    %esp,%ebp
80100ee3:	53                   	push   %ebx
80100ee4:	83 ec 14             	sub    $0x14,%esp
80100ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100eea:	83 3b 02             	cmpl   $0x2,(%ebx)
80100eed:	75 31                	jne    80100f20 <filestat+0x40>
    ilock(f->ip);
80100eef:	8b 43 10             	mov    0x10(%ebx),%eax
80100ef2:	89 04 24             	mov    %eax,(%esp)
80100ef5:	e8 b6 07 00 00       	call   801016b0 <ilock>
    stati(f->ip, st);
80100efa:	8b 45 0c             	mov    0xc(%ebp),%eax
80100efd:	89 44 24 04          	mov    %eax,0x4(%esp)
80100f01:	8b 43 10             	mov    0x10(%ebx),%eax
80100f04:	89 04 24             	mov    %eax,(%esp)
80100f07:	e8 24 0a 00 00       	call   80101930 <stati>
    iunlock(f->ip);
80100f0c:	8b 43 10             	mov    0x10(%ebx),%eax
80100f0f:	89 04 24             	mov    %eax,(%esp)
80100f12:	e8 79 08 00 00       	call   80101790 <iunlock>
    return 0;
  }
  return -1;
}
80100f17:	83 c4 14             	add    $0x14,%esp
    return 0;
80100f1a:	31 c0                	xor    %eax,%eax
}
80100f1c:	5b                   	pop    %ebx
80100f1d:	5d                   	pop    %ebp
80100f1e:	c3                   	ret    
80100f1f:	90                   	nop
80100f20:	83 c4 14             	add    $0x14,%esp
  return -1;
80100f23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f28:	5b                   	pop    %ebx
80100f29:	5d                   	pop    %ebp
80100f2a:	c3                   	ret    
80100f2b:	90                   	nop
80100f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f30 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f30:	55                   	push   %ebp
80100f31:	89 e5                	mov    %esp,%ebp
80100f33:	57                   	push   %edi
80100f34:	56                   	push   %esi
80100f35:	53                   	push   %ebx
80100f36:	83 ec 1c             	sub    $0x1c,%esp
80100f39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f3c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f3f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f42:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f46:	74 68                	je     80100fb0 <fileread+0x80>
    return -1;
  if(f->type == FD_PIPE)
80100f48:	8b 03                	mov    (%ebx),%eax
80100f4a:	83 f8 01             	cmp    $0x1,%eax
80100f4d:	74 49                	je     80100f98 <fileread+0x68>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f4f:	83 f8 02             	cmp    $0x2,%eax
80100f52:	75 63                	jne    80100fb7 <fileread+0x87>
    ilock(f->ip);
80100f54:	8b 43 10             	mov    0x10(%ebx),%eax
80100f57:	89 04 24             	mov    %eax,(%esp)
80100f5a:	e8 51 07 00 00       	call   801016b0 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f5f:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80100f63:	8b 43 14             	mov    0x14(%ebx),%eax
80100f66:	89 74 24 04          	mov    %esi,0x4(%esp)
80100f6a:	89 44 24 08          	mov    %eax,0x8(%esp)
80100f6e:	8b 43 10             	mov    0x10(%ebx),%eax
80100f71:	89 04 24             	mov    %eax,(%esp)
80100f74:	e8 e7 09 00 00       	call   80101960 <readi>
80100f79:	85 c0                	test   %eax,%eax
80100f7b:	89 c6                	mov    %eax,%esi
80100f7d:	7e 03                	jle    80100f82 <fileread+0x52>
      f->off += r;
80100f7f:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f82:	8b 43 10             	mov    0x10(%ebx),%eax
80100f85:	89 04 24             	mov    %eax,(%esp)
80100f88:	e8 03 08 00 00       	call   80101790 <iunlock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f8d:	89 f0                	mov    %esi,%eax
    return r;
  }
  panic("fileread");
}
80100f8f:	83 c4 1c             	add    $0x1c,%esp
80100f92:	5b                   	pop    %ebx
80100f93:	5e                   	pop    %esi
80100f94:	5f                   	pop    %edi
80100f95:	5d                   	pop    %ebp
80100f96:	c3                   	ret    
80100f97:	90                   	nop
    return piperead(f->pipe, addr, n);
80100f98:	8b 43 0c             	mov    0xc(%ebx),%eax
80100f9b:	89 45 08             	mov    %eax,0x8(%ebp)
}
80100f9e:	83 c4 1c             	add    $0x1c,%esp
80100fa1:	5b                   	pop    %ebx
80100fa2:	5e                   	pop    %esi
80100fa3:	5f                   	pop    %edi
80100fa4:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
80100fa5:	e9 36 24 00 00       	jmp    801033e0 <piperead>
80100faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80100fb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fb5:	eb d8                	jmp    80100f8f <fileread+0x5f>
  panic("fileread");
80100fb7:	c7 04 24 c6 6e 10 80 	movl   $0x80106ec6,(%esp)
80100fbe:	e8 9d f3 ff ff       	call   80100360 <panic>
80100fc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100fd0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	57                   	push   %edi
80100fd4:	56                   	push   %esi
80100fd5:	53                   	push   %ebx
80100fd6:	83 ec 2c             	sub    $0x2c,%esp
80100fd9:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fdc:	8b 7d 08             	mov    0x8(%ebp),%edi
80100fdf:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fe2:	8b 45 10             	mov    0x10(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fe5:	80 7f 09 00          	cmpb   $0x0,0x9(%edi)
{
80100fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
80100fec:	0f 84 ae 00 00 00    	je     801010a0 <filewrite+0xd0>
    return -1;
  if(f->type == FD_PIPE)
80100ff2:	8b 07                	mov    (%edi),%eax
80100ff4:	83 f8 01             	cmp    $0x1,%eax
80100ff7:	0f 84 c2 00 00 00    	je     801010bf <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100ffd:	83 f8 02             	cmp    $0x2,%eax
80101000:	0f 85 d7 00 00 00    	jne    801010dd <filewrite+0x10d>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101009:	31 db                	xor    %ebx,%ebx
8010100b:	85 c0                	test   %eax,%eax
8010100d:	7f 31                	jg     80101040 <filewrite+0x70>
8010100f:	e9 9c 00 00 00       	jmp    801010b0 <filewrite+0xe0>
80101014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
      iunlock(f->ip);
80101018:	8b 4f 10             	mov    0x10(%edi),%ecx
        f->off += r;
8010101b:	01 47 14             	add    %eax,0x14(%edi)
8010101e:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101021:	89 0c 24             	mov    %ecx,(%esp)
80101024:	e8 67 07 00 00       	call   80101790 <iunlock>
      end_op();
80101029:	e8 52 1b 00 00       	call   80102b80 <end_op>
8010102e:	8b 45 e0             	mov    -0x20(%ebp),%eax

      if(r < 0)
        break;
      if(r != n1)
80101031:	39 f0                	cmp    %esi,%eax
80101033:	0f 85 98 00 00 00    	jne    801010d1 <filewrite+0x101>
        panic("short filewrite");
      i += r;
80101039:	01 c3                	add    %eax,%ebx
    while(i < n){
8010103b:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
8010103e:	7e 70                	jle    801010b0 <filewrite+0xe0>
      int n1 = n - i;
80101040:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101043:	b8 00 1a 00 00       	mov    $0x1a00,%eax
80101048:	29 de                	sub    %ebx,%esi
8010104a:	81 fe 00 1a 00 00    	cmp    $0x1a00,%esi
80101050:	0f 4f f0             	cmovg  %eax,%esi
      begin_op();
80101053:	e8 b8 1a 00 00       	call   80102b10 <begin_op>
      ilock(f->ip);
80101058:	8b 47 10             	mov    0x10(%edi),%eax
8010105b:	89 04 24             	mov    %eax,(%esp)
8010105e:	e8 4d 06 00 00       	call   801016b0 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101063:	89 74 24 0c          	mov    %esi,0xc(%esp)
80101067:	8b 47 14             	mov    0x14(%edi),%eax
8010106a:	89 44 24 08          	mov    %eax,0x8(%esp)
8010106e:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101071:	01 d8                	add    %ebx,%eax
80101073:	89 44 24 04          	mov    %eax,0x4(%esp)
80101077:	8b 47 10             	mov    0x10(%edi),%eax
8010107a:	89 04 24             	mov    %eax,(%esp)
8010107d:	e8 de 09 00 00       	call   80101a60 <writei>
80101082:	85 c0                	test   %eax,%eax
80101084:	7f 92                	jg     80101018 <filewrite+0x48>
      iunlock(f->ip);
80101086:	8b 4f 10             	mov    0x10(%edi),%ecx
80101089:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010108c:	89 0c 24             	mov    %ecx,(%esp)
8010108f:	e8 fc 06 00 00       	call   80101790 <iunlock>
      end_op();
80101094:	e8 e7 1a 00 00       	call   80102b80 <end_op>
      if(r < 0)
80101099:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010109c:	85 c0                	test   %eax,%eax
8010109e:	74 91                	je     80101031 <filewrite+0x61>
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010a0:	83 c4 2c             	add    $0x2c,%esp
    return -1;
801010a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801010a8:	5b                   	pop    %ebx
801010a9:	5e                   	pop    %esi
801010aa:	5f                   	pop    %edi
801010ab:	5d                   	pop    %ebp
801010ac:	c3                   	ret    
801010ad:	8d 76 00             	lea    0x0(%esi),%esi
    return i == n ? n : -1;
801010b0:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
801010b3:	89 d8                	mov    %ebx,%eax
801010b5:	75 e9                	jne    801010a0 <filewrite+0xd0>
}
801010b7:	83 c4 2c             	add    $0x2c,%esp
801010ba:	5b                   	pop    %ebx
801010bb:	5e                   	pop    %esi
801010bc:	5f                   	pop    %edi
801010bd:	5d                   	pop    %ebp
801010be:	c3                   	ret    
    return pipewrite(f->pipe, addr, n);
801010bf:	8b 47 0c             	mov    0xc(%edi),%eax
801010c2:	89 45 08             	mov    %eax,0x8(%ebp)
}
801010c5:	83 c4 2c             	add    $0x2c,%esp
801010c8:	5b                   	pop    %ebx
801010c9:	5e                   	pop    %esi
801010ca:	5f                   	pop    %edi
801010cb:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
801010cc:	e9 1f 22 00 00       	jmp    801032f0 <pipewrite>
        panic("short filewrite");
801010d1:	c7 04 24 cf 6e 10 80 	movl   $0x80106ecf,(%esp)
801010d8:	e8 83 f2 ff ff       	call   80100360 <panic>
  panic("filewrite");
801010dd:	c7 04 24 d5 6e 10 80 	movl   $0x80106ed5,(%esp)
801010e4:	e8 77 f2 ff ff       	call   80100360 <panic>
801010e9:	66 90                	xchg   %ax,%ax
801010eb:	66 90                	xchg   %ax,%ax
801010ed:	66 90                	xchg   %ax,%ax
801010ef:	90                   	nop

801010f0 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010f0:	55                   	push   %ebp
801010f1:	89 e5                	mov    %esp,%ebp
801010f3:	57                   	push   %edi
801010f4:	56                   	push   %esi
801010f5:	53                   	push   %ebx
801010f6:	83 ec 2c             	sub    $0x2c,%esp
801010f9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801010fc:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101101:	85 c0                	test   %eax,%eax
80101103:	0f 84 8c 00 00 00    	je     80101195 <balloc+0xa5>
80101109:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101110:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101113:	89 f0                	mov    %esi,%eax
80101115:	c1 f8 0c             	sar    $0xc,%eax
80101118:	03 05 d8 09 11 80    	add    0x801109d8,%eax
8010111e:	89 44 24 04          	mov    %eax,0x4(%esp)
80101122:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101125:	89 04 24             	mov    %eax,(%esp)
80101128:	e8 a3 ef ff ff       	call   801000d0 <bread>
8010112d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101130:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101135:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101138:	31 c0                	xor    %eax,%eax
8010113a:	eb 33                	jmp    8010116f <balloc+0x7f>
8010113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101140:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101143:	89 c2                	mov    %eax,%edx
      m = 1 << (bi % 8);
80101145:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101147:	c1 fa 03             	sar    $0x3,%edx
      m = 1 << (bi % 8);
8010114a:	83 e1 07             	and    $0x7,%ecx
8010114d:	bf 01 00 00 00       	mov    $0x1,%edi
80101152:	d3 e7                	shl    %cl,%edi
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101154:	0f b6 5c 13 5c       	movzbl 0x5c(%ebx,%edx,1),%ebx
      m = 1 << (bi % 8);
80101159:	89 f9                	mov    %edi,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010115b:	0f b6 fb             	movzbl %bl,%edi
8010115e:	85 cf                	test   %ecx,%edi
80101160:	74 46                	je     801011a8 <balloc+0xb8>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101162:	83 c0 01             	add    $0x1,%eax
80101165:	83 c6 01             	add    $0x1,%esi
80101168:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010116d:	74 05                	je     80101174 <balloc+0x84>
8010116f:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80101172:	72 cc                	jb     80101140 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80101174:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101177:	89 04 24             	mov    %eax,(%esp)
8010117a:	e8 61 f0 ff ff       	call   801001e0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010117f:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101186:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101189:	3b 05 c0 09 11 80    	cmp    0x801109c0,%eax
8010118f:	0f 82 7b ff ff ff    	jb     80101110 <balloc+0x20>
  }
  panic("balloc: out of blocks");
80101195:	c7 04 24 df 6e 10 80 	movl   $0x80106edf,(%esp)
8010119c:	e8 bf f1 ff ff       	call   80100360 <panic>
801011a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bp->data[bi/8] |= m;  // Mark block in use.
801011a8:	09 d9                	or     %ebx,%ecx
801011aa:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801011ad:	88 4c 13 5c          	mov    %cl,0x5c(%ebx,%edx,1)
        log_write(bp);
801011b1:	89 1c 24             	mov    %ebx,(%esp)
801011b4:	e8 f7 1a 00 00       	call   80102cb0 <log_write>
        brelse(bp);
801011b9:	89 1c 24             	mov    %ebx,(%esp)
801011bc:	e8 1f f0 ff ff       	call   801001e0 <brelse>
  bp = bread(dev, bno);
801011c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
801011c4:	89 74 24 04          	mov    %esi,0x4(%esp)
801011c8:	89 04 24             	mov    %eax,(%esp)
801011cb:	e8 00 ef ff ff       	call   801000d0 <bread>
  memset(bp->data, 0, BSIZE);
801011d0:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
801011d7:	00 
801011d8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801011df:	00 
  bp = bread(dev, bno);
801011e0:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011e2:	8d 40 5c             	lea    0x5c(%eax),%eax
801011e5:	89 04 24             	mov    %eax,(%esp)
801011e8:	e8 93 30 00 00       	call   80104280 <memset>
  log_write(bp);
801011ed:	89 1c 24             	mov    %ebx,(%esp)
801011f0:	e8 bb 1a 00 00       	call   80102cb0 <log_write>
  brelse(bp);
801011f5:	89 1c 24             	mov    %ebx,(%esp)
801011f8:	e8 e3 ef ff ff       	call   801001e0 <brelse>
}
801011fd:	83 c4 2c             	add    $0x2c,%esp
80101200:	89 f0                	mov    %esi,%eax
80101202:	5b                   	pop    %ebx
80101203:	5e                   	pop    %esi
80101204:	5f                   	pop    %edi
80101205:	5d                   	pop    %ebp
80101206:	c3                   	ret    
80101207:	89 f6                	mov    %esi,%esi
80101209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101210 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101210:	55                   	push   %ebp
80101211:	89 e5                	mov    %esp,%ebp
80101213:	57                   	push   %edi
80101214:	89 c7                	mov    %eax,%edi
80101216:	56                   	push   %esi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101217:	31 f6                	xor    %esi,%esi
{
80101219:	53                   	push   %ebx
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010121a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
{
8010121f:	83 ec 1c             	sub    $0x1c,%esp
  acquire(&icache.lock);
80101222:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
{
80101229:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
8010122c:	e8 0f 2f 00 00       	call   80104140 <acquire>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101231:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101234:	eb 14                	jmp    8010124a <iget+0x3a>
80101236:	66 90                	xchg   %ax,%ax
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101238:	85 f6                	test   %esi,%esi
8010123a:	74 3c                	je     80101278 <iget+0x68>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010123c:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101242:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101248:	74 46                	je     80101290 <iget+0x80>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
8010124a:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010124d:	85 c9                	test   %ecx,%ecx
8010124f:	7e e7                	jle    80101238 <iget+0x28>
80101251:	39 3b                	cmp    %edi,(%ebx)
80101253:	75 e3                	jne    80101238 <iget+0x28>
80101255:	39 53 04             	cmp    %edx,0x4(%ebx)
80101258:	75 de                	jne    80101238 <iget+0x28>
      ip->ref++;
8010125a:	83 c1 01             	add    $0x1,%ecx
      return ip;
8010125d:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
8010125f:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
      ip->ref++;
80101266:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101269:	e8 c2 2f 00 00       	call   80104230 <release>
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
}
8010126e:	83 c4 1c             	add    $0x1c,%esp
80101271:	89 f0                	mov    %esi,%eax
80101273:	5b                   	pop    %ebx
80101274:	5e                   	pop    %esi
80101275:	5f                   	pop    %edi
80101276:	5d                   	pop    %ebp
80101277:	c3                   	ret    
80101278:	85 c9                	test   %ecx,%ecx
8010127a:	0f 44 f3             	cmove  %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010127d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101283:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101289:	75 bf                	jne    8010124a <iget+0x3a>
8010128b:	90                   	nop
8010128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(empty == 0)
80101290:	85 f6                	test   %esi,%esi
80101292:	74 29                	je     801012bd <iget+0xad>
  ip->dev = dev;
80101294:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101296:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
80101299:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
801012a0:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012a7:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801012ae:	e8 7d 2f 00 00       	call   80104230 <release>
}
801012b3:	83 c4 1c             	add    $0x1c,%esp
801012b6:	89 f0                	mov    %esi,%eax
801012b8:	5b                   	pop    %ebx
801012b9:	5e                   	pop    %esi
801012ba:	5f                   	pop    %edi
801012bb:	5d                   	pop    %ebp
801012bc:	c3                   	ret    
    panic("iget: no inodes");
801012bd:	c7 04 24 f5 6e 10 80 	movl   $0x80106ef5,(%esp)
801012c4:	e8 97 f0 ff ff       	call   80100360 <panic>
801012c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801012d0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	56                   	push   %esi
801012d5:	53                   	push   %ebx
801012d6:	89 c3                	mov    %eax,%ebx
801012d8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012db:	83 fa 0b             	cmp    $0xb,%edx
801012de:	77 18                	ja     801012f8 <bmap+0x28>
801012e0:	8d 34 90             	lea    (%eax,%edx,4),%esi
    if((addr = ip->addrs[bn]) == 0)
801012e3:	8b 46 5c             	mov    0x5c(%esi),%eax
801012e6:	85 c0                	test   %eax,%eax
801012e8:	74 66                	je     80101350 <bmap+0x80>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012ea:	83 c4 1c             	add    $0x1c,%esp
801012ed:	5b                   	pop    %ebx
801012ee:	5e                   	pop    %esi
801012ef:	5f                   	pop    %edi
801012f0:	5d                   	pop    %ebp
801012f1:	c3                   	ret    
801012f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;
801012f8:	8d 72 f4             	lea    -0xc(%edx),%esi
  if(bn < NINDIRECT){
801012fb:	83 fe 7f             	cmp    $0x7f,%esi
801012fe:	77 77                	ja     80101377 <bmap+0xa7>
    if((addr = ip->addrs[NDIRECT]) == 0)
80101300:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101306:	85 c0                	test   %eax,%eax
80101308:	74 5e                	je     80101368 <bmap+0x98>
    bp = bread(ip->dev, addr);
8010130a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010130e:	8b 03                	mov    (%ebx),%eax
80101310:	89 04 24             	mov    %eax,(%esp)
80101313:	e8 b8 ed ff ff       	call   801000d0 <bread>
    if((addr = a[bn]) == 0){
80101318:	8d 54 b0 5c          	lea    0x5c(%eax,%esi,4),%edx
    bp = bread(ip->dev, addr);
8010131c:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
8010131e:	8b 32                	mov    (%edx),%esi
80101320:	85 f6                	test   %esi,%esi
80101322:	75 19                	jne    8010133d <bmap+0x6d>
      a[bn] = addr = balloc(ip->dev);
80101324:	8b 03                	mov    (%ebx),%eax
80101326:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101329:	e8 c2 fd ff ff       	call   801010f0 <balloc>
8010132e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101331:	89 02                	mov    %eax,(%edx)
80101333:	89 c6                	mov    %eax,%esi
      log_write(bp);
80101335:	89 3c 24             	mov    %edi,(%esp)
80101338:	e8 73 19 00 00       	call   80102cb0 <log_write>
    brelse(bp);
8010133d:	89 3c 24             	mov    %edi,(%esp)
80101340:	e8 9b ee ff ff       	call   801001e0 <brelse>
}
80101345:	83 c4 1c             	add    $0x1c,%esp
    brelse(bp);
80101348:	89 f0                	mov    %esi,%eax
}
8010134a:	5b                   	pop    %ebx
8010134b:	5e                   	pop    %esi
8010134c:	5f                   	pop    %edi
8010134d:	5d                   	pop    %ebp
8010134e:	c3                   	ret    
8010134f:	90                   	nop
      ip->addrs[bn] = addr = balloc(ip->dev);
80101350:	8b 03                	mov    (%ebx),%eax
80101352:	e8 99 fd ff ff       	call   801010f0 <balloc>
80101357:	89 46 5c             	mov    %eax,0x5c(%esi)
}
8010135a:	83 c4 1c             	add    $0x1c,%esp
8010135d:	5b                   	pop    %ebx
8010135e:	5e                   	pop    %esi
8010135f:	5f                   	pop    %edi
80101360:	5d                   	pop    %ebp
80101361:	c3                   	ret    
80101362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101368:	8b 03                	mov    (%ebx),%eax
8010136a:	e8 81 fd ff ff       	call   801010f0 <balloc>
8010136f:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
80101375:	eb 93                	jmp    8010130a <bmap+0x3a>
  panic("bmap: out of range");
80101377:	c7 04 24 05 6f 10 80 	movl   $0x80106f05,(%esp)
8010137e:	e8 dd ef ff ff       	call   80100360 <panic>
80101383:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101390 <readsb>:
{
80101390:	55                   	push   %ebp
80101391:	89 e5                	mov    %esp,%ebp
80101393:	56                   	push   %esi
80101394:	53                   	push   %ebx
80101395:	83 ec 10             	sub    $0x10,%esp
  bp = bread(dev, 1);
80101398:	8b 45 08             	mov    0x8(%ebp),%eax
8010139b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801013a2:	00 
{
801013a3:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
801013a6:	89 04 24             	mov    %eax,(%esp)
801013a9:	e8 22 ed ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
801013ae:	89 34 24             	mov    %esi,(%esp)
801013b1:	c7 44 24 08 1c 00 00 	movl   $0x1c,0x8(%esp)
801013b8:	00 
  bp = bread(dev, 1);
801013b9:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013bb:	8d 40 5c             	lea    0x5c(%eax),%eax
801013be:	89 44 24 04          	mov    %eax,0x4(%esp)
801013c2:	e8 59 2f 00 00       	call   80104320 <memmove>
  brelse(bp);
801013c7:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801013ca:	83 c4 10             	add    $0x10,%esp
801013cd:	5b                   	pop    %ebx
801013ce:	5e                   	pop    %esi
801013cf:	5d                   	pop    %ebp
  brelse(bp);
801013d0:	e9 0b ee ff ff       	jmp    801001e0 <brelse>
801013d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801013d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013e0 <bfree>:
{
801013e0:	55                   	push   %ebp
801013e1:	89 e5                	mov    %esp,%ebp
801013e3:	57                   	push   %edi
801013e4:	89 d7                	mov    %edx,%edi
801013e6:	56                   	push   %esi
801013e7:	53                   	push   %ebx
801013e8:	89 c3                	mov    %eax,%ebx
801013ea:	83 ec 1c             	sub    $0x1c,%esp
  readsb(dev, &sb);
801013ed:	89 04 24             	mov    %eax,(%esp)
801013f0:	c7 44 24 04 c0 09 11 	movl   $0x801109c0,0x4(%esp)
801013f7:	80 
801013f8:	e8 93 ff ff ff       	call   80101390 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
801013fd:	89 fa                	mov    %edi,%edx
801013ff:	c1 ea 0c             	shr    $0xc,%edx
80101402:	03 15 d8 09 11 80    	add    0x801109d8,%edx
80101408:	89 1c 24             	mov    %ebx,(%esp)
  m = 1 << (bi % 8);
8010140b:	bb 01 00 00 00       	mov    $0x1,%ebx
  bp = bread(dev, BBLOCK(b, sb));
80101410:	89 54 24 04          	mov    %edx,0x4(%esp)
80101414:	e8 b7 ec ff ff       	call   801000d0 <bread>
  m = 1 << (bi % 8);
80101419:	89 f9                	mov    %edi,%ecx
  bi = b % BPB;
8010141b:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
80101421:	89 fa                	mov    %edi,%edx
  m = 1 << (bi % 8);
80101423:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101426:	c1 fa 03             	sar    $0x3,%edx
  m = 1 << (bi % 8);
80101429:	d3 e3                	shl    %cl,%ebx
  bp = bread(dev, BBLOCK(b, sb));
8010142b:	89 c6                	mov    %eax,%esi
  if((bp->data[bi/8] & m) == 0)
8010142d:	0f b6 44 10 5c       	movzbl 0x5c(%eax,%edx,1),%eax
80101432:	0f b6 c8             	movzbl %al,%ecx
80101435:	85 d9                	test   %ebx,%ecx
80101437:	74 20                	je     80101459 <bfree+0x79>
  bp->data[bi/8] &= ~m;
80101439:	f7 d3                	not    %ebx
8010143b:	21 c3                	and    %eax,%ebx
8010143d:	88 5c 16 5c          	mov    %bl,0x5c(%esi,%edx,1)
  log_write(bp);
80101441:	89 34 24             	mov    %esi,(%esp)
80101444:	e8 67 18 00 00       	call   80102cb0 <log_write>
  brelse(bp);
80101449:	89 34 24             	mov    %esi,(%esp)
8010144c:	e8 8f ed ff ff       	call   801001e0 <brelse>
}
80101451:	83 c4 1c             	add    $0x1c,%esp
80101454:	5b                   	pop    %ebx
80101455:	5e                   	pop    %esi
80101456:	5f                   	pop    %edi
80101457:	5d                   	pop    %ebp
80101458:	c3                   	ret    
    panic("freeing free block");
80101459:	c7 04 24 18 6f 10 80 	movl   $0x80106f18,(%esp)
80101460:	e8 fb ee ff ff       	call   80100360 <panic>
80101465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101470 <iinit>:
{
80101470:	55                   	push   %ebp
80101471:	89 e5                	mov    %esp,%ebp
80101473:	53                   	push   %ebx
80101474:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101479:	83 ec 24             	sub    $0x24,%esp
  initlock(&icache.lock, "icache");
8010147c:	c7 44 24 04 2b 6f 10 	movl   $0x80106f2b,0x4(%esp)
80101483:	80 
80101484:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010148b:	e8 c0 2b 00 00       	call   80104050 <initlock>
    initsleeplock(&icache.inode[i].lock, "inode");
80101490:	89 1c 24             	mov    %ebx,(%esp)
80101493:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101499:	c7 44 24 04 32 6f 10 	movl   $0x80106f32,0x4(%esp)
801014a0:	80 
801014a1:	e8 9a 2a 00 00       	call   80103f40 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
801014a6:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
801014ac:	75 e2                	jne    80101490 <iinit+0x20>
  readsb(dev, &sb);
801014ae:	8b 45 08             	mov    0x8(%ebp),%eax
801014b1:	c7 44 24 04 c0 09 11 	movl   $0x801109c0,0x4(%esp)
801014b8:	80 
801014b9:	89 04 24             	mov    %eax,(%esp)
801014bc:	e8 cf fe ff ff       	call   80101390 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014c1:	a1 d8 09 11 80       	mov    0x801109d8,%eax
801014c6:	c7 04 24 98 6f 10 80 	movl   $0x80106f98,(%esp)
801014cd:	89 44 24 1c          	mov    %eax,0x1c(%esp)
801014d1:	a1 d4 09 11 80       	mov    0x801109d4,%eax
801014d6:	89 44 24 18          	mov    %eax,0x18(%esp)
801014da:	a1 d0 09 11 80       	mov    0x801109d0,%eax
801014df:	89 44 24 14          	mov    %eax,0x14(%esp)
801014e3:	a1 cc 09 11 80       	mov    0x801109cc,%eax
801014e8:	89 44 24 10          	mov    %eax,0x10(%esp)
801014ec:	a1 c8 09 11 80       	mov    0x801109c8,%eax
801014f1:	89 44 24 0c          	mov    %eax,0xc(%esp)
801014f5:	a1 c4 09 11 80       	mov    0x801109c4,%eax
801014fa:	89 44 24 08          	mov    %eax,0x8(%esp)
801014fe:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101503:	89 44 24 04          	mov    %eax,0x4(%esp)
80101507:	e8 44 f1 ff ff       	call   80100650 <cprintf>
}
8010150c:	83 c4 24             	add    $0x24,%esp
8010150f:	5b                   	pop    %ebx
80101510:	5d                   	pop    %ebp
80101511:	c3                   	ret    
80101512:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101520 <ialloc>:
{
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	57                   	push   %edi
80101524:	56                   	push   %esi
80101525:	53                   	push   %ebx
80101526:	83 ec 2c             	sub    $0x2c,%esp
80101529:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(inum = 1; inum < sb.ninodes; inum++){
8010152c:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
{
80101533:	8b 7d 08             	mov    0x8(%ebp),%edi
80101536:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101539:	0f 86 a2 00 00 00    	jbe    801015e1 <ialloc+0xc1>
8010153f:	be 01 00 00 00       	mov    $0x1,%esi
80101544:	bb 01 00 00 00       	mov    $0x1,%ebx
80101549:	eb 1a                	jmp    80101565 <ialloc+0x45>
8010154b:	90                   	nop
8010154c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    brelse(bp);
80101550:	89 14 24             	mov    %edx,(%esp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101553:	83 c3 01             	add    $0x1,%ebx
    brelse(bp);
80101556:	e8 85 ec ff ff       	call   801001e0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010155b:	89 de                	mov    %ebx,%esi
8010155d:	3b 1d c8 09 11 80    	cmp    0x801109c8,%ebx
80101563:	73 7c                	jae    801015e1 <ialloc+0xc1>
    bp = bread(dev, IBLOCK(inum, sb));
80101565:	89 f0                	mov    %esi,%eax
80101567:	c1 e8 03             	shr    $0x3,%eax
8010156a:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101570:	89 3c 24             	mov    %edi,(%esp)
80101573:	89 44 24 04          	mov    %eax,0x4(%esp)
80101577:	e8 54 eb ff ff       	call   801000d0 <bread>
8010157c:	89 c2                	mov    %eax,%edx
    dip = (struct dinode*)bp->data + inum%IPB;
8010157e:	89 f0                	mov    %esi,%eax
80101580:	83 e0 07             	and    $0x7,%eax
80101583:	c1 e0 06             	shl    $0x6,%eax
80101586:	8d 4c 02 5c          	lea    0x5c(%edx,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010158a:	66 83 39 00          	cmpw   $0x0,(%ecx)
8010158e:	75 c0                	jne    80101550 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101590:	89 0c 24             	mov    %ecx,(%esp)
80101593:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
8010159a:	00 
8010159b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801015a2:	00 
801015a3:	89 55 dc             	mov    %edx,-0x24(%ebp)
801015a6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015a9:	e8 d2 2c 00 00       	call   80104280 <memset>
      dip->type = type;
801015ae:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
      log_write(bp);   // mark it allocated on the disk
801015b2:	8b 55 dc             	mov    -0x24(%ebp),%edx
      dip->type = type;
801015b5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      log_write(bp);   // mark it allocated on the disk
801015b8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
      dip->type = type;
801015bb:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801015be:	89 14 24             	mov    %edx,(%esp)
801015c1:	e8 ea 16 00 00       	call   80102cb0 <log_write>
      brelse(bp);
801015c6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801015c9:	89 14 24             	mov    %edx,(%esp)
801015cc:	e8 0f ec ff ff       	call   801001e0 <brelse>
}
801015d1:	83 c4 2c             	add    $0x2c,%esp
      return iget(dev, inum);
801015d4:	89 f2                	mov    %esi,%edx
}
801015d6:	5b                   	pop    %ebx
      return iget(dev, inum);
801015d7:	89 f8                	mov    %edi,%eax
}
801015d9:	5e                   	pop    %esi
801015da:	5f                   	pop    %edi
801015db:	5d                   	pop    %ebp
      return iget(dev, inum);
801015dc:	e9 2f fc ff ff       	jmp    80101210 <iget>
  panic("ialloc: no inodes");
801015e1:	c7 04 24 38 6f 10 80 	movl   $0x80106f38,(%esp)
801015e8:	e8 73 ed ff ff       	call   80100360 <panic>
801015ed:	8d 76 00             	lea    0x0(%esi),%esi

801015f0 <iupdate>:
{
801015f0:	55                   	push   %ebp
801015f1:	89 e5                	mov    %esp,%ebp
801015f3:	56                   	push   %esi
801015f4:	53                   	push   %ebx
801015f5:	83 ec 10             	sub    $0x10,%esp
801015f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015fb:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015fe:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101601:	c1 e8 03             	shr    $0x3,%eax
80101604:	03 05 d4 09 11 80    	add    0x801109d4,%eax
8010160a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010160e:	8b 43 a4             	mov    -0x5c(%ebx),%eax
80101611:	89 04 24             	mov    %eax,(%esp)
80101614:	e8 b7 ea ff ff       	call   801000d0 <bread>
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101619:	8b 53 a8             	mov    -0x58(%ebx),%edx
8010161c:	83 e2 07             	and    $0x7,%edx
8010161f:	c1 e2 06             	shl    $0x6,%edx
80101622:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101626:	89 c6                	mov    %eax,%esi
  dip->type = ip->type;
80101628:	0f b7 43 f4          	movzwl -0xc(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010162c:	83 c2 0c             	add    $0xc,%edx
  dip->type = ip->type;
8010162f:	66 89 42 f4          	mov    %ax,-0xc(%edx)
  dip->major = ip->major;
80101633:	0f b7 43 f6          	movzwl -0xa(%ebx),%eax
80101637:	66 89 42 f6          	mov    %ax,-0xa(%edx)
  dip->minor = ip->minor;
8010163b:	0f b7 43 f8          	movzwl -0x8(%ebx),%eax
8010163f:	66 89 42 f8          	mov    %ax,-0x8(%edx)
  dip->nlink = ip->nlink;
80101643:	0f b7 43 fa          	movzwl -0x6(%ebx),%eax
80101647:	66 89 42 fa          	mov    %ax,-0x6(%edx)
  dip->size = ip->size;
8010164b:	8b 43 fc             	mov    -0x4(%ebx),%eax
8010164e:	89 42 fc             	mov    %eax,-0x4(%edx)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101651:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101655:	89 14 24             	mov    %edx,(%esp)
80101658:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
8010165f:	00 
80101660:	e8 bb 2c 00 00       	call   80104320 <memmove>
  log_write(bp);
80101665:	89 34 24             	mov    %esi,(%esp)
80101668:	e8 43 16 00 00       	call   80102cb0 <log_write>
  brelse(bp);
8010166d:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101670:	83 c4 10             	add    $0x10,%esp
80101673:	5b                   	pop    %ebx
80101674:	5e                   	pop    %esi
80101675:	5d                   	pop    %ebp
  brelse(bp);
80101676:	e9 65 eb ff ff       	jmp    801001e0 <brelse>
8010167b:	90                   	nop
8010167c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101680 <idup>:
{
80101680:	55                   	push   %ebp
80101681:	89 e5                	mov    %esp,%ebp
80101683:	53                   	push   %ebx
80101684:	83 ec 14             	sub    $0x14,%esp
80101687:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010168a:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101691:	e8 aa 2a 00 00       	call   80104140 <acquire>
  ip->ref++;
80101696:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
8010169a:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801016a1:	e8 8a 2b 00 00       	call   80104230 <release>
}
801016a6:	83 c4 14             	add    $0x14,%esp
801016a9:	89 d8                	mov    %ebx,%eax
801016ab:	5b                   	pop    %ebx
801016ac:	5d                   	pop    %ebp
801016ad:	c3                   	ret    
801016ae:	66 90                	xchg   %ax,%ax

801016b0 <ilock>:
{
801016b0:	55                   	push   %ebp
801016b1:	89 e5                	mov    %esp,%ebp
801016b3:	56                   	push   %esi
801016b4:	53                   	push   %ebx
801016b5:	83 ec 10             	sub    $0x10,%esp
801016b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
801016bb:	85 db                	test   %ebx,%ebx
801016bd:	0f 84 b3 00 00 00    	je     80101776 <ilock+0xc6>
801016c3:	8b 53 08             	mov    0x8(%ebx),%edx
801016c6:	85 d2                	test   %edx,%edx
801016c8:	0f 8e a8 00 00 00    	jle    80101776 <ilock+0xc6>
  acquiresleep(&ip->lock);
801016ce:	8d 43 0c             	lea    0xc(%ebx),%eax
801016d1:	89 04 24             	mov    %eax,(%esp)
801016d4:	e8 a7 28 00 00       	call   80103f80 <acquiresleep>
  if(ip->valid == 0){
801016d9:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016dc:	85 c0                	test   %eax,%eax
801016de:	74 08                	je     801016e8 <ilock+0x38>
}
801016e0:	83 c4 10             	add    $0x10,%esp
801016e3:	5b                   	pop    %ebx
801016e4:	5e                   	pop    %esi
801016e5:	5d                   	pop    %ebp
801016e6:	c3                   	ret    
801016e7:	90                   	nop
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016e8:	8b 43 04             	mov    0x4(%ebx),%eax
801016eb:	c1 e8 03             	shr    $0x3,%eax
801016ee:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016f4:	89 44 24 04          	mov    %eax,0x4(%esp)
801016f8:	8b 03                	mov    (%ebx),%eax
801016fa:	89 04 24             	mov    %eax,(%esp)
801016fd:	e8 ce e9 ff ff       	call   801000d0 <bread>
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101702:	8b 53 04             	mov    0x4(%ebx),%edx
80101705:	83 e2 07             	and    $0x7,%edx
80101708:	c1 e2 06             	shl    $0x6,%edx
8010170b:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010170f:	89 c6                	mov    %eax,%esi
    ip->type = dip->type;
80101711:	0f b7 02             	movzwl (%edx),%eax
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101714:	83 c2 0c             	add    $0xc,%edx
    ip->type = dip->type;
80101717:	66 89 43 50          	mov    %ax,0x50(%ebx)
    ip->major = dip->major;
8010171b:	0f b7 42 f6          	movzwl -0xa(%edx),%eax
8010171f:	66 89 43 52          	mov    %ax,0x52(%ebx)
    ip->minor = dip->minor;
80101723:	0f b7 42 f8          	movzwl -0x8(%edx),%eax
80101727:	66 89 43 54          	mov    %ax,0x54(%ebx)
    ip->nlink = dip->nlink;
8010172b:	0f b7 42 fa          	movzwl -0x6(%edx),%eax
8010172f:	66 89 43 56          	mov    %ax,0x56(%ebx)
    ip->size = dip->size;
80101733:	8b 42 fc             	mov    -0x4(%edx),%eax
80101736:	89 43 58             	mov    %eax,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101739:	8d 43 5c             	lea    0x5c(%ebx),%eax
8010173c:	89 54 24 04          	mov    %edx,0x4(%esp)
80101740:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101747:	00 
80101748:	89 04 24             	mov    %eax,(%esp)
8010174b:	e8 d0 2b 00 00       	call   80104320 <memmove>
    brelse(bp);
80101750:	89 34 24             	mov    %esi,(%esp)
80101753:	e8 88 ea ff ff       	call   801001e0 <brelse>
    if(ip->type == 0)
80101758:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
8010175d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101764:	0f 85 76 ff ff ff    	jne    801016e0 <ilock+0x30>
      panic("ilock: no type");
8010176a:	c7 04 24 50 6f 10 80 	movl   $0x80106f50,(%esp)
80101771:	e8 ea eb ff ff       	call   80100360 <panic>
    panic("ilock");
80101776:	c7 04 24 4a 6f 10 80 	movl   $0x80106f4a,(%esp)
8010177d:	e8 de eb ff ff       	call   80100360 <panic>
80101782:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101790 <iunlock>:
{
80101790:	55                   	push   %ebp
80101791:	89 e5                	mov    %esp,%ebp
80101793:	56                   	push   %esi
80101794:	53                   	push   %ebx
80101795:	83 ec 10             	sub    $0x10,%esp
80101798:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
8010179b:	85 db                	test   %ebx,%ebx
8010179d:	74 24                	je     801017c3 <iunlock+0x33>
8010179f:	8d 73 0c             	lea    0xc(%ebx),%esi
801017a2:	89 34 24             	mov    %esi,(%esp)
801017a5:	e8 76 28 00 00       	call   80104020 <holdingsleep>
801017aa:	85 c0                	test   %eax,%eax
801017ac:	74 15                	je     801017c3 <iunlock+0x33>
801017ae:	8b 43 08             	mov    0x8(%ebx),%eax
801017b1:	85 c0                	test   %eax,%eax
801017b3:	7e 0e                	jle    801017c3 <iunlock+0x33>
  releasesleep(&ip->lock);
801017b5:	89 75 08             	mov    %esi,0x8(%ebp)
}
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	5b                   	pop    %ebx
801017bc:	5e                   	pop    %esi
801017bd:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
801017be:	e9 1d 28 00 00       	jmp    80103fe0 <releasesleep>
    panic("iunlock");
801017c3:	c7 04 24 5f 6f 10 80 	movl   $0x80106f5f,(%esp)
801017ca:	e8 91 eb ff ff       	call   80100360 <panic>
801017cf:	90                   	nop

801017d0 <iput>:
{
801017d0:	55                   	push   %ebp
801017d1:	89 e5                	mov    %esp,%ebp
801017d3:	57                   	push   %edi
801017d4:	56                   	push   %esi
801017d5:	53                   	push   %ebx
801017d6:	83 ec 1c             	sub    $0x1c,%esp
801017d9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquiresleep(&ip->lock);
801017dc:	8d 7e 0c             	lea    0xc(%esi),%edi
801017df:	89 3c 24             	mov    %edi,(%esp)
801017e2:	e8 99 27 00 00       	call   80103f80 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017e7:	8b 56 4c             	mov    0x4c(%esi),%edx
801017ea:	85 d2                	test   %edx,%edx
801017ec:	74 07                	je     801017f5 <iput+0x25>
801017ee:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017f3:	74 2b                	je     80101820 <iput+0x50>
  releasesleep(&ip->lock);
801017f5:	89 3c 24             	mov    %edi,(%esp)
801017f8:	e8 e3 27 00 00       	call   80103fe0 <releasesleep>
  acquire(&icache.lock);
801017fd:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101804:	e8 37 29 00 00       	call   80104140 <acquire>
  ip->ref--;
80101809:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
8010180d:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
}
80101814:	83 c4 1c             	add    $0x1c,%esp
80101817:	5b                   	pop    %ebx
80101818:	5e                   	pop    %esi
80101819:	5f                   	pop    %edi
8010181a:	5d                   	pop    %ebp
  release(&icache.lock);
8010181b:	e9 10 2a 00 00       	jmp    80104230 <release>
    acquire(&icache.lock);
80101820:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101827:	e8 14 29 00 00       	call   80104140 <acquire>
    int r = ip->ref;
8010182c:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
8010182f:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101836:	e8 f5 29 00 00       	call   80104230 <release>
    if(r == 1){
8010183b:	83 fb 01             	cmp    $0x1,%ebx
8010183e:	75 b5                	jne    801017f5 <iput+0x25>
80101840:	8d 4e 30             	lea    0x30(%esi),%ecx
80101843:	89 f3                	mov    %esi,%ebx
80101845:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101848:	89 cf                	mov    %ecx,%edi
8010184a:	eb 0b                	jmp    80101857 <iput+0x87>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101850:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101853:	39 fb                	cmp    %edi,%ebx
80101855:	74 19                	je     80101870 <iput+0xa0>
    if(ip->addrs[i]){
80101857:	8b 53 5c             	mov    0x5c(%ebx),%edx
8010185a:	85 d2                	test   %edx,%edx
8010185c:	74 f2                	je     80101850 <iput+0x80>
      bfree(ip->dev, ip->addrs[i]);
8010185e:	8b 06                	mov    (%esi),%eax
80101860:	e8 7b fb ff ff       	call   801013e0 <bfree>
      ip->addrs[i] = 0;
80101865:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
8010186c:	eb e2                	jmp    80101850 <iput+0x80>
8010186e:	66 90                	xchg   %ax,%ax
    }
  }

  if(ip->addrs[NDIRECT]){
80101870:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101876:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101879:	85 c0                	test   %eax,%eax
8010187b:	75 2b                	jne    801018a8 <iput+0xd8>
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
8010187d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101884:	89 34 24             	mov    %esi,(%esp)
80101887:	e8 64 fd ff ff       	call   801015f0 <iupdate>
      ip->type = 0;
8010188c:	31 c0                	xor    %eax,%eax
8010188e:	66 89 46 50          	mov    %ax,0x50(%esi)
      iupdate(ip);
80101892:	89 34 24             	mov    %esi,(%esp)
80101895:	e8 56 fd ff ff       	call   801015f0 <iupdate>
      ip->valid = 0;
8010189a:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801018a1:	e9 4f ff ff ff       	jmp    801017f5 <iput+0x25>
801018a6:	66 90                	xchg   %ax,%ax
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018a8:	89 44 24 04          	mov    %eax,0x4(%esp)
801018ac:	8b 06                	mov    (%esi),%eax
    for(j = 0; j < NINDIRECT; j++){
801018ae:	31 db                	xor    %ebx,%ebx
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018b0:	89 04 24             	mov    %eax,(%esp)
801018b3:	e8 18 e8 ff ff       	call   801000d0 <bread>
    for(j = 0; j < NINDIRECT; j++){
801018b8:	89 7d e0             	mov    %edi,-0x20(%ebp)
    a = (uint*)bp->data;
801018bb:	8d 48 5c             	lea    0x5c(%eax),%ecx
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(j = 0; j < NINDIRECT; j++){
801018c1:	89 cf                	mov    %ecx,%edi
801018c3:	31 c0                	xor    %eax,%eax
801018c5:	eb 0e                	jmp    801018d5 <iput+0x105>
801018c7:	90                   	nop
801018c8:	83 c3 01             	add    $0x1,%ebx
801018cb:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
801018d1:	89 d8                	mov    %ebx,%eax
801018d3:	74 10                	je     801018e5 <iput+0x115>
      if(a[j])
801018d5:	8b 14 87             	mov    (%edi,%eax,4),%edx
801018d8:	85 d2                	test   %edx,%edx
801018da:	74 ec                	je     801018c8 <iput+0xf8>
        bfree(ip->dev, a[j]);
801018dc:	8b 06                	mov    (%esi),%eax
801018de:	e8 fd fa ff ff       	call   801013e0 <bfree>
801018e3:	eb e3                	jmp    801018c8 <iput+0xf8>
    brelse(bp);
801018e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801018e8:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018eb:	89 04 24             	mov    %eax,(%esp)
801018ee:	e8 ed e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018f3:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018f9:	8b 06                	mov    (%esi),%eax
801018fb:	e8 e0 fa ff ff       	call   801013e0 <bfree>
    ip->addrs[NDIRECT] = 0;
80101900:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101907:	00 00 00 
8010190a:	e9 6e ff ff ff       	jmp    8010187d <iput+0xad>
8010190f:	90                   	nop

80101910 <iunlockput>:
{
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	53                   	push   %ebx
80101914:	83 ec 14             	sub    $0x14,%esp
80101917:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010191a:	89 1c 24             	mov    %ebx,(%esp)
8010191d:	e8 6e fe ff ff       	call   80101790 <iunlock>
  iput(ip);
80101922:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80101925:	83 c4 14             	add    $0x14,%esp
80101928:	5b                   	pop    %ebx
80101929:	5d                   	pop    %ebp
  iput(ip);
8010192a:	e9 a1 fe ff ff       	jmp    801017d0 <iput>
8010192f:	90                   	nop

80101930 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101930:	55                   	push   %ebp
80101931:	89 e5                	mov    %esp,%ebp
80101933:	8b 55 08             	mov    0x8(%ebp),%edx
80101936:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101939:	8b 0a                	mov    (%edx),%ecx
8010193b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010193e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101941:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101944:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101948:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010194b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010194f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101953:	8b 52 58             	mov    0x58(%edx),%edx
80101956:	89 50 10             	mov    %edx,0x10(%eax)
}
80101959:	5d                   	pop    %ebp
8010195a:	c3                   	ret    
8010195b:	90                   	nop
8010195c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101960 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101960:	55                   	push   %ebp
80101961:	89 e5                	mov    %esp,%ebp
80101963:	57                   	push   %edi
80101964:	56                   	push   %esi
80101965:	53                   	push   %ebx
80101966:	83 ec 2c             	sub    $0x2c,%esp
80101969:	8b 45 0c             	mov    0xc(%ebp),%eax
8010196c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010196f:	8b 75 10             	mov    0x10(%ebp),%esi
80101972:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101975:	8b 45 14             	mov    0x14(%ebp),%eax
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101978:	66 83 7f 50 03       	cmpw   $0x3,0x50(%edi)
{
8010197d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(ip->type == T_DEV){
80101980:	0f 84 aa 00 00 00    	je     80101a30 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101986:	8b 47 58             	mov    0x58(%edi),%eax
80101989:	39 f0                	cmp    %esi,%eax
8010198b:	0f 82 c7 00 00 00    	jb     80101a58 <readi+0xf8>
80101991:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101994:	89 da                	mov    %ebx,%edx
80101996:	01 f2                	add    %esi,%edx
80101998:	0f 82 ba 00 00 00    	jb     80101a58 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
8010199e:	89 c1                	mov    %eax,%ecx
801019a0:	29 f1                	sub    %esi,%ecx
801019a2:	39 d0                	cmp    %edx,%eax
801019a4:	0f 43 cb             	cmovae %ebx,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019a7:	31 c0                	xor    %eax,%eax
801019a9:	85 c9                	test   %ecx,%ecx
    n = ip->size - off;
801019ab:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019ae:	74 70                	je     80101a20 <readi+0xc0>
801019b0:	89 7d d8             	mov    %edi,-0x28(%ebp)
801019b3:	89 c7                	mov    %eax,%edi
801019b5:	8d 76 00             	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019b8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019bb:	89 f2                	mov    %esi,%edx
801019bd:	c1 ea 09             	shr    $0x9,%edx
801019c0:	89 d8                	mov    %ebx,%eax
801019c2:	e8 09 f9 ff ff       	call   801012d0 <bmap>
801019c7:	89 44 24 04          	mov    %eax,0x4(%esp)
801019cb:	8b 03                	mov    (%ebx),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
801019cd:	bb 00 02 00 00       	mov    $0x200,%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019d2:	89 04 24             	mov    %eax,(%esp)
801019d5:	e8 f6 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801019da:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801019dd:	29 f9                	sub    %edi,%ecx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019df:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019e1:	89 f0                	mov    %esi,%eax
801019e3:	25 ff 01 00 00       	and    $0x1ff,%eax
801019e8:	29 c3                	sub    %eax,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019ea:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
801019ee:	39 cb                	cmp    %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019f0:	89 44 24 04          	mov    %eax,0x4(%esp)
801019f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
801019f7:	0f 47 d9             	cmova  %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019fa:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019fe:	01 df                	add    %ebx,%edi
80101a00:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
80101a02:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101a05:	89 04 24             	mov    %eax,(%esp)
80101a08:	e8 13 29 00 00       	call   80104320 <memmove>
    brelse(bp);
80101a0d:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a10:	89 14 24             	mov    %edx,(%esp)
80101a13:	e8 c8 e7 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a18:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a1b:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a1e:	77 98                	ja     801019b8 <readi+0x58>
  }
  return n;
80101a20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a23:	83 c4 2c             	add    $0x2c,%esp
80101a26:	5b                   	pop    %ebx
80101a27:	5e                   	pop    %esi
80101a28:	5f                   	pop    %edi
80101a29:	5d                   	pop    %ebp
80101a2a:	c3                   	ret    
80101a2b:	90                   	nop
80101a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a30:	0f bf 47 52          	movswl 0x52(%edi),%eax
80101a34:	66 83 f8 09          	cmp    $0x9,%ax
80101a38:	77 1e                	ja     80101a58 <readi+0xf8>
80101a3a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a41:	85 c0                	test   %eax,%eax
80101a43:	74 13                	je     80101a58 <readi+0xf8>
    return devsw[ip->major].read(ip, dst, n);
80101a45:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101a48:	89 75 10             	mov    %esi,0x10(%ebp)
}
80101a4b:	83 c4 2c             	add    $0x2c,%esp
80101a4e:	5b                   	pop    %ebx
80101a4f:	5e                   	pop    %esi
80101a50:	5f                   	pop    %edi
80101a51:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101a52:	ff e0                	jmp    *%eax
80101a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80101a58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a5d:	eb c4                	jmp    80101a23 <readi+0xc3>
80101a5f:	90                   	nop

80101a60 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a60:	55                   	push   %ebp
80101a61:	89 e5                	mov    %esp,%ebp
80101a63:	57                   	push   %edi
80101a64:	56                   	push   %esi
80101a65:	53                   	push   %ebx
80101a66:	83 ec 2c             	sub    $0x2c,%esp
80101a69:	8b 45 08             	mov    0x8(%ebp),%eax
80101a6c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a6f:	8b 4d 14             	mov    0x14(%ebp),%ecx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a72:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101a77:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a7a:	8b 75 10             	mov    0x10(%ebp),%esi
80101a7d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a80:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  if(ip->type == T_DEV){
80101a83:	0f 84 b7 00 00 00    	je     80101b40 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a89:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a8c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a8f:	0f 82 e3 00 00 00    	jb     80101b78 <writei+0x118>
80101a95:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101a98:	89 c8                	mov    %ecx,%eax
80101a9a:	01 f0                	add    %esi,%eax
80101a9c:	0f 82 d6 00 00 00    	jb     80101b78 <writei+0x118>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101aa2:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101aa7:	0f 87 cb 00 00 00    	ja     80101b78 <writei+0x118>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101aad:	85 c9                	test   %ecx,%ecx
80101aaf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101ab6:	74 77                	je     80101b2f <writei+0xcf>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ab8:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101abb:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101abd:	bb 00 02 00 00       	mov    $0x200,%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ac2:	c1 ea 09             	shr    $0x9,%edx
80101ac5:	89 f8                	mov    %edi,%eax
80101ac7:	e8 04 f8 ff ff       	call   801012d0 <bmap>
80101acc:	89 44 24 04          	mov    %eax,0x4(%esp)
80101ad0:	8b 07                	mov    (%edi),%eax
80101ad2:	89 04 24             	mov    %eax,(%esp)
80101ad5:	e8 f6 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101ada:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101add:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101ae0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ae3:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ae5:	89 f0                	mov    %esi,%eax
80101ae7:	25 ff 01 00 00       	and    $0x1ff,%eax
80101aec:	29 c3                	sub    %eax,%ebx
80101aee:	39 cb                	cmp    %ecx,%ebx
80101af0:	0f 47 d9             	cmova  %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101af3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101af7:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101af9:	89 54 24 04          	mov    %edx,0x4(%esp)
80101afd:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101b01:	89 04 24             	mov    %eax,(%esp)
80101b04:	e8 17 28 00 00       	call   80104320 <memmove>
    log_write(bp);
80101b09:	89 3c 24             	mov    %edi,(%esp)
80101b0c:	e8 9f 11 00 00       	call   80102cb0 <log_write>
    brelse(bp);
80101b11:	89 3c 24             	mov    %edi,(%esp)
80101b14:	e8 c7 e6 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b19:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b1c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b1f:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b22:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b25:	77 91                	ja     80101ab8 <writei+0x58>
  }

  if(n > 0 && off > ip->size){
80101b27:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b2a:	39 70 58             	cmp    %esi,0x58(%eax)
80101b2d:	72 39                	jb     80101b68 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b2f:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b32:	83 c4 2c             	add    $0x2c,%esp
80101b35:	5b                   	pop    %ebx
80101b36:	5e                   	pop    %esi
80101b37:	5f                   	pop    %edi
80101b38:	5d                   	pop    %ebp
80101b39:	c3                   	ret    
80101b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b44:	66 83 f8 09          	cmp    $0x9,%ax
80101b48:	77 2e                	ja     80101b78 <writei+0x118>
80101b4a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b51:	85 c0                	test   %eax,%eax
80101b53:	74 23                	je     80101b78 <writei+0x118>
    return devsw[ip->major].write(ip, src, n);
80101b55:	89 4d 10             	mov    %ecx,0x10(%ebp)
}
80101b58:	83 c4 2c             	add    $0x2c,%esp
80101b5b:	5b                   	pop    %ebx
80101b5c:	5e                   	pop    %esi
80101b5d:	5f                   	pop    %edi
80101b5e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101b5f:	ff e0                	jmp    *%eax
80101b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101b68:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b6b:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b6e:	89 04 24             	mov    %eax,(%esp)
80101b71:	e8 7a fa ff ff       	call   801015f0 <iupdate>
80101b76:	eb b7                	jmp    80101b2f <writei+0xcf>
}
80101b78:	83 c4 2c             	add    $0x2c,%esp
      return -1;
80101b7b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80101b80:	5b                   	pop    %ebx
80101b81:	5e                   	pop    %esi
80101b82:	5f                   	pop    %edi
80101b83:	5d                   	pop    %ebp
80101b84:	c3                   	ret    
80101b85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b90 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b90:	55                   	push   %ebp
80101b91:	89 e5                	mov    %esp,%ebp
80101b93:	83 ec 18             	sub    $0x18,%esp
  return strncmp(s, t, DIRSIZ);
80101b96:	8b 45 0c             	mov    0xc(%ebp),%eax
80101b99:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101ba0:	00 
80101ba1:	89 44 24 04          	mov    %eax,0x4(%esp)
80101ba5:	8b 45 08             	mov    0x8(%ebp),%eax
80101ba8:	89 04 24             	mov    %eax,(%esp)
80101bab:	e8 f0 27 00 00       	call   801043a0 <strncmp>
}
80101bb0:	c9                   	leave  
80101bb1:	c3                   	ret    
80101bb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bc0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	57                   	push   %edi
80101bc4:	56                   	push   %esi
80101bc5:	53                   	push   %ebx
80101bc6:	83 ec 2c             	sub    $0x2c,%esp
80101bc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bcc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bd1:	0f 85 97 00 00 00    	jne    80101c6e <dirlookup+0xae>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bd7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bda:	31 ff                	xor    %edi,%edi
80101bdc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bdf:	85 d2                	test   %edx,%edx
80101be1:	75 0d                	jne    80101bf0 <dirlookup+0x30>
80101be3:	eb 73                	jmp    80101c58 <dirlookup+0x98>
80101be5:	8d 76 00             	lea    0x0(%esi),%esi
80101be8:	83 c7 10             	add    $0x10,%edi
80101beb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bee:	76 68                	jbe    80101c58 <dirlookup+0x98>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bf0:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101bf7:	00 
80101bf8:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101bfc:	89 74 24 04          	mov    %esi,0x4(%esp)
80101c00:	89 1c 24             	mov    %ebx,(%esp)
80101c03:	e8 58 fd ff ff       	call   80101960 <readi>
80101c08:	83 f8 10             	cmp    $0x10,%eax
80101c0b:	75 55                	jne    80101c62 <dirlookup+0xa2>
      panic("dirlookup read");
    if(de.inum == 0)
80101c0d:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c12:	74 d4                	je     80101be8 <dirlookup+0x28>
  return strncmp(s, t, DIRSIZ);
80101c14:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c17:	89 44 24 04          	mov    %eax,0x4(%esp)
80101c1b:	8b 45 0c             	mov    0xc(%ebp),%eax
80101c1e:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101c25:	00 
80101c26:	89 04 24             	mov    %eax,(%esp)
80101c29:	e8 72 27 00 00       	call   801043a0 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101c2e:	85 c0                	test   %eax,%eax
80101c30:	75 b6                	jne    80101be8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c32:	8b 45 10             	mov    0x10(%ebp),%eax
80101c35:	85 c0                	test   %eax,%eax
80101c37:	74 05                	je     80101c3e <dirlookup+0x7e>
        *poff = off;
80101c39:	8b 45 10             	mov    0x10(%ebp),%eax
80101c3c:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c3e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c42:	8b 03                	mov    (%ebx),%eax
80101c44:	e8 c7 f5 ff ff       	call   80101210 <iget>
    }
  }

  return 0;
}
80101c49:	83 c4 2c             	add    $0x2c,%esp
80101c4c:	5b                   	pop    %ebx
80101c4d:	5e                   	pop    %esi
80101c4e:	5f                   	pop    %edi
80101c4f:	5d                   	pop    %ebp
80101c50:	c3                   	ret    
80101c51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c58:	83 c4 2c             	add    $0x2c,%esp
  return 0;
80101c5b:	31 c0                	xor    %eax,%eax
}
80101c5d:	5b                   	pop    %ebx
80101c5e:	5e                   	pop    %esi
80101c5f:	5f                   	pop    %edi
80101c60:	5d                   	pop    %ebp
80101c61:	c3                   	ret    
      panic("dirlookup read");
80101c62:	c7 04 24 79 6f 10 80 	movl   $0x80106f79,(%esp)
80101c69:	e8 f2 e6 ff ff       	call   80100360 <panic>
    panic("dirlookup not DIR");
80101c6e:	c7 04 24 67 6f 10 80 	movl   $0x80106f67,(%esp)
80101c75:	e8 e6 e6 ff ff       	call   80100360 <panic>
80101c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101c80 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c80:	55                   	push   %ebp
80101c81:	89 e5                	mov    %esp,%ebp
80101c83:	57                   	push   %edi
80101c84:	89 cf                	mov    %ecx,%edi
80101c86:	56                   	push   %esi
80101c87:	53                   	push   %ebx
80101c88:	89 c3                	mov    %eax,%ebx
80101c8a:	83 ec 2c             	sub    $0x2c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c8d:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101c90:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(*path == '/')
80101c93:	0f 84 51 01 00 00    	je     80101dea <namex+0x16a>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c99:	e8 02 1a 00 00       	call   801036a0 <myproc>
80101c9e:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101ca1:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101ca8:	e8 93 24 00 00       	call   80104140 <acquire>
  ip->ref++;
80101cad:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101cb1:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101cb8:	e8 73 25 00 00       	call   80104230 <release>
80101cbd:	eb 04                	jmp    80101cc3 <namex+0x43>
80101cbf:	90                   	nop
    path++;
80101cc0:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101cc3:	0f b6 03             	movzbl (%ebx),%eax
80101cc6:	3c 2f                	cmp    $0x2f,%al
80101cc8:	74 f6                	je     80101cc0 <namex+0x40>
  if(*path == 0)
80101cca:	84 c0                	test   %al,%al
80101ccc:	0f 84 ed 00 00 00    	je     80101dbf <namex+0x13f>
  while(*path != '/' && *path != 0)
80101cd2:	0f b6 03             	movzbl (%ebx),%eax
80101cd5:	89 da                	mov    %ebx,%edx
80101cd7:	84 c0                	test   %al,%al
80101cd9:	0f 84 b1 00 00 00    	je     80101d90 <namex+0x110>
80101cdf:	3c 2f                	cmp    $0x2f,%al
80101ce1:	75 0f                	jne    80101cf2 <namex+0x72>
80101ce3:	e9 a8 00 00 00       	jmp    80101d90 <namex+0x110>
80101ce8:	3c 2f                	cmp    $0x2f,%al
80101cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101cf0:	74 0a                	je     80101cfc <namex+0x7c>
    path++;
80101cf2:	83 c2 01             	add    $0x1,%edx
  while(*path != '/' && *path != 0)
80101cf5:	0f b6 02             	movzbl (%edx),%eax
80101cf8:	84 c0                	test   %al,%al
80101cfa:	75 ec                	jne    80101ce8 <namex+0x68>
80101cfc:	89 d1                	mov    %edx,%ecx
80101cfe:	29 d9                	sub    %ebx,%ecx
  if(len >= DIRSIZ)
80101d00:	83 f9 0d             	cmp    $0xd,%ecx
80101d03:	0f 8e 8f 00 00 00    	jle    80101d98 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101d09:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101d0d:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101d14:	00 
80101d15:	89 3c 24             	mov    %edi,(%esp)
80101d18:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d1b:	e8 00 26 00 00       	call   80104320 <memmove>
    path++;
80101d20:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d23:	89 d3                	mov    %edx,%ebx
  while(*path == '/')
80101d25:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d28:	75 0e                	jne    80101d38 <namex+0xb8>
80101d2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    path++;
80101d30:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101d33:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d36:	74 f8                	je     80101d30 <namex+0xb0>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d38:	89 34 24             	mov    %esi,(%esp)
80101d3b:	e8 70 f9 ff ff       	call   801016b0 <ilock>
    if(ip->type != T_DIR){
80101d40:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d45:	0f 85 85 00 00 00    	jne    80101dd0 <namex+0x150>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d4b:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d4e:	85 d2                	test   %edx,%edx
80101d50:	74 09                	je     80101d5b <namex+0xdb>
80101d52:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d55:	0f 84 a5 00 00 00    	je     80101e00 <namex+0x180>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d5b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101d62:	00 
80101d63:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101d67:	89 34 24             	mov    %esi,(%esp)
80101d6a:	e8 51 fe ff ff       	call   80101bc0 <dirlookup>
80101d6f:	85 c0                	test   %eax,%eax
80101d71:	74 5d                	je     80101dd0 <namex+0x150>
  iunlock(ip);
80101d73:	89 34 24             	mov    %esi,(%esp)
80101d76:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d79:	e8 12 fa ff ff       	call   80101790 <iunlock>
  iput(ip);
80101d7e:	89 34 24             	mov    %esi,(%esp)
80101d81:	e8 4a fa ff ff       	call   801017d0 <iput>
      iunlockput(ip);
      return 0;
    }
    iunlockput(ip);
    ip = next;
80101d86:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d89:	89 c6                	mov    %eax,%esi
80101d8b:	e9 33 ff ff ff       	jmp    80101cc3 <namex+0x43>
  while(*path != '/' && *path != 0)
80101d90:	31 c9                	xor    %ecx,%ecx
80101d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    memmove(name, s, len);
80101d98:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80101d9c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101da0:	89 3c 24             	mov    %edi,(%esp)
80101da3:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101da6:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101da9:	e8 72 25 00 00       	call   80104320 <memmove>
    name[len] = 0;
80101dae:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101db1:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101db4:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101db8:	89 d3                	mov    %edx,%ebx
80101dba:	e9 66 ff ff ff       	jmp    80101d25 <namex+0xa5>
  }
  if(nameiparent){
80101dbf:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101dc2:	85 c0                	test   %eax,%eax
80101dc4:	75 4c                	jne    80101e12 <namex+0x192>
80101dc6:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101dc8:	83 c4 2c             	add    $0x2c,%esp
80101dcb:	5b                   	pop    %ebx
80101dcc:	5e                   	pop    %esi
80101dcd:	5f                   	pop    %edi
80101dce:	5d                   	pop    %ebp
80101dcf:	c3                   	ret    
  iunlock(ip);
80101dd0:	89 34 24             	mov    %esi,(%esp)
80101dd3:	e8 b8 f9 ff ff       	call   80101790 <iunlock>
  iput(ip);
80101dd8:	89 34 24             	mov    %esi,(%esp)
80101ddb:	e8 f0 f9 ff ff       	call   801017d0 <iput>
}
80101de0:	83 c4 2c             	add    $0x2c,%esp
      return 0;
80101de3:	31 c0                	xor    %eax,%eax
}
80101de5:	5b                   	pop    %ebx
80101de6:	5e                   	pop    %esi
80101de7:	5f                   	pop    %edi
80101de8:	5d                   	pop    %ebp
80101de9:	c3                   	ret    
    ip = iget(ROOTDEV, ROOTINO);
80101dea:	ba 01 00 00 00       	mov    $0x1,%edx
80101def:	b8 01 00 00 00       	mov    $0x1,%eax
80101df4:	e8 17 f4 ff ff       	call   80101210 <iget>
80101df9:	89 c6                	mov    %eax,%esi
80101dfb:	e9 c3 fe ff ff       	jmp    80101cc3 <namex+0x43>
      iunlock(ip);
80101e00:	89 34 24             	mov    %esi,(%esp)
80101e03:	e8 88 f9 ff ff       	call   80101790 <iunlock>
}
80101e08:	83 c4 2c             	add    $0x2c,%esp
      return ip;
80101e0b:	89 f0                	mov    %esi,%eax
}
80101e0d:	5b                   	pop    %ebx
80101e0e:	5e                   	pop    %esi
80101e0f:	5f                   	pop    %edi
80101e10:	5d                   	pop    %ebp
80101e11:	c3                   	ret    
    iput(ip);
80101e12:	89 34 24             	mov    %esi,(%esp)
80101e15:	e8 b6 f9 ff ff       	call   801017d0 <iput>
    return 0;
80101e1a:	31 c0                	xor    %eax,%eax
80101e1c:	eb aa                	jmp    80101dc8 <namex+0x148>
80101e1e:	66 90                	xchg   %ax,%ax

80101e20 <dirlink>:
{
80101e20:	55                   	push   %ebp
80101e21:	89 e5                	mov    %esp,%ebp
80101e23:	57                   	push   %edi
80101e24:	56                   	push   %esi
80101e25:	53                   	push   %ebx
80101e26:	83 ec 2c             	sub    $0x2c,%esp
80101e29:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e2c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e2f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101e36:	00 
80101e37:	89 1c 24             	mov    %ebx,(%esp)
80101e3a:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e3e:	e8 7d fd ff ff       	call   80101bc0 <dirlookup>
80101e43:	85 c0                	test   %eax,%eax
80101e45:	0f 85 8b 00 00 00    	jne    80101ed6 <dirlink+0xb6>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e4b:	8b 43 58             	mov    0x58(%ebx),%eax
80101e4e:	31 ff                	xor    %edi,%edi
80101e50:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e53:	85 c0                	test   %eax,%eax
80101e55:	75 13                	jne    80101e6a <dirlink+0x4a>
80101e57:	eb 35                	jmp    80101e8e <dirlink+0x6e>
80101e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e60:	8d 57 10             	lea    0x10(%edi),%edx
80101e63:	39 53 58             	cmp    %edx,0x58(%ebx)
80101e66:	89 d7                	mov    %edx,%edi
80101e68:	76 24                	jbe    80101e8e <dirlink+0x6e>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e6a:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101e71:	00 
80101e72:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101e76:	89 74 24 04          	mov    %esi,0x4(%esp)
80101e7a:	89 1c 24             	mov    %ebx,(%esp)
80101e7d:	e8 de fa ff ff       	call   80101960 <readi>
80101e82:	83 f8 10             	cmp    $0x10,%eax
80101e85:	75 5e                	jne    80101ee5 <dirlink+0xc5>
    if(de.inum == 0)
80101e87:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e8c:	75 d2                	jne    80101e60 <dirlink+0x40>
  strncpy(de.name, name, DIRSIZ);
80101e8e:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e91:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101e98:	00 
80101e99:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e9d:	8d 45 da             	lea    -0x26(%ebp),%eax
80101ea0:	89 04 24             	mov    %eax,(%esp)
80101ea3:	e8 68 25 00 00       	call   80104410 <strncpy>
  de.inum = inum;
80101ea8:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101eab:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101eb2:	00 
80101eb3:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101eb7:	89 74 24 04          	mov    %esi,0x4(%esp)
80101ebb:	89 1c 24             	mov    %ebx,(%esp)
  de.inum = inum;
80101ebe:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ec2:	e8 99 fb ff ff       	call   80101a60 <writei>
80101ec7:	83 f8 10             	cmp    $0x10,%eax
80101eca:	75 25                	jne    80101ef1 <dirlink+0xd1>
  return 0;
80101ecc:	31 c0                	xor    %eax,%eax
}
80101ece:	83 c4 2c             	add    $0x2c,%esp
80101ed1:	5b                   	pop    %ebx
80101ed2:	5e                   	pop    %esi
80101ed3:	5f                   	pop    %edi
80101ed4:	5d                   	pop    %ebp
80101ed5:	c3                   	ret    
    iput(ip);
80101ed6:	89 04 24             	mov    %eax,(%esp)
80101ed9:	e8 f2 f8 ff ff       	call   801017d0 <iput>
    return -1;
80101ede:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ee3:	eb e9                	jmp    80101ece <dirlink+0xae>
      panic("dirlink read");
80101ee5:	c7 04 24 88 6f 10 80 	movl   $0x80106f88,(%esp)
80101eec:	e8 6f e4 ff ff       	call   80100360 <panic>
    panic("dirlink");
80101ef1:	c7 04 24 86 75 10 80 	movl   $0x80107586,(%esp)
80101ef8:	e8 63 e4 ff ff       	call   80100360 <panic>
80101efd:	8d 76 00             	lea    0x0(%esi),%esi

80101f00 <namei>:

struct inode*
namei(char *path)
{
80101f00:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101f01:	31 d2                	xor    %edx,%edx
{
80101f03:	89 e5                	mov    %esp,%ebp
80101f05:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80101f08:	8b 45 08             	mov    0x8(%ebp),%eax
80101f0b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101f0e:	e8 6d fd ff ff       	call   80101c80 <namex>
}
80101f13:	c9                   	leave  
80101f14:	c3                   	ret    
80101f15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f20 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f20:	55                   	push   %ebp
  return namex(path, 1, name);
80101f21:	ba 01 00 00 00       	mov    $0x1,%edx
{
80101f26:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f28:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f2b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f2e:	5d                   	pop    %ebp
  return namex(path, 1, name);
80101f2f:	e9 4c fd ff ff       	jmp    80101c80 <namex>
80101f34:	66 90                	xchg   %ax,%ax
80101f36:	66 90                	xchg   %ax,%ax
80101f38:	66 90                	xchg   %ax,%ax
80101f3a:	66 90                	xchg   %ax,%ax
80101f3c:	66 90                	xchg   %ax,%ax
80101f3e:	66 90                	xchg   %ax,%ax

80101f40 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f40:	55                   	push   %ebp
80101f41:	89 e5                	mov    %esp,%ebp
80101f43:	56                   	push   %esi
80101f44:	89 c6                	mov    %eax,%esi
80101f46:	53                   	push   %ebx
80101f47:	83 ec 10             	sub    $0x10,%esp
  if(b == 0)
80101f4a:	85 c0                	test   %eax,%eax
80101f4c:	0f 84 99 00 00 00    	je     80101feb <idestart+0xab>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f52:	8b 48 08             	mov    0x8(%eax),%ecx
80101f55:	81 f9 e7 03 00 00    	cmp    $0x3e7,%ecx
80101f5b:	0f 87 7e 00 00 00    	ja     80101fdf <idestart+0x9f>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f61:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f66:	66 90                	xchg   %ax,%ax
80101f68:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f69:	83 e0 c0             	and    $0xffffffc0,%eax
80101f6c:	3c 40                	cmp    $0x40,%al
80101f6e:	75 f8                	jne    80101f68 <idestart+0x28>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f70:	31 db                	xor    %ebx,%ebx
80101f72:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f77:	89 d8                	mov    %ebx,%eax
80101f79:	ee                   	out    %al,(%dx)
80101f7a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f7f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f84:	ee                   	out    %al,(%dx)
80101f85:	0f b6 c1             	movzbl %cl,%eax
80101f88:	b2 f3                	mov    $0xf3,%dl
80101f8a:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f8b:	89 c8                	mov    %ecx,%eax
80101f8d:	b2 f4                	mov    $0xf4,%dl
80101f8f:	c1 f8 08             	sar    $0x8,%eax
80101f92:	ee                   	out    %al,(%dx)
80101f93:	b2 f5                	mov    $0xf5,%dl
80101f95:	89 d8                	mov    %ebx,%eax
80101f97:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f98:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101f9c:	b2 f6                	mov    $0xf6,%dl
80101f9e:	83 e0 01             	and    $0x1,%eax
80101fa1:	c1 e0 04             	shl    $0x4,%eax
80101fa4:	83 c8 e0             	or     $0xffffffe0,%eax
80101fa7:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101fa8:	f6 06 04             	testb  $0x4,(%esi)
80101fab:	75 13                	jne    80101fc0 <idestart+0x80>
80101fad:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fb2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fb7:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fb8:	83 c4 10             	add    $0x10,%esp
80101fbb:	5b                   	pop    %ebx
80101fbc:	5e                   	pop    %esi
80101fbd:	5d                   	pop    %ebp
80101fbe:	c3                   	ret    
80101fbf:	90                   	nop
80101fc0:	b2 f7                	mov    $0xf7,%dl
80101fc2:	b8 30 00 00 00       	mov    $0x30,%eax
80101fc7:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80101fc8:	b9 80 00 00 00       	mov    $0x80,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
80101fcd:	83 c6 5c             	add    $0x5c,%esi
80101fd0:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fd5:	fc                   	cld    
80101fd6:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80101fd8:	83 c4 10             	add    $0x10,%esp
80101fdb:	5b                   	pop    %ebx
80101fdc:	5e                   	pop    %esi
80101fdd:	5d                   	pop    %ebp
80101fde:	c3                   	ret    
    panic("incorrect blockno");
80101fdf:	c7 04 24 f4 6f 10 80 	movl   $0x80106ff4,(%esp)
80101fe6:	e8 75 e3 ff ff       	call   80100360 <panic>
    panic("idestart");
80101feb:	c7 04 24 eb 6f 10 80 	movl   $0x80106feb,(%esp)
80101ff2:	e8 69 e3 ff ff       	call   80100360 <panic>
80101ff7:	89 f6                	mov    %esi,%esi
80101ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102000 <ideinit>:
{
80102000:	55                   	push   %ebp
80102001:	89 e5                	mov    %esp,%ebp
80102003:	83 ec 18             	sub    $0x18,%esp
  initlock(&idelock, "ide");
80102006:	c7 44 24 04 06 70 10 	movl   $0x80107006,0x4(%esp)
8010200d:	80 
8010200e:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102015:	e8 36 20 00 00       	call   80104050 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
8010201a:	a1 00 2d 11 80       	mov    0x80112d00,%eax
8010201f:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102026:	83 e8 01             	sub    $0x1,%eax
80102029:	89 44 24 04          	mov    %eax,0x4(%esp)
8010202d:	e8 7e 02 00 00       	call   801022b0 <ioapicenable>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102032:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102037:	90                   	nop
80102038:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102039:	83 e0 c0             	and    $0xffffffc0,%eax
8010203c:	3c 40                	cmp    $0x40,%al
8010203e:	75 f8                	jne    80102038 <ideinit+0x38>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102040:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102045:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010204a:	ee                   	out    %al,(%dx)
8010204b:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102050:	b2 f7                	mov    $0xf7,%dl
80102052:	eb 09                	jmp    8010205d <ideinit+0x5d>
80102054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i=0; i<1000; i++){
80102058:	83 e9 01             	sub    $0x1,%ecx
8010205b:	74 0f                	je     8010206c <ideinit+0x6c>
8010205d:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
8010205e:	84 c0                	test   %al,%al
80102060:	74 f6                	je     80102058 <ideinit+0x58>
      havedisk1 = 1;
80102062:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102069:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010206c:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102071:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102076:	ee                   	out    %al,(%dx)
}
80102077:	c9                   	leave  
80102078:	c3                   	ret    
80102079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102080 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
80102080:	55                   	push   %ebp
80102081:	89 e5                	mov    %esp,%ebp
80102083:	57                   	push   %edi
80102084:	56                   	push   %esi
80102085:	53                   	push   %ebx
80102086:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102089:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102090:	e8 ab 20 00 00       	call   80104140 <acquire>

  if((b = idequeue) == 0){
80102095:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
8010209b:	85 db                	test   %ebx,%ebx
8010209d:	74 30                	je     801020cf <ideintr+0x4f>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
8010209f:	8b 43 58             	mov    0x58(%ebx),%eax
801020a2:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801020a7:	8b 33                	mov    (%ebx),%esi
801020a9:	f7 c6 04 00 00 00    	test   $0x4,%esi
801020af:	74 37                	je     801020e8 <ideintr+0x68>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020b1:	83 e6 fb             	and    $0xfffffffb,%esi
801020b4:	83 ce 02             	or     $0x2,%esi
801020b7:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801020b9:	89 1c 24             	mov    %ebx,(%esp)
801020bc:	e8 cf 1c 00 00       	call   80103d90 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
801020c1:	a1 64 a5 10 80       	mov    0x8010a564,%eax
801020c6:	85 c0                	test   %eax,%eax
801020c8:	74 05                	je     801020cf <ideintr+0x4f>
    idestart(idequeue);
801020ca:	e8 71 fe ff ff       	call   80101f40 <idestart>
    release(&idelock);
801020cf:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
801020d6:	e8 55 21 00 00       	call   80104230 <release>

  release(&idelock);
}
801020db:	83 c4 1c             	add    $0x1c,%esp
801020de:	5b                   	pop    %ebx
801020df:	5e                   	pop    %esi
801020e0:	5f                   	pop    %edi
801020e1:	5d                   	pop    %ebp
801020e2:	c3                   	ret    
801020e3:	90                   	nop
801020e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020e8:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020ed:	8d 76 00             	lea    0x0(%esi),%esi
801020f0:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020f1:	89 c1                	mov    %eax,%ecx
801020f3:	83 e1 c0             	and    $0xffffffc0,%ecx
801020f6:	80 f9 40             	cmp    $0x40,%cl
801020f9:	75 f5                	jne    801020f0 <ideintr+0x70>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020fb:	a8 21                	test   $0x21,%al
801020fd:	75 b2                	jne    801020b1 <ideintr+0x31>
    insl(0x1f0, b->data, BSIZE/4);
801020ff:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
80102102:	b9 80 00 00 00       	mov    $0x80,%ecx
80102107:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010210c:	fc                   	cld    
8010210d:	f3 6d                	rep insl (%dx),%es:(%edi)
8010210f:	8b 33                	mov    (%ebx),%esi
80102111:	eb 9e                	jmp    801020b1 <ideintr+0x31>
80102113:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102120 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102120:	55                   	push   %ebp
80102121:	89 e5                	mov    %esp,%ebp
80102123:	53                   	push   %ebx
80102124:	83 ec 14             	sub    $0x14,%esp
80102127:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010212a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010212d:	89 04 24             	mov    %eax,(%esp)
80102130:	e8 eb 1e 00 00       	call   80104020 <holdingsleep>
80102135:	85 c0                	test   %eax,%eax
80102137:	0f 84 9e 00 00 00    	je     801021db <iderw+0xbb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010213d:	8b 03                	mov    (%ebx),%eax
8010213f:	83 e0 06             	and    $0x6,%eax
80102142:	83 f8 02             	cmp    $0x2,%eax
80102145:	0f 84 a8 00 00 00    	je     801021f3 <iderw+0xd3>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010214b:	8b 53 04             	mov    0x4(%ebx),%edx
8010214e:	85 d2                	test   %edx,%edx
80102150:	74 0d                	je     8010215f <iderw+0x3f>
80102152:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102157:	85 c0                	test   %eax,%eax
80102159:	0f 84 88 00 00 00    	je     801021e7 <iderw+0xc7>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
8010215f:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
80102166:	e8 d5 1f 00 00       	call   80104140 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010216b:	a1 64 a5 10 80       	mov    0x8010a564,%eax
  b->qnext = 0;
80102170:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102177:	85 c0                	test   %eax,%eax
80102179:	75 07                	jne    80102182 <iderw+0x62>
8010217b:	eb 4e                	jmp    801021cb <iderw+0xab>
8010217d:	8d 76 00             	lea    0x0(%esi),%esi
80102180:	89 d0                	mov    %edx,%eax
80102182:	8b 50 58             	mov    0x58(%eax),%edx
80102185:	85 d2                	test   %edx,%edx
80102187:	75 f7                	jne    80102180 <iderw+0x60>
80102189:	83 c0 58             	add    $0x58,%eax
    ;
  *pp = b;
8010218c:	89 18                	mov    %ebx,(%eax)

  // Start disk if necessary.
  if(idequeue == b)
8010218e:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
80102194:	74 3c                	je     801021d2 <iderw+0xb2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102196:	8b 03                	mov    (%ebx),%eax
80102198:	83 e0 06             	and    $0x6,%eax
8010219b:	83 f8 02             	cmp    $0x2,%eax
8010219e:	74 1a                	je     801021ba <iderw+0x9a>
    sleep(b, &idelock);
801021a0:	c7 44 24 04 80 a5 10 	movl   $0x8010a580,0x4(%esp)
801021a7:	80 
801021a8:	89 1c 24             	mov    %ebx,(%esp)
801021ab:	e8 50 1a 00 00       	call   80103c00 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021b0:	8b 13                	mov    (%ebx),%edx
801021b2:	83 e2 06             	and    $0x6,%edx
801021b5:	83 fa 02             	cmp    $0x2,%edx
801021b8:	75 e6                	jne    801021a0 <iderw+0x80>
  }


  release(&idelock);
801021ba:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801021c1:	83 c4 14             	add    $0x14,%esp
801021c4:	5b                   	pop    %ebx
801021c5:	5d                   	pop    %ebp
  release(&idelock);
801021c6:	e9 65 20 00 00       	jmp    80104230 <release>
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021cb:	b8 64 a5 10 80       	mov    $0x8010a564,%eax
801021d0:	eb ba                	jmp    8010218c <iderw+0x6c>
    idestart(b);
801021d2:	89 d8                	mov    %ebx,%eax
801021d4:	e8 67 fd ff ff       	call   80101f40 <idestart>
801021d9:	eb bb                	jmp    80102196 <iderw+0x76>
    panic("iderw: buf not locked");
801021db:	c7 04 24 0a 70 10 80 	movl   $0x8010700a,(%esp)
801021e2:	e8 79 e1 ff ff       	call   80100360 <panic>
    panic("iderw: ide disk 1 not present");
801021e7:	c7 04 24 35 70 10 80 	movl   $0x80107035,(%esp)
801021ee:	e8 6d e1 ff ff       	call   80100360 <panic>
    panic("iderw: nothing to do");
801021f3:	c7 04 24 20 70 10 80 	movl   $0x80107020,(%esp)
801021fa:	e8 61 e1 ff ff       	call   80100360 <panic>
801021ff:	90                   	nop

80102200 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102200:	55                   	push   %ebp
80102201:	89 e5                	mov    %esp,%ebp
80102203:	56                   	push   %esi
80102204:	53                   	push   %ebx
80102205:	83 ec 10             	sub    $0x10,%esp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102208:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
8010220f:	00 c0 fe 
  ioapic->reg = reg;
80102212:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102219:	00 00 00 
  return ioapic->data;
8010221c:	8b 15 34 26 11 80    	mov    0x80112634,%edx
80102222:	8b 42 10             	mov    0x10(%edx),%eax
  ioapic->reg = reg;
80102225:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
8010222b:	8b 1d 34 26 11 80    	mov    0x80112634,%ebx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
80102231:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102238:	c1 e8 10             	shr    $0x10,%eax
8010223b:	0f b6 f0             	movzbl %al,%esi
  return ioapic->data;
8010223e:	8b 43 10             	mov    0x10(%ebx),%eax
  id = ioapicread(REG_ID) >> 24;
80102241:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102244:	39 c2                	cmp    %eax,%edx
80102246:	74 12                	je     8010225a <ioapicinit+0x5a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102248:	c7 04 24 54 70 10 80 	movl   $0x80107054,(%esp)
8010224f:	e8 fc e3 ff ff       	call   80100650 <cprintf>
80102254:	8b 1d 34 26 11 80    	mov    0x80112634,%ebx
8010225a:	ba 10 00 00 00       	mov    $0x10,%edx
8010225f:	31 c0                	xor    %eax,%eax
80102261:	eb 07                	jmp    8010226a <ioapicinit+0x6a>
80102263:	90                   	nop
80102264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102268:	89 cb                	mov    %ecx,%ebx
  ioapic->reg = reg;
8010226a:	89 13                	mov    %edx,(%ebx)
  ioapic->data = data;
8010226c:	8b 1d 34 26 11 80    	mov    0x80112634,%ebx
80102272:	8d 48 20             	lea    0x20(%eax),%ecx

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102275:	81 c9 00 00 01 00    	or     $0x10000,%ecx
  for(i = 0; i <= maxintr; i++){
8010227b:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
8010227e:	89 4b 10             	mov    %ecx,0x10(%ebx)
80102281:	8d 4a 01             	lea    0x1(%edx),%ecx
80102284:	83 c2 02             	add    $0x2,%edx
  ioapic->reg = reg;
80102287:	89 0b                	mov    %ecx,(%ebx)
  ioapic->data = data;
80102289:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
  for(i = 0; i <= maxintr; i++){
8010228f:	39 c6                	cmp    %eax,%esi
  ioapic->data = data;
80102291:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  for(i = 0; i <= maxintr; i++){
80102298:	7d ce                	jge    80102268 <ioapicinit+0x68>
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010229a:	83 c4 10             	add    $0x10,%esp
8010229d:	5b                   	pop    %ebx
8010229e:	5e                   	pop    %esi
8010229f:	5d                   	pop    %ebp
801022a0:	c3                   	ret    
801022a1:	eb 0d                	jmp    801022b0 <ioapicenable>
801022a3:	90                   	nop
801022a4:	90                   	nop
801022a5:	90                   	nop
801022a6:	90                   	nop
801022a7:	90                   	nop
801022a8:	90                   	nop
801022a9:	90                   	nop
801022aa:	90                   	nop
801022ab:	90                   	nop
801022ac:	90                   	nop
801022ad:	90                   	nop
801022ae:	90                   	nop
801022af:	90                   	nop

801022b0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
801022b0:	55                   	push   %ebp
801022b1:	89 e5                	mov    %esp,%ebp
801022b3:	8b 55 08             	mov    0x8(%ebp),%edx
801022b6:	53                   	push   %ebx
801022b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022ba:	8d 5a 20             	lea    0x20(%edx),%ebx
801022bd:	8d 4c 12 10          	lea    0x10(%edx,%edx,1),%ecx
  ioapic->reg = reg;
801022c1:	8b 15 34 26 11 80    	mov    0x80112634,%edx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022c7:	c1 e0 18             	shl    $0x18,%eax
  ioapic->reg = reg;
801022ca:	89 0a                	mov    %ecx,(%edx)
  ioapic->data = data;
801022cc:	8b 15 34 26 11 80    	mov    0x80112634,%edx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022d2:	83 c1 01             	add    $0x1,%ecx
  ioapic->data = data;
801022d5:	89 5a 10             	mov    %ebx,0x10(%edx)
  ioapic->reg = reg;
801022d8:	89 0a                	mov    %ecx,(%edx)
  ioapic->data = data;
801022da:	8b 15 34 26 11 80    	mov    0x80112634,%edx
801022e0:	89 42 10             	mov    %eax,0x10(%edx)
}
801022e3:	5b                   	pop    %ebx
801022e4:	5d                   	pop    %ebp
801022e5:	c3                   	ret    
801022e6:	66 90                	xchg   %ax,%ax
801022e8:	66 90                	xchg   %ax,%ax
801022ea:	66 90                	xchg   %ax,%ax
801022ec:	66 90                	xchg   %ax,%ax
801022ee:	66 90                	xchg   %ax,%ax

801022f0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801022f0:	55                   	push   %ebp
801022f1:	89 e5                	mov    %esp,%ebp
801022f3:	53                   	push   %ebx
801022f4:	83 ec 14             	sub    $0x14,%esp
801022f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801022fa:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102300:	75 7c                	jne    8010237e <kfree+0x8e>
80102302:	81 fb 14 59 11 80    	cmp    $0x80115914,%ebx
80102308:	72 74                	jb     8010237e <kfree+0x8e>
8010230a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102310:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102315:	77 67                	ja     8010237e <kfree+0x8e>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102317:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010231e:	00 
8010231f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102326:	00 
80102327:	89 1c 24             	mov    %ebx,(%esp)
8010232a:	e8 51 1f 00 00       	call   80104280 <memset>

  if(kmem.use_lock)
8010232f:	8b 15 74 26 11 80    	mov    0x80112674,%edx
80102335:	85 d2                	test   %edx,%edx
80102337:	75 37                	jne    80102370 <kfree+0x80>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102339:	a1 78 26 11 80       	mov    0x80112678,%eax
8010233e:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
80102340:	a1 74 26 11 80       	mov    0x80112674,%eax
  kmem.freelist = r;
80102345:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
  if(kmem.use_lock)
8010234b:	85 c0                	test   %eax,%eax
8010234d:	75 09                	jne    80102358 <kfree+0x68>
    release(&kmem.lock);
}
8010234f:	83 c4 14             	add    $0x14,%esp
80102352:	5b                   	pop    %ebx
80102353:	5d                   	pop    %ebp
80102354:	c3                   	ret    
80102355:	8d 76 00             	lea    0x0(%esi),%esi
    release(&kmem.lock);
80102358:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
}
8010235f:	83 c4 14             	add    $0x14,%esp
80102362:	5b                   	pop    %ebx
80102363:	5d                   	pop    %ebp
    release(&kmem.lock);
80102364:	e9 c7 1e 00 00       	jmp    80104230 <release>
80102369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&kmem.lock);
80102370:	c7 04 24 40 26 11 80 	movl   $0x80112640,(%esp)
80102377:	e8 c4 1d 00 00       	call   80104140 <acquire>
8010237c:	eb bb                	jmp    80102339 <kfree+0x49>
    panic("kfree");
8010237e:	c7 04 24 86 70 10 80 	movl   $0x80107086,(%esp)
80102385:	e8 d6 df ff ff       	call   80100360 <panic>
8010238a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102390 <freerange>:
{
80102390:	55                   	push   %ebp
80102391:	89 e5                	mov    %esp,%ebp
80102393:	56                   	push   %esi
80102394:	53                   	push   %ebx
80102395:	83 ec 10             	sub    $0x10,%esp
  p = (char*)PGROUNDUP((uint)vstart);
80102398:	8b 45 08             	mov    0x8(%ebp),%eax
{
8010239b:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
8010239e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
801023a4:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023aa:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
801023b0:	39 de                	cmp    %ebx,%esi
801023b2:	73 08                	jae    801023bc <freerange+0x2c>
801023b4:	eb 18                	jmp    801023ce <freerange+0x3e>
801023b6:	66 90                	xchg   %ax,%ax
801023b8:	89 da                	mov    %ebx,%edx
801023ba:	89 c3                	mov    %eax,%ebx
    kfree(p);
801023bc:	89 14 24             	mov    %edx,(%esp)
801023bf:	e8 2c ff ff ff       	call   801022f0 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023c4:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
801023ca:	39 f0                	cmp    %esi,%eax
801023cc:	76 ea                	jbe    801023b8 <freerange+0x28>
}
801023ce:	83 c4 10             	add    $0x10,%esp
801023d1:	5b                   	pop    %ebx
801023d2:	5e                   	pop    %esi
801023d3:	5d                   	pop    %ebp
801023d4:	c3                   	ret    
801023d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801023d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801023e0 <kinit1>:
{
801023e0:	55                   	push   %ebp
801023e1:	89 e5                	mov    %esp,%ebp
801023e3:	56                   	push   %esi
801023e4:	53                   	push   %ebx
801023e5:	83 ec 10             	sub    $0x10,%esp
801023e8:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801023eb:	c7 44 24 04 8c 70 10 	movl   $0x8010708c,0x4(%esp)
801023f2:	80 
801023f3:	c7 04 24 40 26 11 80 	movl   $0x80112640,(%esp)
801023fa:	e8 51 1c 00 00       	call   80104050 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
801023ff:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 0;
80102402:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
80102409:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
8010240c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
80102412:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102418:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
8010241e:	39 de                	cmp    %ebx,%esi
80102420:	73 0a                	jae    8010242c <kinit1+0x4c>
80102422:	eb 1a                	jmp    8010243e <kinit1+0x5e>
80102424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102428:	89 da                	mov    %ebx,%edx
8010242a:	89 c3                	mov    %eax,%ebx
    kfree(p);
8010242c:	89 14 24             	mov    %edx,(%esp)
8010242f:	e8 bc fe ff ff       	call   801022f0 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102434:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
8010243a:	39 c6                	cmp    %eax,%esi
8010243c:	73 ea                	jae    80102428 <kinit1+0x48>
}
8010243e:	83 c4 10             	add    $0x10,%esp
80102441:	5b                   	pop    %ebx
80102442:	5e                   	pop    %esi
80102443:	5d                   	pop    %ebp
80102444:	c3                   	ret    
80102445:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102450 <kinit2>:
{
80102450:	55                   	push   %ebp
80102451:	89 e5                	mov    %esp,%ebp
80102453:	56                   	push   %esi
80102454:	53                   	push   %ebx
80102455:	83 ec 10             	sub    $0x10,%esp
  p = (char*)PGROUNDUP((uint)vstart);
80102458:	8b 45 08             	mov    0x8(%ebp),%eax
{
8010245b:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
8010245e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
80102464:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010246a:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
80102470:	39 de                	cmp    %ebx,%esi
80102472:	73 08                	jae    8010247c <kinit2+0x2c>
80102474:	eb 18                	jmp    8010248e <kinit2+0x3e>
80102476:	66 90                	xchg   %ax,%ax
80102478:	89 da                	mov    %ebx,%edx
8010247a:	89 c3                	mov    %eax,%ebx
    kfree(p);
8010247c:	89 14 24             	mov    %edx,(%esp)
8010247f:	e8 6c fe ff ff       	call   801022f0 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102484:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
8010248a:	39 c6                	cmp    %eax,%esi
8010248c:	73 ea                	jae    80102478 <kinit2+0x28>
  kmem.use_lock = 1;
8010248e:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
80102495:	00 00 00 
}
80102498:	83 c4 10             	add    $0x10,%esp
8010249b:	5b                   	pop    %ebx
8010249c:	5e                   	pop    %esi
8010249d:	5d                   	pop    %ebp
8010249e:	c3                   	ret    
8010249f:	90                   	nop

801024a0 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801024a0:	55                   	push   %ebp
801024a1:	89 e5                	mov    %esp,%ebp
801024a3:	53                   	push   %ebx
801024a4:	83 ec 14             	sub    $0x14,%esp
  struct run *r;

  if(kmem.use_lock)
801024a7:	a1 74 26 11 80       	mov    0x80112674,%eax
801024ac:	85 c0                	test   %eax,%eax
801024ae:	75 30                	jne    801024e0 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024b0:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
  if(r)
801024b6:	85 db                	test   %ebx,%ebx
801024b8:	74 08                	je     801024c2 <kalloc+0x22>
    kmem.freelist = r->next;
801024ba:	8b 13                	mov    (%ebx),%edx
801024bc:	89 15 78 26 11 80    	mov    %edx,0x80112678
  if(kmem.use_lock)
801024c2:	85 c0                	test   %eax,%eax
801024c4:	74 0c                	je     801024d2 <kalloc+0x32>
    release(&kmem.lock);
801024c6:	c7 04 24 40 26 11 80 	movl   $0x80112640,(%esp)
801024cd:	e8 5e 1d 00 00       	call   80104230 <release>
  return (char*)r;
}
801024d2:	83 c4 14             	add    $0x14,%esp
801024d5:	89 d8                	mov    %ebx,%eax
801024d7:	5b                   	pop    %ebx
801024d8:	5d                   	pop    %ebp
801024d9:	c3                   	ret    
801024da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    acquire(&kmem.lock);
801024e0:	c7 04 24 40 26 11 80 	movl   $0x80112640,(%esp)
801024e7:	e8 54 1c 00 00       	call   80104140 <acquire>
801024ec:	a1 74 26 11 80       	mov    0x80112674,%eax
801024f1:	eb bd                	jmp    801024b0 <kalloc+0x10>
801024f3:	66 90                	xchg   %ax,%ax
801024f5:	66 90                	xchg   %ax,%ax
801024f7:	66 90                	xchg   %ax,%ax
801024f9:	66 90                	xchg   %ax,%ax
801024fb:	66 90                	xchg   %ax,%ax
801024fd:	66 90                	xchg   %ax,%ax
801024ff:	90                   	nop

80102500 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102500:	ba 64 00 00 00       	mov    $0x64,%edx
80102505:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102506:	a8 01                	test   $0x1,%al
80102508:	0f 84 ba 00 00 00    	je     801025c8 <kbdgetc+0xc8>
8010250e:	b2 60                	mov    $0x60,%dl
80102510:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102511:	0f b6 c8             	movzbl %al,%ecx

  if(data == 0xE0){
80102514:	81 f9 e0 00 00 00    	cmp    $0xe0,%ecx
8010251a:	0f 84 88 00 00 00    	je     801025a8 <kbdgetc+0xa8>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102520:	84 c0                	test   %al,%al
80102522:	79 2c                	jns    80102550 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102524:	8b 15 b4 a5 10 80    	mov    0x8010a5b4,%edx
8010252a:	f6 c2 40             	test   $0x40,%dl
8010252d:	75 05                	jne    80102534 <kbdgetc+0x34>
8010252f:	89 c1                	mov    %eax,%ecx
80102531:	83 e1 7f             	and    $0x7f,%ecx
    shift &= ~(shiftcode[data] | E0ESC);
80102534:	0f b6 81 c0 71 10 80 	movzbl -0x7fef8e40(%ecx),%eax
8010253b:	83 c8 40             	or     $0x40,%eax
8010253e:	0f b6 c0             	movzbl %al,%eax
80102541:	f7 d0                	not    %eax
80102543:	21 d0                	and    %edx,%eax
80102545:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
    return 0;
8010254a:	31 c0                	xor    %eax,%eax
8010254c:	c3                   	ret    
8010254d:	8d 76 00             	lea    0x0(%esi),%esi
{
80102550:	55                   	push   %ebp
80102551:	89 e5                	mov    %esp,%ebp
80102553:	53                   	push   %ebx
80102554:	8b 1d b4 a5 10 80    	mov    0x8010a5b4,%ebx
  } else if(shift & E0ESC){
8010255a:	f6 c3 40             	test   $0x40,%bl
8010255d:	74 09                	je     80102568 <kbdgetc+0x68>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010255f:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102562:	83 e3 bf             	and    $0xffffffbf,%ebx
    data |= 0x80;
80102565:	0f b6 c8             	movzbl %al,%ecx
  }

  shift |= shiftcode[data];
80102568:	0f b6 91 c0 71 10 80 	movzbl -0x7fef8e40(%ecx),%edx
  shift ^= togglecode[data];
8010256f:	0f b6 81 c0 70 10 80 	movzbl -0x7fef8f40(%ecx),%eax
  shift |= shiftcode[data];
80102576:	09 da                	or     %ebx,%edx
  shift ^= togglecode[data];
80102578:	31 c2                	xor    %eax,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
8010257a:	89 d0                	mov    %edx,%eax
8010257c:	83 e0 03             	and    $0x3,%eax
8010257f:	8b 04 85 a0 70 10 80 	mov    -0x7fef8f60(,%eax,4),%eax
  shift ^= togglecode[data];
80102586:	89 15 b4 a5 10 80    	mov    %edx,0x8010a5b4
  if(shift & CAPSLOCK){
8010258c:	83 e2 08             	and    $0x8,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
8010258f:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
  if(shift & CAPSLOCK){
80102593:	74 0b                	je     801025a0 <kbdgetc+0xa0>
    if('a' <= c && c <= 'z')
80102595:	8d 50 9f             	lea    -0x61(%eax),%edx
80102598:	83 fa 19             	cmp    $0x19,%edx
8010259b:	77 1b                	ja     801025b8 <kbdgetc+0xb8>
      c += 'A' - 'a';
8010259d:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025a0:	5b                   	pop    %ebx
801025a1:	5d                   	pop    %ebp
801025a2:	c3                   	ret    
801025a3:	90                   	nop
801025a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    shift |= E0ESC;
801025a8:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
    return 0;
801025af:	31 c0                	xor    %eax,%eax
801025b1:	c3                   	ret    
801025b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    else if('A' <= c && c <= 'Z')
801025b8:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801025bb:	8d 50 20             	lea    0x20(%eax),%edx
801025be:	83 f9 19             	cmp    $0x19,%ecx
801025c1:	0f 46 c2             	cmovbe %edx,%eax
  return c;
801025c4:	eb da                	jmp    801025a0 <kbdgetc+0xa0>
801025c6:	66 90                	xchg   %ax,%ax
    return -1;
801025c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025cd:	c3                   	ret    
801025ce:	66 90                	xchg   %ax,%ax

801025d0 <kbdintr>:

void
kbdintr(void)
{
801025d0:	55                   	push   %ebp
801025d1:	89 e5                	mov    %esp,%ebp
801025d3:	83 ec 18             	sub    $0x18,%esp
  consoleintr(kbdgetc);
801025d6:	c7 04 24 00 25 10 80 	movl   $0x80102500,(%esp)
801025dd:	e8 ce e1 ff ff       	call   801007b0 <consoleintr>
}
801025e2:	c9                   	leave  
801025e3:	c3                   	ret    
801025e4:	66 90                	xchg   %ax,%ax
801025e6:	66 90                	xchg   %ax,%ax
801025e8:	66 90                	xchg   %ax,%ax
801025ea:	66 90                	xchg   %ax,%ax
801025ec:	66 90                	xchg   %ax,%ax
801025ee:	66 90                	xchg   %ax,%ax

801025f0 <fill_rtcdate>:

  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
801025f0:	55                   	push   %ebp
801025f1:	89 c1                	mov    %eax,%ecx
801025f3:	89 e5                	mov    %esp,%ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801025f5:	ba 70 00 00 00       	mov    $0x70,%edx
801025fa:	53                   	push   %ebx
801025fb:	31 c0                	xor    %eax,%eax
801025fd:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801025fe:	bb 71 00 00 00       	mov    $0x71,%ebx
80102603:	89 da                	mov    %ebx,%edx
80102605:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
80102606:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102609:	b2 70                	mov    $0x70,%dl
8010260b:	89 01                	mov    %eax,(%ecx)
8010260d:	b8 02 00 00 00       	mov    $0x2,%eax
80102612:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102613:	89 da                	mov    %ebx,%edx
80102615:	ec                   	in     (%dx),%al
80102616:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102619:	b2 70                	mov    $0x70,%dl
8010261b:	89 41 04             	mov    %eax,0x4(%ecx)
8010261e:	b8 04 00 00 00       	mov    $0x4,%eax
80102623:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102624:	89 da                	mov    %ebx,%edx
80102626:	ec                   	in     (%dx),%al
80102627:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010262a:	b2 70                	mov    $0x70,%dl
8010262c:	89 41 08             	mov    %eax,0x8(%ecx)
8010262f:	b8 07 00 00 00       	mov    $0x7,%eax
80102634:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102635:	89 da                	mov    %ebx,%edx
80102637:	ec                   	in     (%dx),%al
80102638:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010263b:	b2 70                	mov    $0x70,%dl
8010263d:	89 41 0c             	mov    %eax,0xc(%ecx)
80102640:	b8 08 00 00 00       	mov    $0x8,%eax
80102645:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102646:	89 da                	mov    %ebx,%edx
80102648:	ec                   	in     (%dx),%al
80102649:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010264c:	b2 70                	mov    $0x70,%dl
8010264e:	89 41 10             	mov    %eax,0x10(%ecx)
80102651:	b8 09 00 00 00       	mov    $0x9,%eax
80102656:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102657:	89 da                	mov    %ebx,%edx
80102659:	ec                   	in     (%dx),%al
8010265a:	0f b6 d8             	movzbl %al,%ebx
8010265d:	89 59 14             	mov    %ebx,0x14(%ecx)
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
}
80102660:	5b                   	pop    %ebx
80102661:	5d                   	pop    %ebp
80102662:	c3                   	ret    
80102663:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102670 <lapicinit>:
  if(!lapic)
80102670:	a1 7c 26 11 80       	mov    0x8011267c,%eax
{
80102675:	55                   	push   %ebp
80102676:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102678:	85 c0                	test   %eax,%eax
8010267a:	0f 84 c0 00 00 00    	je     80102740 <lapicinit+0xd0>
  lapic[index] = value;
80102680:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102687:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010268a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010268d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102694:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102697:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010269a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801026a1:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801026a4:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026a7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801026ae:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801026b1:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026b4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026bb:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026be:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026c1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801026c8:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026cb:	8b 50 20             	mov    0x20(%eax),%edx
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801026ce:	8b 50 30             	mov    0x30(%eax),%edx
801026d1:	c1 ea 10             	shr    $0x10,%edx
801026d4:	80 fa 03             	cmp    $0x3,%dl
801026d7:	77 6f                	ja     80102748 <lapicinit+0xd8>
  lapic[index] = value;
801026d9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026e0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026e3:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026e6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ed:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026f0:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026f3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026fa:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026fd:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102700:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102707:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010270a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010270d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102714:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102717:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010271a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102721:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102724:	8b 50 20             	mov    0x20(%eax),%edx
80102727:	90                   	nop
  while(lapic[ICRLO] & DELIVS)
80102728:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
8010272e:	80 e6 10             	and    $0x10,%dh
80102731:	75 f5                	jne    80102728 <lapicinit+0xb8>
  lapic[index] = value;
80102733:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
8010273a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010273d:	8b 40 20             	mov    0x20(%eax),%eax
}
80102740:	5d                   	pop    %ebp
80102741:	c3                   	ret    
80102742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  lapic[index] = value;
80102748:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
8010274f:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102752:	8b 50 20             	mov    0x20(%eax),%edx
80102755:	eb 82                	jmp    801026d9 <lapicinit+0x69>
80102757:	89 f6                	mov    %esi,%esi
80102759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102760 <lapicid>:
  if (!lapic)
80102760:	a1 7c 26 11 80       	mov    0x8011267c,%eax
{
80102765:	55                   	push   %ebp
80102766:	89 e5                	mov    %esp,%ebp
  if (!lapic)
80102768:	85 c0                	test   %eax,%eax
8010276a:	74 0c                	je     80102778 <lapicid+0x18>
  return lapic[ID] >> 24;
8010276c:	8b 40 20             	mov    0x20(%eax),%eax
}
8010276f:	5d                   	pop    %ebp
  return lapic[ID] >> 24;
80102770:	c1 e8 18             	shr    $0x18,%eax
}
80102773:	c3                   	ret    
80102774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
80102778:	31 c0                	xor    %eax,%eax
}
8010277a:	5d                   	pop    %ebp
8010277b:	c3                   	ret    
8010277c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102780 <lapiceoi>:
  if(lapic)
80102780:	a1 7c 26 11 80       	mov    0x8011267c,%eax
{
80102785:	55                   	push   %ebp
80102786:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102788:	85 c0                	test   %eax,%eax
8010278a:	74 0d                	je     80102799 <lapiceoi+0x19>
  lapic[index] = value;
8010278c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102793:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102796:	8b 40 20             	mov    0x20(%eax),%eax
}
80102799:	5d                   	pop    %ebp
8010279a:	c3                   	ret    
8010279b:	90                   	nop
8010279c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027a0 <microdelay>:
{
801027a0:	55                   	push   %ebp
801027a1:	89 e5                	mov    %esp,%ebp
}
801027a3:	5d                   	pop    %ebp
801027a4:	c3                   	ret    
801027a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027b0 <lapicstartap>:
{
801027b0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027b1:	ba 70 00 00 00       	mov    $0x70,%edx
801027b6:	89 e5                	mov    %esp,%ebp
801027b8:	b8 0f 00 00 00       	mov    $0xf,%eax
801027bd:	53                   	push   %ebx
801027be:	8b 4d 08             	mov    0x8(%ebp),%ecx
801027c1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801027c4:	ee                   	out    %al,(%dx)
801027c5:	b8 0a 00 00 00       	mov    $0xa,%eax
801027ca:	b2 71                	mov    $0x71,%dl
801027cc:	ee                   	out    %al,(%dx)
  wrv[0] = 0;
801027cd:	31 c0                	xor    %eax,%eax
801027cf:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
801027d5:	89 d8                	mov    %ebx,%eax
801027d7:	c1 e8 04             	shr    $0x4,%eax
801027da:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
801027e0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
  lapicw(ICRHI, apicid<<24);
801027e5:	c1 e1 18             	shl    $0x18,%ecx
    lapicw(ICRLO, STARTUP | (addr>>12));
801027e8:	c1 eb 0c             	shr    $0xc,%ebx
  lapic[index] = value;
801027eb:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027f1:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027f4:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027fb:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027fe:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102801:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102808:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010280b:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010280e:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102814:	8b 50 20             	mov    0x20(%eax),%edx
    lapicw(ICRLO, STARTUP | (addr>>12));
80102817:	89 da                	mov    %ebx,%edx
80102819:	80 ce 06             	or     $0x6,%dh
  lapic[index] = value;
8010281c:	89 90 00 03 00 00    	mov    %edx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102822:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102825:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010282b:	8b 48 20             	mov    0x20(%eax),%ecx
  lapic[index] = value;
8010282e:	89 90 00 03 00 00    	mov    %edx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102834:	8b 40 20             	mov    0x20(%eax),%eax
}
80102837:	5b                   	pop    %ebx
80102838:	5d                   	pop    %ebp
80102839:	c3                   	ret    
8010283a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102840 <cmostime>:

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
80102840:	55                   	push   %ebp
80102841:	ba 70 00 00 00       	mov    $0x70,%edx
80102846:	89 e5                	mov    %esp,%ebp
80102848:	b8 0b 00 00 00       	mov    $0xb,%eax
8010284d:	57                   	push   %edi
8010284e:	56                   	push   %esi
8010284f:	53                   	push   %ebx
80102850:	83 ec 4c             	sub    $0x4c,%esp
80102853:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102854:	b2 71                	mov    $0x71,%dl
80102856:	ec                   	in     (%dx),%al
80102857:	88 45 b7             	mov    %al,-0x49(%ebp)
8010285a:	8d 5d b8             	lea    -0x48(%ebp),%ebx
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);

  bcd = (sb & (1 << 2)) == 0;
8010285d:	80 65 b7 04          	andb   $0x4,-0x49(%ebp)
80102861:	8d 7d d0             	lea    -0x30(%ebp),%edi
80102864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102868:	be 70 00 00 00       	mov    $0x70,%esi

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
8010286d:	89 d8                	mov    %ebx,%eax
8010286f:	e8 7c fd ff ff       	call   801025f0 <fill_rtcdate>
80102874:	b8 0a 00 00 00       	mov    $0xa,%eax
80102879:	89 f2                	mov    %esi,%edx
8010287b:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010287c:	ba 71 00 00 00       	mov    $0x71,%edx
80102881:	ec                   	in     (%dx),%al
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102882:	84 c0                	test   %al,%al
80102884:	78 e7                	js     8010286d <cmostime+0x2d>
        continue;
    fill_rtcdate(&t2);
80102886:	89 f8                	mov    %edi,%eax
80102888:	e8 63 fd ff ff       	call   801025f0 <fill_rtcdate>
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010288d:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
80102894:	00 
80102895:	89 7c 24 04          	mov    %edi,0x4(%esp)
80102899:	89 1c 24             	mov    %ebx,(%esp)
8010289c:	e8 2f 1a 00 00       	call   801042d0 <memcmp>
801028a1:	85 c0                	test   %eax,%eax
801028a3:	75 c3                	jne    80102868 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
801028a5:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028a9:	75 78                	jne    80102923 <cmostime+0xe3>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
801028ab:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028ae:	89 c2                	mov    %eax,%edx
801028b0:	83 e0 0f             	and    $0xf,%eax
801028b3:	c1 ea 04             	shr    $0x4,%edx
801028b6:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028b9:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028bc:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
801028bf:	8b 45 bc             	mov    -0x44(%ebp),%eax
801028c2:	89 c2                	mov    %eax,%edx
801028c4:	83 e0 0f             	and    $0xf,%eax
801028c7:	c1 ea 04             	shr    $0x4,%edx
801028ca:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028cd:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028d0:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
801028d3:	8b 45 c0             	mov    -0x40(%ebp),%eax
801028d6:	89 c2                	mov    %eax,%edx
801028d8:	83 e0 0f             	and    $0xf,%eax
801028db:	c1 ea 04             	shr    $0x4,%edx
801028de:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028e1:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028e4:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
801028e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801028ea:	89 c2                	mov    %eax,%edx
801028ec:	83 e0 0f             	and    $0xf,%eax
801028ef:	c1 ea 04             	shr    $0x4,%edx
801028f2:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028f5:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028f8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
801028fb:	8b 45 c8             	mov    -0x38(%ebp),%eax
801028fe:	89 c2                	mov    %eax,%edx
80102900:	83 e0 0f             	and    $0xf,%eax
80102903:	c1 ea 04             	shr    $0x4,%edx
80102906:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102909:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010290c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
8010290f:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102912:	89 c2                	mov    %eax,%edx
80102914:	83 e0 0f             	and    $0xf,%eax
80102917:	c1 ea 04             	shr    $0x4,%edx
8010291a:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010291d:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102920:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102923:	8b 4d 08             	mov    0x8(%ebp),%ecx
80102926:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102929:	89 01                	mov    %eax,(%ecx)
8010292b:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010292e:	89 41 04             	mov    %eax,0x4(%ecx)
80102931:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102934:	89 41 08             	mov    %eax,0x8(%ecx)
80102937:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010293a:	89 41 0c             	mov    %eax,0xc(%ecx)
8010293d:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102940:	89 41 10             	mov    %eax,0x10(%ecx)
80102943:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102946:	89 41 14             	mov    %eax,0x14(%ecx)
  r->year += 2000;
80102949:	81 41 14 d0 07 00 00 	addl   $0x7d0,0x14(%ecx)
}
80102950:	83 c4 4c             	add    $0x4c,%esp
80102953:	5b                   	pop    %ebx
80102954:	5e                   	pop    %esi
80102955:	5f                   	pop    %edi
80102956:	5d                   	pop    %ebp
80102957:	c3                   	ret    
80102958:	66 90                	xchg   %ax,%ax
8010295a:	66 90                	xchg   %ax,%ax
8010295c:	66 90                	xchg   %ax,%ax
8010295e:	66 90                	xchg   %ax,%ax

80102960 <install_trans>:
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
80102960:	55                   	push   %ebp
80102961:	89 e5                	mov    %esp,%ebp
80102963:	57                   	push   %edi
80102964:	56                   	push   %esi
80102965:	53                   	push   %ebx
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102966:	31 db                	xor    %ebx,%ebx
{
80102968:	83 ec 1c             	sub    $0x1c,%esp
  for (tail = 0; tail < log.lh.n; tail++) {
8010296b:	a1 c8 26 11 80       	mov    0x801126c8,%eax
80102970:	85 c0                	test   %eax,%eax
80102972:	7e 78                	jle    801029ec <install_trans+0x8c>
80102974:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102978:	a1 b4 26 11 80       	mov    0x801126b4,%eax
8010297d:	01 d8                	add    %ebx,%eax
8010297f:	83 c0 01             	add    $0x1,%eax
80102982:	89 44 24 04          	mov    %eax,0x4(%esp)
80102986:	a1 c4 26 11 80       	mov    0x801126c4,%eax
8010298b:	89 04 24             	mov    %eax,(%esp)
8010298e:	e8 3d d7 ff ff       	call   801000d0 <bread>
80102993:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102995:	8b 04 9d cc 26 11 80 	mov    -0x7feed934(,%ebx,4),%eax
  for (tail = 0; tail < log.lh.n; tail++) {
8010299c:	83 c3 01             	add    $0x1,%ebx
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
8010299f:	89 44 24 04          	mov    %eax,0x4(%esp)
801029a3:	a1 c4 26 11 80       	mov    0x801126c4,%eax
801029a8:	89 04 24             	mov    %eax,(%esp)
801029ab:	e8 20 d7 ff ff       	call   801000d0 <bread>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
801029b0:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
801029b7:	00 
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029b8:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
801029ba:	8d 47 5c             	lea    0x5c(%edi),%eax
801029bd:	89 44 24 04          	mov    %eax,0x4(%esp)
801029c1:	8d 46 5c             	lea    0x5c(%esi),%eax
801029c4:	89 04 24             	mov    %eax,(%esp)
801029c7:	e8 54 19 00 00       	call   80104320 <memmove>
    bwrite(dbuf);  // write dst to disk
801029cc:	89 34 24             	mov    %esi,(%esp)
801029cf:	e8 cc d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
801029d4:	89 3c 24             	mov    %edi,(%esp)
801029d7:	e8 04 d8 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
801029dc:	89 34 24             	mov    %esi,(%esp)
801029df:	e8 fc d7 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
801029e4:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
801029ea:	7f 8c                	jg     80102978 <install_trans+0x18>
  }
}
801029ec:	83 c4 1c             	add    $0x1c,%esp
801029ef:	5b                   	pop    %ebx
801029f0:	5e                   	pop    %esi
801029f1:	5f                   	pop    %edi
801029f2:	5d                   	pop    %ebp
801029f3:	c3                   	ret    
801029f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801029fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102a00 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a00:	55                   	push   %ebp
80102a01:	89 e5                	mov    %esp,%ebp
80102a03:	57                   	push   %edi
80102a04:	56                   	push   %esi
80102a05:	53                   	push   %ebx
80102a06:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a09:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102a0e:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a12:	a1 c4 26 11 80       	mov    0x801126c4,%eax
80102a17:	89 04 24             	mov    %eax,(%esp)
80102a1a:	e8 b1 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a1f:	8b 1d c8 26 11 80    	mov    0x801126c8,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102a25:	31 d2                	xor    %edx,%edx
80102a27:	85 db                	test   %ebx,%ebx
  struct buf *buf = bread(log.dev, log.start);
80102a29:	89 c7                	mov    %eax,%edi
  hb->n = log.lh.n;
80102a2b:	89 58 5c             	mov    %ebx,0x5c(%eax)
80102a2e:	8d 70 5c             	lea    0x5c(%eax),%esi
  for (i = 0; i < log.lh.n; i++) {
80102a31:	7e 17                	jle    80102a4a <write_head+0x4a>
80102a33:	90                   	nop
80102a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102a38:	8b 0c 95 cc 26 11 80 	mov    -0x7feed934(,%edx,4),%ecx
80102a3f:	89 4c 96 04          	mov    %ecx,0x4(%esi,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102a43:	83 c2 01             	add    $0x1,%edx
80102a46:	39 da                	cmp    %ebx,%edx
80102a48:	75 ee                	jne    80102a38 <write_head+0x38>
  }
  bwrite(buf);
80102a4a:	89 3c 24             	mov    %edi,(%esp)
80102a4d:	e8 4e d7 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102a52:	89 3c 24             	mov    %edi,(%esp)
80102a55:	e8 86 d7 ff ff       	call   801001e0 <brelse>
}
80102a5a:	83 c4 1c             	add    $0x1c,%esp
80102a5d:	5b                   	pop    %ebx
80102a5e:	5e                   	pop    %esi
80102a5f:	5f                   	pop    %edi
80102a60:	5d                   	pop    %ebp
80102a61:	c3                   	ret    
80102a62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a70 <initlog>:
{
80102a70:	55                   	push   %ebp
80102a71:	89 e5                	mov    %esp,%ebp
80102a73:	56                   	push   %esi
80102a74:	53                   	push   %ebx
80102a75:	83 ec 30             	sub    $0x30,%esp
80102a78:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102a7b:	c7 44 24 04 c0 72 10 	movl   $0x801072c0,0x4(%esp)
80102a82:	80 
80102a83:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102a8a:	e8 c1 15 00 00       	call   80104050 <initlock>
  readsb(dev, &sb);
80102a8f:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102a92:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a96:	89 1c 24             	mov    %ebx,(%esp)
80102a99:	e8 f2 e8 ff ff       	call   80101390 <readsb>
  log.start = sb.logstart;
80102a9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  log.size = sb.nlog;
80102aa1:	8b 55 e8             	mov    -0x18(%ebp),%edx
  struct buf *buf = bread(log.dev, log.start);
80102aa4:	89 1c 24             	mov    %ebx,(%esp)
  log.dev = dev;
80102aa7:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4
  struct buf *buf = bread(log.dev, log.start);
80102aad:	89 44 24 04          	mov    %eax,0x4(%esp)
  log.size = sb.nlog;
80102ab1:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
  log.start = sb.logstart;
80102ab7:	a3 b4 26 11 80       	mov    %eax,0x801126b4
  struct buf *buf = bread(log.dev, log.start);
80102abc:	e8 0f d6 ff ff       	call   801000d0 <bread>
  for (i = 0; i < log.lh.n; i++) {
80102ac1:	31 d2                	xor    %edx,%edx
  log.lh.n = lh->n;
80102ac3:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102ac6:	8d 70 5c             	lea    0x5c(%eax),%esi
  for (i = 0; i < log.lh.n; i++) {
80102ac9:	85 db                	test   %ebx,%ebx
  log.lh.n = lh->n;
80102acb:	89 1d c8 26 11 80    	mov    %ebx,0x801126c8
  for (i = 0; i < log.lh.n; i++) {
80102ad1:	7e 17                	jle    80102aea <initlog+0x7a>
80102ad3:	90                   	nop
80102ad4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    log.lh.block[i] = lh->block[i];
80102ad8:	8b 4c 96 04          	mov    0x4(%esi,%edx,4),%ecx
80102adc:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102ae3:	83 c2 01             	add    $0x1,%edx
80102ae6:	39 da                	cmp    %ebx,%edx
80102ae8:	75 ee                	jne    80102ad8 <initlog+0x68>
  brelse(buf);
80102aea:	89 04 24             	mov    %eax,(%esp)
80102aed:	e8 ee d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102af2:	e8 69 fe ff ff       	call   80102960 <install_trans>
  log.lh.n = 0;
80102af7:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102afe:	00 00 00 
  write_head(); // clear the log
80102b01:	e8 fa fe ff ff       	call   80102a00 <write_head>
}
80102b06:	83 c4 30             	add    $0x30,%esp
80102b09:	5b                   	pop    %ebx
80102b0a:	5e                   	pop    %esi
80102b0b:	5d                   	pop    %ebp
80102b0c:	c3                   	ret    
80102b0d:	8d 76 00             	lea    0x0(%esi),%esi

80102b10 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b10:	55                   	push   %ebp
80102b11:	89 e5                	mov    %esp,%ebp
80102b13:	83 ec 18             	sub    $0x18,%esp
  acquire(&log.lock);
80102b16:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102b1d:	e8 1e 16 00 00       	call   80104140 <acquire>
80102b22:	eb 18                	jmp    80102b3c <begin_op+0x2c>
80102b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102b28:	c7 44 24 04 80 26 11 	movl   $0x80112680,0x4(%esp)
80102b2f:	80 
80102b30:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102b37:	e8 c4 10 00 00       	call   80103c00 <sleep>
    if(log.committing){
80102b3c:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102b41:	85 c0                	test   %eax,%eax
80102b43:	75 e3                	jne    80102b28 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102b45:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102b4a:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102b50:	83 c0 01             	add    $0x1,%eax
80102b53:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b56:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b59:	83 fa 1e             	cmp    $0x1e,%edx
80102b5c:	7f ca                	jg     80102b28 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102b5e:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
      log.outstanding += 1;
80102b65:	a3 bc 26 11 80       	mov    %eax,0x801126bc
      release(&log.lock);
80102b6a:	e8 c1 16 00 00       	call   80104230 <release>
      break;
    }
  }
}
80102b6f:	c9                   	leave  
80102b70:	c3                   	ret    
80102b71:	eb 0d                	jmp    80102b80 <end_op>
80102b73:	90                   	nop
80102b74:	90                   	nop
80102b75:	90                   	nop
80102b76:	90                   	nop
80102b77:	90                   	nop
80102b78:	90                   	nop
80102b79:	90                   	nop
80102b7a:	90                   	nop
80102b7b:	90                   	nop
80102b7c:	90                   	nop
80102b7d:	90                   	nop
80102b7e:	90                   	nop
80102b7f:	90                   	nop

80102b80 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102b80:	55                   	push   %ebp
80102b81:	89 e5                	mov    %esp,%ebp
80102b83:	57                   	push   %edi
80102b84:	56                   	push   %esi
80102b85:	53                   	push   %ebx
80102b86:	83 ec 1c             	sub    $0x1c,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102b89:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102b90:	e8 ab 15 00 00       	call   80104140 <acquire>
  log.outstanding -= 1;
80102b95:	a1 bc 26 11 80       	mov    0x801126bc,%eax
  if(log.committing)
80102b9a:	8b 15 c0 26 11 80    	mov    0x801126c0,%edx
  log.outstanding -= 1;
80102ba0:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102ba3:	85 d2                	test   %edx,%edx
  log.outstanding -= 1;
80102ba5:	a3 bc 26 11 80       	mov    %eax,0x801126bc
  if(log.committing)
80102baa:	0f 85 f3 00 00 00    	jne    80102ca3 <end_op+0x123>
    panic("log.committing");
  if(log.outstanding == 0){
80102bb0:	85 c0                	test   %eax,%eax
80102bb2:	0f 85 cb 00 00 00    	jne    80102c83 <end_op+0x103>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102bb8:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
}

static void
commit()
{
  if (log.lh.n > 0) {
80102bbf:	31 db                	xor    %ebx,%ebx
    log.committing = 1;
80102bc1:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102bc8:	00 00 00 
  release(&log.lock);
80102bcb:	e8 60 16 00 00       	call   80104230 <release>
  if (log.lh.n > 0) {
80102bd0:	a1 c8 26 11 80       	mov    0x801126c8,%eax
80102bd5:	85 c0                	test   %eax,%eax
80102bd7:	0f 8e 90 00 00 00    	jle    80102c6d <end_op+0xed>
80102bdd:	8d 76 00             	lea    0x0(%esi),%esi
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102be0:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102be5:	01 d8                	add    %ebx,%eax
80102be7:	83 c0 01             	add    $0x1,%eax
80102bea:	89 44 24 04          	mov    %eax,0x4(%esp)
80102bee:	a1 c4 26 11 80       	mov    0x801126c4,%eax
80102bf3:	89 04 24             	mov    %eax,(%esp)
80102bf6:	e8 d5 d4 ff ff       	call   801000d0 <bread>
80102bfb:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102bfd:	8b 04 9d cc 26 11 80 	mov    -0x7feed934(,%ebx,4),%eax
  for (tail = 0; tail < log.lh.n; tail++) {
80102c04:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c07:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c0b:	a1 c4 26 11 80       	mov    0x801126c4,%eax
80102c10:	89 04 24             	mov    %eax,(%esp)
80102c13:	e8 b8 d4 ff ff       	call   801000d0 <bread>
    memmove(to->data, from->data, BSIZE);
80102c18:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102c1f:	00 
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c20:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c22:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c25:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c29:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c2c:	89 04 24             	mov    %eax,(%esp)
80102c2f:	e8 ec 16 00 00       	call   80104320 <memmove>
    bwrite(to);  // write the log
80102c34:	89 34 24             	mov    %esi,(%esp)
80102c37:	e8 64 d5 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102c3c:	89 3c 24             	mov    %edi,(%esp)
80102c3f:	e8 9c d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102c44:	89 34 24             	mov    %esi,(%esp)
80102c47:	e8 94 d5 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102c4c:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102c52:	7c 8c                	jl     80102be0 <end_op+0x60>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102c54:	e8 a7 fd ff ff       	call   80102a00 <write_head>
    install_trans(); // Now install writes to home locations
80102c59:	e8 02 fd ff ff       	call   80102960 <install_trans>
    log.lh.n = 0;
80102c5e:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102c65:	00 00 00 
    write_head();    // Erase the transaction from the log
80102c68:	e8 93 fd ff ff       	call   80102a00 <write_head>
    acquire(&log.lock);
80102c6d:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102c74:	e8 c7 14 00 00       	call   80104140 <acquire>
    log.committing = 0;
80102c79:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102c80:	00 00 00 
    wakeup(&log);
80102c83:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102c8a:	e8 01 11 00 00       	call   80103d90 <wakeup>
    release(&log.lock);
80102c8f:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102c96:	e8 95 15 00 00       	call   80104230 <release>
}
80102c9b:	83 c4 1c             	add    $0x1c,%esp
80102c9e:	5b                   	pop    %ebx
80102c9f:	5e                   	pop    %esi
80102ca0:	5f                   	pop    %edi
80102ca1:	5d                   	pop    %ebp
80102ca2:	c3                   	ret    
    panic("log.committing");
80102ca3:	c7 04 24 c4 72 10 80 	movl   $0x801072c4,(%esp)
80102caa:	e8 b1 d6 ff ff       	call   80100360 <panic>
80102caf:	90                   	nop

80102cb0 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102cb0:	55                   	push   %ebp
80102cb1:	89 e5                	mov    %esp,%ebp
80102cb3:	53                   	push   %ebx
80102cb4:	83 ec 14             	sub    $0x14,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102cb7:	a1 c8 26 11 80       	mov    0x801126c8,%eax
{
80102cbc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102cbf:	83 f8 1d             	cmp    $0x1d,%eax
80102cc2:	0f 8f 98 00 00 00    	jg     80102d60 <log_write+0xb0>
80102cc8:	8b 0d b8 26 11 80    	mov    0x801126b8,%ecx
80102cce:	8d 51 ff             	lea    -0x1(%ecx),%edx
80102cd1:	39 d0                	cmp    %edx,%eax
80102cd3:	0f 8d 87 00 00 00    	jge    80102d60 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102cd9:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102cde:	85 c0                	test   %eax,%eax
80102ce0:	0f 8e 86 00 00 00    	jle    80102d6c <log_write+0xbc>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102ce6:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102ced:	e8 4e 14 00 00       	call   80104140 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102cf2:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102cf8:	83 fa 00             	cmp    $0x0,%edx
80102cfb:	7e 54                	jle    80102d51 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102cfd:	8b 4b 08             	mov    0x8(%ebx),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102d00:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d02:	39 0d cc 26 11 80    	cmp    %ecx,0x801126cc
80102d08:	75 0f                	jne    80102d19 <log_write+0x69>
80102d0a:	eb 3c                	jmp    80102d48 <log_write+0x98>
80102d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102d10:	39 0c 85 cc 26 11 80 	cmp    %ecx,-0x7feed934(,%eax,4)
80102d17:	74 2f                	je     80102d48 <log_write+0x98>
  for (i = 0; i < log.lh.n; i++) {
80102d19:	83 c0 01             	add    $0x1,%eax
80102d1c:	39 d0                	cmp    %edx,%eax
80102d1e:	75 f0                	jne    80102d10 <log_write+0x60>
      break;
  }
  log.lh.block[i] = b->blockno;
80102d20:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102d27:	83 c2 01             	add    $0x1,%edx
80102d2a:	89 15 c8 26 11 80    	mov    %edx,0x801126c8
  b->flags |= B_DIRTY; // prevent eviction
80102d30:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102d33:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
}
80102d3a:	83 c4 14             	add    $0x14,%esp
80102d3d:	5b                   	pop    %ebx
80102d3e:	5d                   	pop    %ebp
  release(&log.lock);
80102d3f:	e9 ec 14 00 00       	jmp    80104230 <release>
80102d44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  log.lh.block[i] = b->blockno;
80102d48:	89 0c 85 cc 26 11 80 	mov    %ecx,-0x7feed934(,%eax,4)
80102d4f:	eb df                	jmp    80102d30 <log_write+0x80>
80102d51:	8b 43 08             	mov    0x8(%ebx),%eax
80102d54:	a3 cc 26 11 80       	mov    %eax,0x801126cc
  if (i == log.lh.n)
80102d59:	75 d5                	jne    80102d30 <log_write+0x80>
80102d5b:	eb ca                	jmp    80102d27 <log_write+0x77>
80102d5d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("too big a transaction");
80102d60:	c7 04 24 d3 72 10 80 	movl   $0x801072d3,(%esp)
80102d67:	e8 f4 d5 ff ff       	call   80100360 <panic>
    panic("log_write outside of trans");
80102d6c:	c7 04 24 e9 72 10 80 	movl   $0x801072e9,(%esp)
80102d73:	e8 e8 d5 ff ff       	call   80100360 <panic>
80102d78:	66 90                	xchg   %ax,%ax
80102d7a:	66 90                	xchg   %ax,%ax
80102d7c:	66 90                	xchg   %ax,%ax
80102d7e:	66 90                	xchg   %ax,%ax

80102d80 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102d80:	55                   	push   %ebp
80102d81:	89 e5                	mov    %esp,%ebp
80102d83:	53                   	push   %ebx
80102d84:	83 ec 14             	sub    $0x14,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102d87:	e8 f4 08 00 00       	call   80103680 <cpuid>
80102d8c:	89 c3                	mov    %eax,%ebx
80102d8e:	e8 ed 08 00 00       	call   80103680 <cpuid>
80102d93:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80102d97:	c7 04 24 04 73 10 80 	movl   $0x80107304,(%esp)
80102d9e:	89 44 24 04          	mov    %eax,0x4(%esp)
80102da2:	e8 a9 d8 ff ff       	call   80100650 <cprintf>
  idtinit();       // load idt register
80102da7:	e8 34 27 00 00       	call   801054e0 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102dac:	e8 4f 08 00 00       	call   80103600 <mycpu>
80102db1:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102db3:	b8 01 00 00 00       	mov    $0x1,%eax
80102db8:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102dbf:	e8 9c 0b 00 00       	call   80103960 <scheduler>
80102dc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102dca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102dd0 <mpenter>:
{
80102dd0:	55                   	push   %ebp
80102dd1:	89 e5                	mov    %esp,%ebp
80102dd3:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102dd6:	e8 55 38 00 00       	call   80106630 <switchkvm>
  seginit();
80102ddb:	e8 90 37 00 00       	call   80106570 <seginit>
  lapicinit();
80102de0:	e8 8b f8 ff ff       	call   80102670 <lapicinit>
  mpmain();
80102de5:	e8 96 ff ff ff       	call   80102d80 <mpmain>
80102dea:	66 90                	xchg   %ax,%ax
80102dec:	66 90                	xchg   %ax,%ax
80102dee:	66 90                	xchg   %ax,%ax

80102df0 <main>:
{
80102df0:	55                   	push   %ebp
80102df1:	89 e5                	mov    %esp,%ebp
80102df3:	53                   	push   %ebx
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102df4:	bb 80 27 11 80       	mov    $0x80112780,%ebx
{
80102df9:	83 e4 f0             	and    $0xfffffff0,%esp
80102dfc:	83 ec 10             	sub    $0x10,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102dff:	c7 44 24 04 00 00 40 	movl   $0x80400000,0x4(%esp)
80102e06:	80 
80102e07:	c7 04 24 14 59 11 80 	movl   $0x80115914,(%esp)
80102e0e:	e8 cd f5 ff ff       	call   801023e0 <kinit1>
  kvmalloc();      // kernel page table
80102e13:	e8 c8 3c 00 00       	call   80106ae0 <kvmalloc>
  mpinit();        // detect other processors
80102e18:	e8 73 01 00 00       	call   80102f90 <mpinit>
80102e1d:	8d 76 00             	lea    0x0(%esi),%esi
  lapicinit();     // interrupt controller
80102e20:	e8 4b f8 ff ff       	call   80102670 <lapicinit>
  seginit();       // segment descriptors
80102e25:	e8 46 37 00 00       	call   80106570 <seginit>
  picinit();       // disable pic
80102e2a:	e8 21 03 00 00       	call   80103150 <picinit>
80102e2f:	90                   	nop
  ioapicinit();    // another interrupt controller
80102e30:	e8 cb f3 ff ff       	call   80102200 <ioapicinit>
  consoleinit();   // console hardware
80102e35:	e8 16 db ff ff       	call   80100950 <consoleinit>
  uartinit();      // serial port
80102e3a:	e8 51 2a 00 00       	call   80105890 <uartinit>
80102e3f:	90                   	nop
  pinit();         // process table
80102e40:	e8 9b 07 00 00       	call   801035e0 <pinit>
  shminit();       // shared memory
80102e45:	e8 56 3f 00 00       	call   80106da0 <shminit>
  tvinit();        // trap vectors
80102e4a:	e8 f1 25 00 00       	call   80105440 <tvinit>
80102e4f:	90                   	nop
  binit();         // buffer cache
80102e50:	e8 eb d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102e55:	e8 e6 de ff ff       	call   80100d40 <fileinit>
  ideinit();       // disk 
80102e5a:	e8 a1 f1 ff ff       	call   80102000 <ideinit>
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102e5f:	c7 44 24 08 8a 00 00 	movl   $0x8a,0x8(%esp)
80102e66:	00 
80102e67:	c7 44 24 04 8c a4 10 	movl   $0x8010a48c,0x4(%esp)
80102e6e:	80 
80102e6f:	c7 04 24 00 70 00 80 	movl   $0x80007000,(%esp)
80102e76:	e8 a5 14 00 00       	call   80104320 <memmove>
  for(c = cpus; c < cpus+ncpu; c++){
80102e7b:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102e82:	00 00 00 
80102e85:	05 80 27 11 80       	add    $0x80112780,%eax
80102e8a:	39 d8                	cmp    %ebx,%eax
80102e8c:	76 65                	jbe    80102ef3 <main+0x103>
80102e8e:	66 90                	xchg   %ax,%ax
    if(c == mycpu())  // We've started already.
80102e90:	e8 6b 07 00 00       	call   80103600 <mycpu>
80102e95:	39 d8                	cmp    %ebx,%eax
80102e97:	74 41                	je     80102eda <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102e99:	e8 02 f6 ff ff       	call   801024a0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
80102e9e:	c7 05 f8 6f 00 80 d0 	movl   $0x80102dd0,0x80006ff8
80102ea5:	2d 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102ea8:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102eaf:	90 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
80102eb2:	05 00 10 00 00       	add    $0x1000,%eax
80102eb7:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc

    lapicstartap(c->apicid, V2P(code));
80102ebc:	0f b6 03             	movzbl (%ebx),%eax
80102ebf:	c7 44 24 04 00 70 00 	movl   $0x7000,0x4(%esp)
80102ec6:	00 
80102ec7:	89 04 24             	mov    %eax,(%esp)
80102eca:	e8 e1 f8 ff ff       	call   801027b0 <lapicstartap>
80102ecf:	90                   	nop

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102ed0:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102ed6:	85 c0                	test   %eax,%eax
80102ed8:	74 f6                	je     80102ed0 <main+0xe0>
  for(c = cpus; c < cpus+ncpu; c++){
80102eda:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102ee1:	00 00 00 
80102ee4:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102eea:	05 80 27 11 80       	add    $0x80112780,%eax
80102eef:	39 c3                	cmp    %eax,%ebx
80102ef1:	72 9d                	jb     80102e90 <main+0xa0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102ef3:	c7 44 24 04 00 00 00 	movl   $0x8e000000,0x4(%esp)
80102efa:	8e 
80102efb:	c7 04 24 00 00 40 80 	movl   $0x80400000,(%esp)
80102f02:	e8 49 f5 ff ff       	call   80102450 <kinit2>
  userinit();      // first user process
80102f07:	e8 c4 07 00 00       	call   801036d0 <userinit>
  mpmain();        // finish this processor's setup
80102f0c:	e8 6f fe ff ff       	call   80102d80 <mpmain>
80102f11:	66 90                	xchg   %ax,%ax
80102f13:	66 90                	xchg   %ax,%ax
80102f15:	66 90                	xchg   %ax,%ax
80102f17:	66 90                	xchg   %ax,%ax
80102f19:	66 90                	xchg   %ax,%ax
80102f1b:	66 90                	xchg   %ax,%ax
80102f1d:	66 90                	xchg   %ax,%ax
80102f1f:	90                   	nop

80102f20 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f20:	55                   	push   %ebp
80102f21:	89 e5                	mov    %esp,%ebp
80102f23:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102f24:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
80102f2a:	53                   	push   %ebx
  e = addr+len;
80102f2b:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
80102f2e:	83 ec 10             	sub    $0x10,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80102f31:	39 de                	cmp    %ebx,%esi
80102f33:	73 3c                	jae    80102f71 <mpsearch1+0x51>
80102f35:	8d 76 00             	lea    0x0(%esi),%esi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102f38:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80102f3f:	00 
80102f40:	c7 44 24 04 18 73 10 	movl   $0x80107318,0x4(%esp)
80102f47:	80 
80102f48:	89 34 24             	mov    %esi,(%esp)
80102f4b:	e8 80 13 00 00       	call   801042d0 <memcmp>
80102f50:	85 c0                	test   %eax,%eax
80102f52:	75 16                	jne    80102f6a <mpsearch1+0x4a>
80102f54:	31 c9                	xor    %ecx,%ecx
80102f56:	31 d2                	xor    %edx,%edx
    sum += addr[i];
80102f58:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
  for(i=0; i<len; i++)
80102f5c:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
80102f5f:	01 c1                	add    %eax,%ecx
  for(i=0; i<len; i++)
80102f61:	83 fa 10             	cmp    $0x10,%edx
80102f64:	75 f2                	jne    80102f58 <mpsearch1+0x38>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102f66:	84 c9                	test   %cl,%cl
80102f68:	74 10                	je     80102f7a <mpsearch1+0x5a>
  for(p = addr; p < e; p += sizeof(struct mp))
80102f6a:	83 c6 10             	add    $0x10,%esi
80102f6d:	39 f3                	cmp    %esi,%ebx
80102f6f:	77 c7                	ja     80102f38 <mpsearch1+0x18>
      return (struct mp*)p;
  return 0;
}
80102f71:	83 c4 10             	add    $0x10,%esp
  return 0;
80102f74:	31 c0                	xor    %eax,%eax
}
80102f76:	5b                   	pop    %ebx
80102f77:	5e                   	pop    %esi
80102f78:	5d                   	pop    %ebp
80102f79:	c3                   	ret    
80102f7a:	83 c4 10             	add    $0x10,%esp
80102f7d:	89 f0                	mov    %esi,%eax
80102f7f:	5b                   	pop    %ebx
80102f80:	5e                   	pop    %esi
80102f81:	5d                   	pop    %ebp
80102f82:	c3                   	ret    
80102f83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102f90 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80102f90:	55                   	push   %ebp
80102f91:	89 e5                	mov    %esp,%ebp
80102f93:	57                   	push   %edi
80102f94:	56                   	push   %esi
80102f95:	53                   	push   %ebx
80102f96:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80102f99:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80102fa0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80102fa7:	c1 e0 08             	shl    $0x8,%eax
80102faa:	09 d0                	or     %edx,%eax
80102fac:	c1 e0 04             	shl    $0x4,%eax
80102faf:	85 c0                	test   %eax,%eax
80102fb1:	75 1b                	jne    80102fce <mpinit+0x3e>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80102fb3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80102fba:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80102fc1:	c1 e0 08             	shl    $0x8,%eax
80102fc4:	09 d0                	or     %edx,%eax
80102fc6:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80102fc9:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
80102fce:	ba 00 04 00 00       	mov    $0x400,%edx
80102fd3:	e8 48 ff ff ff       	call   80102f20 <mpsearch1>
80102fd8:	85 c0                	test   %eax,%eax
80102fda:	89 c7                	mov    %eax,%edi
80102fdc:	0f 84 22 01 00 00    	je     80103104 <mpinit+0x174>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80102fe2:	8b 77 04             	mov    0x4(%edi),%esi
80102fe5:	85 f6                	test   %esi,%esi
80102fe7:	0f 84 30 01 00 00    	je     8010311d <mpinit+0x18d>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80102fed:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80102ff3:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80102ffa:	00 
80102ffb:	c7 44 24 04 1d 73 10 	movl   $0x8010731d,0x4(%esp)
80103002:	80 
80103003:	89 04 24             	mov    %eax,(%esp)
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103006:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
80103009:	e8 c2 12 00 00       	call   801042d0 <memcmp>
8010300e:	85 c0                	test   %eax,%eax
80103010:	0f 85 07 01 00 00    	jne    8010311d <mpinit+0x18d>
  if(conf->version != 1 && conf->version != 4)
80103016:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
8010301d:	3c 04                	cmp    $0x4,%al
8010301f:	0f 85 0b 01 00 00    	jne    80103130 <mpinit+0x1a0>
  if(sum((uchar*)conf, conf->length) != 0)
80103025:	0f b7 86 04 00 00 80 	movzwl -0x7ffffffc(%esi),%eax
  for(i=0; i<len; i++)
8010302c:	85 c0                	test   %eax,%eax
8010302e:	74 21                	je     80103051 <mpinit+0xc1>
  sum = 0;
80103030:	31 c9                	xor    %ecx,%ecx
  for(i=0; i<len; i++)
80103032:	31 d2                	xor    %edx,%edx
80103034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
80103038:	0f b6 9c 16 00 00 00 	movzbl -0x80000000(%esi,%edx,1),%ebx
8010303f:	80 
  for(i=0; i<len; i++)
80103040:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
80103043:	01 d9                	add    %ebx,%ecx
  for(i=0; i<len; i++)
80103045:	39 d0                	cmp    %edx,%eax
80103047:	7f ef                	jg     80103038 <mpinit+0xa8>
  if(sum((uchar*)conf, conf->length) != 0)
80103049:	84 c9                	test   %cl,%cl
8010304b:	0f 85 cc 00 00 00    	jne    8010311d <mpinit+0x18d>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
80103051:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103054:	85 c0                	test   %eax,%eax
80103056:	0f 84 c1 00 00 00    	je     8010311d <mpinit+0x18d>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
8010305c:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
  ismp = 1;
80103062:	bb 01 00 00 00       	mov    $0x1,%ebx
  lapic = (uint*)conf->lapicaddr;
80103067:	a3 7c 26 11 80       	mov    %eax,0x8011267c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010306c:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
80103073:	8d 86 2c 00 00 80    	lea    -0x7fffffd4(%esi),%eax
80103079:	03 55 e4             	add    -0x1c(%ebp),%edx
8010307c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103080:	39 c2                	cmp    %eax,%edx
80103082:	76 1b                	jbe    8010309f <mpinit+0x10f>
80103084:	0f b6 08             	movzbl (%eax),%ecx
    switch(*p){
80103087:	80 f9 04             	cmp    $0x4,%cl
8010308a:	77 74                	ja     80103100 <mpinit+0x170>
8010308c:	ff 24 8d 5c 73 10 80 	jmp    *-0x7fef8ca4(,%ecx,4)
80103093:	90                   	nop
80103094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103098:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010309b:	39 c2                	cmp    %eax,%edx
8010309d:	77 e5                	ja     80103084 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
8010309f:	85 db                	test   %ebx,%ebx
801030a1:	0f 84 93 00 00 00    	je     8010313a <mpinit+0x1aa>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
801030a7:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
801030ab:	74 12                	je     801030bf <mpinit+0x12f>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801030ad:	ba 22 00 00 00       	mov    $0x22,%edx
801030b2:	b8 70 00 00 00       	mov    $0x70,%eax
801030b7:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801030b8:	b2 23                	mov    $0x23,%dl
801030ba:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
801030bb:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801030be:	ee                   	out    %al,(%dx)
  }
}
801030bf:	83 c4 1c             	add    $0x1c,%esp
801030c2:	5b                   	pop    %ebx
801030c3:	5e                   	pop    %esi
801030c4:	5f                   	pop    %edi
801030c5:	5d                   	pop    %ebp
801030c6:	c3                   	ret    
801030c7:	90                   	nop
      if(ncpu < NCPU) {
801030c8:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
801030ce:	83 fe 07             	cmp    $0x7,%esi
801030d1:	7f 17                	jg     801030ea <mpinit+0x15a>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801030d3:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
801030d7:	69 f6 b0 00 00 00    	imul   $0xb0,%esi,%esi
        ncpu++;
801030dd:	83 05 00 2d 11 80 01 	addl   $0x1,0x80112d00
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801030e4:	88 8e 80 27 11 80    	mov    %cl,-0x7feed880(%esi)
      p += sizeof(struct mpproc);
801030ea:	83 c0 14             	add    $0x14,%eax
      continue;
801030ed:	eb 91                	jmp    80103080 <mpinit+0xf0>
801030ef:	90                   	nop
      ioapicid = ioapic->apicno;
801030f0:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
      p += sizeof(struct mpioapic);
801030f4:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
801030f7:	88 0d 60 27 11 80    	mov    %cl,0x80112760
      continue;
801030fd:	eb 81                	jmp    80103080 <mpinit+0xf0>
801030ff:	90                   	nop
      ismp = 0;
80103100:	31 db                	xor    %ebx,%ebx
80103102:	eb 83                	jmp    80103087 <mpinit+0xf7>
  return mpsearch1(0xF0000, 0x10000);
80103104:	ba 00 00 01 00       	mov    $0x10000,%edx
80103109:	b8 00 00 0f 00       	mov    $0xf0000,%eax
8010310e:	e8 0d fe ff ff       	call   80102f20 <mpsearch1>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103113:	85 c0                	test   %eax,%eax
  return mpsearch1(0xF0000, 0x10000);
80103115:	89 c7                	mov    %eax,%edi
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103117:	0f 85 c5 fe ff ff    	jne    80102fe2 <mpinit+0x52>
    panic("Expect to run on an SMP");
8010311d:	c7 04 24 22 73 10 80 	movl   $0x80107322,(%esp)
80103124:	e8 37 d2 ff ff       	call   80100360 <panic>
80103129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(conf->version != 1 && conf->version != 4)
80103130:	3c 01                	cmp    $0x1,%al
80103132:	0f 84 ed fe ff ff    	je     80103025 <mpinit+0x95>
80103138:	eb e3                	jmp    8010311d <mpinit+0x18d>
    panic("Didn't find a suitable machine");
8010313a:	c7 04 24 3c 73 10 80 	movl   $0x8010733c,(%esp)
80103141:	e8 1a d2 ff ff       	call   80100360 <panic>
80103146:	66 90                	xchg   %ax,%ax
80103148:	66 90                	xchg   %ax,%ax
8010314a:	66 90                	xchg   %ax,%ax
8010314c:	66 90                	xchg   %ax,%ax
8010314e:	66 90                	xchg   %ax,%ax

80103150 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
80103150:	55                   	push   %ebp
80103151:	ba 21 00 00 00       	mov    $0x21,%edx
80103156:	89 e5                	mov    %esp,%ebp
80103158:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010315d:	ee                   	out    %al,(%dx)
8010315e:	b2 a1                	mov    $0xa1,%dl
80103160:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
80103161:	5d                   	pop    %ebp
80103162:	c3                   	ret    
80103163:	66 90                	xchg   %ax,%ax
80103165:	66 90                	xchg   %ax,%ax
80103167:	66 90                	xchg   %ax,%ax
80103169:	66 90                	xchg   %ax,%ax
8010316b:	66 90                	xchg   %ax,%ax
8010316d:	66 90                	xchg   %ax,%ax
8010316f:	90                   	nop

80103170 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103170:	55                   	push   %ebp
80103171:	89 e5                	mov    %esp,%ebp
80103173:	57                   	push   %edi
80103174:	56                   	push   %esi
80103175:	53                   	push   %ebx
80103176:	83 ec 1c             	sub    $0x1c,%esp
80103179:	8b 75 08             	mov    0x8(%ebp),%esi
8010317c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010317f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103185:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010318b:	e8 d0 db ff ff       	call   80100d60 <filealloc>
80103190:	85 c0                	test   %eax,%eax
80103192:	89 06                	mov    %eax,(%esi)
80103194:	0f 84 a4 00 00 00    	je     8010323e <pipealloc+0xce>
8010319a:	e8 c1 db ff ff       	call   80100d60 <filealloc>
8010319f:	85 c0                	test   %eax,%eax
801031a1:	89 03                	mov    %eax,(%ebx)
801031a3:	0f 84 87 00 00 00    	je     80103230 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
801031a9:	e8 f2 f2 ff ff       	call   801024a0 <kalloc>
801031ae:	85 c0                	test   %eax,%eax
801031b0:	89 c7                	mov    %eax,%edi
801031b2:	74 7c                	je     80103230 <pipealloc+0xc0>
    goto bad;
  p->readopen = 1;
801031b4:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801031bb:	00 00 00 
  p->writeopen = 1;
801031be:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801031c5:	00 00 00 
  p->nwrite = 0;
801031c8:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801031cf:	00 00 00 
  p->nread = 0;
801031d2:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801031d9:	00 00 00 
  initlock(&p->lock, "pipe");
801031dc:	89 04 24             	mov    %eax,(%esp)
801031df:	c7 44 24 04 70 73 10 	movl   $0x80107370,0x4(%esp)
801031e6:	80 
801031e7:	e8 64 0e 00 00       	call   80104050 <initlock>
  (*f0)->type = FD_PIPE;
801031ec:	8b 06                	mov    (%esi),%eax
801031ee:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
801031f4:	8b 06                	mov    (%esi),%eax
801031f6:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
801031fa:	8b 06                	mov    (%esi),%eax
801031fc:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103200:	8b 06                	mov    (%esi),%eax
80103202:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
80103205:	8b 03                	mov    (%ebx),%eax
80103207:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
8010320d:	8b 03                	mov    (%ebx),%eax
8010320f:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103213:	8b 03                	mov    (%ebx),%eax
80103215:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103219:	8b 03                	mov    (%ebx),%eax
  return 0;
8010321b:	31 db                	xor    %ebx,%ebx
  (*f1)->pipe = p;
8010321d:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103220:	83 c4 1c             	add    $0x1c,%esp
80103223:	89 d8                	mov    %ebx,%eax
80103225:	5b                   	pop    %ebx
80103226:	5e                   	pop    %esi
80103227:	5f                   	pop    %edi
80103228:	5d                   	pop    %ebp
80103229:	c3                   	ret    
8010322a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(*f0)
80103230:	8b 06                	mov    (%esi),%eax
80103232:	85 c0                	test   %eax,%eax
80103234:	74 08                	je     8010323e <pipealloc+0xce>
    fileclose(*f0);
80103236:	89 04 24             	mov    %eax,(%esp)
80103239:	e8 e2 db ff ff       	call   80100e20 <fileclose>
  if(*f1)
8010323e:	8b 03                	mov    (%ebx),%eax
  return -1;
80103240:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if(*f1)
80103245:	85 c0                	test   %eax,%eax
80103247:	74 d7                	je     80103220 <pipealloc+0xb0>
    fileclose(*f1);
80103249:	89 04 24             	mov    %eax,(%esp)
8010324c:	e8 cf db ff ff       	call   80100e20 <fileclose>
}
80103251:	83 c4 1c             	add    $0x1c,%esp
80103254:	89 d8                	mov    %ebx,%eax
80103256:	5b                   	pop    %ebx
80103257:	5e                   	pop    %esi
80103258:	5f                   	pop    %edi
80103259:	5d                   	pop    %ebp
8010325a:	c3                   	ret    
8010325b:	90                   	nop
8010325c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103260 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103260:	55                   	push   %ebp
80103261:	89 e5                	mov    %esp,%ebp
80103263:	56                   	push   %esi
80103264:	53                   	push   %ebx
80103265:	83 ec 10             	sub    $0x10,%esp
80103268:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010326b:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010326e:	89 1c 24             	mov    %ebx,(%esp)
80103271:	e8 ca 0e 00 00       	call   80104140 <acquire>
  if(writable){
80103276:	85 f6                	test   %esi,%esi
80103278:	74 3e                	je     801032b8 <pipeclose+0x58>
    p->writeopen = 0;
    wakeup(&p->nread);
8010327a:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
    p->writeopen = 0;
80103280:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
80103287:	00 00 00 
    wakeup(&p->nread);
8010328a:	89 04 24             	mov    %eax,(%esp)
8010328d:	e8 fe 0a 00 00       	call   80103d90 <wakeup>
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103292:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
80103298:	85 d2                	test   %edx,%edx
8010329a:	75 0a                	jne    801032a6 <pipeclose+0x46>
8010329c:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801032a2:	85 c0                	test   %eax,%eax
801032a4:	74 32                	je     801032d8 <pipeclose+0x78>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801032a6:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801032a9:	83 c4 10             	add    $0x10,%esp
801032ac:	5b                   	pop    %ebx
801032ad:	5e                   	pop    %esi
801032ae:	5d                   	pop    %ebp
    release(&p->lock);
801032af:	e9 7c 0f 00 00       	jmp    80104230 <release>
801032b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
801032b8:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
    p->readopen = 0;
801032be:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801032c5:	00 00 00 
    wakeup(&p->nwrite);
801032c8:	89 04 24             	mov    %eax,(%esp)
801032cb:	e8 c0 0a 00 00       	call   80103d90 <wakeup>
801032d0:	eb c0                	jmp    80103292 <pipeclose+0x32>
801032d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    release(&p->lock);
801032d8:	89 1c 24             	mov    %ebx,(%esp)
801032db:	e8 50 0f 00 00       	call   80104230 <release>
    kfree((char*)p);
801032e0:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801032e3:	83 c4 10             	add    $0x10,%esp
801032e6:	5b                   	pop    %ebx
801032e7:	5e                   	pop    %esi
801032e8:	5d                   	pop    %ebp
    kfree((char*)p);
801032e9:	e9 02 f0 ff ff       	jmp    801022f0 <kfree>
801032ee:	66 90                	xchg   %ax,%ax

801032f0 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
801032f0:	55                   	push   %ebp
801032f1:	89 e5                	mov    %esp,%ebp
801032f3:	57                   	push   %edi
801032f4:	56                   	push   %esi
801032f5:	53                   	push   %ebx
801032f6:	83 ec 1c             	sub    $0x1c,%esp
801032f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
801032fc:	89 1c 24             	mov    %ebx,(%esp)
801032ff:	e8 3c 0e 00 00       	call   80104140 <acquire>
  for(i = 0; i < n; i++){
80103304:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103307:	85 c9                	test   %ecx,%ecx
80103309:	0f 8e b2 00 00 00    	jle    801033c1 <pipewrite+0xd1>
8010330f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103312:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
80103318:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010331e:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103324:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103327:	03 4d 10             	add    0x10(%ebp),%ecx
8010332a:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010332d:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
80103333:	81 c1 00 02 00 00    	add    $0x200,%ecx
80103339:	39 c8                	cmp    %ecx,%eax
8010333b:	74 38                	je     80103375 <pipewrite+0x85>
8010333d:	eb 55                	jmp    80103394 <pipewrite+0xa4>
8010333f:	90                   	nop
      if(p->readopen == 0 || myproc()->killed){
80103340:	e8 5b 03 00 00       	call   801036a0 <myproc>
80103345:	8b 40 24             	mov    0x24(%eax),%eax
80103348:	85 c0                	test   %eax,%eax
8010334a:	75 33                	jne    8010337f <pipewrite+0x8f>
      wakeup(&p->nread);
8010334c:	89 3c 24             	mov    %edi,(%esp)
8010334f:	e8 3c 0a 00 00       	call   80103d90 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103354:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80103358:	89 34 24             	mov    %esi,(%esp)
8010335b:	e8 a0 08 00 00       	call   80103c00 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103360:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103366:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010336c:	05 00 02 00 00       	add    $0x200,%eax
80103371:	39 c2                	cmp    %eax,%edx
80103373:	75 23                	jne    80103398 <pipewrite+0xa8>
      if(p->readopen == 0 || myproc()->killed){
80103375:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010337b:	85 d2                	test   %edx,%edx
8010337d:	75 c1                	jne    80103340 <pipewrite+0x50>
        release(&p->lock);
8010337f:	89 1c 24             	mov    %ebx,(%esp)
80103382:	e8 a9 0e 00 00       	call   80104230 <release>
        return -1;
80103387:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
8010338c:	83 c4 1c             	add    $0x1c,%esp
8010338f:	5b                   	pop    %ebx
80103390:	5e                   	pop    %esi
80103391:	5f                   	pop    %edi
80103392:	5d                   	pop    %ebp
80103393:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103394:	89 c2                	mov    %eax,%edx
80103396:	66 90                	xchg   %ax,%ax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103398:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010339b:	8d 42 01             	lea    0x1(%edx),%eax
8010339e:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801033a4:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
801033aa:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801033ae:	0f b6 09             	movzbl (%ecx),%ecx
801033b1:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
801033b5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801033b8:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
801033bb:	0f 85 6c ff ff ff    	jne    8010332d <pipewrite+0x3d>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
801033c1:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801033c7:	89 04 24             	mov    %eax,(%esp)
801033ca:	e8 c1 09 00 00       	call   80103d90 <wakeup>
  release(&p->lock);
801033cf:	89 1c 24             	mov    %ebx,(%esp)
801033d2:	e8 59 0e 00 00       	call   80104230 <release>
  return n;
801033d7:	8b 45 10             	mov    0x10(%ebp),%eax
801033da:	eb b0                	jmp    8010338c <pipewrite+0x9c>
801033dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801033e0 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
801033e0:	55                   	push   %ebp
801033e1:	89 e5                	mov    %esp,%ebp
801033e3:	57                   	push   %edi
801033e4:	56                   	push   %esi
801033e5:	53                   	push   %ebx
801033e6:	83 ec 1c             	sub    $0x1c,%esp
801033e9:	8b 75 08             	mov    0x8(%ebp),%esi
801033ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801033ef:	89 34 24             	mov    %esi,(%esp)
801033f2:	e8 49 0d 00 00       	call   80104140 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801033f7:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
801033fd:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
80103403:	75 5b                	jne    80103460 <piperead+0x80>
80103405:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010340b:	85 db                	test   %ebx,%ebx
8010340d:	74 51                	je     80103460 <piperead+0x80>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
8010340f:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
80103415:	eb 25                	jmp    8010343c <piperead+0x5c>
80103417:	90                   	nop
80103418:	89 74 24 04          	mov    %esi,0x4(%esp)
8010341c:	89 1c 24             	mov    %ebx,(%esp)
8010341f:	e8 dc 07 00 00       	call   80103c00 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103424:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
8010342a:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
80103430:	75 2e                	jne    80103460 <piperead+0x80>
80103432:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103438:	85 d2                	test   %edx,%edx
8010343a:	74 24                	je     80103460 <piperead+0x80>
    if(myproc()->killed){
8010343c:	e8 5f 02 00 00       	call   801036a0 <myproc>
80103441:	8b 48 24             	mov    0x24(%eax),%ecx
80103444:	85 c9                	test   %ecx,%ecx
80103446:	74 d0                	je     80103418 <piperead+0x38>
      release(&p->lock);
80103448:	89 34 24             	mov    %esi,(%esp)
8010344b:	e8 e0 0d 00 00       	call   80104230 <release>
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103450:	83 c4 1c             	add    $0x1c,%esp
      return -1;
80103453:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103458:	5b                   	pop    %ebx
80103459:	5e                   	pop    %esi
8010345a:	5f                   	pop    %edi
8010345b:	5d                   	pop    %ebp
8010345c:	c3                   	ret    
8010345d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103460:	8b 55 10             	mov    0x10(%ebp),%edx
    if(p->nread == p->nwrite)
80103463:	31 db                	xor    %ebx,%ebx
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103465:	85 d2                	test   %edx,%edx
80103467:	7f 2b                	jg     80103494 <piperead+0xb4>
80103469:	eb 31                	jmp    8010349c <piperead+0xbc>
8010346b:	90                   	nop
8010346c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103470:	8d 48 01             	lea    0x1(%eax),%ecx
80103473:	25 ff 01 00 00       	and    $0x1ff,%eax
80103478:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010347e:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
80103483:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103486:	83 c3 01             	add    $0x1,%ebx
80103489:	3b 5d 10             	cmp    0x10(%ebp),%ebx
8010348c:	74 0e                	je     8010349c <piperead+0xbc>
    if(p->nread == p->nwrite)
8010348e:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103494:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010349a:	75 d4                	jne    80103470 <piperead+0x90>
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010349c:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
801034a2:	89 04 24             	mov    %eax,(%esp)
801034a5:	e8 e6 08 00 00       	call   80103d90 <wakeup>
  release(&p->lock);
801034aa:	89 34 24             	mov    %esi,(%esp)
801034ad:	e8 7e 0d 00 00       	call   80104230 <release>
}
801034b2:	83 c4 1c             	add    $0x1c,%esp
  return i;
801034b5:	89 d8                	mov    %ebx,%eax
}
801034b7:	5b                   	pop    %ebx
801034b8:	5e                   	pop    %esi
801034b9:	5f                   	pop    %edi
801034ba:	5d                   	pop    %ebp
801034bb:	c3                   	ret    
801034bc:	66 90                	xchg   %ax,%ax
801034be:	66 90                	xchg   %ax,%ax

801034c0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801034c0:	55                   	push   %ebp
801034c1:	89 e5                	mov    %esp,%ebp
801034c3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801034c4:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
{
801034c9:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);
801034cc:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801034d3:	e8 68 0c 00 00       	call   80104140 <acquire>
801034d8:	eb 11                	jmp    801034eb <allocproc+0x2b>
801034da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801034e0:	83 eb 80             	sub    $0xffffff80,%ebx
801034e3:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
801034e9:	74 7d                	je     80103568 <allocproc+0xa8>
    if(p->state == UNUSED)
801034eb:	8b 43 08             	mov    0x8(%ebx),%eax
801034ee:	85 c0                	test   %eax,%eax
801034f0:	75 ee                	jne    801034e0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801034f2:	a1 04 a0 10 80       	mov    0x8010a004,%eax

  release(&ptable.lock);
801034f7:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
  p->state = EMBRYO;
801034fe:	c7 43 08 01 00 00 00 	movl   $0x1,0x8(%ebx)
  p->pid = nextpid++;
80103505:	8d 50 01             	lea    0x1(%eax),%edx
80103508:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
8010350e:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
80103511:	e8 1a 0d 00 00       	call   80104230 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103516:	e8 85 ef ff ff       	call   801024a0 <kalloc>
8010351b:	85 c0                	test   %eax,%eax
8010351d:	89 43 0c             	mov    %eax,0xc(%ebx)
80103520:	74 5a                	je     8010357c <allocproc+0xbc>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103522:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
80103528:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010352d:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
80103530:	c7 40 14 35 54 10 80 	movl   $0x80105435,0x14(%eax)
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103537:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
8010353e:	00 
8010353f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80103546:	00 
80103547:	89 04 24             	mov    %eax,(%esp)
  p->context = (struct context*)sp;
8010354a:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010354d:	e8 2e 0d 00 00       	call   80104280 <memset>
  p->context->eip = (uint)forkret;
80103552:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103555:	c7 40 10 90 35 10 80 	movl   $0x80103590,0x10(%eax)

  return p;
8010355c:	89 d8                	mov    %ebx,%eax
}
8010355e:	83 c4 14             	add    $0x14,%esp
80103561:	5b                   	pop    %ebx
80103562:	5d                   	pop    %ebp
80103563:	c3                   	ret    
80103564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80103568:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
8010356f:	e8 bc 0c 00 00       	call   80104230 <release>
}
80103574:	83 c4 14             	add    $0x14,%esp
  return 0;
80103577:	31 c0                	xor    %eax,%eax
}
80103579:	5b                   	pop    %ebx
8010357a:	5d                   	pop    %ebp
8010357b:	c3                   	ret    
    p->state = UNUSED;
8010357c:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    return 0;
80103583:	eb d9                	jmp    8010355e <allocproc+0x9e>
80103585:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103590 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103590:	55                   	push   %ebp
80103591:	89 e5                	mov    %esp,%ebp
80103593:	83 ec 18             	sub    $0x18,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103596:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
8010359d:	e8 8e 0c 00 00       	call   80104230 <release>

  if (first) {
801035a2:	a1 00 a0 10 80       	mov    0x8010a000,%eax
801035a7:	85 c0                	test   %eax,%eax
801035a9:	75 05                	jne    801035b0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801035ab:	c9                   	leave  
801035ac:	c3                   	ret    
801035ad:	8d 76 00             	lea    0x0(%esi),%esi
    iinit(ROOTDEV);
801035b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    first = 0;
801035b7:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801035be:	00 00 00 
    iinit(ROOTDEV);
801035c1:	e8 aa de ff ff       	call   80101470 <iinit>
    initlog(ROOTDEV);
801035c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801035cd:	e8 9e f4 ff ff       	call   80102a70 <initlog>
}
801035d2:	c9                   	leave  
801035d3:	c3                   	ret    
801035d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801035da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801035e0 <pinit>:
{
801035e0:	55                   	push   %ebp
801035e1:	89 e5                	mov    %esp,%ebp
801035e3:	83 ec 18             	sub    $0x18,%esp
  initlock(&ptable.lock, "ptable");
801035e6:	c7 44 24 04 75 73 10 	movl   $0x80107375,0x4(%esp)
801035ed:	80 
801035ee:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801035f5:	e8 56 0a 00 00       	call   80104050 <initlock>
}
801035fa:	c9                   	leave  
801035fb:	c3                   	ret    
801035fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103600 <mycpu>:
{
80103600:	55                   	push   %ebp
80103601:	89 e5                	mov    %esp,%ebp
80103603:	56                   	push   %esi
80103604:	53                   	push   %ebx
80103605:	83 ec 10             	sub    $0x10,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103608:	9c                   	pushf  
80103609:	58                   	pop    %eax
  if(readeflags()&FL_IF)
8010360a:	f6 c4 02             	test   $0x2,%ah
8010360d:	75 57                	jne    80103666 <mycpu+0x66>
  apicid = lapicid();
8010360f:	e8 4c f1 ff ff       	call   80102760 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103614:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
8010361a:	85 f6                	test   %esi,%esi
8010361c:	7e 3c                	jle    8010365a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
8010361e:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80103625:	39 c2                	cmp    %eax,%edx
80103627:	74 2d                	je     80103656 <mycpu+0x56>
80103629:	b9 30 28 11 80       	mov    $0x80112830,%ecx
  for (i = 0; i < ncpu; ++i) {
8010362e:	31 d2                	xor    %edx,%edx
80103630:	83 c2 01             	add    $0x1,%edx
80103633:	39 f2                	cmp    %esi,%edx
80103635:	74 23                	je     8010365a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
80103637:	0f b6 19             	movzbl (%ecx),%ebx
8010363a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103640:	39 c3                	cmp    %eax,%ebx
80103642:	75 ec                	jne    80103630 <mycpu+0x30>
      return &cpus[i];
80103644:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
}
8010364a:	83 c4 10             	add    $0x10,%esp
8010364d:	5b                   	pop    %ebx
8010364e:	5e                   	pop    %esi
8010364f:	5d                   	pop    %ebp
      return &cpus[i];
80103650:	05 80 27 11 80       	add    $0x80112780,%eax
}
80103655:	c3                   	ret    
  for (i = 0; i < ncpu; ++i) {
80103656:	31 d2                	xor    %edx,%edx
80103658:	eb ea                	jmp    80103644 <mycpu+0x44>
  panic("unknown apicid\n");
8010365a:	c7 04 24 7c 73 10 80 	movl   $0x8010737c,(%esp)
80103661:	e8 fa cc ff ff       	call   80100360 <panic>
    panic("mycpu called with interrupts enabled\n");
80103666:	c7 04 24 58 74 10 80 	movl   $0x80107458,(%esp)
8010366d:	e8 ee cc ff ff       	call   80100360 <panic>
80103672:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103680 <cpuid>:
cpuid() {
80103680:	55                   	push   %ebp
80103681:	89 e5                	mov    %esp,%ebp
80103683:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103686:	e8 75 ff ff ff       	call   80103600 <mycpu>
}
8010368b:	c9                   	leave  
  return mycpu()-cpus;
8010368c:	2d 80 27 11 80       	sub    $0x80112780,%eax
80103691:	c1 f8 04             	sar    $0x4,%eax
80103694:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010369a:	c3                   	ret    
8010369b:	90                   	nop
8010369c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801036a0 <myproc>:
myproc(void) {
801036a0:	55                   	push   %ebp
801036a1:	89 e5                	mov    %esp,%ebp
801036a3:	53                   	push   %ebx
801036a4:	83 ec 04             	sub    $0x4,%esp
  pushcli();
801036a7:	e8 54 0a 00 00       	call   80104100 <pushcli>
  c = mycpu();
801036ac:	e8 4f ff ff ff       	call   80103600 <mycpu>
  p = c->proc;
801036b1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801036b7:	e8 04 0b 00 00       	call   801041c0 <popcli>
}
801036bc:	83 c4 04             	add    $0x4,%esp
801036bf:	89 d8                	mov    %ebx,%eax
801036c1:	5b                   	pop    %ebx
801036c2:	5d                   	pop    %ebp
801036c3:	c3                   	ret    
801036c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801036ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801036d0 <userinit>:
{
801036d0:	55                   	push   %ebp
801036d1:	89 e5                	mov    %esp,%ebp
801036d3:	53                   	push   %ebx
801036d4:	83 ec 14             	sub    $0x14,%esp
  p = allocproc();
801036d7:	e8 e4 fd ff ff       	call   801034c0 <allocproc>
801036dc:	89 c3                	mov    %eax,%ebx
  initproc = p;
801036de:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
801036e3:	e8 68 33 00 00       	call   80106a50 <setupkvm>
801036e8:	85 c0                	test   %eax,%eax
801036ea:	89 43 04             	mov    %eax,0x4(%ebx)
801036ed:	0f 84 d4 00 00 00    	je     801037c7 <userinit+0xf7>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801036f3:	89 04 24             	mov    %eax,(%esp)
801036f6:	c7 44 24 08 2c 00 00 	movl   $0x2c,0x8(%esp)
801036fd:	00 
801036fe:	c7 44 24 04 60 a4 10 	movl   $0x8010a460,0x4(%esp)
80103705:	80 
80103706:	e8 55 30 00 00       	call   80106760 <inituvm>
  p->sz = PGSIZE;
8010370b:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103711:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
80103718:	00 
80103719:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80103720:	00 
80103721:	8b 43 18             	mov    0x18(%ebx),%eax
80103724:	89 04 24             	mov    %eax,(%esp)
80103727:	e8 54 0b 00 00       	call   80104280 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010372c:	8b 43 18             	mov    0x18(%ebx),%eax
8010372f:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103734:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103739:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010373d:	8b 43 18             	mov    0x18(%ebx),%eax
80103740:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103744:	8b 43 18             	mov    0x18(%ebx),%eax
80103747:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010374b:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
8010374f:	8b 43 18             	mov    0x18(%ebx),%eax
80103752:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103756:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010375a:	8b 43 18             	mov    0x18(%ebx),%eax
8010375d:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103764:	8b 43 18             	mov    0x18(%ebx),%eax
80103767:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
8010376e:	8b 43 18             	mov    0x18(%ebx),%eax
80103771:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103778:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010377b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103782:	00 
80103783:	c7 44 24 04 a5 73 10 	movl   $0x801073a5,0x4(%esp)
8010378a:	80 
8010378b:	89 04 24             	mov    %eax,(%esp)
8010378e:	e8 cd 0c 00 00       	call   80104460 <safestrcpy>
  p->cwd = namei("/");
80103793:	c7 04 24 ae 73 10 80 	movl   $0x801073ae,(%esp)
8010379a:	e8 61 e7 ff ff       	call   80101f00 <namei>
8010379f:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
801037a2:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801037a9:	e8 92 09 00 00       	call   80104140 <acquire>
  p->state = RUNNABLE;
801037ae:	c7 43 08 03 00 00 00 	movl   $0x3,0x8(%ebx)
  release(&ptable.lock);
801037b5:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801037bc:	e8 6f 0a 00 00       	call   80104230 <release>
}
801037c1:	83 c4 14             	add    $0x14,%esp
801037c4:	5b                   	pop    %ebx
801037c5:	5d                   	pop    %ebp
801037c6:	c3                   	ret    
    panic("userinit: out of memory?");
801037c7:	c7 04 24 8c 73 10 80 	movl   $0x8010738c,(%esp)
801037ce:	e8 8d cb ff ff       	call   80100360 <panic>
801037d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037e0 <growproc>:
{
801037e0:	55                   	push   %ebp
801037e1:	89 e5                	mov    %esp,%ebp
801037e3:	56                   	push   %esi
801037e4:	53                   	push   %ebx
801037e5:	83 ec 10             	sub    $0x10,%esp
801037e8:	8b 75 08             	mov    0x8(%ebp),%esi
  struct proc *curproc = myproc();
801037eb:	e8 b0 fe ff ff       	call   801036a0 <myproc>
  if(n > 0){
801037f0:	83 fe 00             	cmp    $0x0,%esi
  struct proc *curproc = myproc();
801037f3:	89 c3                	mov    %eax,%ebx
  sz = curproc->sz;
801037f5:	8b 00                	mov    (%eax),%eax
  if(n > 0){
801037f7:	7e 2f                	jle    80103828 <growproc+0x48>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801037f9:	01 c6                	add    %eax,%esi
801037fb:	89 74 24 08          	mov    %esi,0x8(%esp)
801037ff:	89 44 24 04          	mov    %eax,0x4(%esp)
80103803:	8b 43 04             	mov    0x4(%ebx),%eax
80103806:	89 04 24             	mov    %eax,(%esp)
80103809:	e8 92 30 00 00       	call   801068a0 <allocuvm>
8010380e:	85 c0                	test   %eax,%eax
80103810:	74 36                	je     80103848 <growproc+0x68>
  curproc->sz = sz;
80103812:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
80103814:	89 1c 24             	mov    %ebx,(%esp)
80103817:	e8 34 2e 00 00       	call   80106650 <switchuvm>
  return 0;
8010381c:	31 c0                	xor    %eax,%eax
}
8010381e:	83 c4 10             	add    $0x10,%esp
80103821:	5b                   	pop    %ebx
80103822:	5e                   	pop    %esi
80103823:	5d                   	pop    %ebp
80103824:	c3                   	ret    
80103825:	8d 76 00             	lea    0x0(%esi),%esi
  } else if(n < 0){
80103828:	74 e8                	je     80103812 <growproc+0x32>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
8010382a:	01 c6                	add    %eax,%esi
8010382c:	89 74 24 08          	mov    %esi,0x8(%esp)
80103830:	89 44 24 04          	mov    %eax,0x4(%esp)
80103834:	8b 43 04             	mov    0x4(%ebx),%eax
80103837:	89 04 24             	mov    %eax,(%esp)
8010383a:	e8 71 31 00 00       	call   801069b0 <deallocuvm>
8010383f:	85 c0                	test   %eax,%eax
80103841:	75 cf                	jne    80103812 <growproc+0x32>
80103843:	90                   	nop
80103844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80103848:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010384d:	eb cf                	jmp    8010381e <growproc+0x3e>
8010384f:	90                   	nop

80103850 <fork>:
{
80103850:	55                   	push   %ebp
80103851:	89 e5                	mov    %esp,%ebp
80103853:	57                   	push   %edi
80103854:	56                   	push   %esi
80103855:	53                   	push   %ebx
80103856:	83 ec 1c             	sub    $0x1c,%esp
  struct proc *curproc = myproc();
80103859:	e8 42 fe ff ff       	call   801036a0 <myproc>
8010385e:	89 c3                	mov    %eax,%ebx
  if((np = allocproc()) == 0){
80103860:	e8 5b fc ff ff       	call   801034c0 <allocproc>
80103865:	85 c0                	test   %eax,%eax
80103867:	89 c7                	mov    %eax,%edi
80103869:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010386c:	0f 84 c4 00 00 00    	je     80103936 <fork+0xe6>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz, curproc->num_pages)) == 0){
80103872:	8b 43 7c             	mov    0x7c(%ebx),%eax
80103875:	89 44 24 08          	mov    %eax,0x8(%esp)
80103879:	8b 03                	mov    (%ebx),%eax
8010387b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010387f:	8b 43 04             	mov    0x4(%ebx),%eax
80103882:	89 04 24             	mov    %eax,(%esp)
80103885:	e8 a6 32 00 00       	call   80106b30 <copyuvm>
8010388a:	85 c0                	test   %eax,%eax
8010388c:	89 47 04             	mov    %eax,0x4(%edi)
8010388f:	0f 84 a8 00 00 00    	je     8010393d <fork+0xed>
  np->sz = curproc->sz;
80103895:	8b 03                	mov    (%ebx),%eax
80103897:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010389a:	89 01                	mov    %eax,(%ecx)
  *np->tf = *curproc->tf;
8010389c:	8b 79 18             	mov    0x18(%ecx),%edi
8010389f:	89 c8                	mov    %ecx,%eax
  np->parent = curproc;
801038a1:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
801038a4:	8b 73 18             	mov    0x18(%ebx),%esi
801038a7:	b9 13 00 00 00       	mov    $0x13,%ecx
801038ac:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
801038ae:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
801038b0:	8b 40 18             	mov    0x18(%eax),%eax
801038b3:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
801038ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(curproc->ofile[i])
801038c0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
801038c4:	85 c0                	test   %eax,%eax
801038c6:	74 0f                	je     801038d7 <fork+0x87>
      np->ofile[i] = filedup(curproc->ofile[i]);
801038c8:	89 04 24             	mov    %eax,(%esp)
801038cb:	e8 00 d5 ff ff       	call   80100dd0 <filedup>
801038d0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801038d3:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
801038d7:	83 c6 01             	add    $0x1,%esi
801038da:	83 fe 10             	cmp    $0x10,%esi
801038dd:	75 e1                	jne    801038c0 <fork+0x70>
  np->cwd = idup(curproc->cwd);
801038df:	8b 43 68             	mov    0x68(%ebx),%eax
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801038e2:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
801038e5:	89 04 24             	mov    %eax,(%esp)
801038e8:	e8 93 dd ff ff       	call   80101680 <idup>
801038ed:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801038f0:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801038f3:	8d 47 6c             	lea    0x6c(%edi),%eax
801038f6:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801038fa:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103901:	00 
80103902:	89 04 24             	mov    %eax,(%esp)
80103905:	e8 56 0b 00 00       	call   80104460 <safestrcpy>
  pid = np->pid;
8010390a:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
8010390d:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103914:	e8 27 08 00 00       	call   80104140 <acquire>
  np->state = RUNNABLE;
80103919:	c7 47 08 03 00 00 00 	movl   $0x3,0x8(%edi)
  release(&ptable.lock);
80103920:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103927:	e8 04 09 00 00       	call   80104230 <release>
  return pid;
8010392c:	89 d8                	mov    %ebx,%eax
}
8010392e:	83 c4 1c             	add    $0x1c,%esp
80103931:	5b                   	pop    %ebx
80103932:	5e                   	pop    %esi
80103933:	5f                   	pop    %edi
80103934:	5d                   	pop    %ebp
80103935:	c3                   	ret    
    return -1;
80103936:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010393b:	eb f1                	jmp    8010392e <fork+0xde>
    kfree(np->kstack);
8010393d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103940:	8b 47 0c             	mov    0xc(%edi),%eax
80103943:	89 04 24             	mov    %eax,(%esp)
80103946:	e8 a5 e9 ff ff       	call   801022f0 <kfree>
    return -1;
8010394b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    np->kstack = 0;
80103950:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    np->state = UNUSED;
80103957:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    return -1;
8010395e:	eb ce                	jmp    8010392e <fork+0xde>

80103960 <scheduler>:
{
80103960:	55                   	push   %ebp
80103961:	89 e5                	mov    %esp,%ebp
80103963:	57                   	push   %edi
80103964:	56                   	push   %esi
80103965:	53                   	push   %ebx
80103966:	83 ec 1c             	sub    $0x1c,%esp
  struct cpu *c = mycpu();
80103969:	e8 92 fc ff ff       	call   80103600 <mycpu>
8010396e:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103970:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103977:	00 00 00 
8010397a:	8d 78 04             	lea    0x4(%eax),%edi
8010397d:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
80103980:	fb                   	sti    
    acquire(&ptable.lock);
80103981:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103988:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
    acquire(&ptable.lock);
8010398d:	e8 ae 07 00 00       	call   80104140 <acquire>
80103992:	eb 0f                	jmp    801039a3 <scheduler+0x43>
80103994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103998:	83 eb 80             	sub    $0xffffff80,%ebx
8010399b:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
801039a1:	74 45                	je     801039e8 <scheduler+0x88>
      if(p->state != RUNNABLE)
801039a3:	83 7b 08 03          	cmpl   $0x3,0x8(%ebx)
801039a7:	75 ef                	jne    80103998 <scheduler+0x38>
      c->proc = p;
801039a9:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
801039af:	89 1c 24             	mov    %ebx,(%esp)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801039b2:	83 eb 80             	sub    $0xffffff80,%ebx
      switchuvm(p);
801039b5:	e8 96 2c 00 00       	call   80106650 <switchuvm>
      swtch(&(c->scheduler), p->context);
801039ba:	8b 43 9c             	mov    -0x64(%ebx),%eax
      p->state = RUNNING;
801039bd:	c7 43 88 04 00 00 00 	movl   $0x4,-0x78(%ebx)
      swtch(&(c->scheduler), p->context);
801039c4:	89 3c 24             	mov    %edi,(%esp)
801039c7:	89 44 24 04          	mov    %eax,0x4(%esp)
801039cb:	e8 eb 0a 00 00       	call   801044bb <swtch>
      switchkvm();
801039d0:	e8 5b 2c 00 00       	call   80106630 <switchkvm>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801039d5:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
      c->proc = 0;
801039db:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
801039e2:	00 00 00 
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801039e5:	75 bc                	jne    801039a3 <scheduler+0x43>
801039e7:	90                   	nop
    release(&ptable.lock);
801039e8:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039ef:	e8 3c 08 00 00       	call   80104230 <release>
  }
801039f4:	eb 8a                	jmp    80103980 <scheduler+0x20>
801039f6:	8d 76 00             	lea    0x0(%esi),%esi
801039f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a00 <sched>:
{
80103a00:	55                   	push   %ebp
80103a01:	89 e5                	mov    %esp,%ebp
80103a03:	56                   	push   %esi
80103a04:	53                   	push   %ebx
80103a05:	83 ec 10             	sub    $0x10,%esp
  struct proc *p = myproc();
80103a08:	e8 93 fc ff ff       	call   801036a0 <myproc>
  if(!holding(&ptable.lock))
80103a0d:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
  struct proc *p = myproc();
80103a14:	89 c3                	mov    %eax,%ebx
  if(!holding(&ptable.lock))
80103a16:	e8 b5 06 00 00       	call   801040d0 <holding>
80103a1b:	85 c0                	test   %eax,%eax
80103a1d:	74 4f                	je     80103a6e <sched+0x6e>
  if(mycpu()->ncli != 1)
80103a1f:	e8 dc fb ff ff       	call   80103600 <mycpu>
80103a24:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103a2b:	75 65                	jne    80103a92 <sched+0x92>
  if(p->state == RUNNING)
80103a2d:	83 7b 08 04          	cmpl   $0x4,0x8(%ebx)
80103a31:	74 53                	je     80103a86 <sched+0x86>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103a33:	9c                   	pushf  
80103a34:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103a35:	f6 c4 02             	test   $0x2,%ah
80103a38:	75 40                	jne    80103a7a <sched+0x7a>
  intena = mycpu()->intena;
80103a3a:	e8 c1 fb ff ff       	call   80103600 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103a3f:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103a42:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103a48:	e8 b3 fb ff ff       	call   80103600 <mycpu>
80103a4d:	8b 40 04             	mov    0x4(%eax),%eax
80103a50:	89 1c 24             	mov    %ebx,(%esp)
80103a53:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a57:	e8 5f 0a 00 00       	call   801044bb <swtch>
  mycpu()->intena = intena;
80103a5c:	e8 9f fb ff ff       	call   80103600 <mycpu>
80103a61:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103a67:	83 c4 10             	add    $0x10,%esp
80103a6a:	5b                   	pop    %ebx
80103a6b:	5e                   	pop    %esi
80103a6c:	5d                   	pop    %ebp
80103a6d:	c3                   	ret    
    panic("sched ptable.lock");
80103a6e:	c7 04 24 b0 73 10 80 	movl   $0x801073b0,(%esp)
80103a75:	e8 e6 c8 ff ff       	call   80100360 <panic>
    panic("sched interruptible");
80103a7a:	c7 04 24 dc 73 10 80 	movl   $0x801073dc,(%esp)
80103a81:	e8 da c8 ff ff       	call   80100360 <panic>
    panic("sched running");
80103a86:	c7 04 24 ce 73 10 80 	movl   $0x801073ce,(%esp)
80103a8d:	e8 ce c8 ff ff       	call   80100360 <panic>
    panic("sched locks");
80103a92:	c7 04 24 c2 73 10 80 	movl   $0x801073c2,(%esp)
80103a99:	e8 c2 c8 ff ff       	call   80100360 <panic>
80103a9e:	66 90                	xchg   %ax,%ax

80103aa0 <exit>:
{
80103aa0:	55                   	push   %ebp
80103aa1:	89 e5                	mov    %esp,%ebp
80103aa3:	56                   	push   %esi
  if(curproc == initproc)
80103aa4:	31 f6                	xor    %esi,%esi
{
80103aa6:	53                   	push   %ebx
80103aa7:	83 ec 10             	sub    $0x10,%esp
  struct proc *curproc = myproc();
80103aaa:	e8 f1 fb ff ff       	call   801036a0 <myproc>
  if(curproc == initproc)
80103aaf:	3b 05 b8 a5 10 80    	cmp    0x8010a5b8,%eax
  struct proc *curproc = myproc();
80103ab5:	89 c3                	mov    %eax,%ebx
  if(curproc == initproc)
80103ab7:	0f 84 ea 00 00 00    	je     80103ba7 <exit+0x107>
80103abd:	8d 76 00             	lea    0x0(%esi),%esi
    if(curproc->ofile[fd]){
80103ac0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103ac4:	85 c0                	test   %eax,%eax
80103ac6:	74 10                	je     80103ad8 <exit+0x38>
      fileclose(curproc->ofile[fd]);
80103ac8:	89 04 24             	mov    %eax,(%esp)
80103acb:	e8 50 d3 ff ff       	call   80100e20 <fileclose>
      curproc->ofile[fd] = 0;
80103ad0:	c7 44 b3 28 00 00 00 	movl   $0x0,0x28(%ebx,%esi,4)
80103ad7:	00 
  for(fd = 0; fd < NOFILE; fd++){
80103ad8:	83 c6 01             	add    $0x1,%esi
80103adb:	83 fe 10             	cmp    $0x10,%esi
80103ade:	75 e0                	jne    80103ac0 <exit+0x20>
  begin_op();
80103ae0:	e8 2b f0 ff ff       	call   80102b10 <begin_op>
  iput(curproc->cwd);
80103ae5:	8b 43 68             	mov    0x68(%ebx),%eax
80103ae8:	89 04 24             	mov    %eax,(%esp)
80103aeb:	e8 e0 dc ff ff       	call   801017d0 <iput>
  end_op();
80103af0:	e8 8b f0 ff ff       	call   80102b80 <end_op>
  curproc->cwd = 0;
80103af5:	c7 43 68 00 00 00 00 	movl   $0x0,0x68(%ebx)
  acquire(&ptable.lock);
80103afc:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103b03:	e8 38 06 00 00       	call   80104140 <acquire>
  wakeup1(curproc->parent);
80103b08:	8b 43 14             	mov    0x14(%ebx),%eax
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b0b:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103b10:	eb 11                	jmp    80103b23 <exit+0x83>
80103b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103b18:	83 ea 80             	sub    $0xffffff80,%edx
80103b1b:	81 fa 54 4d 11 80    	cmp    $0x80114d54,%edx
80103b21:	74 1d                	je     80103b40 <exit+0xa0>
    if(p->state == SLEEPING && p->chan == chan)
80103b23:	83 7a 08 02          	cmpl   $0x2,0x8(%edx)
80103b27:	75 ef                	jne    80103b18 <exit+0x78>
80103b29:	3b 42 20             	cmp    0x20(%edx),%eax
80103b2c:	75 ea                	jne    80103b18 <exit+0x78>
      p->state = RUNNABLE;
80103b2e:	c7 42 08 03 00 00 00 	movl   $0x3,0x8(%edx)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b35:	83 ea 80             	sub    $0xffffff80,%edx
80103b38:	81 fa 54 4d 11 80    	cmp    $0x80114d54,%edx
80103b3e:	75 e3                	jne    80103b23 <exit+0x83>
      p->parent = initproc;
80103b40:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80103b45:	b9 54 2d 11 80       	mov    $0x80112d54,%ecx
80103b4a:	eb 0f                	jmp    80103b5b <exit+0xbb>
80103b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b50:	83 e9 80             	sub    $0xffffff80,%ecx
80103b53:	81 f9 54 4d 11 80    	cmp    $0x80114d54,%ecx
80103b59:	74 34                	je     80103b8f <exit+0xef>
    if(p->parent == curproc){
80103b5b:	39 59 14             	cmp    %ebx,0x14(%ecx)
80103b5e:	75 f0                	jne    80103b50 <exit+0xb0>
      if(p->state == ZOMBIE)
80103b60:	83 79 08 05          	cmpl   $0x5,0x8(%ecx)
      p->parent = initproc;
80103b64:	89 41 14             	mov    %eax,0x14(%ecx)
      if(p->state == ZOMBIE)
80103b67:	75 e7                	jne    80103b50 <exit+0xb0>
80103b69:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103b6e:	eb 0b                	jmp    80103b7b <exit+0xdb>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b70:	83 ea 80             	sub    $0xffffff80,%edx
80103b73:	81 fa 54 4d 11 80    	cmp    $0x80114d54,%edx
80103b79:	74 d5                	je     80103b50 <exit+0xb0>
    if(p->state == SLEEPING && p->chan == chan)
80103b7b:	83 7a 08 02          	cmpl   $0x2,0x8(%edx)
80103b7f:	75 ef                	jne    80103b70 <exit+0xd0>
80103b81:	3b 42 20             	cmp    0x20(%edx),%eax
80103b84:	75 ea                	jne    80103b70 <exit+0xd0>
      p->state = RUNNABLE;
80103b86:	c7 42 08 03 00 00 00 	movl   $0x3,0x8(%edx)
80103b8d:	eb e1                	jmp    80103b70 <exit+0xd0>
  curproc->state = ZOMBIE;
80103b8f:	c7 43 08 05 00 00 00 	movl   $0x5,0x8(%ebx)
  sched();
80103b96:	e8 65 fe ff ff       	call   80103a00 <sched>
  panic("zombie exit");
80103b9b:	c7 04 24 fd 73 10 80 	movl   $0x801073fd,(%esp)
80103ba2:	e8 b9 c7 ff ff       	call   80100360 <panic>
    panic("init exiting");
80103ba7:	c7 04 24 f0 73 10 80 	movl   $0x801073f0,(%esp)
80103bae:	e8 ad c7 ff ff       	call   80100360 <panic>
80103bb3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103bc0 <yield>:
{
80103bc0:	55                   	push   %ebp
80103bc1:	89 e5                	mov    %esp,%ebp
80103bc3:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103bc6:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103bcd:	e8 6e 05 00 00       	call   80104140 <acquire>
  myproc()->state = RUNNABLE;
80103bd2:	e8 c9 fa ff ff       	call   801036a0 <myproc>
80103bd7:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  sched();
80103bde:	e8 1d fe ff ff       	call   80103a00 <sched>
  release(&ptable.lock);
80103be3:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103bea:	e8 41 06 00 00       	call   80104230 <release>
}
80103bef:	c9                   	leave  
80103bf0:	c3                   	ret    
80103bf1:	eb 0d                	jmp    80103c00 <sleep>
80103bf3:	90                   	nop
80103bf4:	90                   	nop
80103bf5:	90                   	nop
80103bf6:	90                   	nop
80103bf7:	90                   	nop
80103bf8:	90                   	nop
80103bf9:	90                   	nop
80103bfa:	90                   	nop
80103bfb:	90                   	nop
80103bfc:	90                   	nop
80103bfd:	90                   	nop
80103bfe:	90                   	nop
80103bff:	90                   	nop

80103c00 <sleep>:
{
80103c00:	55                   	push   %ebp
80103c01:	89 e5                	mov    %esp,%ebp
80103c03:	57                   	push   %edi
80103c04:	56                   	push   %esi
80103c05:	53                   	push   %ebx
80103c06:	83 ec 1c             	sub    $0x1c,%esp
80103c09:	8b 7d 08             	mov    0x8(%ebp),%edi
80103c0c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct proc *p = myproc();
80103c0f:	e8 8c fa ff ff       	call   801036a0 <myproc>
  if(p == 0)
80103c14:	85 c0                	test   %eax,%eax
  struct proc *p = myproc();
80103c16:	89 c3                	mov    %eax,%ebx
  if(p == 0)
80103c18:	0f 84 7c 00 00 00    	je     80103c9a <sleep+0x9a>
  if(lk == 0)
80103c1e:	85 f6                	test   %esi,%esi
80103c20:	74 6c                	je     80103c8e <sleep+0x8e>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103c22:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103c28:	74 46                	je     80103c70 <sleep+0x70>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103c2a:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c31:	e8 0a 05 00 00       	call   80104140 <acquire>
    release(lk);
80103c36:	89 34 24             	mov    %esi,(%esp)
80103c39:	e8 f2 05 00 00       	call   80104230 <release>
  p->chan = chan;
80103c3e:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103c41:	c7 43 08 02 00 00 00 	movl   $0x2,0x8(%ebx)
  sched();
80103c48:	e8 b3 fd ff ff       	call   80103a00 <sched>
  p->chan = 0;
80103c4d:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80103c54:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c5b:	e8 d0 05 00 00       	call   80104230 <release>
    acquire(lk);
80103c60:	89 75 08             	mov    %esi,0x8(%ebp)
}
80103c63:	83 c4 1c             	add    $0x1c,%esp
80103c66:	5b                   	pop    %ebx
80103c67:	5e                   	pop    %esi
80103c68:	5f                   	pop    %edi
80103c69:	5d                   	pop    %ebp
    acquire(lk);
80103c6a:	e9 d1 04 00 00       	jmp    80104140 <acquire>
80103c6f:	90                   	nop
  p->chan = chan;
80103c70:	89 78 20             	mov    %edi,0x20(%eax)
  p->state = SLEEPING;
80103c73:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%eax)
  sched();
80103c7a:	e8 81 fd ff ff       	call   80103a00 <sched>
  p->chan = 0;
80103c7f:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103c86:	83 c4 1c             	add    $0x1c,%esp
80103c89:	5b                   	pop    %ebx
80103c8a:	5e                   	pop    %esi
80103c8b:	5f                   	pop    %edi
80103c8c:	5d                   	pop    %ebp
80103c8d:	c3                   	ret    
    panic("sleep without lk");
80103c8e:	c7 04 24 0f 74 10 80 	movl   $0x8010740f,(%esp)
80103c95:	e8 c6 c6 ff ff       	call   80100360 <panic>
    panic("sleep");
80103c9a:	c7 04 24 09 74 10 80 	movl   $0x80107409,(%esp)
80103ca1:	e8 ba c6 ff ff       	call   80100360 <panic>
80103ca6:	8d 76 00             	lea    0x0(%esi),%esi
80103ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103cb0 <wait>:
{
80103cb0:	55                   	push   %ebp
80103cb1:	89 e5                	mov    %esp,%ebp
80103cb3:	56                   	push   %esi
80103cb4:	53                   	push   %ebx
80103cb5:	83 ec 10             	sub    $0x10,%esp
  struct proc *curproc = myproc();
80103cb8:	e8 e3 f9 ff ff       	call   801036a0 <myproc>
  acquire(&ptable.lock);
80103cbd:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
  struct proc *curproc = myproc();
80103cc4:	89 c6                	mov    %eax,%esi
  acquire(&ptable.lock);
80103cc6:	e8 75 04 00 00       	call   80104140 <acquire>
    havekids = 0;
80103ccb:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ccd:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103cd2:	eb 0f                	jmp    80103ce3 <wait+0x33>
80103cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103cd8:	83 eb 80             	sub    $0xffffff80,%ebx
80103cdb:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103ce1:	74 1d                	je     80103d00 <wait+0x50>
      if(p->parent != curproc)
80103ce3:	39 73 14             	cmp    %esi,0x14(%ebx)
80103ce6:	75 f0                	jne    80103cd8 <wait+0x28>
      if(p->state == ZOMBIE){
80103ce8:	83 7b 08 05          	cmpl   $0x5,0x8(%ebx)
80103cec:	74 2f                	je     80103d1d <wait+0x6d>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cee:	83 eb 80             	sub    $0xffffff80,%ebx
      havekids = 1;
80103cf1:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cf6:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103cfc:	75 e5                	jne    80103ce3 <wait+0x33>
80103cfe:	66 90                	xchg   %ax,%ax
    if(!havekids || curproc->killed){
80103d00:	85 c0                	test   %eax,%eax
80103d02:	74 6e                	je     80103d72 <wait+0xc2>
80103d04:	8b 46 24             	mov    0x24(%esi),%eax
80103d07:	85 c0                	test   %eax,%eax
80103d09:	75 67                	jne    80103d72 <wait+0xc2>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103d0b:	c7 44 24 04 20 2d 11 	movl   $0x80112d20,0x4(%esp)
80103d12:	80 
80103d13:	89 34 24             	mov    %esi,(%esp)
80103d16:	e8 e5 fe ff ff       	call   80103c00 <sleep>
  }
80103d1b:	eb ae                	jmp    80103ccb <wait+0x1b>
        kfree(p->kstack);
80103d1d:	8b 43 0c             	mov    0xc(%ebx),%eax
        pid = p->pid;
80103d20:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103d23:	89 04 24             	mov    %eax,(%esp)
80103d26:	e8 c5 e5 ff ff       	call   801022f0 <kfree>
        freevm(p->pgdir);
80103d2b:	8b 43 04             	mov    0x4(%ebx),%eax
        p->kstack = 0;
80103d2e:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        freevm(p->pgdir);
80103d35:	89 04 24             	mov    %eax,(%esp)
80103d38:	e8 93 2c 00 00       	call   801069d0 <freevm>
        release(&ptable.lock);
80103d3d:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
        p->pid = 0;
80103d44:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103d4b:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103d52:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103d56:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103d5d:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        release(&ptable.lock);
80103d64:	e8 c7 04 00 00       	call   80104230 <release>
}
80103d69:	83 c4 10             	add    $0x10,%esp
        return pid;
80103d6c:	89 f0                	mov    %esi,%eax
}
80103d6e:	5b                   	pop    %ebx
80103d6f:	5e                   	pop    %esi
80103d70:	5d                   	pop    %ebp
80103d71:	c3                   	ret    
      release(&ptable.lock);
80103d72:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d79:	e8 b2 04 00 00       	call   80104230 <release>
}
80103d7e:	83 c4 10             	add    $0x10,%esp
      return -1;
80103d81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103d86:	5b                   	pop    %ebx
80103d87:	5e                   	pop    %esi
80103d88:	5d                   	pop    %ebp
80103d89:	c3                   	ret    
80103d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103d90 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103d90:	55                   	push   %ebp
80103d91:	89 e5                	mov    %esp,%ebp
80103d93:	53                   	push   %ebx
80103d94:	83 ec 14             	sub    $0x14,%esp
80103d97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103d9a:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103da1:	e8 9a 03 00 00       	call   80104140 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103da6:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103dab:	eb 0d                	jmp    80103dba <wakeup+0x2a>
80103dad:	8d 76 00             	lea    0x0(%esi),%esi
80103db0:	83 e8 80             	sub    $0xffffff80,%eax
80103db3:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103db8:	74 1e                	je     80103dd8 <wakeup+0x48>
    if(p->state == SLEEPING && p->chan == chan)
80103dba:	83 78 08 02          	cmpl   $0x2,0x8(%eax)
80103dbe:	75 f0                	jne    80103db0 <wakeup+0x20>
80103dc0:	3b 58 20             	cmp    0x20(%eax),%ebx
80103dc3:	75 eb                	jne    80103db0 <wakeup+0x20>
      p->state = RUNNABLE;
80103dc5:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dcc:	83 e8 80             	sub    $0xffffff80,%eax
80103dcf:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103dd4:	75 e4                	jne    80103dba <wakeup+0x2a>
80103dd6:	66 90                	xchg   %ax,%ax
  wakeup1(chan);
  release(&ptable.lock);
80103dd8:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
}
80103ddf:	83 c4 14             	add    $0x14,%esp
80103de2:	5b                   	pop    %ebx
80103de3:	5d                   	pop    %ebp
  release(&ptable.lock);
80103de4:	e9 47 04 00 00       	jmp    80104230 <release>
80103de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103df0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103df0:	55                   	push   %ebp
80103df1:	89 e5                	mov    %esp,%ebp
80103df3:	53                   	push   %ebx
80103df4:	83 ec 14             	sub    $0x14,%esp
80103df7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103dfa:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103e01:	e8 3a 03 00 00       	call   80104140 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e06:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103e0b:	eb 0d                	jmp    80103e1a <kill+0x2a>
80103e0d:	8d 76 00             	lea    0x0(%esi),%esi
80103e10:	83 e8 80             	sub    $0xffffff80,%eax
80103e13:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103e18:	74 36                	je     80103e50 <kill+0x60>
    if(p->pid == pid){
80103e1a:	39 58 10             	cmp    %ebx,0x10(%eax)
80103e1d:	75 f1                	jne    80103e10 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103e1f:	83 78 08 02          	cmpl   $0x2,0x8(%eax)
      p->killed = 1;
80103e23:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
80103e2a:	74 14                	je     80103e40 <kill+0x50>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103e2c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103e33:	e8 f8 03 00 00       	call   80104230 <release>
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
80103e38:	83 c4 14             	add    $0x14,%esp
      return 0;
80103e3b:	31 c0                	xor    %eax,%eax
}
80103e3d:	5b                   	pop    %ebx
80103e3e:	5d                   	pop    %ebp
80103e3f:	c3                   	ret    
        p->state = RUNNABLE;
80103e40:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
80103e47:	eb e3                	jmp    80103e2c <kill+0x3c>
80103e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80103e50:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103e57:	e8 d4 03 00 00       	call   80104230 <release>
}
80103e5c:	83 c4 14             	add    $0x14,%esp
  return -1;
80103e5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103e64:	5b                   	pop    %ebx
80103e65:	5d                   	pop    %ebp
80103e66:	c3                   	ret    
80103e67:	89 f6                	mov    %esi,%esi
80103e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103e70 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103e70:	55                   	push   %ebp
80103e71:	89 e5                	mov    %esp,%ebp
80103e73:	57                   	push   %edi
80103e74:	56                   	push   %esi
80103e75:	53                   	push   %ebx
80103e76:	bb c0 2d 11 80       	mov    $0x80112dc0,%ebx
80103e7b:	83 ec 4c             	sub    $0x4c,%esp
80103e7e:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103e81:	eb 20                	jmp    80103ea3 <procdump+0x33>
80103e83:	90                   	nop
80103e84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80103e88:	c7 04 24 ed 75 10 80 	movl   $0x801075ed,(%esp)
80103e8f:	e8 bc c7 ff ff       	call   80100650 <cprintf>
80103e94:	83 eb 80             	sub    $0xffffff80,%ebx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e97:	81 fb c0 4d 11 80    	cmp    $0x80114dc0,%ebx
80103e9d:	0f 84 8d 00 00 00    	je     80103f30 <procdump+0xc0>
    if(p->state == UNUSED)
80103ea3:	8b 43 9c             	mov    -0x64(%ebx),%eax
80103ea6:	85 c0                	test   %eax,%eax
80103ea8:	74 ea                	je     80103e94 <procdump+0x24>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103eaa:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
80103ead:	ba 20 74 10 80       	mov    $0x80107420,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103eb2:	77 11                	ja     80103ec5 <procdump+0x55>
80103eb4:	8b 14 85 80 74 10 80 	mov    -0x7fef8b80(,%eax,4),%edx
      state = "???";
80103ebb:	b8 20 74 10 80       	mov    $0x80107420,%eax
80103ec0:	85 d2                	test   %edx,%edx
80103ec2:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80103ec5:	8b 43 a4             	mov    -0x5c(%ebx),%eax
80103ec8:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
80103ecc:	89 54 24 08          	mov    %edx,0x8(%esp)
80103ed0:	c7 04 24 24 74 10 80 	movl   $0x80107424,(%esp)
80103ed7:	89 44 24 04          	mov    %eax,0x4(%esp)
80103edb:	e8 70 c7 ff ff       	call   80100650 <cprintf>
    if(p->state == SLEEPING){
80103ee0:	83 7b 9c 02          	cmpl   $0x2,-0x64(%ebx)
80103ee4:	75 a2                	jne    80103e88 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80103ee6:	8d 45 c0             	lea    -0x40(%ebp),%eax
80103ee9:	89 44 24 04          	mov    %eax,0x4(%esp)
80103eed:	8b 43 b0             	mov    -0x50(%ebx),%eax
80103ef0:	8d 7d c0             	lea    -0x40(%ebp),%edi
80103ef3:	8b 40 0c             	mov    0xc(%eax),%eax
80103ef6:	83 c0 08             	add    $0x8,%eax
80103ef9:	89 04 24             	mov    %eax,(%esp)
80103efc:	e8 6f 01 00 00       	call   80104070 <getcallerpcs>
80103f01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80103f08:	8b 17                	mov    (%edi),%edx
80103f0a:	85 d2                	test   %edx,%edx
80103f0c:	0f 84 76 ff ff ff    	je     80103e88 <procdump+0x18>
        cprintf(" %p", pc[i]);
80103f12:	89 54 24 04          	mov    %edx,0x4(%esp)
80103f16:	83 c7 04             	add    $0x4,%edi
80103f19:	c7 04 24 61 6e 10 80 	movl   $0x80106e61,(%esp)
80103f20:	e8 2b c7 ff ff       	call   80100650 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
80103f25:	39 f7                	cmp    %esi,%edi
80103f27:	75 df                	jne    80103f08 <procdump+0x98>
80103f29:	e9 5a ff ff ff       	jmp    80103e88 <procdump+0x18>
80103f2e:	66 90                	xchg   %ax,%ax
  }
80103f30:	83 c4 4c             	add    $0x4c,%esp
80103f33:	5b                   	pop    %ebx
80103f34:	5e                   	pop    %esi
80103f35:	5f                   	pop    %edi
80103f36:	5d                   	pop    %ebp
80103f37:	c3                   	ret    
80103f38:	66 90                	xchg   %ax,%ax
80103f3a:	66 90                	xchg   %ax,%ax
80103f3c:	66 90                	xchg   %ax,%ax
80103f3e:	66 90                	xchg   %ax,%ax

80103f40 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80103f40:	55                   	push   %ebp
80103f41:	89 e5                	mov    %esp,%ebp
80103f43:	53                   	push   %ebx
80103f44:	83 ec 14             	sub    $0x14,%esp
80103f47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
80103f4a:	c7 44 24 04 98 74 10 	movl   $0x80107498,0x4(%esp)
80103f51:	80 
80103f52:	8d 43 04             	lea    0x4(%ebx),%eax
80103f55:	89 04 24             	mov    %eax,(%esp)
80103f58:	e8 f3 00 00 00       	call   80104050 <initlock>
  lk->name = name;
80103f5d:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
80103f60:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80103f66:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
80103f6d:	89 43 38             	mov    %eax,0x38(%ebx)
}
80103f70:	83 c4 14             	add    $0x14,%esp
80103f73:	5b                   	pop    %ebx
80103f74:	5d                   	pop    %ebp
80103f75:	c3                   	ret    
80103f76:	8d 76 00             	lea    0x0(%esi),%esi
80103f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f80 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80103f80:	55                   	push   %ebp
80103f81:	89 e5                	mov    %esp,%ebp
80103f83:	56                   	push   %esi
80103f84:	53                   	push   %ebx
80103f85:	83 ec 10             	sub    $0x10,%esp
80103f88:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80103f8b:	8d 73 04             	lea    0x4(%ebx),%esi
80103f8e:	89 34 24             	mov    %esi,(%esp)
80103f91:	e8 aa 01 00 00       	call   80104140 <acquire>
  while (lk->locked) {
80103f96:	8b 13                	mov    (%ebx),%edx
80103f98:	85 d2                	test   %edx,%edx
80103f9a:	74 16                	je     80103fb2 <acquiresleep+0x32>
80103f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sleep(lk, &lk->lk);
80103fa0:	89 74 24 04          	mov    %esi,0x4(%esp)
80103fa4:	89 1c 24             	mov    %ebx,(%esp)
80103fa7:	e8 54 fc ff ff       	call   80103c00 <sleep>
  while (lk->locked) {
80103fac:	8b 03                	mov    (%ebx),%eax
80103fae:	85 c0                	test   %eax,%eax
80103fb0:	75 ee                	jne    80103fa0 <acquiresleep+0x20>
  }
  lk->locked = 1;
80103fb2:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80103fb8:	e8 e3 f6 ff ff       	call   801036a0 <myproc>
80103fbd:	8b 40 10             	mov    0x10(%eax),%eax
80103fc0:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80103fc3:	89 75 08             	mov    %esi,0x8(%ebp)
}
80103fc6:	83 c4 10             	add    $0x10,%esp
80103fc9:	5b                   	pop    %ebx
80103fca:	5e                   	pop    %esi
80103fcb:	5d                   	pop    %ebp
  release(&lk->lk);
80103fcc:	e9 5f 02 00 00       	jmp    80104230 <release>
80103fd1:	eb 0d                	jmp    80103fe0 <releasesleep>
80103fd3:	90                   	nop
80103fd4:	90                   	nop
80103fd5:	90                   	nop
80103fd6:	90                   	nop
80103fd7:	90                   	nop
80103fd8:	90                   	nop
80103fd9:	90                   	nop
80103fda:	90                   	nop
80103fdb:	90                   	nop
80103fdc:	90                   	nop
80103fdd:	90                   	nop
80103fde:	90                   	nop
80103fdf:	90                   	nop

80103fe0 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80103fe0:	55                   	push   %ebp
80103fe1:	89 e5                	mov    %esp,%ebp
80103fe3:	56                   	push   %esi
80103fe4:	53                   	push   %ebx
80103fe5:	83 ec 10             	sub    $0x10,%esp
80103fe8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80103feb:	8d 73 04             	lea    0x4(%ebx),%esi
80103fee:	89 34 24             	mov    %esi,(%esp)
80103ff1:	e8 4a 01 00 00       	call   80104140 <acquire>
  lk->locked = 0;
80103ff6:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80103ffc:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104003:	89 1c 24             	mov    %ebx,(%esp)
80104006:	e8 85 fd ff ff       	call   80103d90 <wakeup>
  release(&lk->lk);
8010400b:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010400e:	83 c4 10             	add    $0x10,%esp
80104011:	5b                   	pop    %ebx
80104012:	5e                   	pop    %esi
80104013:	5d                   	pop    %ebp
  release(&lk->lk);
80104014:	e9 17 02 00 00       	jmp    80104230 <release>
80104019:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104020 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104020:	55                   	push   %ebp
80104021:	89 e5                	mov    %esp,%ebp
80104023:	56                   	push   %esi
80104024:	53                   	push   %ebx
80104025:	83 ec 10             	sub    $0x10,%esp
80104028:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010402b:	8d 73 04             	lea    0x4(%ebx),%esi
8010402e:	89 34 24             	mov    %esi,(%esp)
80104031:	e8 0a 01 00 00       	call   80104140 <acquire>
  r = lk->locked;
80104036:	8b 1b                	mov    (%ebx),%ebx
  release(&lk->lk);
80104038:	89 34 24             	mov    %esi,(%esp)
8010403b:	e8 f0 01 00 00       	call   80104230 <release>
  return r;
}
80104040:	83 c4 10             	add    $0x10,%esp
80104043:	89 d8                	mov    %ebx,%eax
80104045:	5b                   	pop    %ebx
80104046:	5e                   	pop    %esi
80104047:	5d                   	pop    %ebp
80104048:	c3                   	ret    
80104049:	66 90                	xchg   %ax,%ax
8010404b:	66 90                	xchg   %ax,%ax
8010404d:	66 90                	xchg   %ax,%ax
8010404f:	90                   	nop

80104050 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104050:	55                   	push   %ebp
80104051:	89 e5                	mov    %esp,%ebp
80104053:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104056:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104059:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
8010405f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
80104062:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104069:	5d                   	pop    %ebp
8010406a:	c3                   	ret    
8010406b:	90                   	nop
8010406c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104070 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104070:	55                   	push   %ebp
80104071:	89 e5                	mov    %esp,%ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104073:	8b 45 08             	mov    0x8(%ebp),%eax
{
80104076:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104079:	53                   	push   %ebx
  ebp = (uint*)v - 2;
8010407a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010407d:	31 c0                	xor    %eax,%eax
8010407f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104080:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104086:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010408c:	77 1a                	ja     801040a8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010408e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104091:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
  for(i = 0; i < 10; i++){
80104094:	83 c0 01             	add    $0x1,%eax
    ebp = (uint*)ebp[0]; // saved %ebp
80104097:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
80104099:	83 f8 0a             	cmp    $0xa,%eax
8010409c:	75 e2                	jne    80104080 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010409e:	5b                   	pop    %ebx
8010409f:	5d                   	pop    %ebp
801040a0:	c3                   	ret    
801040a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    pcs[i] = 0;
801040a8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
801040af:	83 c0 01             	add    $0x1,%eax
801040b2:	83 f8 0a             	cmp    $0xa,%eax
801040b5:	74 e7                	je     8010409e <getcallerpcs+0x2e>
    pcs[i] = 0;
801040b7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
801040be:	83 c0 01             	add    $0x1,%eax
801040c1:	83 f8 0a             	cmp    $0xa,%eax
801040c4:	75 e2                	jne    801040a8 <getcallerpcs+0x38>
801040c6:	eb d6                	jmp    8010409e <getcallerpcs+0x2e>
801040c8:	90                   	nop
801040c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801040d0 <holding>:

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
801040d0:	55                   	push   %ebp
  return lock->locked && lock->cpu == mycpu();
801040d1:	31 c0                	xor    %eax,%eax
{
801040d3:	89 e5                	mov    %esp,%ebp
801040d5:	53                   	push   %ebx
801040d6:	83 ec 04             	sub    $0x4,%esp
801040d9:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == mycpu();
801040dc:	8b 0a                	mov    (%edx),%ecx
801040de:	85 c9                	test   %ecx,%ecx
801040e0:	74 10                	je     801040f2 <holding+0x22>
801040e2:	8b 5a 08             	mov    0x8(%edx),%ebx
801040e5:	e8 16 f5 ff ff       	call   80103600 <mycpu>
801040ea:	39 c3                	cmp    %eax,%ebx
801040ec:	0f 94 c0             	sete   %al
801040ef:	0f b6 c0             	movzbl %al,%eax
}
801040f2:	83 c4 04             	add    $0x4,%esp
801040f5:	5b                   	pop    %ebx
801040f6:	5d                   	pop    %ebp
801040f7:	c3                   	ret    
801040f8:	90                   	nop
801040f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104100 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104100:	55                   	push   %ebp
80104101:	89 e5                	mov    %esp,%ebp
80104103:	53                   	push   %ebx
80104104:	83 ec 04             	sub    $0x4,%esp
80104107:	9c                   	pushf  
80104108:	5b                   	pop    %ebx
  asm volatile("cli");
80104109:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010410a:	e8 f1 f4 ff ff       	call   80103600 <mycpu>
8010410f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104115:	85 c0                	test   %eax,%eax
80104117:	75 11                	jne    8010412a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104119:	e8 e2 f4 ff ff       	call   80103600 <mycpu>
8010411e:	81 e3 00 02 00 00    	and    $0x200,%ebx
80104124:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010412a:	e8 d1 f4 ff ff       	call   80103600 <mycpu>
8010412f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104136:	83 c4 04             	add    $0x4,%esp
80104139:	5b                   	pop    %ebx
8010413a:	5d                   	pop    %ebp
8010413b:	c3                   	ret    
8010413c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104140 <acquire>:
{
80104140:	55                   	push   %ebp
80104141:	89 e5                	mov    %esp,%ebp
80104143:	53                   	push   %ebx
80104144:	83 ec 14             	sub    $0x14,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104147:	e8 b4 ff ff ff       	call   80104100 <pushcli>
  if(holding(lk))
8010414c:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == mycpu();
8010414f:	8b 02                	mov    (%edx),%eax
80104151:	85 c0                	test   %eax,%eax
80104153:	75 43                	jne    80104198 <acquire+0x58>
  asm volatile("lock; xchgl %0, %1" :
80104155:	b9 01 00 00 00       	mov    $0x1,%ecx
8010415a:	eb 07                	jmp    80104163 <acquire+0x23>
8010415c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104160:	8b 55 08             	mov    0x8(%ebp),%edx
80104163:	89 c8                	mov    %ecx,%eax
80104165:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lk->locked, 1) != 0)
80104168:	85 c0                	test   %eax,%eax
8010416a:	75 f4                	jne    80104160 <acquire+0x20>
  __sync_synchronize();
8010416c:	0f ae f0             	mfence 
  lk->cpu = mycpu();
8010416f:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104172:	e8 89 f4 ff ff       	call   80103600 <mycpu>
80104177:	89 43 08             	mov    %eax,0x8(%ebx)
  getcallerpcs(&lk, lk->pcs);
8010417a:	8b 45 08             	mov    0x8(%ebp),%eax
8010417d:	83 c0 0c             	add    $0xc,%eax
80104180:	89 44 24 04          	mov    %eax,0x4(%esp)
80104184:	8d 45 08             	lea    0x8(%ebp),%eax
80104187:	89 04 24             	mov    %eax,(%esp)
8010418a:	e8 e1 fe ff ff       	call   80104070 <getcallerpcs>
}
8010418f:	83 c4 14             	add    $0x14,%esp
80104192:	5b                   	pop    %ebx
80104193:	5d                   	pop    %ebp
80104194:	c3                   	ret    
80104195:	8d 76 00             	lea    0x0(%esi),%esi
  return lock->locked && lock->cpu == mycpu();
80104198:	8b 5a 08             	mov    0x8(%edx),%ebx
8010419b:	e8 60 f4 ff ff       	call   80103600 <mycpu>
  if(holding(lk))
801041a0:	39 c3                	cmp    %eax,%ebx
801041a2:	74 05                	je     801041a9 <acquire+0x69>
801041a4:	8b 55 08             	mov    0x8(%ebp),%edx
801041a7:	eb ac                	jmp    80104155 <acquire+0x15>
    panic("acquire");
801041a9:	c7 04 24 a3 74 10 80 	movl   $0x801074a3,(%esp)
801041b0:	e8 ab c1 ff ff       	call   80100360 <panic>
801041b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801041b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041c0 <popcli>:

void
popcli(void)
{
801041c0:	55                   	push   %ebp
801041c1:	89 e5                	mov    %esp,%ebp
801041c3:	83 ec 18             	sub    $0x18,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801041c6:	9c                   	pushf  
801041c7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801041c8:	f6 c4 02             	test   $0x2,%ah
801041cb:	75 49                	jne    80104216 <popcli+0x56>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
801041cd:	e8 2e f4 ff ff       	call   80103600 <mycpu>
801041d2:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
801041d8:	8d 51 ff             	lea    -0x1(%ecx),%edx
801041db:	85 d2                	test   %edx,%edx
801041dd:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
801041e3:	78 25                	js     8010420a <popcli+0x4a>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801041e5:	e8 16 f4 ff ff       	call   80103600 <mycpu>
801041ea:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801041f0:	85 d2                	test   %edx,%edx
801041f2:	74 04                	je     801041f8 <popcli+0x38>
    sti();
}
801041f4:	c9                   	leave  
801041f5:	c3                   	ret    
801041f6:	66 90                	xchg   %ax,%ax
  if(mycpu()->ncli == 0 && mycpu()->intena)
801041f8:	e8 03 f4 ff ff       	call   80103600 <mycpu>
801041fd:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
80104203:	85 c0                	test   %eax,%eax
80104205:	74 ed                	je     801041f4 <popcli+0x34>
  asm volatile("sti");
80104207:	fb                   	sti    
}
80104208:	c9                   	leave  
80104209:	c3                   	ret    
    panic("popcli");
8010420a:	c7 04 24 c2 74 10 80 	movl   $0x801074c2,(%esp)
80104211:	e8 4a c1 ff ff       	call   80100360 <panic>
    panic("popcli - interruptible");
80104216:	c7 04 24 ab 74 10 80 	movl   $0x801074ab,(%esp)
8010421d:	e8 3e c1 ff ff       	call   80100360 <panic>
80104222:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104230 <release>:
{
80104230:	55                   	push   %ebp
80104231:	89 e5                	mov    %esp,%ebp
80104233:	56                   	push   %esi
80104234:	53                   	push   %ebx
80104235:	83 ec 10             	sub    $0x10,%esp
80104238:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return lock->locked && lock->cpu == mycpu();
8010423b:	8b 03                	mov    (%ebx),%eax
8010423d:	85 c0                	test   %eax,%eax
8010423f:	75 0f                	jne    80104250 <release+0x20>
    panic("release");
80104241:	c7 04 24 c9 74 10 80 	movl   $0x801074c9,(%esp)
80104248:	e8 13 c1 ff ff       	call   80100360 <panic>
8010424d:	8d 76 00             	lea    0x0(%esi),%esi
  return lock->locked && lock->cpu == mycpu();
80104250:	8b 73 08             	mov    0x8(%ebx),%esi
80104253:	e8 a8 f3 ff ff       	call   80103600 <mycpu>
  if(!holding(lk))
80104258:	39 c6                	cmp    %eax,%esi
8010425a:	75 e5                	jne    80104241 <release+0x11>
  lk->pcs[0] = 0;
8010425c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80104263:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
8010426a:	0f ae f0             	mfence 
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010426d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
80104273:	83 c4 10             	add    $0x10,%esp
80104276:	5b                   	pop    %ebx
80104277:	5e                   	pop    %esi
80104278:	5d                   	pop    %ebp
  popcli();
80104279:	e9 42 ff ff ff       	jmp    801041c0 <popcli>
8010427e:	66 90                	xchg   %ax,%ax

80104280 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104280:	55                   	push   %ebp
80104281:	89 e5                	mov    %esp,%ebp
80104283:	8b 55 08             	mov    0x8(%ebp),%edx
80104286:	57                   	push   %edi
80104287:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010428a:	53                   	push   %ebx
  if ((int)dst%4 == 0 && n%4 == 0){
8010428b:	f6 c2 03             	test   $0x3,%dl
8010428e:	75 05                	jne    80104295 <memset+0x15>
80104290:	f6 c1 03             	test   $0x3,%cl
80104293:	74 13                	je     801042a8 <memset+0x28>
  asm volatile("cld; rep stosb" :
80104295:	89 d7                	mov    %edx,%edi
80104297:	8b 45 0c             	mov    0xc(%ebp),%eax
8010429a:	fc                   	cld    
8010429b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010429d:	5b                   	pop    %ebx
8010429e:	89 d0                	mov    %edx,%eax
801042a0:	5f                   	pop    %edi
801042a1:	5d                   	pop    %ebp
801042a2:	c3                   	ret    
801042a3:	90                   	nop
801042a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
801042a8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
801042ac:	c1 e9 02             	shr    $0x2,%ecx
801042af:	89 f8                	mov    %edi,%eax
801042b1:	89 fb                	mov    %edi,%ebx
801042b3:	c1 e0 18             	shl    $0x18,%eax
801042b6:	c1 e3 10             	shl    $0x10,%ebx
801042b9:	09 d8                	or     %ebx,%eax
801042bb:	09 f8                	or     %edi,%eax
801042bd:	c1 e7 08             	shl    $0x8,%edi
801042c0:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
801042c2:	89 d7                	mov    %edx,%edi
801042c4:	fc                   	cld    
801042c5:	f3 ab                	rep stos %eax,%es:(%edi)
}
801042c7:	5b                   	pop    %ebx
801042c8:	89 d0                	mov    %edx,%eax
801042ca:	5f                   	pop    %edi
801042cb:	5d                   	pop    %ebp
801042cc:	c3                   	ret    
801042cd:	8d 76 00             	lea    0x0(%esi),%esi

801042d0 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
801042d0:	55                   	push   %ebp
801042d1:	89 e5                	mov    %esp,%ebp
801042d3:	8b 45 10             	mov    0x10(%ebp),%eax
801042d6:	57                   	push   %edi
801042d7:	56                   	push   %esi
801042d8:	8b 75 0c             	mov    0xc(%ebp),%esi
801042db:	53                   	push   %ebx
801042dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801042df:	85 c0                	test   %eax,%eax
801042e1:	8d 78 ff             	lea    -0x1(%eax),%edi
801042e4:	74 26                	je     8010430c <memcmp+0x3c>
    if(*s1 != *s2)
801042e6:	0f b6 03             	movzbl (%ebx),%eax
801042e9:	31 d2                	xor    %edx,%edx
801042eb:	0f b6 0e             	movzbl (%esi),%ecx
801042ee:	38 c8                	cmp    %cl,%al
801042f0:	74 16                	je     80104308 <memcmp+0x38>
801042f2:	eb 24                	jmp    80104318 <memcmp+0x48>
801042f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801042f8:	0f b6 44 13 01       	movzbl 0x1(%ebx,%edx,1),%eax
801042fd:	83 c2 01             	add    $0x1,%edx
80104300:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104304:	38 c8                	cmp    %cl,%al
80104306:	75 10                	jne    80104318 <memcmp+0x48>
  while(n-- > 0){
80104308:	39 fa                	cmp    %edi,%edx
8010430a:	75 ec                	jne    801042f8 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
8010430c:	5b                   	pop    %ebx
  return 0;
8010430d:	31 c0                	xor    %eax,%eax
}
8010430f:	5e                   	pop    %esi
80104310:	5f                   	pop    %edi
80104311:	5d                   	pop    %ebp
80104312:	c3                   	ret    
80104313:	90                   	nop
80104314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104318:	5b                   	pop    %ebx
      return *s1 - *s2;
80104319:	29 c8                	sub    %ecx,%eax
}
8010431b:	5e                   	pop    %esi
8010431c:	5f                   	pop    %edi
8010431d:	5d                   	pop    %ebp
8010431e:	c3                   	ret    
8010431f:	90                   	nop

80104320 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	57                   	push   %edi
80104324:	8b 45 08             	mov    0x8(%ebp),%eax
80104327:	56                   	push   %esi
80104328:	8b 75 0c             	mov    0xc(%ebp),%esi
8010432b:	53                   	push   %ebx
8010432c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
8010432f:	39 c6                	cmp    %eax,%esi
80104331:	73 35                	jae    80104368 <memmove+0x48>
80104333:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104336:	39 c8                	cmp    %ecx,%eax
80104338:	73 2e                	jae    80104368 <memmove+0x48>
    s += n;
    d += n;
    while(n-- > 0)
8010433a:	85 db                	test   %ebx,%ebx
    d += n;
8010433c:	8d 3c 18             	lea    (%eax,%ebx,1),%edi
    while(n-- > 0)
8010433f:	8d 53 ff             	lea    -0x1(%ebx),%edx
80104342:	74 1b                	je     8010435f <memmove+0x3f>
80104344:	f7 db                	neg    %ebx
80104346:	8d 34 19             	lea    (%ecx,%ebx,1),%esi
80104349:	01 fb                	add    %edi,%ebx
8010434b:	90                   	nop
8010434c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *--d = *--s;
80104350:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104354:	88 0c 13             	mov    %cl,(%ebx,%edx,1)
    while(n-- > 0)
80104357:	83 ea 01             	sub    $0x1,%edx
8010435a:	83 fa ff             	cmp    $0xffffffff,%edx
8010435d:	75 f1                	jne    80104350 <memmove+0x30>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
8010435f:	5b                   	pop    %ebx
80104360:	5e                   	pop    %esi
80104361:	5f                   	pop    %edi
80104362:	5d                   	pop    %ebp
80104363:	c3                   	ret    
80104364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
80104368:	31 d2                	xor    %edx,%edx
8010436a:	85 db                	test   %ebx,%ebx
8010436c:	74 f1                	je     8010435f <memmove+0x3f>
8010436e:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
80104370:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104374:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104377:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
8010437a:	39 da                	cmp    %ebx,%edx
8010437c:	75 f2                	jne    80104370 <memmove+0x50>
}
8010437e:	5b                   	pop    %ebx
8010437f:	5e                   	pop    %esi
80104380:	5f                   	pop    %edi
80104381:	5d                   	pop    %ebp
80104382:	c3                   	ret    
80104383:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104390 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104390:	55                   	push   %ebp
80104391:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104393:	5d                   	pop    %ebp
  return memmove(dst, src, n);
80104394:	eb 8a                	jmp    80104320 <memmove>
80104396:	8d 76 00             	lea    0x0(%esi),%esi
80104399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043a0 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	56                   	push   %esi
801043a4:	8b 75 10             	mov    0x10(%ebp),%esi
801043a7:	53                   	push   %ebx
801043a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
801043ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(n > 0 && *p && *p == *q)
801043ae:	85 f6                	test   %esi,%esi
801043b0:	74 30                	je     801043e2 <strncmp+0x42>
801043b2:	0f b6 01             	movzbl (%ecx),%eax
801043b5:	84 c0                	test   %al,%al
801043b7:	74 2f                	je     801043e8 <strncmp+0x48>
801043b9:	0f b6 13             	movzbl (%ebx),%edx
801043bc:	38 d0                	cmp    %dl,%al
801043be:	75 46                	jne    80104406 <strncmp+0x66>
801043c0:	8d 51 01             	lea    0x1(%ecx),%edx
801043c3:	01 ce                	add    %ecx,%esi
801043c5:	eb 14                	jmp    801043db <strncmp+0x3b>
801043c7:	90                   	nop
801043c8:	0f b6 02             	movzbl (%edx),%eax
801043cb:	84 c0                	test   %al,%al
801043cd:	74 31                	je     80104400 <strncmp+0x60>
801043cf:	0f b6 19             	movzbl (%ecx),%ebx
801043d2:	83 c2 01             	add    $0x1,%edx
801043d5:	38 d8                	cmp    %bl,%al
801043d7:	75 17                	jne    801043f0 <strncmp+0x50>
    n--, p++, q++;
801043d9:	89 cb                	mov    %ecx,%ebx
  while(n > 0 && *p && *p == *q)
801043db:	39 f2                	cmp    %esi,%edx
    n--, p++, q++;
801043dd:	8d 4b 01             	lea    0x1(%ebx),%ecx
  while(n > 0 && *p && *p == *q)
801043e0:	75 e6                	jne    801043c8 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
801043e2:	5b                   	pop    %ebx
    return 0;
801043e3:	31 c0                	xor    %eax,%eax
}
801043e5:	5e                   	pop    %esi
801043e6:	5d                   	pop    %ebp
801043e7:	c3                   	ret    
801043e8:	0f b6 1b             	movzbl (%ebx),%ebx
  while(n > 0 && *p && *p == *q)
801043eb:	31 c0                	xor    %eax,%eax
801043ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
801043f0:	0f b6 d3             	movzbl %bl,%edx
801043f3:	29 d0                	sub    %edx,%eax
}
801043f5:	5b                   	pop    %ebx
801043f6:	5e                   	pop    %esi
801043f7:	5d                   	pop    %ebp
801043f8:	c3                   	ret    
801043f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104400:	0f b6 5b 01          	movzbl 0x1(%ebx),%ebx
80104404:	eb ea                	jmp    801043f0 <strncmp+0x50>
  while(n > 0 && *p && *p == *q)
80104406:	89 d3                	mov    %edx,%ebx
80104408:	eb e6                	jmp    801043f0 <strncmp+0x50>
8010440a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104410 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	8b 45 08             	mov    0x8(%ebp),%eax
80104416:	56                   	push   %esi
80104417:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010441a:	53                   	push   %ebx
8010441b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
8010441e:	89 c2                	mov    %eax,%edx
80104420:	eb 19                	jmp    8010443b <strncpy+0x2b>
80104422:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104428:	83 c3 01             	add    $0x1,%ebx
8010442b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010442f:	83 c2 01             	add    $0x1,%edx
80104432:	84 c9                	test   %cl,%cl
80104434:	88 4a ff             	mov    %cl,-0x1(%edx)
80104437:	74 09                	je     80104442 <strncpy+0x32>
80104439:	89 f1                	mov    %esi,%ecx
8010443b:	85 c9                	test   %ecx,%ecx
8010443d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104440:	7f e6                	jg     80104428 <strncpy+0x18>
    ;
  while(n-- > 0)
80104442:	31 c9                	xor    %ecx,%ecx
80104444:	85 f6                	test   %esi,%esi
80104446:	7e 0f                	jle    80104457 <strncpy+0x47>
    *s++ = 0;
80104448:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
8010444c:	89 f3                	mov    %esi,%ebx
8010444e:	83 c1 01             	add    $0x1,%ecx
80104451:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
80104453:	85 db                	test   %ebx,%ebx
80104455:	7f f1                	jg     80104448 <strncpy+0x38>
  return os;
}
80104457:	5b                   	pop    %ebx
80104458:	5e                   	pop    %esi
80104459:	5d                   	pop    %ebp
8010445a:	c3                   	ret    
8010445b:	90                   	nop
8010445c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104460 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104460:	55                   	push   %ebp
80104461:	89 e5                	mov    %esp,%ebp
80104463:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104466:	56                   	push   %esi
80104467:	8b 45 08             	mov    0x8(%ebp),%eax
8010446a:	53                   	push   %ebx
8010446b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
8010446e:	85 c9                	test   %ecx,%ecx
80104470:	7e 26                	jle    80104498 <safestrcpy+0x38>
80104472:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104476:	89 c1                	mov    %eax,%ecx
80104478:	eb 17                	jmp    80104491 <safestrcpy+0x31>
8010447a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104480:	83 c2 01             	add    $0x1,%edx
80104483:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104487:	83 c1 01             	add    $0x1,%ecx
8010448a:	84 db                	test   %bl,%bl
8010448c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010448f:	74 04                	je     80104495 <safestrcpy+0x35>
80104491:	39 f2                	cmp    %esi,%edx
80104493:	75 eb                	jne    80104480 <safestrcpy+0x20>
    ;
  *s = 0;
80104495:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104498:	5b                   	pop    %ebx
80104499:	5e                   	pop    %esi
8010449a:	5d                   	pop    %ebp
8010449b:	c3                   	ret    
8010449c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801044a0 <strlen>:

int
strlen(const char *s)
{
801044a0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
801044a1:	31 c0                	xor    %eax,%eax
{
801044a3:	89 e5                	mov    %esp,%ebp
801044a5:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
801044a8:	80 3a 00             	cmpb   $0x0,(%edx)
801044ab:	74 0c                	je     801044b9 <strlen+0x19>
801044ad:	8d 76 00             	lea    0x0(%esi),%esi
801044b0:	83 c0 01             	add    $0x1,%eax
801044b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801044b7:	75 f7                	jne    801044b0 <strlen+0x10>
    ;
  return n;
}
801044b9:	5d                   	pop    %ebp
801044ba:	c3                   	ret    

801044bb <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
801044bb:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
801044bf:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
801044c3:	55                   	push   %ebp
  pushl %ebx
801044c4:	53                   	push   %ebx
  pushl %esi
801044c5:	56                   	push   %esi
  pushl %edi
801044c6:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
801044c7:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
801044c9:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
801044cb:	5f                   	pop    %edi
  popl %esi
801044cc:	5e                   	pop    %esi
  popl %ebx
801044cd:	5b                   	pop    %ebx
  popl %ebp
801044ce:	5d                   	pop    %ebp
  ret
801044cf:	c3                   	ret    

801044d0 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801044d0:	55                   	push   %ebp
801044d1:	89 e5                	mov    %esp,%ebp
801044d3:	8b 45 08             	mov    0x8(%ebp),%eax
  // ** changed range from sz to KERNBASE
  if(addr >= KERNBASE|| addr+4 > KERNBASE ) 
801044d6:	3d fc ff ff 7f       	cmp    $0x7ffffffc,%eax
801044db:	77 0b                	ja     801044e8 <fetchint+0x18>
    return -1;

  *ip = *(int*)(addr);
801044dd:	8b 10                	mov    (%eax),%edx
801044df:	8b 45 0c             	mov    0xc(%ebp),%eax
801044e2:	89 10                	mov    %edx,(%eax)
  return 0;
801044e4:	31 c0                	xor    %eax,%eax
}
801044e6:	5d                   	pop    %ebp
801044e7:	c3                   	ret    
    return -1;
801044e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801044ed:	5d                   	pop    %ebp
801044ee:	c3                   	ret    
801044ef:	90                   	nop

801044f0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801044f0:	55                   	push   %ebp
801044f1:	89 e5                	mov    %esp,%ebp
801044f3:	53                   	push   %ebx
801044f4:	83 ec 04             	sub    $0x4,%esp
801044f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
801044fa:	e8 a1 f1 ff ff       	call   801036a0 <myproc>
  if(addr >= KERNBASE)
801044ff:	85 db                	test   %ebx,%ebx
80104501:	78 26                	js     80104529 <fetchstr+0x39>
    return -1;
  *pp = (char*)addr;
80104503:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104506:	89 da                	mov    %ebx,%edx
80104508:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
8010450a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
8010450c:	39 c3                	cmp    %eax,%ebx
8010450e:	73 19                	jae    80104529 <fetchstr+0x39>
    if(*s == 0)
80104510:	80 3b 00             	cmpb   $0x0,(%ebx)
80104513:	75 0d                	jne    80104522 <fetchstr+0x32>
80104515:	eb 21                	jmp    80104538 <fetchstr+0x48>
80104517:	90                   	nop
80104518:	80 3a 00             	cmpb   $0x0,(%edx)
8010451b:	90                   	nop
8010451c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104520:	74 16                	je     80104538 <fetchstr+0x48>
  for(s = *pp; s < ep; s++){
80104522:	83 c2 01             	add    $0x1,%edx
80104525:	39 d0                	cmp    %edx,%eax
80104527:	77 ef                	ja     80104518 <fetchstr+0x28>
      return s - *pp;
  }
  return -1;
}
80104529:	83 c4 04             	add    $0x4,%esp
    return -1;
8010452c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104531:	5b                   	pop    %ebx
80104532:	5d                   	pop    %ebp
80104533:	c3                   	ret    
80104534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104538:	83 c4 04             	add    $0x4,%esp
      return s - *pp;
8010453b:	89 d0                	mov    %edx,%eax
8010453d:	29 d8                	sub    %ebx,%eax
}
8010453f:	5b                   	pop    %ebx
80104540:	5d                   	pop    %ebp
80104541:	c3                   	ret    
80104542:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104550 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104550:	55                   	push   %ebp
80104551:	89 e5                	mov    %esp,%ebp
80104553:	83 ec 08             	sub    $0x8,%esp
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104556:	e8 45 f1 ff ff       	call   801036a0 <myproc>
8010455b:	8b 55 08             	mov    0x8(%ebp),%edx
8010455e:	8b 40 18             	mov    0x18(%eax),%eax
80104561:	8b 40 44             	mov    0x44(%eax),%eax
80104564:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
  if(addr >= KERNBASE|| addr+4 > KERNBASE ) 
80104568:	3d fc ff ff 7f       	cmp    $0x7ffffffc,%eax
8010456d:	77 11                	ja     80104580 <argint+0x30>
  *ip = *(int*)(addr);
8010456f:	8b 10                	mov    (%eax),%edx
80104571:	8b 45 0c             	mov    0xc(%ebp),%eax
80104574:	89 10                	mov    %edx,(%eax)
  return 0;
80104576:	31 c0                	xor    %eax,%eax
}
80104578:	c9                   	leave  
80104579:	c3                   	ret    
8010457a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80104580:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104585:	c9                   	leave  
80104586:	c3                   	ret    
80104587:	89 f6                	mov    %esi,%esi
80104589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104590 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	53                   	push   %ebx
80104594:	83 ec 24             	sub    $0x24,%esp
80104597:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  
   // ** changed range from sz to KERNBASE 
  if(argint(n, &i) < 0)
8010459a:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010459d:	89 44 24 04          	mov    %eax,0x4(%esp)
801045a1:	8b 45 08             	mov    0x8(%ebp),%eax
801045a4:	89 04 24             	mov    %eax,(%esp)
801045a7:	e8 a4 ff ff ff       	call   80104550 <argint>
801045ac:	85 c0                	test   %eax,%eax
801045ae:	78 28                	js     801045d8 <argptr+0x48>
    return -1;
  if(size < 0 || (uint)i >= KERNBASE || (uint)i+size > KERNBASE)
801045b0:	85 db                	test   %ebx,%ebx
801045b2:	78 24                	js     801045d8 <argptr+0x48>
801045b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801045b7:	85 c0                	test   %eax,%eax
801045b9:	78 1d                	js     801045d8 <argptr+0x48>
801045bb:	01 c3                	add    %eax,%ebx
801045bd:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
801045c3:	77 13                	ja     801045d8 <argptr+0x48>
    return -1;
  *pp = (char*)i;
801045c5:	8b 55 0c             	mov    0xc(%ebp),%edx
801045c8:	89 02                	mov    %eax,(%edx)
  return 0;
801045ca:	31 c0                	xor    %eax,%eax
}
801045cc:	83 c4 24             	add    $0x24,%esp
801045cf:	5b                   	pop    %ebx
801045d0:	5d                   	pop    %ebp
801045d1:	c3                   	ret    
801045d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
801045d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801045dd:	eb ed                	jmp    801045cc <argptr+0x3c>
801045df:	90                   	nop

801045e0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	83 ec 28             	sub    $0x28,%esp
  int addr;
  if(argint(n, &addr) < 0)
801045e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801045e9:	89 44 24 04          	mov    %eax,0x4(%esp)
801045ed:	8b 45 08             	mov    0x8(%ebp),%eax
801045f0:	89 04 24             	mov    %eax,(%esp)
801045f3:	e8 58 ff ff ff       	call   80104550 <argint>
801045f8:	85 c0                	test   %eax,%eax
801045fa:	78 14                	js     80104610 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
801045fc:	8b 45 0c             	mov    0xc(%ebp),%eax
801045ff:	89 44 24 04          	mov    %eax,0x4(%esp)
80104603:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104606:	89 04 24             	mov    %eax,(%esp)
80104609:	e8 e2 fe ff ff       	call   801044f0 <fetchstr>
}
8010460e:	c9                   	leave  
8010460f:	c3                   	ret    
    return -1;
80104610:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104615:	c9                   	leave  
80104616:	c3                   	ret    
80104617:	89 f6                	mov    %esi,%esi
80104619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104620 <syscall>:
[SYS_shm_close] sys_shm_close
};

void
syscall(void)
{
80104620:	55                   	push   %ebp
80104621:	89 e5                	mov    %esp,%ebp
80104623:	56                   	push   %esi
80104624:	53                   	push   %ebx
80104625:	83 ec 10             	sub    $0x10,%esp
  int num;
  struct proc *curproc = myproc();
80104628:	e8 73 f0 ff ff       	call   801036a0 <myproc>

  num = curproc->tf->eax;
8010462d:	8b 70 18             	mov    0x18(%eax),%esi
  struct proc *curproc = myproc();
80104630:	89 c3                	mov    %eax,%ebx
  num = curproc->tf->eax;
80104632:	8b 46 1c             	mov    0x1c(%esi),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104635:	8d 50 ff             	lea    -0x1(%eax),%edx
80104638:	83 fa 16             	cmp    $0x16,%edx
8010463b:	77 1b                	ja     80104658 <syscall+0x38>
8010463d:	8b 14 85 00 75 10 80 	mov    -0x7fef8b00(,%eax,4),%edx
80104644:	85 d2                	test   %edx,%edx
80104646:	74 10                	je     80104658 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
80104648:	ff d2                	call   *%edx
8010464a:	89 46 1c             	mov    %eax,0x1c(%esi)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
8010464d:	83 c4 10             	add    $0x10,%esp
80104650:	5b                   	pop    %ebx
80104651:	5e                   	pop    %esi
80104652:	5d                   	pop    %ebp
80104653:	c3                   	ret    
80104654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%d %s: unknown sys call %d\n",
80104658:	89 44 24 0c          	mov    %eax,0xc(%esp)
            curproc->pid, curproc->name, num);
8010465c:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010465f:	89 44 24 08          	mov    %eax,0x8(%esp)
    cprintf("%d %s: unknown sys call %d\n",
80104663:	8b 43 10             	mov    0x10(%ebx),%eax
80104666:	c7 04 24 d1 74 10 80 	movl   $0x801074d1,(%esp)
8010466d:	89 44 24 04          	mov    %eax,0x4(%esp)
80104671:	e8 da bf ff ff       	call   80100650 <cprintf>
    curproc->tf->eax = -1;
80104676:	8b 43 18             	mov    0x18(%ebx),%eax
80104679:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104680:	83 c4 10             	add    $0x10,%esp
80104683:	5b                   	pop    %ebx
80104684:	5e                   	pop    %esi
80104685:	5d                   	pop    %ebp
80104686:	c3                   	ret    
80104687:	66 90                	xchg   %ax,%ax
80104689:	66 90                	xchg   %ax,%ax
8010468b:	66 90                	xchg   %ax,%ax
8010468d:	66 90                	xchg   %ax,%ax
8010468f:	90                   	nop

80104690 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	53                   	push   %ebx
80104694:	89 c3                	mov    %eax,%ebx
80104696:	83 ec 04             	sub    $0x4,%esp
  int fd;
  struct proc *curproc = myproc();
80104699:	e8 02 f0 ff ff       	call   801036a0 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
8010469e:	31 d2                	xor    %edx,%edx
    if(curproc->ofile[fd] == 0){
801046a0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801046a4:	85 c9                	test   %ecx,%ecx
801046a6:	74 18                	je     801046c0 <fdalloc+0x30>
  for(fd = 0; fd < NOFILE; fd++){
801046a8:	83 c2 01             	add    $0x1,%edx
801046ab:	83 fa 10             	cmp    $0x10,%edx
801046ae:	75 f0                	jne    801046a0 <fdalloc+0x10>
      curproc->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
}
801046b0:	83 c4 04             	add    $0x4,%esp
  return -1;
801046b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801046b8:	5b                   	pop    %ebx
801046b9:	5d                   	pop    %ebp
801046ba:	c3                   	ret    
801046bb:	90                   	nop
801046bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      curproc->ofile[fd] = f;
801046c0:	89 5c 90 28          	mov    %ebx,0x28(%eax,%edx,4)
}
801046c4:	83 c4 04             	add    $0x4,%esp
      return fd;
801046c7:	89 d0                	mov    %edx,%eax
}
801046c9:	5b                   	pop    %ebx
801046ca:	5d                   	pop    %ebp
801046cb:	c3                   	ret    
801046cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046d0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	57                   	push   %edi
801046d4:	56                   	push   %esi
801046d5:	53                   	push   %ebx
801046d6:	83 ec 4c             	sub    $0x4c,%esp
801046d9:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801046dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801046df:	8d 5d da             	lea    -0x26(%ebp),%ebx
801046e2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801046e6:	89 04 24             	mov    %eax,(%esp)
{
801046e9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801046ec:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  if((dp = nameiparent(path, name)) == 0)
801046ef:	e8 2c d8 ff ff       	call   80101f20 <nameiparent>
801046f4:	85 c0                	test   %eax,%eax
801046f6:	89 c7                	mov    %eax,%edi
801046f8:	0f 84 da 00 00 00    	je     801047d8 <create+0x108>
    return 0;
  ilock(dp);
801046fe:	89 04 24             	mov    %eax,(%esp)
80104701:	e8 aa cf ff ff       	call   801016b0 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104706:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104709:	89 44 24 08          	mov    %eax,0x8(%esp)
8010470d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104711:	89 3c 24             	mov    %edi,(%esp)
80104714:	e8 a7 d4 ff ff       	call   80101bc0 <dirlookup>
80104719:	85 c0                	test   %eax,%eax
8010471b:	89 c6                	mov    %eax,%esi
8010471d:	74 41                	je     80104760 <create+0x90>
    iunlockput(dp);
8010471f:	89 3c 24             	mov    %edi,(%esp)
80104722:	e8 e9 d1 ff ff       	call   80101910 <iunlockput>
    ilock(ip);
80104727:	89 34 24             	mov    %esi,(%esp)
8010472a:	e8 81 cf ff ff       	call   801016b0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
8010472f:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104734:	75 12                	jne    80104748 <create+0x78>
80104736:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
8010473b:	89 f0                	mov    %esi,%eax
8010473d:	75 09                	jne    80104748 <create+0x78>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
8010473f:	83 c4 4c             	add    $0x4c,%esp
80104742:	5b                   	pop    %ebx
80104743:	5e                   	pop    %esi
80104744:	5f                   	pop    %edi
80104745:	5d                   	pop    %ebp
80104746:	c3                   	ret    
80104747:	90                   	nop
    iunlockput(ip);
80104748:	89 34 24             	mov    %esi,(%esp)
8010474b:	e8 c0 d1 ff ff       	call   80101910 <iunlockput>
}
80104750:	83 c4 4c             	add    $0x4c,%esp
    return 0;
80104753:	31 c0                	xor    %eax,%eax
}
80104755:	5b                   	pop    %ebx
80104756:	5e                   	pop    %esi
80104757:	5f                   	pop    %edi
80104758:	5d                   	pop    %ebp
80104759:	c3                   	ret    
8010475a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if((ip = ialloc(dp->dev, type)) == 0)
80104760:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104764:	89 44 24 04          	mov    %eax,0x4(%esp)
80104768:	8b 07                	mov    (%edi),%eax
8010476a:	89 04 24             	mov    %eax,(%esp)
8010476d:	e8 ae cd ff ff       	call   80101520 <ialloc>
80104772:	85 c0                	test   %eax,%eax
80104774:	89 c6                	mov    %eax,%esi
80104776:	0f 84 bf 00 00 00    	je     8010483b <create+0x16b>
  ilock(ip);
8010477c:	89 04 24             	mov    %eax,(%esp)
8010477f:	e8 2c cf ff ff       	call   801016b0 <ilock>
  ip->major = major;
80104784:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104788:	66 89 46 52          	mov    %ax,0x52(%esi)
  ip->minor = minor;
8010478c:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104790:	66 89 46 54          	mov    %ax,0x54(%esi)
  ip->nlink = 1;
80104794:	b8 01 00 00 00       	mov    $0x1,%eax
80104799:	66 89 46 56          	mov    %ax,0x56(%esi)
  iupdate(ip);
8010479d:	89 34 24             	mov    %esi,(%esp)
801047a0:	e8 4b ce ff ff       	call   801015f0 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
801047a5:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
801047aa:	74 34                	je     801047e0 <create+0x110>
  if(dirlink(dp, name, ip->inum) < 0)
801047ac:	8b 46 04             	mov    0x4(%esi),%eax
801047af:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801047b3:	89 3c 24             	mov    %edi,(%esp)
801047b6:	89 44 24 08          	mov    %eax,0x8(%esp)
801047ba:	e8 61 d6 ff ff       	call   80101e20 <dirlink>
801047bf:	85 c0                	test   %eax,%eax
801047c1:	78 6c                	js     8010482f <create+0x15f>
  iunlockput(dp);
801047c3:	89 3c 24             	mov    %edi,(%esp)
801047c6:	e8 45 d1 ff ff       	call   80101910 <iunlockput>
}
801047cb:	83 c4 4c             	add    $0x4c,%esp
  return ip;
801047ce:	89 f0                	mov    %esi,%eax
}
801047d0:	5b                   	pop    %ebx
801047d1:	5e                   	pop    %esi
801047d2:	5f                   	pop    %edi
801047d3:	5d                   	pop    %ebp
801047d4:	c3                   	ret    
801047d5:	8d 76 00             	lea    0x0(%esi),%esi
    return 0;
801047d8:	31 c0                	xor    %eax,%eax
801047da:	e9 60 ff ff ff       	jmp    8010473f <create+0x6f>
801047df:	90                   	nop
    dp->nlink++;  // for ".."
801047e0:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
801047e5:	89 3c 24             	mov    %edi,(%esp)
801047e8:	e8 03 ce ff ff       	call   801015f0 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
801047ed:	8b 46 04             	mov    0x4(%esi),%eax
801047f0:	c7 44 24 04 7c 75 10 	movl   $0x8010757c,0x4(%esp)
801047f7:	80 
801047f8:	89 34 24             	mov    %esi,(%esp)
801047fb:	89 44 24 08          	mov    %eax,0x8(%esp)
801047ff:	e8 1c d6 ff ff       	call   80101e20 <dirlink>
80104804:	85 c0                	test   %eax,%eax
80104806:	78 1b                	js     80104823 <create+0x153>
80104808:	8b 47 04             	mov    0x4(%edi),%eax
8010480b:	c7 44 24 04 7b 75 10 	movl   $0x8010757b,0x4(%esp)
80104812:	80 
80104813:	89 34 24             	mov    %esi,(%esp)
80104816:	89 44 24 08          	mov    %eax,0x8(%esp)
8010481a:	e8 01 d6 ff ff       	call   80101e20 <dirlink>
8010481f:	85 c0                	test   %eax,%eax
80104821:	79 89                	jns    801047ac <create+0xdc>
      panic("create dots");
80104823:	c7 04 24 6f 75 10 80 	movl   $0x8010756f,(%esp)
8010482a:	e8 31 bb ff ff       	call   80100360 <panic>
    panic("create: dirlink");
8010482f:	c7 04 24 7e 75 10 80 	movl   $0x8010757e,(%esp)
80104836:	e8 25 bb ff ff       	call   80100360 <panic>
    panic("create: ialloc");
8010483b:	c7 04 24 60 75 10 80 	movl   $0x80107560,(%esp)
80104842:	e8 19 bb ff ff       	call   80100360 <panic>
80104847:	89 f6                	mov    %esi,%esi
80104849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104850 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104850:	55                   	push   %ebp
80104851:	89 e5                	mov    %esp,%ebp
80104853:	56                   	push   %esi
80104854:	89 c6                	mov    %eax,%esi
80104856:	53                   	push   %ebx
80104857:	89 d3                	mov    %edx,%ebx
80104859:	83 ec 20             	sub    $0x20,%esp
  if(argint(n, &fd) < 0)
8010485c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010485f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104863:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010486a:	e8 e1 fc ff ff       	call   80104550 <argint>
8010486f:	85 c0                	test   %eax,%eax
80104871:	78 2d                	js     801048a0 <argfd.constprop.0+0x50>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104873:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104877:	77 27                	ja     801048a0 <argfd.constprop.0+0x50>
80104879:	e8 22 ee ff ff       	call   801036a0 <myproc>
8010487e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104881:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104885:	85 c0                	test   %eax,%eax
80104887:	74 17                	je     801048a0 <argfd.constprop.0+0x50>
  if(pfd)
80104889:	85 f6                	test   %esi,%esi
8010488b:	74 02                	je     8010488f <argfd.constprop.0+0x3f>
    *pfd = fd;
8010488d:	89 16                	mov    %edx,(%esi)
  if(pf)
8010488f:	85 db                	test   %ebx,%ebx
80104891:	74 1d                	je     801048b0 <argfd.constprop.0+0x60>
    *pf = f;
80104893:	89 03                	mov    %eax,(%ebx)
  return 0;
80104895:	31 c0                	xor    %eax,%eax
}
80104897:	83 c4 20             	add    $0x20,%esp
8010489a:	5b                   	pop    %ebx
8010489b:	5e                   	pop    %esi
8010489c:	5d                   	pop    %ebp
8010489d:	c3                   	ret    
8010489e:	66 90                	xchg   %ax,%ax
801048a0:	83 c4 20             	add    $0x20,%esp
    return -1;
801048a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801048a8:	5b                   	pop    %ebx
801048a9:	5e                   	pop    %esi
801048aa:	5d                   	pop    %ebp
801048ab:	c3                   	ret    
801048ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return 0;
801048b0:	31 c0                	xor    %eax,%eax
801048b2:	eb e3                	jmp    80104897 <argfd.constprop.0+0x47>
801048b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801048c0 <sys_dup>:
{
801048c0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
801048c1:	31 c0                	xor    %eax,%eax
{
801048c3:	89 e5                	mov    %esp,%ebp
801048c5:	53                   	push   %ebx
801048c6:	83 ec 24             	sub    $0x24,%esp
  if(argfd(0, 0, &f) < 0)
801048c9:	8d 55 f4             	lea    -0xc(%ebp),%edx
801048cc:	e8 7f ff ff ff       	call   80104850 <argfd.constprop.0>
801048d1:	85 c0                	test   %eax,%eax
801048d3:	78 23                	js     801048f8 <sys_dup+0x38>
  if((fd=fdalloc(f)) < 0)
801048d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801048d8:	e8 b3 fd ff ff       	call   80104690 <fdalloc>
801048dd:	85 c0                	test   %eax,%eax
801048df:	89 c3                	mov    %eax,%ebx
801048e1:	78 15                	js     801048f8 <sys_dup+0x38>
  filedup(f);
801048e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801048e6:	89 04 24             	mov    %eax,(%esp)
801048e9:	e8 e2 c4 ff ff       	call   80100dd0 <filedup>
  return fd;
801048ee:	89 d8                	mov    %ebx,%eax
}
801048f0:	83 c4 24             	add    $0x24,%esp
801048f3:	5b                   	pop    %ebx
801048f4:	5d                   	pop    %ebp
801048f5:	c3                   	ret    
801048f6:	66 90                	xchg   %ax,%ax
    return -1;
801048f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801048fd:	eb f1                	jmp    801048f0 <sys_dup+0x30>
801048ff:	90                   	nop

80104900 <sys_read>:
{
80104900:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104901:	31 c0                	xor    %eax,%eax
{
80104903:	89 e5                	mov    %esp,%ebp
80104905:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104908:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010490b:	e8 40 ff ff ff       	call   80104850 <argfd.constprop.0>
80104910:	85 c0                	test   %eax,%eax
80104912:	78 54                	js     80104968 <sys_read+0x68>
80104914:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104917:	89 44 24 04          	mov    %eax,0x4(%esp)
8010491b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104922:	e8 29 fc ff ff       	call   80104550 <argint>
80104927:	85 c0                	test   %eax,%eax
80104929:	78 3d                	js     80104968 <sys_read+0x68>
8010492b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010492e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104935:	89 44 24 08          	mov    %eax,0x8(%esp)
80104939:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010493c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104940:	e8 4b fc ff ff       	call   80104590 <argptr>
80104945:	85 c0                	test   %eax,%eax
80104947:	78 1f                	js     80104968 <sys_read+0x68>
  return fileread(f, p, n);
80104949:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010494c:	89 44 24 08          	mov    %eax,0x8(%esp)
80104950:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104953:	89 44 24 04          	mov    %eax,0x4(%esp)
80104957:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010495a:	89 04 24             	mov    %eax,(%esp)
8010495d:	e8 ce c5 ff ff       	call   80100f30 <fileread>
}
80104962:	c9                   	leave  
80104963:	c3                   	ret    
80104964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104968:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010496d:	c9                   	leave  
8010496e:	c3                   	ret    
8010496f:	90                   	nop

80104970 <sys_write>:
{
80104970:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104971:	31 c0                	xor    %eax,%eax
{
80104973:	89 e5                	mov    %esp,%ebp
80104975:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104978:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010497b:	e8 d0 fe ff ff       	call   80104850 <argfd.constprop.0>
80104980:	85 c0                	test   %eax,%eax
80104982:	78 54                	js     801049d8 <sys_write+0x68>
80104984:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104987:	89 44 24 04          	mov    %eax,0x4(%esp)
8010498b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104992:	e8 b9 fb ff ff       	call   80104550 <argint>
80104997:	85 c0                	test   %eax,%eax
80104999:	78 3d                	js     801049d8 <sys_write+0x68>
8010499b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010499e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801049a5:	89 44 24 08          	mov    %eax,0x8(%esp)
801049a9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049ac:	89 44 24 04          	mov    %eax,0x4(%esp)
801049b0:	e8 db fb ff ff       	call   80104590 <argptr>
801049b5:	85 c0                	test   %eax,%eax
801049b7:	78 1f                	js     801049d8 <sys_write+0x68>
  return filewrite(f, p, n);
801049b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
801049bc:	89 44 24 08          	mov    %eax,0x8(%esp)
801049c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801049c3:	89 44 24 04          	mov    %eax,0x4(%esp)
801049c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
801049ca:	89 04 24             	mov    %eax,(%esp)
801049cd:	e8 fe c5 ff ff       	call   80100fd0 <filewrite>
}
801049d2:	c9                   	leave  
801049d3:	c3                   	ret    
801049d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801049d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801049dd:	c9                   	leave  
801049de:	c3                   	ret    
801049df:	90                   	nop

801049e0 <sys_close>:
{
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, &fd, &f) < 0)
801049e6:	8d 55 f4             	lea    -0xc(%ebp),%edx
801049e9:	8d 45 f0             	lea    -0x10(%ebp),%eax
801049ec:	e8 5f fe ff ff       	call   80104850 <argfd.constprop.0>
801049f1:	85 c0                	test   %eax,%eax
801049f3:	78 23                	js     80104a18 <sys_close+0x38>
  myproc()->ofile[fd] = 0;
801049f5:	e8 a6 ec ff ff       	call   801036a0 <myproc>
801049fa:	8b 55 f0             	mov    -0x10(%ebp),%edx
801049fd:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104a04:	00 
  fileclose(f);
80104a05:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a08:	89 04 24             	mov    %eax,(%esp)
80104a0b:	e8 10 c4 ff ff       	call   80100e20 <fileclose>
  return 0;
80104a10:	31 c0                	xor    %eax,%eax
}
80104a12:	c9                   	leave  
80104a13:	c3                   	ret    
80104a14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104a18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104a1d:	c9                   	leave  
80104a1e:	c3                   	ret    
80104a1f:	90                   	nop

80104a20 <sys_fstat>:
{
80104a20:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104a21:	31 c0                	xor    %eax,%eax
{
80104a23:	89 e5                	mov    %esp,%ebp
80104a25:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104a28:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104a2b:	e8 20 fe ff ff       	call   80104850 <argfd.constprop.0>
80104a30:	85 c0                	test   %eax,%eax
80104a32:	78 34                	js     80104a68 <sys_fstat+0x48>
80104a34:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a37:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
80104a3e:	00 
80104a3f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a43:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104a4a:	e8 41 fb ff ff       	call   80104590 <argptr>
80104a4f:	85 c0                	test   %eax,%eax
80104a51:	78 15                	js     80104a68 <sys_fstat+0x48>
  return filestat(f, st);
80104a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a56:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104a5d:	89 04 24             	mov    %eax,(%esp)
80104a60:	e8 7b c4 ff ff       	call   80100ee0 <filestat>
}
80104a65:	c9                   	leave  
80104a66:	c3                   	ret    
80104a67:	90                   	nop
    return -1;
80104a68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104a6d:	c9                   	leave  
80104a6e:	c3                   	ret    
80104a6f:	90                   	nop

80104a70 <sys_link>:
{
80104a70:	55                   	push   %ebp
80104a71:	89 e5                	mov    %esp,%ebp
80104a73:	57                   	push   %edi
80104a74:	56                   	push   %esi
80104a75:	53                   	push   %ebx
80104a76:	83 ec 3c             	sub    $0x3c,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104a79:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104a7c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a80:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104a87:	e8 54 fb ff ff       	call   801045e0 <argstr>
80104a8c:	85 c0                	test   %eax,%eax
80104a8e:	0f 88 e6 00 00 00    	js     80104b7a <sys_link+0x10a>
80104a94:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104a97:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104aa2:	e8 39 fb ff ff       	call   801045e0 <argstr>
80104aa7:	85 c0                	test   %eax,%eax
80104aa9:	0f 88 cb 00 00 00    	js     80104b7a <sys_link+0x10a>
  begin_op();
80104aaf:	e8 5c e0 ff ff       	call   80102b10 <begin_op>
  if((ip = namei(old)) == 0){
80104ab4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80104ab7:	89 04 24             	mov    %eax,(%esp)
80104aba:	e8 41 d4 ff ff       	call   80101f00 <namei>
80104abf:	85 c0                	test   %eax,%eax
80104ac1:	89 c3                	mov    %eax,%ebx
80104ac3:	0f 84 ac 00 00 00    	je     80104b75 <sys_link+0x105>
  ilock(ip);
80104ac9:	89 04 24             	mov    %eax,(%esp)
80104acc:	e8 df cb ff ff       	call   801016b0 <ilock>
  if(ip->type == T_DIR){
80104ad1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ad6:	0f 84 91 00 00 00    	je     80104b6d <sys_link+0xfd>
  ip->nlink++;
80104adc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  if((dp = nameiparent(new, name)) == 0)
80104ae1:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80104ae4:	89 1c 24             	mov    %ebx,(%esp)
80104ae7:	e8 04 cb ff ff       	call   801015f0 <iupdate>
  iunlock(ip);
80104aec:	89 1c 24             	mov    %ebx,(%esp)
80104aef:	e8 9c cc ff ff       	call   80101790 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104af4:	8b 45 d0             	mov    -0x30(%ebp),%eax
80104af7:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104afb:	89 04 24             	mov    %eax,(%esp)
80104afe:	e8 1d d4 ff ff       	call   80101f20 <nameiparent>
80104b03:	85 c0                	test   %eax,%eax
80104b05:	89 c6                	mov    %eax,%esi
80104b07:	74 4f                	je     80104b58 <sys_link+0xe8>
  ilock(dp);
80104b09:	89 04 24             	mov    %eax,(%esp)
80104b0c:	e8 9f cb ff ff       	call   801016b0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104b11:	8b 03                	mov    (%ebx),%eax
80104b13:	39 06                	cmp    %eax,(%esi)
80104b15:	75 39                	jne    80104b50 <sys_link+0xe0>
80104b17:	8b 43 04             	mov    0x4(%ebx),%eax
80104b1a:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104b1e:	89 34 24             	mov    %esi,(%esp)
80104b21:	89 44 24 08          	mov    %eax,0x8(%esp)
80104b25:	e8 f6 d2 ff ff       	call   80101e20 <dirlink>
80104b2a:	85 c0                	test   %eax,%eax
80104b2c:	78 22                	js     80104b50 <sys_link+0xe0>
  iunlockput(dp);
80104b2e:	89 34 24             	mov    %esi,(%esp)
80104b31:	e8 da cd ff ff       	call   80101910 <iunlockput>
  iput(ip);
80104b36:	89 1c 24             	mov    %ebx,(%esp)
80104b39:	e8 92 cc ff ff       	call   801017d0 <iput>
  end_op();
80104b3e:	e8 3d e0 ff ff       	call   80102b80 <end_op>
}
80104b43:	83 c4 3c             	add    $0x3c,%esp
  return 0;
80104b46:	31 c0                	xor    %eax,%eax
}
80104b48:	5b                   	pop    %ebx
80104b49:	5e                   	pop    %esi
80104b4a:	5f                   	pop    %edi
80104b4b:	5d                   	pop    %ebp
80104b4c:	c3                   	ret    
80104b4d:	8d 76 00             	lea    0x0(%esi),%esi
    iunlockput(dp);
80104b50:	89 34 24             	mov    %esi,(%esp)
80104b53:	e8 b8 cd ff ff       	call   80101910 <iunlockput>
  ilock(ip);
80104b58:	89 1c 24             	mov    %ebx,(%esp)
80104b5b:	e8 50 cb ff ff       	call   801016b0 <ilock>
  ip->nlink--;
80104b60:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104b65:	89 1c 24             	mov    %ebx,(%esp)
80104b68:	e8 83 ca ff ff       	call   801015f0 <iupdate>
  iunlockput(ip);
80104b6d:	89 1c 24             	mov    %ebx,(%esp)
80104b70:	e8 9b cd ff ff       	call   80101910 <iunlockput>
  end_op();
80104b75:	e8 06 e0 ff ff       	call   80102b80 <end_op>
}
80104b7a:	83 c4 3c             	add    $0x3c,%esp
  return -1;
80104b7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104b82:	5b                   	pop    %ebx
80104b83:	5e                   	pop    %esi
80104b84:	5f                   	pop    %edi
80104b85:	5d                   	pop    %ebp
80104b86:	c3                   	ret    
80104b87:	89 f6                	mov    %esi,%esi
80104b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b90 <sys_unlink>:
{
80104b90:	55                   	push   %ebp
80104b91:	89 e5                	mov    %esp,%ebp
80104b93:	57                   	push   %edi
80104b94:	56                   	push   %esi
80104b95:	53                   	push   %ebx
80104b96:	83 ec 5c             	sub    $0x5c,%esp
  if(argstr(0, &path) < 0)
80104b99:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104b9c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104ba0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104ba7:	e8 34 fa ff ff       	call   801045e0 <argstr>
80104bac:	85 c0                	test   %eax,%eax
80104bae:	0f 88 76 01 00 00    	js     80104d2a <sys_unlink+0x19a>
  begin_op();
80104bb4:	e8 57 df ff ff       	call   80102b10 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104bb9:	8b 45 c0             	mov    -0x40(%ebp),%eax
80104bbc:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104bbf:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104bc3:	89 04 24             	mov    %eax,(%esp)
80104bc6:	e8 55 d3 ff ff       	call   80101f20 <nameiparent>
80104bcb:	85 c0                	test   %eax,%eax
80104bcd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104bd0:	0f 84 4f 01 00 00    	je     80104d25 <sys_unlink+0x195>
  ilock(dp);
80104bd6:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104bd9:	89 34 24             	mov    %esi,(%esp)
80104bdc:	e8 cf ca ff ff       	call   801016b0 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104be1:	c7 44 24 04 7c 75 10 	movl   $0x8010757c,0x4(%esp)
80104be8:	80 
80104be9:	89 1c 24             	mov    %ebx,(%esp)
80104bec:	e8 9f cf ff ff       	call   80101b90 <namecmp>
80104bf1:	85 c0                	test   %eax,%eax
80104bf3:	0f 84 21 01 00 00    	je     80104d1a <sys_unlink+0x18a>
80104bf9:	c7 44 24 04 7b 75 10 	movl   $0x8010757b,0x4(%esp)
80104c00:	80 
80104c01:	89 1c 24             	mov    %ebx,(%esp)
80104c04:	e8 87 cf ff ff       	call   80101b90 <namecmp>
80104c09:	85 c0                	test   %eax,%eax
80104c0b:	0f 84 09 01 00 00    	je     80104d1a <sys_unlink+0x18a>
  if((ip = dirlookup(dp, name, &off)) == 0)
80104c11:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104c14:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104c18:	89 44 24 08          	mov    %eax,0x8(%esp)
80104c1c:	89 34 24             	mov    %esi,(%esp)
80104c1f:	e8 9c cf ff ff       	call   80101bc0 <dirlookup>
80104c24:	85 c0                	test   %eax,%eax
80104c26:	89 c3                	mov    %eax,%ebx
80104c28:	0f 84 ec 00 00 00    	je     80104d1a <sys_unlink+0x18a>
  ilock(ip);
80104c2e:	89 04 24             	mov    %eax,(%esp)
80104c31:	e8 7a ca ff ff       	call   801016b0 <ilock>
  if(ip->nlink < 1)
80104c36:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104c3b:	0f 8e 24 01 00 00    	jle    80104d65 <sys_unlink+0x1d5>
  if(ip->type == T_DIR && !isdirempty(ip)){
80104c41:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104c46:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104c49:	74 7d                	je     80104cc8 <sys_unlink+0x138>
  memset(&de, 0, sizeof(de));
80104c4b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80104c52:	00 
80104c53:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104c5a:	00 
80104c5b:	89 34 24             	mov    %esi,(%esp)
80104c5e:	e8 1d f6 ff ff       	call   80104280 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104c63:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80104c66:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80104c6d:	00 
80104c6e:	89 74 24 04          	mov    %esi,0x4(%esp)
80104c72:	89 44 24 08          	mov    %eax,0x8(%esp)
80104c76:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104c79:	89 04 24             	mov    %eax,(%esp)
80104c7c:	e8 df cd ff ff       	call   80101a60 <writei>
80104c81:	83 f8 10             	cmp    $0x10,%eax
80104c84:	0f 85 cf 00 00 00    	jne    80104d59 <sys_unlink+0x1c9>
  if(ip->type == T_DIR){
80104c8a:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104c8f:	0f 84 a3 00 00 00    	je     80104d38 <sys_unlink+0x1a8>
  iunlockput(dp);
80104c95:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104c98:	89 04 24             	mov    %eax,(%esp)
80104c9b:	e8 70 cc ff ff       	call   80101910 <iunlockput>
  ip->nlink--;
80104ca0:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104ca5:	89 1c 24             	mov    %ebx,(%esp)
80104ca8:	e8 43 c9 ff ff       	call   801015f0 <iupdate>
  iunlockput(ip);
80104cad:	89 1c 24             	mov    %ebx,(%esp)
80104cb0:	e8 5b cc ff ff       	call   80101910 <iunlockput>
  end_op();
80104cb5:	e8 c6 de ff ff       	call   80102b80 <end_op>
}
80104cba:	83 c4 5c             	add    $0x5c,%esp
  return 0;
80104cbd:	31 c0                	xor    %eax,%eax
}
80104cbf:	5b                   	pop    %ebx
80104cc0:	5e                   	pop    %esi
80104cc1:	5f                   	pop    %edi
80104cc2:	5d                   	pop    %ebp
80104cc3:	c3                   	ret    
80104cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104cc8:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104ccc:	0f 86 79 ff ff ff    	jbe    80104c4b <sys_unlink+0xbb>
80104cd2:	bf 20 00 00 00       	mov    $0x20,%edi
80104cd7:	eb 15                	jmp    80104cee <sys_unlink+0x15e>
80104cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ce0:	8d 57 10             	lea    0x10(%edi),%edx
80104ce3:	3b 53 58             	cmp    0x58(%ebx),%edx
80104ce6:	0f 83 5f ff ff ff    	jae    80104c4b <sys_unlink+0xbb>
80104cec:	89 d7                	mov    %edx,%edi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104cee:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80104cf5:	00 
80104cf6:	89 7c 24 08          	mov    %edi,0x8(%esp)
80104cfa:	89 74 24 04          	mov    %esi,0x4(%esp)
80104cfe:	89 1c 24             	mov    %ebx,(%esp)
80104d01:	e8 5a cc ff ff       	call   80101960 <readi>
80104d06:	83 f8 10             	cmp    $0x10,%eax
80104d09:	75 42                	jne    80104d4d <sys_unlink+0x1bd>
    if(de.inum != 0)
80104d0b:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104d10:	74 ce                	je     80104ce0 <sys_unlink+0x150>
    iunlockput(ip);
80104d12:	89 1c 24             	mov    %ebx,(%esp)
80104d15:	e8 f6 cb ff ff       	call   80101910 <iunlockput>
  iunlockput(dp);
80104d1a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104d1d:	89 04 24             	mov    %eax,(%esp)
80104d20:	e8 eb cb ff ff       	call   80101910 <iunlockput>
  end_op();
80104d25:	e8 56 de ff ff       	call   80102b80 <end_op>
}
80104d2a:	83 c4 5c             	add    $0x5c,%esp
  return -1;
80104d2d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d32:	5b                   	pop    %ebx
80104d33:	5e                   	pop    %esi
80104d34:	5f                   	pop    %edi
80104d35:	5d                   	pop    %ebp
80104d36:	c3                   	ret    
80104d37:	90                   	nop
    dp->nlink--;
80104d38:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104d3b:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80104d40:	89 04 24             	mov    %eax,(%esp)
80104d43:	e8 a8 c8 ff ff       	call   801015f0 <iupdate>
80104d48:	e9 48 ff ff ff       	jmp    80104c95 <sys_unlink+0x105>
      panic("isdirempty: readi");
80104d4d:	c7 04 24 a0 75 10 80 	movl   $0x801075a0,(%esp)
80104d54:	e8 07 b6 ff ff       	call   80100360 <panic>
    panic("unlink: writei");
80104d59:	c7 04 24 b2 75 10 80 	movl   $0x801075b2,(%esp)
80104d60:	e8 fb b5 ff ff       	call   80100360 <panic>
    panic("unlink: nlink < 1");
80104d65:	c7 04 24 8e 75 10 80 	movl   $0x8010758e,(%esp)
80104d6c:	e8 ef b5 ff ff       	call   80100360 <panic>
80104d71:	eb 0d                	jmp    80104d80 <sys_open>
80104d73:	90                   	nop
80104d74:	90                   	nop
80104d75:	90                   	nop
80104d76:	90                   	nop
80104d77:	90                   	nop
80104d78:	90                   	nop
80104d79:	90                   	nop
80104d7a:	90                   	nop
80104d7b:	90                   	nop
80104d7c:	90                   	nop
80104d7d:	90                   	nop
80104d7e:	90                   	nop
80104d7f:	90                   	nop

80104d80 <sys_open>:

int
sys_open(void)
{
80104d80:	55                   	push   %ebp
80104d81:	89 e5                	mov    %esp,%ebp
80104d83:	57                   	push   %edi
80104d84:	56                   	push   %esi
80104d85:	53                   	push   %ebx
80104d86:	83 ec 2c             	sub    $0x2c,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104d89:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104d8c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104d90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104d97:	e8 44 f8 ff ff       	call   801045e0 <argstr>
80104d9c:	85 c0                	test   %eax,%eax
80104d9e:	0f 88 d1 00 00 00    	js     80104e75 <sys_open+0xf5>
80104da4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104da7:	89 44 24 04          	mov    %eax,0x4(%esp)
80104dab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104db2:	e8 99 f7 ff ff       	call   80104550 <argint>
80104db7:	85 c0                	test   %eax,%eax
80104db9:	0f 88 b6 00 00 00    	js     80104e75 <sys_open+0xf5>
    return -1;

  begin_op();
80104dbf:	e8 4c dd ff ff       	call   80102b10 <begin_op>

  if(omode & O_CREATE){
80104dc4:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80104dc8:	0f 85 82 00 00 00    	jne    80104e50 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80104dce:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104dd1:	89 04 24             	mov    %eax,(%esp)
80104dd4:	e8 27 d1 ff ff       	call   80101f00 <namei>
80104dd9:	85 c0                	test   %eax,%eax
80104ddb:	89 c6                	mov    %eax,%esi
80104ddd:	0f 84 8d 00 00 00    	je     80104e70 <sys_open+0xf0>
      end_op();
      return -1;
    }
    ilock(ip);
80104de3:	89 04 24             	mov    %eax,(%esp)
80104de6:	e8 c5 c8 ff ff       	call   801016b0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80104deb:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104df0:	0f 84 92 00 00 00    	je     80104e88 <sys_open+0x108>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80104df6:	e8 65 bf ff ff       	call   80100d60 <filealloc>
80104dfb:	85 c0                	test   %eax,%eax
80104dfd:	89 c3                	mov    %eax,%ebx
80104dff:	0f 84 93 00 00 00    	je     80104e98 <sys_open+0x118>
80104e05:	e8 86 f8 ff ff       	call   80104690 <fdalloc>
80104e0a:	85 c0                	test   %eax,%eax
80104e0c:	89 c7                	mov    %eax,%edi
80104e0e:	0f 88 94 00 00 00    	js     80104ea8 <sys_open+0x128>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80104e14:	89 34 24             	mov    %esi,(%esp)
80104e17:	e8 74 c9 ff ff       	call   80101790 <iunlock>
  end_op();
80104e1c:	e8 5f dd ff ff       	call   80102b80 <end_op>

  f->type = FD_INODE;
80104e21:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80104e27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  f->ip = ip;
80104e2a:	89 73 10             	mov    %esi,0x10(%ebx)
  f->off = 0;
80104e2d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
  f->readable = !(omode & O_WRONLY);
80104e34:	89 c2                	mov    %eax,%edx
80104e36:	83 e2 01             	and    $0x1,%edx
80104e39:	83 f2 01             	xor    $0x1,%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104e3c:	a8 03                	test   $0x3,%al
  f->readable = !(omode & O_WRONLY);
80104e3e:	88 53 08             	mov    %dl,0x8(%ebx)
  return fd;
80104e41:	89 f8                	mov    %edi,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104e43:	0f 95 43 09          	setne  0x9(%ebx)
}
80104e47:	83 c4 2c             	add    $0x2c,%esp
80104e4a:	5b                   	pop    %ebx
80104e4b:	5e                   	pop    %esi
80104e4c:	5f                   	pop    %edi
80104e4d:	5d                   	pop    %ebp
80104e4e:	c3                   	ret    
80104e4f:	90                   	nop
    ip = create(path, T_FILE, 0, 0);
80104e50:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104e53:	31 c9                	xor    %ecx,%ecx
80104e55:	ba 02 00 00 00       	mov    $0x2,%edx
80104e5a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104e61:	e8 6a f8 ff ff       	call   801046d0 <create>
    if(ip == 0){
80104e66:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80104e68:	89 c6                	mov    %eax,%esi
    if(ip == 0){
80104e6a:	75 8a                	jne    80104df6 <sys_open+0x76>
80104e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80104e70:	e8 0b dd ff ff       	call   80102b80 <end_op>
}
80104e75:	83 c4 2c             	add    $0x2c,%esp
    return -1;
80104e78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e7d:	5b                   	pop    %ebx
80104e7e:	5e                   	pop    %esi
80104e7f:	5f                   	pop    %edi
80104e80:	5d                   	pop    %ebp
80104e81:	c3                   	ret    
80104e82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80104e88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104e8b:	85 c0                	test   %eax,%eax
80104e8d:	0f 84 63 ff ff ff    	je     80104df6 <sys_open+0x76>
80104e93:	90                   	nop
80104e94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    iunlockput(ip);
80104e98:	89 34 24             	mov    %esi,(%esp)
80104e9b:	e8 70 ca ff ff       	call   80101910 <iunlockput>
80104ea0:	eb ce                	jmp    80104e70 <sys_open+0xf0>
80104ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      fileclose(f);
80104ea8:	89 1c 24             	mov    %ebx,(%esp)
80104eab:	e8 70 bf ff ff       	call   80100e20 <fileclose>
80104eb0:	eb e6                	jmp    80104e98 <sys_open+0x118>
80104eb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ec0 <sys_mkdir>:

int
sys_mkdir(void)
{
80104ec0:	55                   	push   %ebp
80104ec1:	89 e5                	mov    %esp,%ebp
80104ec3:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  begin_op();
80104ec6:	e8 45 dc ff ff       	call   80102b10 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
80104ecb:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104ece:	89 44 24 04          	mov    %eax,0x4(%esp)
80104ed2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104ed9:	e8 02 f7 ff ff       	call   801045e0 <argstr>
80104ede:	85 c0                	test   %eax,%eax
80104ee0:	78 2e                	js     80104f10 <sys_mkdir+0x50>
80104ee2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104ee5:	31 c9                	xor    %ecx,%ecx
80104ee7:	ba 01 00 00 00       	mov    $0x1,%edx
80104eec:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104ef3:	e8 d8 f7 ff ff       	call   801046d0 <create>
80104ef8:	85 c0                	test   %eax,%eax
80104efa:	74 14                	je     80104f10 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
80104efc:	89 04 24             	mov    %eax,(%esp)
80104eff:	e8 0c ca ff ff       	call   80101910 <iunlockput>
  end_op();
80104f04:	e8 77 dc ff ff       	call   80102b80 <end_op>
  return 0;
80104f09:	31 c0                	xor    %eax,%eax
}
80104f0b:	c9                   	leave  
80104f0c:	c3                   	ret    
80104f0d:	8d 76 00             	lea    0x0(%esi),%esi
    end_op();
80104f10:	e8 6b dc ff ff       	call   80102b80 <end_op>
    return -1;
80104f15:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104f1a:	c9                   	leave  
80104f1b:	c3                   	ret    
80104f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104f20 <sys_mknod>:

int
sys_mknod(void)
{
80104f20:	55                   	push   %ebp
80104f21:	89 e5                	mov    %esp,%ebp
80104f23:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80104f26:	e8 e5 db ff ff       	call   80102b10 <begin_op>
  if((argstr(0, &path)) < 0 ||
80104f2b:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104f2e:	89 44 24 04          	mov    %eax,0x4(%esp)
80104f32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104f39:	e8 a2 f6 ff ff       	call   801045e0 <argstr>
80104f3e:	85 c0                	test   %eax,%eax
80104f40:	78 5e                	js     80104fa0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80104f42:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104f45:	89 44 24 04          	mov    %eax,0x4(%esp)
80104f49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104f50:	e8 fb f5 ff ff       	call   80104550 <argint>
  if((argstr(0, &path)) < 0 ||
80104f55:	85 c0                	test   %eax,%eax
80104f57:	78 47                	js     80104fa0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80104f59:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104f5c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104f60:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104f67:	e8 e4 f5 ff ff       	call   80104550 <argint>
     argint(1, &major) < 0 ||
80104f6c:	85 c0                	test   %eax,%eax
80104f6e:	78 30                	js     80104fa0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
80104f70:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
80104f74:	ba 03 00 00 00       	mov    $0x3,%edx
     (ip = create(path, T_DEV, major, minor)) == 0){
80104f79:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104f7d:	89 04 24             	mov    %eax,(%esp)
     argint(2, &minor) < 0 ||
80104f80:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104f83:	e8 48 f7 ff ff       	call   801046d0 <create>
80104f88:	85 c0                	test   %eax,%eax
80104f8a:	74 14                	je     80104fa0 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
80104f8c:	89 04 24             	mov    %eax,(%esp)
80104f8f:	e8 7c c9 ff ff       	call   80101910 <iunlockput>
  end_op();
80104f94:	e8 e7 db ff ff       	call   80102b80 <end_op>
  return 0;
80104f99:	31 c0                	xor    %eax,%eax
}
80104f9b:	c9                   	leave  
80104f9c:	c3                   	ret    
80104f9d:	8d 76 00             	lea    0x0(%esi),%esi
    end_op();
80104fa0:	e8 db db ff ff       	call   80102b80 <end_op>
    return -1;
80104fa5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104faa:	c9                   	leave  
80104fab:	c3                   	ret    
80104fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104fb0 <sys_chdir>:

int
sys_chdir(void)
{
80104fb0:	55                   	push   %ebp
80104fb1:	89 e5                	mov    %esp,%ebp
80104fb3:	56                   	push   %esi
80104fb4:	53                   	push   %ebx
80104fb5:	83 ec 20             	sub    $0x20,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80104fb8:	e8 e3 e6 ff ff       	call   801036a0 <myproc>
80104fbd:	89 c6                	mov    %eax,%esi
  
  begin_op();
80104fbf:	e8 4c db ff ff       	call   80102b10 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80104fc4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104fc7:	89 44 24 04          	mov    %eax,0x4(%esp)
80104fcb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104fd2:	e8 09 f6 ff ff       	call   801045e0 <argstr>
80104fd7:	85 c0                	test   %eax,%eax
80104fd9:	78 4a                	js     80105025 <sys_chdir+0x75>
80104fdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104fde:	89 04 24             	mov    %eax,(%esp)
80104fe1:	e8 1a cf ff ff       	call   80101f00 <namei>
80104fe6:	85 c0                	test   %eax,%eax
80104fe8:	89 c3                	mov    %eax,%ebx
80104fea:	74 39                	je     80105025 <sys_chdir+0x75>
    end_op();
    return -1;
  }
  ilock(ip);
80104fec:	89 04 24             	mov    %eax,(%esp)
80104fef:	e8 bc c6 ff ff       	call   801016b0 <ilock>
  if(ip->type != T_DIR){
80104ff4:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
    iunlockput(ip);
80104ff9:	89 1c 24             	mov    %ebx,(%esp)
  if(ip->type != T_DIR){
80104ffc:	75 22                	jne    80105020 <sys_chdir+0x70>
    end_op();
    return -1;
  }
  iunlock(ip);
80104ffe:	e8 8d c7 ff ff       	call   80101790 <iunlock>
  iput(curproc->cwd);
80105003:	8b 46 68             	mov    0x68(%esi),%eax
80105006:	89 04 24             	mov    %eax,(%esp)
80105009:	e8 c2 c7 ff ff       	call   801017d0 <iput>
  end_op();
8010500e:	e8 6d db ff ff       	call   80102b80 <end_op>
  curproc->cwd = ip;
  return 0;
80105013:	31 c0                	xor    %eax,%eax
  curproc->cwd = ip;
80105015:	89 5e 68             	mov    %ebx,0x68(%esi)
}
80105018:	83 c4 20             	add    $0x20,%esp
8010501b:	5b                   	pop    %ebx
8010501c:	5e                   	pop    %esi
8010501d:	5d                   	pop    %ebp
8010501e:	c3                   	ret    
8010501f:	90                   	nop
    iunlockput(ip);
80105020:	e8 eb c8 ff ff       	call   80101910 <iunlockput>
    end_op();
80105025:	e8 56 db ff ff       	call   80102b80 <end_op>
}
8010502a:	83 c4 20             	add    $0x20,%esp
    return -1;
8010502d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105032:	5b                   	pop    %ebx
80105033:	5e                   	pop    %esi
80105034:	5d                   	pop    %ebp
80105035:	c3                   	ret    
80105036:	8d 76 00             	lea    0x0(%esi),%esi
80105039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105040 <sys_exec>:

int
sys_exec(void)
{
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	57                   	push   %edi
80105044:	56                   	push   %esi
80105045:	53                   	push   %ebx
80105046:	81 ec ac 00 00 00    	sub    $0xac,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
8010504c:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
80105052:	89 44 24 04          	mov    %eax,0x4(%esp)
80105056:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010505d:	e8 7e f5 ff ff       	call   801045e0 <argstr>
80105062:	85 c0                	test   %eax,%eax
80105064:	0f 88 84 00 00 00    	js     801050ee <sys_exec+0xae>
8010506a:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105070:	89 44 24 04          	mov    %eax,0x4(%esp)
80105074:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010507b:	e8 d0 f4 ff ff       	call   80104550 <argint>
80105080:	85 c0                	test   %eax,%eax
80105082:	78 6a                	js     801050ee <sys_exec+0xae>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105084:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  for(i=0;; i++){
8010508a:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
8010508c:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80105093:	00 
80105094:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
8010509a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801050a1:	00 
801050a2:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801050a8:	89 04 24             	mov    %eax,(%esp)
801050ab:	e8 d0 f1 ff ff       	call   80104280 <memset>
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801050b0:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801050b6:	89 7c 24 04          	mov    %edi,0x4(%esp)
801050ba:	8d 04 98             	lea    (%eax,%ebx,4),%eax
801050bd:	89 04 24             	mov    %eax,(%esp)
801050c0:	e8 0b f4 ff ff       	call   801044d0 <fetchint>
801050c5:	85 c0                	test   %eax,%eax
801050c7:	78 25                	js     801050ee <sys_exec+0xae>
      return -1;
    if(uarg == 0){
801050c9:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801050cf:	85 c0                	test   %eax,%eax
801050d1:	74 2d                	je     80105100 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801050d3:	89 74 24 04          	mov    %esi,0x4(%esp)
801050d7:	89 04 24             	mov    %eax,(%esp)
801050da:	e8 11 f4 ff ff       	call   801044f0 <fetchstr>
801050df:	85 c0                	test   %eax,%eax
801050e1:	78 0b                	js     801050ee <sys_exec+0xae>
  for(i=0;; i++){
801050e3:	83 c3 01             	add    $0x1,%ebx
801050e6:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
801050e9:	83 fb 20             	cmp    $0x20,%ebx
801050ec:	75 c2                	jne    801050b0 <sys_exec+0x70>
      return -1;
  }
  return exec(path, argv);
}
801050ee:	81 c4 ac 00 00 00    	add    $0xac,%esp
    return -1;
801050f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801050f9:	5b                   	pop    %ebx
801050fa:	5e                   	pop    %esi
801050fb:	5f                   	pop    %edi
801050fc:	5d                   	pop    %ebp
801050fd:	c3                   	ret    
801050fe:	66 90                	xchg   %ax,%ax
  return exec(path, argv);
80105100:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105106:	89 44 24 04          	mov    %eax,0x4(%esp)
8010510a:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
      argv[i] = 0;
80105110:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105117:	00 00 00 00 
  return exec(path, argv);
8010511b:	89 04 24             	mov    %eax,(%esp)
8010511e:	e8 7d b8 ff ff       	call   801009a0 <exec>
}
80105123:	81 c4 ac 00 00 00    	add    $0xac,%esp
80105129:	5b                   	pop    %ebx
8010512a:	5e                   	pop    %esi
8010512b:	5f                   	pop    %edi
8010512c:	5d                   	pop    %ebp
8010512d:	c3                   	ret    
8010512e:	66 90                	xchg   %ax,%ax

80105130 <sys_pipe>:

int
sys_pipe(void)
{
80105130:	55                   	push   %ebp
80105131:	89 e5                	mov    %esp,%ebp
80105133:	53                   	push   %ebx
80105134:	83 ec 24             	sub    $0x24,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105137:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010513a:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
80105141:	00 
80105142:	89 44 24 04          	mov    %eax,0x4(%esp)
80105146:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010514d:	e8 3e f4 ff ff       	call   80104590 <argptr>
80105152:	85 c0                	test   %eax,%eax
80105154:	78 6d                	js     801051c3 <sys_pipe+0x93>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105156:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105159:	89 44 24 04          	mov    %eax,0x4(%esp)
8010515d:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105160:	89 04 24             	mov    %eax,(%esp)
80105163:	e8 08 e0 ff ff       	call   80103170 <pipealloc>
80105168:	85 c0                	test   %eax,%eax
8010516a:	78 57                	js     801051c3 <sys_pipe+0x93>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010516c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010516f:	e8 1c f5 ff ff       	call   80104690 <fdalloc>
80105174:	85 c0                	test   %eax,%eax
80105176:	89 c3                	mov    %eax,%ebx
80105178:	78 33                	js     801051ad <sys_pipe+0x7d>
8010517a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010517d:	e8 0e f5 ff ff       	call   80104690 <fdalloc>
80105182:	85 c0                	test   %eax,%eax
80105184:	78 1a                	js     801051a0 <sys_pipe+0x70>
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105186:	8b 55 ec             	mov    -0x14(%ebp),%edx
80105189:	89 1a                	mov    %ebx,(%edx)
  fd[1] = fd1;
8010518b:	8b 55 ec             	mov    -0x14(%ebp),%edx
8010518e:	89 42 04             	mov    %eax,0x4(%edx)
  return 0;
80105191:	83 c4 24             	add    $0x24,%esp
  return 0;
80105194:	31 c0                	xor    %eax,%eax
80105196:	5b                   	pop    %ebx
80105197:	5d                   	pop    %ebp
80105198:	c3                   	ret    
80105199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      myproc()->ofile[fd0] = 0;
801051a0:	e8 fb e4 ff ff       	call   801036a0 <myproc>
801051a5:	c7 44 98 28 00 00 00 	movl   $0x0,0x28(%eax,%ebx,4)
801051ac:	00 
    fileclose(rf);
801051ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
801051b0:	89 04 24             	mov    %eax,(%esp)
801051b3:	e8 68 bc ff ff       	call   80100e20 <fileclose>
    fileclose(wf);
801051b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051bb:	89 04 24             	mov    %eax,(%esp)
801051be:	e8 5d bc ff ff       	call   80100e20 <fileclose>
801051c3:	83 c4 24             	add    $0x24,%esp
    return -1;
801051c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051cb:	5b                   	pop    %ebx
801051cc:	5d                   	pop    %ebp
801051cd:	c3                   	ret    
801051ce:	66 90                	xchg   %ax,%ax

801051d0 <sys_shm_open>:
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int sys_shm_open(void) {
801051d0:	55                   	push   %ebp
801051d1:	89 e5                	mov    %esp,%ebp
801051d3:	83 ec 28             	sub    $0x28,%esp
  int id;
  char **pointer;

  if(argint(0, &id) < 0)
801051d6:	8d 45 f0             	lea    -0x10(%ebp),%eax
801051d9:	89 44 24 04          	mov    %eax,0x4(%esp)
801051dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801051e4:	e8 67 f3 ff ff       	call   80104550 <argint>
801051e9:	85 c0                	test   %eax,%eax
801051eb:	78 33                	js     80105220 <sys_shm_open+0x50>
    return -1;

  if(argptr(1, (char **) (&pointer),4)<0)
801051ed:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051f0:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
801051f7:	00 
801051f8:	89 44 24 04          	mov    %eax,0x4(%esp)
801051fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105203:	e8 88 f3 ff ff       	call   80104590 <argptr>
80105208:	85 c0                	test   %eax,%eax
8010520a:	78 14                	js     80105220 <sys_shm_open+0x50>
    return -1;
  return shm_open(id, pointer);
8010520c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010520f:	89 44 24 04          	mov    %eax,0x4(%esp)
80105213:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105216:	89 04 24             	mov    %eax,(%esp)
80105219:	e8 e2 1b 00 00       	call   80106e00 <shm_open>
}
8010521e:	c9                   	leave  
8010521f:	c3                   	ret    
    return -1;
80105220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105225:	c9                   	leave  
80105226:	c3                   	ret    
80105227:	89 f6                	mov    %esi,%esi
80105229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105230 <sys_shm_close>:

int sys_shm_close(void) {
80105230:	55                   	push   %ebp
80105231:	89 e5                	mov    %esp,%ebp
80105233:	83 ec 28             	sub    $0x28,%esp
  int id;

  if(argint(0, &id) < 0)
80105236:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105239:	89 44 24 04          	mov    %eax,0x4(%esp)
8010523d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105244:	e8 07 f3 ff ff       	call   80104550 <argint>
80105249:	85 c0                	test   %eax,%eax
8010524b:	78 13                	js     80105260 <sys_shm_close+0x30>
    return -1;

  
  return shm_close(id);
8010524d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105250:	89 04 24             	mov    %eax,(%esp)
80105253:	e8 b8 1b 00 00       	call   80106e10 <shm_close>
}
80105258:	c9                   	leave  
80105259:	c3                   	ret    
8010525a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105265:	c9                   	leave  
80105266:	c3                   	ret    
80105267:	89 f6                	mov    %esi,%esi
80105269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105270 <sys_fork>:

int
sys_fork(void)
{
80105270:	55                   	push   %ebp
80105271:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105273:	5d                   	pop    %ebp
  return fork();
80105274:	e9 d7 e5 ff ff       	jmp    80103850 <fork>
80105279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105280 <sys_exit>:

int
sys_exit(void)
{
80105280:	55                   	push   %ebp
80105281:	89 e5                	mov    %esp,%ebp
80105283:	83 ec 08             	sub    $0x8,%esp
  exit();
80105286:	e8 15 e8 ff ff       	call   80103aa0 <exit>
  return 0;  // not reached
}
8010528b:	31 c0                	xor    %eax,%eax
8010528d:	c9                   	leave  
8010528e:	c3                   	ret    
8010528f:	90                   	nop

80105290 <sys_wait>:

int
sys_wait(void)
{
80105290:	55                   	push   %ebp
80105291:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105293:	5d                   	pop    %ebp
  return wait();
80105294:	e9 17 ea ff ff       	jmp    80103cb0 <wait>
80105299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801052a0 <sys_kill>:

int
sys_kill(void)
{
801052a0:	55                   	push   %ebp
801052a1:	89 e5                	mov    %esp,%ebp
801052a3:	83 ec 28             	sub    $0x28,%esp
  int pid;

  if(argint(0, &pid) < 0)
801052a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052a9:	89 44 24 04          	mov    %eax,0x4(%esp)
801052ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801052b4:	e8 97 f2 ff ff       	call   80104550 <argint>
801052b9:	85 c0                	test   %eax,%eax
801052bb:	78 13                	js     801052d0 <sys_kill+0x30>
    return -1;
  return kill(pid);
801052bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
801052c0:	89 04 24             	mov    %eax,(%esp)
801052c3:	e8 28 eb ff ff       	call   80103df0 <kill>
}
801052c8:	c9                   	leave  
801052c9:	c3                   	ret    
801052ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
801052d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801052d5:	c9                   	leave  
801052d6:	c3                   	ret    
801052d7:	89 f6                	mov    %esi,%esi
801052d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801052e0 <sys_getpid>:

int
sys_getpid(void)
{
801052e0:	55                   	push   %ebp
801052e1:	89 e5                	mov    %esp,%ebp
801052e3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
801052e6:	e8 b5 e3 ff ff       	call   801036a0 <myproc>
801052eb:	8b 40 10             	mov    0x10(%eax),%eax
}
801052ee:	c9                   	leave  
801052ef:	c3                   	ret    

801052f0 <sys_sbrk>:

int
sys_sbrk(void)
{
801052f0:	55                   	push   %ebp
801052f1:	89 e5                	mov    %esp,%ebp
801052f3:	53                   	push   %ebx
801052f4:	83 ec 24             	sub    $0x24,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
801052f7:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052fa:	89 44 24 04          	mov    %eax,0x4(%esp)
801052fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105305:	e8 46 f2 ff ff       	call   80104550 <argint>
8010530a:	85 c0                	test   %eax,%eax
8010530c:	78 22                	js     80105330 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
8010530e:	e8 8d e3 ff ff       	call   801036a0 <myproc>
  if(growproc(n) < 0)
80105313:	8b 55 f4             	mov    -0xc(%ebp),%edx
  addr = myproc()->sz;
80105316:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105318:	89 14 24             	mov    %edx,(%esp)
8010531b:	e8 c0 e4 ff ff       	call   801037e0 <growproc>
80105320:	85 c0                	test   %eax,%eax
80105322:	78 0c                	js     80105330 <sys_sbrk+0x40>
    return -1;
  return addr;
80105324:	89 d8                	mov    %ebx,%eax
}
80105326:	83 c4 24             	add    $0x24,%esp
80105329:	5b                   	pop    %ebx
8010532a:	5d                   	pop    %ebp
8010532b:	c3                   	ret    
8010532c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105330:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105335:	eb ef                	jmp    80105326 <sys_sbrk+0x36>
80105337:	89 f6                	mov    %esi,%esi
80105339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105340 <sys_sleep>:

int
sys_sleep(void)
{
80105340:	55                   	push   %ebp
80105341:	89 e5                	mov    %esp,%ebp
80105343:	53                   	push   %ebx
80105344:	83 ec 24             	sub    $0x24,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105347:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010534a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010534e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105355:	e8 f6 f1 ff ff       	call   80104550 <argint>
8010535a:	85 c0                	test   %eax,%eax
8010535c:	78 7e                	js     801053dc <sys_sleep+0x9c>
    return -1;
  acquire(&tickslock);
8010535e:	c7 04 24 80 4d 11 80 	movl   $0x80114d80,(%esp)
80105365:	e8 d6 ed ff ff       	call   80104140 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010536a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  ticks0 = ticks;
8010536d:	8b 1d c0 55 11 80    	mov    0x801155c0,%ebx
  while(ticks - ticks0 < n){
80105373:	85 d2                	test   %edx,%edx
80105375:	75 29                	jne    801053a0 <sys_sleep+0x60>
80105377:	eb 4f                	jmp    801053c8 <sys_sleep+0x88>
80105379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105380:	c7 44 24 04 80 4d 11 	movl   $0x80114d80,0x4(%esp)
80105387:	80 
80105388:	c7 04 24 c0 55 11 80 	movl   $0x801155c0,(%esp)
8010538f:	e8 6c e8 ff ff       	call   80103c00 <sleep>
  while(ticks - ticks0 < n){
80105394:	a1 c0 55 11 80       	mov    0x801155c0,%eax
80105399:	29 d8                	sub    %ebx,%eax
8010539b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010539e:	73 28                	jae    801053c8 <sys_sleep+0x88>
    if(myproc()->killed){
801053a0:	e8 fb e2 ff ff       	call   801036a0 <myproc>
801053a5:	8b 40 24             	mov    0x24(%eax),%eax
801053a8:	85 c0                	test   %eax,%eax
801053aa:	74 d4                	je     80105380 <sys_sleep+0x40>
      release(&tickslock);
801053ac:	c7 04 24 80 4d 11 80 	movl   $0x80114d80,(%esp)
801053b3:	e8 78 ee ff ff       	call   80104230 <release>
      return -1;
801053b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
801053bd:	83 c4 24             	add    $0x24,%esp
801053c0:	5b                   	pop    %ebx
801053c1:	5d                   	pop    %ebp
801053c2:	c3                   	ret    
801053c3:	90                   	nop
801053c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&tickslock);
801053c8:	c7 04 24 80 4d 11 80 	movl   $0x80114d80,(%esp)
801053cf:	e8 5c ee ff ff       	call   80104230 <release>
}
801053d4:	83 c4 24             	add    $0x24,%esp
  return 0;
801053d7:	31 c0                	xor    %eax,%eax
}
801053d9:	5b                   	pop    %ebx
801053da:	5d                   	pop    %ebp
801053db:	c3                   	ret    
    return -1;
801053dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053e1:	eb da                	jmp    801053bd <sys_sleep+0x7d>
801053e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801053e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801053f0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801053f0:	55                   	push   %ebp
801053f1:	89 e5                	mov    %esp,%ebp
801053f3:	53                   	push   %ebx
801053f4:	83 ec 14             	sub    $0x14,%esp
  uint xticks;

  acquire(&tickslock);
801053f7:	c7 04 24 80 4d 11 80 	movl   $0x80114d80,(%esp)
801053fe:	e8 3d ed ff ff       	call   80104140 <acquire>
  xticks = ticks;
80105403:	8b 1d c0 55 11 80    	mov    0x801155c0,%ebx
  release(&tickslock);
80105409:	c7 04 24 80 4d 11 80 	movl   $0x80114d80,(%esp)
80105410:	e8 1b ee ff ff       	call   80104230 <release>
  return xticks;
}
80105415:	83 c4 14             	add    $0x14,%esp
80105418:	89 d8                	mov    %ebx,%eax
8010541a:	5b                   	pop    %ebx
8010541b:	5d                   	pop    %ebp
8010541c:	c3                   	ret    

8010541d <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
8010541d:	1e                   	push   %ds
  pushl %es
8010541e:	06                   	push   %es
  pushl %fs
8010541f:	0f a0                	push   %fs
  pushl %gs
80105421:	0f a8                	push   %gs
  pushal
80105423:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80105424:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105428:	8e d8                	mov    %eax,%ds
  movw %ax, %es
8010542a:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
8010542c:	54                   	push   %esp
  call trap
8010542d:	e8 de 00 00 00       	call   80105510 <trap>
  addl $4, %esp
80105432:	83 c4 04             	add    $0x4,%esp

80105435 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105435:	61                   	popa   
  popl %gs
80105436:	0f a9                	pop    %gs
  popl %fs
80105438:	0f a1                	pop    %fs
  popl %es
8010543a:	07                   	pop    %es
  popl %ds
8010543b:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
8010543c:	83 c4 08             	add    $0x8,%esp
  iret
8010543f:	cf                   	iret   

80105440 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105440:	31 c0                	xor    %eax,%eax
80105442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105448:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
8010544f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105454:	66 89 0c c5 c2 4d 11 	mov    %cx,-0x7feeb23e(,%eax,8)
8010545b:	80 
8010545c:	c6 04 c5 c4 4d 11 80 	movb   $0x0,-0x7feeb23c(,%eax,8)
80105463:	00 
80105464:	c6 04 c5 c5 4d 11 80 	movb   $0x8e,-0x7feeb23b(,%eax,8)
8010546b:	8e 
8010546c:	66 89 14 c5 c0 4d 11 	mov    %dx,-0x7feeb240(,%eax,8)
80105473:	80 
80105474:	c1 ea 10             	shr    $0x10,%edx
80105477:	66 89 14 c5 c6 4d 11 	mov    %dx,-0x7feeb23a(,%eax,8)
8010547e:	80 
  for(i = 0; i < 256; i++)
8010547f:	83 c0 01             	add    $0x1,%eax
80105482:	3d 00 01 00 00       	cmp    $0x100,%eax
80105487:	75 bf                	jne    80105448 <tvinit+0x8>
{
80105489:	55                   	push   %ebp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
8010548a:	ba 08 00 00 00       	mov    $0x8,%edx
{
8010548f:	89 e5                	mov    %esp,%ebp
80105491:	83 ec 18             	sub    $0x18,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105494:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
80105499:	c7 44 24 04 c1 75 10 	movl   $0x801075c1,0x4(%esp)
801054a0:	80 
801054a1:	c7 04 24 80 4d 11 80 	movl   $0x80114d80,(%esp)
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801054a8:	66 89 15 c2 4f 11 80 	mov    %dx,0x80114fc2
801054af:	66 a3 c0 4f 11 80    	mov    %ax,0x80114fc0
801054b5:	c1 e8 10             	shr    $0x10,%eax
801054b8:	c6 05 c4 4f 11 80 00 	movb   $0x0,0x80114fc4
801054bf:	c6 05 c5 4f 11 80 ef 	movb   $0xef,0x80114fc5
801054c6:	66 a3 c6 4f 11 80    	mov    %ax,0x80114fc6
  initlock(&tickslock, "time");
801054cc:	e8 7f eb ff ff       	call   80104050 <initlock>
}
801054d1:	c9                   	leave  
801054d2:	c3                   	ret    
801054d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801054d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801054e0 <idtinit>:

void
idtinit(void)
{
801054e0:	55                   	push   %ebp
  pd[0] = size-1;
801054e1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801054e6:	89 e5                	mov    %esp,%ebp
801054e8:	83 ec 10             	sub    $0x10,%esp
801054eb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
801054ef:	b8 c0 4d 11 80       	mov    $0x80114dc0,%eax
801054f4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
801054f8:	c1 e8 10             	shr    $0x10,%eax
801054fb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
801054ff:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105502:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105505:	c9                   	leave  
80105506:	c3                   	ret    
80105507:	89 f6                	mov    %esi,%esi
80105509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105510 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
80105513:	57                   	push   %edi
80105514:	56                   	push   %esi
80105515:	53                   	push   %ebx
80105516:	83 ec 3c             	sub    $0x3c,%esp
80105519:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
8010551c:	8b 43 30             	mov    0x30(%ebx),%eax
8010551f:	83 f8 40             	cmp    $0x40,%eax
80105522:	0f 84 00 02 00 00    	je     80105728 <trap+0x218>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105528:	83 e8 0e             	sub    $0xe,%eax
8010552b:	83 f8 31             	cmp    $0x31,%eax
8010552e:	77 08                	ja     80105538 <trap+0x28>
80105530:	ff 24 85 90 76 10 80 	jmp    *-0x7fef8970(,%eax,4)
80105537:	90                   	nop
          cprintf("Page count increased to: %d \n", myproc()->num_pages);
      break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
80105538:	e8 63 e1 ff ff       	call   801036a0 <myproc>
8010553d:	85 c0                	test   %eax,%eax
8010553f:	90                   	nop
80105540:	0f 84 92 02 00 00    	je     801057d8 <trap+0x2c8>
80105546:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
8010554a:	0f 84 88 02 00 00    	je     801057d8 <trap+0x2c8>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105550:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105553:	8b 53 38             	mov    0x38(%ebx),%edx
80105556:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105559:	89 55 dc             	mov    %edx,-0x24(%ebp)
8010555c:	e8 1f e1 ff ff       	call   80103680 <cpuid>
80105561:	8b 73 30             	mov    0x30(%ebx),%esi
80105564:	89 c7                	mov    %eax,%edi
80105566:	8b 43 34             	mov    0x34(%ebx),%eax
80105569:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
8010556c:	e8 2f e1 ff ff       	call   801036a0 <myproc>
80105571:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105574:	e8 27 e1 ff ff       	call   801036a0 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105579:	8b 55 dc             	mov    -0x24(%ebp),%edx
8010557c:	89 74 24 0c          	mov    %esi,0xc(%esp)
            myproc()->pid, myproc()->name, tf->trapno,
80105580:	8b 75 e0             	mov    -0x20(%ebp),%esi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105583:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105586:	89 7c 24 14          	mov    %edi,0x14(%esp)
8010558a:	89 54 24 18          	mov    %edx,0x18(%esp)
8010558e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
            myproc()->pid, myproc()->name, tf->trapno,
80105591:	83 c6 6c             	add    $0x6c,%esi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105594:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
            myproc()->pid, myproc()->name, tf->trapno,
80105598:	89 74 24 08          	mov    %esi,0x8(%esp)
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010559c:	89 54 24 10          	mov    %edx,0x10(%esp)
801055a0:	8b 40 10             	mov    0x10(%eax),%eax
801055a3:	c7 04 24 4c 76 10 80 	movl   $0x8010764c,(%esp)
801055aa:	89 44 24 04          	mov    %eax,0x4(%esp)
801055ae:	e8 9d b0 ff ff       	call   80100650 <cprintf>
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
801055b3:	e8 e8 e0 ff ff       	call   801036a0 <myproc>
801055b8:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801055bf:	90                   	nop
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801055c0:	e8 db e0 ff ff       	call   801036a0 <myproc>
801055c5:	85 c0                	test   %eax,%eax
801055c7:	74 0c                	je     801055d5 <trap+0xc5>
801055c9:	e8 d2 e0 ff ff       	call   801036a0 <myproc>
801055ce:	8b 50 24             	mov    0x24(%eax),%edx
801055d1:	85 d2                	test   %edx,%edx
801055d3:	75 4b                	jne    80105620 <trap+0x110>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
801055d5:	e8 c6 e0 ff ff       	call   801036a0 <myproc>
801055da:	85 c0                	test   %eax,%eax
801055dc:	74 0d                	je     801055eb <trap+0xdb>
801055de:	66 90                	xchg   %ax,%ax
801055e0:	e8 bb e0 ff ff       	call   801036a0 <myproc>
801055e5:	83 78 08 04          	cmpl   $0x4,0x8(%eax)
801055e9:	74 4d                	je     80105638 <trap+0x128>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801055eb:	e8 b0 e0 ff ff       	call   801036a0 <myproc>
801055f0:	85 c0                	test   %eax,%eax
801055f2:	74 1d                	je     80105611 <trap+0x101>
801055f4:	e8 a7 e0 ff ff       	call   801036a0 <myproc>
801055f9:	8b 40 24             	mov    0x24(%eax),%eax
801055fc:	85 c0                	test   %eax,%eax
801055fe:	74 11                	je     80105611 <trap+0x101>
80105600:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105604:	83 e0 03             	and    $0x3,%eax
80105607:	66 83 f8 03          	cmp    $0x3,%ax
8010560b:	0f 84 48 01 00 00    	je     80105759 <trap+0x249>
    exit();
}
80105611:	83 c4 3c             	add    $0x3c,%esp
80105614:	5b                   	pop    %ebx
80105615:	5e                   	pop    %esi
80105616:	5f                   	pop    %edi
80105617:	5d                   	pop    %ebp
80105618:	c3                   	ret    
80105619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105620:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105624:	83 e0 03             	and    $0x3,%eax
80105627:	66 83 f8 03          	cmp    $0x3,%ax
8010562b:	75 a8                	jne    801055d5 <trap+0xc5>
    exit();
8010562d:	e8 6e e4 ff ff       	call   80103aa0 <exit>
80105632:	eb a1                	jmp    801055d5 <trap+0xc5>
80105634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(myproc() && myproc()->state == RUNNING &&
80105638:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
8010563c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105640:	75 a9                	jne    801055eb <trap+0xdb>
    yield();
80105642:	e8 79 e5 ff ff       	call   80103bc0 <yield>
80105647:	eb a2                	jmp    801055eb <trap+0xdb>
80105649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105650:	0f 20 d6             	mov    %cr2,%esi
        if(allocuvm(myproc()->pgdir, KERNBASE - (myproc()->num_pages * PGSIZE * 2), PGROUNDUP(rcr2())) == 0){
80105653:	e8 48 e0 ff ff       	call   801036a0 <myproc>
80105658:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
8010565e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80105664:	8b 40 7c             	mov    0x7c(%eax),%eax
80105667:	f7 d8                	neg    %eax
80105669:	c1 e0 0d             	shl    $0xd,%eax
8010566c:	8d b8 00 00 00 80    	lea    -0x80000000(%eax),%edi
80105672:	e8 29 e0 ff ff       	call   801036a0 <myproc>
80105677:	89 74 24 08          	mov    %esi,0x8(%esp)
8010567b:	89 7c 24 04          	mov    %edi,0x4(%esp)
8010567f:	8b 40 04             	mov    0x4(%eax),%eax
80105682:	89 04 24             	mov    %eax,(%esp)
80105685:	e8 16 12 00 00       	call   801068a0 <allocuvm>
8010568a:	85 c0                	test   %eax,%eax
8010568c:	0f 85 d6 00 00 00    	jne    80105768 <trap+0x258>
         	cprintf("PAGEFAULT\n");
80105692:	c7 04 24 c6 75 10 80 	movl   $0x801075c6,(%esp)
80105699:	e8 b2 af ff ff       	call   80100650 <cprintf>
          	break;
8010569e:	e9 1d ff ff ff       	jmp    801055c0 <trap+0xb0>
801056a3:	90                   	nop
801056a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(cpuid() == 0){
801056a8:	e8 d3 df ff ff       	call   80103680 <cpuid>
801056ad:	85 c0                	test   %eax,%eax
801056af:	90                   	nop
801056b0:	0f 84 f2 00 00 00    	je     801057a8 <trap+0x298>
    lapiceoi();
801056b6:	e8 c5 d0 ff ff       	call   80102780 <lapiceoi>
801056bb:	90                   	nop
801056bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    break;
801056c0:	e9 fb fe ff ff       	jmp    801055c0 <trap+0xb0>
801056c5:	8d 76 00             	lea    0x0(%esi),%esi
801056c8:	90                   	nop
801056c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kbdintr();
801056d0:	e8 fb ce ff ff       	call   801025d0 <kbdintr>
    lapiceoi();
801056d5:	e8 a6 d0 ff ff       	call   80102780 <lapiceoi>
    break;
801056da:	e9 e1 fe ff ff       	jmp    801055c0 <trap+0xb0>
801056df:	90                   	nop
    uartintr();
801056e0:	e8 4b 02 00 00       	call   80105930 <uartintr>
    lapiceoi();
801056e5:	e8 96 d0 ff ff       	call   80102780 <lapiceoi>
    break;
801056ea:	e9 d1 fe ff ff       	jmp    801055c0 <trap+0xb0>
801056ef:	90                   	nop
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
801056f0:	8b 7b 38             	mov    0x38(%ebx),%edi
801056f3:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
801056f7:	e8 84 df ff ff       	call   80103680 <cpuid>
801056fc:	c7 04 24 f4 75 10 80 	movl   $0x801075f4,(%esp)
80105703:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80105707:	89 74 24 08          	mov    %esi,0x8(%esp)
8010570b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010570f:	e8 3c af ff ff       	call   80100650 <cprintf>
    lapiceoi();
80105714:	e8 67 d0 ff ff       	call   80102780 <lapiceoi>
    break;
80105719:	e9 a2 fe ff ff       	jmp    801055c0 <trap+0xb0>
8010571e:	66 90                	xchg   %ax,%ax
    ideintr();
80105720:	e8 5b c9 ff ff       	call   80102080 <ideintr>
80105725:	eb 8f                	jmp    801056b6 <trap+0x1a6>
80105727:	90                   	nop
80105728:	90                   	nop
80105729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed)
80105730:	e8 6b df ff ff       	call   801036a0 <myproc>
80105735:	8b 70 24             	mov    0x24(%eax),%esi
80105738:	85 f6                	test   %esi,%esi
8010573a:	75 64                	jne    801057a0 <trap+0x290>
    myproc()->tf = tf;
8010573c:	e8 5f df ff ff       	call   801036a0 <myproc>
80105741:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105744:	e8 d7 ee ff ff       	call   80104620 <syscall>
    if(myproc()->killed)
80105749:	e8 52 df ff ff       	call   801036a0 <myproc>
8010574e:	8b 48 24             	mov    0x24(%eax),%ecx
80105751:	85 c9                	test   %ecx,%ecx
80105753:	0f 84 b8 fe ff ff    	je     80105611 <trap+0x101>
}
80105759:	83 c4 3c             	add    $0x3c,%esp
8010575c:	5b                   	pop    %ebx
8010575d:	5e                   	pop    %esi
8010575e:	5f                   	pop    %edi
8010575f:	5d                   	pop    %ebp
      exit();
80105760:	e9 3b e3 ff ff       	jmp    80103aa0 <exit>
80105765:	8d 76 00             	lea    0x0(%esi),%esi
          myproc()->num_pages = myproc()->num_pages+ 1;
80105768:	e8 33 df ff ff       	call   801036a0 <myproc>
8010576d:	89 c6                	mov    %eax,%esi
8010576f:	e8 2c df ff ff       	call   801036a0 <myproc>
80105774:	8b 40 7c             	mov    0x7c(%eax),%eax
80105777:	83 c0 01             	add    $0x1,%eax
8010577a:	89 46 7c             	mov    %eax,0x7c(%esi)
          cprintf("Page count increased to: %d \n", myproc()->num_pages);
8010577d:	e8 1e df ff ff       	call   801036a0 <myproc>
80105782:	8b 40 7c             	mov    0x7c(%eax),%eax
80105785:	c7 04 24 d1 75 10 80 	movl   $0x801075d1,(%esp)
8010578c:	89 44 24 04          	mov    %eax,0x4(%esp)
80105790:	e8 bb ae ff ff       	call   80100650 <cprintf>
      break;
80105795:	e9 26 fe ff ff       	jmp    801055c0 <trap+0xb0>
8010579a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
801057a0:	e8 fb e2 ff ff       	call   80103aa0 <exit>
801057a5:	eb 95                	jmp    8010573c <trap+0x22c>
801057a7:	90                   	nop
      acquire(&tickslock);
801057a8:	c7 04 24 80 4d 11 80 	movl   $0x80114d80,(%esp)
801057af:	e8 8c e9 ff ff       	call   80104140 <acquire>
      wakeup(&ticks);
801057b4:	c7 04 24 c0 55 11 80 	movl   $0x801155c0,(%esp)
      ticks++;
801057bb:	83 05 c0 55 11 80 01 	addl   $0x1,0x801155c0
      wakeup(&ticks);
801057c2:	e8 c9 e5 ff ff       	call   80103d90 <wakeup>
      release(&tickslock);
801057c7:	c7 04 24 80 4d 11 80 	movl   $0x80114d80,(%esp)
801057ce:	e8 5d ea ff ff       	call   80104230 <release>
801057d3:	e9 de fe ff ff       	jmp    801056b6 <trap+0x1a6>
801057d8:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
801057db:	8b 73 38             	mov    0x38(%ebx),%esi
801057de:	e8 9d de ff ff       	call   80103680 <cpuid>
801057e3:	89 7c 24 10          	mov    %edi,0x10(%esp)
801057e7:	89 74 24 0c          	mov    %esi,0xc(%esp)
801057eb:	89 44 24 08          	mov    %eax,0x8(%esp)
801057ef:	8b 43 30             	mov    0x30(%ebx),%eax
801057f2:	c7 04 24 18 76 10 80 	movl   $0x80107618,(%esp)
801057f9:	89 44 24 04          	mov    %eax,0x4(%esp)
801057fd:	e8 4e ae ff ff       	call   80100650 <cprintf>
      panic("trap");
80105802:	c7 04 24 ef 75 10 80 	movl   $0x801075ef,(%esp)
80105809:	e8 52 ab ff ff       	call   80100360 <panic>
8010580e:	66 90                	xchg   %ax,%ax

80105810 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105810:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
{
80105815:	55                   	push   %ebp
80105816:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105818:	85 c0                	test   %eax,%eax
8010581a:	74 14                	je     80105830 <uartgetc+0x20>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010581c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105821:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105822:	a8 01                	test   $0x1,%al
80105824:	74 0a                	je     80105830 <uartgetc+0x20>
80105826:	b2 f8                	mov    $0xf8,%dl
80105828:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105829:	0f b6 c0             	movzbl %al,%eax
}
8010582c:	5d                   	pop    %ebp
8010582d:	c3                   	ret    
8010582e:	66 90                	xchg   %ax,%ax
    return -1;
80105830:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105835:	5d                   	pop    %ebp
80105836:	c3                   	ret    
80105837:	89 f6                	mov    %esi,%esi
80105839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105840 <uartputc>:
  if(!uart)
80105840:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
80105845:	85 c0                	test   %eax,%eax
80105847:	74 3f                	je     80105888 <uartputc+0x48>
{
80105849:	55                   	push   %ebp
8010584a:	89 e5                	mov    %esp,%ebp
8010584c:	56                   	push   %esi
8010584d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105852:	53                   	push   %ebx
  if(!uart)
80105853:	bb 80 00 00 00       	mov    $0x80,%ebx
{
80105858:	83 ec 10             	sub    $0x10,%esp
8010585b:	eb 14                	jmp    80105871 <uartputc+0x31>
8010585d:	8d 76 00             	lea    0x0(%esi),%esi
    microdelay(10);
80105860:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
80105867:	e8 34 cf ff ff       	call   801027a0 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
8010586c:	83 eb 01             	sub    $0x1,%ebx
8010586f:	74 07                	je     80105878 <uartputc+0x38>
80105871:	89 f2                	mov    %esi,%edx
80105873:	ec                   	in     (%dx),%al
80105874:	a8 20                	test   $0x20,%al
80105876:	74 e8                	je     80105860 <uartputc+0x20>
  outb(COM1+0, c);
80105878:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010587c:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105881:	ee                   	out    %al,(%dx)
}
80105882:	83 c4 10             	add    $0x10,%esp
80105885:	5b                   	pop    %ebx
80105886:	5e                   	pop    %esi
80105887:	5d                   	pop    %ebp
80105888:	f3 c3                	repz ret 
8010588a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105890 <uartinit>:
{
80105890:	55                   	push   %ebp
80105891:	31 c9                	xor    %ecx,%ecx
80105893:	89 e5                	mov    %esp,%ebp
80105895:	89 c8                	mov    %ecx,%eax
80105897:	57                   	push   %edi
80105898:	bf fa 03 00 00       	mov    $0x3fa,%edi
8010589d:	56                   	push   %esi
8010589e:	89 fa                	mov    %edi,%edx
801058a0:	53                   	push   %ebx
801058a1:	83 ec 1c             	sub    $0x1c,%esp
801058a4:	ee                   	out    %al,(%dx)
801058a5:	be fb 03 00 00       	mov    $0x3fb,%esi
801058aa:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801058af:	89 f2                	mov    %esi,%edx
801058b1:	ee                   	out    %al,(%dx)
801058b2:	b8 0c 00 00 00       	mov    $0xc,%eax
801058b7:	b2 f8                	mov    $0xf8,%dl
801058b9:	ee                   	out    %al,(%dx)
801058ba:	bb f9 03 00 00       	mov    $0x3f9,%ebx
801058bf:	89 c8                	mov    %ecx,%eax
801058c1:	89 da                	mov    %ebx,%edx
801058c3:	ee                   	out    %al,(%dx)
801058c4:	b8 03 00 00 00       	mov    $0x3,%eax
801058c9:	89 f2                	mov    %esi,%edx
801058cb:	ee                   	out    %al,(%dx)
801058cc:	b2 fc                	mov    $0xfc,%dl
801058ce:	89 c8                	mov    %ecx,%eax
801058d0:	ee                   	out    %al,(%dx)
801058d1:	b8 01 00 00 00       	mov    $0x1,%eax
801058d6:	89 da                	mov    %ebx,%edx
801058d8:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801058d9:	b2 fd                	mov    $0xfd,%dl
801058db:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
801058dc:	3c ff                	cmp    $0xff,%al
801058de:	74 42                	je     80105922 <uartinit+0x92>
  uart = 1;
801058e0:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
801058e7:	00 00 00 
801058ea:	89 fa                	mov    %edi,%edx
801058ec:	ec                   	in     (%dx),%al
801058ed:	b2 f8                	mov    $0xf8,%dl
801058ef:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
801058f0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801058f7:	00 
  for(p="xv6...\n"; *p; p++)
801058f8:	bb 58 77 10 80       	mov    $0x80107758,%ebx
  ioapicenable(IRQ_COM1, 0);
801058fd:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
80105904:	e8 a7 c9 ff ff       	call   801022b0 <ioapicenable>
  for(p="xv6...\n"; *p; p++)
80105909:	b8 78 00 00 00       	mov    $0x78,%eax
8010590e:	66 90                	xchg   %ax,%ax
    uartputc(*p);
80105910:	89 04 24             	mov    %eax,(%esp)
  for(p="xv6...\n"; *p; p++)
80105913:	83 c3 01             	add    $0x1,%ebx
    uartputc(*p);
80105916:	e8 25 ff ff ff       	call   80105840 <uartputc>
  for(p="xv6...\n"; *p; p++)
8010591b:	0f be 03             	movsbl (%ebx),%eax
8010591e:	84 c0                	test   %al,%al
80105920:	75 ee                	jne    80105910 <uartinit+0x80>
}
80105922:	83 c4 1c             	add    $0x1c,%esp
80105925:	5b                   	pop    %ebx
80105926:	5e                   	pop    %esi
80105927:	5f                   	pop    %edi
80105928:	5d                   	pop    %ebp
80105929:	c3                   	ret    
8010592a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105930 <uartintr>:

void
uartintr(void)
{
80105930:	55                   	push   %ebp
80105931:	89 e5                	mov    %esp,%ebp
80105933:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
80105936:	c7 04 24 10 58 10 80 	movl   $0x80105810,(%esp)
8010593d:	e8 6e ae ff ff       	call   801007b0 <consoleintr>
}
80105942:	c9                   	leave  
80105943:	c3                   	ret    

80105944 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105944:	6a 00                	push   $0x0
  pushl $0
80105946:	6a 00                	push   $0x0
  jmp alltraps
80105948:	e9 d0 fa ff ff       	jmp    8010541d <alltraps>

8010594d <vector1>:
.globl vector1
vector1:
  pushl $0
8010594d:	6a 00                	push   $0x0
  pushl $1
8010594f:	6a 01                	push   $0x1
  jmp alltraps
80105951:	e9 c7 fa ff ff       	jmp    8010541d <alltraps>

80105956 <vector2>:
.globl vector2
vector2:
  pushl $0
80105956:	6a 00                	push   $0x0
  pushl $2
80105958:	6a 02                	push   $0x2
  jmp alltraps
8010595a:	e9 be fa ff ff       	jmp    8010541d <alltraps>

8010595f <vector3>:
.globl vector3
vector3:
  pushl $0
8010595f:	6a 00                	push   $0x0
  pushl $3
80105961:	6a 03                	push   $0x3
  jmp alltraps
80105963:	e9 b5 fa ff ff       	jmp    8010541d <alltraps>

80105968 <vector4>:
.globl vector4
vector4:
  pushl $0
80105968:	6a 00                	push   $0x0
  pushl $4
8010596a:	6a 04                	push   $0x4
  jmp alltraps
8010596c:	e9 ac fa ff ff       	jmp    8010541d <alltraps>

80105971 <vector5>:
.globl vector5
vector5:
  pushl $0
80105971:	6a 00                	push   $0x0
  pushl $5
80105973:	6a 05                	push   $0x5
  jmp alltraps
80105975:	e9 a3 fa ff ff       	jmp    8010541d <alltraps>

8010597a <vector6>:
.globl vector6
vector6:
  pushl $0
8010597a:	6a 00                	push   $0x0
  pushl $6
8010597c:	6a 06                	push   $0x6
  jmp alltraps
8010597e:	e9 9a fa ff ff       	jmp    8010541d <alltraps>

80105983 <vector7>:
.globl vector7
vector7:
  pushl $0
80105983:	6a 00                	push   $0x0
  pushl $7
80105985:	6a 07                	push   $0x7
  jmp alltraps
80105987:	e9 91 fa ff ff       	jmp    8010541d <alltraps>

8010598c <vector8>:
.globl vector8
vector8:
  pushl $8
8010598c:	6a 08                	push   $0x8
  jmp alltraps
8010598e:	e9 8a fa ff ff       	jmp    8010541d <alltraps>

80105993 <vector9>:
.globl vector9
vector9:
  pushl $0
80105993:	6a 00                	push   $0x0
  pushl $9
80105995:	6a 09                	push   $0x9
  jmp alltraps
80105997:	e9 81 fa ff ff       	jmp    8010541d <alltraps>

8010599c <vector10>:
.globl vector10
vector10:
  pushl $10
8010599c:	6a 0a                	push   $0xa
  jmp alltraps
8010599e:	e9 7a fa ff ff       	jmp    8010541d <alltraps>

801059a3 <vector11>:
.globl vector11
vector11:
  pushl $11
801059a3:	6a 0b                	push   $0xb
  jmp alltraps
801059a5:	e9 73 fa ff ff       	jmp    8010541d <alltraps>

801059aa <vector12>:
.globl vector12
vector12:
  pushl $12
801059aa:	6a 0c                	push   $0xc
  jmp alltraps
801059ac:	e9 6c fa ff ff       	jmp    8010541d <alltraps>

801059b1 <vector13>:
.globl vector13
vector13:
  pushl $13
801059b1:	6a 0d                	push   $0xd
  jmp alltraps
801059b3:	e9 65 fa ff ff       	jmp    8010541d <alltraps>

801059b8 <vector14>:
.globl vector14
vector14:
  pushl $14
801059b8:	6a 0e                	push   $0xe
  jmp alltraps
801059ba:	e9 5e fa ff ff       	jmp    8010541d <alltraps>

801059bf <vector15>:
.globl vector15
vector15:
  pushl $0
801059bf:	6a 00                	push   $0x0
  pushl $15
801059c1:	6a 0f                	push   $0xf
  jmp alltraps
801059c3:	e9 55 fa ff ff       	jmp    8010541d <alltraps>

801059c8 <vector16>:
.globl vector16
vector16:
  pushl $0
801059c8:	6a 00                	push   $0x0
  pushl $16
801059ca:	6a 10                	push   $0x10
  jmp alltraps
801059cc:	e9 4c fa ff ff       	jmp    8010541d <alltraps>

801059d1 <vector17>:
.globl vector17
vector17:
  pushl $17
801059d1:	6a 11                	push   $0x11
  jmp alltraps
801059d3:	e9 45 fa ff ff       	jmp    8010541d <alltraps>

801059d8 <vector18>:
.globl vector18
vector18:
  pushl $0
801059d8:	6a 00                	push   $0x0
  pushl $18
801059da:	6a 12                	push   $0x12
  jmp alltraps
801059dc:	e9 3c fa ff ff       	jmp    8010541d <alltraps>

801059e1 <vector19>:
.globl vector19
vector19:
  pushl $0
801059e1:	6a 00                	push   $0x0
  pushl $19
801059e3:	6a 13                	push   $0x13
  jmp alltraps
801059e5:	e9 33 fa ff ff       	jmp    8010541d <alltraps>

801059ea <vector20>:
.globl vector20
vector20:
  pushl $0
801059ea:	6a 00                	push   $0x0
  pushl $20
801059ec:	6a 14                	push   $0x14
  jmp alltraps
801059ee:	e9 2a fa ff ff       	jmp    8010541d <alltraps>

801059f3 <vector21>:
.globl vector21
vector21:
  pushl $0
801059f3:	6a 00                	push   $0x0
  pushl $21
801059f5:	6a 15                	push   $0x15
  jmp alltraps
801059f7:	e9 21 fa ff ff       	jmp    8010541d <alltraps>

801059fc <vector22>:
.globl vector22
vector22:
  pushl $0
801059fc:	6a 00                	push   $0x0
  pushl $22
801059fe:	6a 16                	push   $0x16
  jmp alltraps
80105a00:	e9 18 fa ff ff       	jmp    8010541d <alltraps>

80105a05 <vector23>:
.globl vector23
vector23:
  pushl $0
80105a05:	6a 00                	push   $0x0
  pushl $23
80105a07:	6a 17                	push   $0x17
  jmp alltraps
80105a09:	e9 0f fa ff ff       	jmp    8010541d <alltraps>

80105a0e <vector24>:
.globl vector24
vector24:
  pushl $0
80105a0e:	6a 00                	push   $0x0
  pushl $24
80105a10:	6a 18                	push   $0x18
  jmp alltraps
80105a12:	e9 06 fa ff ff       	jmp    8010541d <alltraps>

80105a17 <vector25>:
.globl vector25
vector25:
  pushl $0
80105a17:	6a 00                	push   $0x0
  pushl $25
80105a19:	6a 19                	push   $0x19
  jmp alltraps
80105a1b:	e9 fd f9 ff ff       	jmp    8010541d <alltraps>

80105a20 <vector26>:
.globl vector26
vector26:
  pushl $0
80105a20:	6a 00                	push   $0x0
  pushl $26
80105a22:	6a 1a                	push   $0x1a
  jmp alltraps
80105a24:	e9 f4 f9 ff ff       	jmp    8010541d <alltraps>

80105a29 <vector27>:
.globl vector27
vector27:
  pushl $0
80105a29:	6a 00                	push   $0x0
  pushl $27
80105a2b:	6a 1b                	push   $0x1b
  jmp alltraps
80105a2d:	e9 eb f9 ff ff       	jmp    8010541d <alltraps>

80105a32 <vector28>:
.globl vector28
vector28:
  pushl $0
80105a32:	6a 00                	push   $0x0
  pushl $28
80105a34:	6a 1c                	push   $0x1c
  jmp alltraps
80105a36:	e9 e2 f9 ff ff       	jmp    8010541d <alltraps>

80105a3b <vector29>:
.globl vector29
vector29:
  pushl $0
80105a3b:	6a 00                	push   $0x0
  pushl $29
80105a3d:	6a 1d                	push   $0x1d
  jmp alltraps
80105a3f:	e9 d9 f9 ff ff       	jmp    8010541d <alltraps>

80105a44 <vector30>:
.globl vector30
vector30:
  pushl $0
80105a44:	6a 00                	push   $0x0
  pushl $30
80105a46:	6a 1e                	push   $0x1e
  jmp alltraps
80105a48:	e9 d0 f9 ff ff       	jmp    8010541d <alltraps>

80105a4d <vector31>:
.globl vector31
vector31:
  pushl $0
80105a4d:	6a 00                	push   $0x0
  pushl $31
80105a4f:	6a 1f                	push   $0x1f
  jmp alltraps
80105a51:	e9 c7 f9 ff ff       	jmp    8010541d <alltraps>

80105a56 <vector32>:
.globl vector32
vector32:
  pushl $0
80105a56:	6a 00                	push   $0x0
  pushl $32
80105a58:	6a 20                	push   $0x20
  jmp alltraps
80105a5a:	e9 be f9 ff ff       	jmp    8010541d <alltraps>

80105a5f <vector33>:
.globl vector33
vector33:
  pushl $0
80105a5f:	6a 00                	push   $0x0
  pushl $33
80105a61:	6a 21                	push   $0x21
  jmp alltraps
80105a63:	e9 b5 f9 ff ff       	jmp    8010541d <alltraps>

80105a68 <vector34>:
.globl vector34
vector34:
  pushl $0
80105a68:	6a 00                	push   $0x0
  pushl $34
80105a6a:	6a 22                	push   $0x22
  jmp alltraps
80105a6c:	e9 ac f9 ff ff       	jmp    8010541d <alltraps>

80105a71 <vector35>:
.globl vector35
vector35:
  pushl $0
80105a71:	6a 00                	push   $0x0
  pushl $35
80105a73:	6a 23                	push   $0x23
  jmp alltraps
80105a75:	e9 a3 f9 ff ff       	jmp    8010541d <alltraps>

80105a7a <vector36>:
.globl vector36
vector36:
  pushl $0
80105a7a:	6a 00                	push   $0x0
  pushl $36
80105a7c:	6a 24                	push   $0x24
  jmp alltraps
80105a7e:	e9 9a f9 ff ff       	jmp    8010541d <alltraps>

80105a83 <vector37>:
.globl vector37
vector37:
  pushl $0
80105a83:	6a 00                	push   $0x0
  pushl $37
80105a85:	6a 25                	push   $0x25
  jmp alltraps
80105a87:	e9 91 f9 ff ff       	jmp    8010541d <alltraps>

80105a8c <vector38>:
.globl vector38
vector38:
  pushl $0
80105a8c:	6a 00                	push   $0x0
  pushl $38
80105a8e:	6a 26                	push   $0x26
  jmp alltraps
80105a90:	e9 88 f9 ff ff       	jmp    8010541d <alltraps>

80105a95 <vector39>:
.globl vector39
vector39:
  pushl $0
80105a95:	6a 00                	push   $0x0
  pushl $39
80105a97:	6a 27                	push   $0x27
  jmp alltraps
80105a99:	e9 7f f9 ff ff       	jmp    8010541d <alltraps>

80105a9e <vector40>:
.globl vector40
vector40:
  pushl $0
80105a9e:	6a 00                	push   $0x0
  pushl $40
80105aa0:	6a 28                	push   $0x28
  jmp alltraps
80105aa2:	e9 76 f9 ff ff       	jmp    8010541d <alltraps>

80105aa7 <vector41>:
.globl vector41
vector41:
  pushl $0
80105aa7:	6a 00                	push   $0x0
  pushl $41
80105aa9:	6a 29                	push   $0x29
  jmp alltraps
80105aab:	e9 6d f9 ff ff       	jmp    8010541d <alltraps>

80105ab0 <vector42>:
.globl vector42
vector42:
  pushl $0
80105ab0:	6a 00                	push   $0x0
  pushl $42
80105ab2:	6a 2a                	push   $0x2a
  jmp alltraps
80105ab4:	e9 64 f9 ff ff       	jmp    8010541d <alltraps>

80105ab9 <vector43>:
.globl vector43
vector43:
  pushl $0
80105ab9:	6a 00                	push   $0x0
  pushl $43
80105abb:	6a 2b                	push   $0x2b
  jmp alltraps
80105abd:	e9 5b f9 ff ff       	jmp    8010541d <alltraps>

80105ac2 <vector44>:
.globl vector44
vector44:
  pushl $0
80105ac2:	6a 00                	push   $0x0
  pushl $44
80105ac4:	6a 2c                	push   $0x2c
  jmp alltraps
80105ac6:	e9 52 f9 ff ff       	jmp    8010541d <alltraps>

80105acb <vector45>:
.globl vector45
vector45:
  pushl $0
80105acb:	6a 00                	push   $0x0
  pushl $45
80105acd:	6a 2d                	push   $0x2d
  jmp alltraps
80105acf:	e9 49 f9 ff ff       	jmp    8010541d <alltraps>

80105ad4 <vector46>:
.globl vector46
vector46:
  pushl $0
80105ad4:	6a 00                	push   $0x0
  pushl $46
80105ad6:	6a 2e                	push   $0x2e
  jmp alltraps
80105ad8:	e9 40 f9 ff ff       	jmp    8010541d <alltraps>

80105add <vector47>:
.globl vector47
vector47:
  pushl $0
80105add:	6a 00                	push   $0x0
  pushl $47
80105adf:	6a 2f                	push   $0x2f
  jmp alltraps
80105ae1:	e9 37 f9 ff ff       	jmp    8010541d <alltraps>

80105ae6 <vector48>:
.globl vector48
vector48:
  pushl $0
80105ae6:	6a 00                	push   $0x0
  pushl $48
80105ae8:	6a 30                	push   $0x30
  jmp alltraps
80105aea:	e9 2e f9 ff ff       	jmp    8010541d <alltraps>

80105aef <vector49>:
.globl vector49
vector49:
  pushl $0
80105aef:	6a 00                	push   $0x0
  pushl $49
80105af1:	6a 31                	push   $0x31
  jmp alltraps
80105af3:	e9 25 f9 ff ff       	jmp    8010541d <alltraps>

80105af8 <vector50>:
.globl vector50
vector50:
  pushl $0
80105af8:	6a 00                	push   $0x0
  pushl $50
80105afa:	6a 32                	push   $0x32
  jmp alltraps
80105afc:	e9 1c f9 ff ff       	jmp    8010541d <alltraps>

80105b01 <vector51>:
.globl vector51
vector51:
  pushl $0
80105b01:	6a 00                	push   $0x0
  pushl $51
80105b03:	6a 33                	push   $0x33
  jmp alltraps
80105b05:	e9 13 f9 ff ff       	jmp    8010541d <alltraps>

80105b0a <vector52>:
.globl vector52
vector52:
  pushl $0
80105b0a:	6a 00                	push   $0x0
  pushl $52
80105b0c:	6a 34                	push   $0x34
  jmp alltraps
80105b0e:	e9 0a f9 ff ff       	jmp    8010541d <alltraps>

80105b13 <vector53>:
.globl vector53
vector53:
  pushl $0
80105b13:	6a 00                	push   $0x0
  pushl $53
80105b15:	6a 35                	push   $0x35
  jmp alltraps
80105b17:	e9 01 f9 ff ff       	jmp    8010541d <alltraps>

80105b1c <vector54>:
.globl vector54
vector54:
  pushl $0
80105b1c:	6a 00                	push   $0x0
  pushl $54
80105b1e:	6a 36                	push   $0x36
  jmp alltraps
80105b20:	e9 f8 f8 ff ff       	jmp    8010541d <alltraps>

80105b25 <vector55>:
.globl vector55
vector55:
  pushl $0
80105b25:	6a 00                	push   $0x0
  pushl $55
80105b27:	6a 37                	push   $0x37
  jmp alltraps
80105b29:	e9 ef f8 ff ff       	jmp    8010541d <alltraps>

80105b2e <vector56>:
.globl vector56
vector56:
  pushl $0
80105b2e:	6a 00                	push   $0x0
  pushl $56
80105b30:	6a 38                	push   $0x38
  jmp alltraps
80105b32:	e9 e6 f8 ff ff       	jmp    8010541d <alltraps>

80105b37 <vector57>:
.globl vector57
vector57:
  pushl $0
80105b37:	6a 00                	push   $0x0
  pushl $57
80105b39:	6a 39                	push   $0x39
  jmp alltraps
80105b3b:	e9 dd f8 ff ff       	jmp    8010541d <alltraps>

80105b40 <vector58>:
.globl vector58
vector58:
  pushl $0
80105b40:	6a 00                	push   $0x0
  pushl $58
80105b42:	6a 3a                	push   $0x3a
  jmp alltraps
80105b44:	e9 d4 f8 ff ff       	jmp    8010541d <alltraps>

80105b49 <vector59>:
.globl vector59
vector59:
  pushl $0
80105b49:	6a 00                	push   $0x0
  pushl $59
80105b4b:	6a 3b                	push   $0x3b
  jmp alltraps
80105b4d:	e9 cb f8 ff ff       	jmp    8010541d <alltraps>

80105b52 <vector60>:
.globl vector60
vector60:
  pushl $0
80105b52:	6a 00                	push   $0x0
  pushl $60
80105b54:	6a 3c                	push   $0x3c
  jmp alltraps
80105b56:	e9 c2 f8 ff ff       	jmp    8010541d <alltraps>

80105b5b <vector61>:
.globl vector61
vector61:
  pushl $0
80105b5b:	6a 00                	push   $0x0
  pushl $61
80105b5d:	6a 3d                	push   $0x3d
  jmp alltraps
80105b5f:	e9 b9 f8 ff ff       	jmp    8010541d <alltraps>

80105b64 <vector62>:
.globl vector62
vector62:
  pushl $0
80105b64:	6a 00                	push   $0x0
  pushl $62
80105b66:	6a 3e                	push   $0x3e
  jmp alltraps
80105b68:	e9 b0 f8 ff ff       	jmp    8010541d <alltraps>

80105b6d <vector63>:
.globl vector63
vector63:
  pushl $0
80105b6d:	6a 00                	push   $0x0
  pushl $63
80105b6f:	6a 3f                	push   $0x3f
  jmp alltraps
80105b71:	e9 a7 f8 ff ff       	jmp    8010541d <alltraps>

80105b76 <vector64>:
.globl vector64
vector64:
  pushl $0
80105b76:	6a 00                	push   $0x0
  pushl $64
80105b78:	6a 40                	push   $0x40
  jmp alltraps
80105b7a:	e9 9e f8 ff ff       	jmp    8010541d <alltraps>

80105b7f <vector65>:
.globl vector65
vector65:
  pushl $0
80105b7f:	6a 00                	push   $0x0
  pushl $65
80105b81:	6a 41                	push   $0x41
  jmp alltraps
80105b83:	e9 95 f8 ff ff       	jmp    8010541d <alltraps>

80105b88 <vector66>:
.globl vector66
vector66:
  pushl $0
80105b88:	6a 00                	push   $0x0
  pushl $66
80105b8a:	6a 42                	push   $0x42
  jmp alltraps
80105b8c:	e9 8c f8 ff ff       	jmp    8010541d <alltraps>

80105b91 <vector67>:
.globl vector67
vector67:
  pushl $0
80105b91:	6a 00                	push   $0x0
  pushl $67
80105b93:	6a 43                	push   $0x43
  jmp alltraps
80105b95:	e9 83 f8 ff ff       	jmp    8010541d <alltraps>

80105b9a <vector68>:
.globl vector68
vector68:
  pushl $0
80105b9a:	6a 00                	push   $0x0
  pushl $68
80105b9c:	6a 44                	push   $0x44
  jmp alltraps
80105b9e:	e9 7a f8 ff ff       	jmp    8010541d <alltraps>

80105ba3 <vector69>:
.globl vector69
vector69:
  pushl $0
80105ba3:	6a 00                	push   $0x0
  pushl $69
80105ba5:	6a 45                	push   $0x45
  jmp alltraps
80105ba7:	e9 71 f8 ff ff       	jmp    8010541d <alltraps>

80105bac <vector70>:
.globl vector70
vector70:
  pushl $0
80105bac:	6a 00                	push   $0x0
  pushl $70
80105bae:	6a 46                	push   $0x46
  jmp alltraps
80105bb0:	e9 68 f8 ff ff       	jmp    8010541d <alltraps>

80105bb5 <vector71>:
.globl vector71
vector71:
  pushl $0
80105bb5:	6a 00                	push   $0x0
  pushl $71
80105bb7:	6a 47                	push   $0x47
  jmp alltraps
80105bb9:	e9 5f f8 ff ff       	jmp    8010541d <alltraps>

80105bbe <vector72>:
.globl vector72
vector72:
  pushl $0
80105bbe:	6a 00                	push   $0x0
  pushl $72
80105bc0:	6a 48                	push   $0x48
  jmp alltraps
80105bc2:	e9 56 f8 ff ff       	jmp    8010541d <alltraps>

80105bc7 <vector73>:
.globl vector73
vector73:
  pushl $0
80105bc7:	6a 00                	push   $0x0
  pushl $73
80105bc9:	6a 49                	push   $0x49
  jmp alltraps
80105bcb:	e9 4d f8 ff ff       	jmp    8010541d <alltraps>

80105bd0 <vector74>:
.globl vector74
vector74:
  pushl $0
80105bd0:	6a 00                	push   $0x0
  pushl $74
80105bd2:	6a 4a                	push   $0x4a
  jmp alltraps
80105bd4:	e9 44 f8 ff ff       	jmp    8010541d <alltraps>

80105bd9 <vector75>:
.globl vector75
vector75:
  pushl $0
80105bd9:	6a 00                	push   $0x0
  pushl $75
80105bdb:	6a 4b                	push   $0x4b
  jmp alltraps
80105bdd:	e9 3b f8 ff ff       	jmp    8010541d <alltraps>

80105be2 <vector76>:
.globl vector76
vector76:
  pushl $0
80105be2:	6a 00                	push   $0x0
  pushl $76
80105be4:	6a 4c                	push   $0x4c
  jmp alltraps
80105be6:	e9 32 f8 ff ff       	jmp    8010541d <alltraps>

80105beb <vector77>:
.globl vector77
vector77:
  pushl $0
80105beb:	6a 00                	push   $0x0
  pushl $77
80105bed:	6a 4d                	push   $0x4d
  jmp alltraps
80105bef:	e9 29 f8 ff ff       	jmp    8010541d <alltraps>

80105bf4 <vector78>:
.globl vector78
vector78:
  pushl $0
80105bf4:	6a 00                	push   $0x0
  pushl $78
80105bf6:	6a 4e                	push   $0x4e
  jmp alltraps
80105bf8:	e9 20 f8 ff ff       	jmp    8010541d <alltraps>

80105bfd <vector79>:
.globl vector79
vector79:
  pushl $0
80105bfd:	6a 00                	push   $0x0
  pushl $79
80105bff:	6a 4f                	push   $0x4f
  jmp alltraps
80105c01:	e9 17 f8 ff ff       	jmp    8010541d <alltraps>

80105c06 <vector80>:
.globl vector80
vector80:
  pushl $0
80105c06:	6a 00                	push   $0x0
  pushl $80
80105c08:	6a 50                	push   $0x50
  jmp alltraps
80105c0a:	e9 0e f8 ff ff       	jmp    8010541d <alltraps>

80105c0f <vector81>:
.globl vector81
vector81:
  pushl $0
80105c0f:	6a 00                	push   $0x0
  pushl $81
80105c11:	6a 51                	push   $0x51
  jmp alltraps
80105c13:	e9 05 f8 ff ff       	jmp    8010541d <alltraps>

80105c18 <vector82>:
.globl vector82
vector82:
  pushl $0
80105c18:	6a 00                	push   $0x0
  pushl $82
80105c1a:	6a 52                	push   $0x52
  jmp alltraps
80105c1c:	e9 fc f7 ff ff       	jmp    8010541d <alltraps>

80105c21 <vector83>:
.globl vector83
vector83:
  pushl $0
80105c21:	6a 00                	push   $0x0
  pushl $83
80105c23:	6a 53                	push   $0x53
  jmp alltraps
80105c25:	e9 f3 f7 ff ff       	jmp    8010541d <alltraps>

80105c2a <vector84>:
.globl vector84
vector84:
  pushl $0
80105c2a:	6a 00                	push   $0x0
  pushl $84
80105c2c:	6a 54                	push   $0x54
  jmp alltraps
80105c2e:	e9 ea f7 ff ff       	jmp    8010541d <alltraps>

80105c33 <vector85>:
.globl vector85
vector85:
  pushl $0
80105c33:	6a 00                	push   $0x0
  pushl $85
80105c35:	6a 55                	push   $0x55
  jmp alltraps
80105c37:	e9 e1 f7 ff ff       	jmp    8010541d <alltraps>

80105c3c <vector86>:
.globl vector86
vector86:
  pushl $0
80105c3c:	6a 00                	push   $0x0
  pushl $86
80105c3e:	6a 56                	push   $0x56
  jmp alltraps
80105c40:	e9 d8 f7 ff ff       	jmp    8010541d <alltraps>

80105c45 <vector87>:
.globl vector87
vector87:
  pushl $0
80105c45:	6a 00                	push   $0x0
  pushl $87
80105c47:	6a 57                	push   $0x57
  jmp alltraps
80105c49:	e9 cf f7 ff ff       	jmp    8010541d <alltraps>

80105c4e <vector88>:
.globl vector88
vector88:
  pushl $0
80105c4e:	6a 00                	push   $0x0
  pushl $88
80105c50:	6a 58                	push   $0x58
  jmp alltraps
80105c52:	e9 c6 f7 ff ff       	jmp    8010541d <alltraps>

80105c57 <vector89>:
.globl vector89
vector89:
  pushl $0
80105c57:	6a 00                	push   $0x0
  pushl $89
80105c59:	6a 59                	push   $0x59
  jmp alltraps
80105c5b:	e9 bd f7 ff ff       	jmp    8010541d <alltraps>

80105c60 <vector90>:
.globl vector90
vector90:
  pushl $0
80105c60:	6a 00                	push   $0x0
  pushl $90
80105c62:	6a 5a                	push   $0x5a
  jmp alltraps
80105c64:	e9 b4 f7 ff ff       	jmp    8010541d <alltraps>

80105c69 <vector91>:
.globl vector91
vector91:
  pushl $0
80105c69:	6a 00                	push   $0x0
  pushl $91
80105c6b:	6a 5b                	push   $0x5b
  jmp alltraps
80105c6d:	e9 ab f7 ff ff       	jmp    8010541d <alltraps>

80105c72 <vector92>:
.globl vector92
vector92:
  pushl $0
80105c72:	6a 00                	push   $0x0
  pushl $92
80105c74:	6a 5c                	push   $0x5c
  jmp alltraps
80105c76:	e9 a2 f7 ff ff       	jmp    8010541d <alltraps>

80105c7b <vector93>:
.globl vector93
vector93:
  pushl $0
80105c7b:	6a 00                	push   $0x0
  pushl $93
80105c7d:	6a 5d                	push   $0x5d
  jmp alltraps
80105c7f:	e9 99 f7 ff ff       	jmp    8010541d <alltraps>

80105c84 <vector94>:
.globl vector94
vector94:
  pushl $0
80105c84:	6a 00                	push   $0x0
  pushl $94
80105c86:	6a 5e                	push   $0x5e
  jmp alltraps
80105c88:	e9 90 f7 ff ff       	jmp    8010541d <alltraps>

80105c8d <vector95>:
.globl vector95
vector95:
  pushl $0
80105c8d:	6a 00                	push   $0x0
  pushl $95
80105c8f:	6a 5f                	push   $0x5f
  jmp alltraps
80105c91:	e9 87 f7 ff ff       	jmp    8010541d <alltraps>

80105c96 <vector96>:
.globl vector96
vector96:
  pushl $0
80105c96:	6a 00                	push   $0x0
  pushl $96
80105c98:	6a 60                	push   $0x60
  jmp alltraps
80105c9a:	e9 7e f7 ff ff       	jmp    8010541d <alltraps>

80105c9f <vector97>:
.globl vector97
vector97:
  pushl $0
80105c9f:	6a 00                	push   $0x0
  pushl $97
80105ca1:	6a 61                	push   $0x61
  jmp alltraps
80105ca3:	e9 75 f7 ff ff       	jmp    8010541d <alltraps>

80105ca8 <vector98>:
.globl vector98
vector98:
  pushl $0
80105ca8:	6a 00                	push   $0x0
  pushl $98
80105caa:	6a 62                	push   $0x62
  jmp alltraps
80105cac:	e9 6c f7 ff ff       	jmp    8010541d <alltraps>

80105cb1 <vector99>:
.globl vector99
vector99:
  pushl $0
80105cb1:	6a 00                	push   $0x0
  pushl $99
80105cb3:	6a 63                	push   $0x63
  jmp alltraps
80105cb5:	e9 63 f7 ff ff       	jmp    8010541d <alltraps>

80105cba <vector100>:
.globl vector100
vector100:
  pushl $0
80105cba:	6a 00                	push   $0x0
  pushl $100
80105cbc:	6a 64                	push   $0x64
  jmp alltraps
80105cbe:	e9 5a f7 ff ff       	jmp    8010541d <alltraps>

80105cc3 <vector101>:
.globl vector101
vector101:
  pushl $0
80105cc3:	6a 00                	push   $0x0
  pushl $101
80105cc5:	6a 65                	push   $0x65
  jmp alltraps
80105cc7:	e9 51 f7 ff ff       	jmp    8010541d <alltraps>

80105ccc <vector102>:
.globl vector102
vector102:
  pushl $0
80105ccc:	6a 00                	push   $0x0
  pushl $102
80105cce:	6a 66                	push   $0x66
  jmp alltraps
80105cd0:	e9 48 f7 ff ff       	jmp    8010541d <alltraps>

80105cd5 <vector103>:
.globl vector103
vector103:
  pushl $0
80105cd5:	6a 00                	push   $0x0
  pushl $103
80105cd7:	6a 67                	push   $0x67
  jmp alltraps
80105cd9:	e9 3f f7 ff ff       	jmp    8010541d <alltraps>

80105cde <vector104>:
.globl vector104
vector104:
  pushl $0
80105cde:	6a 00                	push   $0x0
  pushl $104
80105ce0:	6a 68                	push   $0x68
  jmp alltraps
80105ce2:	e9 36 f7 ff ff       	jmp    8010541d <alltraps>

80105ce7 <vector105>:
.globl vector105
vector105:
  pushl $0
80105ce7:	6a 00                	push   $0x0
  pushl $105
80105ce9:	6a 69                	push   $0x69
  jmp alltraps
80105ceb:	e9 2d f7 ff ff       	jmp    8010541d <alltraps>

80105cf0 <vector106>:
.globl vector106
vector106:
  pushl $0
80105cf0:	6a 00                	push   $0x0
  pushl $106
80105cf2:	6a 6a                	push   $0x6a
  jmp alltraps
80105cf4:	e9 24 f7 ff ff       	jmp    8010541d <alltraps>

80105cf9 <vector107>:
.globl vector107
vector107:
  pushl $0
80105cf9:	6a 00                	push   $0x0
  pushl $107
80105cfb:	6a 6b                	push   $0x6b
  jmp alltraps
80105cfd:	e9 1b f7 ff ff       	jmp    8010541d <alltraps>

80105d02 <vector108>:
.globl vector108
vector108:
  pushl $0
80105d02:	6a 00                	push   $0x0
  pushl $108
80105d04:	6a 6c                	push   $0x6c
  jmp alltraps
80105d06:	e9 12 f7 ff ff       	jmp    8010541d <alltraps>

80105d0b <vector109>:
.globl vector109
vector109:
  pushl $0
80105d0b:	6a 00                	push   $0x0
  pushl $109
80105d0d:	6a 6d                	push   $0x6d
  jmp alltraps
80105d0f:	e9 09 f7 ff ff       	jmp    8010541d <alltraps>

80105d14 <vector110>:
.globl vector110
vector110:
  pushl $0
80105d14:	6a 00                	push   $0x0
  pushl $110
80105d16:	6a 6e                	push   $0x6e
  jmp alltraps
80105d18:	e9 00 f7 ff ff       	jmp    8010541d <alltraps>

80105d1d <vector111>:
.globl vector111
vector111:
  pushl $0
80105d1d:	6a 00                	push   $0x0
  pushl $111
80105d1f:	6a 6f                	push   $0x6f
  jmp alltraps
80105d21:	e9 f7 f6 ff ff       	jmp    8010541d <alltraps>

80105d26 <vector112>:
.globl vector112
vector112:
  pushl $0
80105d26:	6a 00                	push   $0x0
  pushl $112
80105d28:	6a 70                	push   $0x70
  jmp alltraps
80105d2a:	e9 ee f6 ff ff       	jmp    8010541d <alltraps>

80105d2f <vector113>:
.globl vector113
vector113:
  pushl $0
80105d2f:	6a 00                	push   $0x0
  pushl $113
80105d31:	6a 71                	push   $0x71
  jmp alltraps
80105d33:	e9 e5 f6 ff ff       	jmp    8010541d <alltraps>

80105d38 <vector114>:
.globl vector114
vector114:
  pushl $0
80105d38:	6a 00                	push   $0x0
  pushl $114
80105d3a:	6a 72                	push   $0x72
  jmp alltraps
80105d3c:	e9 dc f6 ff ff       	jmp    8010541d <alltraps>

80105d41 <vector115>:
.globl vector115
vector115:
  pushl $0
80105d41:	6a 00                	push   $0x0
  pushl $115
80105d43:	6a 73                	push   $0x73
  jmp alltraps
80105d45:	e9 d3 f6 ff ff       	jmp    8010541d <alltraps>

80105d4a <vector116>:
.globl vector116
vector116:
  pushl $0
80105d4a:	6a 00                	push   $0x0
  pushl $116
80105d4c:	6a 74                	push   $0x74
  jmp alltraps
80105d4e:	e9 ca f6 ff ff       	jmp    8010541d <alltraps>

80105d53 <vector117>:
.globl vector117
vector117:
  pushl $0
80105d53:	6a 00                	push   $0x0
  pushl $117
80105d55:	6a 75                	push   $0x75
  jmp alltraps
80105d57:	e9 c1 f6 ff ff       	jmp    8010541d <alltraps>

80105d5c <vector118>:
.globl vector118
vector118:
  pushl $0
80105d5c:	6a 00                	push   $0x0
  pushl $118
80105d5e:	6a 76                	push   $0x76
  jmp alltraps
80105d60:	e9 b8 f6 ff ff       	jmp    8010541d <alltraps>

80105d65 <vector119>:
.globl vector119
vector119:
  pushl $0
80105d65:	6a 00                	push   $0x0
  pushl $119
80105d67:	6a 77                	push   $0x77
  jmp alltraps
80105d69:	e9 af f6 ff ff       	jmp    8010541d <alltraps>

80105d6e <vector120>:
.globl vector120
vector120:
  pushl $0
80105d6e:	6a 00                	push   $0x0
  pushl $120
80105d70:	6a 78                	push   $0x78
  jmp alltraps
80105d72:	e9 a6 f6 ff ff       	jmp    8010541d <alltraps>

80105d77 <vector121>:
.globl vector121
vector121:
  pushl $0
80105d77:	6a 00                	push   $0x0
  pushl $121
80105d79:	6a 79                	push   $0x79
  jmp alltraps
80105d7b:	e9 9d f6 ff ff       	jmp    8010541d <alltraps>

80105d80 <vector122>:
.globl vector122
vector122:
  pushl $0
80105d80:	6a 00                	push   $0x0
  pushl $122
80105d82:	6a 7a                	push   $0x7a
  jmp alltraps
80105d84:	e9 94 f6 ff ff       	jmp    8010541d <alltraps>

80105d89 <vector123>:
.globl vector123
vector123:
  pushl $0
80105d89:	6a 00                	push   $0x0
  pushl $123
80105d8b:	6a 7b                	push   $0x7b
  jmp alltraps
80105d8d:	e9 8b f6 ff ff       	jmp    8010541d <alltraps>

80105d92 <vector124>:
.globl vector124
vector124:
  pushl $0
80105d92:	6a 00                	push   $0x0
  pushl $124
80105d94:	6a 7c                	push   $0x7c
  jmp alltraps
80105d96:	e9 82 f6 ff ff       	jmp    8010541d <alltraps>

80105d9b <vector125>:
.globl vector125
vector125:
  pushl $0
80105d9b:	6a 00                	push   $0x0
  pushl $125
80105d9d:	6a 7d                	push   $0x7d
  jmp alltraps
80105d9f:	e9 79 f6 ff ff       	jmp    8010541d <alltraps>

80105da4 <vector126>:
.globl vector126
vector126:
  pushl $0
80105da4:	6a 00                	push   $0x0
  pushl $126
80105da6:	6a 7e                	push   $0x7e
  jmp alltraps
80105da8:	e9 70 f6 ff ff       	jmp    8010541d <alltraps>

80105dad <vector127>:
.globl vector127
vector127:
  pushl $0
80105dad:	6a 00                	push   $0x0
  pushl $127
80105daf:	6a 7f                	push   $0x7f
  jmp alltraps
80105db1:	e9 67 f6 ff ff       	jmp    8010541d <alltraps>

80105db6 <vector128>:
.globl vector128
vector128:
  pushl $0
80105db6:	6a 00                	push   $0x0
  pushl $128
80105db8:	68 80 00 00 00       	push   $0x80
  jmp alltraps
80105dbd:	e9 5b f6 ff ff       	jmp    8010541d <alltraps>

80105dc2 <vector129>:
.globl vector129
vector129:
  pushl $0
80105dc2:	6a 00                	push   $0x0
  pushl $129
80105dc4:	68 81 00 00 00       	push   $0x81
  jmp alltraps
80105dc9:	e9 4f f6 ff ff       	jmp    8010541d <alltraps>

80105dce <vector130>:
.globl vector130
vector130:
  pushl $0
80105dce:	6a 00                	push   $0x0
  pushl $130
80105dd0:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80105dd5:	e9 43 f6 ff ff       	jmp    8010541d <alltraps>

80105dda <vector131>:
.globl vector131
vector131:
  pushl $0
80105dda:	6a 00                	push   $0x0
  pushl $131
80105ddc:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80105de1:	e9 37 f6 ff ff       	jmp    8010541d <alltraps>

80105de6 <vector132>:
.globl vector132
vector132:
  pushl $0
80105de6:	6a 00                	push   $0x0
  pushl $132
80105de8:	68 84 00 00 00       	push   $0x84
  jmp alltraps
80105ded:	e9 2b f6 ff ff       	jmp    8010541d <alltraps>

80105df2 <vector133>:
.globl vector133
vector133:
  pushl $0
80105df2:	6a 00                	push   $0x0
  pushl $133
80105df4:	68 85 00 00 00       	push   $0x85
  jmp alltraps
80105df9:	e9 1f f6 ff ff       	jmp    8010541d <alltraps>

80105dfe <vector134>:
.globl vector134
vector134:
  pushl $0
80105dfe:	6a 00                	push   $0x0
  pushl $134
80105e00:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80105e05:	e9 13 f6 ff ff       	jmp    8010541d <alltraps>

80105e0a <vector135>:
.globl vector135
vector135:
  pushl $0
80105e0a:	6a 00                	push   $0x0
  pushl $135
80105e0c:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80105e11:	e9 07 f6 ff ff       	jmp    8010541d <alltraps>

80105e16 <vector136>:
.globl vector136
vector136:
  pushl $0
80105e16:	6a 00                	push   $0x0
  pushl $136
80105e18:	68 88 00 00 00       	push   $0x88
  jmp alltraps
80105e1d:	e9 fb f5 ff ff       	jmp    8010541d <alltraps>

80105e22 <vector137>:
.globl vector137
vector137:
  pushl $0
80105e22:	6a 00                	push   $0x0
  pushl $137
80105e24:	68 89 00 00 00       	push   $0x89
  jmp alltraps
80105e29:	e9 ef f5 ff ff       	jmp    8010541d <alltraps>

80105e2e <vector138>:
.globl vector138
vector138:
  pushl $0
80105e2e:	6a 00                	push   $0x0
  pushl $138
80105e30:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80105e35:	e9 e3 f5 ff ff       	jmp    8010541d <alltraps>

80105e3a <vector139>:
.globl vector139
vector139:
  pushl $0
80105e3a:	6a 00                	push   $0x0
  pushl $139
80105e3c:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80105e41:	e9 d7 f5 ff ff       	jmp    8010541d <alltraps>

80105e46 <vector140>:
.globl vector140
vector140:
  pushl $0
80105e46:	6a 00                	push   $0x0
  pushl $140
80105e48:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
80105e4d:	e9 cb f5 ff ff       	jmp    8010541d <alltraps>

80105e52 <vector141>:
.globl vector141
vector141:
  pushl $0
80105e52:	6a 00                	push   $0x0
  pushl $141
80105e54:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
80105e59:	e9 bf f5 ff ff       	jmp    8010541d <alltraps>

80105e5e <vector142>:
.globl vector142
vector142:
  pushl $0
80105e5e:	6a 00                	push   $0x0
  pushl $142
80105e60:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80105e65:	e9 b3 f5 ff ff       	jmp    8010541d <alltraps>

80105e6a <vector143>:
.globl vector143
vector143:
  pushl $0
80105e6a:	6a 00                	push   $0x0
  pushl $143
80105e6c:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80105e71:	e9 a7 f5 ff ff       	jmp    8010541d <alltraps>

80105e76 <vector144>:
.globl vector144
vector144:
  pushl $0
80105e76:	6a 00                	push   $0x0
  pushl $144
80105e78:	68 90 00 00 00       	push   $0x90
  jmp alltraps
80105e7d:	e9 9b f5 ff ff       	jmp    8010541d <alltraps>

80105e82 <vector145>:
.globl vector145
vector145:
  pushl $0
80105e82:	6a 00                	push   $0x0
  pushl $145
80105e84:	68 91 00 00 00       	push   $0x91
  jmp alltraps
80105e89:	e9 8f f5 ff ff       	jmp    8010541d <alltraps>

80105e8e <vector146>:
.globl vector146
vector146:
  pushl $0
80105e8e:	6a 00                	push   $0x0
  pushl $146
80105e90:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80105e95:	e9 83 f5 ff ff       	jmp    8010541d <alltraps>

80105e9a <vector147>:
.globl vector147
vector147:
  pushl $0
80105e9a:	6a 00                	push   $0x0
  pushl $147
80105e9c:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80105ea1:	e9 77 f5 ff ff       	jmp    8010541d <alltraps>

80105ea6 <vector148>:
.globl vector148
vector148:
  pushl $0
80105ea6:	6a 00                	push   $0x0
  pushl $148
80105ea8:	68 94 00 00 00       	push   $0x94
  jmp alltraps
80105ead:	e9 6b f5 ff ff       	jmp    8010541d <alltraps>

80105eb2 <vector149>:
.globl vector149
vector149:
  pushl $0
80105eb2:	6a 00                	push   $0x0
  pushl $149
80105eb4:	68 95 00 00 00       	push   $0x95
  jmp alltraps
80105eb9:	e9 5f f5 ff ff       	jmp    8010541d <alltraps>

80105ebe <vector150>:
.globl vector150
vector150:
  pushl $0
80105ebe:	6a 00                	push   $0x0
  pushl $150
80105ec0:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80105ec5:	e9 53 f5 ff ff       	jmp    8010541d <alltraps>

80105eca <vector151>:
.globl vector151
vector151:
  pushl $0
80105eca:	6a 00                	push   $0x0
  pushl $151
80105ecc:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80105ed1:	e9 47 f5 ff ff       	jmp    8010541d <alltraps>

80105ed6 <vector152>:
.globl vector152
vector152:
  pushl $0
80105ed6:	6a 00                	push   $0x0
  pushl $152
80105ed8:	68 98 00 00 00       	push   $0x98
  jmp alltraps
80105edd:	e9 3b f5 ff ff       	jmp    8010541d <alltraps>

80105ee2 <vector153>:
.globl vector153
vector153:
  pushl $0
80105ee2:	6a 00                	push   $0x0
  pushl $153
80105ee4:	68 99 00 00 00       	push   $0x99
  jmp alltraps
80105ee9:	e9 2f f5 ff ff       	jmp    8010541d <alltraps>

80105eee <vector154>:
.globl vector154
vector154:
  pushl $0
80105eee:	6a 00                	push   $0x0
  pushl $154
80105ef0:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80105ef5:	e9 23 f5 ff ff       	jmp    8010541d <alltraps>

80105efa <vector155>:
.globl vector155
vector155:
  pushl $0
80105efa:	6a 00                	push   $0x0
  pushl $155
80105efc:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80105f01:	e9 17 f5 ff ff       	jmp    8010541d <alltraps>

80105f06 <vector156>:
.globl vector156
vector156:
  pushl $0
80105f06:	6a 00                	push   $0x0
  pushl $156
80105f08:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
80105f0d:	e9 0b f5 ff ff       	jmp    8010541d <alltraps>

80105f12 <vector157>:
.globl vector157
vector157:
  pushl $0
80105f12:	6a 00                	push   $0x0
  pushl $157
80105f14:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
80105f19:	e9 ff f4 ff ff       	jmp    8010541d <alltraps>

80105f1e <vector158>:
.globl vector158
vector158:
  pushl $0
80105f1e:	6a 00                	push   $0x0
  pushl $158
80105f20:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80105f25:	e9 f3 f4 ff ff       	jmp    8010541d <alltraps>

80105f2a <vector159>:
.globl vector159
vector159:
  pushl $0
80105f2a:	6a 00                	push   $0x0
  pushl $159
80105f2c:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80105f31:	e9 e7 f4 ff ff       	jmp    8010541d <alltraps>

80105f36 <vector160>:
.globl vector160
vector160:
  pushl $0
80105f36:	6a 00                	push   $0x0
  pushl $160
80105f38:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
80105f3d:	e9 db f4 ff ff       	jmp    8010541d <alltraps>

80105f42 <vector161>:
.globl vector161
vector161:
  pushl $0
80105f42:	6a 00                	push   $0x0
  pushl $161
80105f44:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
80105f49:	e9 cf f4 ff ff       	jmp    8010541d <alltraps>

80105f4e <vector162>:
.globl vector162
vector162:
  pushl $0
80105f4e:	6a 00                	push   $0x0
  pushl $162
80105f50:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80105f55:	e9 c3 f4 ff ff       	jmp    8010541d <alltraps>

80105f5a <vector163>:
.globl vector163
vector163:
  pushl $0
80105f5a:	6a 00                	push   $0x0
  pushl $163
80105f5c:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80105f61:	e9 b7 f4 ff ff       	jmp    8010541d <alltraps>

80105f66 <vector164>:
.globl vector164
vector164:
  pushl $0
80105f66:	6a 00                	push   $0x0
  pushl $164
80105f68:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
80105f6d:	e9 ab f4 ff ff       	jmp    8010541d <alltraps>

80105f72 <vector165>:
.globl vector165
vector165:
  pushl $0
80105f72:	6a 00                	push   $0x0
  pushl $165
80105f74:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
80105f79:	e9 9f f4 ff ff       	jmp    8010541d <alltraps>

80105f7e <vector166>:
.globl vector166
vector166:
  pushl $0
80105f7e:	6a 00                	push   $0x0
  pushl $166
80105f80:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80105f85:	e9 93 f4 ff ff       	jmp    8010541d <alltraps>

80105f8a <vector167>:
.globl vector167
vector167:
  pushl $0
80105f8a:	6a 00                	push   $0x0
  pushl $167
80105f8c:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80105f91:	e9 87 f4 ff ff       	jmp    8010541d <alltraps>

80105f96 <vector168>:
.globl vector168
vector168:
  pushl $0
80105f96:	6a 00                	push   $0x0
  pushl $168
80105f98:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
80105f9d:	e9 7b f4 ff ff       	jmp    8010541d <alltraps>

80105fa2 <vector169>:
.globl vector169
vector169:
  pushl $0
80105fa2:	6a 00                	push   $0x0
  pushl $169
80105fa4:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
80105fa9:	e9 6f f4 ff ff       	jmp    8010541d <alltraps>

80105fae <vector170>:
.globl vector170
vector170:
  pushl $0
80105fae:	6a 00                	push   $0x0
  pushl $170
80105fb0:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80105fb5:	e9 63 f4 ff ff       	jmp    8010541d <alltraps>

80105fba <vector171>:
.globl vector171
vector171:
  pushl $0
80105fba:	6a 00                	push   $0x0
  pushl $171
80105fbc:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80105fc1:	e9 57 f4 ff ff       	jmp    8010541d <alltraps>

80105fc6 <vector172>:
.globl vector172
vector172:
  pushl $0
80105fc6:	6a 00                	push   $0x0
  pushl $172
80105fc8:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
80105fcd:	e9 4b f4 ff ff       	jmp    8010541d <alltraps>

80105fd2 <vector173>:
.globl vector173
vector173:
  pushl $0
80105fd2:	6a 00                	push   $0x0
  pushl $173
80105fd4:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
80105fd9:	e9 3f f4 ff ff       	jmp    8010541d <alltraps>

80105fde <vector174>:
.globl vector174
vector174:
  pushl $0
80105fde:	6a 00                	push   $0x0
  pushl $174
80105fe0:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80105fe5:	e9 33 f4 ff ff       	jmp    8010541d <alltraps>

80105fea <vector175>:
.globl vector175
vector175:
  pushl $0
80105fea:	6a 00                	push   $0x0
  pushl $175
80105fec:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80105ff1:	e9 27 f4 ff ff       	jmp    8010541d <alltraps>

80105ff6 <vector176>:
.globl vector176
vector176:
  pushl $0
80105ff6:	6a 00                	push   $0x0
  pushl $176
80105ff8:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
80105ffd:	e9 1b f4 ff ff       	jmp    8010541d <alltraps>

80106002 <vector177>:
.globl vector177
vector177:
  pushl $0
80106002:	6a 00                	push   $0x0
  pushl $177
80106004:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
80106009:	e9 0f f4 ff ff       	jmp    8010541d <alltraps>

8010600e <vector178>:
.globl vector178
vector178:
  pushl $0
8010600e:	6a 00                	push   $0x0
  pushl $178
80106010:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106015:	e9 03 f4 ff ff       	jmp    8010541d <alltraps>

8010601a <vector179>:
.globl vector179
vector179:
  pushl $0
8010601a:	6a 00                	push   $0x0
  pushl $179
8010601c:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106021:	e9 f7 f3 ff ff       	jmp    8010541d <alltraps>

80106026 <vector180>:
.globl vector180
vector180:
  pushl $0
80106026:	6a 00                	push   $0x0
  pushl $180
80106028:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010602d:	e9 eb f3 ff ff       	jmp    8010541d <alltraps>

80106032 <vector181>:
.globl vector181
vector181:
  pushl $0
80106032:	6a 00                	push   $0x0
  pushl $181
80106034:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
80106039:	e9 df f3 ff ff       	jmp    8010541d <alltraps>

8010603e <vector182>:
.globl vector182
vector182:
  pushl $0
8010603e:	6a 00                	push   $0x0
  pushl $182
80106040:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106045:	e9 d3 f3 ff ff       	jmp    8010541d <alltraps>

8010604a <vector183>:
.globl vector183
vector183:
  pushl $0
8010604a:	6a 00                	push   $0x0
  pushl $183
8010604c:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106051:	e9 c7 f3 ff ff       	jmp    8010541d <alltraps>

80106056 <vector184>:
.globl vector184
vector184:
  pushl $0
80106056:	6a 00                	push   $0x0
  pushl $184
80106058:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
8010605d:	e9 bb f3 ff ff       	jmp    8010541d <alltraps>

80106062 <vector185>:
.globl vector185
vector185:
  pushl $0
80106062:	6a 00                	push   $0x0
  pushl $185
80106064:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
80106069:	e9 af f3 ff ff       	jmp    8010541d <alltraps>

8010606e <vector186>:
.globl vector186
vector186:
  pushl $0
8010606e:	6a 00                	push   $0x0
  pushl $186
80106070:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106075:	e9 a3 f3 ff ff       	jmp    8010541d <alltraps>

8010607a <vector187>:
.globl vector187
vector187:
  pushl $0
8010607a:	6a 00                	push   $0x0
  pushl $187
8010607c:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106081:	e9 97 f3 ff ff       	jmp    8010541d <alltraps>

80106086 <vector188>:
.globl vector188
vector188:
  pushl $0
80106086:	6a 00                	push   $0x0
  pushl $188
80106088:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010608d:	e9 8b f3 ff ff       	jmp    8010541d <alltraps>

80106092 <vector189>:
.globl vector189
vector189:
  pushl $0
80106092:	6a 00                	push   $0x0
  pushl $189
80106094:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
80106099:	e9 7f f3 ff ff       	jmp    8010541d <alltraps>

8010609e <vector190>:
.globl vector190
vector190:
  pushl $0
8010609e:	6a 00                	push   $0x0
  pushl $190
801060a0:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
801060a5:	e9 73 f3 ff ff       	jmp    8010541d <alltraps>

801060aa <vector191>:
.globl vector191
vector191:
  pushl $0
801060aa:	6a 00                	push   $0x0
  pushl $191
801060ac:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
801060b1:	e9 67 f3 ff ff       	jmp    8010541d <alltraps>

801060b6 <vector192>:
.globl vector192
vector192:
  pushl $0
801060b6:	6a 00                	push   $0x0
  pushl $192
801060b8:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
801060bd:	e9 5b f3 ff ff       	jmp    8010541d <alltraps>

801060c2 <vector193>:
.globl vector193
vector193:
  pushl $0
801060c2:	6a 00                	push   $0x0
  pushl $193
801060c4:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
801060c9:	e9 4f f3 ff ff       	jmp    8010541d <alltraps>

801060ce <vector194>:
.globl vector194
vector194:
  pushl $0
801060ce:	6a 00                	push   $0x0
  pushl $194
801060d0:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
801060d5:	e9 43 f3 ff ff       	jmp    8010541d <alltraps>

801060da <vector195>:
.globl vector195
vector195:
  pushl $0
801060da:	6a 00                	push   $0x0
  pushl $195
801060dc:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
801060e1:	e9 37 f3 ff ff       	jmp    8010541d <alltraps>

801060e6 <vector196>:
.globl vector196
vector196:
  pushl $0
801060e6:	6a 00                	push   $0x0
  pushl $196
801060e8:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
801060ed:	e9 2b f3 ff ff       	jmp    8010541d <alltraps>

801060f2 <vector197>:
.globl vector197
vector197:
  pushl $0
801060f2:	6a 00                	push   $0x0
  pushl $197
801060f4:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
801060f9:	e9 1f f3 ff ff       	jmp    8010541d <alltraps>

801060fe <vector198>:
.globl vector198
vector198:
  pushl $0
801060fe:	6a 00                	push   $0x0
  pushl $198
80106100:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106105:	e9 13 f3 ff ff       	jmp    8010541d <alltraps>

8010610a <vector199>:
.globl vector199
vector199:
  pushl $0
8010610a:	6a 00                	push   $0x0
  pushl $199
8010610c:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106111:	e9 07 f3 ff ff       	jmp    8010541d <alltraps>

80106116 <vector200>:
.globl vector200
vector200:
  pushl $0
80106116:	6a 00                	push   $0x0
  pushl $200
80106118:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
8010611d:	e9 fb f2 ff ff       	jmp    8010541d <alltraps>

80106122 <vector201>:
.globl vector201
vector201:
  pushl $0
80106122:	6a 00                	push   $0x0
  pushl $201
80106124:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
80106129:	e9 ef f2 ff ff       	jmp    8010541d <alltraps>

8010612e <vector202>:
.globl vector202
vector202:
  pushl $0
8010612e:	6a 00                	push   $0x0
  pushl $202
80106130:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106135:	e9 e3 f2 ff ff       	jmp    8010541d <alltraps>

8010613a <vector203>:
.globl vector203
vector203:
  pushl $0
8010613a:	6a 00                	push   $0x0
  pushl $203
8010613c:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106141:	e9 d7 f2 ff ff       	jmp    8010541d <alltraps>

80106146 <vector204>:
.globl vector204
vector204:
  pushl $0
80106146:	6a 00                	push   $0x0
  pushl $204
80106148:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
8010614d:	e9 cb f2 ff ff       	jmp    8010541d <alltraps>

80106152 <vector205>:
.globl vector205
vector205:
  pushl $0
80106152:	6a 00                	push   $0x0
  pushl $205
80106154:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
80106159:	e9 bf f2 ff ff       	jmp    8010541d <alltraps>

8010615e <vector206>:
.globl vector206
vector206:
  pushl $0
8010615e:	6a 00                	push   $0x0
  pushl $206
80106160:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106165:	e9 b3 f2 ff ff       	jmp    8010541d <alltraps>

8010616a <vector207>:
.globl vector207
vector207:
  pushl $0
8010616a:	6a 00                	push   $0x0
  pushl $207
8010616c:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106171:	e9 a7 f2 ff ff       	jmp    8010541d <alltraps>

80106176 <vector208>:
.globl vector208
vector208:
  pushl $0
80106176:	6a 00                	push   $0x0
  pushl $208
80106178:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010617d:	e9 9b f2 ff ff       	jmp    8010541d <alltraps>

80106182 <vector209>:
.globl vector209
vector209:
  pushl $0
80106182:	6a 00                	push   $0x0
  pushl $209
80106184:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
80106189:	e9 8f f2 ff ff       	jmp    8010541d <alltraps>

8010618e <vector210>:
.globl vector210
vector210:
  pushl $0
8010618e:	6a 00                	push   $0x0
  pushl $210
80106190:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106195:	e9 83 f2 ff ff       	jmp    8010541d <alltraps>

8010619a <vector211>:
.globl vector211
vector211:
  pushl $0
8010619a:	6a 00                	push   $0x0
  pushl $211
8010619c:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
801061a1:	e9 77 f2 ff ff       	jmp    8010541d <alltraps>

801061a6 <vector212>:
.globl vector212
vector212:
  pushl $0
801061a6:	6a 00                	push   $0x0
  pushl $212
801061a8:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
801061ad:	e9 6b f2 ff ff       	jmp    8010541d <alltraps>

801061b2 <vector213>:
.globl vector213
vector213:
  pushl $0
801061b2:	6a 00                	push   $0x0
  pushl $213
801061b4:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
801061b9:	e9 5f f2 ff ff       	jmp    8010541d <alltraps>

801061be <vector214>:
.globl vector214
vector214:
  pushl $0
801061be:	6a 00                	push   $0x0
  pushl $214
801061c0:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
801061c5:	e9 53 f2 ff ff       	jmp    8010541d <alltraps>

801061ca <vector215>:
.globl vector215
vector215:
  pushl $0
801061ca:	6a 00                	push   $0x0
  pushl $215
801061cc:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
801061d1:	e9 47 f2 ff ff       	jmp    8010541d <alltraps>

801061d6 <vector216>:
.globl vector216
vector216:
  pushl $0
801061d6:	6a 00                	push   $0x0
  pushl $216
801061d8:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
801061dd:	e9 3b f2 ff ff       	jmp    8010541d <alltraps>

801061e2 <vector217>:
.globl vector217
vector217:
  pushl $0
801061e2:	6a 00                	push   $0x0
  pushl $217
801061e4:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
801061e9:	e9 2f f2 ff ff       	jmp    8010541d <alltraps>

801061ee <vector218>:
.globl vector218
vector218:
  pushl $0
801061ee:	6a 00                	push   $0x0
  pushl $218
801061f0:	68 da 00 00 00       	push   $0xda
  jmp alltraps
801061f5:	e9 23 f2 ff ff       	jmp    8010541d <alltraps>

801061fa <vector219>:
.globl vector219
vector219:
  pushl $0
801061fa:	6a 00                	push   $0x0
  pushl $219
801061fc:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106201:	e9 17 f2 ff ff       	jmp    8010541d <alltraps>

80106206 <vector220>:
.globl vector220
vector220:
  pushl $0
80106206:	6a 00                	push   $0x0
  pushl $220
80106208:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
8010620d:	e9 0b f2 ff ff       	jmp    8010541d <alltraps>

80106212 <vector221>:
.globl vector221
vector221:
  pushl $0
80106212:	6a 00                	push   $0x0
  pushl $221
80106214:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80106219:	e9 ff f1 ff ff       	jmp    8010541d <alltraps>

8010621e <vector222>:
.globl vector222
vector222:
  pushl $0
8010621e:	6a 00                	push   $0x0
  pushl $222
80106220:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106225:	e9 f3 f1 ff ff       	jmp    8010541d <alltraps>

8010622a <vector223>:
.globl vector223
vector223:
  pushl $0
8010622a:	6a 00                	push   $0x0
  pushl $223
8010622c:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106231:	e9 e7 f1 ff ff       	jmp    8010541d <alltraps>

80106236 <vector224>:
.globl vector224
vector224:
  pushl $0
80106236:	6a 00                	push   $0x0
  pushl $224
80106238:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
8010623d:	e9 db f1 ff ff       	jmp    8010541d <alltraps>

80106242 <vector225>:
.globl vector225
vector225:
  pushl $0
80106242:	6a 00                	push   $0x0
  pushl $225
80106244:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80106249:	e9 cf f1 ff ff       	jmp    8010541d <alltraps>

8010624e <vector226>:
.globl vector226
vector226:
  pushl $0
8010624e:	6a 00                	push   $0x0
  pushl $226
80106250:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106255:	e9 c3 f1 ff ff       	jmp    8010541d <alltraps>

8010625a <vector227>:
.globl vector227
vector227:
  pushl $0
8010625a:	6a 00                	push   $0x0
  pushl $227
8010625c:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106261:	e9 b7 f1 ff ff       	jmp    8010541d <alltraps>

80106266 <vector228>:
.globl vector228
vector228:
  pushl $0
80106266:	6a 00                	push   $0x0
  pushl $228
80106268:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
8010626d:	e9 ab f1 ff ff       	jmp    8010541d <alltraps>

80106272 <vector229>:
.globl vector229
vector229:
  pushl $0
80106272:	6a 00                	push   $0x0
  pushl $229
80106274:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80106279:	e9 9f f1 ff ff       	jmp    8010541d <alltraps>

8010627e <vector230>:
.globl vector230
vector230:
  pushl $0
8010627e:	6a 00                	push   $0x0
  pushl $230
80106280:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106285:	e9 93 f1 ff ff       	jmp    8010541d <alltraps>

8010628a <vector231>:
.globl vector231
vector231:
  pushl $0
8010628a:	6a 00                	push   $0x0
  pushl $231
8010628c:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106291:	e9 87 f1 ff ff       	jmp    8010541d <alltraps>

80106296 <vector232>:
.globl vector232
vector232:
  pushl $0
80106296:	6a 00                	push   $0x0
  pushl $232
80106298:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
8010629d:	e9 7b f1 ff ff       	jmp    8010541d <alltraps>

801062a2 <vector233>:
.globl vector233
vector233:
  pushl $0
801062a2:	6a 00                	push   $0x0
  pushl $233
801062a4:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
801062a9:	e9 6f f1 ff ff       	jmp    8010541d <alltraps>

801062ae <vector234>:
.globl vector234
vector234:
  pushl $0
801062ae:	6a 00                	push   $0x0
  pushl $234
801062b0:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
801062b5:	e9 63 f1 ff ff       	jmp    8010541d <alltraps>

801062ba <vector235>:
.globl vector235
vector235:
  pushl $0
801062ba:	6a 00                	push   $0x0
  pushl $235
801062bc:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
801062c1:	e9 57 f1 ff ff       	jmp    8010541d <alltraps>

801062c6 <vector236>:
.globl vector236
vector236:
  pushl $0
801062c6:	6a 00                	push   $0x0
  pushl $236
801062c8:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
801062cd:	e9 4b f1 ff ff       	jmp    8010541d <alltraps>

801062d2 <vector237>:
.globl vector237
vector237:
  pushl $0
801062d2:	6a 00                	push   $0x0
  pushl $237
801062d4:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
801062d9:	e9 3f f1 ff ff       	jmp    8010541d <alltraps>

801062de <vector238>:
.globl vector238
vector238:
  pushl $0
801062de:	6a 00                	push   $0x0
  pushl $238
801062e0:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
801062e5:	e9 33 f1 ff ff       	jmp    8010541d <alltraps>

801062ea <vector239>:
.globl vector239
vector239:
  pushl $0
801062ea:	6a 00                	push   $0x0
  pushl $239
801062ec:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
801062f1:	e9 27 f1 ff ff       	jmp    8010541d <alltraps>

801062f6 <vector240>:
.globl vector240
vector240:
  pushl $0
801062f6:	6a 00                	push   $0x0
  pushl $240
801062f8:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
801062fd:	e9 1b f1 ff ff       	jmp    8010541d <alltraps>

80106302 <vector241>:
.globl vector241
vector241:
  pushl $0
80106302:	6a 00                	push   $0x0
  pushl $241
80106304:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106309:	e9 0f f1 ff ff       	jmp    8010541d <alltraps>

8010630e <vector242>:
.globl vector242
vector242:
  pushl $0
8010630e:	6a 00                	push   $0x0
  pushl $242
80106310:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106315:	e9 03 f1 ff ff       	jmp    8010541d <alltraps>

8010631a <vector243>:
.globl vector243
vector243:
  pushl $0
8010631a:	6a 00                	push   $0x0
  pushl $243
8010631c:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106321:	e9 f7 f0 ff ff       	jmp    8010541d <alltraps>

80106326 <vector244>:
.globl vector244
vector244:
  pushl $0
80106326:	6a 00                	push   $0x0
  pushl $244
80106328:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
8010632d:	e9 eb f0 ff ff       	jmp    8010541d <alltraps>

80106332 <vector245>:
.globl vector245
vector245:
  pushl $0
80106332:	6a 00                	push   $0x0
  pushl $245
80106334:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106339:	e9 df f0 ff ff       	jmp    8010541d <alltraps>

8010633e <vector246>:
.globl vector246
vector246:
  pushl $0
8010633e:	6a 00                	push   $0x0
  pushl $246
80106340:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106345:	e9 d3 f0 ff ff       	jmp    8010541d <alltraps>

8010634a <vector247>:
.globl vector247
vector247:
  pushl $0
8010634a:	6a 00                	push   $0x0
  pushl $247
8010634c:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106351:	e9 c7 f0 ff ff       	jmp    8010541d <alltraps>

80106356 <vector248>:
.globl vector248
vector248:
  pushl $0
80106356:	6a 00                	push   $0x0
  pushl $248
80106358:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
8010635d:	e9 bb f0 ff ff       	jmp    8010541d <alltraps>

80106362 <vector249>:
.globl vector249
vector249:
  pushl $0
80106362:	6a 00                	push   $0x0
  pushl $249
80106364:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106369:	e9 af f0 ff ff       	jmp    8010541d <alltraps>

8010636e <vector250>:
.globl vector250
vector250:
  pushl $0
8010636e:	6a 00                	push   $0x0
  pushl $250
80106370:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106375:	e9 a3 f0 ff ff       	jmp    8010541d <alltraps>

8010637a <vector251>:
.globl vector251
vector251:
  pushl $0
8010637a:	6a 00                	push   $0x0
  pushl $251
8010637c:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106381:	e9 97 f0 ff ff       	jmp    8010541d <alltraps>

80106386 <vector252>:
.globl vector252
vector252:
  pushl $0
80106386:	6a 00                	push   $0x0
  pushl $252
80106388:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
8010638d:	e9 8b f0 ff ff       	jmp    8010541d <alltraps>

80106392 <vector253>:
.globl vector253
vector253:
  pushl $0
80106392:	6a 00                	push   $0x0
  pushl $253
80106394:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106399:	e9 7f f0 ff ff       	jmp    8010541d <alltraps>

8010639e <vector254>:
.globl vector254
vector254:
  pushl $0
8010639e:	6a 00                	push   $0x0
  pushl $254
801063a0:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
801063a5:	e9 73 f0 ff ff       	jmp    8010541d <alltraps>

801063aa <vector255>:
.globl vector255
vector255:
  pushl $0
801063aa:	6a 00                	push   $0x0
  pushl $255
801063ac:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
801063b1:	e9 67 f0 ff ff       	jmp    8010541d <alltraps>
801063b6:	66 90                	xchg   %ax,%ax
801063b8:	66 90                	xchg   %ax,%ax
801063ba:	66 90                	xchg   %ax,%ax
801063bc:	66 90                	xchg   %ax,%ax
801063be:	66 90                	xchg   %ax,%ax

801063c0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801063c0:	55                   	push   %ebp
801063c1:	89 e5                	mov    %esp,%ebp
801063c3:	57                   	push   %edi
801063c4:	56                   	push   %esi
801063c5:	89 d6                	mov    %edx,%esi
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801063c7:	c1 ea 16             	shr    $0x16,%edx
{
801063ca:	53                   	push   %ebx
  pde = &pgdir[PDX(va)];
801063cb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
{
801063ce:	83 ec 1c             	sub    $0x1c,%esp
  if(*pde & PTE_P){
801063d1:	8b 1f                	mov    (%edi),%ebx
801063d3:	f6 c3 01             	test   $0x1,%bl
801063d6:	74 28                	je     80106400 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801063d8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801063de:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801063e4:	c1 ee 0a             	shr    $0xa,%esi
}
801063e7:	83 c4 1c             	add    $0x1c,%esp
  return &pgtab[PTX(va)];
801063ea:	89 f2                	mov    %esi,%edx
801063ec:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801063f2:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
801063f5:	5b                   	pop    %ebx
801063f6:	5e                   	pop    %esi
801063f7:	5f                   	pop    %edi
801063f8:	5d                   	pop    %ebp
801063f9:	c3                   	ret    
801063fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106400:	85 c9                	test   %ecx,%ecx
80106402:	74 34                	je     80106438 <walkpgdir+0x78>
80106404:	e8 97 c0 ff ff       	call   801024a0 <kalloc>
80106409:	85 c0                	test   %eax,%eax
8010640b:	89 c3                	mov    %eax,%ebx
8010640d:	74 29                	je     80106438 <walkpgdir+0x78>
    memset(pgtab, 0, PGSIZE);
8010640f:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106416:	00 
80106417:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010641e:	00 
8010641f:	89 04 24             	mov    %eax,(%esp)
80106422:	e8 59 de ff ff       	call   80104280 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106427:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010642d:	83 c8 07             	or     $0x7,%eax
80106430:	89 07                	mov    %eax,(%edi)
80106432:	eb b0                	jmp    801063e4 <walkpgdir+0x24>
80106434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
80106438:	83 c4 1c             	add    $0x1c,%esp
      return 0;
8010643b:	31 c0                	xor    %eax,%eax
}
8010643d:	5b                   	pop    %ebx
8010643e:	5e                   	pop    %esi
8010643f:	5f                   	pop    %edi
80106440:	5d                   	pop    %ebp
80106441:	c3                   	ret    
80106442:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106450 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106450:	55                   	push   %ebp
80106451:	89 e5                	mov    %esp,%ebp
80106453:	57                   	push   %edi
80106454:	56                   	push   %esi
80106455:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106456:	89 d3                	mov    %edx,%ebx
{
80106458:	83 ec 1c             	sub    $0x1c,%esp
8010645b:	8b 7d 08             	mov    0x8(%ebp),%edi
  a = (char*)PGROUNDDOWN((uint)va);
8010645e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
80106464:	89 45 e0             	mov    %eax,-0x20(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106467:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
8010646b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010646e:	83 4d 0c 01          	orl    $0x1,0xc(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106472:	81 65 e4 00 f0 ff ff 	andl   $0xfffff000,-0x1c(%ebp)
80106479:	29 df                	sub    %ebx,%edi
8010647b:	eb 18                	jmp    80106495 <mappages+0x45>
8010647d:	8d 76 00             	lea    0x0(%esi),%esi
    if(*pte & PTE_P)
80106480:	f6 00 01             	testb  $0x1,(%eax)
80106483:	75 3d                	jne    801064c2 <mappages+0x72>
    *pte = pa | perm | PTE_P;
80106485:	0b 75 0c             	or     0xc(%ebp),%esi
    if(a == last)
80106488:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    *pte = pa | perm | PTE_P;
8010648b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010648d:	74 29                	je     801064b8 <mappages+0x68>
      break;
    a += PGSIZE;
8010648f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106495:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106498:	b9 01 00 00 00       	mov    $0x1,%ecx
8010649d:	89 da                	mov    %ebx,%edx
8010649f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801064a2:	e8 19 ff ff ff       	call   801063c0 <walkpgdir>
801064a7:	85 c0                	test   %eax,%eax
801064a9:	75 d5                	jne    80106480 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
801064ab:	83 c4 1c             	add    $0x1c,%esp
      return -1;
801064ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801064b3:	5b                   	pop    %ebx
801064b4:	5e                   	pop    %esi
801064b5:	5f                   	pop    %edi
801064b6:	5d                   	pop    %ebp
801064b7:	c3                   	ret    
801064b8:	83 c4 1c             	add    $0x1c,%esp
  return 0;
801064bb:	31 c0                	xor    %eax,%eax
}
801064bd:	5b                   	pop    %ebx
801064be:	5e                   	pop    %esi
801064bf:	5f                   	pop    %edi
801064c0:	5d                   	pop    %ebp
801064c1:	c3                   	ret    
      panic("remap");
801064c2:	c7 04 24 60 77 10 80 	movl   $0x80107760,(%esp)
801064c9:	e8 92 9e ff ff       	call   80100360 <panic>
801064ce:	66 90                	xchg   %ax,%ax

801064d0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801064d0:	55                   	push   %ebp
801064d1:	89 e5                	mov    %esp,%ebp
801064d3:	57                   	push   %edi
801064d4:	89 c7                	mov    %eax,%edi
801064d6:	56                   	push   %esi
801064d7:	89 d6                	mov    %edx,%esi
801064d9:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801064da:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801064e0:	83 ec 1c             	sub    $0x1c,%esp
  a = PGROUNDUP(newsz);
801064e3:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
801064e9:	39 d3                	cmp    %edx,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801064eb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
801064ee:	72 3b                	jb     8010652b <deallocuvm.part.0+0x5b>
801064f0:	eb 5e                	jmp    80106550 <deallocuvm.part.0+0x80>
801064f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
801064f8:	8b 10                	mov    (%eax),%edx
801064fa:	f6 c2 01             	test   $0x1,%dl
801064fd:	74 22                	je     80106521 <deallocuvm.part.0+0x51>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
801064ff:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106505:	74 54                	je     8010655b <deallocuvm.part.0+0x8b>
        panic("kfree");
      char *v = P2V(pa);
80106507:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
8010650d:	89 14 24             	mov    %edx,(%esp)
80106510:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106513:	e8 d8 bd ff ff       	call   801022f0 <kfree>
      *pte = 0;
80106518:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010651b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106521:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106527:	39 f3                	cmp    %esi,%ebx
80106529:	73 25                	jae    80106550 <deallocuvm.part.0+0x80>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010652b:	31 c9                	xor    %ecx,%ecx
8010652d:	89 da                	mov    %ebx,%edx
8010652f:	89 f8                	mov    %edi,%eax
80106531:	e8 8a fe ff ff       	call   801063c0 <walkpgdir>
    if(!pte)
80106536:	85 c0                	test   %eax,%eax
80106538:	75 be                	jne    801064f8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010653a:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106540:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106546:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010654c:	39 f3                	cmp    %esi,%ebx
8010654e:	72 db                	jb     8010652b <deallocuvm.part.0+0x5b>
    }
  }
  return newsz;
}
80106550:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106553:	83 c4 1c             	add    $0x1c,%esp
80106556:	5b                   	pop    %ebx
80106557:	5e                   	pop    %esi
80106558:	5f                   	pop    %edi
80106559:	5d                   	pop    %ebp
8010655a:	c3                   	ret    
        panic("kfree");
8010655b:	c7 04 24 86 70 10 80 	movl   $0x80107086,(%esp)
80106562:	e8 f9 9d ff ff       	call   80100360 <panic>
80106567:	89 f6                	mov    %esi,%esi
80106569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106570 <seginit>:
{
80106570:	55                   	push   %ebp
80106571:	89 e5                	mov    %esp,%ebp
80106573:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106576:	e8 05 d1 ff ff       	call   80103680 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010657b:	31 c9                	xor    %ecx,%ecx
8010657d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  c = &cpus[cpuid()];
80106582:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106588:	05 80 27 11 80       	add    $0x80112780,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010658d:	66 89 50 78          	mov    %dx,0x78(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106591:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  lgdt(c->gdt, sizeof(c->gdt));
80106596:	83 c0 70             	add    $0x70,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106599:	66 89 48 0a          	mov    %cx,0xa(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010659d:	31 c9                	xor    %ecx,%ecx
8010659f:	66 89 50 10          	mov    %dx,0x10(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801065a3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801065a8:	66 89 48 12          	mov    %cx,0x12(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801065ac:	31 c9                	xor    %ecx,%ecx
801065ae:	66 89 50 18          	mov    %dx,0x18(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801065b2:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801065b7:	66 89 48 1a          	mov    %cx,0x1a(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801065bb:	31 c9                	xor    %ecx,%ecx
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801065bd:	c6 40 0d 9a          	movb   $0x9a,0xd(%eax)
801065c1:	c6 40 0e cf          	movb   $0xcf,0xe(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801065c5:	c6 40 15 92          	movb   $0x92,0x15(%eax)
801065c9:	c6 40 16 cf          	movb   $0xcf,0x16(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801065cd:	c6 40 1d fa          	movb   $0xfa,0x1d(%eax)
801065d1:	c6 40 1e cf          	movb   $0xcf,0x1e(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801065d5:	c6 40 25 f2          	movb   $0xf2,0x25(%eax)
801065d9:	c6 40 26 cf          	movb   $0xcf,0x26(%eax)
801065dd:	66 89 50 20          	mov    %dx,0x20(%eax)
  pd[0] = size-1;
801065e1:	ba 2f 00 00 00       	mov    $0x2f,%edx
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801065e6:	c6 40 0c 00          	movb   $0x0,0xc(%eax)
801065ea:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801065ee:	c6 40 14 00          	movb   $0x0,0x14(%eax)
801065f2:	c6 40 17 00          	movb   $0x0,0x17(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801065f6:	c6 40 1c 00          	movb   $0x0,0x1c(%eax)
801065fa:	c6 40 1f 00          	movb   $0x0,0x1f(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801065fe:	66 89 48 22          	mov    %cx,0x22(%eax)
80106602:	c6 40 24 00          	movb   $0x0,0x24(%eax)
80106606:	c6 40 27 00          	movb   $0x0,0x27(%eax)
8010660a:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
8010660e:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106612:	c1 e8 10             	shr    $0x10,%eax
80106615:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106619:	8d 45 f2             	lea    -0xe(%ebp),%eax
8010661c:	0f 01 10             	lgdtl  (%eax)
}
8010661f:	c9                   	leave  
80106620:	c3                   	ret    
80106621:	eb 0d                	jmp    80106630 <switchkvm>
80106623:	90                   	nop
80106624:	90                   	nop
80106625:	90                   	nop
80106626:	90                   	nop
80106627:	90                   	nop
80106628:	90                   	nop
80106629:	90                   	nop
8010662a:	90                   	nop
8010662b:	90                   	nop
8010662c:	90                   	nop
8010662d:	90                   	nop
8010662e:	90                   	nop
8010662f:	90                   	nop

80106630 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106630:	a1 c4 55 11 80       	mov    0x801155c4,%eax
{
80106635:	55                   	push   %ebp
80106636:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106638:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
8010663d:	0f 22 d8             	mov    %eax,%cr3
}
80106640:	5d                   	pop    %ebp
80106641:	c3                   	ret    
80106642:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106650 <switchuvm>:
{
80106650:	55                   	push   %ebp
80106651:	89 e5                	mov    %esp,%ebp
80106653:	57                   	push   %edi
80106654:	56                   	push   %esi
80106655:	53                   	push   %ebx
80106656:	83 ec 1c             	sub    $0x1c,%esp
80106659:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
8010665c:	85 f6                	test   %esi,%esi
8010665e:	0f 84 cd 00 00 00    	je     80106731 <switchuvm+0xe1>
  if(p->kstack == 0)
80106664:	8b 46 0c             	mov    0xc(%esi),%eax
80106667:	85 c0                	test   %eax,%eax
80106669:	0f 84 da 00 00 00    	je     80106749 <switchuvm+0xf9>
  if(p->pgdir == 0)
8010666f:	8b 7e 04             	mov    0x4(%esi),%edi
80106672:	85 ff                	test   %edi,%edi
80106674:	0f 84 c3 00 00 00    	je     8010673d <switchuvm+0xed>
  pushcli();
8010667a:	e8 81 da ff ff       	call   80104100 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
8010667f:	e8 7c cf ff ff       	call   80103600 <mycpu>
80106684:	89 c3                	mov    %eax,%ebx
80106686:	e8 75 cf ff ff       	call   80103600 <mycpu>
8010668b:	89 c7                	mov    %eax,%edi
8010668d:	e8 6e cf ff ff       	call   80103600 <mycpu>
80106692:	83 c7 08             	add    $0x8,%edi
80106695:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106698:	e8 63 cf ff ff       	call   80103600 <mycpu>
8010669d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801066a0:	ba 67 00 00 00       	mov    $0x67,%edx
801066a5:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
801066ac:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
801066b3:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
801066ba:	83 c1 08             	add    $0x8,%ecx
801066bd:	c1 e9 10             	shr    $0x10,%ecx
801066c0:	83 c0 08             	add    $0x8,%eax
801066c3:	c1 e8 18             	shr    $0x18,%eax
801066c6:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
801066cc:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
801066d3:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
801066d9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  mycpu()->gdt[SEG_TSS].s = 0;
801066de:	e8 1d cf ff ff       	call   80103600 <mycpu>
801066e3:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
801066ea:	e8 11 cf ff ff       	call   80103600 <mycpu>
801066ef:	b9 10 00 00 00       	mov    $0x10,%ecx
801066f4:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
801066f8:	e8 03 cf ff ff       	call   80103600 <mycpu>
801066fd:	8b 56 0c             	mov    0xc(%esi),%edx
80106700:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80106706:	89 48 0c             	mov    %ecx,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106709:	e8 f2 ce ff ff       	call   80103600 <mycpu>
8010670e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106712:	b8 28 00 00 00       	mov    $0x28,%eax
80106717:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
8010671a:	8b 46 04             	mov    0x4(%esi),%eax
8010671d:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106722:	0f 22 d8             	mov    %eax,%cr3
}
80106725:	83 c4 1c             	add    $0x1c,%esp
80106728:	5b                   	pop    %ebx
80106729:	5e                   	pop    %esi
8010672a:	5f                   	pop    %edi
8010672b:	5d                   	pop    %ebp
  popcli();
8010672c:	e9 8f da ff ff       	jmp    801041c0 <popcli>
    panic("switchuvm: no process");
80106731:	c7 04 24 66 77 10 80 	movl   $0x80107766,(%esp)
80106738:	e8 23 9c ff ff       	call   80100360 <panic>
    panic("switchuvm: no pgdir");
8010673d:	c7 04 24 91 77 10 80 	movl   $0x80107791,(%esp)
80106744:	e8 17 9c ff ff       	call   80100360 <panic>
    panic("switchuvm: no kstack");
80106749:	c7 04 24 7c 77 10 80 	movl   $0x8010777c,(%esp)
80106750:	e8 0b 9c ff ff       	call   80100360 <panic>
80106755:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106760 <inituvm>:
{
80106760:	55                   	push   %ebp
80106761:	89 e5                	mov    %esp,%ebp
80106763:	57                   	push   %edi
80106764:	56                   	push   %esi
80106765:	53                   	push   %ebx
80106766:	83 ec 1c             	sub    $0x1c,%esp
80106769:	8b 75 10             	mov    0x10(%ebp),%esi
8010676c:	8b 45 08             	mov    0x8(%ebp),%eax
8010676f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80106772:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
80106778:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
8010677b:	77 54                	ja     801067d1 <inituvm+0x71>
  mem = kalloc();
8010677d:	e8 1e bd ff ff       	call   801024a0 <kalloc>
  memset(mem, 0, PGSIZE);
80106782:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106789:	00 
8010678a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106791:	00 
  mem = kalloc();
80106792:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106794:	89 04 24             	mov    %eax,(%esp)
80106797:	e8 e4 da ff ff       	call   80104280 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
8010679c:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801067a2:	b9 00 10 00 00       	mov    $0x1000,%ecx
801067a7:	89 04 24             	mov    %eax,(%esp)
801067aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801067ad:	31 d2                	xor    %edx,%edx
801067af:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
801067b6:	00 
801067b7:	e8 94 fc ff ff       	call   80106450 <mappages>
  memmove(mem, init, sz);
801067bc:	89 75 10             	mov    %esi,0x10(%ebp)
801067bf:	89 7d 0c             	mov    %edi,0xc(%ebp)
801067c2:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801067c5:	83 c4 1c             	add    $0x1c,%esp
801067c8:	5b                   	pop    %ebx
801067c9:	5e                   	pop    %esi
801067ca:	5f                   	pop    %edi
801067cb:	5d                   	pop    %ebp
  memmove(mem, init, sz);
801067cc:	e9 4f db ff ff       	jmp    80104320 <memmove>
    panic("inituvm: more than a page");
801067d1:	c7 04 24 a5 77 10 80 	movl   $0x801077a5,(%esp)
801067d8:	e8 83 9b ff ff       	call   80100360 <panic>
801067dd:	8d 76 00             	lea    0x0(%esi),%esi

801067e0 <loaduvm>:
{
801067e0:	55                   	push   %ebp
801067e1:	89 e5                	mov    %esp,%ebp
801067e3:	57                   	push   %edi
801067e4:	56                   	push   %esi
801067e5:	53                   	push   %ebx
801067e6:	83 ec 1c             	sub    $0x1c,%esp
  if((uint) addr % PGSIZE != 0)
801067e9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
801067f0:	0f 85 98 00 00 00    	jne    8010688e <loaduvm+0xae>
  for(i = 0; i < sz; i += PGSIZE){
801067f6:	8b 75 18             	mov    0x18(%ebp),%esi
801067f9:	31 db                	xor    %ebx,%ebx
801067fb:	85 f6                	test   %esi,%esi
801067fd:	75 1a                	jne    80106819 <loaduvm+0x39>
801067ff:	eb 77                	jmp    80106878 <loaduvm+0x98>
80106801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106808:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010680e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106814:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106817:	76 5f                	jbe    80106878 <loaduvm+0x98>
80106819:	8b 55 0c             	mov    0xc(%ebp),%edx
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
8010681c:	31 c9                	xor    %ecx,%ecx
8010681e:	8b 45 08             	mov    0x8(%ebp),%eax
80106821:	01 da                	add    %ebx,%edx
80106823:	e8 98 fb ff ff       	call   801063c0 <walkpgdir>
80106828:	85 c0                	test   %eax,%eax
8010682a:	74 56                	je     80106882 <loaduvm+0xa2>
    pa = PTE_ADDR(*pte);
8010682c:	8b 00                	mov    (%eax),%eax
      n = PGSIZE;
8010682e:	bf 00 10 00 00       	mov    $0x1000,%edi
80106833:	8b 4d 14             	mov    0x14(%ebp),%ecx
    pa = PTE_ADDR(*pte);
80106836:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      n = PGSIZE;
8010683b:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
80106841:	0f 42 fe             	cmovb  %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106844:	05 00 00 00 80       	add    $0x80000000,%eax
80106849:	89 44 24 04          	mov    %eax,0x4(%esp)
8010684d:	8b 45 10             	mov    0x10(%ebp),%eax
80106850:	01 d9                	add    %ebx,%ecx
80106852:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80106856:	89 4c 24 08          	mov    %ecx,0x8(%esp)
8010685a:	89 04 24             	mov    %eax,(%esp)
8010685d:	e8 fe b0 ff ff       	call   80101960 <readi>
80106862:	39 f8                	cmp    %edi,%eax
80106864:	74 a2                	je     80106808 <loaduvm+0x28>
}
80106866:	83 c4 1c             	add    $0x1c,%esp
      return -1;
80106869:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010686e:	5b                   	pop    %ebx
8010686f:	5e                   	pop    %esi
80106870:	5f                   	pop    %edi
80106871:	5d                   	pop    %ebp
80106872:	c3                   	ret    
80106873:	90                   	nop
80106874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106878:	83 c4 1c             	add    $0x1c,%esp
  return 0;
8010687b:	31 c0                	xor    %eax,%eax
}
8010687d:	5b                   	pop    %ebx
8010687e:	5e                   	pop    %esi
8010687f:	5f                   	pop    %edi
80106880:	5d                   	pop    %ebp
80106881:	c3                   	ret    
      panic("loaduvm: address should exist");
80106882:	c7 04 24 bf 77 10 80 	movl   $0x801077bf,(%esp)
80106889:	e8 d2 9a ff ff       	call   80100360 <panic>
    panic("loaduvm: addr must be page aligned");
8010688e:	c7 04 24 60 78 10 80 	movl   $0x80107860,(%esp)
80106895:	e8 c6 9a ff ff       	call   80100360 <panic>
8010689a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801068a0 <allocuvm>:
{
801068a0:	55                   	push   %ebp
801068a1:	89 e5                	mov    %esp,%ebp
801068a3:	57                   	push   %edi
801068a4:	56                   	push   %esi
801068a5:	53                   	push   %ebx
801068a6:	83 ec 1c             	sub    $0x1c,%esp
801068a9:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(newsz > KERNBASE)
801068ac:	81 ff 00 00 00 80    	cmp    $0x80000000,%edi
801068b2:	0f 87 88 00 00 00    	ja     80106940 <allocuvm+0xa0>
  if(newsz < oldsz)
801068b8:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
801068bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(newsz < oldsz)
801068be:	0f 82 7e 00 00 00    	jb     80106942 <allocuvm+0xa2>
  a = PGROUNDUP(oldsz);
801068c4:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801068ca:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
801068d0:	39 df                	cmp    %ebx,%edi
801068d2:	77 4a                	ja     8010691e <allocuvm+0x7e>
801068d4:	eb 7a                	jmp    80106950 <allocuvm+0xb0>
801068d6:	66 90                	xchg   %ax,%ax
    memset(mem, 0, PGSIZE);
801068d8:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801068df:	00 
801068e0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801068e7:	00 
801068e8:	89 04 24             	mov    %eax,(%esp)
801068eb:	e8 90 d9 ff ff       	call   80104280 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
801068f0:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801068f6:	b9 00 10 00 00       	mov    $0x1000,%ecx
801068fb:	89 04 24             	mov    %eax,(%esp)
801068fe:	8b 45 08             	mov    0x8(%ebp),%eax
80106901:	89 da                	mov    %ebx,%edx
80106903:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
8010690a:	00 
8010690b:	e8 40 fb ff ff       	call   80106450 <mappages>
80106910:	85 c0                	test   %eax,%eax
80106912:	78 4c                	js     80106960 <allocuvm+0xc0>
  for(; a < newsz; a += PGSIZE){
80106914:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010691a:	39 df                	cmp    %ebx,%edi
8010691c:	76 32                	jbe    80106950 <allocuvm+0xb0>
    mem = kalloc();
8010691e:	e8 7d bb ff ff       	call   801024a0 <kalloc>
    if(mem == 0){
80106923:	85 c0                	test   %eax,%eax
    mem = kalloc();
80106925:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106927:	75 af                	jne    801068d8 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106929:	c7 04 24 dd 77 10 80 	movl   $0x801077dd,(%esp)
80106930:	e8 1b 9d ff ff       	call   80100650 <cprintf>
  if(newsz >= oldsz)
80106935:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106938:	77 56                	ja     80106990 <allocuvm+0xf0>
8010693a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      return 0;
80106940:	31 c0                	xor    %eax,%eax
}
80106942:	83 c4 1c             	add    $0x1c,%esp
80106945:	5b                   	pop    %ebx
80106946:	5e                   	pop    %esi
80106947:	5f                   	pop    %edi
80106948:	5d                   	pop    %ebp
80106949:	c3                   	ret    
8010694a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106950:	83 c4 1c             	add    $0x1c,%esp
  return newsz;
80106953:	89 f8                	mov    %edi,%eax
}
80106955:	5b                   	pop    %ebx
80106956:	5e                   	pop    %esi
80106957:	5f                   	pop    %edi
80106958:	5d                   	pop    %ebp
80106959:	c3                   	ret    
8010695a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80106960:	c7 04 24 f5 77 10 80 	movl   $0x801077f5,(%esp)
80106967:	e8 e4 9c ff ff       	call   80100650 <cprintf>
  if(newsz >= oldsz)
8010696c:	3b 7d 0c             	cmp    0xc(%ebp),%edi
8010696f:	76 0d                	jbe    8010697e <allocuvm+0xde>
80106971:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106974:	89 fa                	mov    %edi,%edx
80106976:	8b 45 08             	mov    0x8(%ebp),%eax
80106979:	e8 52 fb ff ff       	call   801064d0 <deallocuvm.part.0>
      kfree(mem);
8010697e:	89 34 24             	mov    %esi,(%esp)
80106981:	e8 6a b9 ff ff       	call   801022f0 <kfree>
}
80106986:	83 c4 1c             	add    $0x1c,%esp
      return 0;
80106989:	31 c0                	xor    %eax,%eax
}
8010698b:	5b                   	pop    %ebx
8010698c:	5e                   	pop    %esi
8010698d:	5f                   	pop    %edi
8010698e:	5d                   	pop    %ebp
8010698f:	c3                   	ret    
80106990:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106993:	89 fa                	mov    %edi,%edx
80106995:	8b 45 08             	mov    0x8(%ebp),%eax
80106998:	e8 33 fb ff ff       	call   801064d0 <deallocuvm.part.0>
      return 0;
8010699d:	31 c0                	xor    %eax,%eax
8010699f:	eb a1                	jmp    80106942 <allocuvm+0xa2>
801069a1:	eb 0d                	jmp    801069b0 <deallocuvm>
801069a3:	90                   	nop
801069a4:	90                   	nop
801069a5:	90                   	nop
801069a6:	90                   	nop
801069a7:	90                   	nop
801069a8:	90                   	nop
801069a9:	90                   	nop
801069aa:	90                   	nop
801069ab:	90                   	nop
801069ac:	90                   	nop
801069ad:	90                   	nop
801069ae:	90                   	nop
801069af:	90                   	nop

801069b0 <deallocuvm>:
{
801069b0:	55                   	push   %ebp
801069b1:	89 e5                	mov    %esp,%ebp
801069b3:	8b 55 0c             	mov    0xc(%ebp),%edx
801069b6:	8b 4d 10             	mov    0x10(%ebp),%ecx
801069b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
801069bc:	39 d1                	cmp    %edx,%ecx
801069be:	73 08                	jae    801069c8 <deallocuvm+0x18>
}
801069c0:	5d                   	pop    %ebp
801069c1:	e9 0a fb ff ff       	jmp    801064d0 <deallocuvm.part.0>
801069c6:	66 90                	xchg   %ax,%ax
801069c8:	89 d0                	mov    %edx,%eax
801069ca:	5d                   	pop    %ebp
801069cb:	c3                   	ret    
801069cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801069d0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
801069d0:	55                   	push   %ebp
801069d1:	89 e5                	mov    %esp,%ebp
801069d3:	56                   	push   %esi
801069d4:	53                   	push   %ebx
801069d5:	83 ec 10             	sub    $0x10,%esp
801069d8:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
801069db:	85 f6                	test   %esi,%esi
801069dd:	74 59                	je     80106a38 <freevm+0x68>
801069df:	31 c9                	xor    %ecx,%ecx
801069e1:	ba 00 00 00 80       	mov    $0x80000000,%edx
801069e6:	89 f0                	mov    %esi,%eax
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
801069e8:	31 db                	xor    %ebx,%ebx
801069ea:	e8 e1 fa ff ff       	call   801064d0 <deallocuvm.part.0>
801069ef:	eb 12                	jmp    80106a03 <freevm+0x33>
801069f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069f8:	83 c3 01             	add    $0x1,%ebx
801069fb:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80106a01:	74 27                	je     80106a2a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106a03:	8b 14 9e             	mov    (%esi,%ebx,4),%edx
80106a06:	f6 c2 01             	test   $0x1,%dl
80106a09:	74 ed                	je     801069f8 <freevm+0x28>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106a0b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(i = 0; i < NPDENTRIES; i++){
80106a11:	83 c3 01             	add    $0x1,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106a14:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
80106a1a:	89 14 24             	mov    %edx,(%esp)
80106a1d:	e8 ce b8 ff ff       	call   801022f0 <kfree>
  for(i = 0; i < NPDENTRIES; i++){
80106a22:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80106a28:	75 d9                	jne    80106a03 <freevm+0x33>
    }
  }
  kfree((char*)pgdir);
80106a2a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106a2d:	83 c4 10             	add    $0x10,%esp
80106a30:	5b                   	pop    %ebx
80106a31:	5e                   	pop    %esi
80106a32:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80106a33:	e9 b8 b8 ff ff       	jmp    801022f0 <kfree>
    panic("freevm: no pgdir");
80106a38:	c7 04 24 11 78 10 80 	movl   $0x80107811,(%esp)
80106a3f:	e8 1c 99 ff ff       	call   80100360 <panic>
80106a44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106a50 <setupkvm>:
{
80106a50:	55                   	push   %ebp
80106a51:	89 e5                	mov    %esp,%ebp
80106a53:	56                   	push   %esi
80106a54:	53                   	push   %ebx
80106a55:	83 ec 10             	sub    $0x10,%esp
  if((pgdir = (pde_t*)kalloc()) == 0)
80106a58:	e8 43 ba ff ff       	call   801024a0 <kalloc>
80106a5d:	85 c0                	test   %eax,%eax
80106a5f:	89 c6                	mov    %eax,%esi
80106a61:	74 6d                	je     80106ad0 <setupkvm+0x80>
  memset(pgdir, 0, PGSIZE);
80106a63:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106a6a:	00 
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106a6b:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  memset(pgdir, 0, PGSIZE);
80106a70:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106a77:	00 
80106a78:	89 04 24             	mov    %eax,(%esp)
80106a7b:	e8 00 d8 ff ff       	call   80104280 <memset>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106a80:	8b 53 0c             	mov    0xc(%ebx),%edx
80106a83:	8b 43 04             	mov    0x4(%ebx),%eax
80106a86:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106a89:	89 54 24 04          	mov    %edx,0x4(%esp)
80106a8d:	8b 13                	mov    (%ebx),%edx
80106a8f:	89 04 24             	mov    %eax,(%esp)
80106a92:	29 c1                	sub    %eax,%ecx
80106a94:	89 f0                	mov    %esi,%eax
80106a96:	e8 b5 f9 ff ff       	call   80106450 <mappages>
80106a9b:	85 c0                	test   %eax,%eax
80106a9d:	78 19                	js     80106ab8 <setupkvm+0x68>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106a9f:	83 c3 10             	add    $0x10,%ebx
80106aa2:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106aa8:	72 d6                	jb     80106a80 <setupkvm+0x30>
80106aaa:	89 f0                	mov    %esi,%eax
}
80106aac:	83 c4 10             	add    $0x10,%esp
80106aaf:	5b                   	pop    %ebx
80106ab0:	5e                   	pop    %esi
80106ab1:	5d                   	pop    %ebp
80106ab2:	c3                   	ret    
80106ab3:	90                   	nop
80106ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80106ab8:	89 34 24             	mov    %esi,(%esp)
80106abb:	e8 10 ff ff ff       	call   801069d0 <freevm>
}
80106ac0:	83 c4 10             	add    $0x10,%esp
      return 0;
80106ac3:	31 c0                	xor    %eax,%eax
}
80106ac5:	5b                   	pop    %ebx
80106ac6:	5e                   	pop    %esi
80106ac7:	5d                   	pop    %ebp
80106ac8:	c3                   	ret    
80106ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return 0;
80106ad0:	31 c0                	xor    %eax,%eax
80106ad2:	eb d8                	jmp    80106aac <setupkvm+0x5c>
80106ad4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ada:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ae0 <kvmalloc>:
{
80106ae0:	55                   	push   %ebp
80106ae1:	89 e5                	mov    %esp,%ebp
80106ae3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106ae6:	e8 65 ff ff ff       	call   80106a50 <setupkvm>
80106aeb:	a3 c4 55 11 80       	mov    %eax,0x801155c4
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106af0:	05 00 00 00 80       	add    $0x80000000,%eax
80106af5:	0f 22 d8             	mov    %eax,%cr3
}
80106af8:	c9                   	leave  
80106af9:	c3                   	ret    
80106afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106b00 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106b00:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106b01:	31 c9                	xor    %ecx,%ecx
{
80106b03:	89 e5                	mov    %esp,%ebp
80106b05:	83 ec 18             	sub    $0x18,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106b08:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b0b:	8b 45 08             	mov    0x8(%ebp),%eax
80106b0e:	e8 ad f8 ff ff       	call   801063c0 <walkpgdir>
  if(pte == 0)
80106b13:	85 c0                	test   %eax,%eax
80106b15:	74 05                	je     80106b1c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106b17:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106b1a:	c9                   	leave  
80106b1b:	c3                   	ret    
    panic("clearpteu");
80106b1c:	c7 04 24 22 78 10 80 	movl   $0x80107822,(%esp)
80106b23:	e8 38 98 ff ff       	call   80100360 <panic>
80106b28:	90                   	nop
80106b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106b30 <copyuvm>:
// of it for a child.

// ** added unit arg
pde_t*
copyuvm(pde_t *pgdir, uint sz, uint num_pages)
{
80106b30:	55                   	push   %ebp
80106b31:	89 e5                	mov    %esp,%ebp
80106b33:	57                   	push   %edi
80106b34:	56                   	push   %esi
80106b35:	53                   	push   %ebx
80106b36:	83 ec 2c             	sub    $0x2c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106b39:	e8 12 ff ff ff       	call   80106a50 <setupkvm>
80106b3e:	85 c0                	test   %eax,%eax
80106b40:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106b43:	0f 84 5f 01 00 00    	je     80106ca8 <copyuvm+0x178>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106b49:	8b 45 0c             	mov    0xc(%ebp),%eax
80106b4c:	85 c0                	test   %eax,%eax
80106b4e:	0f 84 a4 00 00 00    	je     80106bf8 <copyuvm+0xc8>
80106b54:	31 ff                	xor    %edi,%edi
80106b56:	eb 4c                	jmp    80106ba4 <copyuvm+0x74>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106b58:	81 c6 00 00 00 80    	add    $0x80000000,%esi
80106b5e:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106b65:	00 
80106b66:	89 74 24 04          	mov    %esi,0x4(%esp)
80106b6a:	89 04 24             	mov    %eax,(%esp)
80106b6d:	e8 ae d7 ff ff       	call   80104320 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106b72:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b75:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b7a:	89 fa                	mov    %edi,%edx
80106b7c:	89 44 24 04          	mov    %eax,0x4(%esp)
80106b80:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106b86:	89 04 24             	mov    %eax,(%esp)
80106b89:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106b8c:	e8 bf f8 ff ff       	call   80106450 <mappages>
80106b91:	85 c0                	test   %eax,%eax
80106b93:	0f 88 f7 00 00 00    	js     80106c90 <copyuvm+0x160>
  for(i = 0; i < sz; i += PGSIZE){
80106b99:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106b9f:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80106ba2:	76 54                	jbe    80106bf8 <copyuvm+0xc8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106ba4:	8b 45 08             	mov    0x8(%ebp),%eax
80106ba7:	31 c9                	xor    %ecx,%ecx
80106ba9:	89 fa                	mov    %edi,%edx
80106bab:	e8 10 f8 ff ff       	call   801063c0 <walkpgdir>
80106bb0:	85 c0                	test   %eax,%eax
80106bb2:	0f 84 03 01 00 00    	je     80106cbb <copyuvm+0x18b>
    if(!(*pte & PTE_P))
80106bb8:	8b 00                	mov    (%eax),%eax
80106bba:	a8 01                	test   $0x1,%al
80106bbc:	0f 84 ed 00 00 00    	je     80106caf <copyuvm+0x17f>
    pa = PTE_ADDR(*pte);
80106bc2:	89 c6                	mov    %eax,%esi
    flags = PTE_FLAGS(*pte);
80106bc4:	25 ff 0f 00 00       	and    $0xfff,%eax
80106bc9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    pa = PTE_ADDR(*pte);
80106bcc:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    if((mem = kalloc()) == 0)
80106bd2:	e8 c9 b8 ff ff       	call   801024a0 <kalloc>
80106bd7:	85 c0                	test   %eax,%eax
80106bd9:	89 c3                	mov    %eax,%ebx
80106bdb:	0f 85 77 ff ff ff    	jne    80106b58 <copyuvm+0x28>
  }

  return d;

bad:
  freevm(d);
80106be1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106be4:	89 04 24             	mov    %eax,(%esp)
80106be7:	e8 e4 fd ff ff       	call   801069d0 <freevm>
  return 0;
80106bec:	31 c0                	xor    %eax,%eax
}
80106bee:	83 c4 2c             	add    $0x2c,%esp
80106bf1:	5b                   	pop    %ebx
80106bf2:	5e                   	pop    %esi
80106bf3:	5f                   	pop    %edi
80106bf4:	5d                   	pop    %ebp
80106bf5:	c3                   	ret    
80106bf6:	66 90                	xchg   %ax,%ax
   for(i = KERNBASE - (num_pages * PGSIZE * 2); i < KERNBASE; i += PGSIZE){ 
80106bf8:	8b 5d 10             	mov    0x10(%ebp),%ebx
80106bfb:	f7 db                	neg    %ebx
80106bfd:	c1 e3 0d             	shl    $0xd,%ebx
80106c00:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106c06:	79 4d                	jns    80106c55 <copyuvm+0x125>
80106c08:	e9 90 00 00 00       	jmp    80106c9d <copyuvm+0x16d>
80106c0d:	8d 76 00             	lea    0x0(%esi),%esi
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106c10:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106c16:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106c1d:	00 
80106c1e:	89 7c 24 04          	mov    %edi,0x4(%esp)
80106c22:	89 04 24             	mov    %eax,(%esp)
80106c25:	e8 f6 d6 ff ff       	call   80104320 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80106c2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106c2d:	8d 96 00 00 00 80    	lea    -0x80000000(%esi),%edx
80106c33:	89 14 24             	mov    %edx,(%esp)
80106c36:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c3b:	89 da                	mov    %ebx,%edx
80106c3d:	89 44 24 04          	mov    %eax,0x4(%esp)
80106c41:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106c44:	e8 07 f8 ff ff       	call   80106450 <mappages>
80106c49:	85 c0                	test   %eax,%eax
80106c4b:	78 94                	js     80106be1 <copyuvm+0xb1>
   for(i = KERNBASE - (num_pages * PGSIZE * 2); i < KERNBASE; i += PGSIZE){ 
80106c4d:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c53:	78 48                	js     80106c9d <copyuvm+0x16d>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106c55:	8b 45 08             	mov    0x8(%ebp),%eax
80106c58:	31 c9                	xor    %ecx,%ecx
80106c5a:	89 da                	mov    %ebx,%edx
80106c5c:	e8 5f f7 ff ff       	call   801063c0 <walkpgdir>
80106c61:	85 c0                	test   %eax,%eax
80106c63:	74 56                	je     80106cbb <copyuvm+0x18b>
    if(!(*pte & PTE_P))
80106c65:	8b 30                	mov    (%eax),%esi
80106c67:	f7 c6 01 00 00 00    	test   $0x1,%esi
80106c6d:	74 40                	je     80106caf <copyuvm+0x17f>
    pa = PTE_ADDR(*pte);
80106c6f:	89 f7                	mov    %esi,%edi
    flags = PTE_FLAGS(*pte);
80106c71:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
80106c77:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    pa = PTE_ADDR(*pte);
80106c7a:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    if((mem = kalloc()) == 0)
80106c80:	e8 1b b8 ff ff       	call   801024a0 <kalloc>
80106c85:	85 c0                	test   %eax,%eax
80106c87:	89 c6                	mov    %eax,%esi
80106c89:	75 85                	jne    80106c10 <copyuvm+0xe0>
80106c8b:	e9 51 ff ff ff       	jmp    80106be1 <copyuvm+0xb1>
      kfree(mem);
80106c90:	89 1c 24             	mov    %ebx,(%esp)
80106c93:	e8 58 b6 ff ff       	call   801022f0 <kfree>
      goto bad;
80106c98:	e9 44 ff ff ff       	jmp    80106be1 <copyuvm+0xb1>
80106c9d:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80106ca0:	83 c4 2c             	add    $0x2c,%esp
80106ca3:	5b                   	pop    %ebx
80106ca4:	5e                   	pop    %esi
80106ca5:	5f                   	pop    %edi
80106ca6:	5d                   	pop    %ebp
80106ca7:	c3                   	ret    
    return 0;
80106ca8:	31 c0                	xor    %eax,%eax
80106caa:	e9 3f ff ff ff       	jmp    80106bee <copyuvm+0xbe>
      panic("copyuvm: page not present");
80106caf:	c7 04 24 46 78 10 80 	movl   $0x80107846,(%esp)
80106cb6:	e8 a5 96 ff ff       	call   80100360 <panic>
      panic("copyuvm: pte should exist");
80106cbb:	c7 04 24 2c 78 10 80 	movl   $0x8010782c,(%esp)
80106cc2:	e8 99 96 ff ff       	call   80100360 <panic>
80106cc7:	89 f6                	mov    %esi,%esi
80106cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cd0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106cd0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106cd1:	31 c9                	xor    %ecx,%ecx
{
80106cd3:	89 e5                	mov    %esp,%ebp
80106cd5:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106cd8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106cdb:	8b 45 08             	mov    0x8(%ebp),%eax
80106cde:	e8 dd f6 ff ff       	call   801063c0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106ce3:	8b 00                	mov    (%eax),%eax
80106ce5:	89 c2                	mov    %eax,%edx
80106ce7:	83 e2 05             	and    $0x5,%edx
    return 0;
  if((*pte & PTE_U) == 0)
80106cea:	83 fa 05             	cmp    $0x5,%edx
80106ced:	75 11                	jne    80106d00 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106cef:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106cf4:	05 00 00 00 80       	add    $0x80000000,%eax
}
80106cf9:	c9                   	leave  
80106cfa:	c3                   	ret    
80106cfb:	90                   	nop
80106cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
80106d00:	31 c0                	xor    %eax,%eax
}
80106d02:	c9                   	leave  
80106d03:	c3                   	ret    
80106d04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106d10 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106d10:	55                   	push   %ebp
80106d11:	89 e5                	mov    %esp,%ebp
80106d13:	57                   	push   %edi
80106d14:	56                   	push   %esi
80106d15:	53                   	push   %ebx
80106d16:	83 ec 1c             	sub    $0x1c,%esp
80106d19:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106d1c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106d1f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106d22:	85 db                	test   %ebx,%ebx
80106d24:	75 3a                	jne    80106d60 <copyout+0x50>
80106d26:	eb 68                	jmp    80106d90 <copyout+0x80>
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106d28:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106d2b:	89 f2                	mov    %esi,%edx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106d2d:	89 7c 24 04          	mov    %edi,0x4(%esp)
    n = PGSIZE - (va - va0);
80106d31:	29 ca                	sub    %ecx,%edx
80106d33:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106d39:	39 da                	cmp    %ebx,%edx
80106d3b:	0f 47 d3             	cmova  %ebx,%edx
    memmove(pa0 + (va - va0), buf, n);
80106d3e:	29 f1                	sub    %esi,%ecx
80106d40:	01 c8                	add    %ecx,%eax
80106d42:	89 54 24 08          	mov    %edx,0x8(%esp)
80106d46:	89 04 24             	mov    %eax,(%esp)
80106d49:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106d4c:	e8 cf d5 ff ff       	call   80104320 <memmove>
    len -= n;
    buf += n;
80106d51:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    va = va0 + PGSIZE;
80106d54:	8d 8e 00 10 00 00    	lea    0x1000(%esi),%ecx
    buf += n;
80106d5a:	01 d7                	add    %edx,%edi
  while(len > 0){
80106d5c:	29 d3                	sub    %edx,%ebx
80106d5e:	74 30                	je     80106d90 <copyout+0x80>
    pa0 = uva2ka(pgdir, (char*)va0);
80106d60:	8b 45 08             	mov    0x8(%ebp),%eax
    va0 = (uint)PGROUNDDOWN(va);
80106d63:	89 ce                	mov    %ecx,%esi
80106d65:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106d6b:	89 74 24 04          	mov    %esi,0x4(%esp)
    va0 = (uint)PGROUNDDOWN(va);
80106d6f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    pa0 = uva2ka(pgdir, (char*)va0);
80106d72:	89 04 24             	mov    %eax,(%esp)
80106d75:	e8 56 ff ff ff       	call   80106cd0 <uva2ka>
    if(pa0 == 0)
80106d7a:	85 c0                	test   %eax,%eax
80106d7c:	75 aa                	jne    80106d28 <copyout+0x18>
  }
  return 0;
}
80106d7e:	83 c4 1c             	add    $0x1c,%esp
      return -1;
80106d81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106d86:	5b                   	pop    %ebx
80106d87:	5e                   	pop    %esi
80106d88:	5f                   	pop    %edi
80106d89:	5d                   	pop    %ebp
80106d8a:	c3                   	ret    
80106d8b:	90                   	nop
80106d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106d90:	83 c4 1c             	add    $0x1c,%esp
  return 0;
80106d93:	31 c0                	xor    %eax,%eax
}
80106d95:	5b                   	pop    %ebx
80106d96:	5e                   	pop    %esi
80106d97:	5f                   	pop    %edi
80106d98:	5d                   	pop    %ebp
80106d99:	c3                   	ret    
80106d9a:	66 90                	xchg   %ax,%ax
80106d9c:	66 90                	xchg   %ax,%ax
80106d9e:	66 90                	xchg   %ax,%ax

80106da0 <shminit>:
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
80106da0:	55                   	push   %ebp
80106da1:	89 e5                	mov    %esp,%ebp
80106da3:	83 ec 18             	sub    $0x18,%esp
  int i;
  initlock(&(shm_table.lock), "SHM lock");
80106da6:	c7 44 24 04 84 78 10 	movl   $0x80107884,0x4(%esp)
80106dad:	80 
80106dae:	c7 04 24 e0 55 11 80 	movl   $0x801155e0,(%esp)
80106db5:	e8 96 d2 ff ff       	call   80104050 <initlock>
  acquire(&(shm_table.lock));
80106dba:	c7 04 24 e0 55 11 80 	movl   $0x801155e0,(%esp)
80106dc1:	e8 7a d3 ff ff       	call   80104140 <acquire>
80106dc6:	b8 14 56 11 80       	mov    $0x80115614,%eax
80106dcb:	90                   	nop
80106dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
80106dd0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106dd6:	83 c0 0c             	add    $0xc,%eax
    shm_table.shm_pages[i].frame =0;
80106dd9:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    shm_table.shm_pages[i].refcnt =0;
80106de0:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
  for (i = 0; i< 64; i++) {
80106de7:	3d 14 59 11 80       	cmp    $0x80115914,%eax
80106dec:	75 e2                	jne    80106dd0 <shminit+0x30>
  }
  release(&(shm_table.lock));
80106dee:	c7 04 24 e0 55 11 80 	movl   $0x801155e0,(%esp)
80106df5:	e8 36 d4 ff ff       	call   80104230 <release>
}
80106dfa:	c9                   	leave  
80106dfb:	c3                   	ret    
80106dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e00 <shm_open>:

int shm_open(int id, char **pointer) {
80106e00:	55                   	push   %ebp




return 0; //added to remove compiler warning -- you should decide what to return
}
80106e01:	31 c0                	xor    %eax,%eax
int shm_open(int id, char **pointer) {
80106e03:	89 e5                	mov    %esp,%ebp
}
80106e05:	5d                   	pop    %ebp
80106e06:	c3                   	ret    
80106e07:	89 f6                	mov    %esi,%esi
80106e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e10 <shm_close>:


int shm_close(int id) {
80106e10:	55                   	push   %ebp




return 0; //added to remove compiler warning -- you should decide what to return
}
80106e11:	31 c0                	xor    %eax,%eax
int shm_close(int id) {
80106e13:	89 e5                	mov    %esp,%ebp
}
80106e15:	5d                   	pop    %ebp
80106e16:	c3                   	ret    
