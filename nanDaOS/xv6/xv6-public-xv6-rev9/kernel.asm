
kernel：     文件格式 elf32-i386


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
80100028:	bc d0 b5 10 80       	mov    $0x8010b5d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 d0 30 10 80       	mov    $0x801030d0,%eax
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
80100040:	f3 0f 1e fb          	endbr32 
80100044:	55                   	push   %ebp
80100045:	89 e5                	mov    %esp,%ebp
80100047:	83 ec 10             	sub    $0x10,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004a:	68 e0 6f 10 80       	push   $0x80106fe0
8010004f:	68 e0 b5 10 80       	push   $0x8010b5e0
80100054:	e8 c7 42 00 00       	call   80104320 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
80100059:	83 c4 10             	add    $0x10,%esp
8010005c:	ba e4 f4 10 80       	mov    $0x8010f4e4,%edx
  bcache.head.prev = &bcache.head;
80100061:	c7 05 f0 f4 10 80 e4 	movl   $0x8010f4e4,0x8010f4f0
80100068:	f4 10 80 
  bcache.head.next = &bcache.head;
8010006b:	c7 05 f4 f4 10 80 e4 	movl   $0x8010f4e4,0x8010f4f4
80100072:	f4 10 80 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100075:	b8 14 b6 10 80       	mov    $0x8010b614,%eax
8010007a:	eb 06                	jmp    80100082 <binit+0x42>
8010007c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c8                	mov    %ecx,%eax
    b->next = bcache.head.next;
80100082:	89 50 10             	mov    %edx,0x10(%eax)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100085:	8d 88 18 02 00 00    	lea    0x218(%eax),%ecx
    b->prev = &bcache.head;
8010008b:	c7 40 0c e4 f4 10 80 	movl   $0x8010f4e4,0xc(%eax)
    b->dev = -1;
80100092:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    bcache.head.next->prev = b;
80100099:	8b 15 f4 f4 10 80    	mov    0x8010f4f4,%edx
8010009f:	89 42 0c             	mov    %eax,0xc(%edx)
    bcache.head.next = b;
801000a2:	89 c2                	mov    %eax,%edx
801000a4:	a3 f4 f4 10 80       	mov    %eax,0x8010f4f4
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a9:	3d cc f2 10 80       	cmp    $0x8010f2cc,%eax
801000ae:	75 d0                	jne    80100080 <binit+0x40>
  }
}
801000b0:	c9                   	leave  
801000b1:	c3                   	ret    
801000b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801000c0 <bread>:
}

// Return a B_BUSY buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000c0:	f3 0f 1e fb          	endbr32 
801000c4:	55                   	push   %ebp
801000c5:	89 e5                	mov    %esp,%ebp
801000c7:	57                   	push   %edi
801000c8:	56                   	push   %esi
801000c9:	53                   	push   %ebx
801000ca:	83 ec 18             	sub    $0x18,%esp
801000cd:	8b 7d 08             	mov    0x8(%ebp),%edi
801000d0:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&bcache.lock);
801000d3:	68 e0 b5 10 80       	push   $0x8010b5e0
801000d8:	e8 63 42 00 00       	call   80104340 <acquire>
801000dd:	83 c4 10             	add    $0x10,%esp
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e0:	8b 1d f4 f4 10 80    	mov    0x8010f4f4,%ebx
801000e6:	81 fb e4 f4 10 80    	cmp    $0x8010f4e4,%ebx
801000ec:	75 0d                	jne    801000fb <bread+0x3b>
801000ee:	eb 38                	jmp    80100128 <bread+0x68>
801000f0:	8b 5b 10             	mov    0x10(%ebx),%ebx
801000f3:	81 fb e4 f4 10 80    	cmp    $0x8010f4e4,%ebx
801000f9:	74 2d                	je     80100128 <bread+0x68>
    if(b->dev == dev && b->blockno == blockno){
801000fb:	3b 7b 04             	cmp    0x4(%ebx),%edi
801000fe:	75 f0                	jne    801000f0 <bread+0x30>
80100100:	3b 73 08             	cmp    0x8(%ebx),%esi
80100103:	75 eb                	jne    801000f0 <bread+0x30>
      if(!(b->flags & B_BUSY)){
80100105:	8b 03                	mov    (%ebx),%eax
80100107:	a8 01                	test   $0x1,%al
80100109:	0f 84 91 00 00 00    	je     801001a0 <bread+0xe0>
      sleep(b, &bcache.lock);
8010010f:	83 ec 08             	sub    $0x8,%esp
80100112:	68 e0 b5 10 80       	push   $0x8010b5e0
80100117:	53                   	push   %ebx
80100118:	e8 83 3e 00 00       	call   80103fa0 <sleep>
      goto loop;
8010011d:	83 c4 10             	add    $0x10,%esp
80100120:	eb be                	jmp    801000e0 <bread+0x20>
80100122:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100128:	8b 1d f0 f4 10 80    	mov    0x8010f4f0,%ebx
8010012e:	81 fb e4 f4 10 80    	cmp    $0x8010f4e4,%ebx
80100134:	75 15                	jne    8010014b <bread+0x8b>
80100136:	eb 7f                	jmp    801001b7 <bread+0xf7>
80100138:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010013f:	90                   	nop
80100140:	8b 5b 0c             	mov    0xc(%ebx),%ebx
80100143:	81 fb e4 f4 10 80    	cmp    $0x8010f4e4,%ebx
80100149:	74 6c                	je     801001b7 <bread+0xf7>
    if((b->flags & B_BUSY) == 0 && (b->flags & B_DIRTY) == 0){
8010014b:	f6 03 05             	testb  $0x5,(%ebx)
8010014e:	75 f0                	jne    80100140 <bread+0x80>
      release(&bcache.lock);
80100150:	83 ec 0c             	sub    $0xc,%esp
      b->dev = dev;
80100153:	89 7b 04             	mov    %edi,0x4(%ebx)
      b->blockno = blockno;
80100156:	89 73 08             	mov    %esi,0x8(%ebx)
      b->flags = B_BUSY;
80100159:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
      release(&bcache.lock);
8010015f:	68 e0 b5 10 80       	push   $0x8010b5e0
80100164:	e8 b7 43 00 00       	call   80104520 <release>
      return b;
80100169:	83 c4 10             	add    $0x10,%esp
  struct buf *b;

  b = bget(dev, blockno);
  if(!(b->flags & B_VALID)) {
8010016c:	f6 03 02             	testb  $0x2,(%ebx)
8010016f:	74 0f                	je     80100180 <bread+0xc0>
    iderw(b);
  }
  return b;
}
80100171:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100174:	89 d8                	mov    %ebx,%eax
80100176:	5b                   	pop    %ebx
80100177:	5e                   	pop    %esi
80100178:	5f                   	pop    %edi
80100179:	5d                   	pop    %ebp
8010017a:	c3                   	ret    
8010017b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010017f:	90                   	nop
    iderw(b);
80100180:	83 ec 0c             	sub    $0xc,%esp
80100183:	53                   	push   %ebx
80100184:	e8 e7 20 00 00       	call   80102270 <iderw>
80100189:	83 c4 10             	add    $0x10,%esp
}
8010018c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010018f:	89 d8                	mov    %ebx,%eax
80100191:	5b                   	pop    %ebx
80100192:	5e                   	pop    %esi
80100193:	5f                   	pop    %edi
80100194:	5d                   	pop    %ebp
80100195:	c3                   	ret    
80100196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010019d:	8d 76 00             	lea    0x0(%esi),%esi
        release(&bcache.lock);
801001a0:	83 ec 0c             	sub    $0xc,%esp
        b->flags |= B_BUSY;
801001a3:	83 c8 01             	or     $0x1,%eax
801001a6:	89 03                	mov    %eax,(%ebx)
        release(&bcache.lock);
801001a8:	68 e0 b5 10 80       	push   $0x8010b5e0
801001ad:	e8 6e 43 00 00       	call   80104520 <release>
        return b;
801001b2:	83 c4 10             	add    $0x10,%esp
801001b5:	eb b5                	jmp    8010016c <bread+0xac>
  panic("bget: no buffers");
801001b7:	83 ec 0c             	sub    $0xc,%esp
801001ba:	68 e7 6f 10 80       	push   $0x80106fe7
801001bf:	e8 bc 01 00 00       	call   80100380 <panic>
801001c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801001cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001cf:	90                   	nop

801001d0 <bwrite>:

// Write b's contents to disk.  Must be B_BUSY.
void
bwrite(struct buf *b)
{
801001d0:	f3 0f 1e fb          	endbr32 
801001d4:	55                   	push   %ebp
801001d5:	89 e5                	mov    %esp,%ebp
801001d7:	83 ec 08             	sub    $0x8,%esp
801001da:	8b 55 08             	mov    0x8(%ebp),%edx
  if((b->flags & B_BUSY) == 0)
801001dd:	8b 02                	mov    (%edx),%eax
801001df:	a8 01                	test   $0x1,%al
801001e1:	74 0b                	je     801001ee <bwrite+0x1e>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001e3:	83 c8 04             	or     $0x4,%eax
801001e6:	89 02                	mov    %eax,(%edx)
  iderw(b);
}
801001e8:	c9                   	leave  
  iderw(b);
801001e9:	e9 82 20 00 00       	jmp    80102270 <iderw>
    panic("bwrite");
801001ee:	83 ec 0c             	sub    $0xc,%esp
801001f1:	68 f8 6f 10 80       	push   $0x80106ff8
801001f6:	e8 85 01 00 00       	call   80100380 <panic>
801001fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001ff:	90                   	nop

80100200 <brelse>:

// Release a B_BUSY buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
80100200:	f3 0f 1e fb          	endbr32 
80100204:	55                   	push   %ebp
80100205:	89 e5                	mov    %esp,%ebp
80100207:	53                   	push   %ebx
80100208:	83 ec 04             	sub    $0x4,%esp
8010020b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((b->flags & B_BUSY) == 0)
8010020e:	f6 03 01             	testb  $0x1,(%ebx)
80100211:	74 57                	je     8010026a <brelse+0x6a>
    panic("brelse");

  acquire(&bcache.lock);
80100213:	83 ec 0c             	sub    $0xc,%esp
80100216:	68 e0 b5 10 80       	push   $0x8010b5e0
8010021b:	e8 20 41 00 00       	call   80104340 <acquire>

  b->next->prev = b->prev;
80100220:	8b 53 10             	mov    0x10(%ebx),%edx
80100223:	8b 43 0c             	mov    0xc(%ebx),%eax
80100226:	89 42 0c             	mov    %eax,0xc(%edx)
  b->prev->next = b->next;
80100229:	8b 53 10             	mov    0x10(%ebx),%edx
8010022c:	89 50 10             	mov    %edx,0x10(%eax)
  b->next = bcache.head.next;
8010022f:	a1 f4 f4 10 80       	mov    0x8010f4f4,%eax
  b->prev = &bcache.head;
80100234:	c7 43 0c e4 f4 10 80 	movl   $0x8010f4e4,0xc(%ebx)
  b->next = bcache.head.next;
8010023b:	89 43 10             	mov    %eax,0x10(%ebx)
  bcache.head.next->prev = b;
8010023e:	a1 f4 f4 10 80       	mov    0x8010f4f4,%eax
80100243:	89 58 0c             	mov    %ebx,0xc(%eax)
  bcache.head.next = b;
80100246:	89 1d f4 f4 10 80    	mov    %ebx,0x8010f4f4

  b->flags &= ~B_BUSY;
8010024c:	83 23 fe             	andl   $0xfffffffe,(%ebx)
  wakeup(b);
8010024f:	89 1c 24             	mov    %ebx,(%esp)
80100252:	e8 09 3f 00 00       	call   80104160 <wakeup>

  release(&bcache.lock);
80100257:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
}
8010025e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  release(&bcache.lock);
80100261:	83 c4 10             	add    $0x10,%esp
}
80100264:	c9                   	leave  
  release(&bcache.lock);
80100265:	e9 b6 42 00 00       	jmp    80104520 <release>
    panic("brelse");
8010026a:	83 ec 0c             	sub    $0xc,%esp
8010026d:	68 ff 6f 10 80       	push   $0x80106fff
80100272:	e8 09 01 00 00       	call   80100380 <panic>
80100277:	66 90                	xchg   %ax,%ax
80100279:	66 90                	xchg   %ax,%ax
8010027b:	66 90                	xchg   %ax,%ax
8010027d:	66 90                	xchg   %ax,%ax
8010027f:	90                   	nop

80100280 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100280:	f3 0f 1e fb          	endbr32 
80100284:	55                   	push   %ebp
80100285:	89 e5                	mov    %esp,%ebp
80100287:	57                   	push   %edi
80100288:	56                   	push   %esi
80100289:	53                   	push   %ebx
8010028a:	83 ec 18             	sub    $0x18,%esp
  uint target;
  int c;

  iunlock(ip);
8010028d:	ff 75 08             	pushl  0x8(%ebp)
{
80100290:	8b 5d 10             	mov    0x10(%ebp),%ebx
  target = n;
80100293:	89 de                	mov    %ebx,%esi
  iunlock(ip);
80100295:	e8 86 15 00 00       	call   80101820 <iunlock>
  acquire(&cons.lock);
8010029a:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801002a1:	e8 9a 40 00 00       	call   80104340 <acquire>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
801002a6:	8b 7d 0c             	mov    0xc(%ebp),%edi
  while(n > 0){
801002a9:	83 c4 10             	add    $0x10,%esp
    *dst++ = c;
801002ac:	01 df                	add    %ebx,%edi
  while(n > 0){
801002ae:	85 db                	test   %ebx,%ebx
801002b0:	0f 8e 97 00 00 00    	jle    8010034d <consoleread+0xcd>
    while(input.r == input.w){
801002b6:	a1 80 f7 10 80       	mov    0x8010f780,%eax
801002bb:	3b 05 84 f7 10 80    	cmp    0x8010f784,%eax
801002c1:	74 27                	je     801002ea <consoleread+0x6a>
801002c3:	eb 5b                	jmp    80100320 <consoleread+0xa0>
801002c5:	8d 76 00             	lea    0x0(%esi),%esi
      sleep(&input.r, &cons.lock);
801002c8:	83 ec 08             	sub    $0x8,%esp
801002cb:	68 20 a5 10 80       	push   $0x8010a520
801002d0:	68 80 f7 10 80       	push   $0x8010f780
801002d5:	e8 c6 3c 00 00       	call   80103fa0 <sleep>
    while(input.r == input.w){
801002da:	a1 80 f7 10 80       	mov    0x8010f780,%eax
801002df:	83 c4 10             	add    $0x10,%esp
801002e2:	3b 05 84 f7 10 80    	cmp    0x8010f784,%eax
801002e8:	75 36                	jne    80100320 <consoleread+0xa0>
      if(proc->killed){
801002ea:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002f0:	8b 48 24             	mov    0x24(%eax),%ecx
801002f3:	85 c9                	test   %ecx,%ecx
801002f5:	74 d1                	je     801002c8 <consoleread+0x48>
        release(&cons.lock);
801002f7:	83 ec 0c             	sub    $0xc,%esp
801002fa:	68 20 a5 10 80       	push   $0x8010a520
801002ff:	e8 1c 42 00 00       	call   80104520 <release>
        ilock(ip);
80100304:	5a                   	pop    %edx
80100305:	ff 75 08             	pushl  0x8(%ebp)
80100308:	e8 03 14 00 00       	call   80101710 <ilock>
        return -1;
8010030d:	83 c4 10             	add    $0x10,%esp
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
80100310:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
80100313:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100318:	5b                   	pop    %ebx
80100319:	5e                   	pop    %esi
8010031a:	5f                   	pop    %edi
8010031b:	5d                   	pop    %ebp
8010031c:	c3                   	ret    
8010031d:	8d 76 00             	lea    0x0(%esi),%esi
    c = input.buf[input.r++ % INPUT_BUF];
80100320:	8d 50 01             	lea    0x1(%eax),%edx
80100323:	89 15 80 f7 10 80    	mov    %edx,0x8010f780
80100329:	89 c2                	mov    %eax,%edx
8010032b:	83 e2 7f             	and    $0x7f,%edx
8010032e:	0f be 8a 00 f7 10 80 	movsbl -0x7fef0900(%edx),%ecx
    if(c == C('D')){  // EOF
80100335:	80 f9 04             	cmp    $0x4,%cl
80100338:	74 38                	je     80100372 <consoleread+0xf2>
    *dst++ = c;
8010033a:	89 d8                	mov    %ebx,%eax
    --n;
8010033c:	83 eb 01             	sub    $0x1,%ebx
    *dst++ = c;
8010033f:	f7 d8                	neg    %eax
80100341:	88 0c 07             	mov    %cl,(%edi,%eax,1)
    if(c == '\n')
80100344:	83 f9 0a             	cmp    $0xa,%ecx
80100347:	0f 85 61 ff ff ff    	jne    801002ae <consoleread+0x2e>
  release(&cons.lock);
8010034d:	83 ec 0c             	sub    $0xc,%esp
80100350:	68 20 a5 10 80       	push   $0x8010a520
80100355:	e8 c6 41 00 00       	call   80104520 <release>
  ilock(ip);
8010035a:	58                   	pop    %eax
8010035b:	ff 75 08             	pushl  0x8(%ebp)
8010035e:	e8 ad 13 00 00       	call   80101710 <ilock>
  return target - n;
80100363:	89 f0                	mov    %esi,%eax
80100365:	83 c4 10             	add    $0x10,%esp
}
80100368:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return target - n;
8010036b:	29 d8                	sub    %ebx,%eax
}
8010036d:	5b                   	pop    %ebx
8010036e:	5e                   	pop    %esi
8010036f:	5f                   	pop    %edi
80100370:	5d                   	pop    %ebp
80100371:	c3                   	ret    
      if(n < target){
80100372:	39 f3                	cmp    %esi,%ebx
80100374:	73 d7                	jae    8010034d <consoleread+0xcd>
        input.r--;
80100376:	a3 80 f7 10 80       	mov    %eax,0x8010f780
8010037b:	eb d0                	jmp    8010034d <consoleread+0xcd>
8010037d:	8d 76 00             	lea    0x0(%esi),%esi

80100380 <panic>:
{
80100380:	f3 0f 1e fb          	endbr32 
80100384:	55                   	push   %ebp
80100385:	89 e5                	mov    %esp,%ebp
80100387:	56                   	push   %esi
80100388:	53                   	push   %ebx
80100389:	83 ec 38             	sub    $0x38,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
8010038c:	fa                   	cli    
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
8010038d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  getcallerpcs(&s, pcs);
80100393:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100396:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cons.locking = 0;
80100399:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
801003a0:	00 00 00 
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
801003a3:	0f b6 00             	movzbl (%eax),%eax
801003a6:	50                   	push   %eax
801003a7:	68 06 70 10 80       	push   $0x80107006
801003ac:	e8 ef 02 00 00       	call   801006a0 <cprintf>
  cprintf(s);
801003b1:	58                   	pop    %eax
801003b2:	ff 75 08             	pushl  0x8(%ebp)
801003b5:	e8 e6 02 00 00       	call   801006a0 <cprintf>
  cprintf("\n");
801003ba:	c7 04 24 26 75 10 80 	movl   $0x80107526,(%esp)
801003c1:	e8 da 02 00 00       	call   801006a0 <cprintf>
  getcallerpcs(&s, pcs);
801003c6:	8d 45 08             	lea    0x8(%ebp),%eax
801003c9:	5a                   	pop    %edx
801003ca:	59                   	pop    %ecx
801003cb:	53                   	push   %ebx
801003cc:	50                   	push   %eax
801003cd:	e8 3e 40 00 00       	call   80104410 <getcallerpcs>
  for(i=0; i<10; i++)
801003d2:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003d5:	83 ec 08             	sub    $0x8,%esp
801003d8:	ff 33                	pushl  (%ebx)
801003da:	83 c3 04             	add    $0x4,%ebx
801003dd:	68 22 70 10 80       	push   $0x80107022
801003e2:	e8 b9 02 00 00       	call   801006a0 <cprintf>
  for(i=0; i<10; i++)
801003e7:	83 c4 10             	add    $0x10,%esp
801003ea:	39 f3                	cmp    %esi,%ebx
801003ec:	75 e7                	jne    801003d5 <panic+0x55>
  panicked = 1; // freeze other CPU
801003ee:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003f5:	00 00 00 
  for(;;)
801003f8:	eb fe                	jmp    801003f8 <panic+0x78>
801003fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100400 <consputc.part.0>:
consputc(int c)
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 1c             	sub    $0x1c,%esp
  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 ea 00 00 00    	je     80100500 <consputc.part.0+0x100>
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 f1 57 00 00       	call   80105c10 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100434:	89 ca                	mov    %ecx,%edx
80100436:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c6                	mov    %eax,%esi
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 ca                	mov    %ecx,%edx
80100449:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 f0                	or     %esi,%eax
  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 90 00 00 00    	je     801004e8 <consputc.part.0+0xe8>
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	74 70                	je     801004d0 <consputc.part.0+0xd0>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100460:	0f b6 db             	movzbl %bl,%ebx
80100463:	8d 70 01             	lea    0x1(%eax),%esi
80100466:	80 cf 07             	or     $0x7,%bh
80100469:	66 89 9c 00 00 80 0b 	mov    %bx,-0x7ff48000(%eax,%eax,1)
80100470:	80 
  if(pos < 0 || pos > 25*80)
80100471:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
80100477:	0f 8f f9 00 00 00    	jg     80100576 <consputc.part.0+0x176>
  if((pos/80) >= 24){  // Scroll up.
8010047d:	81 fe 7f 07 00 00    	cmp    $0x77f,%esi
80100483:	0f 8f a7 00 00 00    	jg     80100530 <consputc.part.0+0x130>
80100489:	89 f0                	mov    %esi,%eax
8010048b:	8d b4 36 00 80 0b 80 	lea    -0x7ff48000(%esi,%esi,1),%esi
80100492:	88 45 e7             	mov    %al,-0x19(%ebp)
80100495:	0f b6 fc             	movzbl %ah,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100498:	bb d4 03 00 00       	mov    $0x3d4,%ebx
8010049d:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a2:	89 da                	mov    %ebx,%edx
801004a4:	ee                   	out    %al,(%dx)
801004a5:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004aa:	89 f8                	mov    %edi,%eax
801004ac:	89 ca                	mov    %ecx,%edx
801004ae:	ee                   	out    %al,(%dx)
801004af:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b4:	89 da                	mov    %ebx,%edx
801004b6:	ee                   	out    %al,(%dx)
801004b7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
801004bb:	89 ca                	mov    %ecx,%edx
801004bd:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 06             	mov    %ax,(%esi)
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
801004ce:	66 90                	xchg   %ax,%ax
    if(pos > 0) --pos;
801004d0:	8d 70 ff             	lea    -0x1(%eax),%esi
801004d3:	85 c0                	test   %eax,%eax
801004d5:	75 9a                	jne    80100471 <consputc.part.0+0x71>
801004d7:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
801004db:	be 00 80 0b 80       	mov    $0x800b8000,%esi
801004e0:	31 ff                	xor    %edi,%edi
801004e2:	eb b4                	jmp    80100498 <consputc.part.0+0x98>
801004e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pos += 80 - pos%80;
801004e8:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
801004ed:	f7 e2                	mul    %edx
801004ef:	c1 ea 06             	shr    $0x6,%edx
801004f2:	8d 04 92             	lea    (%edx,%edx,4),%eax
801004f5:	c1 e0 04             	shl    $0x4,%eax
801004f8:	8d 70 50             	lea    0x50(%eax),%esi
801004fb:	e9 71 ff ff ff       	jmp    80100471 <consputc.part.0+0x71>
    uartputc('\b'); uartputc(' '); uartputc('\b');
80100500:	83 ec 0c             	sub    $0xc,%esp
80100503:	6a 08                	push   $0x8
80100505:	e8 06 57 00 00       	call   80105c10 <uartputc>
8010050a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100511:	e8 fa 56 00 00       	call   80105c10 <uartputc>
80100516:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010051d:	e8 ee 56 00 00       	call   80105c10 <uartputc>
80100522:	83 c4 10             	add    $0x10,%esp
80100525:	e9 f8 fe ff ff       	jmp    80100422 <consputc.part.0+0x22>
8010052a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100530:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
80100533:	8d 5e b0             	lea    -0x50(%esi),%ebx
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100536:	8d b4 36 60 7f 0b 80 	lea    -0x7ff480a0(%esi,%esi,1),%esi
8010053d:	bf 07 00 00 00       	mov    $0x7,%edi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100542:	68 60 0e 00 00       	push   $0xe60
80100547:	68 a0 80 0b 80       	push   $0x800b80a0
8010054c:	68 00 80 0b 80       	push   $0x800b8000
80100551:	e8 ba 40 00 00       	call   80104610 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100556:	b8 80 07 00 00       	mov    $0x780,%eax
8010055b:	83 c4 0c             	add    $0xc,%esp
8010055e:	29 d8                	sub    %ebx,%eax
80100560:	01 c0                	add    %eax,%eax
80100562:	50                   	push   %eax
80100563:	6a 00                	push   $0x0
80100565:	56                   	push   %esi
80100566:	e8 05 40 00 00       	call   80104570 <memset>
8010056b:	88 5d e7             	mov    %bl,-0x19(%ebp)
8010056e:	83 c4 10             	add    $0x10,%esp
80100571:	e9 22 ff ff ff       	jmp    80100498 <consputc.part.0+0x98>
    panic("pos under/overflow");
80100576:	83 ec 0c             	sub    $0xc,%esp
80100579:	68 26 70 10 80       	push   $0x80107026
8010057e:	e8 fd fd ff ff       	call   80100380 <panic>
80100583:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010058a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100590 <printint>:
{
80100590:	55                   	push   %ebp
80100591:	89 e5                	mov    %esp,%ebp
80100593:	57                   	push   %edi
80100594:	56                   	push   %esi
80100595:	53                   	push   %ebx
80100596:	83 ec 2c             	sub    $0x2c,%esp
80100599:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  if(sign && (sign = xx < 0))
8010059c:	85 c9                	test   %ecx,%ecx
8010059e:	74 04                	je     801005a4 <printint+0x14>
801005a0:	85 c0                	test   %eax,%eax
801005a2:	78 6d                	js     80100611 <printint+0x81>
    x = xx;
801005a4:	89 c1                	mov    %eax,%ecx
801005a6:	31 f6                	xor    %esi,%esi
  i = 0;
801005a8:	89 75 cc             	mov    %esi,-0x34(%ebp)
801005ab:	31 db                	xor    %ebx,%ebx
801005ad:	8d 7d d7             	lea    -0x29(%ebp),%edi
    buf[i++] = digits[x % base];
801005b0:	89 c8                	mov    %ecx,%eax
801005b2:	31 d2                	xor    %edx,%edx
801005b4:	89 ce                	mov    %ecx,%esi
801005b6:	f7 75 d4             	divl   -0x2c(%ebp)
801005b9:	0f b6 92 54 70 10 80 	movzbl -0x7fef8fac(%edx),%edx
801005c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
801005c3:	89 d8                	mov    %ebx,%eax
801005c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
801005c8:	8b 4d d0             	mov    -0x30(%ebp),%ecx
801005cb:	89 75 d0             	mov    %esi,-0x30(%ebp)
    buf[i++] = digits[x % base];
801005ce:	88 14 1f             	mov    %dl,(%edi,%ebx,1)
  }while((x /= base) != 0);
801005d1:	8b 75 d4             	mov    -0x2c(%ebp),%esi
801005d4:	39 75 d0             	cmp    %esi,-0x30(%ebp)
801005d7:	73 d7                	jae    801005b0 <printint+0x20>
801005d9:	8b 75 cc             	mov    -0x34(%ebp),%esi
  if(sign)
801005dc:	85 f6                	test   %esi,%esi
801005de:	74 0c                	je     801005ec <printint+0x5c>
    buf[i++] = '-';
801005e0:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
801005e5:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
801005e7:	ba 2d 00 00 00       	mov    $0x2d,%edx
  while(--i >= 0)
801005ec:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
801005f0:	0f be c2             	movsbl %dl,%eax
  if(panicked){
801005f3:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801005f9:	85 d2                	test   %edx,%edx
801005fb:	74 03                	je     80100600 <printint+0x70>
  asm volatile("cli");
801005fd:	fa                   	cli    
    for(;;)
801005fe:	eb fe                	jmp    801005fe <printint+0x6e>
80100600:	e8 fb fd ff ff       	call   80100400 <consputc.part.0>
  while(--i >= 0)
80100605:	39 fb                	cmp    %edi,%ebx
80100607:	74 10                	je     80100619 <printint+0x89>
80100609:	0f be 03             	movsbl (%ebx),%eax
8010060c:	83 eb 01             	sub    $0x1,%ebx
8010060f:	eb e2                	jmp    801005f3 <printint+0x63>
    x = -xx;
80100611:	f7 d8                	neg    %eax
80100613:	89 ce                	mov    %ecx,%esi
80100615:	89 c1                	mov    %eax,%ecx
80100617:	eb 8f                	jmp    801005a8 <printint+0x18>
}
80100619:	83 c4 2c             	add    $0x2c,%esp
8010061c:	5b                   	pop    %ebx
8010061d:	5e                   	pop    %esi
8010061e:	5f                   	pop    %edi
8010061f:	5d                   	pop    %ebp
80100620:	c3                   	ret    
80100621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100628:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010062f:	90                   	nop

80100630 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100630:	f3 0f 1e fb          	endbr32 
80100634:	55                   	push   %ebp
80100635:	89 e5                	mov    %esp,%ebp
80100637:	57                   	push   %edi
80100638:	56                   	push   %esi
80100639:	53                   	push   %ebx
8010063a:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
8010063d:	ff 75 08             	pushl  0x8(%ebp)
{
80100640:	8b 5d 10             	mov    0x10(%ebp),%ebx
  iunlock(ip);
80100643:	e8 d8 11 00 00       	call   80101820 <iunlock>
  acquire(&cons.lock);
80100648:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010064f:	e8 ec 3c 00 00       	call   80104340 <acquire>
  for(i = 0; i < n; i++)
80100654:	83 c4 10             	add    $0x10,%esp
80100657:	85 db                	test   %ebx,%ebx
80100659:	7e 24                	jle    8010067f <consolewrite+0x4f>
8010065b:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010065e:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
  if(panicked){
80100661:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
80100667:	85 d2                	test   %edx,%edx
80100669:	74 05                	je     80100670 <consolewrite+0x40>
8010066b:	fa                   	cli    
    for(;;)
8010066c:	eb fe                	jmp    8010066c <consolewrite+0x3c>
8010066e:	66 90                	xchg   %ax,%ax
    consputc(buf[i] & 0xff);
80100670:	0f b6 07             	movzbl (%edi),%eax
80100673:	83 c7 01             	add    $0x1,%edi
80100676:	e8 85 fd ff ff       	call   80100400 <consputc.part.0>
  for(i = 0; i < n; i++)
8010067b:	39 fe                	cmp    %edi,%esi
8010067d:	75 e2                	jne    80100661 <consolewrite+0x31>
  release(&cons.lock);
8010067f:	83 ec 0c             	sub    $0xc,%esp
80100682:	68 20 a5 10 80       	push   $0x8010a520
80100687:	e8 94 3e 00 00       	call   80104520 <release>
  ilock(ip);
8010068c:	58                   	pop    %eax
8010068d:	ff 75 08             	pushl  0x8(%ebp)
80100690:	e8 7b 10 00 00       	call   80101710 <ilock>

  return n;
}
80100695:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100698:	89 d8                	mov    %ebx,%eax
8010069a:	5b                   	pop    %ebx
8010069b:	5e                   	pop    %esi
8010069c:	5f                   	pop    %edi
8010069d:	5d                   	pop    %ebp
8010069e:	c3                   	ret    
8010069f:	90                   	nop

801006a0 <cprintf>:
{
801006a0:	f3 0f 1e fb          	endbr32 
801006a4:	55                   	push   %ebp
801006a5:	89 e5                	mov    %esp,%ebp
801006a7:	57                   	push   %edi
801006a8:	56                   	push   %esi
801006a9:	53                   	push   %ebx
801006aa:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
801006ad:	a1 54 a5 10 80       	mov    0x8010a554,%eax
801006b2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
801006b5:	85 c0                	test   %eax,%eax
801006b7:	0f 85 e8 00 00 00    	jne    801007a5 <cprintf+0x105>
  if (fmt == 0)
801006bd:	8b 45 08             	mov    0x8(%ebp),%eax
801006c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006c3:	85 c0                	test   %eax,%eax
801006c5:	0f 84 5a 01 00 00    	je     80100825 <cprintf+0x185>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006cb:	0f b6 00             	movzbl (%eax),%eax
801006ce:	85 c0                	test   %eax,%eax
801006d0:	74 36                	je     80100708 <cprintf+0x68>
  argp = (uint*)(void*)(&fmt + 1);
801006d2:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006d5:	31 f6                	xor    %esi,%esi
    if(c != '%'){
801006d7:	83 f8 25             	cmp    $0x25,%eax
801006da:	74 44                	je     80100720 <cprintf+0x80>
  if(panicked){
801006dc:	8b 0d 58 a5 10 80    	mov    0x8010a558,%ecx
801006e2:	85 c9                	test   %ecx,%ecx
801006e4:	74 0f                	je     801006f5 <cprintf+0x55>
801006e6:	fa                   	cli    
    for(;;)
801006e7:	eb fe                	jmp    801006e7 <cprintf+0x47>
801006e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801006f0:	b8 25 00 00 00       	mov    $0x25,%eax
801006f5:	e8 06 fd ff ff       	call   80100400 <consputc.part.0>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006fd:	83 c6 01             	add    $0x1,%esi
80100700:	0f b6 04 30          	movzbl (%eax,%esi,1),%eax
80100704:	85 c0                	test   %eax,%eax
80100706:	75 cf                	jne    801006d7 <cprintf+0x37>
  if(locking)
80100708:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010070b:	85 c0                	test   %eax,%eax
8010070d:	0f 85 fd 00 00 00    	jne    80100810 <cprintf+0x170>
}
80100713:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100716:	5b                   	pop    %ebx
80100717:	5e                   	pop    %esi
80100718:	5f                   	pop    %edi
80100719:	5d                   	pop    %ebp
8010071a:	c3                   	ret    
8010071b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010071f:	90                   	nop
    c = fmt[++i] & 0xff;
80100720:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100723:	83 c6 01             	add    $0x1,%esi
80100726:	0f b6 3c 30          	movzbl (%eax,%esi,1),%edi
    if(c == 0)
8010072a:	85 ff                	test   %edi,%edi
8010072c:	74 da                	je     80100708 <cprintf+0x68>
    switch(c){
8010072e:	83 ff 70             	cmp    $0x70,%edi
80100731:	74 5a                	je     8010078d <cprintf+0xed>
80100733:	7f 2a                	jg     8010075f <cprintf+0xbf>
80100735:	83 ff 25             	cmp    $0x25,%edi
80100738:	0f 84 92 00 00 00    	je     801007d0 <cprintf+0x130>
8010073e:	83 ff 64             	cmp    $0x64,%edi
80100741:	0f 85 a1 00 00 00    	jne    801007e8 <cprintf+0x148>
      printint(*argp++, 10, 1);
80100747:	8b 03                	mov    (%ebx),%eax
80100749:	8d 7b 04             	lea    0x4(%ebx),%edi
8010074c:	b9 01 00 00 00       	mov    $0x1,%ecx
80100751:	ba 0a 00 00 00       	mov    $0xa,%edx
80100756:	89 fb                	mov    %edi,%ebx
80100758:	e8 33 fe ff ff       	call   80100590 <printint>
      break;
8010075d:	eb 9b                	jmp    801006fa <cprintf+0x5a>
    switch(c){
8010075f:	83 ff 73             	cmp    $0x73,%edi
80100762:	75 24                	jne    80100788 <cprintf+0xe8>
      if((s = (char*)*argp++) == 0)
80100764:	8d 7b 04             	lea    0x4(%ebx),%edi
80100767:	8b 1b                	mov    (%ebx),%ebx
80100769:	85 db                	test   %ebx,%ebx
8010076b:	75 55                	jne    801007c2 <cprintf+0x122>
        s = "(null)";
8010076d:	bb 39 70 10 80       	mov    $0x80107039,%ebx
      for(; *s; s++)
80100772:	b8 28 00 00 00       	mov    $0x28,%eax
  if(panicked){
80100777:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
8010077d:	85 d2                	test   %edx,%edx
8010077f:	74 39                	je     801007ba <cprintf+0x11a>
80100781:	fa                   	cli    
    for(;;)
80100782:	eb fe                	jmp    80100782 <cprintf+0xe2>
80100784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    switch(c){
80100788:	83 ff 78             	cmp    $0x78,%edi
8010078b:	75 5b                	jne    801007e8 <cprintf+0x148>
      printint(*argp++, 16, 0);
8010078d:	8b 03                	mov    (%ebx),%eax
8010078f:	8d 7b 04             	lea    0x4(%ebx),%edi
80100792:	31 c9                	xor    %ecx,%ecx
80100794:	ba 10 00 00 00       	mov    $0x10,%edx
80100799:	89 fb                	mov    %edi,%ebx
8010079b:	e8 f0 fd ff ff       	call   80100590 <printint>
      break;
801007a0:	e9 55 ff ff ff       	jmp    801006fa <cprintf+0x5a>
    acquire(&cons.lock);
801007a5:	83 ec 0c             	sub    $0xc,%esp
801007a8:	68 20 a5 10 80       	push   $0x8010a520
801007ad:	e8 8e 3b 00 00       	call   80104340 <acquire>
801007b2:	83 c4 10             	add    $0x10,%esp
801007b5:	e9 03 ff ff ff       	jmp    801006bd <cprintf+0x1d>
801007ba:	e8 41 fc ff ff       	call   80100400 <consputc.part.0>
      for(; *s; s++)
801007bf:	83 c3 01             	add    $0x1,%ebx
801007c2:	0f be 03             	movsbl (%ebx),%eax
801007c5:	84 c0                	test   %al,%al
801007c7:	75 ae                	jne    80100777 <cprintf+0xd7>
      if((s = (char*)*argp++) == 0)
801007c9:	89 fb                	mov    %edi,%ebx
801007cb:	e9 2a ff ff ff       	jmp    801006fa <cprintf+0x5a>
  if(panicked){
801007d0:	8b 3d 58 a5 10 80    	mov    0x8010a558,%edi
801007d6:	85 ff                	test   %edi,%edi
801007d8:	0f 84 12 ff ff ff    	je     801006f0 <cprintf+0x50>
801007de:	fa                   	cli    
    for(;;)
801007df:	eb fe                	jmp    801007df <cprintf+0x13f>
801007e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(panicked){
801007e8:	8b 0d 58 a5 10 80    	mov    0x8010a558,%ecx
801007ee:	85 c9                	test   %ecx,%ecx
801007f0:	74 06                	je     801007f8 <cprintf+0x158>
801007f2:	fa                   	cli    
    for(;;)
801007f3:	eb fe                	jmp    801007f3 <cprintf+0x153>
801007f5:	8d 76 00             	lea    0x0(%esi),%esi
801007f8:	b8 25 00 00 00       	mov    $0x25,%eax
801007fd:	e8 fe fb ff ff       	call   80100400 <consputc.part.0>
  if(panicked){
80100802:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
80100808:	85 d2                	test   %edx,%edx
8010080a:	74 2c                	je     80100838 <cprintf+0x198>
8010080c:	fa                   	cli    
    for(;;)
8010080d:	eb fe                	jmp    8010080d <cprintf+0x16d>
8010080f:	90                   	nop
    release(&cons.lock);
80100810:	83 ec 0c             	sub    $0xc,%esp
80100813:	68 20 a5 10 80       	push   $0x8010a520
80100818:	e8 03 3d 00 00       	call   80104520 <release>
8010081d:	83 c4 10             	add    $0x10,%esp
}
80100820:	e9 ee fe ff ff       	jmp    80100713 <cprintf+0x73>
    panic("null fmt");
80100825:	83 ec 0c             	sub    $0xc,%esp
80100828:	68 40 70 10 80       	push   $0x80107040
8010082d:	e8 4e fb ff ff       	call   80100380 <panic>
80100832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100838:	89 f8                	mov    %edi,%eax
8010083a:	e8 c1 fb ff ff       	call   80100400 <consputc.part.0>
8010083f:	e9 b6 fe ff ff       	jmp    801006fa <cprintf+0x5a>
80100844:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010084b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010084f:	90                   	nop

80100850 <consoleintr>:
{
80100850:	f3 0f 1e fb          	endbr32 
80100854:	55                   	push   %ebp
80100855:	89 e5                	mov    %esp,%ebp
80100857:	57                   	push   %edi
80100858:	56                   	push   %esi
  int c, doprocdump = 0;
80100859:	31 f6                	xor    %esi,%esi
{
8010085b:	53                   	push   %ebx
8010085c:	83 ec 18             	sub    $0x18,%esp
8010085f:	8b 7d 08             	mov    0x8(%ebp),%edi
  acquire(&cons.lock);
80100862:	68 20 a5 10 80       	push   $0x8010a520
80100867:	e8 d4 3a 00 00       	call   80104340 <acquire>
  while((c = getc()) >= 0){
8010086c:	83 c4 10             	add    $0x10,%esp
8010086f:	eb 17                	jmp    80100888 <consoleintr+0x38>
    switch(c){
80100871:	83 fb 08             	cmp    $0x8,%ebx
80100874:	0f 84 f6 00 00 00    	je     80100970 <consoleintr+0x120>
8010087a:	83 fb 10             	cmp    $0x10,%ebx
8010087d:	0f 85 15 01 00 00    	jne    80100998 <consoleintr+0x148>
80100883:	be 01 00 00 00       	mov    $0x1,%esi
  while((c = getc()) >= 0){
80100888:	ff d7                	call   *%edi
8010088a:	89 c3                	mov    %eax,%ebx
8010088c:	85 c0                	test   %eax,%eax
8010088e:	0f 88 23 01 00 00    	js     801009b7 <consoleintr+0x167>
    switch(c){
80100894:	83 fb 15             	cmp    $0x15,%ebx
80100897:	74 77                	je     80100910 <consoleintr+0xc0>
80100899:	7e d6                	jle    80100871 <consoleintr+0x21>
8010089b:	83 fb 7f             	cmp    $0x7f,%ebx
8010089e:	0f 84 cc 00 00 00    	je     80100970 <consoleintr+0x120>
      if(c != 0 && input.e-input.r < INPUT_BUF){
801008a4:	a1 88 f7 10 80       	mov    0x8010f788,%eax
801008a9:	89 c2                	mov    %eax,%edx
801008ab:	2b 15 80 f7 10 80    	sub    0x8010f780,%edx
801008b1:	83 fa 7f             	cmp    $0x7f,%edx
801008b4:	77 d2                	ja     80100888 <consoleintr+0x38>
        c = (c == '\r') ? '\n' : c;
801008b6:	8d 48 01             	lea    0x1(%eax),%ecx
801008b9:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801008bf:	83 e0 7f             	and    $0x7f,%eax
        input.buf[input.e++ % INPUT_BUF] = c;
801008c2:	89 0d 88 f7 10 80    	mov    %ecx,0x8010f788
        c = (c == '\r') ? '\n' : c;
801008c8:	83 fb 0d             	cmp    $0xd,%ebx
801008cb:	0f 84 02 01 00 00    	je     801009d3 <consoleintr+0x183>
        input.buf[input.e++ % INPUT_BUF] = c;
801008d1:	88 98 00 f7 10 80    	mov    %bl,-0x7fef0900(%eax)
  if(panicked){
801008d7:	85 d2                	test   %edx,%edx
801008d9:	0f 85 ff 00 00 00    	jne    801009de <consoleintr+0x18e>
801008df:	89 d8                	mov    %ebx,%eax
801008e1:	e8 1a fb ff ff       	call   80100400 <consputc.part.0>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008e6:	83 fb 0a             	cmp    $0xa,%ebx
801008e9:	0f 84 0f 01 00 00    	je     801009fe <consoleintr+0x1ae>
801008ef:	83 fb 04             	cmp    $0x4,%ebx
801008f2:	0f 84 06 01 00 00    	je     801009fe <consoleintr+0x1ae>
801008f8:	a1 80 f7 10 80       	mov    0x8010f780,%eax
801008fd:	83 e8 80             	sub    $0xffffff80,%eax
80100900:	39 05 88 f7 10 80    	cmp    %eax,0x8010f788
80100906:	75 80                	jne    80100888 <consoleintr+0x38>
80100908:	e9 f6 00 00 00       	jmp    80100a03 <consoleintr+0x1b3>
8010090d:	8d 76 00             	lea    0x0(%esi),%esi
      while(input.e != input.w &&
80100910:	a1 88 f7 10 80       	mov    0x8010f788,%eax
80100915:	39 05 84 f7 10 80    	cmp    %eax,0x8010f784
8010091b:	0f 84 67 ff ff ff    	je     80100888 <consoleintr+0x38>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100921:	83 e8 01             	sub    $0x1,%eax
80100924:	89 c2                	mov    %eax,%edx
80100926:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100929:	80 ba 00 f7 10 80 0a 	cmpb   $0xa,-0x7fef0900(%edx)
80100930:	0f 84 52 ff ff ff    	je     80100888 <consoleintr+0x38>
  if(panicked){
80100936:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
        input.e--;
8010093c:	a3 88 f7 10 80       	mov    %eax,0x8010f788
  if(panicked){
80100941:	85 d2                	test   %edx,%edx
80100943:	74 0b                	je     80100950 <consoleintr+0x100>
80100945:	fa                   	cli    
    for(;;)
80100946:	eb fe                	jmp    80100946 <consoleintr+0xf6>
80100948:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010094f:	90                   	nop
80100950:	b8 00 01 00 00       	mov    $0x100,%eax
80100955:	e8 a6 fa ff ff       	call   80100400 <consputc.part.0>
      while(input.e != input.w &&
8010095a:	a1 88 f7 10 80       	mov    0x8010f788,%eax
8010095f:	3b 05 84 f7 10 80    	cmp    0x8010f784,%eax
80100965:	75 ba                	jne    80100921 <consoleintr+0xd1>
80100967:	e9 1c ff ff ff       	jmp    80100888 <consoleintr+0x38>
8010096c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(input.e != input.w){
80100970:	a1 88 f7 10 80       	mov    0x8010f788,%eax
80100975:	3b 05 84 f7 10 80    	cmp    0x8010f784,%eax
8010097b:	0f 84 07 ff ff ff    	je     80100888 <consoleintr+0x38>
        input.e--;
80100981:	83 e8 01             	sub    $0x1,%eax
80100984:	a3 88 f7 10 80       	mov    %eax,0x8010f788
  if(panicked){
80100989:	a1 58 a5 10 80       	mov    0x8010a558,%eax
8010098e:	85 c0                	test   %eax,%eax
80100990:	74 16                	je     801009a8 <consoleintr+0x158>
80100992:	fa                   	cli    
    for(;;)
80100993:	eb fe                	jmp    80100993 <consoleintr+0x143>
80100995:	8d 76 00             	lea    0x0(%esi),%esi
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100998:	85 db                	test   %ebx,%ebx
8010099a:	0f 84 e8 fe ff ff    	je     80100888 <consoleintr+0x38>
801009a0:	e9 ff fe ff ff       	jmp    801008a4 <consoleintr+0x54>
801009a5:	8d 76 00             	lea    0x0(%esi),%esi
801009a8:	b8 00 01 00 00       	mov    $0x100,%eax
801009ad:	e8 4e fa ff ff       	call   80100400 <consputc.part.0>
801009b2:	e9 d1 fe ff ff       	jmp    80100888 <consoleintr+0x38>
  release(&cons.lock);
801009b7:	83 ec 0c             	sub    $0xc,%esp
801009ba:	68 20 a5 10 80       	push   $0x8010a520
801009bf:	e8 5c 3b 00 00       	call   80104520 <release>
  if(doprocdump) {
801009c4:	83 c4 10             	add    $0x10,%esp
801009c7:	85 f6                	test   %esi,%esi
801009c9:	75 1d                	jne    801009e8 <consoleintr+0x198>
}
801009cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009ce:	5b                   	pop    %ebx
801009cf:	5e                   	pop    %esi
801009d0:	5f                   	pop    %edi
801009d1:	5d                   	pop    %ebp
801009d2:	c3                   	ret    
        input.buf[input.e++ % INPUT_BUF] = c;
801009d3:	c6 80 00 f7 10 80 0a 	movb   $0xa,-0x7fef0900(%eax)
  if(panicked){
801009da:	85 d2                	test   %edx,%edx
801009dc:	74 16                	je     801009f4 <consoleintr+0x1a4>
801009de:	fa                   	cli    
    for(;;)
801009df:	eb fe                	jmp    801009df <consoleintr+0x18f>
801009e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
801009e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009eb:	5b                   	pop    %ebx
801009ec:	5e                   	pop    %esi
801009ed:	5f                   	pop    %edi
801009ee:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
801009ef:	e9 5c 38 00 00       	jmp    80104250 <procdump>
801009f4:	b8 0a 00 00 00       	mov    $0xa,%eax
801009f9:	e8 02 fa ff ff       	call   80100400 <consputc.part.0>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801009fe:	a1 88 f7 10 80       	mov    0x8010f788,%eax
          wakeup(&input.r);
80100a03:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
80100a06:	a3 84 f7 10 80       	mov    %eax,0x8010f784
          wakeup(&input.r);
80100a0b:	68 80 f7 10 80       	push   $0x8010f780
80100a10:	e8 4b 37 00 00       	call   80104160 <wakeup>
80100a15:	83 c4 10             	add    $0x10,%esp
80100a18:	e9 6b fe ff ff       	jmp    80100888 <consoleintr+0x38>
80100a1d:	8d 76 00             	lea    0x0(%esi),%esi

80100a20 <consoleinit>:

void
consoleinit(void)
{
80100a20:	f3 0f 1e fb          	endbr32 
80100a24:	55                   	push   %ebp
80100a25:	89 e5                	mov    %esp,%ebp
80100a27:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
80100a2a:	68 49 70 10 80       	push   $0x80107049
80100a2f:	68 20 a5 10 80       	push   $0x8010a520
80100a34:	e8 e7 38 00 00       	call   80104320 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
80100a39:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  devsw[CONSOLE].write = consolewrite;
80100a40:	c7 05 4c 01 11 80 30 	movl   $0x80100630,0x8011014c
80100a47:	06 10 80 
  devsw[CONSOLE].read = consoleread;
80100a4a:	c7 05 48 01 11 80 80 	movl   $0x80100280,0x80110148
80100a51:	02 10 80 
  cons.locking = 1;
80100a54:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
80100a5b:	00 00 00 
  picenable(IRQ_KBD);
80100a5e:	e8 2d 2a 00 00       	call   80103490 <picenable>
  ioapicenable(IRQ_KBD, 0);
80100a63:	58                   	pop    %eax
80100a64:	5a                   	pop    %edx
80100a65:	6a 00                	push   $0x0
80100a67:	6a 01                	push   $0x1
80100a69:	e8 c2 19 00 00       	call   80102430 <ioapicenable>
}
80100a6e:	83 c4 10             	add    $0x10,%esp
80100a71:	c9                   	leave  
80100a72:	c3                   	ret    
80100a73:	66 90                	xchg   %ax,%ax
80100a75:	66 90                	xchg   %ax,%ax
80100a77:	66 90                	xchg   %ax,%ax
80100a79:	66 90                	xchg   %ax,%ax
80100a7b:	66 90                	xchg   %ax,%ax
80100a7d:	66 90                	xchg   %ax,%ax
80100a7f:	90                   	nop

80100a80 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100a80:	f3 0f 1e fb          	endbr32 
80100a84:	55                   	push   %ebp
80100a85:	89 e5                	mov    %esp,%ebp
80100a87:	57                   	push   %edi
80100a88:	56                   	push   %esi
80100a89:	53                   	push   %ebx
80100a8a:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  begin_op();
80100a90:	e8 2b 23 00 00       	call   80102dc0 <begin_op>
  if((ip = namei(path)) == 0){
80100a95:	83 ec 0c             	sub    $0xc,%esp
80100a98:	ff 75 08             	pushl  0x8(%ebp)
80100a9b:	e8 80 15 00 00       	call   80102020 <namei>
80100aa0:	83 c4 10             	add    $0x10,%esp
80100aa3:	85 c0                	test   %eax,%eax
80100aa5:	0f 84 ff 02 00 00    	je     80100daa <exec+0x32a>
    end_op();
    return -1;
  }
  ilock(ip);
80100aab:	83 ec 0c             	sub    $0xc,%esp
80100aae:	89 c3                	mov    %eax,%ebx
80100ab0:	50                   	push   %eax
80100ab1:	e8 5a 0c 00 00       	call   80101710 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
80100ab6:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100abc:	6a 34                	push   $0x34
80100abe:	6a 00                	push   $0x0
80100ac0:	50                   	push   %eax
80100ac1:	53                   	push   %ebx
80100ac2:	e8 89 0f 00 00       	call   80101a50 <readi>
80100ac7:	83 c4 20             	add    $0x20,%esp
80100aca:	83 f8 33             	cmp    $0x33,%eax
80100acd:	76 0c                	jbe    80100adb <exec+0x5b>
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100acf:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100ad6:	45 4c 46 
80100ad9:	74 25                	je     80100b00 <exec+0x80>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100adb:	83 ec 0c             	sub    $0xc,%esp
80100ade:	53                   	push   %ebx
80100adf:	e8 0c 0f 00 00       	call   801019f0 <iunlockput>
    end_op();
80100ae4:	e8 47 23 00 00       	call   80102e30 <end_op>
80100ae9:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100aec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100af1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100af4:	5b                   	pop    %ebx
80100af5:	5e                   	pop    %esi
80100af6:	5f                   	pop    %edi
80100af7:	5d                   	pop    %ebp
80100af8:	c3                   	ret    
80100af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((pgdir = setupkvm()) == 0)
80100b00:	e8 5b 5e 00 00       	call   80106960 <setupkvm>
80100b05:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100b0b:	85 c0                	test   %eax,%eax
80100b0d:	74 cc                	je     80100adb <exec+0x5b>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b0f:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100b16:	00 
80100b17:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100b1d:	0f 84 96 02 00 00    	je     80100db9 <exec+0x339>
  sz = 0;
80100b23:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100b2a:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b2d:	31 ff                	xor    %edi,%edi
80100b2f:	e9 8a 00 00 00       	jmp    80100bbe <exec+0x13e>
80100b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ph.type != ELF_PROG_LOAD)
80100b38:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b3f:	75 6c                	jne    80100bad <exec+0x12d>
    if(ph.memsz < ph.filesz)
80100b41:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b47:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b4d:	0f 82 87 00 00 00    	jb     80100bda <exec+0x15a>
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100b53:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b59:	72 7f                	jb     80100bda <exec+0x15a>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100b5b:	83 ec 04             	sub    $0x4,%esp
80100b5e:	50                   	push   %eax
80100b5f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b65:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b6b:	e8 a0 60 00 00       	call   80106c10 <allocuvm>
80100b70:	83 c4 10             	add    $0x10,%esp
80100b73:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b79:	85 c0                	test   %eax,%eax
80100b7b:	74 5d                	je     80100bda <exec+0x15a>
    if(ph.vaddr % PGSIZE != 0)
80100b7d:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b83:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b88:	75 50                	jne    80100bda <exec+0x15a>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b8a:	83 ec 0c             	sub    $0xc,%esp
80100b8d:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b93:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b99:	53                   	push   %ebx
80100b9a:	50                   	push   %eax
80100b9b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ba1:	e8 9a 5f 00 00       	call   80106b40 <loaduvm>
80100ba6:	83 c4 20             	add    $0x20,%esp
80100ba9:	85 c0                	test   %eax,%eax
80100bab:	78 2d                	js     80100bda <exec+0x15a>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100bad:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100bb4:	83 c7 01             	add    $0x1,%edi
80100bb7:	83 c6 20             	add    $0x20,%esi
80100bba:	39 f8                	cmp    %edi,%eax
80100bbc:	7e 32                	jle    80100bf0 <exec+0x170>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100bbe:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100bc4:	6a 20                	push   $0x20
80100bc6:	56                   	push   %esi
80100bc7:	50                   	push   %eax
80100bc8:	53                   	push   %ebx
80100bc9:	e8 82 0e 00 00       	call   80101a50 <readi>
80100bce:	83 c4 10             	add    $0x10,%esp
80100bd1:	83 f8 20             	cmp    $0x20,%eax
80100bd4:	0f 84 5e ff ff ff    	je     80100b38 <exec+0xb8>
    freevm(pgdir);
80100bda:	83 ec 0c             	sub    $0xc,%esp
80100bdd:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100be3:	e8 88 61 00 00       	call   80106d70 <freevm>
  if(ip){
80100be8:	83 c4 10             	add    $0x10,%esp
80100beb:	e9 eb fe ff ff       	jmp    80100adb <exec+0x5b>
80100bf0:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100bf6:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100bfc:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100c02:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
  iunlockput(ip);
80100c08:	83 ec 0c             	sub    $0xc,%esp
80100c0b:	53                   	push   %ebx
80100c0c:	e8 df 0d 00 00       	call   801019f0 <iunlockput>
  end_op();
80100c11:	e8 1a 22 00 00       	call   80102e30 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c16:	83 c4 0c             	add    $0xc,%esp
80100c19:	56                   	push   %esi
80100c1a:	57                   	push   %edi
80100c1b:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100c21:	57                   	push   %edi
80100c22:	e8 e9 5f 00 00       	call   80106c10 <allocuvm>
80100c27:	83 c4 10             	add    $0x10,%esp
80100c2a:	89 c6                	mov    %eax,%esi
80100c2c:	85 c0                	test   %eax,%eax
80100c2e:	0f 84 94 00 00 00    	je     80100cc8 <exec+0x248>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c34:	83 ec 08             	sub    $0x8,%esp
80100c37:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
  for(argc = 0; argv[argc]; argc++) {
80100c3d:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c3f:	50                   	push   %eax
80100c40:	57                   	push   %edi
  for(argc = 0; argv[argc]; argc++) {
80100c41:	31 ff                	xor    %edi,%edi
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c43:	e8 a8 61 00 00       	call   80106df0 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100c48:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c4b:	83 c4 10             	add    $0x10,%esp
80100c4e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c54:	8b 00                	mov    (%eax),%eax
80100c56:	85 c0                	test   %eax,%eax
80100c58:	0f 84 8b 00 00 00    	je     80100ce9 <exec+0x269>
80100c5e:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100c64:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100c6a:	eb 23                	jmp    80100c8f <exec+0x20f>
80100c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100c70:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100c73:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100c7a:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100c7d:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100c83:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c86:	85 c0                	test   %eax,%eax
80100c88:	74 59                	je     80100ce3 <exec+0x263>
    if(argc >= MAXARG)
80100c8a:	83 ff 20             	cmp    $0x20,%edi
80100c8d:	74 39                	je     80100cc8 <exec+0x248>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c8f:	83 ec 0c             	sub    $0xc,%esp
80100c92:	50                   	push   %eax
80100c93:	e8 d8 3a 00 00       	call   80104770 <strlen>
80100c98:	f7 d0                	not    %eax
80100c9a:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c9c:	58                   	pop    %eax
80100c9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100ca0:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100ca3:	ff 34 b8             	pushl  (%eax,%edi,4)
80100ca6:	e8 c5 3a 00 00       	call   80104770 <strlen>
80100cab:	83 c0 01             	add    $0x1,%eax
80100cae:	50                   	push   %eax
80100caf:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cb2:	ff 34 b8             	pushl  (%eax,%edi,4)
80100cb5:	53                   	push   %ebx
80100cb6:	56                   	push   %esi
80100cb7:	e8 84 62 00 00       	call   80106f40 <copyout>
80100cbc:	83 c4 20             	add    $0x20,%esp
80100cbf:	85 c0                	test   %eax,%eax
80100cc1:	79 ad                	jns    80100c70 <exec+0x1f0>
80100cc3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100cc7:	90                   	nop
    freevm(pgdir);
80100cc8:	83 ec 0c             	sub    $0xc,%esp
80100ccb:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100cd1:	e8 9a 60 00 00       	call   80106d70 <freevm>
80100cd6:	83 c4 10             	add    $0x10,%esp
  return -1;
80100cd9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100cde:	e9 0e fe ff ff       	jmp    80100af1 <exec+0x71>
80100ce3:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ce9:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100cf0:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100cf2:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100cf9:	00 00 00 00 
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cfd:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100cff:	83 c0 0c             	add    $0xc,%eax
  ustack[1] = argc;
80100d02:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  sp -= (3+argc+1) * 4;
80100d08:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d0a:	50                   	push   %eax
80100d0b:	52                   	push   %edx
80100d0c:	53                   	push   %ebx
80100d0d:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
  ustack[0] = 0xffffffff;  // fake return PC
80100d13:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100d1a:	ff ff ff 
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d1d:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d23:	e8 18 62 00 00       	call   80106f40 <copyout>
80100d28:	83 c4 10             	add    $0x10,%esp
80100d2b:	85 c0                	test   %eax,%eax
80100d2d:	78 99                	js     80100cc8 <exec+0x248>
  for(last=s=path; *s; s++)
80100d2f:	8b 45 08             	mov    0x8(%ebp),%eax
80100d32:	8b 55 08             	mov    0x8(%ebp),%edx
80100d35:	0f b6 00             	movzbl (%eax),%eax
80100d38:	84 c0                	test   %al,%al
80100d3a:	74 13                	je     80100d4f <exec+0x2cf>
80100d3c:	89 d1                	mov    %edx,%ecx
80100d3e:	66 90                	xchg   %ax,%ax
    if(*s == '/')
80100d40:	83 c1 01             	add    $0x1,%ecx
80100d43:	3c 2f                	cmp    $0x2f,%al
  for(last=s=path; *s; s++)
80100d45:	0f b6 01             	movzbl (%ecx),%eax
    if(*s == '/')
80100d48:	0f 44 d1             	cmove  %ecx,%edx
  for(last=s=path; *s; s++)
80100d4b:	84 c0                	test   %al,%al
80100d4d:	75 f1                	jne    80100d40 <exec+0x2c0>
  safestrcpy(proc->name, last, sizeof(proc->name));
80100d4f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100d55:	83 ec 04             	sub    $0x4,%esp
80100d58:	6a 10                	push   $0x10
80100d5a:	83 c0 6c             	add    $0x6c,%eax
80100d5d:	52                   	push   %edx
80100d5e:	50                   	push   %eax
80100d5f:	e8 cc 39 00 00       	call   80104730 <safestrcpy>
  oldpgdir = proc->pgdir;
80100d64:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  proc->pgdir = pgdir;
80100d6a:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
  oldpgdir = proc->pgdir;
80100d70:	8b 78 04             	mov    0x4(%eax),%edi
  proc->sz = sz;
80100d73:	89 30                	mov    %esi,(%eax)
  proc->pgdir = pgdir;
80100d75:	89 48 04             	mov    %ecx,0x4(%eax)
  proc->tf->eip = elf.entry;  // main
80100d78:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100d7e:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100d84:	8b 50 18             	mov    0x18(%eax),%edx
80100d87:	89 4a 38             	mov    %ecx,0x38(%edx)
  proc->tf->esp = sp;
80100d8a:	8b 50 18             	mov    0x18(%eax),%edx
80100d8d:	89 5a 44             	mov    %ebx,0x44(%edx)
  switchuvm(proc);
80100d90:	89 04 24             	mov    %eax,(%esp)
80100d93:	e8 78 5c 00 00       	call   80106a10 <switchuvm>
  freevm(oldpgdir);
80100d98:	89 3c 24             	mov    %edi,(%esp)
80100d9b:	e8 d0 5f 00 00       	call   80106d70 <freevm>
  return 0;
80100da0:	83 c4 10             	add    $0x10,%esp
80100da3:	31 c0                	xor    %eax,%eax
80100da5:	e9 47 fd ff ff       	jmp    80100af1 <exec+0x71>
    end_op();
80100daa:	e8 81 20 00 00       	call   80102e30 <end_op>
    return -1;
80100daf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100db4:	e9 38 fd ff ff       	jmp    80100af1 <exec+0x71>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100db9:	31 ff                	xor    %edi,%edi
80100dbb:	be 00 20 00 00       	mov    $0x2000,%esi
80100dc0:	e9 43 fe ff ff       	jmp    80100c08 <exec+0x188>
80100dc5:	66 90                	xchg   %ax,%ax
80100dc7:	66 90                	xchg   %ax,%ax
80100dc9:	66 90                	xchg   %ax,%ax
80100dcb:	66 90                	xchg   %ax,%ax
80100dcd:	66 90                	xchg   %ax,%ax
80100dcf:	90                   	nop

80100dd0 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100dd0:	f3 0f 1e fb          	endbr32 
80100dd4:	55                   	push   %ebp
80100dd5:	89 e5                	mov    %esp,%ebp
80100dd7:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100dda:	68 65 70 10 80       	push   $0x80107065
80100ddf:	68 a0 f7 10 80       	push   $0x8010f7a0
80100de4:	e8 37 35 00 00       	call   80104320 <initlock>
}
80100de9:	83 c4 10             	add    $0x10,%esp
80100dec:	c9                   	leave  
80100ded:	c3                   	ret    
80100dee:	66 90                	xchg   %ax,%ax

80100df0 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100df0:	f3 0f 1e fb          	endbr32 
80100df4:	55                   	push   %ebp
80100df5:	89 e5                	mov    %esp,%ebp
80100df7:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100df8:	bb d4 f7 10 80       	mov    $0x8010f7d4,%ebx
{
80100dfd:	83 ec 10             	sub    $0x10,%esp
  acquire(&ftable.lock);
80100e00:	68 a0 f7 10 80       	push   $0x8010f7a0
80100e05:	e8 36 35 00 00       	call   80104340 <acquire>
80100e0a:	83 c4 10             	add    $0x10,%esp
80100e0d:	eb 0c                	jmp    80100e1b <filealloc+0x2b>
80100e0f:	90                   	nop
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100e10:	83 c3 18             	add    $0x18,%ebx
80100e13:	81 fb 34 01 11 80    	cmp    $0x80110134,%ebx
80100e19:	74 25                	je     80100e40 <filealloc+0x50>
    if(f->ref == 0){
80100e1b:	8b 43 04             	mov    0x4(%ebx),%eax
80100e1e:	85 c0                	test   %eax,%eax
80100e20:	75 ee                	jne    80100e10 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100e22:	83 ec 0c             	sub    $0xc,%esp
      f->ref = 1;
80100e25:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100e2c:	68 a0 f7 10 80       	push   $0x8010f7a0
80100e31:	e8 ea 36 00 00       	call   80104520 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100e36:	89 d8                	mov    %ebx,%eax
      return f;
80100e38:	83 c4 10             	add    $0x10,%esp
}
80100e3b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e3e:	c9                   	leave  
80100e3f:	c3                   	ret    
  release(&ftable.lock);
80100e40:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80100e43:	31 db                	xor    %ebx,%ebx
  release(&ftable.lock);
80100e45:	68 a0 f7 10 80       	push   $0x8010f7a0
80100e4a:	e8 d1 36 00 00       	call   80104520 <release>
}
80100e4f:	89 d8                	mov    %ebx,%eax
  return 0;
80100e51:	83 c4 10             	add    $0x10,%esp
}
80100e54:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e57:	c9                   	leave  
80100e58:	c3                   	ret    
80100e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100e60 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100e60:	f3 0f 1e fb          	endbr32 
80100e64:	55                   	push   %ebp
80100e65:	89 e5                	mov    %esp,%ebp
80100e67:	53                   	push   %ebx
80100e68:	83 ec 10             	sub    $0x10,%esp
80100e6b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100e6e:	68 a0 f7 10 80       	push   $0x8010f7a0
80100e73:	e8 c8 34 00 00       	call   80104340 <acquire>
  if(f->ref < 1)
80100e78:	8b 43 04             	mov    0x4(%ebx),%eax
80100e7b:	83 c4 10             	add    $0x10,%esp
80100e7e:	85 c0                	test   %eax,%eax
80100e80:	7e 1a                	jle    80100e9c <filedup+0x3c>
    panic("filedup");
  f->ref++;
80100e82:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100e85:	83 ec 0c             	sub    $0xc,%esp
  f->ref++;
80100e88:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e8b:	68 a0 f7 10 80       	push   $0x8010f7a0
80100e90:	e8 8b 36 00 00       	call   80104520 <release>
  return f;
}
80100e95:	89 d8                	mov    %ebx,%eax
80100e97:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e9a:	c9                   	leave  
80100e9b:	c3                   	ret    
    panic("filedup");
80100e9c:	83 ec 0c             	sub    $0xc,%esp
80100e9f:	68 6c 70 10 80       	push   $0x8010706c
80100ea4:	e8 d7 f4 ff ff       	call   80100380 <panic>
80100ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100eb0 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100eb0:	f3 0f 1e fb          	endbr32 
80100eb4:	55                   	push   %ebp
80100eb5:	89 e5                	mov    %esp,%ebp
80100eb7:	57                   	push   %edi
80100eb8:	56                   	push   %esi
80100eb9:	53                   	push   %ebx
80100eba:	83 ec 28             	sub    $0x28,%esp
80100ebd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct file ff;

  acquire(&ftable.lock);
80100ec0:	68 a0 f7 10 80       	push   $0x8010f7a0
80100ec5:	e8 76 34 00 00       	call   80104340 <acquire>
  if(f->ref < 1)
80100eca:	8b 53 04             	mov    0x4(%ebx),%edx
80100ecd:	83 c4 10             	add    $0x10,%esp
80100ed0:	85 d2                	test   %edx,%edx
80100ed2:	0f 8e a1 00 00 00    	jle    80100f79 <fileclose+0xc9>
    panic("fileclose");
  if(--f->ref > 0){
80100ed8:	83 ea 01             	sub    $0x1,%edx
80100edb:	89 53 04             	mov    %edx,0x4(%ebx)
80100ede:	75 40                	jne    80100f20 <fileclose+0x70>
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100ee0:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100ee4:	83 ec 0c             	sub    $0xc,%esp
  ff = *f;
80100ee7:	8b 3b                	mov    (%ebx),%edi
  f->type = FD_NONE;
80100ee9:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  ff = *f;
80100eef:	8b 73 0c             	mov    0xc(%ebx),%esi
80100ef2:	88 45 e7             	mov    %al,-0x19(%ebp)
80100ef5:	8b 43 10             	mov    0x10(%ebx),%eax
  release(&ftable.lock);
80100ef8:	68 a0 f7 10 80       	push   $0x8010f7a0
  ff = *f;
80100efd:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100f00:	e8 1b 36 00 00       	call   80104520 <release>

  if(ff.type == FD_PIPE)
80100f05:	83 c4 10             	add    $0x10,%esp
80100f08:	83 ff 01             	cmp    $0x1,%edi
80100f0b:	74 53                	je     80100f60 <fileclose+0xb0>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100f0d:	83 ff 02             	cmp    $0x2,%edi
80100f10:	74 26                	je     80100f38 <fileclose+0x88>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100f12:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f15:	5b                   	pop    %ebx
80100f16:	5e                   	pop    %esi
80100f17:	5f                   	pop    %edi
80100f18:	5d                   	pop    %ebp
80100f19:	c3                   	ret    
80100f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    release(&ftable.lock);
80100f20:	c7 45 08 a0 f7 10 80 	movl   $0x8010f7a0,0x8(%ebp)
}
80100f27:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f2a:	5b                   	pop    %ebx
80100f2b:	5e                   	pop    %esi
80100f2c:	5f                   	pop    %edi
80100f2d:	5d                   	pop    %ebp
    release(&ftable.lock);
80100f2e:	e9 ed 35 00 00       	jmp    80104520 <release>
80100f33:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f37:	90                   	nop
    begin_op();
80100f38:	e8 83 1e 00 00       	call   80102dc0 <begin_op>
    iput(ff.ip);
80100f3d:	83 ec 0c             	sub    $0xc,%esp
80100f40:	ff 75 e0             	pushl  -0x20(%ebp)
80100f43:	e8 38 09 00 00       	call   80101880 <iput>
    end_op();
80100f48:	83 c4 10             	add    $0x10,%esp
}
80100f4b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f4e:	5b                   	pop    %ebx
80100f4f:	5e                   	pop    %esi
80100f50:	5f                   	pop    %edi
80100f51:	5d                   	pop    %ebp
    end_op();
80100f52:	e9 d9 1e 00 00       	jmp    80102e30 <end_op>
80100f57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f5e:	66 90                	xchg   %ax,%ax
    pipeclose(ff.pipe, ff.writable);
80100f60:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100f64:	83 ec 08             	sub    $0x8,%esp
80100f67:	53                   	push   %ebx
80100f68:	56                   	push   %esi
80100f69:	e8 02 27 00 00       	call   80103670 <pipeclose>
80100f6e:	83 c4 10             	add    $0x10,%esp
}
80100f71:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f74:	5b                   	pop    %ebx
80100f75:	5e                   	pop    %esi
80100f76:	5f                   	pop    %edi
80100f77:	5d                   	pop    %ebp
80100f78:	c3                   	ret    
    panic("fileclose");
80100f79:	83 ec 0c             	sub    $0xc,%esp
80100f7c:	68 74 70 10 80       	push   $0x80107074
80100f81:	e8 fa f3 ff ff       	call   80100380 <panic>
80100f86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f8d:	8d 76 00             	lea    0x0(%esi),%esi

80100f90 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f90:	f3 0f 1e fb          	endbr32 
80100f94:	55                   	push   %ebp
80100f95:	89 e5                	mov    %esp,%ebp
80100f97:	53                   	push   %ebx
80100f98:	83 ec 04             	sub    $0x4,%esp
80100f9b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f9e:	83 3b 02             	cmpl   $0x2,(%ebx)
80100fa1:	75 2d                	jne    80100fd0 <filestat+0x40>
    ilock(f->ip);
80100fa3:	83 ec 0c             	sub    $0xc,%esp
80100fa6:	ff 73 10             	pushl  0x10(%ebx)
80100fa9:	e8 62 07 00 00       	call   80101710 <ilock>
    stati(f->ip, st);
80100fae:	58                   	pop    %eax
80100faf:	5a                   	pop    %edx
80100fb0:	ff 75 0c             	pushl  0xc(%ebp)
80100fb3:	ff 73 10             	pushl  0x10(%ebx)
80100fb6:	e8 65 0a 00 00       	call   80101a20 <stati>
    iunlock(f->ip);
80100fbb:	59                   	pop    %ecx
80100fbc:	ff 73 10             	pushl  0x10(%ebx)
80100fbf:	e8 5c 08 00 00       	call   80101820 <iunlock>
    return 0;
  }
  return -1;
}
80100fc4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
80100fc7:	83 c4 10             	add    $0x10,%esp
80100fca:	31 c0                	xor    %eax,%eax
}
80100fcc:	c9                   	leave  
80100fcd:	c3                   	ret    
80100fce:	66 90                	xchg   %ax,%ax
80100fd0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return -1;
80100fd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100fd8:	c9                   	leave  
80100fd9:	c3                   	ret    
80100fda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100fe0 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100fe0:	f3 0f 1e fb          	endbr32 
80100fe4:	55                   	push   %ebp
80100fe5:	89 e5                	mov    %esp,%ebp
80100fe7:	57                   	push   %edi
80100fe8:	56                   	push   %esi
80100fe9:	53                   	push   %ebx
80100fea:	83 ec 0c             	sub    $0xc,%esp
80100fed:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100ff0:	8b 75 0c             	mov    0xc(%ebp),%esi
80100ff3:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100ff6:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100ffa:	74 64                	je     80101060 <fileread+0x80>
    return -1;
  if(f->type == FD_PIPE)
80100ffc:	8b 03                	mov    (%ebx),%eax
80100ffe:	83 f8 01             	cmp    $0x1,%eax
80101001:	74 45                	je     80101048 <fileread+0x68>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80101003:	83 f8 02             	cmp    $0x2,%eax
80101006:	75 5f                	jne    80101067 <fileread+0x87>
    ilock(f->ip);
80101008:	83 ec 0c             	sub    $0xc,%esp
8010100b:	ff 73 10             	pushl  0x10(%ebx)
8010100e:	e8 fd 06 00 00       	call   80101710 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80101013:	57                   	push   %edi
80101014:	ff 73 14             	pushl  0x14(%ebx)
80101017:	56                   	push   %esi
80101018:	ff 73 10             	pushl  0x10(%ebx)
8010101b:	e8 30 0a 00 00       	call   80101a50 <readi>
80101020:	83 c4 20             	add    $0x20,%esp
80101023:	89 c6                	mov    %eax,%esi
80101025:	85 c0                	test   %eax,%eax
80101027:	7e 03                	jle    8010102c <fileread+0x4c>
      f->off += r;
80101029:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
8010102c:	83 ec 0c             	sub    $0xc,%esp
8010102f:	ff 73 10             	pushl  0x10(%ebx)
80101032:	e8 e9 07 00 00       	call   80101820 <iunlock>
    return r;
80101037:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
8010103a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010103d:	89 f0                	mov    %esi,%eax
8010103f:	5b                   	pop    %ebx
80101040:	5e                   	pop    %esi
80101041:	5f                   	pop    %edi
80101042:	5d                   	pop    %ebp
80101043:	c3                   	ret    
80101044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return piperead(f->pipe, addr, n);
80101048:	8b 43 0c             	mov    0xc(%ebx),%eax
8010104b:	89 45 08             	mov    %eax,0x8(%ebp)
}
8010104e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101051:	5b                   	pop    %ebx
80101052:	5e                   	pop    %esi
80101053:	5f                   	pop    %edi
80101054:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
80101055:	e9 b6 27 00 00       	jmp    80103810 <piperead>
8010105a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80101060:	be ff ff ff ff       	mov    $0xffffffff,%esi
80101065:	eb d3                	jmp    8010103a <fileread+0x5a>
  panic("fileread");
80101067:	83 ec 0c             	sub    $0xc,%esp
8010106a:	68 7e 70 10 80       	push   $0x8010707e
8010106f:	e8 0c f3 ff ff       	call   80100380 <panic>
80101074:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010107b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010107f:	90                   	nop

80101080 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101080:	f3 0f 1e fb          	endbr32 
80101084:	55                   	push   %ebp
80101085:	89 e5                	mov    %esp,%ebp
80101087:	57                   	push   %edi
80101088:	56                   	push   %esi
80101089:	53                   	push   %ebx
8010108a:	83 ec 1c             	sub    $0x1c,%esp
8010108d:	8b 45 0c             	mov    0xc(%ebp),%eax
80101090:	8b 75 08             	mov    0x8(%ebp),%esi
80101093:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101096:	8b 45 10             	mov    0x10(%ebp),%eax
  int r;

  if(f->writable == 0)
80101099:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
{
8010109d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
801010a0:	0f 84 c1 00 00 00    	je     80101167 <filewrite+0xe7>
    return -1;
  if(f->type == FD_PIPE)
801010a6:	8b 06                	mov    (%esi),%eax
801010a8:	83 f8 01             	cmp    $0x1,%eax
801010ab:	0f 84 c3 00 00 00    	je     80101174 <filewrite+0xf4>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
801010b1:	83 f8 02             	cmp    $0x2,%eax
801010b4:	0f 85 cc 00 00 00    	jne    80101186 <filewrite+0x106>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
801010ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    int i = 0;
801010bd:	31 ff                	xor    %edi,%edi
    while(i < n){
801010bf:	85 c0                	test   %eax,%eax
801010c1:	7f 34                	jg     801010f7 <filewrite+0x77>
801010c3:	e9 98 00 00 00       	jmp    80101160 <filewrite+0xe0>
801010c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010cf:	90                   	nop
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
801010d0:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
801010d3:	83 ec 0c             	sub    $0xc,%esp
801010d6:	ff 76 10             	pushl  0x10(%esi)
        f->off += r;
801010d9:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
801010dc:	e8 3f 07 00 00       	call   80101820 <iunlock>
      end_op();
801010e1:	e8 4a 1d 00 00       	call   80102e30 <end_op>

      if(r < 0)
        break;
      if(r != n1)
801010e6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010e9:	83 c4 10             	add    $0x10,%esp
801010ec:	39 c3                	cmp    %eax,%ebx
801010ee:	75 60                	jne    80101150 <filewrite+0xd0>
        panic("short filewrite");
      i += r;
801010f0:	01 df                	add    %ebx,%edi
    while(i < n){
801010f2:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010f5:	7e 69                	jle    80101160 <filewrite+0xe0>
      int n1 = n - i;
801010f7:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801010fa:	b8 00 1a 00 00       	mov    $0x1a00,%eax
801010ff:	29 fb                	sub    %edi,%ebx
      if(n1 > max)
80101101:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101107:	0f 4f d8             	cmovg  %eax,%ebx
      begin_op();
8010110a:	e8 b1 1c 00 00       	call   80102dc0 <begin_op>
      ilock(f->ip);
8010110f:	83 ec 0c             	sub    $0xc,%esp
80101112:	ff 76 10             	pushl  0x10(%esi)
80101115:	e8 f6 05 00 00       	call   80101710 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
8010111a:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010111d:	53                   	push   %ebx
8010111e:	ff 76 14             	pushl  0x14(%esi)
80101121:	01 f8                	add    %edi,%eax
80101123:	50                   	push   %eax
80101124:	ff 76 10             	pushl  0x10(%esi)
80101127:	e8 24 0a 00 00       	call   80101b50 <writei>
8010112c:	83 c4 20             	add    $0x20,%esp
8010112f:	85 c0                	test   %eax,%eax
80101131:	7f 9d                	jg     801010d0 <filewrite+0x50>
      iunlock(f->ip);
80101133:	83 ec 0c             	sub    $0xc,%esp
80101136:	ff 76 10             	pushl  0x10(%esi)
80101139:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010113c:	e8 df 06 00 00       	call   80101820 <iunlock>
      end_op();
80101141:	e8 ea 1c 00 00       	call   80102e30 <end_op>
      if(r < 0)
80101146:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101149:	83 c4 10             	add    $0x10,%esp
8010114c:	85 c0                	test   %eax,%eax
8010114e:	75 17                	jne    80101167 <filewrite+0xe7>
        panic("short filewrite");
80101150:	83 ec 0c             	sub    $0xc,%esp
80101153:	68 87 70 10 80       	push   $0x80107087
80101158:	e8 23 f2 ff ff       	call   80100380 <panic>
8010115d:	8d 76 00             	lea    0x0(%esi),%esi
    }
    return i == n ? n : -1;
80101160:	89 f8                	mov    %edi,%eax
80101162:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
80101165:	74 05                	je     8010116c <filewrite+0xec>
80101167:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
8010116c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010116f:	5b                   	pop    %ebx
80101170:	5e                   	pop    %esi
80101171:	5f                   	pop    %edi
80101172:	5d                   	pop    %ebp
80101173:	c3                   	ret    
    return pipewrite(f->pipe, addr, n);
80101174:	8b 46 0c             	mov    0xc(%esi),%eax
80101177:	89 45 08             	mov    %eax,0x8(%ebp)
}
8010117a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010117d:	5b                   	pop    %ebx
8010117e:	5e                   	pop    %esi
8010117f:	5f                   	pop    %edi
80101180:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
80101181:	e9 8a 25 00 00       	jmp    80103710 <pipewrite>
  panic("filewrite");
80101186:	83 ec 0c             	sub    $0xc,%esp
80101189:	68 8d 70 10 80       	push   $0x8010708d
8010118e:	e8 ed f1 ff ff       	call   80100380 <panic>
80101193:	66 90                	xchg   %ax,%ax
80101195:	66 90                	xchg   %ax,%ax
80101197:	66 90                	xchg   %ax,%ax
80101199:	66 90                	xchg   %ax,%ax
8010119b:	66 90                	xchg   %ax,%ax
8010119d:	66 90                	xchg   %ax,%ax
8010119f:	90                   	nop

801011a0 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801011a0:	55                   	push   %ebp
801011a1:	89 e5                	mov    %esp,%ebp
801011a3:	57                   	push   %edi
801011a4:	56                   	push   %esi
801011a5:	53                   	push   %ebx
801011a6:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801011a9:	8b 0d a0 01 11 80    	mov    0x801101a0,%ecx
{
801011af:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
801011b2:	85 c9                	test   %ecx,%ecx
801011b4:	0f 84 87 00 00 00    	je     80101241 <balloc+0xa1>
801011ba:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
801011c1:	8b 75 dc             	mov    -0x24(%ebp),%esi
801011c4:	83 ec 08             	sub    $0x8,%esp
801011c7:	89 f0                	mov    %esi,%eax
801011c9:	c1 f8 0c             	sar    $0xc,%eax
801011cc:	03 05 b8 01 11 80    	add    0x801101b8,%eax
801011d2:	50                   	push   %eax
801011d3:	ff 75 d8             	pushl  -0x28(%ebp)
801011d6:	e8 e5 ee ff ff       	call   801000c0 <bread>
801011db:	83 c4 10             	add    $0x10,%esp
801011de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801011e1:	a1 a0 01 11 80       	mov    0x801101a0,%eax
801011e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801011e9:	31 c0                	xor    %eax,%eax
801011eb:	eb 2f                	jmp    8010121c <balloc+0x7c>
801011ed:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
801011f0:	89 c1                	mov    %eax,%ecx
801011f2:	bb 01 00 00 00       	mov    $0x1,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
801011f7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
801011fa:	83 e1 07             	and    $0x7,%ecx
801011fd:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
801011ff:	89 c1                	mov    %eax,%ecx
80101201:	c1 f9 03             	sar    $0x3,%ecx
80101204:	0f b6 7c 0a 18       	movzbl 0x18(%edx,%ecx,1),%edi
80101209:	89 fa                	mov    %edi,%edx
8010120b:	85 df                	test   %ebx,%edi
8010120d:	74 41                	je     80101250 <balloc+0xb0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010120f:	83 c0 01             	add    $0x1,%eax
80101212:	83 c6 01             	add    $0x1,%esi
80101215:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010121a:	74 05                	je     80101221 <balloc+0x81>
8010121c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010121f:	77 cf                	ja     801011f0 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80101221:	83 ec 0c             	sub    $0xc,%esp
80101224:	ff 75 e4             	pushl  -0x1c(%ebp)
80101227:	e8 d4 ef ff ff       	call   80100200 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010122c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101233:	83 c4 10             	add    $0x10,%esp
80101236:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101239:	39 05 a0 01 11 80    	cmp    %eax,0x801101a0
8010123f:	77 80                	ja     801011c1 <balloc+0x21>
  }
  panic("balloc: out of blocks");
80101241:	83 ec 0c             	sub    $0xc,%esp
80101244:	68 97 70 10 80       	push   $0x80107097
80101249:	e8 32 f1 ff ff       	call   80100380 <panic>
8010124e:	66 90                	xchg   %ax,%ax
        bp->data[bi/8] |= m;  // Mark block in use.
80101250:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
80101253:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
80101256:	09 da                	or     %ebx,%edx
80101258:	88 54 0f 18          	mov    %dl,0x18(%edi,%ecx,1)
        log_write(bp);
8010125c:	57                   	push   %edi
8010125d:	e8 3e 1d 00 00       	call   80102fa0 <log_write>
        brelse(bp);
80101262:	89 3c 24             	mov    %edi,(%esp)
80101265:	e8 96 ef ff ff       	call   80100200 <brelse>
  bp = bread(dev, bno);
8010126a:	58                   	pop    %eax
8010126b:	5a                   	pop    %edx
8010126c:	56                   	push   %esi
8010126d:	ff 75 d8             	pushl  -0x28(%ebp)
80101270:	e8 4b ee ff ff       	call   801000c0 <bread>
  memset(bp->data, 0, BSIZE);
80101275:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, bno);
80101278:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
8010127a:	8d 40 18             	lea    0x18(%eax),%eax
8010127d:	68 00 02 00 00       	push   $0x200
80101282:	6a 00                	push   $0x0
80101284:	50                   	push   %eax
80101285:	e8 e6 32 00 00       	call   80104570 <memset>
  log_write(bp);
8010128a:	89 1c 24             	mov    %ebx,(%esp)
8010128d:	e8 0e 1d 00 00       	call   80102fa0 <log_write>
  brelse(bp);
80101292:	89 1c 24             	mov    %ebx,(%esp)
80101295:	e8 66 ef ff ff       	call   80100200 <brelse>
}
8010129a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010129d:	89 f0                	mov    %esi,%eax
8010129f:	5b                   	pop    %ebx
801012a0:	5e                   	pop    %esi
801012a1:	5f                   	pop    %edi
801012a2:	5d                   	pop    %ebp
801012a3:	c3                   	ret    
801012a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801012ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801012af:	90                   	nop

801012b0 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
801012b0:	55                   	push   %ebp
801012b1:	89 e5                	mov    %esp,%ebp
801012b3:	57                   	push   %edi
801012b4:	89 c7                	mov    %eax,%edi
801012b6:	56                   	push   %esi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
801012b7:	31 f6                	xor    %esi,%esi
{
801012b9:	53                   	push   %ebx
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012ba:	bb f4 01 11 80       	mov    $0x801101f4,%ebx
{
801012bf:	83 ec 28             	sub    $0x28,%esp
801012c2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
801012c5:	68 c0 01 11 80       	push   $0x801101c0
801012ca:	e8 71 30 00 00       	call   80104340 <acquire>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012cf:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  acquire(&icache.lock);
801012d2:	83 c4 10             	add    $0x10,%esp
801012d5:	eb 18                	jmp    801012ef <iget+0x3f>
801012d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801012de:	66 90                	xchg   %ax,%ax
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801012e0:	39 3b                	cmp    %edi,(%ebx)
801012e2:	74 64                	je     80101348 <iget+0x98>
801012e4:	83 c3 50             	add    $0x50,%ebx
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012e7:	81 fb 94 11 11 80    	cmp    $0x80111194,%ebx
801012ed:	73 21                	jae    80101310 <iget+0x60>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801012ef:	8b 4b 08             	mov    0x8(%ebx),%ecx
801012f2:	85 c9                	test   %ecx,%ecx
801012f4:	7f ea                	jg     801012e0 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801012f6:	85 f6                	test   %esi,%esi
801012f8:	75 ea                	jne    801012e4 <iget+0x34>
801012fa:	89 d8                	mov    %ebx,%eax
801012fc:	83 c3 50             	add    $0x50,%ebx
801012ff:	85 c9                	test   %ecx,%ecx
80101301:	75 6c                	jne    8010136f <iget+0xbf>
80101303:	89 c6                	mov    %eax,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101305:	81 fb 94 11 11 80    	cmp    $0x80111194,%ebx
8010130b:	72 e2                	jb     801012ef <iget+0x3f>
8010130d:	8d 76 00             	lea    0x0(%esi),%esi
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101310:	85 f6                	test   %esi,%esi
80101312:	74 73                	je     80101387 <iget+0xd7>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);
80101314:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
80101317:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101319:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010131c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
80101323:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
  release(&icache.lock);
8010132a:	68 c0 01 11 80       	push   $0x801101c0
8010132f:	e8 ec 31 00 00       	call   80104520 <release>

  return ip;
80101334:	83 c4 10             	add    $0x10,%esp
}
80101337:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010133a:	89 f0                	mov    %esi,%eax
8010133c:	5b                   	pop    %ebx
8010133d:	5e                   	pop    %esi
8010133e:	5f                   	pop    %edi
8010133f:	5d                   	pop    %ebp
80101340:	c3                   	ret    
80101341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101348:	39 53 04             	cmp    %edx,0x4(%ebx)
8010134b:	75 97                	jne    801012e4 <iget+0x34>
      release(&icache.lock);
8010134d:	83 ec 0c             	sub    $0xc,%esp
      ip->ref++;
80101350:	83 c1 01             	add    $0x1,%ecx
      return ip;
80101353:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
80101355:	68 c0 01 11 80       	push   $0x801101c0
      ip->ref++;
8010135a:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
8010135d:	e8 be 31 00 00       	call   80104520 <release>
      return ip;
80101362:	83 c4 10             	add    $0x10,%esp
}
80101365:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101368:	89 f0                	mov    %esi,%eax
8010136a:	5b                   	pop    %ebx
8010136b:	5e                   	pop    %esi
8010136c:	5f                   	pop    %edi
8010136d:	5d                   	pop    %ebp
8010136e:	c3                   	ret    
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010136f:	81 fb 94 11 11 80    	cmp    $0x80111194,%ebx
80101375:	73 10                	jae    80101387 <iget+0xd7>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101377:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010137a:	85 c9                	test   %ecx,%ecx
8010137c:	0f 8f 5e ff ff ff    	jg     801012e0 <iget+0x30>
80101382:	e9 73 ff ff ff       	jmp    801012fa <iget+0x4a>
    panic("iget: no inodes");
80101387:	83 ec 0c             	sub    $0xc,%esp
8010138a:	68 ad 70 10 80       	push   $0x801070ad
8010138f:	e8 ec ef ff ff       	call   80100380 <panic>
80101394:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010139b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010139f:	90                   	nop

801013a0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801013a0:	55                   	push   %ebp
801013a1:	89 e5                	mov    %esp,%ebp
801013a3:	57                   	push   %edi
801013a4:	56                   	push   %esi
801013a5:	89 c6                	mov    %eax,%esi
801013a7:	53                   	push   %ebx
801013a8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801013ab:	83 fa 0b             	cmp    $0xb,%edx
801013ae:	0f 86 7c 00 00 00    	jbe    80101430 <bmap+0x90>
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
801013b4:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
801013b7:	83 fb 7f             	cmp    $0x7f,%ebx
801013ba:	0f 87 90 00 00 00    	ja     80101450 <bmap+0xb0>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
801013c0:	8b 40 4c             	mov    0x4c(%eax),%eax
801013c3:	8b 16                	mov    (%esi),%edx
801013c5:	85 c0                	test   %eax,%eax
801013c7:	74 57                	je     80101420 <bmap+0x80>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
801013c9:	83 ec 08             	sub    $0x8,%esp
801013cc:	50                   	push   %eax
801013cd:	52                   	push   %edx
801013ce:	e8 ed ec ff ff       	call   801000c0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
801013d3:	83 c4 10             	add    $0x10,%esp
801013d6:	8d 54 98 18          	lea    0x18(%eax,%ebx,4),%edx
    bp = bread(ip->dev, addr);
801013da:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
801013dc:	8b 1a                	mov    (%edx),%ebx
801013de:	85 db                	test   %ebx,%ebx
801013e0:	74 1e                	je     80101400 <bmap+0x60>
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
801013e2:	83 ec 0c             	sub    $0xc,%esp
801013e5:	57                   	push   %edi
801013e6:	e8 15 ee ff ff       	call   80100200 <brelse>
    return addr;
801013eb:	83 c4 10             	add    $0x10,%esp
  }

  panic("bmap: out of range");
}
801013ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013f1:	89 d8                	mov    %ebx,%eax
801013f3:	5b                   	pop    %ebx
801013f4:	5e                   	pop    %esi
801013f5:	5f                   	pop    %edi
801013f6:	5d                   	pop    %ebp
801013f7:	c3                   	ret    
801013f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801013ff:	90                   	nop
      a[bn] = addr = balloc(ip->dev);
80101400:	8b 06                	mov    (%esi),%eax
80101402:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101405:	e8 96 fd ff ff       	call   801011a0 <balloc>
8010140a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
8010140d:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
80101410:	89 c3                	mov    %eax,%ebx
80101412:	89 02                	mov    %eax,(%edx)
      log_write(bp);
80101414:	57                   	push   %edi
80101415:	e8 86 1b 00 00       	call   80102fa0 <log_write>
8010141a:	83 c4 10             	add    $0x10,%esp
8010141d:	eb c3                	jmp    801013e2 <bmap+0x42>
8010141f:	90                   	nop
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101420:	89 d0                	mov    %edx,%eax
80101422:	e8 79 fd ff ff       	call   801011a0 <balloc>
80101427:	8b 16                	mov    (%esi),%edx
80101429:	89 46 4c             	mov    %eax,0x4c(%esi)
8010142c:	eb 9b                	jmp    801013c9 <bmap+0x29>
8010142e:	66 90                	xchg   %ax,%ax
    if((addr = ip->addrs[bn]) == 0)
80101430:	8d 3c 90             	lea    (%eax,%edx,4),%edi
80101433:	8b 5f 1c             	mov    0x1c(%edi),%ebx
80101436:	85 db                	test   %ebx,%ebx
80101438:	75 b4                	jne    801013ee <bmap+0x4e>
      ip->addrs[bn] = addr = balloc(ip->dev);
8010143a:	8b 00                	mov    (%eax),%eax
8010143c:	e8 5f fd ff ff       	call   801011a0 <balloc>
80101441:	89 47 1c             	mov    %eax,0x1c(%edi)
80101444:	89 c3                	mov    %eax,%ebx
}
80101446:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101449:	89 d8                	mov    %ebx,%eax
8010144b:	5b                   	pop    %ebx
8010144c:	5e                   	pop    %esi
8010144d:	5f                   	pop    %edi
8010144e:	5d                   	pop    %ebp
8010144f:	c3                   	ret    
  panic("bmap: out of range");
80101450:	83 ec 0c             	sub    $0xc,%esp
80101453:	68 bd 70 10 80       	push   $0x801070bd
80101458:	e8 23 ef ff ff       	call   80100380 <panic>
8010145d:	8d 76 00             	lea    0x0(%esi),%esi

80101460 <readsb>:
{
80101460:	f3 0f 1e fb          	endbr32 
80101464:	55                   	push   %ebp
80101465:	89 e5                	mov    %esp,%ebp
80101467:	56                   	push   %esi
80101468:	53                   	push   %ebx
80101469:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
8010146c:	83 ec 08             	sub    $0x8,%esp
8010146f:	6a 01                	push   $0x1
80101471:	ff 75 08             	pushl  0x8(%ebp)
80101474:	e8 47 ec ff ff       	call   801000c0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
80101479:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, 1);
8010147c:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
8010147e:	8d 40 18             	lea    0x18(%eax),%eax
80101481:	6a 1c                	push   $0x1c
80101483:	50                   	push   %eax
80101484:	56                   	push   %esi
80101485:	e8 86 31 00 00       	call   80104610 <memmove>
  brelse(bp);
8010148a:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010148d:	83 c4 10             	add    $0x10,%esp
}
80101490:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101493:	5b                   	pop    %ebx
80101494:	5e                   	pop    %esi
80101495:	5d                   	pop    %ebp
  brelse(bp);
80101496:	e9 65 ed ff ff       	jmp    80100200 <brelse>
8010149b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010149f:	90                   	nop

801014a0 <bfree>:
{
801014a0:	55                   	push   %ebp
801014a1:	89 e5                	mov    %esp,%ebp
801014a3:	56                   	push   %esi
801014a4:	89 c6                	mov    %eax,%esi
801014a6:	53                   	push   %ebx
801014a7:	89 d3                	mov    %edx,%ebx
  readsb(dev, &sb);
801014a9:	83 ec 08             	sub    $0x8,%esp
801014ac:	68 a0 01 11 80       	push   $0x801101a0
801014b1:	50                   	push   %eax
801014b2:	e8 a9 ff ff ff       	call   80101460 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
801014b7:	58                   	pop    %eax
801014b8:	89 d8                	mov    %ebx,%eax
801014ba:	5a                   	pop    %edx
801014bb:	c1 e8 0c             	shr    $0xc,%eax
801014be:	03 05 b8 01 11 80    	add    0x801101b8,%eax
801014c4:	50                   	push   %eax
801014c5:	56                   	push   %esi
801014c6:	e8 f5 eb ff ff       	call   801000c0 <bread>
  m = 1 << (bi % 8);
801014cb:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
801014cd:	c1 fb 03             	sar    $0x3,%ebx
  m = 1 << (bi % 8);
801014d0:	ba 01 00 00 00       	mov    $0x1,%edx
801014d5:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
801014d8:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
801014de:	83 c4 10             	add    $0x10,%esp
  m = 1 << (bi % 8);
801014e1:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
801014e3:	0f b6 4c 18 18       	movzbl 0x18(%eax,%ebx,1),%ecx
801014e8:	85 d1                	test   %edx,%ecx
801014ea:	74 25                	je     80101511 <bfree+0x71>
  bp->data[bi/8] &= ~m;
801014ec:	f7 d2                	not    %edx
  log_write(bp);
801014ee:	83 ec 0c             	sub    $0xc,%esp
801014f1:	89 c6                	mov    %eax,%esi
  bp->data[bi/8] &= ~m;
801014f3:	21 ca                	and    %ecx,%edx
801014f5:	88 54 18 18          	mov    %dl,0x18(%eax,%ebx,1)
  log_write(bp);
801014f9:	50                   	push   %eax
801014fa:	e8 a1 1a 00 00       	call   80102fa0 <log_write>
  brelse(bp);
801014ff:	89 34 24             	mov    %esi,(%esp)
80101502:	e8 f9 ec ff ff       	call   80100200 <brelse>
}
80101507:	83 c4 10             	add    $0x10,%esp
8010150a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010150d:	5b                   	pop    %ebx
8010150e:	5e                   	pop    %esi
8010150f:	5d                   	pop    %ebp
80101510:	c3                   	ret    
    panic("freeing free block");
80101511:	83 ec 0c             	sub    $0xc,%esp
80101514:	68 d0 70 10 80       	push   $0x801070d0
80101519:	e8 62 ee ff ff       	call   80100380 <panic>
8010151e:	66 90                	xchg   %ax,%ax

80101520 <iinit>:
{
80101520:	f3 0f 1e fb          	endbr32 
80101524:	55                   	push   %ebp
80101525:	89 e5                	mov    %esp,%ebp
80101527:	83 ec 10             	sub    $0x10,%esp
  initlock(&icache.lock, "icache");
8010152a:	68 e3 70 10 80       	push   $0x801070e3
8010152f:	68 c0 01 11 80       	push   $0x801101c0
80101534:	e8 e7 2d 00 00       	call   80104320 <initlock>
  readsb(dev, &sb);
80101539:	58                   	pop    %eax
8010153a:	5a                   	pop    %edx
8010153b:	68 a0 01 11 80       	push   $0x801101a0
80101540:	ff 75 08             	pushl  0x8(%ebp)
80101543:	e8 18 ff ff ff       	call   80101460 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
80101548:	ff 35 b8 01 11 80    	pushl  0x801101b8
8010154e:	ff 35 b4 01 11 80    	pushl  0x801101b4
80101554:	ff 35 b0 01 11 80    	pushl  0x801101b0
8010155a:	ff 35 ac 01 11 80    	pushl  0x801101ac
80101560:	ff 35 a8 01 11 80    	pushl  0x801101a8
80101566:	ff 35 a4 01 11 80    	pushl  0x801101a4
8010156c:	ff 35 a0 01 11 80    	pushl  0x801101a0
80101572:	68 44 71 10 80       	push   $0x80107144
80101577:	e8 24 f1 ff ff       	call   801006a0 <cprintf>
}
8010157c:	83 c4 30             	add    $0x30,%esp
8010157f:	c9                   	leave  
80101580:	c3                   	ret    
80101581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010158f:	90                   	nop

80101590 <ialloc>:
{
80101590:	f3 0f 1e fb          	endbr32 
80101594:	55                   	push   %ebp
80101595:	89 e5                	mov    %esp,%ebp
80101597:	57                   	push   %edi
80101598:	56                   	push   %esi
80101599:	53                   	push   %ebx
8010159a:	83 ec 1c             	sub    $0x1c,%esp
8010159d:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(inum = 1; inum < sb.ninodes; inum++){
801015a0:	83 3d a8 01 11 80 01 	cmpl   $0x1,0x801101a8
{
801015a7:	8b 75 08             	mov    0x8(%ebp),%esi
801015aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
801015ad:	0f 86 8d 00 00 00    	jbe    80101640 <ialloc+0xb0>
801015b3:	bf 01 00 00 00       	mov    $0x1,%edi
801015b8:	eb 1d                	jmp    801015d7 <ialloc+0x47>
801015ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    brelse(bp);
801015c0:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
801015c3:	83 c7 01             	add    $0x1,%edi
    brelse(bp);
801015c6:	53                   	push   %ebx
801015c7:	e8 34 ec ff ff       	call   80100200 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
801015cc:	83 c4 10             	add    $0x10,%esp
801015cf:	3b 3d a8 01 11 80    	cmp    0x801101a8,%edi
801015d5:	73 69                	jae    80101640 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
801015d7:	89 f8                	mov    %edi,%eax
801015d9:	83 ec 08             	sub    $0x8,%esp
801015dc:	c1 e8 03             	shr    $0x3,%eax
801015df:	03 05 b4 01 11 80    	add    0x801101b4,%eax
801015e5:	50                   	push   %eax
801015e6:	56                   	push   %esi
801015e7:	e8 d4 ea ff ff       	call   801000c0 <bread>
    if(dip->type == 0){  // a free inode
801015ec:	83 c4 10             	add    $0x10,%esp
    bp = bread(dev, IBLOCK(inum, sb));
801015ef:	89 c3                	mov    %eax,%ebx
    dip = (struct dinode*)bp->data + inum%IPB;
801015f1:	89 f8                	mov    %edi,%eax
801015f3:	83 e0 07             	and    $0x7,%eax
801015f6:	c1 e0 06             	shl    $0x6,%eax
801015f9:	8d 4c 03 18          	lea    0x18(%ebx,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
801015fd:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101601:	75 bd                	jne    801015c0 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101603:	83 ec 04             	sub    $0x4,%esp
80101606:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101609:	6a 40                	push   $0x40
8010160b:	6a 00                	push   $0x0
8010160d:	51                   	push   %ecx
8010160e:	e8 5d 2f 00 00       	call   80104570 <memset>
      dip->type = type;
80101613:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101617:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010161a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010161d:	89 1c 24             	mov    %ebx,(%esp)
80101620:	e8 7b 19 00 00       	call   80102fa0 <log_write>
      brelse(bp);
80101625:	89 1c 24             	mov    %ebx,(%esp)
80101628:	e8 d3 eb ff ff       	call   80100200 <brelse>
      return iget(dev, inum);
8010162d:	83 c4 10             	add    $0x10,%esp
}
80101630:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
80101633:	89 fa                	mov    %edi,%edx
}
80101635:	5b                   	pop    %ebx
      return iget(dev, inum);
80101636:	89 f0                	mov    %esi,%eax
}
80101638:	5e                   	pop    %esi
80101639:	5f                   	pop    %edi
8010163a:	5d                   	pop    %ebp
      return iget(dev, inum);
8010163b:	e9 70 fc ff ff       	jmp    801012b0 <iget>
  panic("ialloc: no inodes");
80101640:	83 ec 0c             	sub    $0xc,%esp
80101643:	68 ea 70 10 80       	push   $0x801070ea
80101648:	e8 33 ed ff ff       	call   80100380 <panic>
8010164d:	8d 76 00             	lea    0x0(%esi),%esi

80101650 <iupdate>:
{
80101650:	f3 0f 1e fb          	endbr32 
80101654:	55                   	push   %ebp
80101655:	89 e5                	mov    %esp,%ebp
80101657:	56                   	push   %esi
80101658:	53                   	push   %ebx
80101659:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010165c:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010165f:	83 c3 1c             	add    $0x1c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101662:	83 ec 08             	sub    $0x8,%esp
80101665:	c1 e8 03             	shr    $0x3,%eax
80101668:	03 05 b4 01 11 80    	add    0x801101b4,%eax
8010166e:	50                   	push   %eax
8010166f:	ff 73 e4             	pushl  -0x1c(%ebx)
80101672:	e8 49 ea ff ff       	call   801000c0 <bread>
  dip->type = ip->type;
80101677:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010167b:	83 c4 0c             	add    $0xc,%esp
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010167e:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101680:	8b 43 e8             	mov    -0x18(%ebx),%eax
80101683:	83 e0 07             	and    $0x7,%eax
80101686:	c1 e0 06             	shl    $0x6,%eax
80101689:	8d 44 06 18          	lea    0x18(%esi,%eax,1),%eax
  dip->type = ip->type;
8010168d:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
80101690:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101694:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
80101697:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
8010169b:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010169f:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
801016a3:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
801016a7:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
801016ab:	8b 53 fc             	mov    -0x4(%ebx),%edx
801016ae:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016b1:	6a 34                	push   $0x34
801016b3:	53                   	push   %ebx
801016b4:	50                   	push   %eax
801016b5:	e8 56 2f 00 00       	call   80104610 <memmove>
  log_write(bp);
801016ba:	89 34 24             	mov    %esi,(%esp)
801016bd:	e8 de 18 00 00       	call   80102fa0 <log_write>
  brelse(bp);
801016c2:	89 75 08             	mov    %esi,0x8(%ebp)
801016c5:	83 c4 10             	add    $0x10,%esp
}
801016c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016cb:	5b                   	pop    %ebx
801016cc:	5e                   	pop    %esi
801016cd:	5d                   	pop    %ebp
  brelse(bp);
801016ce:	e9 2d eb ff ff       	jmp    80100200 <brelse>
801016d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801016da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801016e0 <idup>:
{
801016e0:	f3 0f 1e fb          	endbr32 
801016e4:	55                   	push   %ebp
801016e5:	89 e5                	mov    %esp,%ebp
801016e7:	53                   	push   %ebx
801016e8:	83 ec 10             	sub    $0x10,%esp
801016eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
801016ee:	68 c0 01 11 80       	push   $0x801101c0
801016f3:	e8 48 2c 00 00       	call   80104340 <acquire>
  ip->ref++;
801016f8:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
801016fc:	c7 04 24 c0 01 11 80 	movl   $0x801101c0,(%esp)
80101703:	e8 18 2e 00 00       	call   80104520 <release>
}
80101708:	89 d8                	mov    %ebx,%eax
8010170a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010170d:	c9                   	leave  
8010170e:	c3                   	ret    
8010170f:	90                   	nop

80101710 <ilock>:
{
80101710:	f3 0f 1e fb          	endbr32 
80101714:	55                   	push   %ebp
80101715:	89 e5                	mov    %esp,%ebp
80101717:	56                   	push   %esi
80101718:	53                   	push   %ebx
80101719:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
8010171c:	85 db                	test   %ebx,%ebx
8010171e:	0f 84 ec 00 00 00    	je     80101810 <ilock+0x100>
80101724:	8b 43 08             	mov    0x8(%ebx),%eax
80101727:	85 c0                	test   %eax,%eax
80101729:	0f 8e e1 00 00 00    	jle    80101810 <ilock+0x100>
  acquire(&icache.lock);
8010172f:	83 ec 0c             	sub    $0xc,%esp
80101732:	68 c0 01 11 80       	push   $0x801101c0
80101737:	e8 04 2c 00 00       	call   80104340 <acquire>
  while(ip->flags & I_BUSY)
8010173c:	8b 43 0c             	mov    0xc(%ebx),%eax
8010173f:	83 c4 10             	add    $0x10,%esp
80101742:	a8 01                	test   $0x1,%al
80101744:	74 22                	je     80101768 <ilock+0x58>
80101746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010174d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(ip, &icache.lock);
80101750:	83 ec 08             	sub    $0x8,%esp
80101753:	68 c0 01 11 80       	push   $0x801101c0
80101758:	53                   	push   %ebx
80101759:	e8 42 28 00 00       	call   80103fa0 <sleep>
  while(ip->flags & I_BUSY)
8010175e:	8b 43 0c             	mov    0xc(%ebx),%eax
80101761:	83 c4 10             	add    $0x10,%esp
80101764:	a8 01                	test   $0x1,%al
80101766:	75 e8                	jne    80101750 <ilock+0x40>
  release(&icache.lock);
80101768:	83 ec 0c             	sub    $0xc,%esp
  ip->flags |= I_BUSY;
8010176b:	83 c8 01             	or     $0x1,%eax
8010176e:	89 43 0c             	mov    %eax,0xc(%ebx)
  release(&icache.lock);
80101771:	68 c0 01 11 80       	push   $0x801101c0
80101776:	e8 a5 2d 00 00       	call   80104520 <release>
  if(!(ip->flags & I_VALID)){
8010177b:	83 c4 10             	add    $0x10,%esp
8010177e:	f6 43 0c 02          	testb  $0x2,0xc(%ebx)
80101782:	74 0c                	je     80101790 <ilock+0x80>
}
80101784:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101787:	5b                   	pop    %ebx
80101788:	5e                   	pop    %esi
80101789:	5d                   	pop    %ebp
8010178a:	c3                   	ret    
8010178b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010178f:	90                   	nop
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101790:	8b 43 04             	mov    0x4(%ebx),%eax
80101793:	83 ec 08             	sub    $0x8,%esp
80101796:	c1 e8 03             	shr    $0x3,%eax
80101799:	03 05 b4 01 11 80    	add    0x801101b4,%eax
8010179f:	50                   	push   %eax
801017a0:	ff 33                	pushl  (%ebx)
801017a2:	e8 19 e9 ff ff       	call   801000c0 <bread>
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017a7:	83 c4 0c             	add    $0xc,%esp
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801017aa:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801017ac:	8b 43 04             	mov    0x4(%ebx),%eax
801017af:	83 e0 07             	and    $0x7,%eax
801017b2:	c1 e0 06             	shl    $0x6,%eax
801017b5:	8d 44 06 18          	lea    0x18(%esi,%eax,1),%eax
    ip->type = dip->type;
801017b9:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017bc:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
801017bf:	66 89 53 10          	mov    %dx,0x10(%ebx)
    ip->major = dip->major;
801017c3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801017c7:	66 89 53 12          	mov    %dx,0x12(%ebx)
    ip->minor = dip->minor;
801017cb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801017cf:	66 89 53 14          	mov    %dx,0x14(%ebx)
    ip->nlink = dip->nlink;
801017d3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801017d7:	66 89 53 16          	mov    %dx,0x16(%ebx)
    ip->size = dip->size;
801017db:	8b 50 fc             	mov    -0x4(%eax),%edx
801017de:	89 53 18             	mov    %edx,0x18(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017e1:	6a 34                	push   $0x34
801017e3:	50                   	push   %eax
801017e4:	8d 43 1c             	lea    0x1c(%ebx),%eax
801017e7:	50                   	push   %eax
801017e8:	e8 23 2e 00 00       	call   80104610 <memmove>
    brelse(bp);
801017ed:	89 34 24             	mov    %esi,(%esp)
801017f0:	e8 0b ea ff ff       	call   80100200 <brelse>
    ip->flags |= I_VALID;
801017f5:	83 4b 0c 02          	orl    $0x2,0xc(%ebx)
    if(ip->type == 0)
801017f9:	83 c4 10             	add    $0x10,%esp
801017fc:	66 83 7b 10 00       	cmpw   $0x0,0x10(%ebx)
80101801:	75 81                	jne    80101784 <ilock+0x74>
      panic("ilock: no type");
80101803:	83 ec 0c             	sub    $0xc,%esp
80101806:	68 02 71 10 80       	push   $0x80107102
8010180b:	e8 70 eb ff ff       	call   80100380 <panic>
    panic("ilock");
80101810:	83 ec 0c             	sub    $0xc,%esp
80101813:	68 fc 70 10 80       	push   $0x801070fc
80101818:	e8 63 eb ff ff       	call   80100380 <panic>
8010181d:	8d 76 00             	lea    0x0(%esi),%esi

80101820 <iunlock>:
{
80101820:	f3 0f 1e fb          	endbr32 
80101824:	55                   	push   %ebp
80101825:	89 e5                	mov    %esp,%ebp
80101827:	53                   	push   %ebx
80101828:	83 ec 04             	sub    $0x4,%esp
8010182b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !(ip->flags & I_BUSY) || ip->ref < 1)
8010182e:	85 db                	test   %ebx,%ebx
80101830:	74 39                	je     8010186b <iunlock+0x4b>
80101832:	f6 43 0c 01          	testb  $0x1,0xc(%ebx)
80101836:	74 33                	je     8010186b <iunlock+0x4b>
80101838:	8b 43 08             	mov    0x8(%ebx),%eax
8010183b:	85 c0                	test   %eax,%eax
8010183d:	7e 2c                	jle    8010186b <iunlock+0x4b>
  acquire(&icache.lock);
8010183f:	83 ec 0c             	sub    $0xc,%esp
80101842:	68 c0 01 11 80       	push   $0x801101c0
80101847:	e8 f4 2a 00 00       	call   80104340 <acquire>
  ip->flags &= ~I_BUSY;
8010184c:	83 63 0c fe          	andl   $0xfffffffe,0xc(%ebx)
  wakeup(ip);
80101850:	89 1c 24             	mov    %ebx,(%esp)
80101853:	e8 08 29 00 00       	call   80104160 <wakeup>
  release(&icache.lock);
80101858:	c7 45 08 c0 01 11 80 	movl   $0x801101c0,0x8(%ebp)
}
8010185f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  release(&icache.lock);
80101862:	83 c4 10             	add    $0x10,%esp
}
80101865:	c9                   	leave  
  release(&icache.lock);
80101866:	e9 b5 2c 00 00       	jmp    80104520 <release>
    panic("iunlock");
8010186b:	83 ec 0c             	sub    $0xc,%esp
8010186e:	68 11 71 10 80       	push   $0x80107111
80101873:	e8 08 eb ff ff       	call   80100380 <panic>
80101878:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010187f:	90                   	nop

80101880 <iput>:
{
80101880:	f3 0f 1e fb          	endbr32 
80101884:	55                   	push   %ebp
80101885:	89 e5                	mov    %esp,%ebp
80101887:	57                   	push   %edi
80101888:	56                   	push   %esi
80101889:	53                   	push   %ebx
8010188a:	83 ec 28             	sub    $0x28,%esp
8010188d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
80101890:	68 c0 01 11 80       	push   $0x801101c0
80101895:	e8 a6 2a 00 00       	call   80104340 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
8010189a:	8b 43 08             	mov    0x8(%ebx),%eax
8010189d:	83 c4 10             	add    $0x10,%esp
801018a0:	83 f8 01             	cmp    $0x1,%eax
801018a3:	0f 85 af 00 00 00    	jne    80101958 <iput+0xd8>
801018a9:	8b 53 0c             	mov    0xc(%ebx),%edx
801018ac:	f6 c2 02             	test   $0x2,%dl
801018af:	0f 84 a3 00 00 00    	je     80101958 <iput+0xd8>
801018b5:	66 83 7b 16 00       	cmpw   $0x0,0x16(%ebx)
801018ba:	0f 85 98 00 00 00    	jne    80101958 <iput+0xd8>
    if(ip->flags & I_BUSY)
801018c0:	f6 c2 01             	test   $0x1,%dl
801018c3:	0f 85 0b 01 00 00    	jne    801019d4 <iput+0x154>
    release(&icache.lock);
801018c9:	83 ec 0c             	sub    $0xc,%esp
801018cc:	8d 73 1c             	lea    0x1c(%ebx),%esi
801018cf:	8d 7b 4c             	lea    0x4c(%ebx),%edi
    ip->flags |= I_BUSY;
801018d2:	83 ca 01             	or     $0x1,%edx
801018d5:	89 53 0c             	mov    %edx,0xc(%ebx)
    release(&icache.lock);
801018d8:	68 c0 01 11 80       	push   $0x801101c0
801018dd:	e8 3e 2c 00 00       	call   80104520 <release>
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
801018e2:	83 c4 10             	add    $0x10,%esp
801018e5:	eb 10                	jmp    801018f7 <iput+0x77>
801018e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018ee:	66 90                	xchg   %ax,%ax
801018f0:	83 c6 04             	add    $0x4,%esi
801018f3:	39 fe                	cmp    %edi,%esi
801018f5:	74 1b                	je     80101912 <iput+0x92>
    if(ip->addrs[i]){
801018f7:	8b 16                	mov    (%esi),%edx
801018f9:	85 d2                	test   %edx,%edx
801018fb:	74 f3                	je     801018f0 <iput+0x70>
      bfree(ip->dev, ip->addrs[i]);
801018fd:	8b 03                	mov    (%ebx),%eax
801018ff:	83 c6 04             	add    $0x4,%esi
80101902:	e8 99 fb ff ff       	call   801014a0 <bfree>
      ip->addrs[i] = 0;
80101907:	c7 46 fc 00 00 00 00 	movl   $0x0,-0x4(%esi)
  for(i = 0; i < NDIRECT; i++){
8010190e:	39 fe                	cmp    %edi,%esi
80101910:	75 e5                	jne    801018f7 <iput+0x77>
    }
  }

  if(ip->addrs[NDIRECT]){
80101912:	8b 43 4c             	mov    0x4c(%ebx),%eax
80101915:	85 c0                	test   %eax,%eax
80101917:	75 5f                	jne    80101978 <iput+0xf8>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
80101919:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
8010191c:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
  iupdate(ip);
80101923:	53                   	push   %ebx
80101924:	e8 27 fd ff ff       	call   80101650 <iupdate>
    ip->type = 0;
80101929:	31 c0                	xor    %eax,%eax
8010192b:	66 89 43 10          	mov    %ax,0x10(%ebx)
    iupdate(ip);
8010192f:	89 1c 24             	mov    %ebx,(%esp)
80101932:	e8 19 fd ff ff       	call   80101650 <iupdate>
    acquire(&icache.lock);
80101937:	c7 04 24 c0 01 11 80 	movl   $0x801101c0,(%esp)
8010193e:	e8 fd 29 00 00       	call   80104340 <acquire>
    ip->flags = 0;
80101943:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    wakeup(ip);
8010194a:	89 1c 24             	mov    %ebx,(%esp)
8010194d:	e8 0e 28 00 00       	call   80104160 <wakeup>
80101952:	8b 43 08             	mov    0x8(%ebx),%eax
80101955:	83 c4 10             	add    $0x10,%esp
  ip->ref--;
80101958:	83 e8 01             	sub    $0x1,%eax
8010195b:	89 43 08             	mov    %eax,0x8(%ebx)
  release(&icache.lock);
8010195e:	c7 45 08 c0 01 11 80 	movl   $0x801101c0,0x8(%ebp)
}
80101965:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101968:	5b                   	pop    %ebx
80101969:	5e                   	pop    %esi
8010196a:	5f                   	pop    %edi
8010196b:	5d                   	pop    %ebp
  release(&icache.lock);
8010196c:	e9 af 2b 00 00       	jmp    80104520 <release>
80101971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101978:	83 ec 08             	sub    $0x8,%esp
8010197b:	50                   	push   %eax
8010197c:	ff 33                	pushl  (%ebx)
8010197e:	e8 3d e7 ff ff       	call   801000c0 <bread>
80101983:	83 c4 10             	add    $0x10,%esp
80101986:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(j = 0; j < NINDIRECT; j++){
80101989:	8d 78 18             	lea    0x18(%eax),%edi
8010198c:	8d b0 18 02 00 00    	lea    0x218(%eax),%esi
80101992:	eb 0b                	jmp    8010199f <iput+0x11f>
80101994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101998:	83 c7 04             	add    $0x4,%edi
8010199b:	39 f7                	cmp    %esi,%edi
8010199d:	74 11                	je     801019b0 <iput+0x130>
      if(a[j])
8010199f:	8b 17                	mov    (%edi),%edx
801019a1:	85 d2                	test   %edx,%edx
801019a3:	74 f3                	je     80101998 <iput+0x118>
        bfree(ip->dev, a[j]);
801019a5:	8b 03                	mov    (%ebx),%eax
801019a7:	e8 f4 fa ff ff       	call   801014a0 <bfree>
801019ac:	eb ea                	jmp    80101998 <iput+0x118>
801019ae:	66 90                	xchg   %ax,%ax
    brelse(bp);
801019b0:	83 ec 0c             	sub    $0xc,%esp
801019b3:	ff 75 e4             	pushl  -0x1c(%ebp)
801019b6:	e8 45 e8 ff ff       	call   80100200 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801019bb:	8b 53 4c             	mov    0x4c(%ebx),%edx
801019be:	8b 03                	mov    (%ebx),%eax
801019c0:	e8 db fa ff ff       	call   801014a0 <bfree>
    ip->addrs[NDIRECT] = 0;
801019c5:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801019cc:	83 c4 10             	add    $0x10,%esp
801019cf:	e9 45 ff ff ff       	jmp    80101919 <iput+0x99>
      panic("iput busy");
801019d4:	83 ec 0c             	sub    $0xc,%esp
801019d7:	68 19 71 10 80       	push   $0x80107119
801019dc:	e8 9f e9 ff ff       	call   80100380 <panic>
801019e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801019e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801019ef:	90                   	nop

801019f0 <iunlockput>:
{
801019f0:	f3 0f 1e fb          	endbr32 
801019f4:	55                   	push   %ebp
801019f5:	89 e5                	mov    %esp,%ebp
801019f7:	53                   	push   %ebx
801019f8:	83 ec 10             	sub    $0x10,%esp
801019fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
801019fe:	53                   	push   %ebx
801019ff:	e8 1c fe ff ff       	call   80101820 <iunlock>
  iput(ip);
80101a04:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101a07:	83 c4 10             	add    $0x10,%esp
}
80101a0a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101a0d:	c9                   	leave  
  iput(ip);
80101a0e:	e9 6d fe ff ff       	jmp    80101880 <iput>
80101a13:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101a20 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
80101a20:	f3 0f 1e fb          	endbr32 
80101a24:	55                   	push   %ebp
80101a25:	89 e5                	mov    %esp,%ebp
80101a27:	8b 55 08             	mov    0x8(%ebp),%edx
80101a2a:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101a2d:	8b 0a                	mov    (%edx),%ecx
80101a2f:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
80101a32:	8b 4a 04             	mov    0x4(%edx),%ecx
80101a35:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101a38:	0f b7 4a 10          	movzwl 0x10(%edx),%ecx
80101a3c:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
80101a3f:	0f b7 4a 16          	movzwl 0x16(%edx),%ecx
80101a43:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101a47:	8b 52 18             	mov    0x18(%edx),%edx
80101a4a:	89 50 10             	mov    %edx,0x10(%eax)
}
80101a4d:	5d                   	pop    %ebp
80101a4e:	c3                   	ret    
80101a4f:	90                   	nop

80101a50 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101a50:	f3 0f 1e fb          	endbr32 
80101a54:	55                   	push   %ebp
80101a55:	89 e5                	mov    %esp,%ebp
80101a57:	57                   	push   %edi
80101a58:	56                   	push   %esi
80101a59:	53                   	push   %ebx
80101a5a:	83 ec 1c             	sub    $0x1c,%esp
80101a5d:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101a60:	8b 45 08             	mov    0x8(%ebp),%eax
80101a63:	8b 75 10             	mov    0x10(%ebp),%esi
80101a66:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a69:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a6c:	66 83 78 10 03       	cmpw   $0x3,0x10(%eax)
{
80101a71:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a74:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  if(ip->type == T_DEV){
80101a77:	0f 84 a3 00 00 00    	je     80101b20 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101a7d:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a80:	8b 40 18             	mov    0x18(%eax),%eax
80101a83:	39 c6                	cmp    %eax,%esi
80101a85:	0f 87 b6 00 00 00    	ja     80101b41 <readi+0xf1>
80101a8b:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101a8e:	31 c9                	xor    %ecx,%ecx
80101a90:	89 da                	mov    %ebx,%edx
80101a92:	01 f2                	add    %esi,%edx
80101a94:	0f 92 c1             	setb   %cl
80101a97:	89 cf                	mov    %ecx,%edi
80101a99:	0f 82 a2 00 00 00    	jb     80101b41 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101a9f:	89 c1                	mov    %eax,%ecx
80101aa1:	29 f1                	sub    %esi,%ecx
80101aa3:	39 d0                	cmp    %edx,%eax
80101aa5:	0f 43 cb             	cmovae %ebx,%ecx
80101aa8:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101aab:	85 c9                	test   %ecx,%ecx
80101aad:	74 63                	je     80101b12 <readi+0xc2>
80101aaf:	90                   	nop
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ab0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101ab3:	89 f2                	mov    %esi,%edx
80101ab5:	c1 ea 09             	shr    $0x9,%edx
80101ab8:	89 d8                	mov    %ebx,%eax
80101aba:	e8 e1 f8 ff ff       	call   801013a0 <bmap>
80101abf:	83 ec 08             	sub    $0x8,%esp
80101ac2:	50                   	push   %eax
80101ac3:	ff 33                	pushl  (%ebx)
80101ac5:	e8 f6 e5 ff ff       	call   801000c0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101aca:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101acd:	b9 00 02 00 00       	mov    $0x200,%ecx
80101ad2:	83 c4 0c             	add    $0xc,%esp
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ad5:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101ad7:	89 f0                	mov    %esi,%eax
80101ad9:	25 ff 01 00 00       	and    $0x1ff,%eax
80101ade:	29 fb                	sub    %edi,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101ae0:	89 55 dc             	mov    %edx,-0x24(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101ae3:	29 c1                	sub    %eax,%ecx
    memmove(dst, bp->data + off%BSIZE, m);
80101ae5:	8d 44 02 18          	lea    0x18(%edx,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101ae9:	39 d9                	cmp    %ebx,%ecx
80101aeb:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101aee:	53                   	push   %ebx
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101aef:	01 df                	add    %ebx,%edi
80101af1:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
80101af3:	50                   	push   %eax
80101af4:	ff 75 e0             	pushl  -0x20(%ebp)
80101af7:	e8 14 2b 00 00       	call   80104610 <memmove>
    brelse(bp);
80101afc:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101aff:	89 14 24             	mov    %edx,(%esp)
80101b02:	e8 f9 e6 ff ff       	call   80100200 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b07:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101b0a:	83 c4 10             	add    $0x10,%esp
80101b0d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101b10:	77 9e                	ja     80101ab0 <readi+0x60>
  }
  return n;
80101b12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101b15:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b18:	5b                   	pop    %ebx
80101b19:	5e                   	pop    %esi
80101b1a:	5f                   	pop    %edi
80101b1b:	5d                   	pop    %ebp
80101b1c:	c3                   	ret    
80101b1d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101b20:	0f bf 40 12          	movswl 0x12(%eax),%eax
80101b24:	66 83 f8 09          	cmp    $0x9,%ax
80101b28:	77 17                	ja     80101b41 <readi+0xf1>
80101b2a:	8b 04 c5 40 01 11 80 	mov    -0x7feefec0(,%eax,8),%eax
80101b31:	85 c0                	test   %eax,%eax
80101b33:	74 0c                	je     80101b41 <readi+0xf1>
    return devsw[ip->major].read(ip, dst, n);
80101b35:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101b38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b3b:	5b                   	pop    %ebx
80101b3c:	5e                   	pop    %esi
80101b3d:	5f                   	pop    %edi
80101b3e:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101b3f:	ff e0                	jmp    *%eax
      return -1;
80101b41:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b46:	eb cd                	jmp    80101b15 <readi+0xc5>
80101b48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b4f:	90                   	nop

80101b50 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101b50:	f3 0f 1e fb          	endbr32 
80101b54:	55                   	push   %ebp
80101b55:	89 e5                	mov    %esp,%ebp
80101b57:	57                   	push   %edi
80101b58:	56                   	push   %esi
80101b59:	53                   	push   %ebx
80101b5a:	83 ec 1c             	sub    $0x1c,%esp
80101b5d:	8b 45 08             	mov    0x8(%ebp),%eax
80101b60:	8b 75 0c             	mov    0xc(%ebp),%esi
80101b63:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101b66:	66 83 78 10 03       	cmpw   $0x3,0x10(%eax)
{
80101b6b:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101b6e:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101b71:	8b 75 10             	mov    0x10(%ebp),%esi
80101b74:	89 7d e0             	mov    %edi,-0x20(%ebp)
  if(ip->type == T_DEV){
80101b77:	0f 84 b3 00 00 00    	je     80101c30 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101b7d:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b80:	39 70 18             	cmp    %esi,0x18(%eax)
80101b83:	0f 82 e3 00 00 00    	jb     80101c6c <writei+0x11c>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101b89:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101b8c:	89 f8                	mov    %edi,%eax
80101b8e:	01 f0                	add    %esi,%eax
80101b90:	0f 82 d6 00 00 00    	jb     80101c6c <writei+0x11c>
80101b96:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101b9b:	0f 87 cb 00 00 00    	ja     80101c6c <writei+0x11c>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ba1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101ba8:	85 ff                	test   %edi,%edi
80101baa:	74 75                	je     80101c21 <writei+0xd1>
80101bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101bb0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101bb3:	89 f2                	mov    %esi,%edx
80101bb5:	c1 ea 09             	shr    $0x9,%edx
80101bb8:	89 f8                	mov    %edi,%eax
80101bba:	e8 e1 f7 ff ff       	call   801013a0 <bmap>
80101bbf:	83 ec 08             	sub    $0x8,%esp
80101bc2:	50                   	push   %eax
80101bc3:	ff 37                	pushl  (%edi)
80101bc5:	e8 f6 e4 ff ff       	call   801000c0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101bca:	b9 00 02 00 00       	mov    $0x200,%ecx
80101bcf:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101bd2:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101bd5:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101bd7:	89 f0                	mov    %esi,%eax
80101bd9:	83 c4 0c             	add    $0xc,%esp
80101bdc:	25 ff 01 00 00       	and    $0x1ff,%eax
80101be1:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101be3:	8d 44 07 18          	lea    0x18(%edi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101be7:	39 d9                	cmp    %ebx,%ecx
80101be9:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101bec:	53                   	push   %ebx
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101bed:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101bef:	ff 75 dc             	pushl  -0x24(%ebp)
80101bf2:	50                   	push   %eax
80101bf3:	e8 18 2a 00 00       	call   80104610 <memmove>
    log_write(bp);
80101bf8:	89 3c 24             	mov    %edi,(%esp)
80101bfb:	e8 a0 13 00 00       	call   80102fa0 <log_write>
    brelse(bp);
80101c00:	89 3c 24             	mov    %edi,(%esp)
80101c03:	e8 f8 e5 ff ff       	call   80100200 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101c08:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101c0b:	83 c4 10             	add    $0x10,%esp
80101c0e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101c11:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101c14:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101c17:	77 97                	ja     80101bb0 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101c19:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101c1c:	3b 70 18             	cmp    0x18(%eax),%esi
80101c1f:	77 37                	ja     80101c58 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101c21:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101c24:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c27:	5b                   	pop    %ebx
80101c28:	5e                   	pop    %esi
80101c29:	5f                   	pop    %edi
80101c2a:	5d                   	pop    %ebp
80101c2b:	c3                   	ret    
80101c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101c30:	0f bf 40 12          	movswl 0x12(%eax),%eax
80101c34:	66 83 f8 09          	cmp    $0x9,%ax
80101c38:	77 32                	ja     80101c6c <writei+0x11c>
80101c3a:	8b 04 c5 44 01 11 80 	mov    -0x7feefebc(,%eax,8),%eax
80101c41:	85 c0                	test   %eax,%eax
80101c43:	74 27                	je     80101c6c <writei+0x11c>
    return devsw[ip->major].write(ip, src, n);
80101c45:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101c48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c4b:	5b                   	pop    %ebx
80101c4c:	5e                   	pop    %esi
80101c4d:	5f                   	pop    %edi
80101c4e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101c4f:	ff e0                	jmp    *%eax
80101c51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101c58:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101c5b:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101c5e:	89 70 18             	mov    %esi,0x18(%eax)
    iupdate(ip);
80101c61:	50                   	push   %eax
80101c62:	e8 e9 f9 ff ff       	call   80101650 <iupdate>
80101c67:	83 c4 10             	add    $0x10,%esp
80101c6a:	eb b5                	jmp    80101c21 <writei+0xd1>
      return -1;
80101c6c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101c71:	eb b1                	jmp    80101c24 <writei+0xd4>
80101c73:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101c80 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101c80:	f3 0f 1e fb          	endbr32 
80101c84:	55                   	push   %ebp
80101c85:	89 e5                	mov    %esp,%ebp
80101c87:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101c8a:	6a 0e                	push   $0xe
80101c8c:	ff 75 0c             	pushl  0xc(%ebp)
80101c8f:	ff 75 08             	pushl  0x8(%ebp)
80101c92:	e8 e9 29 00 00       	call   80104680 <strncmp>
}
80101c97:	c9                   	leave  
80101c98:	c3                   	ret    
80101c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101ca0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101ca0:	f3 0f 1e fb          	endbr32 
80101ca4:	55                   	push   %ebp
80101ca5:	89 e5                	mov    %esp,%ebp
80101ca7:	57                   	push   %edi
80101ca8:	56                   	push   %esi
80101ca9:	53                   	push   %ebx
80101caa:	83 ec 1c             	sub    $0x1c,%esp
80101cad:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101cb0:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
80101cb5:	0f 85 89 00 00 00    	jne    80101d44 <dirlookup+0xa4>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101cbb:	8b 53 18             	mov    0x18(%ebx),%edx
80101cbe:	31 ff                	xor    %edi,%edi
80101cc0:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101cc3:	85 d2                	test   %edx,%edx
80101cc5:	74 42                	je     80101d09 <dirlookup+0x69>
80101cc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cce:	66 90                	xchg   %ax,%ax
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101cd0:	6a 10                	push   $0x10
80101cd2:	57                   	push   %edi
80101cd3:	56                   	push   %esi
80101cd4:	53                   	push   %ebx
80101cd5:	e8 76 fd ff ff       	call   80101a50 <readi>
80101cda:	83 c4 10             	add    $0x10,%esp
80101cdd:	83 f8 10             	cmp    $0x10,%eax
80101ce0:	75 55                	jne    80101d37 <dirlookup+0x97>
      panic("dirlink read");
    if(de.inum == 0)
80101ce2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101ce7:	74 18                	je     80101d01 <dirlookup+0x61>
  return strncmp(s, t, DIRSIZ);
80101ce9:	83 ec 04             	sub    $0x4,%esp
80101cec:	8d 45 da             	lea    -0x26(%ebp),%eax
80101cef:	6a 0e                	push   $0xe
80101cf1:	50                   	push   %eax
80101cf2:	ff 75 0c             	pushl  0xc(%ebp)
80101cf5:	e8 86 29 00 00       	call   80104680 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101cfa:	83 c4 10             	add    $0x10,%esp
80101cfd:	85 c0                	test   %eax,%eax
80101cff:	74 17                	je     80101d18 <dirlookup+0x78>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101d01:	83 c7 10             	add    $0x10,%edi
80101d04:	3b 7b 18             	cmp    0x18(%ebx),%edi
80101d07:	72 c7                	jb     80101cd0 <dirlookup+0x30>
      return iget(dp->dev, inum);
    }
  }

  return 0;
}
80101d09:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101d0c:	31 c0                	xor    %eax,%eax
}
80101d0e:	5b                   	pop    %ebx
80101d0f:	5e                   	pop    %esi
80101d10:	5f                   	pop    %edi
80101d11:	5d                   	pop    %ebp
80101d12:	c3                   	ret    
80101d13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d17:	90                   	nop
      if(poff)
80101d18:	8b 45 10             	mov    0x10(%ebp),%eax
80101d1b:	85 c0                	test   %eax,%eax
80101d1d:	74 05                	je     80101d24 <dirlookup+0x84>
        *poff = off;
80101d1f:	8b 45 10             	mov    0x10(%ebp),%eax
80101d22:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101d24:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101d28:	8b 03                	mov    (%ebx),%eax
80101d2a:	e8 81 f5 ff ff       	call   801012b0 <iget>
}
80101d2f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d32:	5b                   	pop    %ebx
80101d33:	5e                   	pop    %esi
80101d34:	5f                   	pop    %edi
80101d35:	5d                   	pop    %ebp
80101d36:	c3                   	ret    
      panic("dirlink read");
80101d37:	83 ec 0c             	sub    $0xc,%esp
80101d3a:	68 35 71 10 80       	push   $0x80107135
80101d3f:	e8 3c e6 ff ff       	call   80100380 <panic>
    panic("dirlookup not DIR");
80101d44:	83 ec 0c             	sub    $0xc,%esp
80101d47:	68 23 71 10 80       	push   $0x80107123
80101d4c:	e8 2f e6 ff ff       	call   80100380 <panic>
80101d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101d58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101d5f:	90                   	nop

80101d60 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101d60:	55                   	push   %ebp
80101d61:	89 e5                	mov    %esp,%ebp
80101d63:	57                   	push   %edi
80101d64:	56                   	push   %esi
80101d65:	53                   	push   %ebx
80101d66:	89 c3                	mov    %eax,%ebx
80101d68:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101d6b:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101d6e:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101d71:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  if(*path == '/')
80101d74:	0f 84 86 01 00 00    	je     80101f00 <namex+0x1a0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101d7a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  acquire(&icache.lock);
80101d80:	83 ec 0c             	sub    $0xc,%esp
80101d83:	89 df                	mov    %ebx,%edi
    ip = idup(proc->cwd);
80101d85:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101d88:	68 c0 01 11 80       	push   $0x801101c0
80101d8d:	e8 ae 25 00 00       	call   80104340 <acquire>
  ip->ref++;
80101d92:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101d96:	c7 04 24 c0 01 11 80 	movl   $0x801101c0,(%esp)
80101d9d:	e8 7e 27 00 00       	call   80104520 <release>
80101da2:	83 c4 10             	add    $0x10,%esp
80101da5:	eb 0c                	jmp    80101db3 <namex+0x53>
80101da7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101dae:	66 90                	xchg   %ax,%ax
    path++;
80101db0:	83 c7 01             	add    $0x1,%edi
  while(*path == '/')
80101db3:	0f b6 07             	movzbl (%edi),%eax
80101db6:	3c 2f                	cmp    $0x2f,%al
80101db8:	74 f6                	je     80101db0 <namex+0x50>
  if(*path == 0)
80101dba:	84 c0                	test   %al,%al
80101dbc:	0f 84 ee 00 00 00    	je     80101eb0 <namex+0x150>
  while(*path != '/' && *path != 0)
80101dc2:	0f b6 07             	movzbl (%edi),%eax
80101dc5:	84 c0                	test   %al,%al
80101dc7:	0f 84 fb 00 00 00    	je     80101ec8 <namex+0x168>
80101dcd:	89 fb                	mov    %edi,%ebx
80101dcf:	3c 2f                	cmp    $0x2f,%al
80101dd1:	0f 84 f1 00 00 00    	je     80101ec8 <namex+0x168>
80101dd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101dde:	66 90                	xchg   %ax,%ax
80101de0:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    path++;
80101de4:	83 c3 01             	add    $0x1,%ebx
  while(*path != '/' && *path != 0)
80101de7:	3c 2f                	cmp    $0x2f,%al
80101de9:	74 04                	je     80101def <namex+0x8f>
80101deb:	84 c0                	test   %al,%al
80101ded:	75 f1                	jne    80101de0 <namex+0x80>
  len = path - s;
80101def:	89 d8                	mov    %ebx,%eax
80101df1:	29 f8                	sub    %edi,%eax
  if(len >= DIRSIZ)
80101df3:	83 f8 0d             	cmp    $0xd,%eax
80101df6:	0f 8e 84 00 00 00    	jle    80101e80 <namex+0x120>
    memmove(name, s, DIRSIZ);
80101dfc:	83 ec 04             	sub    $0x4,%esp
80101dff:	6a 0e                	push   $0xe
80101e01:	57                   	push   %edi
    path++;
80101e02:	89 df                	mov    %ebx,%edi
    memmove(name, s, DIRSIZ);
80101e04:	ff 75 e4             	pushl  -0x1c(%ebp)
80101e07:	e8 04 28 00 00       	call   80104610 <memmove>
80101e0c:	83 c4 10             	add    $0x10,%esp
  while(*path == '/')
80101e0f:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101e12:	75 0c                	jne    80101e20 <namex+0xc0>
80101e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101e18:	83 c7 01             	add    $0x1,%edi
  while(*path == '/')
80101e1b:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101e1e:	74 f8                	je     80101e18 <namex+0xb8>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101e20:	83 ec 0c             	sub    $0xc,%esp
80101e23:	56                   	push   %esi
80101e24:	e8 e7 f8 ff ff       	call   80101710 <ilock>
    if(ip->type != T_DIR){
80101e29:	83 c4 10             	add    $0x10,%esp
80101e2c:	66 83 7e 10 01       	cmpw   $0x1,0x10(%esi)
80101e31:	0f 85 a1 00 00 00    	jne    80101ed8 <namex+0x178>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101e37:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101e3a:	85 d2                	test   %edx,%edx
80101e3c:	74 09                	je     80101e47 <namex+0xe7>
80101e3e:	80 3f 00             	cmpb   $0x0,(%edi)
80101e41:	0f 84 d9 00 00 00    	je     80101f20 <namex+0x1c0>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101e47:	83 ec 04             	sub    $0x4,%esp
80101e4a:	6a 00                	push   $0x0
80101e4c:	ff 75 e4             	pushl  -0x1c(%ebp)
80101e4f:	56                   	push   %esi
80101e50:	e8 4b fe ff ff       	call   80101ca0 <dirlookup>
80101e55:	83 c4 10             	add    $0x10,%esp
80101e58:	89 c3                	mov    %eax,%ebx
80101e5a:	85 c0                	test   %eax,%eax
80101e5c:	74 7a                	je     80101ed8 <namex+0x178>
  iunlock(ip);
80101e5e:	83 ec 0c             	sub    $0xc,%esp
80101e61:	56                   	push   %esi
80101e62:	e8 b9 f9 ff ff       	call   80101820 <iunlock>
  iput(ip);
80101e67:	89 34 24             	mov    %esi,(%esp)
80101e6a:	89 de                	mov    %ebx,%esi
80101e6c:	e8 0f fa ff ff       	call   80101880 <iput>
80101e71:	83 c4 10             	add    $0x10,%esp
80101e74:	e9 3a ff ff ff       	jmp    80101db3 <namex+0x53>
80101e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e80:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101e83:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
80101e86:	89 4d dc             	mov    %ecx,-0x24(%ebp)
    memmove(name, s, len);
80101e89:	83 ec 04             	sub    $0x4,%esp
80101e8c:	50                   	push   %eax
80101e8d:	57                   	push   %edi
    name[len] = 0;
80101e8e:	89 df                	mov    %ebx,%edi
    memmove(name, s, len);
80101e90:	ff 75 e4             	pushl  -0x1c(%ebp)
80101e93:	e8 78 27 00 00       	call   80104610 <memmove>
    name[len] = 0;
80101e98:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101e9b:	83 c4 10             	add    $0x10,%esp
80101e9e:	c6 00 00             	movb   $0x0,(%eax)
80101ea1:	e9 69 ff ff ff       	jmp    80101e0f <namex+0xaf>
80101ea6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ead:	8d 76 00             	lea    0x0(%esi),%esi
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101eb0:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101eb3:	85 c0                	test   %eax,%eax
80101eb5:	0f 85 85 00 00 00    	jne    80101f40 <namex+0x1e0>
    iput(ip);
    return 0;
  }
  return ip;
}
80101ebb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ebe:	89 f0                	mov    %esi,%eax
80101ec0:	5b                   	pop    %ebx
80101ec1:	5e                   	pop    %esi
80101ec2:	5f                   	pop    %edi
80101ec3:	5d                   	pop    %ebp
80101ec4:	c3                   	ret    
80101ec5:	8d 76 00             	lea    0x0(%esi),%esi
  while(*path != '/' && *path != 0)
80101ec8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101ecb:	89 fb                	mov    %edi,%ebx
80101ecd:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101ed0:	31 c0                	xor    %eax,%eax
80101ed2:	eb b5                	jmp    80101e89 <namex+0x129>
80101ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  iunlock(ip);
80101ed8:	83 ec 0c             	sub    $0xc,%esp
80101edb:	56                   	push   %esi
80101edc:	e8 3f f9 ff ff       	call   80101820 <iunlock>
  iput(ip);
80101ee1:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101ee4:	31 f6                	xor    %esi,%esi
  iput(ip);
80101ee6:	e8 95 f9 ff ff       	call   80101880 <iput>
      return 0;
80101eeb:	83 c4 10             	add    $0x10,%esp
}
80101eee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ef1:	89 f0                	mov    %esi,%eax
80101ef3:	5b                   	pop    %ebx
80101ef4:	5e                   	pop    %esi
80101ef5:	5f                   	pop    %edi
80101ef6:	5d                   	pop    %ebp
80101ef7:	c3                   	ret    
80101ef8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101eff:	90                   	nop
    ip = iget(ROOTDEV, ROOTINO);
80101f00:	ba 01 00 00 00       	mov    $0x1,%edx
80101f05:	b8 01 00 00 00       	mov    $0x1,%eax
80101f0a:	89 df                	mov    %ebx,%edi
80101f0c:	e8 9f f3 ff ff       	call   801012b0 <iget>
80101f11:	89 c6                	mov    %eax,%esi
80101f13:	e9 9b fe ff ff       	jmp    80101db3 <namex+0x53>
80101f18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f1f:	90                   	nop
      iunlock(ip);
80101f20:	83 ec 0c             	sub    $0xc,%esp
80101f23:	56                   	push   %esi
80101f24:	e8 f7 f8 ff ff       	call   80101820 <iunlock>
      return ip;
80101f29:	83 c4 10             	add    $0x10,%esp
}
80101f2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f2f:	89 f0                	mov    %esi,%eax
80101f31:	5b                   	pop    %ebx
80101f32:	5e                   	pop    %esi
80101f33:	5f                   	pop    %edi
80101f34:	5d                   	pop    %ebp
80101f35:	c3                   	ret    
80101f36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f3d:	8d 76 00             	lea    0x0(%esi),%esi
    iput(ip);
80101f40:	83 ec 0c             	sub    $0xc,%esp
80101f43:	56                   	push   %esi
    return 0;
80101f44:	31 f6                	xor    %esi,%esi
    iput(ip);
80101f46:	e8 35 f9 ff ff       	call   80101880 <iput>
    return 0;
80101f4b:	83 c4 10             	add    $0x10,%esp
80101f4e:	e9 68 ff ff ff       	jmp    80101ebb <namex+0x15b>
80101f53:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101f60 <dirlink>:
{
80101f60:	f3 0f 1e fb          	endbr32 
80101f64:	55                   	push   %ebp
80101f65:	89 e5                	mov    %esp,%ebp
80101f67:	57                   	push   %edi
80101f68:	56                   	push   %esi
80101f69:	53                   	push   %ebx
80101f6a:	83 ec 20             	sub    $0x20,%esp
80101f6d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101f70:	6a 00                	push   $0x0
80101f72:	ff 75 0c             	pushl  0xc(%ebp)
80101f75:	53                   	push   %ebx
80101f76:	e8 25 fd ff ff       	call   80101ca0 <dirlookup>
80101f7b:	83 c4 10             	add    $0x10,%esp
80101f7e:	85 c0                	test   %eax,%eax
80101f80:	75 6b                	jne    80101fed <dirlink+0x8d>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101f82:	8b 7b 18             	mov    0x18(%ebx),%edi
80101f85:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101f88:	85 ff                	test   %edi,%edi
80101f8a:	74 2d                	je     80101fb9 <dirlink+0x59>
80101f8c:	31 ff                	xor    %edi,%edi
80101f8e:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101f91:	eb 0d                	jmp    80101fa0 <dirlink+0x40>
80101f93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f97:	90                   	nop
80101f98:	83 c7 10             	add    $0x10,%edi
80101f9b:	3b 7b 18             	cmp    0x18(%ebx),%edi
80101f9e:	73 19                	jae    80101fb9 <dirlink+0x59>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101fa0:	6a 10                	push   $0x10
80101fa2:	57                   	push   %edi
80101fa3:	56                   	push   %esi
80101fa4:	53                   	push   %ebx
80101fa5:	e8 a6 fa ff ff       	call   80101a50 <readi>
80101faa:	83 c4 10             	add    $0x10,%esp
80101fad:	83 f8 10             	cmp    $0x10,%eax
80101fb0:	75 4e                	jne    80102000 <dirlink+0xa0>
    if(de.inum == 0)
80101fb2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101fb7:	75 df                	jne    80101f98 <dirlink+0x38>
  strncpy(de.name, name, DIRSIZ);
80101fb9:	83 ec 04             	sub    $0x4,%esp
80101fbc:	8d 45 da             	lea    -0x26(%ebp),%eax
80101fbf:	6a 0e                	push   $0xe
80101fc1:	ff 75 0c             	pushl  0xc(%ebp)
80101fc4:	50                   	push   %eax
80101fc5:	e8 06 27 00 00       	call   801046d0 <strncpy>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101fca:	6a 10                	push   $0x10
  de.inum = inum;
80101fcc:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101fcf:	57                   	push   %edi
80101fd0:	56                   	push   %esi
80101fd1:	53                   	push   %ebx
  de.inum = inum;
80101fd2:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101fd6:	e8 75 fb ff ff       	call   80101b50 <writei>
80101fdb:	83 c4 20             	add    $0x20,%esp
80101fde:	83 f8 10             	cmp    $0x10,%eax
80101fe1:	75 2a                	jne    8010200d <dirlink+0xad>
  return 0;
80101fe3:	31 c0                	xor    %eax,%eax
}
80101fe5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fe8:	5b                   	pop    %ebx
80101fe9:	5e                   	pop    %esi
80101fea:	5f                   	pop    %edi
80101feb:	5d                   	pop    %ebp
80101fec:	c3                   	ret    
    iput(ip);
80101fed:	83 ec 0c             	sub    $0xc,%esp
80101ff0:	50                   	push   %eax
80101ff1:	e8 8a f8 ff ff       	call   80101880 <iput>
    return -1;
80101ff6:	83 c4 10             	add    $0x10,%esp
80101ff9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ffe:	eb e5                	jmp    80101fe5 <dirlink+0x85>
      panic("dirlink read");
80102000:	83 ec 0c             	sub    $0xc,%esp
80102003:	68 35 71 10 80       	push   $0x80107135
80102008:	e8 73 e3 ff ff       	call   80100380 <panic>
    panic("dirlink");
8010200d:	83 ec 0c             	sub    $0xc,%esp
80102010:	68 fe 76 10 80       	push   $0x801076fe
80102015:	e8 66 e3 ff ff       	call   80100380 <panic>
8010201a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102020 <namei>:

struct inode*
namei(char *path)
{
80102020:	f3 0f 1e fb          	endbr32 
80102024:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80102025:	31 d2                	xor    %edx,%edx
{
80102027:	89 e5                	mov    %esp,%ebp
80102029:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
8010202c:	8b 45 08             	mov    0x8(%ebp),%eax
8010202f:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80102032:	e8 29 fd ff ff       	call   80101d60 <namex>
}
80102037:	c9                   	leave  
80102038:	c3                   	ret    
80102039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102040 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80102040:	f3 0f 1e fb          	endbr32 
80102044:	55                   	push   %ebp
  return namex(path, 1, name);
80102045:	ba 01 00 00 00       	mov    $0x1,%edx
{
8010204a:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
8010204c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010204f:	8b 45 08             	mov    0x8(%ebp),%eax
}
80102052:	5d                   	pop    %ebp
  return namex(path, 1, name);
80102053:	e9 08 fd ff ff       	jmp    80101d60 <namex>
80102058:	66 90                	xchg   %ax,%ax
8010205a:	66 90                	xchg   %ax,%ax
8010205c:	66 90                	xchg   %ax,%ax
8010205e:	66 90                	xchg   %ax,%ax

80102060 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80102060:	55                   	push   %ebp
80102061:	89 e5                	mov    %esp,%ebp
80102063:	57                   	push   %edi
80102064:	56                   	push   %esi
80102065:	53                   	push   %ebx
80102066:	83 ec 0c             	sub    $0xc,%esp
  if(b == 0)
80102069:	85 c0                	test   %eax,%eax
8010206b:	0f 84 b4 00 00 00    	je     80102125 <idestart+0xc5>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80102071:	8b 70 08             	mov    0x8(%eax),%esi
80102074:	89 c3                	mov    %eax,%ebx
80102076:	81 fe e7 03 00 00    	cmp    $0x3e7,%esi
8010207c:	0f 87 96 00 00 00    	ja     80102118 <idestart+0xb8>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102082:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80102087:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010208e:	66 90                	xchg   %ax,%ax
80102090:	89 ca                	mov    %ecx,%edx
80102092:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102093:	83 e0 c0             	and    $0xffffffc0,%eax
80102096:	3c 40                	cmp    $0x40,%al
80102098:	75 f6                	jne    80102090 <idestart+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010209a:	31 ff                	xor    %edi,%edi
8010209c:	ba f6 03 00 00       	mov    $0x3f6,%edx
801020a1:	89 f8                	mov    %edi,%eax
801020a3:	ee                   	out    %al,(%dx)
801020a4:	b8 01 00 00 00       	mov    $0x1,%eax
801020a9:	ba f2 01 00 00       	mov    $0x1f2,%edx
801020ae:	ee                   	out    %al,(%dx)
801020af:	ba f3 01 00 00       	mov    $0x1f3,%edx
801020b4:	89 f0                	mov    %esi,%eax
801020b6:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
801020b7:	89 f0                	mov    %esi,%eax
801020b9:	ba f4 01 00 00       	mov    $0x1f4,%edx
801020be:	c1 f8 08             	sar    $0x8,%eax
801020c1:	ee                   	out    %al,(%dx)
801020c2:	ba f5 01 00 00       	mov    $0x1f5,%edx
801020c7:	89 f8                	mov    %edi,%eax
801020c9:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
801020ca:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
801020ce:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020d3:	c1 e0 04             	shl    $0x4,%eax
801020d6:	83 e0 10             	and    $0x10,%eax
801020d9:	83 c8 e0             	or     $0xffffffe0,%eax
801020dc:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
801020dd:	f6 03 04             	testb  $0x4,(%ebx)
801020e0:	75 16                	jne    801020f8 <idestart+0x98>
801020e2:	b8 20 00 00 00       	mov    $0x20,%eax
801020e7:	89 ca                	mov    %ecx,%edx
801020e9:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
801020ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020ed:	5b                   	pop    %ebx
801020ee:	5e                   	pop    %esi
801020ef:	5f                   	pop    %edi
801020f0:	5d                   	pop    %ebp
801020f1:	c3                   	ret    
801020f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801020f8:	b8 30 00 00 00       	mov    $0x30,%eax
801020fd:	89 ca                	mov    %ecx,%edx
801020ff:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80102100:	b9 80 00 00 00       	mov    $0x80,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
80102105:	8d 73 18             	lea    0x18(%ebx),%esi
80102108:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010210d:	fc                   	cld    
8010210e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80102110:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102113:	5b                   	pop    %ebx
80102114:	5e                   	pop    %esi
80102115:	5f                   	pop    %edi
80102116:	5d                   	pop    %ebp
80102117:	c3                   	ret    
    panic("incorrect blockno");
80102118:	83 ec 0c             	sub    $0xc,%esp
8010211b:	68 a9 71 10 80       	push   $0x801071a9
80102120:	e8 5b e2 ff ff       	call   80100380 <panic>
    panic("idestart");
80102125:	83 ec 0c             	sub    $0xc,%esp
80102128:	68 a0 71 10 80       	push   $0x801071a0
8010212d:	e8 4e e2 ff ff       	call   80100380 <panic>
80102132:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102140 <ideinit>:
{
80102140:	f3 0f 1e fb          	endbr32 
80102144:	55                   	push   %ebp
80102145:	89 e5                	mov    %esp,%ebp
80102147:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
8010214a:	68 bb 71 10 80       	push   $0x801071bb
8010214f:	68 80 a5 10 80       	push   $0x8010a580
80102154:	e8 c7 21 00 00       	call   80104320 <initlock>
  picenable(IRQ_IDE);
80102159:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102160:	e8 2b 13 00 00       	call   80103490 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102165:	58                   	pop    %eax
80102166:	a1 c0 18 11 80       	mov    0x801118c0,%eax
8010216b:	5a                   	pop    %edx
8010216c:	83 e8 01             	sub    $0x1,%eax
8010216f:	50                   	push   %eax
80102170:	6a 0e                	push   $0xe
80102172:	e8 b9 02 00 00       	call   80102430 <ioapicenable>
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102177:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010217a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010217f:	90                   	nop
80102180:	ec                   	in     (%dx),%al
80102181:	83 e0 c0             	and    $0xffffffc0,%eax
80102184:	3c 40                	cmp    $0x40,%al
80102186:	75 f8                	jne    80102180 <ideinit+0x40>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102188:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010218d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102192:	ee                   	out    %al,(%dx)
80102193:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102198:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010219d:	eb 06                	jmp    801021a5 <ideinit+0x65>
8010219f:	90                   	nop
  for(i=0; i<1000; i++){
801021a0:	83 e9 01             	sub    $0x1,%ecx
801021a3:	74 0f                	je     801021b4 <ideinit+0x74>
801021a5:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
801021a6:	84 c0                	test   %al,%al
801021a8:	74 f6                	je     801021a0 <ideinit+0x60>
      havedisk1 = 1;
801021aa:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
801021b1:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801021b4:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
801021b9:	ba f6 01 00 00       	mov    $0x1f6,%edx
801021be:	ee                   	out    %al,(%dx)
}
801021bf:	c9                   	leave  
801021c0:	c3                   	ret    
801021c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021cf:	90                   	nop

801021d0 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
801021d0:	f3 0f 1e fb          	endbr32 
801021d4:	55                   	push   %ebp
801021d5:	89 e5                	mov    %esp,%ebp
801021d7:	57                   	push   %edi
801021d8:	56                   	push   %esi
801021d9:	53                   	push   %ebx
801021da:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
801021dd:	68 80 a5 10 80       	push   $0x8010a580
801021e2:	e8 59 21 00 00       	call   80104340 <acquire>
  if((b = idequeue) == 0){
801021e7:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
801021ed:	83 c4 10             	add    $0x10,%esp
801021f0:	85 db                	test   %ebx,%ebx
801021f2:	74 5f                	je     80102253 <ideintr+0x83>
    release(&idelock);
    // cprintf("spurious IDE interrupt\n");
    return;
  }
  idequeue = b->qnext;
801021f4:	8b 43 14             	mov    0x14(%ebx),%eax
801021f7:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801021fc:	8b 33                	mov    (%ebx),%esi
801021fe:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102204:	75 2b                	jne    80102231 <ideintr+0x61>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102206:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010220b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010220f:	90                   	nop
80102210:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102211:	89 c1                	mov    %eax,%ecx
80102213:	83 e1 c0             	and    $0xffffffc0,%ecx
80102216:	80 f9 40             	cmp    $0x40,%cl
80102219:	75 f5                	jne    80102210 <ideintr+0x40>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
8010221b:	a8 21                	test   $0x21,%al
8010221d:	75 12                	jne    80102231 <ideintr+0x61>
    insl(0x1f0, b->data, BSIZE/4);
8010221f:	8d 7b 18             	lea    0x18(%ebx),%edi
  asm volatile("cld; rep insl" :
80102222:	b9 80 00 00 00       	mov    $0x80,%ecx
80102227:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010222c:	fc                   	cld    
8010222d:	f3 6d                	rep insl (%dx),%es:(%edi)
8010222f:	8b 33                	mov    (%ebx),%esi

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102231:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102234:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
80102237:	83 ce 02             	or     $0x2,%esi
8010223a:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010223c:	53                   	push   %ebx
8010223d:	e8 1e 1f 00 00       	call   80104160 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102242:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102247:	83 c4 10             	add    $0x10,%esp
8010224a:	85 c0                	test   %eax,%eax
8010224c:	74 05                	je     80102253 <ideintr+0x83>
    idestart(idequeue);
8010224e:	e8 0d fe ff ff       	call   80102060 <idestart>
    release(&idelock);
80102253:	83 ec 0c             	sub    $0xc,%esp
80102256:	68 80 a5 10 80       	push   $0x8010a580
8010225b:	e8 c0 22 00 00       	call   80104520 <release>

  release(&idelock);
}
80102260:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102263:	5b                   	pop    %ebx
80102264:	5e                   	pop    %esi
80102265:	5f                   	pop    %edi
80102266:	5d                   	pop    %ebp
80102267:	c3                   	ret    
80102268:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010226f:	90                   	nop

80102270 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102270:	f3 0f 1e fb          	endbr32 
80102274:	55                   	push   %ebp
80102275:	89 e5                	mov    %esp,%ebp
80102277:	53                   	push   %ebx
80102278:	83 ec 04             	sub    $0x4,%esp
8010227b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!(b->flags & B_BUSY))
8010227e:	8b 03                	mov    (%ebx),%eax
80102280:	a8 01                	test   $0x1,%al
80102282:	0f 84 c9 00 00 00    	je     80102351 <iderw+0xe1>
    panic("iderw: buf not busy");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
80102288:	83 e0 06             	and    $0x6,%eax
8010228b:	83 f8 02             	cmp    $0x2,%eax
8010228e:	0f 84 b0 00 00 00    	je     80102344 <iderw+0xd4>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
80102294:	8b 53 04             	mov    0x4(%ebx),%edx
80102297:	85 d2                	test   %edx,%edx
80102299:	74 0d                	je     801022a8 <iderw+0x38>
8010229b:	a1 60 a5 10 80       	mov    0x8010a560,%eax
801022a0:	85 c0                	test   %eax,%eax
801022a2:	0f 84 8f 00 00 00    	je     80102337 <iderw+0xc7>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
801022a8:	83 ec 0c             	sub    $0xc,%esp
801022ab:	68 80 a5 10 80       	push   $0x8010a580
801022b0:	e8 8b 20 00 00       	call   80104340 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801022b5:	a1 64 a5 10 80       	mov    0x8010a564,%eax
  b->qnext = 0;
801022ba:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801022c1:	83 c4 10             	add    $0x10,%esp
801022c4:	85 c0                	test   %eax,%eax
801022c6:	74 68                	je     80102330 <iderw+0xc0>
801022c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801022cf:	90                   	nop
801022d0:	89 c2                	mov    %eax,%edx
801022d2:	8b 40 14             	mov    0x14(%eax),%eax
801022d5:	85 c0                	test   %eax,%eax
801022d7:	75 f7                	jne    801022d0 <iderw+0x60>
801022d9:	83 c2 14             	add    $0x14,%edx
    ;
  *pp = b;
801022dc:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
801022de:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
801022e4:	74 3a                	je     80102320 <iderw+0xb0>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801022e6:	8b 03                	mov    (%ebx),%eax
801022e8:	83 e0 06             	and    $0x6,%eax
801022eb:	83 f8 02             	cmp    $0x2,%eax
801022ee:	74 1b                	je     8010230b <iderw+0x9b>
    sleep(b, &idelock);
801022f0:	83 ec 08             	sub    $0x8,%esp
801022f3:	68 80 a5 10 80       	push   $0x8010a580
801022f8:	53                   	push   %ebx
801022f9:	e8 a2 1c 00 00       	call   80103fa0 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801022fe:	8b 03                	mov    (%ebx),%eax
80102300:	83 c4 10             	add    $0x10,%esp
80102303:	83 e0 06             	and    $0x6,%eax
80102306:	83 f8 02             	cmp    $0x2,%eax
80102309:	75 e5                	jne    801022f0 <iderw+0x80>
  }

  release(&idelock);
8010230b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
80102312:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102315:	c9                   	leave  
  release(&idelock);
80102316:	e9 05 22 00 00       	jmp    80104520 <release>
8010231b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010231f:	90                   	nop
    idestart(b);
80102320:	89 d8                	mov    %ebx,%eax
80102322:	e8 39 fd ff ff       	call   80102060 <idestart>
80102327:	eb bd                	jmp    801022e6 <iderw+0x76>
80102329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102330:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102335:	eb a5                	jmp    801022dc <iderw+0x6c>
    panic("iderw: ide disk 1 not present");
80102337:	83 ec 0c             	sub    $0xc,%esp
8010233a:	68 e8 71 10 80       	push   $0x801071e8
8010233f:	e8 3c e0 ff ff       	call   80100380 <panic>
    panic("iderw: nothing to do");
80102344:	83 ec 0c             	sub    $0xc,%esp
80102347:	68 d3 71 10 80       	push   $0x801071d3
8010234c:	e8 2f e0 ff ff       	call   80100380 <panic>
    panic("iderw: buf not busy");
80102351:	83 ec 0c             	sub    $0xc,%esp
80102354:	68 bf 71 10 80       	push   $0x801071bf
80102359:	e8 22 e0 ff ff       	call   80100380 <panic>
8010235e:	66 90                	xchg   %ax,%ax

80102360 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102360:	f3 0f 1e fb          	endbr32 
  int i, id, maxintr;

  if(!ismp)
80102364:	a1 c4 12 11 80       	mov    0x801112c4,%eax
80102369:	85 c0                	test   %eax,%eax
8010236b:	0f 84 af 00 00 00    	je     80102420 <ioapicinit+0xc0>
{
80102371:	55                   	push   %ebp
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102372:	c7 05 94 11 11 80 00 	movl   $0xfec00000,0x80111194
80102379:	00 c0 fe 
{
8010237c:	89 e5                	mov    %esp,%ebp
8010237e:	56                   	push   %esi
8010237f:	53                   	push   %ebx
  ioapic->reg = reg;
80102380:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102387:	00 00 00 
  return ioapic->data;
8010238a:	8b 15 94 11 11 80    	mov    0x80111194,%edx
80102390:	8b 72 10             	mov    0x10(%edx),%esi
  ioapic->reg = reg;
80102393:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
80102399:	8b 0d 94 11 11 80    	mov    0x80111194,%ecx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010239f:	0f b6 15 c0 12 11 80 	movzbl 0x801112c0,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
801023a6:	c1 ee 10             	shr    $0x10,%esi
801023a9:	89 f0                	mov    %esi,%eax
801023ab:	0f b6 f0             	movzbl %al,%esi
  return ioapic->data;
801023ae:	8b 41 10             	mov    0x10(%ecx),%eax
  id = ioapicread(REG_ID) >> 24;
801023b1:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
801023b4:	39 c2                	cmp    %eax,%edx
801023b6:	75 48                	jne    80102400 <ioapicinit+0xa0>
801023b8:	83 c6 21             	add    $0x21,%esi
{
801023bb:	ba 10 00 00 00       	mov    $0x10,%edx
801023c0:	b8 20 00 00 00       	mov    $0x20,%eax
801023c5:	8d 76 00             	lea    0x0(%esi),%esi
  ioapic->reg = reg;
801023c8:	89 11                	mov    %edx,(%ecx)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
801023ca:	89 c3                	mov    %eax,%ebx
  ioapic->data = data;
801023cc:	8b 0d 94 11 11 80    	mov    0x80111194,%ecx
801023d2:	83 c0 01             	add    $0x1,%eax
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
801023d5:	81 cb 00 00 01 00    	or     $0x10000,%ebx
  ioapic->data = data;
801023db:	89 59 10             	mov    %ebx,0x10(%ecx)
  ioapic->reg = reg;
801023de:	8d 5a 01             	lea    0x1(%edx),%ebx
801023e1:	83 c2 02             	add    $0x2,%edx
801023e4:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
801023e6:	8b 0d 94 11 11 80    	mov    0x80111194,%ecx
801023ec:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  for(i = 0; i <= maxintr; i++){
801023f3:	39 f0                	cmp    %esi,%eax
801023f5:	75 d1                	jne    801023c8 <ioapicinit+0x68>
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801023f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023fa:	5b                   	pop    %ebx
801023fb:	5e                   	pop    %esi
801023fc:	5d                   	pop    %ebp
801023fd:	c3                   	ret    
801023fe:	66 90                	xchg   %ax,%ax
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102400:	83 ec 0c             	sub    $0xc,%esp
80102403:	68 08 72 10 80       	push   $0x80107208
80102408:	e8 93 e2 ff ff       	call   801006a0 <cprintf>
8010240d:	8b 0d 94 11 11 80    	mov    0x80111194,%ecx
80102413:	83 c4 10             	add    $0x10,%esp
80102416:	eb a0                	jmp    801023b8 <ioapicinit+0x58>
80102418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010241f:	90                   	nop
80102420:	c3                   	ret    
80102421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102428:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010242f:	90                   	nop

80102430 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
80102430:	f3 0f 1e fb          	endbr32 
80102434:	55                   	push   %ebp
  if(!ismp)
80102435:	8b 15 c4 12 11 80    	mov    0x801112c4,%edx
{
8010243b:	89 e5                	mov    %esp,%ebp
8010243d:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!ismp)
80102440:	85 d2                	test   %edx,%edx
80102442:	74 2b                	je     8010246f <ioapicenable+0x3f>
  ioapic->reg = reg;
80102444:	8b 0d 94 11 11 80    	mov    0x80111194,%ecx
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
8010244a:	8d 50 20             	lea    0x20(%eax),%edx
8010244d:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
  ioapic->reg = reg;
80102451:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102453:	8b 0d 94 11 11 80    	mov    0x80111194,%ecx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102459:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
8010245c:	89 51 10             	mov    %edx,0x10(%ecx)
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010245f:	8b 55 0c             	mov    0xc(%ebp),%edx
  ioapic->reg = reg;
80102462:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102464:	a1 94 11 11 80       	mov    0x80111194,%eax
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102469:	c1 e2 18             	shl    $0x18,%edx
  ioapic->data = data;
8010246c:	89 50 10             	mov    %edx,0x10(%eax)
}
8010246f:	5d                   	pop    %ebp
80102470:	c3                   	ret    
80102471:	66 90                	xchg   %ax,%ax
80102473:	66 90                	xchg   %ax,%ax
80102475:	66 90                	xchg   %ax,%ax
80102477:	66 90                	xchg   %ax,%ax
80102479:	66 90                	xchg   %ax,%ax
8010247b:	66 90                	xchg   %ax,%ax
8010247d:	66 90                	xchg   %ax,%ax
8010247f:	90                   	nop

80102480 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102480:	f3 0f 1e fb          	endbr32 
80102484:	55                   	push   %ebp
80102485:	89 e5                	mov    %esp,%ebp
80102487:	53                   	push   %ebx
80102488:	83 ec 04             	sub    $0x4,%esp
8010248b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010248e:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102494:	75 7a                	jne    80102510 <kfree+0x90>
80102496:	81 fb 68 40 11 80    	cmp    $0x80114068,%ebx
8010249c:	72 72                	jb     80102510 <kfree+0x90>
8010249e:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801024a4:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801024a9:	77 65                	ja     80102510 <kfree+0x90>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
801024ab:	83 ec 04             	sub    $0x4,%esp
801024ae:	68 00 10 00 00       	push   $0x1000
801024b3:	6a 01                	push   $0x1
801024b5:	53                   	push   %ebx
801024b6:	e8 b5 20 00 00       	call   80104570 <memset>

  if(kmem.use_lock)
801024bb:	8b 15 d4 11 11 80    	mov    0x801111d4,%edx
801024c1:	83 c4 10             	add    $0x10,%esp
801024c4:	85 d2                	test   %edx,%edx
801024c6:	75 20                	jne    801024e8 <kfree+0x68>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
801024c8:	a1 d8 11 11 80       	mov    0x801111d8,%eax
801024cd:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
801024cf:	a1 d4 11 11 80       	mov    0x801111d4,%eax
  kmem.freelist = r;
801024d4:	89 1d d8 11 11 80    	mov    %ebx,0x801111d8
  if(kmem.use_lock)
801024da:	85 c0                	test   %eax,%eax
801024dc:	75 22                	jne    80102500 <kfree+0x80>
    release(&kmem.lock);
}
801024de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024e1:	c9                   	leave  
801024e2:	c3                   	ret    
801024e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024e7:	90                   	nop
    acquire(&kmem.lock);
801024e8:	83 ec 0c             	sub    $0xc,%esp
801024eb:	68 a0 11 11 80       	push   $0x801111a0
801024f0:	e8 4b 1e 00 00       	call   80104340 <acquire>
801024f5:	83 c4 10             	add    $0x10,%esp
801024f8:	eb ce                	jmp    801024c8 <kfree+0x48>
801024fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    release(&kmem.lock);
80102500:	c7 45 08 a0 11 11 80 	movl   $0x801111a0,0x8(%ebp)
}
80102507:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010250a:	c9                   	leave  
    release(&kmem.lock);
8010250b:	e9 10 20 00 00       	jmp    80104520 <release>
    panic("kfree");
80102510:	83 ec 0c             	sub    $0xc,%esp
80102513:	68 3a 72 10 80       	push   $0x8010723a
80102518:	e8 63 de ff ff       	call   80100380 <panic>
8010251d:	8d 76 00             	lea    0x0(%esi),%esi

80102520 <freerange>:
{
80102520:	f3 0f 1e fb          	endbr32 
80102524:	55                   	push   %ebp
80102525:	89 e5                	mov    %esp,%ebp
80102527:	56                   	push   %esi
  p = (char*)PGROUNDUP((uint)vstart);
80102528:	8b 45 08             	mov    0x8(%ebp),%eax
{
8010252b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010252e:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
8010252f:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102535:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010253b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102541:	39 de                	cmp    %ebx,%esi
80102543:	72 1f                	jb     80102564 <freerange+0x44>
80102545:	8d 76 00             	lea    0x0(%esi),%esi
    kfree(p);
80102548:	83 ec 0c             	sub    $0xc,%esp
8010254b:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102551:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102557:	50                   	push   %eax
80102558:	e8 23 ff ff ff       	call   80102480 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010255d:	83 c4 10             	add    $0x10,%esp
80102560:	39 f3                	cmp    %esi,%ebx
80102562:	76 e4                	jbe    80102548 <freerange+0x28>
}
80102564:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102567:	5b                   	pop    %ebx
80102568:	5e                   	pop    %esi
80102569:	5d                   	pop    %ebp
8010256a:	c3                   	ret    
8010256b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010256f:	90                   	nop

80102570 <kinit1>:
{
80102570:	f3 0f 1e fb          	endbr32 
80102574:	55                   	push   %ebp
80102575:	89 e5                	mov    %esp,%ebp
80102577:	56                   	push   %esi
80102578:	53                   	push   %ebx
80102579:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
8010257c:	83 ec 08             	sub    $0x8,%esp
8010257f:	68 40 72 10 80       	push   $0x80107240
80102584:	68 a0 11 11 80       	push   $0x801111a0
80102589:	e8 92 1d 00 00       	call   80104320 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
8010258e:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102591:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
80102594:	c7 05 d4 11 11 80 00 	movl   $0x0,0x801111d4
8010259b:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
8010259e:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801025a4:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025aa:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025b0:	39 de                	cmp    %ebx,%esi
801025b2:	72 20                	jb     801025d4 <kinit1+0x64>
801025b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
801025b8:	83 ec 0c             	sub    $0xc,%esp
801025bb:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025c1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801025c7:	50                   	push   %eax
801025c8:	e8 b3 fe ff ff       	call   80102480 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025cd:	83 c4 10             	add    $0x10,%esp
801025d0:	39 de                	cmp    %ebx,%esi
801025d2:	73 e4                	jae    801025b8 <kinit1+0x48>
}
801025d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801025d7:	5b                   	pop    %ebx
801025d8:	5e                   	pop    %esi
801025d9:	5d                   	pop    %ebp
801025da:	c3                   	ret    
801025db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025df:	90                   	nop

801025e0 <kinit2>:
{
801025e0:	f3 0f 1e fb          	endbr32 
801025e4:	55                   	push   %ebp
801025e5:	89 e5                	mov    %esp,%ebp
801025e7:	56                   	push   %esi
  p = (char*)PGROUNDUP((uint)vstart);
801025e8:	8b 45 08             	mov    0x8(%ebp),%eax
{
801025eb:	8b 75 0c             	mov    0xc(%ebp),%esi
801025ee:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
801025ef:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801025f5:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025fb:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102601:	39 de                	cmp    %ebx,%esi
80102603:	72 1f                	jb     80102624 <kinit2+0x44>
80102605:	8d 76 00             	lea    0x0(%esi),%esi
    kfree(p);
80102608:	83 ec 0c             	sub    $0xc,%esp
8010260b:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102611:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102617:	50                   	push   %eax
80102618:	e8 63 fe ff ff       	call   80102480 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010261d:	83 c4 10             	add    $0x10,%esp
80102620:	39 de                	cmp    %ebx,%esi
80102622:	73 e4                	jae    80102608 <kinit2+0x28>
  kmem.use_lock = 1;
80102624:	c7 05 d4 11 11 80 01 	movl   $0x1,0x801111d4
8010262b:	00 00 00 
}
8010262e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102631:	5b                   	pop    %ebx
80102632:	5e                   	pop    %esi
80102633:	5d                   	pop    %ebp
80102634:	c3                   	ret    
80102635:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010263c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102640 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102640:	f3 0f 1e fb          	endbr32 
  struct run *r;

  if(kmem.use_lock)
80102644:	a1 d4 11 11 80       	mov    0x801111d4,%eax
80102649:	85 c0                	test   %eax,%eax
8010264b:	75 1b                	jne    80102668 <kalloc+0x28>
    acquire(&kmem.lock);
  r = kmem.freelist;
8010264d:	a1 d8 11 11 80       	mov    0x801111d8,%eax
  if(r)
80102652:	85 c0                	test   %eax,%eax
80102654:	74 0a                	je     80102660 <kalloc+0x20>
    kmem.freelist = r->next;
80102656:	8b 10                	mov    (%eax),%edx
80102658:	89 15 d8 11 11 80    	mov    %edx,0x801111d8
  if(kmem.use_lock)
8010265e:	c3                   	ret    
8010265f:	90                   	nop
    release(&kmem.lock);
  return (char*)r;
}
80102660:	c3                   	ret    
80102661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
80102668:	55                   	push   %ebp
80102669:	89 e5                	mov    %esp,%ebp
8010266b:	83 ec 24             	sub    $0x24,%esp
    acquire(&kmem.lock);
8010266e:	68 a0 11 11 80       	push   $0x801111a0
80102673:	e8 c8 1c 00 00       	call   80104340 <acquire>
  r = kmem.freelist;
80102678:	a1 d8 11 11 80       	mov    0x801111d8,%eax
  if(r)
8010267d:	8b 15 d4 11 11 80    	mov    0x801111d4,%edx
80102683:	83 c4 10             	add    $0x10,%esp
80102686:	85 c0                	test   %eax,%eax
80102688:	74 08                	je     80102692 <kalloc+0x52>
    kmem.freelist = r->next;
8010268a:	8b 08                	mov    (%eax),%ecx
8010268c:	89 0d d8 11 11 80    	mov    %ecx,0x801111d8
  if(kmem.use_lock)
80102692:	85 d2                	test   %edx,%edx
80102694:	74 16                	je     801026ac <kalloc+0x6c>
    release(&kmem.lock);
80102696:	83 ec 0c             	sub    $0xc,%esp
80102699:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010269c:	68 a0 11 11 80       	push   $0x801111a0
801026a1:	e8 7a 1e 00 00       	call   80104520 <release>
  return (char*)r;
801026a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    release(&kmem.lock);
801026a9:	83 c4 10             	add    $0x10,%esp
}
801026ac:	c9                   	leave  
801026ad:	c3                   	ret    
801026ae:	66 90                	xchg   %ax,%ax

801026b0 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
801026b0:	f3 0f 1e fb          	endbr32 
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801026b4:	ba 64 00 00 00       	mov    $0x64,%edx
801026b9:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
801026ba:	a8 01                	test   $0x1,%al
801026bc:	0f 84 be 00 00 00    	je     80102780 <kbdgetc+0xd0>
{
801026c2:	55                   	push   %ebp
801026c3:	ba 60 00 00 00       	mov    $0x60,%edx
801026c8:	89 e5                	mov    %esp,%ebp
801026ca:	53                   	push   %ebx
801026cb:	ec                   	in     (%dx),%al
  return data;
801026cc:	8b 1d b4 a5 10 80    	mov    0x8010a5b4,%ebx
    return -1;
  data = inb(KBDATAP);
801026d2:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
801026d5:	3c e0                	cmp    $0xe0,%al
801026d7:	74 57                	je     80102730 <kbdgetc+0x80>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801026d9:	89 d9                	mov    %ebx,%ecx
801026db:	83 e1 40             	and    $0x40,%ecx
801026de:	84 c0                	test   %al,%al
801026e0:	78 5e                	js     80102740 <kbdgetc+0x90>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
801026e2:	85 c9                	test   %ecx,%ecx
801026e4:	74 09                	je     801026ef <kbdgetc+0x3f>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
801026e6:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
801026e9:	83 e3 bf             	and    $0xffffffbf,%ebx
    data |= 0x80;
801026ec:	0f b6 d0             	movzbl %al,%edx
  }

  shift |= shiftcode[data];
801026ef:	0f b6 8a 80 73 10 80 	movzbl -0x7fef8c80(%edx),%ecx
  shift ^= togglecode[data];
801026f6:	0f b6 82 80 72 10 80 	movzbl -0x7fef8d80(%edx),%eax
  shift |= shiftcode[data];
801026fd:	09 d9                	or     %ebx,%ecx
  shift ^= togglecode[data];
801026ff:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102701:	89 c8                	mov    %ecx,%eax
  shift ^= togglecode[data];
80102703:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
80102709:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
8010270c:	83 e1 08             	and    $0x8,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
8010270f:	8b 04 85 60 72 10 80 	mov    -0x7fef8da0(,%eax,4),%eax
80102716:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
8010271a:	74 0b                	je     80102727 <kbdgetc+0x77>
    if('a' <= c && c <= 'z')
8010271c:	8d 50 9f             	lea    -0x61(%eax),%edx
8010271f:	83 fa 19             	cmp    $0x19,%edx
80102722:	77 44                	ja     80102768 <kbdgetc+0xb8>
      c += 'A' - 'a';
80102724:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102727:	5b                   	pop    %ebx
80102728:	5d                   	pop    %ebp
80102729:	c3                   	ret    
8010272a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    shift |= E0ESC;
80102730:	83 cb 40             	or     $0x40,%ebx
    return 0;
80102733:	31 c0                	xor    %eax,%eax
    shift |= E0ESC;
80102735:	89 1d b4 a5 10 80    	mov    %ebx,0x8010a5b4
}
8010273b:	5b                   	pop    %ebx
8010273c:	5d                   	pop    %ebp
8010273d:	c3                   	ret    
8010273e:	66 90                	xchg   %ax,%ax
    data = (shift & E0ESC ? data : data & 0x7F);
80102740:	83 e0 7f             	and    $0x7f,%eax
80102743:	85 c9                	test   %ecx,%ecx
80102745:	0f 44 d0             	cmove  %eax,%edx
    return 0;
80102748:	31 c0                	xor    %eax,%eax
    shift &= ~(shiftcode[data] | E0ESC);
8010274a:	0f b6 8a 80 73 10 80 	movzbl -0x7fef8c80(%edx),%ecx
80102751:	83 c9 40             	or     $0x40,%ecx
80102754:	0f b6 c9             	movzbl %cl,%ecx
80102757:	f7 d1                	not    %ecx
80102759:	21 d9                	and    %ebx,%ecx
}
8010275b:	5b                   	pop    %ebx
8010275c:	5d                   	pop    %ebp
    shift &= ~(shiftcode[data] | E0ESC);
8010275d:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
}
80102763:	c3                   	ret    
80102764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    else if('A' <= c && c <= 'Z')
80102768:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
8010276b:	8d 50 20             	lea    0x20(%eax),%edx
}
8010276e:	5b                   	pop    %ebx
8010276f:	5d                   	pop    %ebp
      c += 'a' - 'A';
80102770:	83 f9 1a             	cmp    $0x1a,%ecx
80102773:	0f 42 c2             	cmovb  %edx,%eax
}
80102776:	c3                   	ret    
80102777:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010277e:	66 90                	xchg   %ax,%ax
    return -1;
80102780:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102785:	c3                   	ret    
80102786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010278d:	8d 76 00             	lea    0x0(%esi),%esi

80102790 <kbdintr>:

void
kbdintr(void)
{
80102790:	f3 0f 1e fb          	endbr32 
80102794:	55                   	push   %ebp
80102795:	89 e5                	mov    %esp,%ebp
80102797:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
8010279a:	68 b0 26 10 80       	push   $0x801026b0
8010279f:	e8 ac e0 ff ff       	call   80100850 <consoleintr>
}
801027a4:	83 c4 10             	add    $0x10,%esp
801027a7:	c9                   	leave  
801027a8:	c3                   	ret    
801027a9:	66 90                	xchg   %ax,%ax
801027ab:	66 90                	xchg   %ax,%ax
801027ad:	66 90                	xchg   %ax,%ax
801027af:	90                   	nop

801027b0 <lapicinit>:
}
//PAGEBREAK!

void
lapicinit(void)
{
801027b0:	f3 0f 1e fb          	endbr32 
  if(!lapic)
801027b4:	a1 dc 11 11 80       	mov    0x801111dc,%eax
801027b9:	85 c0                	test   %eax,%eax
801027bb:	0f 84 c7 00 00 00    	je     80102888 <lapicinit+0xd8>
  lapic[index] = value;
801027c1:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801027c8:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027cb:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027ce:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801027d5:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027d8:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027db:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801027e2:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801027e5:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027e8:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801027ef:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801027f2:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801027f5:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801027fc:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801027ff:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102802:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102809:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010280c:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010280f:	8b 50 30             	mov    0x30(%eax),%edx
80102812:	c1 ea 10             	shr    $0x10,%edx
80102815:	81 e2 fc 00 00 00    	and    $0xfc,%edx
8010281b:	75 73                	jne    80102890 <lapicinit+0xe0>
  lapic[index] = value;
8010281d:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102824:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102827:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010282a:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102831:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102834:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102837:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010283e:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102841:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102844:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
8010284b:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010284e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102851:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102858:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010285b:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010285e:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102865:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102868:	8b 50 20             	mov    0x20(%eax),%edx
8010286b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010286f:	90                   	nop
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102870:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102876:	80 e6 10             	and    $0x10,%dh
80102879:	75 f5                	jne    80102870 <lapicinit+0xc0>
  lapic[index] = value;
8010287b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102882:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102885:	8b 40 20             	mov    0x20(%eax),%eax
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102888:	c3                   	ret    
80102889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  lapic[index] = value;
80102890:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102897:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010289a:	8b 50 20             	mov    0x20(%eax),%edx
}
8010289d:	e9 7b ff ff ff       	jmp    8010281d <lapicinit+0x6d>
801028a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801028a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801028b0 <cpunum>:

int
cpunum(void)
{
801028b0:	f3 0f 1e fb          	endbr32 
801028b4:	55                   	push   %ebp
801028b5:	89 e5                	mov    %esp,%ebp
801028b7:	53                   	push   %ebx
801028b8:	83 ec 04             	sub    $0x4,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801028bb:	9c                   	pushf  
801028bc:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
801028bd:	f6 c4 02             	test   $0x2,%ah
801028c0:	74 12                	je     801028d4 <cpunum+0x24>
    static int n;
    if(n++ == 0)
801028c2:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
801028c7:	8d 50 01             	lea    0x1(%eax),%edx
801028ca:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
801028d0:	85 c0                	test   %eax,%eax
801028d2:	74 44                	je     80102918 <cpunum+0x68>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
801028d4:	a1 dc 11 11 80       	mov    0x801111dc,%eax
801028d9:	85 c0                	test   %eax,%eax
801028db:	74 57                	je     80102934 <cpunum+0x84>
    return 0;

  apicid = lapic[ID] >> 24;
801028dd:	8b 48 20             	mov    0x20(%eax),%ecx
  for (i = 0; i < ncpu; ++i) {
801028e0:	8b 1d c0 18 11 80    	mov    0x801118c0,%ebx
  apicid = lapic[ID] >> 24;
801028e6:	c1 e9 18             	shr    $0x18,%ecx
  for (i = 0; i < ncpu; ++i) {
801028e9:	85 db                	test   %ebx,%ebx
801028eb:	7e 4e                	jle    8010293b <cpunum+0x8b>
801028ed:	31 c0                	xor    %eax,%eax
801028ef:	eb 0e                	jmp    801028ff <cpunum+0x4f>
801028f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801028f8:	83 c0 01             	add    $0x1,%eax
801028fb:	39 c3                	cmp    %eax,%ebx
801028fd:	74 3c                	je     8010293b <cpunum+0x8b>
    if (cpus[i].apicid == apicid)
801028ff:	69 d0 bc 00 00 00    	imul   $0xbc,%eax,%edx
80102905:	0f b6 92 e0 12 11 80 	movzbl -0x7feeed20(%edx),%edx
8010290c:	39 ca                	cmp    %ecx,%edx
8010290e:	75 e8                	jne    801028f8 <cpunum+0x48>
      return i;
  }
  panic("unknown apicid\n");
}
80102910:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102913:	c9                   	leave  
80102914:	c3                   	ret    
80102915:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("cpu called from %x with interrupts enabled\n",
80102918:	83 ec 08             	sub    $0x8,%esp
8010291b:	ff 75 04             	pushl  0x4(%ebp)
8010291e:	68 80 74 10 80       	push   $0x80107480
80102923:	e8 78 dd ff ff       	call   801006a0 <cprintf>
  if (!lapic)
80102928:	a1 dc 11 11 80       	mov    0x801111dc,%eax
      cprintf("cpu called from %x with interrupts enabled\n",
8010292d:	83 c4 10             	add    $0x10,%esp
  if (!lapic)
80102930:	85 c0                	test   %eax,%eax
80102932:	75 a9                	jne    801028dd <cpunum+0x2d>
}
80102934:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
80102937:	31 c0                	xor    %eax,%eax
}
80102939:	c9                   	leave  
8010293a:	c3                   	ret    
  panic("unknown apicid\n");
8010293b:	83 ec 0c             	sub    $0xc,%esp
8010293e:	68 ac 74 10 80       	push   $0x801074ac
80102943:	e8 38 da ff ff       	call   80100380 <panic>
80102948:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010294f:	90                   	nop

80102950 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
80102950:	f3 0f 1e fb          	endbr32 
  if(lapic)
80102954:	a1 dc 11 11 80       	mov    0x801111dc,%eax
80102959:	85 c0                	test   %eax,%eax
8010295b:	74 0d                	je     8010296a <lapiceoi+0x1a>
  lapic[index] = value;
8010295d:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102964:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102967:	8b 40 20             	mov    0x20(%eax),%eax
    lapicw(EOI, 0);
}
8010296a:	c3                   	ret    
8010296b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010296f:	90                   	nop

80102970 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102970:	f3 0f 1e fb          	endbr32 
}
80102974:	c3                   	ret    
80102975:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010297c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102980 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102980:	f3 0f 1e fb          	endbr32 
80102984:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102985:	b8 0f 00 00 00       	mov    $0xf,%eax
8010298a:	ba 70 00 00 00       	mov    $0x70,%edx
8010298f:	89 e5                	mov    %esp,%ebp
80102991:	53                   	push   %ebx
80102992:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102995:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102998:	ee                   	out    %al,(%dx)
80102999:	b8 0a 00 00 00       	mov    $0xa,%eax
8010299e:	ba 71 00 00 00       	mov    $0x71,%edx
801029a3:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
801029a4:	31 c0                	xor    %eax,%eax
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
801029a6:	c1 e3 18             	shl    $0x18,%ebx
  wrv[0] = 0;
801029a9:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
801029af:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
801029b1:	c1 e9 0c             	shr    $0xc,%ecx
  lapicw(ICRHI, apicid<<24);
801029b4:	89 da                	mov    %ebx,%edx
  wrv[1] = addr >> 4;
801029b6:	c1 e8 04             	shr    $0x4,%eax
    lapicw(ICRLO, STARTUP | (addr>>12));
801029b9:	80 cd 06             	or     $0x6,%ch
  wrv[1] = addr >> 4;
801029bc:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
801029c2:	a1 dc 11 11 80       	mov    0x801111dc,%eax
801029c7:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801029cd:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801029d0:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801029d7:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
801029da:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801029dd:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801029e4:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801029e7:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801029ea:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801029f0:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801029f3:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801029f9:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801029fc:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102a02:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102a05:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
    microdelay(200);
  }
}
80102a0b:	5b                   	pop    %ebx
  lapic[ID];  // wait for write to finish, by reading
80102a0c:	8b 40 20             	mov    0x20(%eax),%eax
}
80102a0f:	5d                   	pop    %ebp
80102a10:	c3                   	ret    
80102a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a1f:	90                   	nop

80102a20 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
80102a20:	f3 0f 1e fb          	endbr32 
80102a24:	55                   	push   %ebp
80102a25:	b8 0b 00 00 00       	mov    $0xb,%eax
80102a2a:	ba 70 00 00 00       	mov    $0x70,%edx
80102a2f:	89 e5                	mov    %esp,%ebp
80102a31:	57                   	push   %edi
80102a32:	56                   	push   %esi
80102a33:	53                   	push   %ebx
80102a34:	83 ec 4c             	sub    $0x4c,%esp
80102a37:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a38:	ba 71 00 00 00       	mov    $0x71,%edx
80102a3d:	ec                   	in     (%dx),%al
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);

  bcd = (sb & (1 << 2)) == 0;
80102a3e:	83 e0 04             	and    $0x4,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a41:	bb 70 00 00 00       	mov    $0x70,%ebx
80102a46:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a50:	31 c0                	xor    %eax,%eax
80102a52:	89 da                	mov    %ebx,%edx
80102a54:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a55:	b9 71 00 00 00       	mov    $0x71,%ecx
80102a5a:	89 ca                	mov    %ecx,%edx
80102a5c:	ec                   	in     (%dx),%al
80102a5d:	88 45 b7             	mov    %al,-0x49(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a60:	89 da                	mov    %ebx,%edx
80102a62:	b8 02 00 00 00       	mov    $0x2,%eax
80102a67:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a68:	89 ca                	mov    %ecx,%edx
80102a6a:	ec                   	in     (%dx),%al
80102a6b:	88 45 b6             	mov    %al,-0x4a(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a6e:	89 da                	mov    %ebx,%edx
80102a70:	b8 04 00 00 00       	mov    $0x4,%eax
80102a75:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a76:	89 ca                	mov    %ecx,%edx
80102a78:	ec                   	in     (%dx),%al
80102a79:	88 45 b5             	mov    %al,-0x4b(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a7c:	89 da                	mov    %ebx,%edx
80102a7e:	b8 07 00 00 00       	mov    $0x7,%eax
80102a83:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a84:	89 ca                	mov    %ecx,%edx
80102a86:	ec                   	in     (%dx),%al
80102a87:	88 45 b4             	mov    %al,-0x4c(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a8a:	89 da                	mov    %ebx,%edx
80102a8c:	b8 08 00 00 00       	mov    $0x8,%eax
80102a91:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a92:	89 ca                	mov    %ecx,%edx
80102a94:	ec                   	in     (%dx),%al
80102a95:	89 c7                	mov    %eax,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a97:	89 da                	mov    %ebx,%edx
80102a99:	b8 09 00 00 00       	mov    $0x9,%eax
80102a9e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a9f:	89 ca                	mov    %ecx,%edx
80102aa1:	ec                   	in     (%dx),%al
80102aa2:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102aa4:	89 da                	mov    %ebx,%edx
80102aa6:	b8 0a 00 00 00       	mov    $0xa,%eax
80102aab:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102aac:	89 ca                	mov    %ecx,%edx
80102aae:	ec                   	in     (%dx),%al

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102aaf:	84 c0                	test   %al,%al
80102ab1:	78 9d                	js     80102a50 <cmostime+0x30>
  return inb(CMOS_RETURN);
80102ab3:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102ab7:	89 fa                	mov    %edi,%edx
80102ab9:	0f b6 fa             	movzbl %dl,%edi
80102abc:	89 f2                	mov    %esi,%edx
80102abe:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102ac1:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
80102ac5:	0f b6 f2             	movzbl %dl,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102ac8:	89 da                	mov    %ebx,%edx
80102aca:	89 7d c8             	mov    %edi,-0x38(%ebp)
80102acd:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102ad0:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
80102ad4:	89 75 cc             	mov    %esi,-0x34(%ebp)
80102ad7:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102ada:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102ade:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102ae1:	31 c0                	xor    %eax,%eax
80102ae3:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102ae4:	89 ca                	mov    %ecx,%edx
80102ae6:	ec                   	in     (%dx),%al
80102ae7:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102aea:	89 da                	mov    %ebx,%edx
80102aec:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102aef:	b8 02 00 00 00       	mov    $0x2,%eax
80102af4:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102af5:	89 ca                	mov    %ecx,%edx
80102af7:	ec                   	in     (%dx),%al
80102af8:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102afb:	89 da                	mov    %ebx,%edx
80102afd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102b00:	b8 04 00 00 00       	mov    $0x4,%eax
80102b05:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b06:	89 ca                	mov    %ecx,%edx
80102b08:	ec                   	in     (%dx),%al
80102b09:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b0c:	89 da                	mov    %ebx,%edx
80102b0e:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102b11:	b8 07 00 00 00       	mov    $0x7,%eax
80102b16:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b17:	89 ca                	mov    %ecx,%edx
80102b19:	ec                   	in     (%dx),%al
80102b1a:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b1d:	89 da                	mov    %ebx,%edx
80102b1f:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102b22:	b8 08 00 00 00       	mov    $0x8,%eax
80102b27:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b28:	89 ca                	mov    %ecx,%edx
80102b2a:	ec                   	in     (%dx),%al
80102b2b:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b2e:	89 da                	mov    %ebx,%edx
80102b30:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102b33:	b8 09 00 00 00       	mov    $0x9,%eax
80102b38:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b39:	89 ca                	mov    %ecx,%edx
80102b3b:	ec                   	in     (%dx),%al
80102b3c:	0f b6 c0             	movzbl %al,%eax
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102b3f:	83 ec 04             	sub    $0x4,%esp
  return inb(CMOS_RETURN);
80102b42:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102b45:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102b48:	6a 18                	push   $0x18
80102b4a:	50                   	push   %eax
80102b4b:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102b4e:	50                   	push   %eax
80102b4f:	e8 6c 1a 00 00       	call   801045c0 <memcmp>
80102b54:	83 c4 10             	add    $0x10,%esp
80102b57:	85 c0                	test   %eax,%eax
80102b59:	0f 85 f1 fe ff ff    	jne    80102a50 <cmostime+0x30>
      break;
  }

  // convert
  if(bcd) {
80102b5f:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
80102b63:	75 78                	jne    80102bdd <cmostime+0x1bd>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
80102b65:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102b68:	89 c2                	mov    %eax,%edx
80102b6a:	83 e0 0f             	and    $0xf,%eax
80102b6d:	c1 ea 04             	shr    $0x4,%edx
80102b70:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b73:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b76:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102b79:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b7c:	89 c2                	mov    %eax,%edx
80102b7e:	83 e0 0f             	and    $0xf,%eax
80102b81:	c1 ea 04             	shr    $0x4,%edx
80102b84:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b87:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b8a:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102b8d:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b90:	89 c2                	mov    %eax,%edx
80102b92:	83 e0 0f             	and    $0xf,%eax
80102b95:	c1 ea 04             	shr    $0x4,%edx
80102b98:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b9b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b9e:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102ba1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102ba4:	89 c2                	mov    %eax,%edx
80102ba6:	83 e0 0f             	and    $0xf,%eax
80102ba9:	c1 ea 04             	shr    $0x4,%edx
80102bac:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102baf:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102bb2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
80102bb5:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102bb8:	89 c2                	mov    %eax,%edx
80102bba:	83 e0 0f             	and    $0xf,%eax
80102bbd:	c1 ea 04             	shr    $0x4,%edx
80102bc0:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102bc3:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102bc6:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102bc9:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102bcc:	89 c2                	mov    %eax,%edx
80102bce:	83 e0 0f             	and    $0xf,%eax
80102bd1:	c1 ea 04             	shr    $0x4,%edx
80102bd4:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102bd7:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102bda:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102bdd:	8b 75 08             	mov    0x8(%ebp),%esi
80102be0:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102be3:	89 06                	mov    %eax,(%esi)
80102be5:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102be8:	89 46 04             	mov    %eax,0x4(%esi)
80102beb:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102bee:	89 46 08             	mov    %eax,0x8(%esi)
80102bf1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102bf4:	89 46 0c             	mov    %eax,0xc(%esi)
80102bf7:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102bfa:	89 46 10             	mov    %eax,0x10(%esi)
80102bfd:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102c00:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102c03:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102c0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c0d:	5b                   	pop    %ebx
80102c0e:	5e                   	pop    %esi
80102c0f:	5f                   	pop    %edi
80102c10:	5d                   	pop    %ebp
80102c11:	c3                   	ret    
80102c12:	66 90                	xchg   %ax,%ax
80102c14:	66 90                	xchg   %ax,%ax
80102c16:	66 90                	xchg   %ax,%ax
80102c18:	66 90                	xchg   %ax,%ax
80102c1a:	66 90                	xchg   %ax,%ax
80102c1c:	66 90                	xchg   %ax,%ax
80102c1e:	66 90                	xchg   %ax,%ax

80102c20 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c20:	8b 0d 28 12 11 80    	mov    0x80111228,%ecx
80102c26:	85 c9                	test   %ecx,%ecx
80102c28:	0f 8e 8a 00 00 00    	jle    80102cb8 <install_trans+0x98>
{
80102c2e:	55                   	push   %ebp
80102c2f:	89 e5                	mov    %esp,%ebp
80102c31:	57                   	push   %edi
  for (tail = 0; tail < log.lh.n; tail++) {
80102c32:	31 ff                	xor    %edi,%edi
{
80102c34:	56                   	push   %esi
80102c35:	53                   	push   %ebx
80102c36:	83 ec 0c             	sub    $0xc,%esp
80102c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102c40:	a1 14 12 11 80       	mov    0x80111214,%eax
80102c45:	83 ec 08             	sub    $0x8,%esp
80102c48:	01 f8                	add    %edi,%eax
80102c4a:	83 c0 01             	add    $0x1,%eax
80102c4d:	50                   	push   %eax
80102c4e:	ff 35 24 12 11 80    	pushl  0x80111224
80102c54:	e8 67 d4 ff ff       	call   801000c0 <bread>
80102c59:	89 c6                	mov    %eax,%esi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102c5b:	58                   	pop    %eax
80102c5c:	5a                   	pop    %edx
80102c5d:	ff 34 bd 2c 12 11 80 	pushl  -0x7feeedd4(,%edi,4)
80102c64:	ff 35 24 12 11 80    	pushl  0x80111224
  for (tail = 0; tail < log.lh.n; tail++) {
80102c6a:	83 c7 01             	add    $0x1,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102c6d:	e8 4e d4 ff ff       	call   801000c0 <bread>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102c72:	83 c4 0c             	add    $0xc,%esp
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102c75:	89 c3                	mov    %eax,%ebx
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102c77:	8d 46 18             	lea    0x18(%esi),%eax
80102c7a:	68 00 02 00 00       	push   $0x200
80102c7f:	50                   	push   %eax
80102c80:	8d 43 18             	lea    0x18(%ebx),%eax
80102c83:	50                   	push   %eax
80102c84:	e8 87 19 00 00       	call   80104610 <memmove>
    bwrite(dbuf);  // write dst to disk
80102c89:	89 1c 24             	mov    %ebx,(%esp)
80102c8c:	e8 3f d5 ff ff       	call   801001d0 <bwrite>
    brelse(lbuf);
80102c91:	89 34 24             	mov    %esi,(%esp)
80102c94:	e8 67 d5 ff ff       	call   80100200 <brelse>
    brelse(dbuf);
80102c99:	89 1c 24             	mov    %ebx,(%esp)
80102c9c:	e8 5f d5 ff ff       	call   80100200 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102ca1:	83 c4 10             	add    $0x10,%esp
80102ca4:	39 3d 28 12 11 80    	cmp    %edi,0x80111228
80102caa:	7f 94                	jg     80102c40 <install_trans+0x20>
  }
}
80102cac:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102caf:	5b                   	pop    %ebx
80102cb0:	5e                   	pop    %esi
80102cb1:	5f                   	pop    %edi
80102cb2:	5d                   	pop    %ebp
80102cb3:	c3                   	ret    
80102cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102cb8:	c3                   	ret    
80102cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102cc0 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102cc0:	55                   	push   %ebp
80102cc1:	89 e5                	mov    %esp,%ebp
80102cc3:	53                   	push   %ebx
80102cc4:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102cc7:	ff 35 14 12 11 80    	pushl  0x80111214
80102ccd:	ff 35 24 12 11 80    	pushl  0x80111224
80102cd3:	e8 e8 d3 ff ff       	call   801000c0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102cd8:	83 c4 10             	add    $0x10,%esp
  struct buf *buf = bread(log.dev, log.start);
80102cdb:	89 c3                	mov    %eax,%ebx
  hb->n = log.lh.n;
80102cdd:	a1 28 12 11 80       	mov    0x80111228,%eax
80102ce2:	89 43 18             	mov    %eax,0x18(%ebx)
  for (i = 0; i < log.lh.n; i++) {
80102ce5:	a1 28 12 11 80       	mov    0x80111228,%eax
80102cea:	85 c0                	test   %eax,%eax
80102cec:	7e 18                	jle    80102d06 <write_head+0x46>
80102cee:	31 d2                	xor    %edx,%edx
    hb->block[i] = log.lh.block[i];
80102cf0:	8b 0c 95 2c 12 11 80 	mov    -0x7feeedd4(,%edx,4),%ecx
80102cf7:	89 4c 93 1c          	mov    %ecx,0x1c(%ebx,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102cfb:	83 c2 01             	add    $0x1,%edx
80102cfe:	39 15 28 12 11 80    	cmp    %edx,0x80111228
80102d04:	7f ea                	jg     80102cf0 <write_head+0x30>
  }
  bwrite(buf);
80102d06:	83 ec 0c             	sub    $0xc,%esp
80102d09:	53                   	push   %ebx
80102d0a:	e8 c1 d4 ff ff       	call   801001d0 <bwrite>
  brelse(buf);
80102d0f:	89 1c 24             	mov    %ebx,(%esp)
80102d12:	e8 e9 d4 ff ff       	call   80100200 <brelse>
}
80102d17:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d1a:	83 c4 10             	add    $0x10,%esp
80102d1d:	c9                   	leave  
80102d1e:	c3                   	ret    
80102d1f:	90                   	nop

80102d20 <initlog>:
{
80102d20:	f3 0f 1e fb          	endbr32 
80102d24:	55                   	push   %ebp
80102d25:	89 e5                	mov    %esp,%ebp
80102d27:	53                   	push   %ebx
80102d28:	83 ec 2c             	sub    $0x2c,%esp
80102d2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102d2e:	68 bc 74 10 80       	push   $0x801074bc
80102d33:	68 e0 11 11 80       	push   $0x801111e0
80102d38:	e8 e3 15 00 00       	call   80104320 <initlock>
  readsb(dev, &sb);
80102d3d:	58                   	pop    %eax
80102d3e:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102d41:	5a                   	pop    %edx
80102d42:	50                   	push   %eax
80102d43:	53                   	push   %ebx
80102d44:	e8 17 e7 ff ff       	call   80101460 <readsb>
  log.start = sb.logstart;
80102d49:	8b 45 ec             	mov    -0x14(%ebp),%eax
  struct buf *buf = bread(log.dev, log.start);
80102d4c:	59                   	pop    %ecx
  log.dev = dev;
80102d4d:	89 1d 24 12 11 80    	mov    %ebx,0x80111224
  log.size = sb.nlog;
80102d53:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.start = sb.logstart;
80102d56:	a3 14 12 11 80       	mov    %eax,0x80111214
  log.size = sb.nlog;
80102d5b:	89 15 18 12 11 80    	mov    %edx,0x80111218
  struct buf *buf = bread(log.dev, log.start);
80102d61:	5a                   	pop    %edx
80102d62:	50                   	push   %eax
80102d63:	53                   	push   %ebx
80102d64:	e8 57 d3 ff ff       	call   801000c0 <bread>
  for (i = 0; i < log.lh.n; i++) {
80102d69:	83 c4 10             	add    $0x10,%esp
  log.lh.n = lh->n;
80102d6c:	8b 48 18             	mov    0x18(%eax),%ecx
80102d6f:	89 0d 28 12 11 80    	mov    %ecx,0x80111228
  for (i = 0; i < log.lh.n; i++) {
80102d75:	85 c9                	test   %ecx,%ecx
80102d77:	7e 19                	jle    80102d92 <initlog+0x72>
80102d79:	31 d2                	xor    %edx,%edx
80102d7b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102d7f:	90                   	nop
    log.lh.block[i] = lh->block[i];
80102d80:	8b 5c 90 1c          	mov    0x1c(%eax,%edx,4),%ebx
80102d84:	89 1c 95 2c 12 11 80 	mov    %ebx,-0x7feeedd4(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102d8b:	83 c2 01             	add    $0x1,%edx
80102d8e:	39 d1                	cmp    %edx,%ecx
80102d90:	75 ee                	jne    80102d80 <initlog+0x60>
  brelse(buf);
80102d92:	83 ec 0c             	sub    $0xc,%esp
80102d95:	50                   	push   %eax
80102d96:	e8 65 d4 ff ff       	call   80100200 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102d9b:	e8 80 fe ff ff       	call   80102c20 <install_trans>
  log.lh.n = 0;
80102da0:	c7 05 28 12 11 80 00 	movl   $0x0,0x80111228
80102da7:	00 00 00 
  write_head(); // clear the log
80102daa:	e8 11 ff ff ff       	call   80102cc0 <write_head>
}
80102daf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102db2:	83 c4 10             	add    $0x10,%esp
80102db5:	c9                   	leave  
80102db6:	c3                   	ret    
80102db7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102dbe:	66 90                	xchg   %ax,%ax

80102dc0 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102dc0:	f3 0f 1e fb          	endbr32 
80102dc4:	55                   	push   %ebp
80102dc5:	89 e5                	mov    %esp,%ebp
80102dc7:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102dca:	68 e0 11 11 80       	push   $0x801111e0
80102dcf:	e8 6c 15 00 00       	call   80104340 <acquire>
80102dd4:	83 c4 10             	add    $0x10,%esp
80102dd7:	eb 1c                	jmp    80102df5 <begin_op+0x35>
80102dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102de0:	83 ec 08             	sub    $0x8,%esp
80102de3:	68 e0 11 11 80       	push   $0x801111e0
80102de8:	68 e0 11 11 80       	push   $0x801111e0
80102ded:	e8 ae 11 00 00       	call   80103fa0 <sleep>
80102df2:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
80102df5:	a1 20 12 11 80       	mov    0x80111220,%eax
80102dfa:	85 c0                	test   %eax,%eax
80102dfc:	75 e2                	jne    80102de0 <begin_op+0x20>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102dfe:	a1 1c 12 11 80       	mov    0x8011121c,%eax
80102e03:	8b 15 28 12 11 80    	mov    0x80111228,%edx
80102e09:	83 c0 01             	add    $0x1,%eax
80102e0c:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102e0f:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102e12:	83 fa 1e             	cmp    $0x1e,%edx
80102e15:	7f c9                	jg     80102de0 <begin_op+0x20>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102e17:	83 ec 0c             	sub    $0xc,%esp
      log.outstanding += 1;
80102e1a:	a3 1c 12 11 80       	mov    %eax,0x8011121c
      release(&log.lock);
80102e1f:	68 e0 11 11 80       	push   $0x801111e0
80102e24:	e8 f7 16 00 00       	call   80104520 <release>
      break;
    }
  }
}
80102e29:	83 c4 10             	add    $0x10,%esp
80102e2c:	c9                   	leave  
80102e2d:	c3                   	ret    
80102e2e:	66 90                	xchg   %ax,%ax

80102e30 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102e30:	f3 0f 1e fb          	endbr32 
80102e34:	55                   	push   %ebp
80102e35:	89 e5                	mov    %esp,%ebp
80102e37:	57                   	push   %edi
80102e38:	56                   	push   %esi
80102e39:	53                   	push   %ebx
80102e3a:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102e3d:	68 e0 11 11 80       	push   $0x801111e0
80102e42:	e8 f9 14 00 00       	call   80104340 <acquire>
  log.outstanding -= 1;
80102e47:	a1 1c 12 11 80       	mov    0x8011121c,%eax
  if(log.committing)
80102e4c:	8b 35 20 12 11 80    	mov    0x80111220,%esi
80102e52:	83 c4 10             	add    $0x10,%esp
  log.outstanding -= 1;
80102e55:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102e58:	89 1d 1c 12 11 80    	mov    %ebx,0x8011121c
  if(log.committing)
80102e5e:	85 f6                	test   %esi,%esi
80102e60:	0f 85 1e 01 00 00    	jne    80102f84 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102e66:	85 db                	test   %ebx,%ebx
80102e68:	0f 85 f2 00 00 00    	jne    80102f60 <end_op+0x130>
    do_commit = 1;
    log.committing = 1;
80102e6e:	c7 05 20 12 11 80 01 	movl   $0x1,0x80111220
80102e75:	00 00 00 
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102e78:	83 ec 0c             	sub    $0xc,%esp
80102e7b:	68 e0 11 11 80       	push   $0x801111e0
80102e80:	e8 9b 16 00 00       	call   80104520 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102e85:	8b 0d 28 12 11 80    	mov    0x80111228,%ecx
80102e8b:	83 c4 10             	add    $0x10,%esp
80102e8e:	85 c9                	test   %ecx,%ecx
80102e90:	7f 3e                	jg     80102ed0 <end_op+0xa0>
    acquire(&log.lock);
80102e92:	83 ec 0c             	sub    $0xc,%esp
80102e95:	68 e0 11 11 80       	push   $0x801111e0
80102e9a:	e8 a1 14 00 00       	call   80104340 <acquire>
    wakeup(&log);
80102e9f:	c7 04 24 e0 11 11 80 	movl   $0x801111e0,(%esp)
    log.committing = 0;
80102ea6:	c7 05 20 12 11 80 00 	movl   $0x0,0x80111220
80102ead:	00 00 00 
    wakeup(&log);
80102eb0:	e8 ab 12 00 00       	call   80104160 <wakeup>
    release(&log.lock);
80102eb5:	c7 04 24 e0 11 11 80 	movl   $0x801111e0,(%esp)
80102ebc:	e8 5f 16 00 00       	call   80104520 <release>
80102ec1:	83 c4 10             	add    $0x10,%esp
}
80102ec4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ec7:	5b                   	pop    %ebx
80102ec8:	5e                   	pop    %esi
80102ec9:	5f                   	pop    %edi
80102eca:	5d                   	pop    %ebp
80102ecb:	c3                   	ret    
80102ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102ed0:	a1 14 12 11 80       	mov    0x80111214,%eax
80102ed5:	83 ec 08             	sub    $0x8,%esp
80102ed8:	01 d8                	add    %ebx,%eax
80102eda:	83 c0 01             	add    $0x1,%eax
80102edd:	50                   	push   %eax
80102ede:	ff 35 24 12 11 80    	pushl  0x80111224
80102ee4:	e8 d7 d1 ff ff       	call   801000c0 <bread>
80102ee9:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102eeb:	58                   	pop    %eax
80102eec:	5a                   	pop    %edx
80102eed:	ff 34 9d 2c 12 11 80 	pushl  -0x7feeedd4(,%ebx,4)
80102ef4:	ff 35 24 12 11 80    	pushl  0x80111224
  for (tail = 0; tail < log.lh.n; tail++) {
80102efa:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102efd:	e8 be d1 ff ff       	call   801000c0 <bread>
    memmove(to->data, from->data, BSIZE);
80102f02:	83 c4 0c             	add    $0xc,%esp
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102f05:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102f07:	8d 40 18             	lea    0x18(%eax),%eax
80102f0a:	68 00 02 00 00       	push   $0x200
80102f0f:	50                   	push   %eax
80102f10:	8d 46 18             	lea    0x18(%esi),%eax
80102f13:	50                   	push   %eax
80102f14:	e8 f7 16 00 00       	call   80104610 <memmove>
    bwrite(to);  // write the log
80102f19:	89 34 24             	mov    %esi,(%esp)
80102f1c:	e8 af d2 ff ff       	call   801001d0 <bwrite>
    brelse(from);
80102f21:	89 3c 24             	mov    %edi,(%esp)
80102f24:	e8 d7 d2 ff ff       	call   80100200 <brelse>
    brelse(to);
80102f29:	89 34 24             	mov    %esi,(%esp)
80102f2c:	e8 cf d2 ff ff       	call   80100200 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102f31:	83 c4 10             	add    $0x10,%esp
80102f34:	3b 1d 28 12 11 80    	cmp    0x80111228,%ebx
80102f3a:	7c 94                	jl     80102ed0 <end_op+0xa0>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102f3c:	e8 7f fd ff ff       	call   80102cc0 <write_head>
    install_trans(); // Now install writes to home locations
80102f41:	e8 da fc ff ff       	call   80102c20 <install_trans>
    log.lh.n = 0;
80102f46:	c7 05 28 12 11 80 00 	movl   $0x0,0x80111228
80102f4d:	00 00 00 
    write_head();    // Erase the transaction from the log
80102f50:	e8 6b fd ff ff       	call   80102cc0 <write_head>
80102f55:	e9 38 ff ff ff       	jmp    80102e92 <end_op+0x62>
80102f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    wakeup(&log);
80102f60:	83 ec 0c             	sub    $0xc,%esp
80102f63:	68 e0 11 11 80       	push   $0x801111e0
80102f68:	e8 f3 11 00 00       	call   80104160 <wakeup>
  release(&log.lock);
80102f6d:	c7 04 24 e0 11 11 80 	movl   $0x801111e0,(%esp)
80102f74:	e8 a7 15 00 00       	call   80104520 <release>
80102f79:	83 c4 10             	add    $0x10,%esp
}
80102f7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f7f:	5b                   	pop    %ebx
80102f80:	5e                   	pop    %esi
80102f81:	5f                   	pop    %edi
80102f82:	5d                   	pop    %ebp
80102f83:	c3                   	ret    
    panic("log.committing");
80102f84:	83 ec 0c             	sub    $0xc,%esp
80102f87:	68 c0 74 10 80       	push   $0x801074c0
80102f8c:	e8 ef d3 ff ff       	call   80100380 <panic>
80102f91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f9f:	90                   	nop

80102fa0 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102fa0:	f3 0f 1e fb          	endbr32 
80102fa4:	55                   	push   %ebp
80102fa5:	89 e5                	mov    %esp,%ebp
80102fa7:	53                   	push   %ebx
80102fa8:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102fab:	8b 15 28 12 11 80    	mov    0x80111228,%edx
{
80102fb1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102fb4:	83 fa 1d             	cmp    $0x1d,%edx
80102fb7:	0f 8f 91 00 00 00    	jg     8010304e <log_write+0xae>
80102fbd:	a1 18 12 11 80       	mov    0x80111218,%eax
80102fc2:	83 e8 01             	sub    $0x1,%eax
80102fc5:	39 c2                	cmp    %eax,%edx
80102fc7:	0f 8d 81 00 00 00    	jge    8010304e <log_write+0xae>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102fcd:	a1 1c 12 11 80       	mov    0x8011121c,%eax
80102fd2:	85 c0                	test   %eax,%eax
80102fd4:	0f 8e 81 00 00 00    	jle    8010305b <log_write+0xbb>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102fda:	83 ec 0c             	sub    $0xc,%esp
80102fdd:	68 e0 11 11 80       	push   $0x801111e0
80102fe2:	e8 59 13 00 00       	call   80104340 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102fe7:	8b 15 28 12 11 80    	mov    0x80111228,%edx
80102fed:	83 c4 10             	add    $0x10,%esp
80102ff0:	85 d2                	test   %edx,%edx
80102ff2:	7e 4e                	jle    80103042 <log_write+0xa2>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102ff4:	8b 4b 08             	mov    0x8(%ebx),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102ff7:	31 c0                	xor    %eax,%eax
80102ff9:	eb 0c                	jmp    80103007 <log_write+0x67>
80102ffb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102fff:	90                   	nop
80103000:	83 c0 01             	add    $0x1,%eax
80103003:	39 c2                	cmp    %eax,%edx
80103005:	74 29                	je     80103030 <log_write+0x90>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80103007:	39 0c 85 2c 12 11 80 	cmp    %ecx,-0x7feeedd4(,%eax,4)
8010300e:	75 f0                	jne    80103000 <log_write+0x60>
      break;
  }
  log.lh.block[i] = b->blockno;
80103010:	89 0c 85 2c 12 11 80 	mov    %ecx,-0x7feeedd4(,%eax,4)
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
80103017:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
}
8010301a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  release(&log.lock);
8010301d:	c7 45 08 e0 11 11 80 	movl   $0x801111e0,0x8(%ebp)
}
80103024:	c9                   	leave  
  release(&log.lock);
80103025:	e9 f6 14 00 00       	jmp    80104520 <release>
8010302a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  log.lh.block[i] = b->blockno;
80103030:	89 0c 95 2c 12 11 80 	mov    %ecx,-0x7feeedd4(,%edx,4)
    log.lh.n++;
80103037:	83 c2 01             	add    $0x1,%edx
8010303a:	89 15 28 12 11 80    	mov    %edx,0x80111228
80103040:	eb d5                	jmp    80103017 <log_write+0x77>
  log.lh.block[i] = b->blockno;
80103042:	8b 43 08             	mov    0x8(%ebx),%eax
80103045:	a3 2c 12 11 80       	mov    %eax,0x8011122c
  if (i == log.lh.n)
8010304a:	75 cb                	jne    80103017 <log_write+0x77>
8010304c:	eb e9                	jmp    80103037 <log_write+0x97>
    panic("too big a transaction");
8010304e:	83 ec 0c             	sub    $0xc,%esp
80103051:	68 cf 74 10 80       	push   $0x801074cf
80103056:	e8 25 d3 ff ff       	call   80100380 <panic>
    panic("log_write outside of trans");
8010305b:	83 ec 0c             	sub    $0xc,%esp
8010305e:	68 e5 74 10 80       	push   $0x801074e5
80103063:	e8 18 d3 ff ff       	call   80100380 <panic>
80103068:	66 90                	xchg   %ax,%ax
8010306a:	66 90                	xchg   %ax,%ax
8010306c:	66 90                	xchg   %ax,%ax
8010306e:	66 90                	xchg   %ax,%ax

80103070 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80103070:	55                   	push   %ebp
80103071:	89 e5                	mov    %esp,%ebp
80103073:	83 ec 08             	sub    $0x8,%esp
  cprintf("cpu%d: starting\n", cpunum());
80103076:	e8 35 f8 ff ff       	call   801028b0 <cpunum>
8010307b:	83 ec 08             	sub    $0x8,%esp
8010307e:	50                   	push   %eax
8010307f:	68 00 75 10 80       	push   $0x80107500
80103084:	e8 17 d6 ff ff       	call   801006a0 <cprintf>
  idtinit();       // load idt register
80103089:	e8 b2 27 00 00       	call   80105840 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
8010308e:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80103095:	b8 01 00 00 00       	mov    $0x1,%eax
8010309a:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
801030a1:	e8 2a 0c 00 00       	call   80103cd0 <scheduler>
801030a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030ad:	8d 76 00             	lea    0x0(%esi),%esi

801030b0 <mpenter>:
{
801030b0:	f3 0f 1e fb          	endbr32 
801030b4:	55                   	push   %ebp
801030b5:	89 e5                	mov    %esp,%ebp
801030b7:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
801030ba:	e8 31 39 00 00       	call   801069f0 <switchkvm>
  seginit();
801030bf:	e8 bc 37 00 00       	call   80106880 <seginit>
  lapicinit();
801030c4:	e8 e7 f6 ff ff       	call   801027b0 <lapicinit>
  mpmain();
801030c9:	e8 a2 ff ff ff       	call   80103070 <mpmain>
801030ce:	66 90                	xchg   %ax,%ax

801030d0 <main>:
{
801030d0:	f3 0f 1e fb          	endbr32 
801030d4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
801030d8:	83 e4 f0             	and    $0xfffffff0,%esp
801030db:	ff 71 fc             	pushl  -0x4(%ecx)
801030de:	55                   	push   %ebp
801030df:	89 e5                	mov    %esp,%ebp
801030e1:	53                   	push   %ebx
801030e2:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
801030e3:	83 ec 08             	sub    $0x8,%esp
801030e6:	68 00 00 40 80       	push   $0x80400000
801030eb:	68 68 40 11 80       	push   $0x80114068
801030f0:	e8 7b f4 ff ff       	call   80102570 <kinit1>
  kvmalloc();      // kernel page table
801030f5:	e8 d6 38 00 00       	call   801069d0 <kvmalloc>
  mpinit();        // detect other processors
801030fa:	e8 b1 01 00 00       	call   801032b0 <mpinit>
  lapicinit();     // interrupt controller
801030ff:	e8 ac f6 ff ff       	call   801027b0 <lapicinit>
  seginit();       // segment descriptors
80103104:	e8 77 37 00 00       	call   80106880 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80103109:	e8 a2 f7 ff ff       	call   801028b0 <cpunum>
8010310e:	5a                   	pop    %edx
8010310f:	59                   	pop    %ecx
80103110:	50                   	push   %eax
80103111:	68 11 75 10 80       	push   $0x80107511
80103116:	e8 85 d5 ff ff       	call   801006a0 <cprintf>
  picinit();       // another interrupt controller
8010311b:	e8 a0 03 00 00       	call   801034c0 <picinit>
  ioapicinit();    // another interrupt controller
80103120:	e8 3b f2 ff ff       	call   80102360 <ioapicinit>
  consoleinit();   // console hardware
80103125:	e8 f6 d8 ff ff       	call   80100a20 <consoleinit>
  uartinit();      // serial port
8010312a:	e8 11 2a 00 00       	call   80105b40 <uartinit>
  pinit();         // process table
8010312f:	e8 bc 08 00 00       	call   801039f0 <pinit>
  tvinit();        // trap vectors
80103134:	e8 87 26 00 00       	call   801057c0 <tvinit>
  binit();         // buffer cache
80103139:	e8 02 cf ff ff       	call   80100040 <binit>
  fileinit();      // file table
8010313e:	e8 8d dc ff ff       	call   80100dd0 <fileinit>
  ideinit();       // disk
80103143:	e8 f8 ef ff ff       	call   80102140 <ideinit>
  if(!ismp)
80103148:	8b 1d c4 12 11 80    	mov    0x801112c4,%ebx
8010314e:	83 c4 10             	add    $0x10,%esp
80103151:	85 db                	test   %ebx,%ebx
80103153:	0f 84 cb 00 00 00    	je     80103224 <main+0x154>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80103159:	83 ec 04             	sub    $0x4,%esp
8010315c:	68 8a 00 00 00       	push   $0x8a
80103161:	68 8c a4 10 80       	push   $0x8010a48c
80103166:	68 00 70 00 80       	push   $0x80007000
8010316b:	e8 a0 14 00 00       	call   80104610 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80103170:	83 c4 10             	add    $0x10,%esp
80103173:	69 05 c0 18 11 80 bc 	imul   $0xbc,0x801118c0,%eax
8010317a:	00 00 00 
8010317d:	05 e0 12 11 80       	add    $0x801112e0,%eax
80103182:	3d e0 12 11 80       	cmp    $0x801112e0,%eax
80103187:	76 7f                	jbe    80103208 <main+0x138>
80103189:	bb e0 12 11 80       	mov    $0x801112e0,%ebx
8010318e:	eb 19                	jmp    801031a9 <main+0xd9>
80103190:	69 05 c0 18 11 80 bc 	imul   $0xbc,0x801118c0,%eax
80103197:	00 00 00 
8010319a:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
801031a0:	05 e0 12 11 80       	add    $0x801112e0,%eax
801031a5:	39 c3                	cmp    %eax,%ebx
801031a7:	73 5f                	jae    80103208 <main+0x138>
    if(c == cpus+cpunum())  // We've started already.
801031a9:	e8 02 f7 ff ff       	call   801028b0 <cpunum>
801031ae:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
801031b4:	05 e0 12 11 80       	add    $0x801112e0,%eax
801031b9:	39 c3                	cmp    %eax,%ebx
801031bb:	74 d3                	je     80103190 <main+0xc0>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
801031bd:	e8 7e f4 ff ff       	call   80102640 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
801031c2:	83 ec 08             	sub    $0x8,%esp
    *(void**)(code-8) = mpenter;
801031c5:	c7 05 f8 6f 00 80 b0 	movl   $0x801030b0,0x80006ff8
801031cc:	30 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
801031cf:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
801031d6:	90 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
801031d9:	05 00 10 00 00       	add    $0x1000,%eax
801031de:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    lapicstartap(c->apicid, V2P(code));
801031e3:	68 00 70 00 00       	push   $0x7000
801031e8:	0f b6 03             	movzbl (%ebx),%eax
801031eb:	50                   	push   %eax
801031ec:	e8 8f f7 ff ff       	call   80102980 <lapicstartap>

    // wait for cpu to finish mpmain()
    while(c->started == 0)
801031f1:	83 c4 10             	add    $0x10,%esp
801031f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031f8:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
801031fe:	85 c0                	test   %eax,%eax
80103200:	74 f6                	je     801031f8 <main+0x128>
80103202:	eb 8c                	jmp    80103190 <main+0xc0>
80103204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103208:	83 ec 08             	sub    $0x8,%esp
8010320b:	68 00 00 00 8e       	push   $0x8e000000
80103210:	68 00 00 40 80       	push   $0x80400000
80103215:	e8 c6 f3 ff ff       	call   801025e0 <kinit2>
  userinit();      // first user process
8010321a:	e8 f1 07 00 00       	call   80103a10 <userinit>
  mpmain();        // finish this processor's setup
8010321f:	e8 4c fe ff ff       	call   80103070 <mpmain>
    timerinit();   // uniprocessor timer
80103224:	e8 37 25 00 00       	call   80105760 <timerinit>
80103229:	e9 2b ff ff ff       	jmp    80103159 <main+0x89>
8010322e:	66 90                	xchg   %ax,%ax

80103230 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103230:	55                   	push   %ebp
80103231:	89 e5                	mov    %esp,%ebp
80103233:	57                   	push   %edi
80103234:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103235:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
8010323b:	53                   	push   %ebx
  e = addr+len;
8010323c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
8010323f:	83 ec 0c             	sub    $0xc,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80103242:	39 de                	cmp    %ebx,%esi
80103244:	72 10                	jb     80103256 <mpsearch1+0x26>
80103246:	eb 50                	jmp    80103298 <mpsearch1+0x68>
80103248:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010324f:	90                   	nop
80103250:	89 fe                	mov    %edi,%esi
80103252:	39 fb                	cmp    %edi,%ebx
80103254:	76 42                	jbe    80103298 <mpsearch1+0x68>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103256:	83 ec 04             	sub    $0x4,%esp
80103259:	8d 7e 10             	lea    0x10(%esi),%edi
8010325c:	6a 04                	push   $0x4
8010325e:	68 28 75 10 80       	push   $0x80107528
80103263:	56                   	push   %esi
80103264:	e8 57 13 00 00       	call   801045c0 <memcmp>
80103269:	83 c4 10             	add    $0x10,%esp
8010326c:	85 c0                	test   %eax,%eax
8010326e:	75 e0                	jne    80103250 <mpsearch1+0x20>
80103270:	89 f2                	mov    %esi,%edx
80103272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    sum += addr[i];
80103278:	0f b6 0a             	movzbl (%edx),%ecx
8010327b:	83 c2 01             	add    $0x1,%edx
8010327e:	01 c8                	add    %ecx,%eax
  for(i=0; i<len; i++)
80103280:	39 fa                	cmp    %edi,%edx
80103282:	75 f4                	jne    80103278 <mpsearch1+0x48>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103284:	84 c0                	test   %al,%al
80103286:	75 c8                	jne    80103250 <mpsearch1+0x20>
      return (struct mp*)p;
  return 0;
}
80103288:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010328b:	89 f0                	mov    %esi,%eax
8010328d:	5b                   	pop    %ebx
8010328e:	5e                   	pop    %esi
8010328f:	5f                   	pop    %edi
80103290:	5d                   	pop    %ebp
80103291:	c3                   	ret    
80103292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103298:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010329b:	31 f6                	xor    %esi,%esi
}
8010329d:	5b                   	pop    %ebx
8010329e:	89 f0                	mov    %esi,%eax
801032a0:	5e                   	pop    %esi
801032a1:	5f                   	pop    %edi
801032a2:	5d                   	pop    %ebp
801032a3:	c3                   	ret    
801032a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801032ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801032af:	90                   	nop

801032b0 <mpinit>:
  return conf;
}

void
mpinit(void)
{
801032b0:	f3 0f 1e fb          	endbr32 
801032b4:	55                   	push   %ebp
801032b5:	89 e5                	mov    %esp,%ebp
801032b7:	57                   	push   %edi
801032b8:	56                   	push   %esi
801032b9:	53                   	push   %ebx
801032ba:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
801032bd:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
801032c4:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
801032cb:	c1 e0 08             	shl    $0x8,%eax
801032ce:	09 d0                	or     %edx,%eax
801032d0:	c1 e0 04             	shl    $0x4,%eax
801032d3:	75 1b                	jne    801032f0 <mpinit+0x40>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
801032d5:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801032dc:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801032e3:	c1 e0 08             	shl    $0x8,%eax
801032e6:	09 d0                	or     %edx,%eax
801032e8:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
801032eb:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
801032f0:	ba 00 04 00 00       	mov    $0x400,%edx
801032f5:	e8 36 ff ff ff       	call   80103230 <mpsearch1>
801032fa:	89 c3                	mov    %eax,%ebx
801032fc:	85 c0                	test   %eax,%eax
801032fe:	0f 84 6c 01 00 00    	je     80103470 <mpinit+0x1c0>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103304:	8b 73 04             	mov    0x4(%ebx),%esi
80103307:	85 f6                	test   %esi,%esi
80103309:	0f 84 fc 00 00 00    	je     8010340b <mpinit+0x15b>
  if(memcmp(conf, "PCMP", 4) != 0)
8010330f:	83 ec 04             	sub    $0x4,%esp
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103312:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80103318:	6a 04                	push   $0x4
8010331a:	68 2d 75 10 80       	push   $0x8010752d
8010331f:	50                   	push   %eax
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103320:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
80103323:	e8 98 12 00 00       	call   801045c0 <memcmp>
80103328:	83 c4 10             	add    $0x10,%esp
8010332b:	85 c0                	test   %eax,%eax
8010332d:	0f 85 d8 00 00 00    	jne    8010340b <mpinit+0x15b>
  if(conf->version != 1 && conf->version != 4)
80103333:	0f b6 96 06 00 00 80 	movzbl -0x7ffffffa(%esi),%edx
8010333a:	80 fa 01             	cmp    $0x1,%dl
8010333d:	74 09                	je     80103348 <mpinit+0x98>
8010333f:	80 fa 04             	cmp    $0x4,%dl
80103342:	0f 85 c3 00 00 00    	jne    8010340b <mpinit+0x15b>
  if(sum((uchar*)conf, conf->length) != 0)
80103348:	0f b7 be 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edi
  for(i=0; i<len; i++)
8010334f:	66 85 ff             	test   %di,%di
80103352:	74 24                	je     80103378 <mpinit+0xc8>
80103354:	89 f2                	mov    %esi,%edx
80103356:	01 f7                	add    %esi,%edi
80103358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010335f:	90                   	nop
    sum += addr[i];
80103360:	0f b6 8a 00 00 00 80 	movzbl -0x80000000(%edx),%ecx
80103367:	83 c2 01             	add    $0x1,%edx
8010336a:	01 c8                	add    %ecx,%eax
  for(i=0; i<len; i++)
8010336c:	39 d7                	cmp    %edx,%edi
8010336e:	75 f0                	jne    80103360 <mpinit+0xb0>
  if(sum((uchar*)conf, conf->length) != 0)
80103370:	84 c0                	test   %al,%al
80103372:	0f 85 93 00 00 00    	jne    8010340b <mpinit+0x15b>
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
80103378:	c7 05 c4 12 11 80 01 	movl   $0x1,0x801112c4
8010337f:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
80103382:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103388:	8d 96 2c 00 00 80    	lea    -0x7fffffd4(%esi),%edx
  lapic = (uint*)conf->lapicaddr;
8010338e:	a3 dc 11 11 80       	mov    %eax,0x801111dc
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103393:	0f b7 8e 04 00 00 80 	movzwl -0x7ffffffc(%esi),%ecx
8010339a:	03 4d e4             	add    -0x1c(%ebp),%ecx
8010339d:	39 ca                	cmp    %ecx,%edx
8010339f:	72 0e                	jb     801033af <mpinit+0xff>
801033a1:	eb 4d                	jmp    801033f0 <mpinit+0x140>
801033a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801033a7:	90                   	nop
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
801033a8:	83 c2 08             	add    $0x8,%edx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801033ab:	39 d1                	cmp    %edx,%ecx
801033ad:	76 38                	jbe    801033e7 <mpinit+0x137>
    switch(*p){
801033af:	0f b6 02             	movzbl (%edx),%eax
801033b2:	3c 02                	cmp    $0x2,%al
801033b4:	74 7a                	je     80103430 <mpinit+0x180>
801033b6:	77 60                	ja     80103418 <mpinit+0x168>
801033b8:	84 c0                	test   %al,%al
801033ba:	75 ec                	jne    801033a8 <mpinit+0xf8>
      if(ncpu < NCPU) {
801033bc:	8b 35 c0 18 11 80    	mov    0x801118c0,%esi
801033c2:	83 fe 07             	cmp    $0x7,%esi
801033c5:	7f 19                	jg     801033e0 <mpinit+0x130>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801033c7:	69 fe bc 00 00 00    	imul   $0xbc,%esi,%edi
801033cd:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        ncpu++;
801033d1:	83 c6 01             	add    $0x1,%esi
801033d4:	89 35 c0 18 11 80    	mov    %esi,0x801118c0
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801033da:	88 87 e0 12 11 80    	mov    %al,-0x7feeed20(%edi)
      p += sizeof(struct mpproc);
801033e0:	83 c2 14             	add    $0x14,%edx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801033e3:	39 d1                	cmp    %edx,%ecx
801033e5:	77 c8                	ja     801033af <mpinit+0xff>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp){
801033e7:	a1 c4 12 11 80       	mov    0x801112c4,%eax
801033ec:	85 c0                	test   %eax,%eax
801033ee:	74 58                	je     80103448 <mpinit+0x198>
    lapic = 0;
    ioapicid = 0;
    return;
  }

  if(mp->imcrp){
801033f0:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
801033f4:	74 15                	je     8010340b <mpinit+0x15b>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801033f6:	b8 70 00 00 00       	mov    $0x70,%eax
801033fb:	ba 22 00 00 00       	mov    $0x22,%edx
80103400:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103401:	ba 23 00 00 00       	mov    $0x23,%edx
80103406:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103407:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010340a:	ee                   	out    %al,(%dx)
  }
}
8010340b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010340e:	5b                   	pop    %ebx
8010340f:	5e                   	pop    %esi
80103410:	5f                   	pop    %edi
80103411:	5d                   	pop    %ebp
80103412:	c3                   	ret    
80103413:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103417:	90                   	nop
    switch(*p){
80103418:	83 e8 03             	sub    $0x3,%eax
8010341b:	3c 01                	cmp    $0x1,%al
8010341d:	76 89                	jbe    801033a8 <mpinit+0xf8>
      ismp = 0;
8010341f:	c7 05 c4 12 11 80 00 	movl   $0x0,0x801112c4
80103426:	00 00 00 
      break;
80103429:	eb 80                	jmp    801033ab <mpinit+0xfb>
8010342b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010342f:	90                   	nop
      ioapicid = ioapic->apicno;
80103430:	0f b6 42 01          	movzbl 0x1(%edx),%eax
      p += sizeof(struct mpioapic);
80103434:	83 c2 08             	add    $0x8,%edx
      ioapicid = ioapic->apicno;
80103437:	a2 c0 12 11 80       	mov    %al,0x801112c0
      continue;
8010343c:	e9 6a ff ff ff       	jmp    801033ab <mpinit+0xfb>
80103441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ncpu = 1;
80103448:	c7 05 c0 18 11 80 01 	movl   $0x1,0x801118c0
8010344f:	00 00 00 
    lapic = 0;
80103452:	c7 05 dc 11 11 80 00 	movl   $0x0,0x801111dc
80103459:	00 00 00 
    ioapicid = 0;
8010345c:	c6 05 c0 12 11 80 00 	movb   $0x0,0x801112c0
}
80103463:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103466:	5b                   	pop    %ebx
80103467:	5e                   	pop    %esi
80103468:	5f                   	pop    %edi
80103469:	5d                   	pop    %ebp
8010346a:	c3                   	ret    
8010346b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010346f:	90                   	nop
  return mpsearch1(0xF0000, 0x10000);
80103470:	ba 00 00 01 00       	mov    $0x10000,%edx
80103475:	b8 00 00 0f 00       	mov    $0xf0000,%eax
8010347a:	e8 b1 fd ff ff       	call   80103230 <mpsearch1>
8010347f:	89 c3                	mov    %eax,%ebx
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103481:	85 c0                	test   %eax,%eax
80103483:	0f 85 7b fe ff ff    	jne    80103304 <mpinit+0x54>
80103489:	eb 80                	jmp    8010340b <mpinit+0x15b>
8010348b:	66 90                	xchg   %ax,%ax
8010348d:	66 90                	xchg   %ax,%ax
8010348f:	90                   	nop

80103490 <picenable>:
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
80103490:	f3 0f 1e fb          	endbr32 
80103494:	55                   	push   %ebp
  picsetmask(irqmask & ~(1<<irq));
80103495:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
8010349a:	ba 21 00 00 00       	mov    $0x21,%edx
{
8010349f:	89 e5                	mov    %esp,%ebp
  picsetmask(irqmask & ~(1<<irq));
801034a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
801034a4:	d3 c0                	rol    %cl,%eax
801034a6:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
  irqmask = mask;
801034ad:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
801034b3:	ee                   	out    %al,(%dx)
801034b4:	ba a1 00 00 00       	mov    $0xa1,%edx
  outb(IO_PIC2+1, mask >> 8);
801034b9:	66 c1 e8 08          	shr    $0x8,%ax
801034bd:	ee                   	out    %al,(%dx)
}
801034be:	5d                   	pop    %ebp
801034bf:	c3                   	ret    

801034c0 <picinit>:

// Initialize the 8259A interrupt controllers.
void
picinit(void)
{
801034c0:	f3 0f 1e fb          	endbr32 
801034c4:	55                   	push   %ebp
801034c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801034ca:	89 e5                	mov    %esp,%ebp
801034cc:	57                   	push   %edi
801034cd:	56                   	push   %esi
801034ce:	53                   	push   %ebx
801034cf:	bb 21 00 00 00       	mov    $0x21,%ebx
801034d4:	89 da                	mov    %ebx,%edx
801034d6:	ee                   	out    %al,(%dx)
801034d7:	b9 a1 00 00 00       	mov    $0xa1,%ecx
801034dc:	89 ca                	mov    %ecx,%edx
801034de:	ee                   	out    %al,(%dx)
801034df:	be 11 00 00 00       	mov    $0x11,%esi
801034e4:	ba 20 00 00 00       	mov    $0x20,%edx
801034e9:	89 f0                	mov    %esi,%eax
801034eb:	ee                   	out    %al,(%dx)
801034ec:	b8 20 00 00 00       	mov    $0x20,%eax
801034f1:	89 da                	mov    %ebx,%edx
801034f3:	ee                   	out    %al,(%dx)
801034f4:	b8 04 00 00 00       	mov    $0x4,%eax
801034f9:	ee                   	out    %al,(%dx)
801034fa:	bf 03 00 00 00       	mov    $0x3,%edi
801034ff:	89 f8                	mov    %edi,%eax
80103501:	ee                   	out    %al,(%dx)
80103502:	ba a0 00 00 00       	mov    $0xa0,%edx
80103507:	89 f0                	mov    %esi,%eax
80103509:	ee                   	out    %al,(%dx)
8010350a:	b8 28 00 00 00       	mov    $0x28,%eax
8010350f:	89 ca                	mov    %ecx,%edx
80103511:	ee                   	out    %al,(%dx)
80103512:	b8 02 00 00 00       	mov    $0x2,%eax
80103517:	ee                   	out    %al,(%dx)
80103518:	89 f8                	mov    %edi,%eax
8010351a:	ee                   	out    %al,(%dx)
8010351b:	bf 68 00 00 00       	mov    $0x68,%edi
80103520:	ba 20 00 00 00       	mov    $0x20,%edx
80103525:	89 f8                	mov    %edi,%eax
80103527:	ee                   	out    %al,(%dx)
80103528:	be 0a 00 00 00       	mov    $0xa,%esi
8010352d:	89 f0                	mov    %esi,%eax
8010352f:	ee                   	out    %al,(%dx)
80103530:	ba a0 00 00 00       	mov    $0xa0,%edx
80103535:	89 f8                	mov    %edi,%eax
80103537:	ee                   	out    %al,(%dx)
80103538:	89 f0                	mov    %esi,%eax
8010353a:	ee                   	out    %al,(%dx)
  outb(IO_PIC1, 0x0a);             // read IRR by default

  outb(IO_PIC2, 0x68);             // OCW3
  outb(IO_PIC2, 0x0a);             // OCW3

  if(irqmask != 0xFFFF)
8010353b:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
80103542:	66 83 f8 ff          	cmp    $0xffff,%ax
80103546:	74 0a                	je     80103552 <picinit+0x92>
80103548:	89 da                	mov    %ebx,%edx
8010354a:	ee                   	out    %al,(%dx)
  outb(IO_PIC2+1, mask >> 8);
8010354b:	66 c1 e8 08          	shr    $0x8,%ax
8010354f:	89 ca                	mov    %ecx,%edx
80103551:	ee                   	out    %al,(%dx)
    picsetmask(irqmask);
}
80103552:	5b                   	pop    %ebx
80103553:	5e                   	pop    %esi
80103554:	5f                   	pop    %edi
80103555:	5d                   	pop    %ebp
80103556:	c3                   	ret    
80103557:	66 90                	xchg   %ax,%ax
80103559:	66 90                	xchg   %ax,%ax
8010355b:	66 90                	xchg   %ax,%ax
8010355d:	66 90                	xchg   %ax,%ax
8010355f:	90                   	nop

80103560 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103560:	f3 0f 1e fb          	endbr32 
80103564:	55                   	push   %ebp
80103565:	89 e5                	mov    %esp,%ebp
80103567:	57                   	push   %edi
80103568:	56                   	push   %esi
80103569:	53                   	push   %ebx
8010356a:	83 ec 0c             	sub    $0xc,%esp
8010356d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103570:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
80103573:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103579:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010357f:	e8 6c d8 ff ff       	call   80100df0 <filealloc>
80103584:	89 03                	mov    %eax,(%ebx)
80103586:	85 c0                	test   %eax,%eax
80103588:	0f 84 ac 00 00 00    	je     8010363a <pipealloc+0xda>
8010358e:	e8 5d d8 ff ff       	call   80100df0 <filealloc>
80103593:	89 06                	mov    %eax,(%esi)
80103595:	85 c0                	test   %eax,%eax
80103597:	0f 84 8b 00 00 00    	je     80103628 <pipealloc+0xc8>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
8010359d:	e8 9e f0 ff ff       	call   80102640 <kalloc>
801035a2:	89 c7                	mov    %eax,%edi
801035a4:	85 c0                	test   %eax,%eax
801035a6:	0f 84 b4 00 00 00    	je     80103660 <pipealloc+0x100>
    goto bad;
  p->readopen = 1;
801035ac:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801035b3:	00 00 00 
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
801035b6:	83 ec 08             	sub    $0x8,%esp
  p->writeopen = 1;
801035b9:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801035c0:	00 00 00 
  p->nwrite = 0;
801035c3:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801035ca:	00 00 00 
  p->nread = 0;
801035cd:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801035d4:	00 00 00 
  initlock(&p->lock, "pipe");
801035d7:	68 32 75 10 80       	push   $0x80107532
801035dc:	50                   	push   %eax
801035dd:	e8 3e 0d 00 00       	call   80104320 <initlock>
  (*f0)->type = FD_PIPE;
801035e2:	8b 03                	mov    (%ebx),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801035e4:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
801035e7:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
801035ed:	8b 03                	mov    (%ebx),%eax
801035ef:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
801035f3:	8b 03                	mov    (%ebx),%eax
801035f5:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
801035f9:	8b 03                	mov    (%ebx),%eax
801035fb:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
801035fe:	8b 06                	mov    (%esi),%eax
80103600:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103606:	8b 06                	mov    (%esi),%eax
80103608:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
8010360c:	8b 06                	mov    (%esi),%eax
8010360e:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103612:	8b 06                	mov    (%esi),%eax
80103614:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103617:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010361a:	31 c0                	xor    %eax,%eax
}
8010361c:	5b                   	pop    %ebx
8010361d:	5e                   	pop    %esi
8010361e:	5f                   	pop    %edi
8010361f:	5d                   	pop    %ebp
80103620:	c3                   	ret    
80103621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(*f0)
80103628:	8b 03                	mov    (%ebx),%eax
8010362a:	85 c0                	test   %eax,%eax
8010362c:	74 1e                	je     8010364c <pipealloc+0xec>
    fileclose(*f0);
8010362e:	83 ec 0c             	sub    $0xc,%esp
80103631:	50                   	push   %eax
80103632:	e8 79 d8 ff ff       	call   80100eb0 <fileclose>
80103637:	83 c4 10             	add    $0x10,%esp
  if(*f1)
8010363a:	8b 06                	mov    (%esi),%eax
8010363c:	85 c0                	test   %eax,%eax
8010363e:	74 0c                	je     8010364c <pipealloc+0xec>
    fileclose(*f1);
80103640:	83 ec 0c             	sub    $0xc,%esp
80103643:	50                   	push   %eax
80103644:	e8 67 d8 ff ff       	call   80100eb0 <fileclose>
80103649:	83 c4 10             	add    $0x10,%esp
}
8010364c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
8010364f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103654:	5b                   	pop    %ebx
80103655:	5e                   	pop    %esi
80103656:	5f                   	pop    %edi
80103657:	5d                   	pop    %ebp
80103658:	c3                   	ret    
80103659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(*f0)
80103660:	8b 03                	mov    (%ebx),%eax
80103662:	85 c0                	test   %eax,%eax
80103664:	75 c8                	jne    8010362e <pipealloc+0xce>
80103666:	eb d2                	jmp    8010363a <pipealloc+0xda>
80103668:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010366f:	90                   	nop

80103670 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103670:	f3 0f 1e fb          	endbr32 
80103674:	55                   	push   %ebp
80103675:	89 e5                	mov    %esp,%ebp
80103677:	56                   	push   %esi
80103678:	53                   	push   %ebx
80103679:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010367c:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010367f:	83 ec 0c             	sub    $0xc,%esp
80103682:	53                   	push   %ebx
80103683:	e8 b8 0c 00 00       	call   80104340 <acquire>
  if(writable){
80103688:	83 c4 10             	add    $0x10,%esp
8010368b:	85 f6                	test   %esi,%esi
8010368d:	74 41                	je     801036d0 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010368f:	83 ec 0c             	sub    $0xc,%esp
80103692:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
    p->writeopen = 0;
80103698:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010369f:	00 00 00 
    wakeup(&p->nread);
801036a2:	50                   	push   %eax
801036a3:	e8 b8 0a 00 00       	call   80104160 <wakeup>
801036a8:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
801036ab:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801036b1:	85 d2                	test   %edx,%edx
801036b3:	75 0a                	jne    801036bf <pipeclose+0x4f>
801036b5:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801036bb:	85 c0                	test   %eax,%eax
801036bd:	74 31                	je     801036f0 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801036bf:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801036c2:	8d 65 f8             	lea    -0x8(%ebp),%esp
801036c5:	5b                   	pop    %ebx
801036c6:	5e                   	pop    %esi
801036c7:	5d                   	pop    %ebp
    release(&p->lock);
801036c8:	e9 53 0e 00 00       	jmp    80104520 <release>
801036cd:	8d 76 00             	lea    0x0(%esi),%esi
    wakeup(&p->nwrite);
801036d0:	83 ec 0c             	sub    $0xc,%esp
801036d3:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
    p->readopen = 0;
801036d9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801036e0:	00 00 00 
    wakeup(&p->nwrite);
801036e3:	50                   	push   %eax
801036e4:	e8 77 0a 00 00       	call   80104160 <wakeup>
801036e9:	83 c4 10             	add    $0x10,%esp
801036ec:	eb bd                	jmp    801036ab <pipeclose+0x3b>
801036ee:	66 90                	xchg   %ax,%ax
    release(&p->lock);
801036f0:	83 ec 0c             	sub    $0xc,%esp
801036f3:	53                   	push   %ebx
801036f4:	e8 27 0e 00 00       	call   80104520 <release>
    kfree((char*)p);
801036f9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801036fc:	83 c4 10             	add    $0x10,%esp
}
801036ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103702:	5b                   	pop    %ebx
80103703:	5e                   	pop    %esi
80103704:	5d                   	pop    %ebp
    kfree((char*)p);
80103705:	e9 76 ed ff ff       	jmp    80102480 <kfree>
8010370a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103710 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103710:	f3 0f 1e fb          	endbr32 
80103714:	55                   	push   %ebp
80103715:	89 e5                	mov    %esp,%ebp
80103717:	57                   	push   %edi
80103718:	56                   	push   %esi
80103719:	53                   	push   %ebx
8010371a:	83 ec 28             	sub    $0x28,%esp
8010371d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  acquire(&p->lock);
80103720:	57                   	push   %edi
80103721:	e8 1a 0c 00 00       	call   80104340 <acquire>
  for(i = 0; i < n; i++){
80103726:	8b 45 10             	mov    0x10(%ebp),%eax
80103729:	83 c4 10             	add    $0x10,%esp
8010372c:	85 c0                	test   %eax,%eax
8010372e:	0f 8e bc 00 00 00    	jle    801037f0 <pipewrite+0xe0>
80103734:	8b 45 0c             	mov    0xc(%ebp),%eax
80103737:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
8010373d:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
80103743:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103746:	03 45 10             	add    0x10(%ebp),%eax
80103749:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010374c:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103752:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103758:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010375e:	39 d1                	cmp    %edx,%ecx
80103760:	74 3d                	je     8010379f <pipewrite+0x8f>
80103762:	eb 5e                	jmp    801037c2 <pipewrite+0xb2>
80103764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->readopen == 0 || proc->killed){
80103768:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010376e:	8b 48 24             	mov    0x24(%eax),%ecx
80103771:	85 c9                	test   %ecx,%ecx
80103773:	75 34                	jne    801037a9 <pipewrite+0x99>
      wakeup(&p->nread);
80103775:	83 ec 0c             	sub    $0xc,%esp
80103778:	56                   	push   %esi
80103779:	e8 e2 09 00 00       	call   80104160 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010377e:	58                   	pop    %eax
8010377f:	5a                   	pop    %edx
80103780:	57                   	push   %edi
80103781:	53                   	push   %ebx
80103782:	e8 19 08 00 00       	call   80103fa0 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103787:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
8010378d:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
80103793:	83 c4 10             	add    $0x10,%esp
80103796:	05 00 02 00 00       	add    $0x200,%eax
8010379b:	39 c2                	cmp    %eax,%edx
8010379d:	75 29                	jne    801037c8 <pipewrite+0xb8>
      if(p->readopen == 0 || proc->killed){
8010379f:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
801037a5:	85 c0                	test   %eax,%eax
801037a7:	75 bf                	jne    80103768 <pipewrite+0x58>
        release(&p->lock);
801037a9:	83 ec 0c             	sub    $0xc,%esp
801037ac:	57                   	push   %edi
801037ad:	e8 6e 0d 00 00       	call   80104520 <release>
        return -1;
801037b2:	83 c4 10             	add    $0x10,%esp
801037b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
801037ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801037bd:	5b                   	pop    %ebx
801037be:	5e                   	pop    %esi
801037bf:	5f                   	pop    %edi
801037c0:	5d                   	pop    %ebp
801037c1:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801037c2:	89 ca                	mov    %ecx,%edx
801037c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801037c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801037cb:	8d 4a 01             	lea    0x1(%edx),%ecx
801037ce:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801037d4:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
801037da:	0f b6 18             	movzbl (%eax),%ebx
801037dd:	83 c0 01             	add    $0x1,%eax
801037e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801037e3:	88 5c 17 34          	mov    %bl,0x34(%edi,%edx,1)
  for(i = 0; i < n; i++){
801037e7:	3b 45 e0             	cmp    -0x20(%ebp),%eax
801037ea:	0f 85 5c ff ff ff    	jne    8010374c <pipewrite+0x3c>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
801037f0:	83 ec 0c             	sub    $0xc,%esp
801037f3:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
801037f9:	52                   	push   %edx
801037fa:	e8 61 09 00 00       	call   80104160 <wakeup>
  release(&p->lock);
801037ff:	89 3c 24             	mov    %edi,(%esp)
80103802:	e8 19 0d 00 00       	call   80104520 <release>
  return n;
80103807:	8b 45 10             	mov    0x10(%ebp),%eax
8010380a:	83 c4 10             	add    $0x10,%esp
8010380d:	eb ab                	jmp    801037ba <pipewrite+0xaa>
8010380f:	90                   	nop

80103810 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103810:	f3 0f 1e fb          	endbr32 
80103814:	55                   	push   %ebp
80103815:	89 e5                	mov    %esp,%ebp
80103817:	57                   	push   %edi
80103818:	56                   	push   %esi
80103819:	53                   	push   %ebx
8010381a:	83 ec 18             	sub    $0x18,%esp
8010381d:	8b 75 08             	mov    0x8(%ebp),%esi
80103820:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
80103823:	56                   	push   %esi
80103824:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
8010382a:	e8 11 0b 00 00       	call   80104340 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010382f:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103835:	83 c4 10             	add    $0x10,%esp
80103838:	39 86 38 02 00 00    	cmp    %eax,0x238(%esi)
8010383e:	74 35                	je     80103875 <piperead+0x65>
80103840:	eb 3d                	jmp    8010387f <piperead+0x6f>
80103842:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(proc->killed){
80103848:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010384f:	8b 4a 24             	mov    0x24(%edx),%ecx
80103852:	85 c9                	test   %ecx,%ecx
80103854:	0f 85 8e 00 00 00    	jne    801038e8 <piperead+0xd8>
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
8010385a:	83 ec 08             	sub    $0x8,%esp
8010385d:	56                   	push   %esi
8010385e:	53                   	push   %ebx
8010385f:	e8 3c 07 00 00       	call   80103fa0 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103864:	8b 86 38 02 00 00    	mov    0x238(%esi),%eax
8010386a:	83 c4 10             	add    $0x10,%esp
8010386d:	39 86 34 02 00 00    	cmp    %eax,0x234(%esi)
80103873:	75 0a                	jne    8010387f <piperead+0x6f>
80103875:	8b 86 40 02 00 00    	mov    0x240(%esi),%eax
8010387b:	85 c0                	test   %eax,%eax
8010387d:	75 c9                	jne    80103848 <piperead+0x38>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010387f:	8b 55 10             	mov    0x10(%ebp),%edx
80103882:	31 db                	xor    %ebx,%ebx
80103884:	85 d2                	test   %edx,%edx
80103886:	7f 27                	jg     801038af <piperead+0x9f>
80103888:	eb 33                	jmp    801038bd <piperead+0xad>
8010388a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103890:	8d 4a 01             	lea    0x1(%edx),%ecx
80103893:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103899:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010389f:	0f b6 54 16 34       	movzbl 0x34(%esi,%edx,1),%edx
801038a4:	88 14 1f             	mov    %dl,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801038a7:	83 c3 01             	add    $0x1,%ebx
801038aa:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801038ad:	74 0e                	je     801038bd <piperead+0xad>
    if(p->nread == p->nwrite)
801038af:	8b 96 34 02 00 00    	mov    0x234(%esi),%edx
801038b5:	3b 96 38 02 00 00    	cmp    0x238(%esi),%edx
801038bb:	75 d3                	jne    80103890 <piperead+0x80>
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
801038bd:	83 ec 0c             	sub    $0xc,%esp
801038c0:	8d 96 38 02 00 00    	lea    0x238(%esi),%edx
801038c6:	52                   	push   %edx
801038c7:	e8 94 08 00 00       	call   80104160 <wakeup>
  release(&p->lock);
801038cc:	89 34 24             	mov    %esi,(%esp)
801038cf:	e8 4c 0c 00 00       	call   80104520 <release>
  return i;
801038d4:	83 c4 10             	add    $0x10,%esp
}
801038d7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801038da:	89 d8                	mov    %ebx,%eax
801038dc:	5b                   	pop    %ebx
801038dd:	5e                   	pop    %esi
801038de:	5f                   	pop    %edi
801038df:	5d                   	pop    %ebp
801038e0:	c3                   	ret    
801038e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&p->lock);
801038e8:	83 ec 0c             	sub    $0xc,%esp
      return -1;
801038eb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
801038f0:	56                   	push   %esi
801038f1:	e8 2a 0c 00 00       	call   80104520 <release>
      return -1;
801038f6:	83 c4 10             	add    $0x10,%esp
}
801038f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801038fc:	89 d8                	mov    %ebx,%eax
801038fe:	5b                   	pop    %ebx
801038ff:	5e                   	pop    %esi
80103900:	5f                   	pop    %edi
80103901:	5d                   	pop    %ebp
80103902:	c3                   	ret    
80103903:	66 90                	xchg   %ax,%ax
80103905:	66 90                	xchg   %ax,%ax
80103907:	66 90                	xchg   %ax,%ax
80103909:	66 90                	xchg   %ax,%ax
8010390b:	66 90                	xchg   %ax,%ax
8010390d:	66 90                	xchg   %ax,%ax
8010390f:	90                   	nop

80103910 <allocproc>:
// state required to run in the kernel.
// Otherwise return 0.
// Must hold ptable.lock.
static struct proc*
allocproc(void)
{
80103910:	55                   	push   %ebp
80103911:	89 e5                	mov    %esp,%ebp
80103913:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103914:	bb 14 19 11 80       	mov    $0x80111914,%ebx
{
80103919:	83 ec 04             	sub    $0x4,%esp
8010391c:	eb 0d                	jmp    8010392b <allocproc+0x1b>
8010391e:	66 90                	xchg   %ax,%ax
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103920:	83 c3 7c             	add    $0x7c,%ebx
80103923:	81 fb 14 38 11 80    	cmp    $0x80113814,%ebx
80103929:	74 6b                	je     80103996 <allocproc+0x86>
    if(p->state == UNUSED)
8010392b:	8b 43 0c             	mov    0xc(%ebx),%eax
8010392e:	85 c0                	test   %eax,%eax
80103930:	75 ee                	jne    80103920 <allocproc+0x10>
      goto found;
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103932:	a1 08 a0 10 80       	mov    0x8010a008,%eax
  p->state = EMBRYO;
80103937:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
8010393e:	89 43 10             	mov    %eax,0x10(%ebx)
80103941:	8d 50 01             	lea    0x1(%eax),%edx
80103944:	89 15 08 a0 10 80    	mov    %edx,0x8010a008

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
8010394a:	e8 f1 ec ff ff       	call   80102640 <kalloc>
8010394f:	89 43 08             	mov    %eax,0x8(%ebx)
80103952:	85 c0                	test   %eax,%eax
80103954:	74 39                	je     8010398f <allocproc+0x7f>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103956:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010395c:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
8010395f:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
80103964:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
80103967:	c7 40 14 b2 57 10 80 	movl   $0x801057b2,0x14(%eax)
  p->context = (struct context*)sp;
8010396e:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103971:	6a 14                	push   $0x14
80103973:	6a 00                	push   $0x0
80103975:	50                   	push   %eax
80103976:	e8 f5 0b 00 00       	call   80104570 <memset>
  p->context->eip = (uint)forkret;
8010397b:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010397e:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
80103981:	c7 40 10 a0 39 10 80 	movl   $0x801039a0,0x10(%eax)
}
80103988:	89 d8                	mov    %ebx,%eax
8010398a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010398d:	c9                   	leave  
8010398e:	c3                   	ret    
    p->state = UNUSED;
8010398f:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103996:	31 db                	xor    %ebx,%ebx
}
80103998:	89 d8                	mov    %ebx,%eax
8010399a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010399d:	c9                   	leave  
8010399e:	c3                   	ret    
8010399f:	90                   	nop

801039a0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801039a0:	f3 0f 1e fb          	endbr32 
801039a4:	55                   	push   %ebp
801039a5:	89 e5                	mov    %esp,%ebp
801039a7:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801039aa:	68 e0 18 11 80       	push   $0x801118e0
801039af:	e8 6c 0b 00 00       	call   80104520 <release>

  if (first) {
801039b4:	a1 04 a0 10 80       	mov    0x8010a004,%eax
801039b9:	83 c4 10             	add    $0x10,%esp
801039bc:	85 c0                	test   %eax,%eax
801039be:	75 08                	jne    801039c8 <forkret+0x28>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801039c0:	c9                   	leave  
801039c1:	c3                   	ret    
801039c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    first = 0;
801039c8:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
801039cf:	00 00 00 
    iinit(ROOTDEV);
801039d2:	83 ec 0c             	sub    $0xc,%esp
801039d5:	6a 01                	push   $0x1
801039d7:	e8 44 db ff ff       	call   80101520 <iinit>
    initlog(ROOTDEV);
801039dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801039e3:	e8 38 f3 ff ff       	call   80102d20 <initlog>
}
801039e8:	83 c4 10             	add    $0x10,%esp
801039eb:	c9                   	leave  
801039ec:	c3                   	ret    
801039ed:	8d 76 00             	lea    0x0(%esi),%esi

801039f0 <pinit>:
{
801039f0:	f3 0f 1e fb          	endbr32 
801039f4:	55                   	push   %ebp
801039f5:	89 e5                	mov    %esp,%ebp
801039f7:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801039fa:	68 37 75 10 80       	push   $0x80107537
801039ff:	68 e0 18 11 80       	push   $0x801118e0
80103a04:	e8 17 09 00 00       	call   80104320 <initlock>
}
80103a09:	83 c4 10             	add    $0x10,%esp
80103a0c:	c9                   	leave  
80103a0d:	c3                   	ret    
80103a0e:	66 90                	xchg   %ax,%ax

80103a10 <userinit>:
{
80103a10:	f3 0f 1e fb          	endbr32 
80103a14:	55                   	push   %ebp
80103a15:	89 e5                	mov    %esp,%ebp
80103a17:	53                   	push   %ebx
80103a18:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
80103a1b:	68 e0 18 11 80       	push   $0x801118e0
80103a20:	e8 1b 09 00 00       	call   80104340 <acquire>
  p = allocproc();
80103a25:	e8 e6 fe ff ff       	call   80103910 <allocproc>
80103a2a:	89 c3                	mov    %eax,%ebx
  initproc = p;
80103a2c:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
  if((p->pgdir = setupkvm()) == 0)
80103a31:	e8 2a 2f 00 00       	call   80106960 <setupkvm>
80103a36:	83 c4 10             	add    $0x10,%esp
80103a39:	89 43 04             	mov    %eax,0x4(%ebx)
80103a3c:	85 c0                	test   %eax,%eax
80103a3e:	0f 84 b1 00 00 00    	je     80103af5 <userinit+0xe5>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103a44:	83 ec 04             	sub    $0x4,%esp
80103a47:	68 2c 00 00 00       	push   $0x2c
80103a4c:	68 60 a4 10 80       	push   $0x8010a460
80103a51:	50                   	push   %eax
80103a52:	e8 69 30 00 00       	call   80106ac0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103a57:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103a5a:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103a60:	6a 4c                	push   $0x4c
80103a62:	6a 00                	push   $0x0
80103a64:	ff 73 18             	pushl  0x18(%ebx)
80103a67:	e8 04 0b 00 00       	call   80104570 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103a6c:	8b 43 18             	mov    0x18(%ebx),%eax
80103a6f:	ba 23 00 00 00       	mov    $0x23,%edx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103a74:	83 c4 0c             	add    $0xc,%esp
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103a77:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103a7c:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103a80:	8b 43 18             	mov    0x18(%ebx),%eax
80103a83:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103a87:	8b 43 18             	mov    0x18(%ebx),%eax
80103a8a:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103a8e:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103a92:	8b 43 18             	mov    0x18(%ebx),%eax
80103a95:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103a99:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
80103a9d:	8b 43 18             	mov    0x18(%ebx),%eax
80103aa0:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103aa7:	8b 43 18             	mov    0x18(%ebx),%eax
80103aaa:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103ab1:	8b 43 18             	mov    0x18(%ebx),%eax
80103ab4:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103abb:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103abe:	6a 10                	push   $0x10
80103ac0:	68 57 75 10 80       	push   $0x80107557
80103ac5:	50                   	push   %eax
80103ac6:	e8 65 0c 00 00       	call   80104730 <safestrcpy>
  p->cwd = namei("/");
80103acb:	c7 04 24 60 75 10 80 	movl   $0x80107560,(%esp)
80103ad2:	e8 49 e5 ff ff       	call   80102020 <namei>
  p->state = RUNNABLE;
80103ad7:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  p->cwd = namei("/");
80103ade:	89 43 68             	mov    %eax,0x68(%ebx)
  release(&ptable.lock);
80103ae1:	c7 04 24 e0 18 11 80 	movl   $0x801118e0,(%esp)
80103ae8:	e8 33 0a 00 00       	call   80104520 <release>
}
80103aed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103af0:	83 c4 10             	add    $0x10,%esp
80103af3:	c9                   	leave  
80103af4:	c3                   	ret    
    panic("userinit: out of memory?");
80103af5:	83 ec 0c             	sub    $0xc,%esp
80103af8:	68 3e 75 10 80       	push   $0x8010753e
80103afd:	e8 7e c8 ff ff       	call   80100380 <panic>
80103b02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103b10 <growproc>:
{
80103b10:	f3 0f 1e fb          	endbr32 
80103b14:	55                   	push   %ebp
80103b15:	89 e5                	mov    %esp,%ebp
80103b17:	83 ec 08             	sub    $0x8,%esp
  sz = proc->sz;
80103b1a:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
{
80103b21:	8b 4d 08             	mov    0x8(%ebp),%ecx
  sz = proc->sz;
80103b24:	8b 02                	mov    (%edx),%eax
  if(n > 0){
80103b26:	85 c9                	test   %ecx,%ecx
80103b28:	7f 1e                	jg     80103b48 <growproc+0x38>
  } else if(n < 0){
80103b2a:	75 44                	jne    80103b70 <growproc+0x60>
  proc->sz = sz;
80103b2c:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
80103b2e:	83 ec 0c             	sub    $0xc,%esp
80103b31:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
80103b38:	e8 d3 2e 00 00       	call   80106a10 <switchuvm>
  return 0;
80103b3d:	83 c4 10             	add    $0x10,%esp
80103b40:	31 c0                	xor    %eax,%eax
}
80103b42:	c9                   	leave  
80103b43:	c3                   	ret    
80103b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
80103b48:	83 ec 04             	sub    $0x4,%esp
80103b4b:	01 c1                	add    %eax,%ecx
80103b4d:	51                   	push   %ecx
80103b4e:	50                   	push   %eax
80103b4f:	ff 72 04             	pushl  0x4(%edx)
80103b52:	e8 b9 30 00 00       	call   80106c10 <allocuvm>
80103b57:	83 c4 10             	add    $0x10,%esp
80103b5a:	85 c0                	test   %eax,%eax
80103b5c:	74 28                	je     80103b86 <growproc+0x76>
80103b5e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103b65:	eb c5                	jmp    80103b2c <growproc+0x1c>
80103b67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b6e:	66 90                	xchg   %ax,%ax
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80103b70:	83 ec 04             	sub    $0x4,%esp
80103b73:	01 c1                	add    %eax,%ecx
80103b75:	51                   	push   %ecx
80103b76:	50                   	push   %eax
80103b77:	ff 72 04             	pushl  0x4(%edx)
80103b7a:	e8 c1 31 00 00       	call   80106d40 <deallocuvm>
80103b7f:	83 c4 10             	add    $0x10,%esp
80103b82:	85 c0                	test   %eax,%eax
80103b84:	75 d8                	jne    80103b5e <growproc+0x4e>
}
80103b86:	c9                   	leave  
      return -1;
80103b87:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103b8c:	c3                   	ret    
80103b8d:	8d 76 00             	lea    0x0(%esi),%esi

80103b90 <fork>:
{
80103b90:	f3 0f 1e fb          	endbr32 
80103b94:	55                   	push   %ebp
80103b95:	89 e5                	mov    %esp,%ebp
80103b97:	57                   	push   %edi
80103b98:	56                   	push   %esi
80103b99:	53                   	push   %ebx
80103b9a:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);
80103b9d:	68 e0 18 11 80       	push   $0x801118e0
80103ba2:	e8 99 07 00 00       	call   80104340 <acquire>
  if((np = allocproc()) == 0){
80103ba7:	e8 64 fd ff ff       	call   80103910 <allocproc>
80103bac:	83 c4 10             	add    $0x10,%esp
80103baf:	85 c0                	test   %eax,%eax
80103bb1:	0f 84 c9 00 00 00    	je     80103c80 <fork+0xf0>
80103bb7:	89 c3                	mov    %eax,%ebx
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
80103bb9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103bbf:	83 ec 08             	sub    $0x8,%esp
80103bc2:	ff 30                	pushl  (%eax)
80103bc4:	ff 70 04             	pushl  0x4(%eax)
80103bc7:	e8 54 32 00 00       	call   80106e20 <copyuvm>
80103bcc:	83 c4 10             	add    $0x10,%esp
80103bcf:	89 43 04             	mov    %eax,0x4(%ebx)
80103bd2:	85 c0                	test   %eax,%eax
80103bd4:	0f 84 bd 00 00 00    	je     80103c97 <fork+0x107>
  np->sz = proc->sz;
80103bda:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  *np->tf = *proc->tf;
80103be0:	8b 7b 18             	mov    0x18(%ebx),%edi
80103be3:	b9 13 00 00 00       	mov    $0x13,%ecx
  np->sz = proc->sz;
80103be8:	8b 00                	mov    (%eax),%eax
80103bea:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
80103bec:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103bf2:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
80103bf5:	8b 70 18             	mov    0x18(%eax),%esi
80103bf8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103bfa:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103bfc:	8b 43 18             	mov    0x18(%ebx),%eax
80103bff:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103c06:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
  for(i = 0; i < NOFILE; i++)
80103c0d:	8d 76 00             	lea    0x0(%esi),%esi
    if(proc->ofile[i])
80103c10:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103c14:	85 c0                	test   %eax,%eax
80103c16:	74 17                	je     80103c2f <fork+0x9f>
      np->ofile[i] = filedup(proc->ofile[i]);
80103c18:	83 ec 0c             	sub    $0xc,%esp
80103c1b:	50                   	push   %eax
80103c1c:	e8 3f d2 ff ff       	call   80100e60 <filedup>
80103c21:	83 c4 10             	add    $0x10,%esp
80103c24:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103c28:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  for(i = 0; i < NOFILE; i++)
80103c2f:	83 c6 01             	add    $0x1,%esi
80103c32:	83 fe 10             	cmp    $0x10,%esi
80103c35:	75 d9                	jne    80103c10 <fork+0x80>
  np->cwd = idup(proc->cwd);
80103c37:	83 ec 0c             	sub    $0xc,%esp
80103c3a:	ff 72 68             	pushl  0x68(%edx)
80103c3d:	e8 9e da ff ff       	call   801016e0 <idup>
  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103c42:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(proc->cwd);
80103c45:	89 43 68             	mov    %eax,0x68(%ebx)
  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103c48:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103c4e:	6a 10                	push   $0x10
80103c50:	83 c0 6c             	add    $0x6c,%eax
80103c53:	50                   	push   %eax
80103c54:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103c57:	50                   	push   %eax
80103c58:	e8 d3 0a 00 00       	call   80104730 <safestrcpy>
  np->state = RUNNABLE;
80103c5d:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  pid = np->pid;
80103c64:	8b 73 10             	mov    0x10(%ebx),%esi
  release(&ptable.lock);
80103c67:	c7 04 24 e0 18 11 80 	movl   $0x801118e0,(%esp)
80103c6e:	e8 ad 08 00 00       	call   80104520 <release>
  return pid;
80103c73:	83 c4 10             	add    $0x10,%esp
}
80103c76:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103c79:	89 f0                	mov    %esi,%eax
80103c7b:	5b                   	pop    %ebx
80103c7c:	5e                   	pop    %esi
80103c7d:	5f                   	pop    %edi
80103c7e:	5d                   	pop    %ebp
80103c7f:	c3                   	ret    
    release(&ptable.lock);
80103c80:	83 ec 0c             	sub    $0xc,%esp
    return -1;
80103c83:	be ff ff ff ff       	mov    $0xffffffff,%esi
    release(&ptable.lock);
80103c88:	68 e0 18 11 80       	push   $0x801118e0
80103c8d:	e8 8e 08 00 00       	call   80104520 <release>
    return -1;
80103c92:	83 c4 10             	add    $0x10,%esp
80103c95:	eb df                	jmp    80103c76 <fork+0xe6>
    kfree(np->kstack);
80103c97:	83 ec 0c             	sub    $0xc,%esp
80103c9a:	ff 73 08             	pushl  0x8(%ebx)
    return -1;
80103c9d:	be ff ff ff ff       	mov    $0xffffffff,%esi
    kfree(np->kstack);
80103ca2:	e8 d9 e7 ff ff       	call   80102480 <kfree>
    np->kstack = 0;
80103ca7:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103cae:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    release(&ptable.lock);
80103cb5:	c7 04 24 e0 18 11 80 	movl   $0x801118e0,(%esp)
80103cbc:	e8 5f 08 00 00       	call   80104520 <release>
    return -1;
80103cc1:	83 c4 10             	add    $0x10,%esp
80103cc4:	eb b0                	jmp    80103c76 <fork+0xe6>
80103cc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ccd:	8d 76 00             	lea    0x0(%esi),%esi

80103cd0 <scheduler>:
{
80103cd0:	f3 0f 1e fb          	endbr32 
80103cd4:	55                   	push   %ebp
80103cd5:	89 e5                	mov    %esp,%ebp
80103cd7:	53                   	push   %ebx
80103cd8:	83 ec 04             	sub    $0x4,%esp
80103cdb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103cdf:	90                   	nop
  asm volatile("sti");
80103ce0:	fb                   	sti    
    acquire(&ptable.lock);
80103ce1:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ce4:	bb 14 19 11 80       	mov    $0x80111914,%ebx
    acquire(&ptable.lock);
80103ce9:	68 e0 18 11 80       	push   $0x801118e0
80103cee:	e8 4d 06 00 00       	call   80104340 <acquire>
80103cf3:	83 c4 10             	add    $0x10,%esp
80103cf6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103cfd:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->state != RUNNABLE)
80103d00:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103d04:	75 3e                	jne    80103d44 <scheduler+0x74>
      switchuvm(p);
80103d06:	83 ec 0c             	sub    $0xc,%esp
      proc = p;
80103d09:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
      switchuvm(p);
80103d10:	53                   	push   %ebx
80103d11:	e8 fa 2c 00 00       	call   80106a10 <switchuvm>
      swtch(&cpu->scheduler, p->context);
80103d16:	58                   	pop    %eax
80103d17:	5a                   	pop    %edx
80103d18:	ff 73 1c             	pushl  0x1c(%ebx)
80103d1b:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
      p->state = RUNNING;
80103d21:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      swtch(&cpu->scheduler, p->context);
80103d28:	83 c0 04             	add    $0x4,%eax
80103d2b:	50                   	push   %eax
80103d2c:	e8 62 0a 00 00       	call   80104793 <swtch>
      switchkvm();
80103d31:	e8 ba 2c 00 00       	call   801069f0 <switchkvm>
      proc = 0;
80103d36:	83 c4 10             	add    $0x10,%esp
80103d39:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103d40:	00 00 00 00 
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d44:	83 c3 7c             	add    $0x7c,%ebx
80103d47:	81 fb 14 38 11 80    	cmp    $0x80113814,%ebx
80103d4d:	75 b1                	jne    80103d00 <scheduler+0x30>
    release(&ptable.lock);
80103d4f:	83 ec 0c             	sub    $0xc,%esp
80103d52:	68 e0 18 11 80       	push   $0x801118e0
80103d57:	e8 c4 07 00 00       	call   80104520 <release>
    sti();
80103d5c:	83 c4 10             	add    $0x10,%esp
80103d5f:	e9 7c ff ff ff       	jmp    80103ce0 <scheduler+0x10>
80103d64:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103d6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103d6f:	90                   	nop

80103d70 <sched>:
{
80103d70:	f3 0f 1e fb          	endbr32 
80103d74:	55                   	push   %ebp
80103d75:	89 e5                	mov    %esp,%ebp
80103d77:	53                   	push   %ebx
80103d78:	83 ec 10             	sub    $0x10,%esp
  if(!holding(&ptable.lock))
80103d7b:	68 e0 18 11 80       	push   $0x801118e0
80103d80:	e8 eb 06 00 00       	call   80104470 <holding>
80103d85:	83 c4 10             	add    $0x10,%esp
80103d88:	85 c0                	test   %eax,%eax
80103d8a:	74 4c                	je     80103dd8 <sched+0x68>
  if(cpu->ncli != 1)
80103d8c:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103d93:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103d9a:	75 63                	jne    80103dff <sched+0x8f>
  if(proc->state == RUNNING)
80103d9c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103da2:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103da6:	74 4a                	je     80103df2 <sched+0x82>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103da8:	9c                   	pushf  
80103da9:	59                   	pop    %ecx
  if(readeflags()&FL_IF)
80103daa:	80 e5 02             	and    $0x2,%ch
80103dad:	75 36                	jne    80103de5 <sched+0x75>
  swtch(&proc->context, cpu->scheduler);
80103daf:	83 ec 08             	sub    $0x8,%esp
80103db2:	83 c0 1c             	add    $0x1c,%eax
  intena = cpu->intena;
80103db5:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
  swtch(&proc->context, cpu->scheduler);
80103dbb:	ff 72 04             	pushl  0x4(%edx)
80103dbe:	50                   	push   %eax
80103dbf:	e8 cf 09 00 00       	call   80104793 <swtch>
  cpu->intena = intena;
80103dc4:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
}
80103dca:	83 c4 10             	add    $0x10,%esp
  cpu->intena = intena;
80103dcd:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103dd3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103dd6:	c9                   	leave  
80103dd7:	c3                   	ret    
    panic("sched ptable.lock");
80103dd8:	83 ec 0c             	sub    $0xc,%esp
80103ddb:	68 62 75 10 80       	push   $0x80107562
80103de0:	e8 9b c5 ff ff       	call   80100380 <panic>
    panic("sched interruptible");
80103de5:	83 ec 0c             	sub    $0xc,%esp
80103de8:	68 8e 75 10 80       	push   $0x8010758e
80103ded:	e8 8e c5 ff ff       	call   80100380 <panic>
    panic("sched running");
80103df2:	83 ec 0c             	sub    $0xc,%esp
80103df5:	68 80 75 10 80       	push   $0x80107580
80103dfa:	e8 81 c5 ff ff       	call   80100380 <panic>
    panic("sched locks");
80103dff:	83 ec 0c             	sub    $0xc,%esp
80103e02:	68 74 75 10 80       	push   $0x80107574
80103e07:	e8 74 c5 ff ff       	call   80100380 <panic>
80103e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103e10 <exit>:
{
80103e10:	f3 0f 1e fb          	endbr32 
80103e14:	55                   	push   %ebp
  if(proc == initproc)
80103e15:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
{
80103e1c:	89 e5                	mov    %esp,%ebp
80103e1e:	56                   	push   %esi
80103e1f:	53                   	push   %ebx
80103e20:	31 db                	xor    %ebx,%ebx
  if(proc == initproc)
80103e22:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
80103e28:	0f 84 19 01 00 00    	je     80103f47 <exit+0x137>
80103e2e:	66 90                	xchg   %ax,%ax
    if(proc->ofile[fd]){
80103e30:	8d 73 08             	lea    0x8(%ebx),%esi
80103e33:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103e37:	85 c0                	test   %eax,%eax
80103e39:	74 1b                	je     80103e56 <exit+0x46>
      fileclose(proc->ofile[fd]);
80103e3b:	83 ec 0c             	sub    $0xc,%esp
80103e3e:	50                   	push   %eax
80103e3f:	e8 6c d0 ff ff       	call   80100eb0 <fileclose>
      proc->ofile[fd] = 0;
80103e44:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103e4b:	83 c4 10             	add    $0x10,%esp
80103e4e:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103e55:	00 
  for(fd = 0; fd < NOFILE; fd++){
80103e56:	83 c3 01             	add    $0x1,%ebx
80103e59:	83 fb 10             	cmp    $0x10,%ebx
80103e5c:	75 d2                	jne    80103e30 <exit+0x20>
  begin_op();
80103e5e:	e8 5d ef ff ff       	call   80102dc0 <begin_op>
  iput(proc->cwd);
80103e63:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e69:	83 ec 0c             	sub    $0xc,%esp
80103e6c:	ff 70 68             	pushl  0x68(%eax)
80103e6f:	e8 0c da ff ff       	call   80101880 <iput>
  end_op();
80103e74:	e8 b7 ef ff ff       	call   80102e30 <end_op>
  proc->cwd = 0;
80103e79:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e7f:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)
  acquire(&ptable.lock);
80103e86:	c7 04 24 e0 18 11 80 	movl   $0x801118e0,(%esp)
80103e8d:	e8 ae 04 00 00       	call   80104340 <acquire>
  wakeup1(proc->parent);
80103e92:	65 8b 1d 04 00 00 00 	mov    %gs:0x4,%ebx
80103e99:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e9c:	b8 14 19 11 80       	mov    $0x80111914,%eax
  wakeup1(proc->parent);
80103ea1:	8b 53 14             	mov    0x14(%ebx),%edx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ea4:	eb 14                	jmp    80103eba <exit+0xaa>
80103ea6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103ead:	8d 76 00             	lea    0x0(%esi),%esi
80103eb0:	83 c0 7c             	add    $0x7c,%eax
80103eb3:	3d 14 38 11 80       	cmp    $0x80113814,%eax
80103eb8:	74 1c                	je     80103ed6 <exit+0xc6>
    if(p->state == SLEEPING && p->chan == chan)
80103eba:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103ebe:	75 f0                	jne    80103eb0 <exit+0xa0>
80103ec0:	3b 50 20             	cmp    0x20(%eax),%edx
80103ec3:	75 eb                	jne    80103eb0 <exit+0xa0>
      p->state = RUNNABLE;
80103ec5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ecc:	83 c0 7c             	add    $0x7c,%eax
80103ecf:	3d 14 38 11 80       	cmp    $0x80113814,%eax
80103ed4:	75 e4                	jne    80103eba <exit+0xaa>
      p->parent = initproc;
80103ed6:	8b 0d bc a5 10 80    	mov    0x8010a5bc,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103edc:	ba 14 19 11 80       	mov    $0x80111914,%edx
80103ee1:	eb 10                	jmp    80103ef3 <exit+0xe3>
80103ee3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ee7:	90                   	nop
80103ee8:	83 c2 7c             	add    $0x7c,%edx
80103eeb:	81 fa 14 38 11 80    	cmp    $0x80113814,%edx
80103ef1:	74 3b                	je     80103f2e <exit+0x11e>
    if(p->parent == proc){
80103ef3:	3b 5a 14             	cmp    0x14(%edx),%ebx
80103ef6:	75 f0                	jne    80103ee8 <exit+0xd8>
      if(p->state == ZOMBIE)
80103ef8:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103efc:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103eff:	75 e7                	jne    80103ee8 <exit+0xd8>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f01:	b8 14 19 11 80       	mov    $0x80111914,%eax
80103f06:	eb 12                	jmp    80103f1a <exit+0x10a>
80103f08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103f0f:	90                   	nop
80103f10:	83 c0 7c             	add    $0x7c,%eax
80103f13:	3d 14 38 11 80       	cmp    $0x80113814,%eax
80103f18:	74 ce                	je     80103ee8 <exit+0xd8>
    if(p->state == SLEEPING && p->chan == chan)
80103f1a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f1e:	75 f0                	jne    80103f10 <exit+0x100>
80103f20:	3b 48 20             	cmp    0x20(%eax),%ecx
80103f23:	75 eb                	jne    80103f10 <exit+0x100>
      p->state = RUNNABLE;
80103f25:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103f2c:	eb e2                	jmp    80103f10 <exit+0x100>
  proc->state = ZOMBIE;
80103f2e:	c7 43 0c 05 00 00 00 	movl   $0x5,0xc(%ebx)
  sched();
80103f35:	e8 36 fe ff ff       	call   80103d70 <sched>
  panic("zombie exit");
80103f3a:	83 ec 0c             	sub    $0xc,%esp
80103f3d:	68 af 75 10 80       	push   $0x801075af
80103f42:	e8 39 c4 ff ff       	call   80100380 <panic>
    panic("init exiting");
80103f47:	83 ec 0c             	sub    $0xc,%esp
80103f4a:	68 a2 75 10 80       	push   $0x801075a2
80103f4f:	e8 2c c4 ff ff       	call   80100380 <panic>
80103f54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103f5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f5f:	90                   	nop

80103f60 <yield>:
{
80103f60:	f3 0f 1e fb          	endbr32 
80103f64:	55                   	push   %ebp
80103f65:	89 e5                	mov    %esp,%ebp
80103f67:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103f6a:	68 e0 18 11 80       	push   $0x801118e0
80103f6f:	e8 cc 03 00 00       	call   80104340 <acquire>
  proc->state = RUNNABLE;
80103f74:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f7a:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103f81:	e8 ea fd ff ff       	call   80103d70 <sched>
  release(&ptable.lock);
80103f86:	c7 04 24 e0 18 11 80 	movl   $0x801118e0,(%esp)
80103f8d:	e8 8e 05 00 00       	call   80104520 <release>
}
80103f92:	83 c4 10             	add    $0x10,%esp
80103f95:	c9                   	leave  
80103f96:	c3                   	ret    
80103f97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103f9e:	66 90                	xchg   %ax,%ax

80103fa0 <sleep>:
{
80103fa0:	f3 0f 1e fb          	endbr32 
80103fa4:	55                   	push   %ebp
  if(proc == 0)
80103fa5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
{
80103fab:	89 e5                	mov    %esp,%ebp
80103fad:	56                   	push   %esi
80103fae:	8b 75 08             	mov    0x8(%ebp),%esi
80103fb1:	53                   	push   %ebx
80103fb2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103fb5:	85 c0                	test   %eax,%eax
80103fb7:	0f 84 9b 00 00 00    	je     80104058 <sleep+0xb8>
  if(lk == 0)
80103fbd:	85 db                	test   %ebx,%ebx
80103fbf:	0f 84 86 00 00 00    	je     8010404b <sleep+0xab>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103fc5:	81 fb e0 18 11 80    	cmp    $0x801118e0,%ebx
80103fcb:	74 5b                	je     80104028 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103fcd:	83 ec 0c             	sub    $0xc,%esp
80103fd0:	68 e0 18 11 80       	push   $0x801118e0
80103fd5:	e8 66 03 00 00       	call   80104340 <acquire>
    release(lk);
80103fda:	89 1c 24             	mov    %ebx,(%esp)
80103fdd:	e8 3e 05 00 00       	call   80104520 <release>
  proc->chan = chan;
80103fe2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103fe8:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103feb:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103ff2:	e8 79 fd ff ff       	call   80103d70 <sched>
  proc->chan = 0;
80103ff7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ffd:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
    release(&ptable.lock);
80104004:	c7 04 24 e0 18 11 80 	movl   $0x801118e0,(%esp)
8010400b:	e8 10 05 00 00       	call   80104520 <release>
    acquire(lk);
80104010:	89 5d 08             	mov    %ebx,0x8(%ebp)
80104013:	83 c4 10             	add    $0x10,%esp
}
80104016:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104019:	5b                   	pop    %ebx
8010401a:	5e                   	pop    %esi
8010401b:	5d                   	pop    %ebp
    acquire(lk);
8010401c:	e9 1f 03 00 00       	jmp    80104340 <acquire>
80104021:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  proc->chan = chan;
80104028:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
8010402b:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80104032:	e8 39 fd ff ff       	call   80103d70 <sched>
  proc->chan = 0;
80104037:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010403d:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
80104044:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104047:	5b                   	pop    %ebx
80104048:	5e                   	pop    %esi
80104049:	5d                   	pop    %ebp
8010404a:	c3                   	ret    
    panic("sleep without lk");
8010404b:	83 ec 0c             	sub    $0xc,%esp
8010404e:	68 c1 75 10 80       	push   $0x801075c1
80104053:	e8 28 c3 ff ff       	call   80100380 <panic>
    panic("sleep");
80104058:	83 ec 0c             	sub    $0xc,%esp
8010405b:	68 bb 75 10 80       	push   $0x801075bb
80104060:	e8 1b c3 ff ff       	call   80100380 <panic>
80104065:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010406c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104070 <wait>:
{
80104070:	f3 0f 1e fb          	endbr32 
80104074:	55                   	push   %ebp
80104075:	89 e5                	mov    %esp,%ebp
80104077:	56                   	push   %esi
80104078:	53                   	push   %ebx
  acquire(&ptable.lock);
80104079:	83 ec 0c             	sub    $0xc,%esp
8010407c:	68 e0 18 11 80       	push   $0x801118e0
80104081:	e8 ba 02 00 00       	call   80104340 <acquire>
80104086:	83 c4 10             	add    $0x10,%esp
      if(p->parent != proc)
80104089:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    havekids = 0;
8010408f:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104091:	bb 14 19 11 80       	mov    $0x80111914,%ebx
80104096:	eb 13                	jmp    801040ab <wait+0x3b>
80104098:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010409f:	90                   	nop
801040a0:	83 c3 7c             	add    $0x7c,%ebx
801040a3:	81 fb 14 38 11 80    	cmp    $0x80113814,%ebx
801040a9:	74 1b                	je     801040c6 <wait+0x56>
      if(p->parent != proc)
801040ab:	39 43 14             	cmp    %eax,0x14(%ebx)
801040ae:	75 f0                	jne    801040a0 <wait+0x30>
      if(p->state == ZOMBIE){
801040b0:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801040b4:	74 32                	je     801040e8 <wait+0x78>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040b6:	83 c3 7c             	add    $0x7c,%ebx
      havekids = 1;
801040b9:	ba 01 00 00 00       	mov    $0x1,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040be:	81 fb 14 38 11 80    	cmp    $0x80113814,%ebx
801040c4:	75 e5                	jne    801040ab <wait+0x3b>
    if(!havekids || proc->killed){
801040c6:	85 d2                	test   %edx,%edx
801040c8:	74 74                	je     8010413e <wait+0xce>
801040ca:	8b 50 24             	mov    0x24(%eax),%edx
801040cd:	85 d2                	test   %edx,%edx
801040cf:	75 6d                	jne    8010413e <wait+0xce>
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
801040d1:	83 ec 08             	sub    $0x8,%esp
801040d4:	68 e0 18 11 80       	push   $0x801118e0
801040d9:	50                   	push   %eax
801040da:	e8 c1 fe ff ff       	call   80103fa0 <sleep>
    havekids = 0;
801040df:	83 c4 10             	add    $0x10,%esp
801040e2:	eb a5                	jmp    80104089 <wait+0x19>
801040e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        kfree(p->kstack);
801040e8:	83 ec 0c             	sub    $0xc,%esp
801040eb:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
801040ee:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
801040f1:	e8 8a e3 ff ff       	call   80102480 <kfree>
        freevm(p->pgdir);
801040f6:	59                   	pop    %ecx
801040f7:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
801040fa:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80104101:	e8 6a 2c 00 00       	call   80106d70 <freevm>
        release(&ptable.lock);
80104106:	c7 04 24 e0 18 11 80 	movl   $0x801118e0,(%esp)
        p->pid = 0;
8010410d:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80104114:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
8010411b:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
8010411f:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80104126:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
8010412d:	e8 ee 03 00 00       	call   80104520 <release>
        return pid;
80104132:	83 c4 10             	add    $0x10,%esp
}
80104135:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104138:	89 f0                	mov    %esi,%eax
8010413a:	5b                   	pop    %ebx
8010413b:	5e                   	pop    %esi
8010413c:	5d                   	pop    %ebp
8010413d:	c3                   	ret    
      release(&ptable.lock);
8010413e:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80104141:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80104146:	68 e0 18 11 80       	push   $0x801118e0
8010414b:	e8 d0 03 00 00       	call   80104520 <release>
      return -1;
80104150:	83 c4 10             	add    $0x10,%esp
80104153:	eb e0                	jmp    80104135 <wait+0xc5>
80104155:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010415c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104160 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104160:	f3 0f 1e fb          	endbr32 
80104164:	55                   	push   %ebp
80104165:	89 e5                	mov    %esp,%ebp
80104167:	53                   	push   %ebx
80104168:	83 ec 10             	sub    $0x10,%esp
8010416b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010416e:	68 e0 18 11 80       	push   $0x801118e0
80104173:	e8 c8 01 00 00       	call   80104340 <acquire>
80104178:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010417b:	b8 14 19 11 80       	mov    $0x80111914,%eax
80104180:	eb 10                	jmp    80104192 <wakeup+0x32>
80104182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104188:	83 c0 7c             	add    $0x7c,%eax
8010418b:	3d 14 38 11 80       	cmp    $0x80113814,%eax
80104190:	74 1c                	je     801041ae <wakeup+0x4e>
    if(p->state == SLEEPING && p->chan == chan)
80104192:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104196:	75 f0                	jne    80104188 <wakeup+0x28>
80104198:	3b 58 20             	cmp    0x20(%eax),%ebx
8010419b:	75 eb                	jne    80104188 <wakeup+0x28>
      p->state = RUNNABLE;
8010419d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801041a4:	83 c0 7c             	add    $0x7c,%eax
801041a7:	3d 14 38 11 80       	cmp    $0x80113814,%eax
801041ac:	75 e4                	jne    80104192 <wakeup+0x32>
  wakeup1(chan);
  release(&ptable.lock);
801041ae:	c7 45 08 e0 18 11 80 	movl   $0x801118e0,0x8(%ebp)
}
801041b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041b8:	c9                   	leave  
  release(&ptable.lock);
801041b9:	e9 62 03 00 00       	jmp    80104520 <release>
801041be:	66 90                	xchg   %ax,%ax

801041c0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
801041c0:	f3 0f 1e fb          	endbr32 
801041c4:	55                   	push   %ebp
801041c5:	89 e5                	mov    %esp,%ebp
801041c7:	53                   	push   %ebx
801041c8:	83 ec 10             	sub    $0x10,%esp
801041cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801041ce:	68 e0 18 11 80       	push   $0x801118e0
801041d3:	e8 68 01 00 00       	call   80104340 <acquire>
801041d8:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801041db:	b8 14 19 11 80       	mov    $0x80111914,%eax
801041e0:	eb 10                	jmp    801041f2 <kill+0x32>
801041e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801041e8:	83 c0 7c             	add    $0x7c,%eax
801041eb:	3d 14 38 11 80       	cmp    $0x80113814,%eax
801041f0:	74 36                	je     80104228 <kill+0x68>
    if(p->pid == pid){
801041f2:	39 58 10             	cmp    %ebx,0x10(%eax)
801041f5:	75 f1                	jne    801041e8 <kill+0x28>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
801041f7:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
801041fb:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
80104202:	75 07                	jne    8010420b <kill+0x4b>
        p->state = RUNNABLE;
80104204:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
8010420b:	83 ec 0c             	sub    $0xc,%esp
8010420e:	68 e0 18 11 80       	push   $0x801118e0
80104213:	e8 08 03 00 00       	call   80104520 <release>
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
80104218:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      return 0;
8010421b:	83 c4 10             	add    $0x10,%esp
8010421e:	31 c0                	xor    %eax,%eax
}
80104220:	c9                   	leave  
80104221:	c3                   	ret    
80104222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80104228:	83 ec 0c             	sub    $0xc,%esp
8010422b:	68 e0 18 11 80       	push   $0x801118e0
80104230:	e8 eb 02 00 00       	call   80104520 <release>
}
80104235:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return -1;
80104238:	83 c4 10             	add    $0x10,%esp
8010423b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104240:	c9                   	leave  
80104241:	c3                   	ret    
80104242:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104250 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104250:	f3 0f 1e fb          	endbr32 
80104254:	55                   	push   %ebp
80104255:	89 e5                	mov    %esp,%ebp
80104257:	57                   	push   %edi
80104258:	56                   	push   %esi
80104259:	8d 75 e8             	lea    -0x18(%ebp),%esi
8010425c:	53                   	push   %ebx
8010425d:	bb 80 19 11 80       	mov    $0x80111980,%ebx
80104262:	83 ec 3c             	sub    $0x3c,%esp
80104265:	eb 28                	jmp    8010428f <procdump+0x3f>
80104267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010426e:	66 90                	xchg   %ax,%ax
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104270:	83 ec 0c             	sub    $0xc,%esp
80104273:	68 26 75 10 80       	push   $0x80107526
80104278:	e8 23 c4 ff ff       	call   801006a0 <cprintf>
8010427d:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104280:	83 c3 7c             	add    $0x7c,%ebx
80104283:	81 fb 80 38 11 80    	cmp    $0x80113880,%ebx
80104289:	0f 84 81 00 00 00    	je     80104310 <procdump+0xc0>
    if(p->state == UNUSED)
8010428f:	8b 43 a0             	mov    -0x60(%ebx),%eax
80104292:	85 c0                	test   %eax,%eax
80104294:	74 ea                	je     80104280 <procdump+0x30>
      state = "???";
80104296:	ba d2 75 10 80       	mov    $0x801075d2,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010429b:	83 f8 05             	cmp    $0x5,%eax
8010429e:	77 11                	ja     801042b1 <procdump+0x61>
801042a0:	8b 14 85 0c 76 10 80 	mov    -0x7fef89f4(,%eax,4),%edx
      state = "???";
801042a7:	b8 d2 75 10 80       	mov    $0x801075d2,%eax
801042ac:	85 d2                	test   %edx,%edx
801042ae:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
801042b1:	53                   	push   %ebx
801042b2:	52                   	push   %edx
801042b3:	ff 73 a4             	pushl  -0x5c(%ebx)
801042b6:	68 d6 75 10 80       	push   $0x801075d6
801042bb:	e8 e0 c3 ff ff       	call   801006a0 <cprintf>
    if(p->state == SLEEPING){
801042c0:	83 c4 10             	add    $0x10,%esp
801042c3:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
801042c7:	75 a7                	jne    80104270 <procdump+0x20>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801042c9:	83 ec 08             	sub    $0x8,%esp
801042cc:	8d 45 c0             	lea    -0x40(%ebp),%eax
801042cf:	8d 7d c0             	lea    -0x40(%ebp),%edi
801042d2:	50                   	push   %eax
801042d3:	8b 43 b0             	mov    -0x50(%ebx),%eax
801042d6:	8b 40 0c             	mov    0xc(%eax),%eax
801042d9:	83 c0 08             	add    $0x8,%eax
801042dc:	50                   	push   %eax
801042dd:	e8 2e 01 00 00       	call   80104410 <getcallerpcs>
      for(i=0; i<10 && pc[i] != 0; i++)
801042e2:	83 c4 10             	add    $0x10,%esp
801042e5:	8d 76 00             	lea    0x0(%esi),%esi
801042e8:	8b 17                	mov    (%edi),%edx
801042ea:	85 d2                	test   %edx,%edx
801042ec:	74 82                	je     80104270 <procdump+0x20>
        cprintf(" %p", pc[i]);
801042ee:	83 ec 08             	sub    $0x8,%esp
801042f1:	83 c7 04             	add    $0x4,%edi
801042f4:	52                   	push   %edx
801042f5:	68 22 70 10 80       	push   $0x80107022
801042fa:	e8 a1 c3 ff ff       	call   801006a0 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
801042ff:	83 c4 10             	add    $0x10,%esp
80104302:	39 fe                	cmp    %edi,%esi
80104304:	75 e2                	jne    801042e8 <procdump+0x98>
80104306:	e9 65 ff ff ff       	jmp    80104270 <procdump+0x20>
8010430b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010430f:	90                   	nop
  }
}
80104310:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104313:	5b                   	pop    %ebx
80104314:	5e                   	pop    %esi
80104315:	5f                   	pop    %edi
80104316:	5d                   	pop    %ebp
80104317:	c3                   	ret    
80104318:	66 90                	xchg   %ax,%ax
8010431a:	66 90                	xchg   %ax,%ax
8010431c:	66 90                	xchg   %ax,%ax
8010431e:	66 90                	xchg   %ax,%ax

80104320 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104320:	f3 0f 1e fb          	endbr32 
80104324:	55                   	push   %ebp
80104325:	89 e5                	mov    %esp,%ebp
80104327:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
8010432a:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
8010432d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
80104333:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
80104336:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
8010433d:	5d                   	pop    %ebp
8010433e:	c3                   	ret    
8010433f:	90                   	nop

80104340 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104340:	f3 0f 1e fb          	endbr32 
80104344:	55                   	push   %ebp
80104345:	89 e5                	mov    %esp,%ebp
80104347:	53                   	push   %ebx
80104348:	83 ec 04             	sub    $0x4,%esp
8010434b:	9c                   	pushf  
8010434c:	5a                   	pop    %edx
  asm volatile("cli");
8010434d:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
8010434e:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
80104355:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
8010435b:	85 c0                	test   %eax,%eax
8010435d:	75 0c                	jne    8010436b <acquire+0x2b>
    cpu->intena = eflags & FL_IF;
8010435f:	81 e2 00 02 00 00    	and    $0x200,%edx
80104365:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
  if(holding(lk))
8010436b:	8b 55 08             	mov    0x8(%ebp),%edx
  cpu->ncli += 1;
8010436e:	83 c0 01             	add    $0x1,%eax
80104371:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)
  return lock->locked && lock->cpu == cpu;
80104377:	8b 02                	mov    (%edx),%eax
80104379:	85 c0                	test   %eax,%eax
8010437b:	74 05                	je     80104382 <acquire+0x42>
8010437d:	39 4a 08             	cmp    %ecx,0x8(%edx)
80104380:	74 76                	je     801043f8 <acquire+0xb8>
  asm volatile("lock; xchgl %0, %1" :
80104382:	b9 01 00 00 00       	mov    $0x1,%ecx
80104387:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010438e:	66 90                	xchg   %ax,%ax
80104390:	89 c8                	mov    %ecx,%eax
80104392:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lk->locked, 1) != 0)
80104395:	85 c0                	test   %eax,%eax
80104397:	75 f7                	jne    80104390 <acquire+0x50>
  __sync_synchronize();
80104399:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  ebp = (uint*)v - 2;
8010439e:	89 ea                	mov    %ebp,%edx
  lk->cpu = cpu;
801043a0:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801043a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
801043a9:	89 41 08             	mov    %eax,0x8(%ecx)
  for(i = 0; i < 10; i++){
801043ac:	31 c0                	xor    %eax,%eax
801043ae:	66 90                	xchg   %ax,%ax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801043b0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801043b6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801043bc:	77 1a                	ja     801043d8 <acquire+0x98>
    pcs[i] = ebp[1];     // saved %eip
801043be:	8b 5a 04             	mov    0x4(%edx),%ebx
801043c1:	89 5c 81 0c          	mov    %ebx,0xc(%ecx,%eax,4)
  for(i = 0; i < 10; i++){
801043c5:	83 c0 01             	add    $0x1,%eax
    ebp = (uint*)ebp[0]; // saved %ebp
801043c8:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
801043ca:	83 f8 0a             	cmp    $0xa,%eax
801043cd:	75 e1                	jne    801043b0 <acquire+0x70>
}
801043cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043d2:	c9                   	leave  
801043d3:	c3                   	ret    
801043d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(; i < 10; i++)
801043d8:	8d 44 81 0c          	lea    0xc(%ecx,%eax,4),%eax
801043dc:	83 c1 34             	add    $0x34,%ecx
801043df:	90                   	nop
    pcs[i] = 0;
801043e0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
801043e6:	83 c0 04             	add    $0x4,%eax
801043e9:	39 c8                	cmp    %ecx,%eax
801043eb:	75 f3                	jne    801043e0 <acquire+0xa0>
}
801043ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043f0:	c9                   	leave  
801043f1:	c3                   	ret    
801043f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("acquire");
801043f8:	83 ec 0c             	sub    $0xc,%esp
801043fb:	68 24 76 10 80       	push   $0x80107624
80104400:	e8 7b bf ff ff       	call   80100380 <panic>
80104405:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010440c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104410 <getcallerpcs>:
{
80104410:	f3 0f 1e fb          	endbr32 
80104414:	55                   	push   %ebp
  for(i = 0; i < 10; i++){
80104415:	31 d2                	xor    %edx,%edx
{
80104417:	89 e5                	mov    %esp,%ebp
80104419:	53                   	push   %ebx
  ebp = (uint*)v - 2;
8010441a:	8b 45 08             	mov    0x8(%ebp),%eax
{
8010441d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
80104420:	83 e8 08             	sub    $0x8,%eax
  for(i = 0; i < 10; i++){
80104423:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104427:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104428:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
8010442e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104434:	77 1a                	ja     80104450 <getcallerpcs+0x40>
    pcs[i] = ebp[1];     // saved %eip
80104436:	8b 58 04             	mov    0x4(%eax),%ebx
80104439:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
8010443c:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
8010443f:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104441:	83 fa 0a             	cmp    $0xa,%edx
80104444:	75 e2                	jne    80104428 <getcallerpcs+0x18>
}
80104446:	5b                   	pop    %ebx
80104447:	5d                   	pop    %ebp
80104448:	c3                   	ret    
80104449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(; i < 10; i++)
80104450:	8d 04 91             	lea    (%ecx,%edx,4),%eax
80104453:	8d 51 28             	lea    0x28(%ecx),%edx
80104456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010445d:	8d 76 00             	lea    0x0(%esi),%esi
    pcs[i] = 0;
80104460:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
80104466:	83 c0 04             	add    $0x4,%eax
80104469:	39 d0                	cmp    %edx,%eax
8010446b:	75 f3                	jne    80104460 <getcallerpcs+0x50>
}
8010446d:	5b                   	pop    %ebx
8010446e:	5d                   	pop    %ebp
8010446f:	c3                   	ret    

80104470 <holding>:
{
80104470:	f3 0f 1e fb          	endbr32 
80104474:	55                   	push   %ebp
80104475:	89 e5                	mov    %esp,%ebp
80104477:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
8010447a:	8b 02                	mov    (%edx),%eax
8010447c:	85 c0                	test   %eax,%eax
8010447e:	74 18                	je     80104498 <holding+0x28>
80104480:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104486:	39 42 08             	cmp    %eax,0x8(%edx)
80104489:	0f 94 c0             	sete   %al
}
8010448c:	5d                   	pop    %ebp
  return lock->locked && lock->cpu == cpu;
8010448d:	0f b6 c0             	movzbl %al,%eax
}
80104490:	c3                   	ret    
80104491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104498:	31 c0                	xor    %eax,%eax
8010449a:	5d                   	pop    %ebp
8010449b:	c3                   	ret    
8010449c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801044a0 <pushcli>:
{
801044a0:	f3 0f 1e fb          	endbr32 
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801044a4:	9c                   	pushf  
801044a5:	59                   	pop    %ecx
  asm volatile("cli");
801044a6:	fa                   	cli    
  if(cpu->ncli == 0)
801044a7:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801044ae:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
801044b4:	85 c0                	test   %eax,%eax
801044b6:	75 0c                	jne    801044c4 <pushcli+0x24>
    cpu->intena = eflags & FL_IF;
801044b8:	81 e1 00 02 00 00    	and    $0x200,%ecx
801044be:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
  cpu->ncli += 1;
801044c4:	83 c0 01             	add    $0x1,%eax
801044c7:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
}
801044cd:	c3                   	ret    
801044ce:	66 90                	xchg   %ax,%ax

801044d0 <popcli>:

void
popcli(void)
{
801044d0:	f3 0f 1e fb          	endbr32 
801044d4:	55                   	push   %ebp
801044d5:	89 e5                	mov    %esp,%ebp
801044d7:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801044da:	9c                   	pushf  
801044db:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801044dc:	f6 c4 02             	test   $0x2,%ah
801044df:	75 2c                	jne    8010450d <popcli+0x3d>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
801044e1:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801044e8:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
801044ef:	78 0f                	js     80104500 <popcli+0x30>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
801044f1:	75 0b                	jne    801044fe <popcli+0x2e>
801044f3:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
801044f9:	85 c0                	test   %eax,%eax
801044fb:	74 01                	je     801044fe <popcli+0x2e>
  asm volatile("sti");
801044fd:	fb                   	sti    
    sti();
}
801044fe:	c9                   	leave  
801044ff:	c3                   	ret    
    panic("popcli");
80104500:	83 ec 0c             	sub    $0xc,%esp
80104503:	68 43 76 10 80       	push   $0x80107643
80104508:	e8 73 be ff ff       	call   80100380 <panic>
    panic("popcli - interruptible");
8010450d:	83 ec 0c             	sub    $0xc,%esp
80104510:	68 2c 76 10 80       	push   $0x8010762c
80104515:	e8 66 be ff ff       	call   80100380 <panic>
8010451a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104520 <release>:
{
80104520:	f3 0f 1e fb          	endbr32 
80104524:	55                   	push   %ebp
80104525:	89 e5                	mov    %esp,%ebp
80104527:	83 ec 08             	sub    $0x8,%esp
8010452a:	8b 45 08             	mov    0x8(%ebp),%eax
  return lock->locked && lock->cpu == cpu;
8010452d:	8b 10                	mov    (%eax),%edx
8010452f:	85 d2                	test   %edx,%edx
80104531:	74 0c                	je     8010453f <release+0x1f>
80104533:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
8010453a:	39 50 08             	cmp    %edx,0x8(%eax)
8010453d:	74 11                	je     80104550 <release+0x30>
    panic("release");
8010453f:	83 ec 0c             	sub    $0xc,%esp
80104542:	68 4a 76 10 80       	push   $0x8010764a
80104547:	e8 34 be ff ff       	call   80100380 <panic>
8010454c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  lk->pcs[0] = 0;
80104550:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
80104557:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  __sync_synchronize();
8010455e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->locked = 0;
80104563:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
80104569:	c9                   	leave  
  popcli();
8010456a:	e9 61 ff ff ff       	jmp    801044d0 <popcli>
8010456f:	90                   	nop

80104570 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104570:	f3 0f 1e fb          	endbr32 
80104574:	55                   	push   %ebp
80104575:	89 e5                	mov    %esp,%ebp
80104577:	57                   	push   %edi
80104578:	8b 55 08             	mov    0x8(%ebp),%edx
8010457b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010457e:	53                   	push   %ebx
8010457f:	8b 45 0c             	mov    0xc(%ebp),%eax
  if ((int)dst%4 == 0 && n%4 == 0){
80104582:	89 d7                	mov    %edx,%edi
80104584:	09 cf                	or     %ecx,%edi
80104586:	83 e7 03             	and    $0x3,%edi
80104589:	75 25                	jne    801045b0 <memset+0x40>
    c &= 0xFF;
8010458b:	0f b6 f8             	movzbl %al,%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010458e:	c1 e0 18             	shl    $0x18,%eax
80104591:	89 fb                	mov    %edi,%ebx
80104593:	c1 e9 02             	shr    $0x2,%ecx
80104596:	c1 e3 10             	shl    $0x10,%ebx
80104599:	09 d8                	or     %ebx,%eax
8010459b:	09 f8                	or     %edi,%eax
8010459d:	c1 e7 08             	shl    $0x8,%edi
801045a0:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
801045a2:	89 d7                	mov    %edx,%edi
801045a4:	fc                   	cld    
801045a5:	f3 ab                	rep stos %eax,%es:(%edi)
  } else
    stosb(dst, c, n);
  return dst;
}
801045a7:	5b                   	pop    %ebx
801045a8:	89 d0                	mov    %edx,%eax
801045aa:	5f                   	pop    %edi
801045ab:	5d                   	pop    %ebp
801045ac:	c3                   	ret    
801045ad:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("cld; rep stosb" :
801045b0:	89 d7                	mov    %edx,%edi
801045b2:	fc                   	cld    
801045b3:	f3 aa                	rep stos %al,%es:(%edi)
801045b5:	5b                   	pop    %ebx
801045b6:	89 d0                	mov    %edx,%eax
801045b8:	5f                   	pop    %edi
801045b9:	5d                   	pop    %ebp
801045ba:	c3                   	ret    
801045bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045bf:	90                   	nop

801045c0 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
801045c0:	f3 0f 1e fb          	endbr32 
801045c4:	55                   	push   %ebp
801045c5:	89 e5                	mov    %esp,%ebp
801045c7:	56                   	push   %esi
801045c8:	8b 75 10             	mov    0x10(%ebp),%esi
801045cb:	8b 55 08             	mov    0x8(%ebp),%edx
801045ce:	53                   	push   %ebx
801045cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801045d2:	85 f6                	test   %esi,%esi
801045d4:	74 2a                	je     80104600 <memcmp+0x40>
801045d6:	01 c6                	add    %eax,%esi
801045d8:	eb 10                	jmp    801045ea <memcmp+0x2a>
801045da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
801045e0:	83 c0 01             	add    $0x1,%eax
801045e3:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0){
801045e6:	39 f0                	cmp    %esi,%eax
801045e8:	74 16                	je     80104600 <memcmp+0x40>
    if(*s1 != *s2)
801045ea:	0f b6 0a             	movzbl (%edx),%ecx
801045ed:	0f b6 18             	movzbl (%eax),%ebx
801045f0:	38 d9                	cmp    %bl,%cl
801045f2:	74 ec                	je     801045e0 <memcmp+0x20>
      return *s1 - *s2;
801045f4:	0f b6 c1             	movzbl %cl,%eax
801045f7:	29 d8                	sub    %ebx,%eax
  }

  return 0;
}
801045f9:	5b                   	pop    %ebx
801045fa:	5e                   	pop    %esi
801045fb:	5d                   	pop    %ebp
801045fc:	c3                   	ret    
801045fd:	8d 76 00             	lea    0x0(%esi),%esi
80104600:	5b                   	pop    %ebx
  return 0;
80104601:	31 c0                	xor    %eax,%eax
}
80104603:	5e                   	pop    %esi
80104604:	5d                   	pop    %ebp
80104605:	c3                   	ret    
80104606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010460d:	8d 76 00             	lea    0x0(%esi),%esi

80104610 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104610:	f3 0f 1e fb          	endbr32 
80104614:	55                   	push   %ebp
80104615:	89 e5                	mov    %esp,%ebp
80104617:	57                   	push   %edi
80104618:	8b 55 08             	mov    0x8(%ebp),%edx
8010461b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010461e:	56                   	push   %esi
8010461f:	8b 75 0c             	mov    0xc(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
80104622:	39 d6                	cmp    %edx,%esi
80104624:	73 2a                	jae    80104650 <memmove+0x40>
80104626:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
80104629:	39 fa                	cmp    %edi,%edx
8010462b:	73 23                	jae    80104650 <memmove+0x40>
8010462d:	8d 41 ff             	lea    -0x1(%ecx),%eax
    s += n;
    d += n;
    while(n-- > 0)
80104630:	85 c9                	test   %ecx,%ecx
80104632:	74 13                	je     80104647 <memmove+0x37>
80104634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *--d = *--s;
80104638:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
8010463c:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    while(n-- > 0)
8010463f:	83 e8 01             	sub    $0x1,%eax
80104642:	83 f8 ff             	cmp    $0xffffffff,%eax
80104645:	75 f1                	jne    80104638 <memmove+0x28>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
80104647:	5e                   	pop    %esi
80104648:	89 d0                	mov    %edx,%eax
8010464a:	5f                   	pop    %edi
8010464b:	5d                   	pop    %ebp
8010464c:	c3                   	ret    
8010464d:	8d 76 00             	lea    0x0(%esi),%esi
    while(n-- > 0)
80104650:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
80104653:	89 d7                	mov    %edx,%edi
80104655:	85 c9                	test   %ecx,%ecx
80104657:	74 ee                	je     80104647 <memmove+0x37>
80104659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *d++ = *s++;
80104660:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    while(n-- > 0)
80104661:	39 f0                	cmp    %esi,%eax
80104663:	75 fb                	jne    80104660 <memmove+0x50>
}
80104665:	5e                   	pop    %esi
80104666:	89 d0                	mov    %edx,%eax
80104668:	5f                   	pop    %edi
80104669:	5d                   	pop    %ebp
8010466a:	c3                   	ret    
8010466b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010466f:	90                   	nop

80104670 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104670:	f3 0f 1e fb          	endbr32 
  return memmove(dst, src, n);
80104674:	eb 9a                	jmp    80104610 <memmove>
80104676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010467d:	8d 76 00             	lea    0x0(%esi),%esi

80104680 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104680:	f3 0f 1e fb          	endbr32 
80104684:	55                   	push   %ebp
80104685:	89 e5                	mov    %esp,%ebp
80104687:	56                   	push   %esi
80104688:	8b 75 10             	mov    0x10(%ebp),%esi
8010468b:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010468e:	53                   	push   %ebx
8010468f:	8b 45 0c             	mov    0xc(%ebp),%eax
  while(n > 0 && *p && *p == *q)
80104692:	85 f6                	test   %esi,%esi
80104694:	74 32                	je     801046c8 <strncmp+0x48>
80104696:	01 c6                	add    %eax,%esi
80104698:	eb 14                	jmp    801046ae <strncmp+0x2e>
8010469a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046a0:	38 da                	cmp    %bl,%dl
801046a2:	75 14                	jne    801046b8 <strncmp+0x38>
    n--, p++, q++;
801046a4:	83 c0 01             	add    $0x1,%eax
801046a7:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
801046aa:	39 f0                	cmp    %esi,%eax
801046ac:	74 1a                	je     801046c8 <strncmp+0x48>
801046ae:	0f b6 11             	movzbl (%ecx),%edx
801046b1:	0f b6 18             	movzbl (%eax),%ebx
801046b4:	84 d2                	test   %dl,%dl
801046b6:	75 e8                	jne    801046a0 <strncmp+0x20>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
801046b8:	0f b6 c2             	movzbl %dl,%eax
801046bb:	29 d8                	sub    %ebx,%eax
}
801046bd:	5b                   	pop    %ebx
801046be:	5e                   	pop    %esi
801046bf:	5d                   	pop    %ebp
801046c0:	c3                   	ret    
801046c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046c8:	5b                   	pop    %ebx
    return 0;
801046c9:	31 c0                	xor    %eax,%eax
}
801046cb:	5e                   	pop    %esi
801046cc:	5d                   	pop    %ebp
801046cd:	c3                   	ret    
801046ce:	66 90                	xchg   %ax,%ax

801046d0 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
801046d0:	f3 0f 1e fb          	endbr32 
801046d4:	55                   	push   %ebp
801046d5:	89 e5                	mov    %esp,%ebp
801046d7:	57                   	push   %edi
801046d8:	56                   	push   %esi
801046d9:	8b 75 08             	mov    0x8(%ebp),%esi
801046dc:	53                   	push   %ebx
801046dd:	8b 45 10             	mov    0x10(%ebp),%eax
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
801046e0:	89 f2                	mov    %esi,%edx
801046e2:	eb 1b                	jmp    801046ff <strncpy+0x2f>
801046e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046e8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
801046ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
801046ef:	83 c2 01             	add    $0x1,%edx
801046f2:	0f b6 7f ff          	movzbl -0x1(%edi),%edi
801046f6:	89 f9                	mov    %edi,%ecx
801046f8:	88 4a ff             	mov    %cl,-0x1(%edx)
801046fb:	84 c9                	test   %cl,%cl
801046fd:	74 09                	je     80104708 <strncpy+0x38>
801046ff:	89 c3                	mov    %eax,%ebx
80104701:	83 e8 01             	sub    $0x1,%eax
80104704:	85 db                	test   %ebx,%ebx
80104706:	7f e0                	jg     801046e8 <strncpy+0x18>
    ;
  while(n-- > 0)
80104708:	89 d1                	mov    %edx,%ecx
8010470a:	85 c0                	test   %eax,%eax
8010470c:	7e 15                	jle    80104723 <strncpy+0x53>
8010470e:	66 90                	xchg   %ax,%ax
    *s++ = 0;
80104710:	83 c1 01             	add    $0x1,%ecx
80104713:	c6 41 ff 00          	movb   $0x0,-0x1(%ecx)
  while(n-- > 0)
80104717:	89 c8                	mov    %ecx,%eax
80104719:	f7 d0                	not    %eax
8010471b:	01 d0                	add    %edx,%eax
8010471d:	01 d8                	add    %ebx,%eax
8010471f:	85 c0                	test   %eax,%eax
80104721:	7f ed                	jg     80104710 <strncpy+0x40>
  return os;
}
80104723:	5b                   	pop    %ebx
80104724:	89 f0                	mov    %esi,%eax
80104726:	5e                   	pop    %esi
80104727:	5f                   	pop    %edi
80104728:	5d                   	pop    %ebp
80104729:	c3                   	ret    
8010472a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104730 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104730:	f3 0f 1e fb          	endbr32 
80104734:	55                   	push   %ebp
80104735:	89 e5                	mov    %esp,%ebp
80104737:	56                   	push   %esi
80104738:	8b 55 10             	mov    0x10(%ebp),%edx
8010473b:	8b 75 08             	mov    0x8(%ebp),%esi
8010473e:	53                   	push   %ebx
8010473f:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *os;

  os = s;
  if(n <= 0)
80104742:	85 d2                	test   %edx,%edx
80104744:	7e 21                	jle    80104767 <safestrcpy+0x37>
80104746:	8d 5c 10 ff          	lea    -0x1(%eax,%edx,1),%ebx
8010474a:	89 f2                	mov    %esi,%edx
8010474c:	eb 12                	jmp    80104760 <safestrcpy+0x30>
8010474e:	66 90                	xchg   %ax,%ax
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104750:	0f b6 08             	movzbl (%eax),%ecx
80104753:	83 c0 01             	add    $0x1,%eax
80104756:	83 c2 01             	add    $0x1,%edx
80104759:	88 4a ff             	mov    %cl,-0x1(%edx)
8010475c:	84 c9                	test   %cl,%cl
8010475e:	74 04                	je     80104764 <safestrcpy+0x34>
80104760:	39 d8                	cmp    %ebx,%eax
80104762:	75 ec                	jne    80104750 <safestrcpy+0x20>
    ;
  *s = 0;
80104764:	c6 02 00             	movb   $0x0,(%edx)
  return os;
}
80104767:	89 f0                	mov    %esi,%eax
80104769:	5b                   	pop    %ebx
8010476a:	5e                   	pop    %esi
8010476b:	5d                   	pop    %ebp
8010476c:	c3                   	ret    
8010476d:	8d 76 00             	lea    0x0(%esi),%esi

80104770 <strlen>:

int
strlen(const char *s)
{
80104770:	f3 0f 1e fb          	endbr32 
80104774:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104775:	31 c0                	xor    %eax,%eax
{
80104777:	89 e5                	mov    %esp,%ebp
80104779:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
8010477c:	80 3a 00             	cmpb   $0x0,(%edx)
8010477f:	74 10                	je     80104791 <strlen+0x21>
80104781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104788:	83 c0 01             	add    $0x1,%eax
8010478b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
8010478f:	75 f7                	jne    80104788 <strlen+0x18>
    ;
  return n;
}
80104791:	5d                   	pop    %ebp
80104792:	c3                   	ret    

80104793 <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
80104793:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80104797:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
8010479b:	55                   	push   %ebp
  pushl %ebx
8010479c:	53                   	push   %ebx
  pushl %esi
8010479d:	56                   	push   %esi
  pushl %edi
8010479e:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
8010479f:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
801047a1:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
801047a3:	5f                   	pop    %edi
  popl %esi
801047a4:	5e                   	pop    %esi
  popl %ebx
801047a5:	5b                   	pop    %ebx
  popl %ebp
801047a6:	5d                   	pop    %ebp
  ret
801047a7:	c3                   	ret    
801047a8:	66 90                	xchg   %ax,%ax
801047aa:	66 90                	xchg   %ax,%ax
801047ac:	66 90                	xchg   %ax,%ax
801047ae:	66 90                	xchg   %ax,%ax

801047b0 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801047b0:	f3 0f 1e fb          	endbr32 
801047b4:	55                   	push   %ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
801047b5:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801047bc:	8b 12                	mov    (%edx),%edx
{
801047be:	89 e5                	mov    %esp,%ebp
801047c0:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
801047c3:	39 c2                	cmp    %eax,%edx
801047c5:	76 19                	jbe    801047e0 <fetchint+0x30>
801047c7:	8d 48 04             	lea    0x4(%eax),%ecx
801047ca:	39 ca                	cmp    %ecx,%edx
801047cc:	72 12                	jb     801047e0 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
801047ce:	8b 10                	mov    (%eax),%edx
801047d0:	8b 45 0c             	mov    0xc(%ebp),%eax
801047d3:	89 10                	mov    %edx,(%eax)
  return 0;
801047d5:	31 c0                	xor    %eax,%eax
}
801047d7:	5d                   	pop    %ebp
801047d8:	c3                   	ret    
801047d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801047e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801047e5:	5d                   	pop    %ebp
801047e6:	c3                   	ret    
801047e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047ee:	66 90                	xchg   %ax,%ax

801047f0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801047f0:	f3 0f 1e fb          	endbr32 
801047f4:	55                   	push   %ebp
  char *s, *ep;

  if(addr >= proc->sz)
801047f5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
{
801047fb:	89 e5                	mov    %esp,%ebp
801047fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if(addr >= proc->sz)
80104800:	39 08                	cmp    %ecx,(%eax)
80104802:	76 2c                	jbe    80104830 <fetchstr+0x40>
    return -1;
  *pp = (char*)addr;
80104804:	8b 45 0c             	mov    0xc(%ebp),%eax
80104807:	89 08                	mov    %ecx,(%eax)
  ep = (char*)proc->sz;
80104809:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010480f:	8b 10                	mov    (%eax),%edx
  for(s = *pp; s < ep; s++)
80104811:	39 d1                	cmp    %edx,%ecx
80104813:	73 1b                	jae    80104830 <fetchstr+0x40>
80104815:	89 c8                	mov    %ecx,%eax
80104817:	eb 0e                	jmp    80104827 <fetchstr+0x37>
80104819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104820:	83 c0 01             	add    $0x1,%eax
80104823:	39 c2                	cmp    %eax,%edx
80104825:	76 09                	jbe    80104830 <fetchstr+0x40>
    if(*s == 0)
80104827:	80 38 00             	cmpb   $0x0,(%eax)
8010482a:	75 f4                	jne    80104820 <fetchstr+0x30>
      return s - *pp;
8010482c:	29 c8                	sub    %ecx,%eax
  return -1;
}
8010482e:	5d                   	pop    %ebp
8010482f:	c3                   	ret    
    return -1;
80104830:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104835:	5d                   	pop    %ebp
80104836:	c3                   	ret    
80104837:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010483e:	66 90                	xchg   %ax,%ax

80104840 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104840:	f3 0f 1e fb          	endbr32 
80104844:	55                   	push   %ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104845:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010484c:	8b 42 18             	mov    0x18(%edx),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
8010484f:	8b 12                	mov    (%edx),%edx
{
80104851:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104853:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104856:	8b 40 44             	mov    0x44(%eax),%eax
80104859:	8d 04 88             	lea    (%eax,%ecx,4),%eax
8010485c:	8d 48 04             	lea    0x4(%eax),%ecx
  if(addr >= proc->sz || addr+4 > proc->sz)
8010485f:	39 d1                	cmp    %edx,%ecx
80104861:	73 1d                	jae    80104880 <argint+0x40>
80104863:	8d 48 08             	lea    0x8(%eax),%ecx
80104866:	39 ca                	cmp    %ecx,%edx
80104868:	72 16                	jb     80104880 <argint+0x40>
  *ip = *(int*)(addr);
8010486a:	8b 50 04             	mov    0x4(%eax),%edx
8010486d:	8b 45 0c             	mov    0xc(%ebp),%eax
80104870:	89 10                	mov    %edx,(%eax)
  return 0;
80104872:	31 c0                	xor    %eax,%eax
}
80104874:	5d                   	pop    %ebp
80104875:	c3                   	ret    
80104876:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010487d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104880:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104885:	5d                   	pop    %ebp
80104886:	c3                   	ret    
80104887:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010488e:	66 90                	xchg   %ax,%ax

80104890 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size n bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104890:	f3 0f 1e fb          	endbr32 
80104894:	55                   	push   %ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104895:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010489b:	8b 50 18             	mov    0x18(%eax),%edx
  if(addr >= proc->sz || addr+4 > proc->sz)
8010489e:	8b 00                	mov    (%eax),%eax
{
801048a0:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801048a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
801048a5:	8b 52 44             	mov    0x44(%edx),%edx
801048a8:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
801048ab:	8d 4a 04             	lea    0x4(%edx),%ecx
  if(addr >= proc->sz || addr+4 > proc->sz)
801048ae:	39 c1                	cmp    %eax,%ecx
801048b0:	73 26                	jae    801048d8 <argptr+0x48>
801048b2:	8d 4a 08             	lea    0x8(%edx),%ecx
801048b5:	39 c8                	cmp    %ecx,%eax
801048b7:	72 1f                	jb     801048d8 <argptr+0x48>
  *ip = *(int*)(addr);
801048b9:	8b 52 04             	mov    0x4(%edx),%edx
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if((uint)i >= proc->sz || (uint)i+size > proc->sz)
801048bc:	39 c2                	cmp    %eax,%edx
801048be:	73 18                	jae    801048d8 <argptr+0x48>
801048c0:	8b 4d 10             	mov    0x10(%ebp),%ecx
801048c3:	01 d1                	add    %edx,%ecx
801048c5:	39 c1                	cmp    %eax,%ecx
801048c7:	77 0f                	ja     801048d8 <argptr+0x48>
    return -1;
  *pp = (char*)i;
801048c9:	8b 45 0c             	mov    0xc(%ebp),%eax
801048cc:	89 10                	mov    %edx,(%eax)
  return 0;
801048ce:	31 c0                	xor    %eax,%eax
}
801048d0:	5d                   	pop    %ebp
801048d1:	c3                   	ret    
801048d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
801048d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801048dd:	5d                   	pop    %ebp
801048de:	c3                   	ret    
801048df:	90                   	nop

801048e0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801048e0:	f3 0f 1e fb          	endbr32 
801048e4:	55                   	push   %ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801048e5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801048eb:	8b 50 18             	mov    0x18(%eax),%edx
  if(addr >= proc->sz || addr+4 > proc->sz)
801048ee:	8b 00                	mov    (%eax),%eax
{
801048f0:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801048f2:	8b 4d 08             	mov    0x8(%ebp),%ecx
801048f5:	8b 52 44             	mov    0x44(%edx),%edx
801048f8:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
801048fb:	8d 4a 04             	lea    0x4(%edx),%ecx
  if(addr >= proc->sz || addr+4 > proc->sz)
801048fe:	39 c1                	cmp    %eax,%ecx
80104900:	73 3e                	jae    80104940 <argstr+0x60>
80104902:	8d 4a 08             	lea    0x8(%edx),%ecx
80104905:	39 c8                	cmp    %ecx,%eax
80104907:	72 37                	jb     80104940 <argstr+0x60>
  *ip = *(int*)(addr);
80104909:	8b 4a 04             	mov    0x4(%edx),%ecx
  if(addr >= proc->sz)
8010490c:	39 c1                	cmp    %eax,%ecx
8010490e:	73 30                	jae    80104940 <argstr+0x60>
  *pp = (char*)addr;
80104910:	8b 45 0c             	mov    0xc(%ebp),%eax
80104913:	89 08                	mov    %ecx,(%eax)
  ep = (char*)proc->sz;
80104915:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010491b:	8b 10                	mov    (%eax),%edx
  for(s = *pp; s < ep; s++)
8010491d:	39 d1                	cmp    %edx,%ecx
8010491f:	73 1f                	jae    80104940 <argstr+0x60>
80104921:	89 c8                	mov    %ecx,%eax
80104923:	eb 0a                	jmp    8010492f <argstr+0x4f>
80104925:	8d 76 00             	lea    0x0(%esi),%esi
80104928:	83 c0 01             	add    $0x1,%eax
8010492b:	39 c2                	cmp    %eax,%edx
8010492d:	76 11                	jbe    80104940 <argstr+0x60>
    if(*s == 0)
8010492f:	80 38 00             	cmpb   $0x0,(%eax)
80104932:	75 f4                	jne    80104928 <argstr+0x48>
      return s - *pp;
80104934:	29 c8                	sub    %ecx,%eax
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104936:	5d                   	pop    %ebp
80104937:	c3                   	ret    
80104938:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010493f:	90                   	nop
    return -1;
80104940:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104945:	5d                   	pop    %ebp
80104946:	c3                   	ret    
80104947:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010494e:	66 90                	xchg   %ax,%ax

80104950 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
80104950:	f3 0f 1e fb          	endbr32 
80104954:	55                   	push   %ebp
80104955:	89 e5                	mov    %esp,%ebp
80104957:	83 ec 08             	sub    $0x8,%esp
  int num;

  num = proc->tf->eax;
8010495a:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104961:	8b 42 18             	mov    0x18(%edx),%eax
80104964:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104967:	8d 48 ff             	lea    -0x1(%eax),%ecx
8010496a:	83 f9 14             	cmp    $0x14,%ecx
8010496d:	77 21                	ja     80104990 <syscall+0x40>
8010496f:	8b 0c 85 80 76 10 80 	mov    -0x7fef8980(,%eax,4),%ecx
80104976:	85 c9                	test   %ecx,%ecx
80104978:	74 16                	je     80104990 <syscall+0x40>
    proc->tf->eax = syscalls[num]();
8010497a:	ff d1                	call   *%ecx
8010497c:	89 c2                	mov    %eax,%edx
8010497e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104984:	8b 40 18             	mov    0x18(%eax),%eax
80104987:	89 50 1c             	mov    %edx,0x1c(%eax)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
8010498a:	c9                   	leave  
8010498b:	c3                   	ret    
8010498c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%d %s: unknown sys call %d\n",
80104990:	50                   	push   %eax
            proc->pid, proc->name, num);
80104991:	8d 42 6c             	lea    0x6c(%edx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104994:	50                   	push   %eax
80104995:	ff 72 10             	pushl  0x10(%edx)
80104998:	68 52 76 10 80       	push   $0x80107652
8010499d:	e8 fe bc ff ff       	call   801006a0 <cprintf>
    proc->tf->eax = -1;
801049a2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801049a8:	83 c4 10             	add    $0x10,%esp
801049ab:	8b 40 18             	mov    0x18(%eax),%eax
801049ae:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
801049b5:	c9                   	leave  
801049b6:	c3                   	ret    
801049b7:	66 90                	xchg   %ax,%ax
801049b9:	66 90                	xchg   %ax,%ax
801049bb:	66 90                	xchg   %ax,%ax
801049bd:	66 90                	xchg   %ax,%ax
801049bf:	90                   	nop

801049c0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801049c0:	55                   	push   %ebp
801049c1:	89 e5                	mov    %esp,%ebp
801049c3:	57                   	push   %edi
801049c4:	56                   	push   %esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801049c5:	8d 7d da             	lea    -0x26(%ebp),%edi
{
801049c8:	53                   	push   %ebx
801049c9:	83 ec 44             	sub    $0x44,%esp
801049cc:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801049cf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
801049d2:	57                   	push   %edi
801049d3:	50                   	push   %eax
{
801049d4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801049d7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  if((dp = nameiparent(path, name)) == 0)
801049da:	e8 61 d6 ff ff       	call   80102040 <nameiparent>
801049df:	83 c4 10             	add    $0x10,%esp
801049e2:	85 c0                	test   %eax,%eax
801049e4:	0f 84 46 01 00 00    	je     80104b30 <create+0x170>
    return 0;
  ilock(dp);
801049ea:	83 ec 0c             	sub    $0xc,%esp
801049ed:	89 c3                	mov    %eax,%ebx
801049ef:	50                   	push   %eax
801049f0:	e8 1b cd ff ff       	call   80101710 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
801049f5:	83 c4 0c             	add    $0xc,%esp
801049f8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801049fb:	50                   	push   %eax
801049fc:	57                   	push   %edi
801049fd:	53                   	push   %ebx
801049fe:	e8 9d d2 ff ff       	call   80101ca0 <dirlookup>
80104a03:	83 c4 10             	add    $0x10,%esp
80104a06:	89 c6                	mov    %eax,%esi
80104a08:	85 c0                	test   %eax,%eax
80104a0a:	74 54                	je     80104a60 <create+0xa0>
    iunlockput(dp);
80104a0c:	83 ec 0c             	sub    $0xc,%esp
80104a0f:	53                   	push   %ebx
80104a10:	e8 db cf ff ff       	call   801019f0 <iunlockput>
    ilock(ip);
80104a15:	89 34 24             	mov    %esi,(%esp)
80104a18:	e8 f3 cc ff ff       	call   80101710 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104a1d:	83 c4 10             	add    $0x10,%esp
80104a20:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104a25:	75 19                	jne    80104a40 <create+0x80>
80104a27:	66 83 7e 10 02       	cmpw   $0x2,0x10(%esi)
80104a2c:	75 12                	jne    80104a40 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104a2e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a31:	89 f0                	mov    %esi,%eax
80104a33:	5b                   	pop    %ebx
80104a34:	5e                   	pop    %esi
80104a35:	5f                   	pop    %edi
80104a36:	5d                   	pop    %ebp
80104a37:	c3                   	ret    
80104a38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a3f:	90                   	nop
    iunlockput(ip);
80104a40:	83 ec 0c             	sub    $0xc,%esp
80104a43:	56                   	push   %esi
    return 0;
80104a44:	31 f6                	xor    %esi,%esi
    iunlockput(ip);
80104a46:	e8 a5 cf ff ff       	call   801019f0 <iunlockput>
    return 0;
80104a4b:	83 c4 10             	add    $0x10,%esp
}
80104a4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a51:	89 f0                	mov    %esi,%eax
80104a53:	5b                   	pop    %ebx
80104a54:	5e                   	pop    %esi
80104a55:	5f                   	pop    %edi
80104a56:	5d                   	pop    %ebp
80104a57:	c3                   	ret    
80104a58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a5f:	90                   	nop
  if((ip = ialloc(dp->dev, type)) == 0)
80104a60:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104a64:	83 ec 08             	sub    $0x8,%esp
80104a67:	50                   	push   %eax
80104a68:	ff 33                	pushl  (%ebx)
80104a6a:	e8 21 cb ff ff       	call   80101590 <ialloc>
80104a6f:	83 c4 10             	add    $0x10,%esp
80104a72:	89 c6                	mov    %eax,%esi
80104a74:	85 c0                	test   %eax,%eax
80104a76:	0f 84 cd 00 00 00    	je     80104b49 <create+0x189>
  ilock(ip);
80104a7c:	83 ec 0c             	sub    $0xc,%esp
80104a7f:	50                   	push   %eax
80104a80:	e8 8b cc ff ff       	call   80101710 <ilock>
  ip->major = major;
80104a85:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104a89:	66 89 46 12          	mov    %ax,0x12(%esi)
  ip->minor = minor;
80104a8d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104a91:	66 89 46 14          	mov    %ax,0x14(%esi)
  ip->nlink = 1;
80104a95:	b8 01 00 00 00       	mov    $0x1,%eax
80104a9a:	66 89 46 16          	mov    %ax,0x16(%esi)
  iupdate(ip);
80104a9e:	89 34 24             	mov    %esi,(%esp)
80104aa1:	e8 aa cb ff ff       	call   80101650 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104aa6:	83 c4 10             	add    $0x10,%esp
80104aa9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104aae:	74 30                	je     80104ae0 <create+0x120>
  if(dirlink(dp, name, ip->inum) < 0)
80104ab0:	83 ec 04             	sub    $0x4,%esp
80104ab3:	ff 76 04             	pushl  0x4(%esi)
80104ab6:	57                   	push   %edi
80104ab7:	53                   	push   %ebx
80104ab8:	e8 a3 d4 ff ff       	call   80101f60 <dirlink>
80104abd:	83 c4 10             	add    $0x10,%esp
80104ac0:	85 c0                	test   %eax,%eax
80104ac2:	78 78                	js     80104b3c <create+0x17c>
  iunlockput(dp);
80104ac4:	83 ec 0c             	sub    $0xc,%esp
80104ac7:	53                   	push   %ebx
80104ac8:	e8 23 cf ff ff       	call   801019f0 <iunlockput>
  return ip;
80104acd:	83 c4 10             	add    $0x10,%esp
}
80104ad0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ad3:	89 f0                	mov    %esi,%eax
80104ad5:	5b                   	pop    %ebx
80104ad6:	5e                   	pop    %esi
80104ad7:	5f                   	pop    %edi
80104ad8:	5d                   	pop    %ebp
80104ad9:	c3                   	ret    
80104ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iupdate(dp);
80104ae0:	83 ec 0c             	sub    $0xc,%esp
    dp->nlink++;  // for ".."
80104ae3:	66 83 43 16 01       	addw   $0x1,0x16(%ebx)
    iupdate(dp);
80104ae8:	53                   	push   %ebx
80104ae9:	e8 62 cb ff ff       	call   80101650 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104aee:	83 c4 0c             	add    $0xc,%esp
80104af1:	ff 76 04             	pushl  0x4(%esi)
80104af4:	68 f4 76 10 80       	push   $0x801076f4
80104af9:	56                   	push   %esi
80104afa:	e8 61 d4 ff ff       	call   80101f60 <dirlink>
80104aff:	83 c4 10             	add    $0x10,%esp
80104b02:	85 c0                	test   %eax,%eax
80104b04:	78 18                	js     80104b1e <create+0x15e>
80104b06:	83 ec 04             	sub    $0x4,%esp
80104b09:	ff 73 04             	pushl  0x4(%ebx)
80104b0c:	68 f3 76 10 80       	push   $0x801076f3
80104b11:	56                   	push   %esi
80104b12:	e8 49 d4 ff ff       	call   80101f60 <dirlink>
80104b17:	83 c4 10             	add    $0x10,%esp
80104b1a:	85 c0                	test   %eax,%eax
80104b1c:	79 92                	jns    80104ab0 <create+0xf0>
      panic("create dots");
80104b1e:	83 ec 0c             	sub    $0xc,%esp
80104b21:	68 e7 76 10 80       	push   $0x801076e7
80104b26:	e8 55 b8 ff ff       	call   80100380 <panic>
80104b2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b2f:	90                   	nop
}
80104b30:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
80104b33:	31 f6                	xor    %esi,%esi
}
80104b35:	5b                   	pop    %ebx
80104b36:	89 f0                	mov    %esi,%eax
80104b38:	5e                   	pop    %esi
80104b39:	5f                   	pop    %edi
80104b3a:	5d                   	pop    %ebp
80104b3b:	c3                   	ret    
    panic("create: dirlink");
80104b3c:	83 ec 0c             	sub    $0xc,%esp
80104b3f:	68 f6 76 10 80       	push   $0x801076f6
80104b44:	e8 37 b8 ff ff       	call   80100380 <panic>
    panic("create: ialloc");
80104b49:	83 ec 0c             	sub    $0xc,%esp
80104b4c:	68 d8 76 10 80       	push   $0x801076d8
80104b51:	e8 2a b8 ff ff       	call   80100380 <panic>
80104b56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b5d:	8d 76 00             	lea    0x0(%esi),%esi

80104b60 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104b60:	55                   	push   %ebp
80104b61:	89 e5                	mov    %esp,%ebp
80104b63:	56                   	push   %esi
80104b64:	89 d6                	mov    %edx,%esi
80104b66:	53                   	push   %ebx
80104b67:	89 c3                	mov    %eax,%ebx
  if(argint(n, &fd) < 0)
80104b69:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
80104b6c:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104b6f:	50                   	push   %eax
80104b70:	6a 00                	push   $0x0
80104b72:	e8 c9 fc ff ff       	call   80104840 <argint>
80104b77:	83 c4 10             	add    $0x10,%esp
80104b7a:	85 c0                	test   %eax,%eax
80104b7c:	78 32                	js     80104bb0 <argfd.constprop.0+0x50>
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104b7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104b81:	83 f8 0f             	cmp    $0xf,%eax
80104b84:	77 2a                	ja     80104bb0 <argfd.constprop.0+0x50>
80104b86:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104b8d:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104b91:	85 d2                	test   %edx,%edx
80104b93:	74 1b                	je     80104bb0 <argfd.constprop.0+0x50>
  if(pfd)
80104b95:	85 db                	test   %ebx,%ebx
80104b97:	74 02                	je     80104b9b <argfd.constprop.0+0x3b>
    *pfd = fd;
80104b99:	89 03                	mov    %eax,(%ebx)
    *pf = f;
80104b9b:	89 16                	mov    %edx,(%esi)
  return 0;
80104b9d:	31 c0                	xor    %eax,%eax
}
80104b9f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ba2:	5b                   	pop    %ebx
80104ba3:	5e                   	pop    %esi
80104ba4:	5d                   	pop    %ebp
80104ba5:	c3                   	ret    
80104ba6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104bad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104bb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bb5:	eb e8                	jmp    80104b9f <argfd.constprop.0+0x3f>
80104bb7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104bbe:	66 90                	xchg   %ax,%ax

80104bc0 <sys_dup>:
{
80104bc0:	f3 0f 1e fb          	endbr32 
80104bc4:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80104bc5:	31 c0                	xor    %eax,%eax
{
80104bc7:	89 e5                	mov    %esp,%ebp
80104bc9:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
80104bca:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104bcd:	83 ec 14             	sub    $0x14,%esp
  if(argfd(0, 0, &f) < 0)
80104bd0:	e8 8b ff ff ff       	call   80104b60 <argfd.constprop.0>
80104bd5:	85 c0                	test   %eax,%eax
80104bd7:	78 1f                	js     80104bf8 <sys_dup+0x38>
  if((fd=fdalloc(f)) < 0)
80104bd9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    if(proc->ofile[fd] == 0){
80104bdc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(fd = 0; fd < NOFILE; fd++){
80104be2:	31 db                	xor    %ebx,%ebx
80104be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->ofile[fd] == 0){
80104be8:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104bec:	85 c9                	test   %ecx,%ecx
80104bee:	74 18                	je     80104c08 <sys_dup+0x48>
  for(fd = 0; fd < NOFILE; fd++){
80104bf0:	83 c3 01             	add    $0x1,%ebx
80104bf3:	83 fb 10             	cmp    $0x10,%ebx
80104bf6:	75 f0                	jne    80104be8 <sys_dup+0x28>
    return -1;
80104bf8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104bfd:	89 d8                	mov    %ebx,%eax
80104bff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104c02:	c9                   	leave  
80104c03:	c3                   	ret    
80104c04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  filedup(f);
80104c08:	83 ec 0c             	sub    $0xc,%esp
      proc->ofile[fd] = f;
80104c0b:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)
  filedup(f);
80104c0f:	52                   	push   %edx
80104c10:	e8 4b c2 ff ff       	call   80100e60 <filedup>
}
80104c15:	89 d8                	mov    %ebx,%eax
  return fd;
80104c17:	83 c4 10             	add    $0x10,%esp
}
80104c1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104c1d:	c9                   	leave  
80104c1e:	c3                   	ret    
80104c1f:	90                   	nop

80104c20 <sys_read>:
{
80104c20:	f3 0f 1e fb          	endbr32 
80104c24:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c25:	31 c0                	xor    %eax,%eax
{
80104c27:	89 e5                	mov    %esp,%ebp
80104c29:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c2c:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c2f:	e8 2c ff ff ff       	call   80104b60 <argfd.constprop.0>
80104c34:	85 c0                	test   %eax,%eax
80104c36:	78 48                	js     80104c80 <sys_read+0x60>
80104c38:	83 ec 08             	sub    $0x8,%esp
80104c3b:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c3e:	50                   	push   %eax
80104c3f:	6a 02                	push   $0x2
80104c41:	e8 fa fb ff ff       	call   80104840 <argint>
80104c46:	83 c4 10             	add    $0x10,%esp
80104c49:	85 c0                	test   %eax,%eax
80104c4b:	78 33                	js     80104c80 <sys_read+0x60>
80104c4d:	83 ec 04             	sub    $0x4,%esp
80104c50:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c53:	ff 75 f0             	pushl  -0x10(%ebp)
80104c56:	50                   	push   %eax
80104c57:	6a 01                	push   $0x1
80104c59:	e8 32 fc ff ff       	call   80104890 <argptr>
80104c5e:	83 c4 10             	add    $0x10,%esp
80104c61:	85 c0                	test   %eax,%eax
80104c63:	78 1b                	js     80104c80 <sys_read+0x60>
  return fileread(f, p, n);
80104c65:	83 ec 04             	sub    $0x4,%esp
80104c68:	ff 75 f0             	pushl  -0x10(%ebp)
80104c6b:	ff 75 f4             	pushl  -0xc(%ebp)
80104c6e:	ff 75 ec             	pushl  -0x14(%ebp)
80104c71:	e8 6a c3 ff ff       	call   80100fe0 <fileread>
80104c76:	83 c4 10             	add    $0x10,%esp
}
80104c79:	c9                   	leave  
80104c7a:	c3                   	ret    
80104c7b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c7f:	90                   	nop
80104c80:	c9                   	leave  
    return -1;
80104c81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c86:	c3                   	ret    
80104c87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c8e:	66 90                	xchg   %ax,%ax

80104c90 <sys_write>:
{
80104c90:	f3 0f 1e fb          	endbr32 
80104c94:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c95:	31 c0                	xor    %eax,%eax
{
80104c97:	89 e5                	mov    %esp,%ebp
80104c99:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c9c:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c9f:	e8 bc fe ff ff       	call   80104b60 <argfd.constprop.0>
80104ca4:	85 c0                	test   %eax,%eax
80104ca6:	78 48                	js     80104cf0 <sys_write+0x60>
80104ca8:	83 ec 08             	sub    $0x8,%esp
80104cab:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cae:	50                   	push   %eax
80104caf:	6a 02                	push   $0x2
80104cb1:	e8 8a fb ff ff       	call   80104840 <argint>
80104cb6:	83 c4 10             	add    $0x10,%esp
80104cb9:	85 c0                	test   %eax,%eax
80104cbb:	78 33                	js     80104cf0 <sys_write+0x60>
80104cbd:	83 ec 04             	sub    $0x4,%esp
80104cc0:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cc3:	ff 75 f0             	pushl  -0x10(%ebp)
80104cc6:	50                   	push   %eax
80104cc7:	6a 01                	push   $0x1
80104cc9:	e8 c2 fb ff ff       	call   80104890 <argptr>
80104cce:	83 c4 10             	add    $0x10,%esp
80104cd1:	85 c0                	test   %eax,%eax
80104cd3:	78 1b                	js     80104cf0 <sys_write+0x60>
  return filewrite(f, p, n);
80104cd5:	83 ec 04             	sub    $0x4,%esp
80104cd8:	ff 75 f0             	pushl  -0x10(%ebp)
80104cdb:	ff 75 f4             	pushl  -0xc(%ebp)
80104cde:	ff 75 ec             	pushl  -0x14(%ebp)
80104ce1:	e8 9a c3 ff ff       	call   80101080 <filewrite>
80104ce6:	83 c4 10             	add    $0x10,%esp
}
80104ce9:	c9                   	leave  
80104cea:	c3                   	ret    
80104ceb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104cef:	90                   	nop
80104cf0:	c9                   	leave  
    return -1;
80104cf1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104cf6:	c3                   	ret    
80104cf7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104cfe:	66 90                	xchg   %ax,%ax

80104d00 <sys_close>:
{
80104d00:	f3 0f 1e fb          	endbr32 
80104d04:	55                   	push   %ebp
80104d05:	89 e5                	mov    %esp,%ebp
80104d07:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80104d0a:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104d0d:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d10:	e8 4b fe ff ff       	call   80104b60 <argfd.constprop.0>
80104d15:	85 c0                	test   %eax,%eax
80104d17:	78 27                	js     80104d40 <sys_close+0x40>
  proc->ofile[fd] = 0;
80104d19:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104d1f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104d22:	83 ec 0c             	sub    $0xc,%esp
  proc->ofile[fd] = 0;
80104d25:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104d2c:	00 
  fileclose(f);
80104d2d:	ff 75 f4             	pushl  -0xc(%ebp)
80104d30:	e8 7b c1 ff ff       	call   80100eb0 <fileclose>
  return 0;
80104d35:	83 c4 10             	add    $0x10,%esp
80104d38:	31 c0                	xor    %eax,%eax
}
80104d3a:	c9                   	leave  
80104d3b:	c3                   	ret    
80104d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d40:	c9                   	leave  
    return -1;
80104d41:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d46:	c3                   	ret    
80104d47:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d4e:	66 90                	xchg   %ax,%ax

80104d50 <sys_fstat>:
{
80104d50:	f3 0f 1e fb          	endbr32 
80104d54:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104d55:	31 c0                	xor    %eax,%eax
{
80104d57:	89 e5                	mov    %esp,%ebp
80104d59:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104d5c:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104d5f:	e8 fc fd ff ff       	call   80104b60 <argfd.constprop.0>
80104d64:	85 c0                	test   %eax,%eax
80104d66:	78 30                	js     80104d98 <sys_fstat+0x48>
80104d68:	83 ec 04             	sub    $0x4,%esp
80104d6b:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d6e:	6a 14                	push   $0x14
80104d70:	50                   	push   %eax
80104d71:	6a 01                	push   $0x1
80104d73:	e8 18 fb ff ff       	call   80104890 <argptr>
80104d78:	83 c4 10             	add    $0x10,%esp
80104d7b:	85 c0                	test   %eax,%eax
80104d7d:	78 19                	js     80104d98 <sys_fstat+0x48>
  return filestat(f, st);
80104d7f:	83 ec 08             	sub    $0x8,%esp
80104d82:	ff 75 f4             	pushl  -0xc(%ebp)
80104d85:	ff 75 f0             	pushl  -0x10(%ebp)
80104d88:	e8 03 c2 ff ff       	call   80100f90 <filestat>
80104d8d:	83 c4 10             	add    $0x10,%esp
}
80104d90:	c9                   	leave  
80104d91:	c3                   	ret    
80104d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104d98:	c9                   	leave  
    return -1;
80104d99:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d9e:	c3                   	ret    
80104d9f:	90                   	nop

80104da0 <sys_link>:
{
80104da0:	f3 0f 1e fb          	endbr32 
80104da4:	55                   	push   %ebp
80104da5:	89 e5                	mov    %esp,%ebp
80104da7:	57                   	push   %edi
80104da8:	56                   	push   %esi
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104da9:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80104dac:	53                   	push   %ebx
80104dad:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104db0:	50                   	push   %eax
80104db1:	6a 00                	push   $0x0
80104db3:	e8 28 fb ff ff       	call   801048e0 <argstr>
80104db8:	83 c4 10             	add    $0x10,%esp
80104dbb:	85 c0                	test   %eax,%eax
80104dbd:	0f 88 ff 00 00 00    	js     80104ec2 <sys_link+0x122>
80104dc3:	83 ec 08             	sub    $0x8,%esp
80104dc6:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104dc9:	50                   	push   %eax
80104dca:	6a 01                	push   $0x1
80104dcc:	e8 0f fb ff ff       	call   801048e0 <argstr>
80104dd1:	83 c4 10             	add    $0x10,%esp
80104dd4:	85 c0                	test   %eax,%eax
80104dd6:	0f 88 e6 00 00 00    	js     80104ec2 <sys_link+0x122>
  begin_op();
80104ddc:	e8 df df ff ff       	call   80102dc0 <begin_op>
  if((ip = namei(old)) == 0){
80104de1:	83 ec 0c             	sub    $0xc,%esp
80104de4:	ff 75 d4             	pushl  -0x2c(%ebp)
80104de7:	e8 34 d2 ff ff       	call   80102020 <namei>
80104dec:	83 c4 10             	add    $0x10,%esp
80104def:	89 c3                	mov    %eax,%ebx
80104df1:	85 c0                	test   %eax,%eax
80104df3:	0f 84 e8 00 00 00    	je     80104ee1 <sys_link+0x141>
  ilock(ip);
80104df9:	83 ec 0c             	sub    $0xc,%esp
80104dfc:	50                   	push   %eax
80104dfd:	e8 0e c9 ff ff       	call   80101710 <ilock>
  if(ip->type == T_DIR){
80104e02:	83 c4 10             	add    $0x10,%esp
80104e05:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
80104e0a:	0f 84 b9 00 00 00    	je     80104ec9 <sys_link+0x129>
  iupdate(ip);
80104e10:	83 ec 0c             	sub    $0xc,%esp
  ip->nlink++;
80104e13:	66 83 43 16 01       	addw   $0x1,0x16(%ebx)
  if((dp = nameiparent(new, name)) == 0)
80104e18:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80104e1b:	53                   	push   %ebx
80104e1c:	e8 2f c8 ff ff       	call   80101650 <iupdate>
  iunlock(ip);
80104e21:	89 1c 24             	mov    %ebx,(%esp)
80104e24:	e8 f7 c9 ff ff       	call   80101820 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104e29:	58                   	pop    %eax
80104e2a:	5a                   	pop    %edx
80104e2b:	57                   	push   %edi
80104e2c:	ff 75 d0             	pushl  -0x30(%ebp)
80104e2f:	e8 0c d2 ff ff       	call   80102040 <nameiparent>
80104e34:	83 c4 10             	add    $0x10,%esp
80104e37:	89 c6                	mov    %eax,%esi
80104e39:	85 c0                	test   %eax,%eax
80104e3b:	74 5f                	je     80104e9c <sys_link+0xfc>
  ilock(dp);
80104e3d:	83 ec 0c             	sub    $0xc,%esp
80104e40:	50                   	push   %eax
80104e41:	e8 ca c8 ff ff       	call   80101710 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104e46:	8b 03                	mov    (%ebx),%eax
80104e48:	83 c4 10             	add    $0x10,%esp
80104e4b:	39 06                	cmp    %eax,(%esi)
80104e4d:	75 41                	jne    80104e90 <sys_link+0xf0>
80104e4f:	83 ec 04             	sub    $0x4,%esp
80104e52:	ff 73 04             	pushl  0x4(%ebx)
80104e55:	57                   	push   %edi
80104e56:	56                   	push   %esi
80104e57:	e8 04 d1 ff ff       	call   80101f60 <dirlink>
80104e5c:	83 c4 10             	add    $0x10,%esp
80104e5f:	85 c0                	test   %eax,%eax
80104e61:	78 2d                	js     80104e90 <sys_link+0xf0>
  iunlockput(dp);
80104e63:	83 ec 0c             	sub    $0xc,%esp
80104e66:	56                   	push   %esi
80104e67:	e8 84 cb ff ff       	call   801019f0 <iunlockput>
  iput(ip);
80104e6c:	89 1c 24             	mov    %ebx,(%esp)
80104e6f:	e8 0c ca ff ff       	call   80101880 <iput>
  end_op();
80104e74:	e8 b7 df ff ff       	call   80102e30 <end_op>
  return 0;
80104e79:	83 c4 10             	add    $0x10,%esp
80104e7c:	31 c0                	xor    %eax,%eax
}
80104e7e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e81:	5b                   	pop    %ebx
80104e82:	5e                   	pop    %esi
80104e83:	5f                   	pop    %edi
80104e84:	5d                   	pop    %ebp
80104e85:	c3                   	ret    
80104e86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104e8d:	8d 76 00             	lea    0x0(%esi),%esi
    iunlockput(dp);
80104e90:	83 ec 0c             	sub    $0xc,%esp
80104e93:	56                   	push   %esi
80104e94:	e8 57 cb ff ff       	call   801019f0 <iunlockput>
    goto bad;
80104e99:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80104e9c:	83 ec 0c             	sub    $0xc,%esp
80104e9f:	53                   	push   %ebx
80104ea0:	e8 6b c8 ff ff       	call   80101710 <ilock>
  ip->nlink--;
80104ea5:	66 83 6b 16 01       	subw   $0x1,0x16(%ebx)
  iupdate(ip);
80104eaa:	89 1c 24             	mov    %ebx,(%esp)
80104ead:	e8 9e c7 ff ff       	call   80101650 <iupdate>
  iunlockput(ip);
80104eb2:	89 1c 24             	mov    %ebx,(%esp)
80104eb5:	e8 36 cb ff ff       	call   801019f0 <iunlockput>
  end_op();
80104eba:	e8 71 df ff ff       	call   80102e30 <end_op>
  return -1;
80104ebf:	83 c4 10             	add    $0x10,%esp
80104ec2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ec7:	eb b5                	jmp    80104e7e <sys_link+0xde>
    iunlockput(ip);
80104ec9:	83 ec 0c             	sub    $0xc,%esp
80104ecc:	53                   	push   %ebx
80104ecd:	e8 1e cb ff ff       	call   801019f0 <iunlockput>
    end_op();
80104ed2:	e8 59 df ff ff       	call   80102e30 <end_op>
    return -1;
80104ed7:	83 c4 10             	add    $0x10,%esp
80104eda:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104edf:	eb 9d                	jmp    80104e7e <sys_link+0xde>
    end_op();
80104ee1:	e8 4a df ff ff       	call   80102e30 <end_op>
    return -1;
80104ee6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104eeb:	eb 91                	jmp    80104e7e <sys_link+0xde>
80104eed:	8d 76 00             	lea    0x0(%esi),%esi

80104ef0 <sys_unlink>:
{
80104ef0:	f3 0f 1e fb          	endbr32 
80104ef4:	55                   	push   %ebp
80104ef5:	89 e5                	mov    %esp,%ebp
80104ef7:	57                   	push   %edi
80104ef8:	56                   	push   %esi
  if(argstr(0, &path) < 0)
80104ef9:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80104efc:	53                   	push   %ebx
80104efd:	83 ec 54             	sub    $0x54,%esp
  if(argstr(0, &path) < 0)
80104f00:	50                   	push   %eax
80104f01:	6a 00                	push   $0x0
80104f03:	e8 d8 f9 ff ff       	call   801048e0 <argstr>
80104f08:	83 c4 10             	add    $0x10,%esp
80104f0b:	85 c0                	test   %eax,%eax
80104f0d:	0f 88 7d 01 00 00    	js     80105090 <sys_unlink+0x1a0>
  begin_op();
80104f13:	e8 a8 de ff ff       	call   80102dc0 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104f18:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104f1b:	83 ec 08             	sub    $0x8,%esp
80104f1e:	53                   	push   %ebx
80104f1f:	ff 75 c0             	pushl  -0x40(%ebp)
80104f22:	e8 19 d1 ff ff       	call   80102040 <nameiparent>
80104f27:	83 c4 10             	add    $0x10,%esp
80104f2a:	89 c6                	mov    %eax,%esi
80104f2c:	85 c0                	test   %eax,%eax
80104f2e:	0f 84 66 01 00 00    	je     8010509a <sys_unlink+0x1aa>
  ilock(dp);
80104f34:	83 ec 0c             	sub    $0xc,%esp
80104f37:	50                   	push   %eax
80104f38:	e8 d3 c7 ff ff       	call   80101710 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104f3d:	58                   	pop    %eax
80104f3e:	5a                   	pop    %edx
80104f3f:	68 f4 76 10 80       	push   $0x801076f4
80104f44:	53                   	push   %ebx
80104f45:	e8 36 cd ff ff       	call   80101c80 <namecmp>
80104f4a:	83 c4 10             	add    $0x10,%esp
80104f4d:	85 c0                	test   %eax,%eax
80104f4f:	0f 84 03 01 00 00    	je     80105058 <sys_unlink+0x168>
80104f55:	83 ec 08             	sub    $0x8,%esp
80104f58:	68 f3 76 10 80       	push   $0x801076f3
80104f5d:	53                   	push   %ebx
80104f5e:	e8 1d cd ff ff       	call   80101c80 <namecmp>
80104f63:	83 c4 10             	add    $0x10,%esp
80104f66:	85 c0                	test   %eax,%eax
80104f68:	0f 84 ea 00 00 00    	je     80105058 <sys_unlink+0x168>
  if((ip = dirlookup(dp, name, &off)) == 0)
80104f6e:	83 ec 04             	sub    $0x4,%esp
80104f71:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104f74:	50                   	push   %eax
80104f75:	53                   	push   %ebx
80104f76:	56                   	push   %esi
80104f77:	e8 24 cd ff ff       	call   80101ca0 <dirlookup>
80104f7c:	83 c4 10             	add    $0x10,%esp
80104f7f:	89 c3                	mov    %eax,%ebx
80104f81:	85 c0                	test   %eax,%eax
80104f83:	0f 84 cf 00 00 00    	je     80105058 <sys_unlink+0x168>
  ilock(ip);
80104f89:	83 ec 0c             	sub    $0xc,%esp
80104f8c:	50                   	push   %eax
80104f8d:	e8 7e c7 ff ff       	call   80101710 <ilock>
  if(ip->nlink < 1)
80104f92:	83 c4 10             	add    $0x10,%esp
80104f95:	66 83 7b 16 00       	cmpw   $0x0,0x16(%ebx)
80104f9a:	0f 8e 23 01 00 00    	jle    801050c3 <sys_unlink+0x1d3>
  if(ip->type == T_DIR && !isdirempty(ip)){
80104fa0:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
80104fa5:	8d 7d d8             	lea    -0x28(%ebp),%edi
80104fa8:	74 66                	je     80105010 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
80104faa:	83 ec 04             	sub    $0x4,%esp
80104fad:	6a 10                	push   $0x10
80104faf:	6a 00                	push   $0x0
80104fb1:	57                   	push   %edi
80104fb2:	e8 b9 f5 ff ff       	call   80104570 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104fb7:	6a 10                	push   $0x10
80104fb9:	ff 75 c4             	pushl  -0x3c(%ebp)
80104fbc:	57                   	push   %edi
80104fbd:	56                   	push   %esi
80104fbe:	e8 8d cb ff ff       	call   80101b50 <writei>
80104fc3:	83 c4 20             	add    $0x20,%esp
80104fc6:	83 f8 10             	cmp    $0x10,%eax
80104fc9:	0f 85 e7 00 00 00    	jne    801050b6 <sys_unlink+0x1c6>
  if(ip->type == T_DIR){
80104fcf:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
80104fd4:	0f 84 96 00 00 00    	je     80105070 <sys_unlink+0x180>
  iunlockput(dp);
80104fda:	83 ec 0c             	sub    $0xc,%esp
80104fdd:	56                   	push   %esi
80104fde:	e8 0d ca ff ff       	call   801019f0 <iunlockput>
  ip->nlink--;
80104fe3:	66 83 6b 16 01       	subw   $0x1,0x16(%ebx)
  iupdate(ip);
80104fe8:	89 1c 24             	mov    %ebx,(%esp)
80104feb:	e8 60 c6 ff ff       	call   80101650 <iupdate>
  iunlockput(ip);
80104ff0:	89 1c 24             	mov    %ebx,(%esp)
80104ff3:	e8 f8 c9 ff ff       	call   801019f0 <iunlockput>
  end_op();
80104ff8:	e8 33 de ff ff       	call   80102e30 <end_op>
  return 0;
80104ffd:	83 c4 10             	add    $0x10,%esp
80105000:	31 c0                	xor    %eax,%eax
}
80105002:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105005:	5b                   	pop    %ebx
80105006:	5e                   	pop    %esi
80105007:	5f                   	pop    %edi
80105008:	5d                   	pop    %ebp
80105009:	c3                   	ret    
8010500a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105010:	83 7b 18 20          	cmpl   $0x20,0x18(%ebx)
80105014:	76 94                	jbe    80104faa <sys_unlink+0xba>
80105016:	ba 20 00 00 00       	mov    $0x20,%edx
8010501b:	eb 0b                	jmp    80105028 <sys_unlink+0x138>
8010501d:	8d 76 00             	lea    0x0(%esi),%esi
80105020:	83 c2 10             	add    $0x10,%edx
80105023:	39 53 18             	cmp    %edx,0x18(%ebx)
80105026:	76 82                	jbe    80104faa <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105028:	6a 10                	push   $0x10
8010502a:	52                   	push   %edx
8010502b:	57                   	push   %edi
8010502c:	53                   	push   %ebx
8010502d:	89 55 b4             	mov    %edx,-0x4c(%ebp)
80105030:	e8 1b ca ff ff       	call   80101a50 <readi>
80105035:	83 c4 10             	add    $0x10,%esp
80105038:	8b 55 b4             	mov    -0x4c(%ebp),%edx
8010503b:	83 f8 10             	cmp    $0x10,%eax
8010503e:	75 69                	jne    801050a9 <sys_unlink+0x1b9>
    if(de.inum != 0)
80105040:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105045:	74 d9                	je     80105020 <sys_unlink+0x130>
    iunlockput(ip);
80105047:	83 ec 0c             	sub    $0xc,%esp
8010504a:	53                   	push   %ebx
8010504b:	e8 a0 c9 ff ff       	call   801019f0 <iunlockput>
    goto bad;
80105050:	83 c4 10             	add    $0x10,%esp
80105053:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105057:	90                   	nop
  iunlockput(dp);
80105058:	83 ec 0c             	sub    $0xc,%esp
8010505b:	56                   	push   %esi
8010505c:	e8 8f c9 ff ff       	call   801019f0 <iunlockput>
  end_op();
80105061:	e8 ca dd ff ff       	call   80102e30 <end_op>
  return -1;
80105066:	83 c4 10             	add    $0x10,%esp
80105069:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010506e:	eb 92                	jmp    80105002 <sys_unlink+0x112>
    iupdate(dp);
80105070:	83 ec 0c             	sub    $0xc,%esp
    dp->nlink--;
80105073:	66 83 6e 16 01       	subw   $0x1,0x16(%esi)
    iupdate(dp);
80105078:	56                   	push   %esi
80105079:	e8 d2 c5 ff ff       	call   80101650 <iupdate>
8010507e:	83 c4 10             	add    $0x10,%esp
80105081:	e9 54 ff ff ff       	jmp    80104fda <sys_unlink+0xea>
80105086:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010508d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80105090:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105095:	e9 68 ff ff ff       	jmp    80105002 <sys_unlink+0x112>
    end_op();
8010509a:	e8 91 dd ff ff       	call   80102e30 <end_op>
    return -1;
8010509f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050a4:	e9 59 ff ff ff       	jmp    80105002 <sys_unlink+0x112>
      panic("isdirempty: readi");
801050a9:	83 ec 0c             	sub    $0xc,%esp
801050ac:	68 18 77 10 80       	push   $0x80107718
801050b1:	e8 ca b2 ff ff       	call   80100380 <panic>
    panic("unlink: writei");
801050b6:	83 ec 0c             	sub    $0xc,%esp
801050b9:	68 2a 77 10 80       	push   $0x8010772a
801050be:	e8 bd b2 ff ff       	call   80100380 <panic>
    panic("unlink: nlink < 1");
801050c3:	83 ec 0c             	sub    $0xc,%esp
801050c6:	68 06 77 10 80       	push   $0x80107706
801050cb:	e8 b0 b2 ff ff       	call   80100380 <panic>

801050d0 <sys_open>:

int
sys_open(void)
{
801050d0:	f3 0f 1e fb          	endbr32 
801050d4:	55                   	push   %ebp
801050d5:	89 e5                	mov    %esp,%ebp
801050d7:	57                   	push   %edi
801050d8:	56                   	push   %esi
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801050d9:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
801050dc:	53                   	push   %ebx
801050dd:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801050e0:	50                   	push   %eax
801050e1:	6a 00                	push   $0x0
801050e3:	e8 f8 f7 ff ff       	call   801048e0 <argstr>
801050e8:	83 c4 10             	add    $0x10,%esp
801050eb:	85 c0                	test   %eax,%eax
801050ed:	0f 88 9a 00 00 00    	js     8010518d <sys_open+0xbd>
801050f3:	83 ec 08             	sub    $0x8,%esp
801050f6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801050f9:	50                   	push   %eax
801050fa:	6a 01                	push   $0x1
801050fc:	e8 3f f7 ff ff       	call   80104840 <argint>
80105101:	83 c4 10             	add    $0x10,%esp
80105104:	85 c0                	test   %eax,%eax
80105106:	0f 88 81 00 00 00    	js     8010518d <sys_open+0xbd>
    return -1;

  begin_op();
8010510c:	e8 af dc ff ff       	call   80102dc0 <begin_op>

  if(omode & O_CREATE){
80105111:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105115:	0f 85 7d 00 00 00    	jne    80105198 <sys_open+0xc8>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
8010511b:	83 ec 0c             	sub    $0xc,%esp
8010511e:	ff 75 e0             	pushl  -0x20(%ebp)
80105121:	e8 fa ce ff ff       	call   80102020 <namei>
80105126:	83 c4 10             	add    $0x10,%esp
80105129:	89 c6                	mov    %eax,%esi
8010512b:	85 c0                	test   %eax,%eax
8010512d:	0f 84 82 00 00 00    	je     801051b5 <sys_open+0xe5>
      end_op();
      return -1;
    }
    ilock(ip);
80105133:	83 ec 0c             	sub    $0xc,%esp
80105136:	50                   	push   %eax
80105137:	e8 d4 c5 ff ff       	call   80101710 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
8010513c:	83 c4 10             	add    $0x10,%esp
8010513f:	66 83 7e 10 01       	cmpw   $0x1,0x10(%esi)
80105144:	0f 84 c6 00 00 00    	je     80105210 <sys_open+0x140>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
8010514a:	e8 a1 bc ff ff       	call   80100df0 <filealloc>
8010514f:	89 c7                	mov    %eax,%edi
80105151:	85 c0                	test   %eax,%eax
80105153:	74 27                	je     8010517c <sys_open+0xac>
    if(proc->ofile[fd] == 0){
80105155:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  for(fd = 0; fd < NOFILE; fd++){
8010515c:	31 db                	xor    %ebx,%ebx
8010515e:	66 90                	xchg   %ax,%ax
    if(proc->ofile[fd] == 0){
80105160:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
80105164:	85 c0                	test   %eax,%eax
80105166:	74 60                	je     801051c8 <sys_open+0xf8>
  for(fd = 0; fd < NOFILE; fd++){
80105168:	83 c3 01             	add    $0x1,%ebx
8010516b:	83 fb 10             	cmp    $0x10,%ebx
8010516e:	75 f0                	jne    80105160 <sys_open+0x90>
    if(f)
      fileclose(f);
80105170:	83 ec 0c             	sub    $0xc,%esp
80105173:	57                   	push   %edi
80105174:	e8 37 bd ff ff       	call   80100eb0 <fileclose>
80105179:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010517c:	83 ec 0c             	sub    $0xc,%esp
8010517f:	56                   	push   %esi
80105180:	e8 6b c8 ff ff       	call   801019f0 <iunlockput>
    end_op();
80105185:	e8 a6 dc ff ff       	call   80102e30 <end_op>
    return -1;
8010518a:	83 c4 10             	add    $0x10,%esp
8010518d:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105192:	eb 6d                	jmp    80105201 <sys_open+0x131>
80105194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ip = create(path, T_FILE, 0, 0);
80105198:	83 ec 0c             	sub    $0xc,%esp
8010519b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010519e:	31 c9                	xor    %ecx,%ecx
801051a0:	ba 02 00 00 00       	mov    $0x2,%edx
801051a5:	6a 00                	push   $0x0
801051a7:	e8 14 f8 ff ff       	call   801049c0 <create>
    if(ip == 0){
801051ac:	83 c4 10             	add    $0x10,%esp
    ip = create(path, T_FILE, 0, 0);
801051af:	89 c6                	mov    %eax,%esi
    if(ip == 0){
801051b1:	85 c0                	test   %eax,%eax
801051b3:	75 95                	jne    8010514a <sys_open+0x7a>
      end_op();
801051b5:	e8 76 dc ff ff       	call   80102e30 <end_op>
      return -1;
801051ba:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801051bf:	eb 40                	jmp    80105201 <sys_open+0x131>
801051c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }
  iunlock(ip);
801051c8:	83 ec 0c             	sub    $0xc,%esp
      proc->ofile[fd] = f;
801051cb:	89 7c 9a 28          	mov    %edi,0x28(%edx,%ebx,4)
  iunlock(ip);
801051cf:	56                   	push   %esi
801051d0:	e8 4b c6 ff ff       	call   80101820 <iunlock>
  end_op();
801051d5:	e8 56 dc ff ff       	call   80102e30 <end_op>

  f->type = FD_INODE;
801051da:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801051e0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801051e3:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
801051e6:	89 77 10             	mov    %esi,0x10(%edi)
  f->readable = !(omode & O_WRONLY);
801051e9:	89 d0                	mov    %edx,%eax
  f->off = 0;
801051eb:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
801051f2:	f7 d0                	not    %eax
801051f4:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801051f7:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
801051fa:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801051fd:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
80105201:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105204:	89 d8                	mov    %ebx,%eax
80105206:	5b                   	pop    %ebx
80105207:	5e                   	pop    %esi
80105208:	5f                   	pop    %edi
80105209:	5d                   	pop    %ebp
8010520a:	c3                   	ret    
8010520b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010520f:	90                   	nop
    if(ip->type == T_DIR && omode != O_RDONLY){
80105210:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80105213:	85 d2                	test   %edx,%edx
80105215:	0f 84 2f ff ff ff    	je     8010514a <sys_open+0x7a>
8010521b:	e9 5c ff ff ff       	jmp    8010517c <sys_open+0xac>

80105220 <sys_mkdir>:

int
sys_mkdir(void)
{
80105220:	f3 0f 1e fb          	endbr32 
80105224:	55                   	push   %ebp
80105225:	89 e5                	mov    %esp,%ebp
80105227:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
8010522a:	e8 91 db ff ff       	call   80102dc0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010522f:	83 ec 08             	sub    $0x8,%esp
80105232:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105235:	50                   	push   %eax
80105236:	6a 00                	push   $0x0
80105238:	e8 a3 f6 ff ff       	call   801048e0 <argstr>
8010523d:	83 c4 10             	add    $0x10,%esp
80105240:	85 c0                	test   %eax,%eax
80105242:	78 34                	js     80105278 <sys_mkdir+0x58>
80105244:	83 ec 0c             	sub    $0xc,%esp
80105247:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010524a:	31 c9                	xor    %ecx,%ecx
8010524c:	ba 01 00 00 00       	mov    $0x1,%edx
80105251:	6a 00                	push   $0x0
80105253:	e8 68 f7 ff ff       	call   801049c0 <create>
80105258:	83 c4 10             	add    $0x10,%esp
8010525b:	85 c0                	test   %eax,%eax
8010525d:	74 19                	je     80105278 <sys_mkdir+0x58>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010525f:	83 ec 0c             	sub    $0xc,%esp
80105262:	50                   	push   %eax
80105263:	e8 88 c7 ff ff       	call   801019f0 <iunlockput>
  end_op();
80105268:	e8 c3 db ff ff       	call   80102e30 <end_op>
  return 0;
8010526d:	83 c4 10             	add    $0x10,%esp
80105270:	31 c0                	xor    %eax,%eax
}
80105272:	c9                   	leave  
80105273:	c3                   	ret    
80105274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80105278:	e8 b3 db ff ff       	call   80102e30 <end_op>
    return -1;
8010527d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105282:	c9                   	leave  
80105283:	c3                   	ret    
80105284:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010528b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010528f:	90                   	nop

80105290 <sys_mknod>:

int
sys_mknod(void)
{
80105290:	f3 0f 1e fb          	endbr32 
80105294:	55                   	push   %ebp
80105295:	89 e5                	mov    %esp,%ebp
80105297:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
8010529a:	e8 21 db ff ff       	call   80102dc0 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010529f:	83 ec 08             	sub    $0x8,%esp
801052a2:	8d 45 ec             	lea    -0x14(%ebp),%eax
801052a5:	50                   	push   %eax
801052a6:	6a 00                	push   $0x0
801052a8:	e8 33 f6 ff ff       	call   801048e0 <argstr>
801052ad:	83 c4 10             	add    $0x10,%esp
801052b0:	85 c0                	test   %eax,%eax
801052b2:	78 64                	js     80105318 <sys_mknod+0x88>
     argint(1, &major) < 0 ||
801052b4:	83 ec 08             	sub    $0x8,%esp
801052b7:	8d 45 f0             	lea    -0x10(%ebp),%eax
801052ba:	50                   	push   %eax
801052bb:	6a 01                	push   $0x1
801052bd:	e8 7e f5 ff ff       	call   80104840 <argint>
  if((argstr(0, &path)) < 0 ||
801052c2:	83 c4 10             	add    $0x10,%esp
801052c5:	85 c0                	test   %eax,%eax
801052c7:	78 4f                	js     80105318 <sys_mknod+0x88>
     argint(2, &minor) < 0 ||
801052c9:	83 ec 08             	sub    $0x8,%esp
801052cc:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052cf:	50                   	push   %eax
801052d0:	6a 02                	push   $0x2
801052d2:	e8 69 f5 ff ff       	call   80104840 <argint>
     argint(1, &major) < 0 ||
801052d7:	83 c4 10             	add    $0x10,%esp
801052da:	85 c0                	test   %eax,%eax
801052dc:	78 3a                	js     80105318 <sys_mknod+0x88>
     (ip = create(path, T_DEV, major, minor)) == 0){
801052de:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801052e2:	83 ec 0c             	sub    $0xc,%esp
801052e5:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801052e9:	ba 03 00 00 00       	mov    $0x3,%edx
801052ee:	50                   	push   %eax
801052ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
801052f2:	e8 c9 f6 ff ff       	call   801049c0 <create>
     argint(2, &minor) < 0 ||
801052f7:	83 c4 10             	add    $0x10,%esp
801052fa:	85 c0                	test   %eax,%eax
801052fc:	74 1a                	je     80105318 <sys_mknod+0x88>
    end_op();
    return -1;
  }
  iunlockput(ip);
801052fe:	83 ec 0c             	sub    $0xc,%esp
80105301:	50                   	push   %eax
80105302:	e8 e9 c6 ff ff       	call   801019f0 <iunlockput>
  end_op();
80105307:	e8 24 db ff ff       	call   80102e30 <end_op>
  return 0;
8010530c:	83 c4 10             	add    $0x10,%esp
8010530f:	31 c0                	xor    %eax,%eax
}
80105311:	c9                   	leave  
80105312:	c3                   	ret    
80105313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105317:	90                   	nop
    end_op();
80105318:	e8 13 db ff ff       	call   80102e30 <end_op>
    return -1;
8010531d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105322:	c9                   	leave  
80105323:	c3                   	ret    
80105324:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010532b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010532f:	90                   	nop

80105330 <sys_chdir>:

int
sys_chdir(void)
{
80105330:	f3 0f 1e fb          	endbr32 
80105334:	55                   	push   %ebp
80105335:	89 e5                	mov    %esp,%ebp
80105337:	53                   	push   %ebx
80105338:	83 ec 14             	sub    $0x14,%esp
  char *path;
  struct inode *ip;

  begin_op();
8010533b:	e8 80 da ff ff       	call   80102dc0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105340:	83 ec 08             	sub    $0x8,%esp
80105343:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105346:	50                   	push   %eax
80105347:	6a 00                	push   $0x0
80105349:	e8 92 f5 ff ff       	call   801048e0 <argstr>
8010534e:	83 c4 10             	add    $0x10,%esp
80105351:	85 c0                	test   %eax,%eax
80105353:	78 7b                	js     801053d0 <sys_chdir+0xa0>
80105355:	83 ec 0c             	sub    $0xc,%esp
80105358:	ff 75 f4             	pushl  -0xc(%ebp)
8010535b:	e8 c0 cc ff ff       	call   80102020 <namei>
80105360:	83 c4 10             	add    $0x10,%esp
80105363:	89 c3                	mov    %eax,%ebx
80105365:	85 c0                	test   %eax,%eax
80105367:	74 67                	je     801053d0 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
80105369:	83 ec 0c             	sub    $0xc,%esp
8010536c:	50                   	push   %eax
8010536d:	e8 9e c3 ff ff       	call   80101710 <ilock>
  if(ip->type != T_DIR){
80105372:	83 c4 10             	add    $0x10,%esp
80105375:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
8010537a:	75 34                	jne    801053b0 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
8010537c:	83 ec 0c             	sub    $0xc,%esp
8010537f:	53                   	push   %ebx
80105380:	e8 9b c4 ff ff       	call   80101820 <iunlock>
  iput(proc->cwd);
80105385:	58                   	pop    %eax
80105386:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010538c:	ff 70 68             	pushl  0x68(%eax)
8010538f:	e8 ec c4 ff ff       	call   80101880 <iput>
  end_op();
80105394:	e8 97 da ff ff       	call   80102e30 <end_op>
  proc->cwd = ip;
80105399:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return 0;
8010539f:	83 c4 10             	add    $0x10,%esp
  proc->cwd = ip;
801053a2:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
801053a5:	31 c0                	xor    %eax,%eax
}
801053a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801053aa:	c9                   	leave  
801053ab:	c3                   	ret    
801053ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    iunlockput(ip);
801053b0:	83 ec 0c             	sub    $0xc,%esp
801053b3:	53                   	push   %ebx
801053b4:	e8 37 c6 ff ff       	call   801019f0 <iunlockput>
    end_op();
801053b9:	e8 72 da ff ff       	call   80102e30 <end_op>
    return -1;
801053be:	83 c4 10             	add    $0x10,%esp
801053c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053c6:	eb df                	jmp    801053a7 <sys_chdir+0x77>
801053c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801053cf:	90                   	nop
    end_op();
801053d0:	e8 5b da ff ff       	call   80102e30 <end_op>
    return -1;
801053d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053da:	eb cb                	jmp    801053a7 <sys_chdir+0x77>
801053dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053e0 <sys_exec>:

int
sys_exec(void)
{
801053e0:	f3 0f 1e fb          	endbr32 
801053e4:	55                   	push   %ebp
801053e5:	89 e5                	mov    %esp,%ebp
801053e7:	57                   	push   %edi
801053e8:	56                   	push   %esi
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801053e9:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
801053ef:	53                   	push   %ebx
801053f0:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801053f6:	50                   	push   %eax
801053f7:	6a 00                	push   $0x0
801053f9:	e8 e2 f4 ff ff       	call   801048e0 <argstr>
801053fe:	83 c4 10             	add    $0x10,%esp
80105401:	85 c0                	test   %eax,%eax
80105403:	0f 88 8b 00 00 00    	js     80105494 <sys_exec+0xb4>
80105409:	83 ec 08             	sub    $0x8,%esp
8010540c:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105412:	50                   	push   %eax
80105413:	6a 01                	push   $0x1
80105415:	e8 26 f4 ff ff       	call   80104840 <argint>
8010541a:	83 c4 10             	add    $0x10,%esp
8010541d:	85 c0                	test   %eax,%eax
8010541f:	78 73                	js     80105494 <sys_exec+0xb4>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105421:	83 ec 04             	sub    $0x4,%esp
80105424:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  for(i=0;; i++){
8010542a:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
8010542c:	68 80 00 00 00       	push   $0x80
80105431:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105437:	6a 00                	push   $0x0
80105439:	50                   	push   %eax
8010543a:	e8 31 f1 ff ff       	call   80104570 <memset>
8010543f:	83 c4 10             	add    $0x10,%esp
80105442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105448:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
8010544e:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80105455:	83 ec 08             	sub    $0x8,%esp
80105458:	57                   	push   %edi
80105459:	01 f0                	add    %esi,%eax
8010545b:	50                   	push   %eax
8010545c:	e8 4f f3 ff ff       	call   801047b0 <fetchint>
80105461:	83 c4 10             	add    $0x10,%esp
80105464:	85 c0                	test   %eax,%eax
80105466:	78 2c                	js     80105494 <sys_exec+0xb4>
      return -1;
    if(uarg == 0){
80105468:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
8010546e:	85 c0                	test   %eax,%eax
80105470:	74 36                	je     801054a8 <sys_exec+0xc8>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105472:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105478:	83 ec 08             	sub    $0x8,%esp
8010547b:	8d 14 31             	lea    (%ecx,%esi,1),%edx
8010547e:	52                   	push   %edx
8010547f:	50                   	push   %eax
80105480:	e8 6b f3 ff ff       	call   801047f0 <fetchstr>
80105485:	83 c4 10             	add    $0x10,%esp
80105488:	85 c0                	test   %eax,%eax
8010548a:	78 08                	js     80105494 <sys_exec+0xb4>
  for(i=0;; i++){
8010548c:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
8010548f:	83 fb 20             	cmp    $0x20,%ebx
80105492:	75 b4                	jne    80105448 <sys_exec+0x68>
      return -1;
  }
  return exec(path, argv);
}
80105494:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
80105497:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010549c:	5b                   	pop    %ebx
8010549d:	5e                   	pop    %esi
8010549e:	5f                   	pop    %edi
8010549f:	5d                   	pop    %ebp
801054a0:	c3                   	ret    
801054a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return exec(path, argv);
801054a8:	83 ec 08             	sub    $0x8,%esp
801054ab:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
      argv[i] = 0;
801054b1:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801054b8:	00 00 00 00 
  return exec(path, argv);
801054bc:	50                   	push   %eax
801054bd:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801054c3:	e8 b8 b5 ff ff       	call   80100a80 <exec>
801054c8:	83 c4 10             	add    $0x10,%esp
}
801054cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054ce:	5b                   	pop    %ebx
801054cf:	5e                   	pop    %esi
801054d0:	5f                   	pop    %edi
801054d1:	5d                   	pop    %ebp
801054d2:	c3                   	ret    
801054d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801054da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801054e0 <sys_pipe>:

int
sys_pipe(void)
{
801054e0:	f3 0f 1e fb          	endbr32 
801054e4:	55                   	push   %ebp
801054e5:	89 e5                	mov    %esp,%ebp
801054e7:	57                   	push   %edi
801054e8:	56                   	push   %esi
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801054e9:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
801054ec:	53                   	push   %ebx
801054ed:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801054f0:	6a 08                	push   $0x8
801054f2:	50                   	push   %eax
801054f3:	6a 00                	push   $0x0
801054f5:	e8 96 f3 ff ff       	call   80104890 <argptr>
801054fa:	83 c4 10             	add    $0x10,%esp
801054fd:	85 c0                	test   %eax,%eax
801054ff:	78 4c                	js     8010554d <sys_pipe+0x6d>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105501:	83 ec 08             	sub    $0x8,%esp
80105504:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105507:	50                   	push   %eax
80105508:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010550b:	50                   	push   %eax
8010550c:	e8 4f e0 ff ff       	call   80103560 <pipealloc>
80105511:	83 c4 10             	add    $0x10,%esp
80105514:	85 c0                	test   %eax,%eax
80105516:	78 35                	js     8010554d <sys_pipe+0x6d>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105518:	8b 75 e0             	mov    -0x20(%ebp),%esi
    if(proc->ofile[fd] == 0){
8010551b:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
  for(fd = 0; fd < NOFILE; fd++){
80105522:	31 c0                	xor    %eax,%eax
80105524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->ofile[fd] == 0){
80105528:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
8010552c:	85 d2                	test   %edx,%edx
8010552e:	74 28                	je     80105558 <sys_pipe+0x78>
  for(fd = 0; fd < NOFILE; fd++){
80105530:	83 c0 01             	add    $0x1,%eax
80105533:	83 f8 10             	cmp    $0x10,%eax
80105536:	75 f0                	jne    80105528 <sys_pipe+0x48>
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
80105538:	83 ec 0c             	sub    $0xc,%esp
8010553b:	56                   	push   %esi
8010553c:	e8 6f b9 ff ff       	call   80100eb0 <fileclose>
    fileclose(wf);
80105541:	58                   	pop    %eax
80105542:	ff 75 e4             	pushl  -0x1c(%ebp)
80105545:	e8 66 b9 ff ff       	call   80100eb0 <fileclose>
    return -1;
8010554a:	83 c4 10             	add    $0x10,%esp
8010554d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105552:	eb 3d                	jmp    80105591 <sys_pipe+0xb1>
80105554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      proc->ofile[fd] = f;
80105558:	8d 1c 81             	lea    (%ecx,%eax,4),%ebx
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010555b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
8010555e:	31 d2                	xor    %edx,%edx
      proc->ofile[fd] = f;
80105560:	89 73 28             	mov    %esi,0x28(%ebx)
  for(fd = 0; fd < NOFILE; fd++){
80105563:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105567:	90                   	nop
    if(proc->ofile[fd] == 0){
80105568:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
8010556d:	74 11                	je     80105580 <sys_pipe+0xa0>
  for(fd = 0; fd < NOFILE; fd++){
8010556f:	83 c2 01             	add    $0x1,%edx
80105572:	83 fa 10             	cmp    $0x10,%edx
80105575:	75 f1                	jne    80105568 <sys_pipe+0x88>
      proc->ofile[fd0] = 0;
80105577:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
8010557e:	eb b8                	jmp    80105538 <sys_pipe+0x58>
      proc->ofile[fd] = f;
80105580:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
  }
  fd[0] = fd0;
80105584:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80105587:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
80105589:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010558c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
8010558f:	31 c0                	xor    %eax,%eax
}
80105591:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105594:	5b                   	pop    %ebx
80105595:	5e                   	pop    %esi
80105596:	5f                   	pop    %edi
80105597:	5d                   	pop    %ebp
80105598:	c3                   	ret    
80105599:	66 90                	xchg   %ax,%ax
8010559b:	66 90                	xchg   %ax,%ax
8010559d:	66 90                	xchg   %ax,%ax
8010559f:	90                   	nop

801055a0 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
801055a0:	f3 0f 1e fb          	endbr32 
  return fork();
801055a4:	e9 e7 e5 ff ff       	jmp    80103b90 <fork>
801055a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801055b0 <sys_exit>:
}

int
sys_exit(void)
{
801055b0:	f3 0f 1e fb          	endbr32 
801055b4:	55                   	push   %ebp
801055b5:	89 e5                	mov    %esp,%ebp
801055b7:	83 ec 08             	sub    $0x8,%esp
  exit();
801055ba:	e8 51 e8 ff ff       	call   80103e10 <exit>
  return 0;  // not reached
}
801055bf:	31 c0                	xor    %eax,%eax
801055c1:	c9                   	leave  
801055c2:	c3                   	ret    
801055c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801055ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801055d0 <sys_wait>:

int
sys_wait(void)
{
801055d0:	f3 0f 1e fb          	endbr32 
  return wait();
801055d4:	e9 97 ea ff ff       	jmp    80104070 <wait>
801055d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801055e0 <sys_kill>:
}

int
sys_kill(void)
{
801055e0:	f3 0f 1e fb          	endbr32 
801055e4:	55                   	push   %ebp
801055e5:	89 e5                	mov    %esp,%ebp
801055e7:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
801055ea:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055ed:	50                   	push   %eax
801055ee:	6a 00                	push   $0x0
801055f0:	e8 4b f2 ff ff       	call   80104840 <argint>
801055f5:	83 c4 10             	add    $0x10,%esp
801055f8:	85 c0                	test   %eax,%eax
801055fa:	78 14                	js     80105610 <sys_kill+0x30>
    return -1;
  return kill(pid);
801055fc:	83 ec 0c             	sub    $0xc,%esp
801055ff:	ff 75 f4             	pushl  -0xc(%ebp)
80105602:	e8 b9 eb ff ff       	call   801041c0 <kill>
80105607:	83 c4 10             	add    $0x10,%esp
}
8010560a:	c9                   	leave  
8010560b:	c3                   	ret    
8010560c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105610:	c9                   	leave  
    return -1;
80105611:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105616:	c3                   	ret    
80105617:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010561e:	66 90                	xchg   %ax,%ax

80105620 <sys_getpid>:

int
sys_getpid(void)
{
80105620:	f3 0f 1e fb          	endbr32 
  return proc->pid;
80105624:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010562a:	8b 40 10             	mov    0x10(%eax),%eax
}
8010562d:	c3                   	ret    
8010562e:	66 90                	xchg   %ax,%ax

80105630 <sys_sbrk>:

int
sys_sbrk(void)
{
80105630:	f3 0f 1e fb          	endbr32 
80105634:	55                   	push   %ebp
80105635:	89 e5                	mov    %esp,%ebp
80105637:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105638:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
8010563b:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010563e:	50                   	push   %eax
8010563f:	6a 00                	push   $0x0
80105641:	e8 fa f1 ff ff       	call   80104840 <argint>
80105646:	83 c4 10             	add    $0x10,%esp
80105649:	85 c0                	test   %eax,%eax
8010564b:	78 23                	js     80105670 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
8010564d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
80105653:	83 ec 0c             	sub    $0xc,%esp
  addr = proc->sz;
80105656:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105658:	ff 75 f4             	pushl  -0xc(%ebp)
8010565b:	e8 b0 e4 ff ff       	call   80103b10 <growproc>
80105660:	83 c4 10             	add    $0x10,%esp
80105663:	85 c0                	test   %eax,%eax
80105665:	78 09                	js     80105670 <sys_sbrk+0x40>
    return -1;
  return addr;
}
80105667:	89 d8                	mov    %ebx,%eax
80105669:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010566c:	c9                   	leave  
8010566d:	c3                   	ret    
8010566e:	66 90                	xchg   %ax,%ax
    return -1;
80105670:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105675:	eb f0                	jmp    80105667 <sys_sbrk+0x37>
80105677:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010567e:	66 90                	xchg   %ax,%ax

80105680 <sys_sleep>:

int
sys_sleep(void)
{
80105680:	f3 0f 1e fb          	endbr32 
80105684:	55                   	push   %ebp
80105685:	89 e5                	mov    %esp,%ebp
80105687:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105688:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
8010568b:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010568e:	50                   	push   %eax
8010568f:	6a 00                	push   $0x0
80105691:	e8 aa f1 ff ff       	call   80104840 <argint>
80105696:	83 c4 10             	add    $0x10,%esp
80105699:	85 c0                	test   %eax,%eax
8010569b:	0f 88 86 00 00 00    	js     80105727 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801056a1:	83 ec 0c             	sub    $0xc,%esp
801056a4:	68 20 38 11 80       	push   $0x80113820
801056a9:	e8 92 ec ff ff       	call   80104340 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801056ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
  ticks0 = ticks;
801056b1:	8b 1d 60 40 11 80    	mov    0x80114060,%ebx
  while(ticks - ticks0 < n){
801056b7:	83 c4 10             	add    $0x10,%esp
801056ba:	85 d2                	test   %edx,%edx
801056bc:	75 23                	jne    801056e1 <sys_sleep+0x61>
801056be:	eb 50                	jmp    80105710 <sys_sleep+0x90>
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
801056c0:	83 ec 08             	sub    $0x8,%esp
801056c3:	68 20 38 11 80       	push   $0x80113820
801056c8:	68 60 40 11 80       	push   $0x80114060
801056cd:	e8 ce e8 ff ff       	call   80103fa0 <sleep>
  while(ticks - ticks0 < n){
801056d2:	a1 60 40 11 80       	mov    0x80114060,%eax
801056d7:	83 c4 10             	add    $0x10,%esp
801056da:	29 d8                	sub    %ebx,%eax
801056dc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801056df:	73 2f                	jae    80105710 <sys_sleep+0x90>
    if(proc->killed){
801056e1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801056e7:	8b 40 24             	mov    0x24(%eax),%eax
801056ea:	85 c0                	test   %eax,%eax
801056ec:	74 d2                	je     801056c0 <sys_sleep+0x40>
      release(&tickslock);
801056ee:	83 ec 0c             	sub    $0xc,%esp
801056f1:	68 20 38 11 80       	push   $0x80113820
801056f6:	e8 25 ee ff ff       	call   80104520 <release>
  }
  release(&tickslock);
  return 0;
}
801056fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      return -1;
801056fe:	83 c4 10             	add    $0x10,%esp
80105701:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105706:	c9                   	leave  
80105707:	c3                   	ret    
80105708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010570f:	90                   	nop
  release(&tickslock);
80105710:	83 ec 0c             	sub    $0xc,%esp
80105713:	68 20 38 11 80       	push   $0x80113820
80105718:	e8 03 ee ff ff       	call   80104520 <release>
  return 0;
8010571d:	83 c4 10             	add    $0x10,%esp
80105720:	31 c0                	xor    %eax,%eax
}
80105722:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105725:	c9                   	leave  
80105726:	c3                   	ret    
    return -1;
80105727:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010572c:	eb f4                	jmp    80105722 <sys_sleep+0xa2>
8010572e:	66 90                	xchg   %ax,%ax

80105730 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105730:	f3 0f 1e fb          	endbr32 
80105734:	55                   	push   %ebp
80105735:	89 e5                	mov    %esp,%ebp
80105737:	53                   	push   %ebx
80105738:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
8010573b:	68 20 38 11 80       	push   $0x80113820
80105740:	e8 fb eb ff ff       	call   80104340 <acquire>
  xticks = ticks;
80105745:	8b 1d 60 40 11 80    	mov    0x80114060,%ebx
  release(&tickslock);
8010574b:	c7 04 24 20 38 11 80 	movl   $0x80113820,(%esp)
80105752:	e8 c9 ed ff ff       	call   80104520 <release>
  return xticks;
}
80105757:	89 d8                	mov    %ebx,%eax
80105759:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010575c:	c9                   	leave  
8010575d:	c3                   	ret    
8010575e:	66 90                	xchg   %ax,%ax

80105760 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
80105760:	f3 0f 1e fb          	endbr32 
80105764:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105765:	b8 34 00 00 00       	mov    $0x34,%eax
8010576a:	ba 43 00 00 00       	mov    $0x43,%edx
8010576f:	89 e5                	mov    %esp,%ebp
80105771:	83 ec 14             	sub    $0x14,%esp
80105774:	ee                   	out    %al,(%dx)
80105775:	ba 40 00 00 00       	mov    $0x40,%edx
8010577a:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
8010577f:	ee                   	out    %al,(%dx)
80105780:	b8 2e 00 00 00       	mov    $0x2e,%eax
80105785:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
80105786:	6a 00                	push   $0x0
80105788:	e8 03 dd ff ff       	call   80103490 <picenable>
}
8010578d:	83 c4 10             	add    $0x10,%esp
80105790:	c9                   	leave  
80105791:	c3                   	ret    

80105792 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105792:	1e                   	push   %ds
  pushl %es
80105793:	06                   	push   %es
  pushl %fs
80105794:	0f a0                	push   %fs
  pushl %gs
80105796:	0f a8                	push   %gs
  pushal
80105798:	60                   	pusha  
  
  # Set up data and per-cpu segments.
  movw $(SEG_KDATA<<3), %ax
80105799:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
8010579d:	8e d8                	mov    %eax,%ds
  movw %ax, %es
8010579f:	8e c0                	mov    %eax,%es
  movw $(SEG_KCPU<<3), %ax
801057a1:	66 b8 18 00          	mov    $0x18,%ax
  movw %ax, %fs
801057a5:	8e e0                	mov    %eax,%fs
  movw %ax, %gs
801057a7:	8e e8                	mov    %eax,%gs

  # Call trap(tf), where tf=%esp
  pushl %esp
801057a9:	54                   	push   %esp
  call trap
801057aa:	e8 c1 00 00 00       	call   80105870 <trap>
  addl $4, %esp
801057af:	83 c4 04             	add    $0x4,%esp

801057b2 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
801057b2:	61                   	popa   
  popl %gs
801057b3:	0f a9                	pop    %gs
  popl %fs
801057b5:	0f a1                	pop    %fs
  popl %es
801057b7:	07                   	pop    %es
  popl %ds
801057b8:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
801057b9:	83 c4 08             	add    $0x8,%esp
  iret
801057bc:	cf                   	iret   
801057bd:	66 90                	xchg   %ax,%ax
801057bf:	90                   	nop

801057c0 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801057c0:	f3 0f 1e fb          	endbr32 
801057c4:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
801057c5:	31 c0                	xor    %eax,%eax
{
801057c7:	89 e5                	mov    %esp,%ebp
801057c9:	83 ec 08             	sub    $0x8,%esp
801057cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801057d0:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
801057d7:	c7 04 c5 62 38 11 80 	movl   $0x8e000008,-0x7feec79e(,%eax,8)
801057de:	08 00 00 8e 
801057e2:	66 89 14 c5 60 38 11 	mov    %dx,-0x7feec7a0(,%eax,8)
801057e9:	80 
801057ea:	c1 ea 10             	shr    $0x10,%edx
801057ed:	66 89 14 c5 66 38 11 	mov    %dx,-0x7feec79a(,%eax,8)
801057f4:	80 
  for(i = 0; i < 256; i++)
801057f5:	83 c0 01             	add    $0x1,%eax
801057f8:	3d 00 01 00 00       	cmp    $0x100,%eax
801057fd:	75 d1                	jne    801057d0 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
801057ff:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105802:	a1 0c a1 10 80       	mov    0x8010a10c,%eax
80105807:	c7 05 62 3a 11 80 08 	movl   $0xef000008,0x80113a62
8010580e:	00 00 ef 
  initlock(&tickslock, "time");
80105811:	68 39 77 10 80       	push   $0x80107739
80105816:	68 20 38 11 80       	push   $0x80113820
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
8010581b:	66 a3 60 3a 11 80    	mov    %ax,0x80113a60
80105821:	c1 e8 10             	shr    $0x10,%eax
80105824:	66 a3 66 3a 11 80    	mov    %ax,0x80113a66
  initlock(&tickslock, "time");
8010582a:	e8 f1 ea ff ff       	call   80104320 <initlock>
}
8010582f:	83 c4 10             	add    $0x10,%esp
80105832:	c9                   	leave  
80105833:	c3                   	ret    
80105834:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010583b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010583f:	90                   	nop

80105840 <idtinit>:

void
idtinit(void)
{
80105840:	f3 0f 1e fb          	endbr32 
80105844:	55                   	push   %ebp
  pd[0] = size-1;
80105845:	b8 ff 07 00 00       	mov    $0x7ff,%eax
8010584a:	89 e5                	mov    %esp,%ebp
8010584c:	83 ec 10             	sub    $0x10,%esp
8010584f:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105853:	b8 60 38 11 80       	mov    $0x80113860,%eax
80105858:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
8010585c:	c1 e8 10             	shr    $0x10,%eax
8010585f:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105863:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105866:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105869:	c9                   	leave  
8010586a:	c3                   	ret    
8010586b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010586f:	90                   	nop

80105870 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105870:	f3 0f 1e fb          	endbr32 
80105874:	55                   	push   %ebp
80105875:	89 e5                	mov    %esp,%ebp
80105877:	57                   	push   %edi
80105878:	56                   	push   %esi
80105879:	53                   	push   %ebx
8010587a:	83 ec 0c             	sub    $0xc,%esp
8010587d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80105880:	8b 43 30             	mov    0x30(%ebx),%eax
80105883:	83 f8 40             	cmp    $0x40,%eax
80105886:	0f 84 e4 00 00 00    	je     80105970 <trap+0x100>
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
8010588c:	83 e8 20             	sub    $0x20,%eax
8010588f:	83 f8 1f             	cmp    $0x1f,%eax
80105892:	77 59                	ja     801058ed <trap+0x7d>
80105894:	3e ff 24 85 e0 77 10 	notrack jmp *-0x7fef8820(,%eax,4)
8010589b:	80 
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
8010589c:	e8 0f d0 ff ff       	call   801028b0 <cpunum>
801058a1:	85 c0                	test   %eax,%eax
801058a3:	0f 84 af 01 00 00    	je     80105a58 <trap+0x1e8>
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
801058a9:	e8 a2 d0 ff ff       	call   80102950 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801058ae:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801058b4:	85 c0                	test   %eax,%eax
801058b6:	74 2d                	je     801058e5 <trap+0x75>
801058b8:	8b 50 24             	mov    0x24(%eax),%edx
801058bb:	85 d2                	test   %edx,%edx
801058bd:	0f 85 80 00 00 00    	jne    80105943 <trap+0xd3>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
801058c3:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801058c7:	0f 84 63 01 00 00    	je     80105a30 <trap+0x1c0>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801058cd:	8b 40 24             	mov    0x24(%eax),%eax
801058d0:	85 c0                	test   %eax,%eax
801058d2:	74 11                	je     801058e5 <trap+0x75>
801058d4:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
801058d8:	83 e0 03             	and    $0x3,%eax
801058db:	66 83 f8 03          	cmp    $0x3,%ax
801058df:	0f 84 b5 00 00 00    	je     8010599a <trap+0x12a>
    exit();
}
801058e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058e8:	5b                   	pop    %ebx
801058e9:	5e                   	pop    %esi
801058ea:	5f                   	pop    %edi
801058eb:	5d                   	pop    %ebp
801058ec:	c3                   	ret    
    if(proc == 0 || (tf->cs&3) == 0){
801058ed:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
801058f4:	8b 73 38             	mov    0x38(%ebx),%esi
801058f7:	85 c9                	test   %ecx,%ecx
801058f9:	0f 84 8d 01 00 00    	je     80105a8c <trap+0x21c>
801058ff:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105903:	0f 84 83 01 00 00    	je     80105a8c <trap+0x21c>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105909:	0f 20 d7             	mov    %cr2,%edi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010590c:	e8 9f cf ff ff       	call   801028b0 <cpunum>
80105911:	57                   	push   %edi
80105912:	89 c2                	mov    %eax,%edx
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105914:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010591a:	56                   	push   %esi
8010591b:	52                   	push   %edx
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
8010591c:	8d 50 6c             	lea    0x6c(%eax),%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010591f:	ff 73 34             	pushl  0x34(%ebx)
80105922:	ff 73 30             	pushl  0x30(%ebx)
80105925:	52                   	push   %edx
80105926:	ff 70 10             	pushl  0x10(%eax)
80105929:	68 9c 77 10 80       	push   $0x8010779c
8010592e:	e8 6d ad ff ff       	call   801006a0 <cprintf>
    proc->killed = 1;
80105933:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105939:	83 c4 20             	add    $0x20,%esp
8010593c:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105943:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105947:	83 e2 03             	and    $0x3,%edx
8010594a:	66 83 fa 03          	cmp    $0x3,%dx
8010594e:	0f 85 6f ff ff ff    	jne    801058c3 <trap+0x53>
    exit();
80105954:	e8 b7 e4 ff ff       	call   80103e10 <exit>
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105959:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010595f:	85 c0                	test   %eax,%eax
80105961:	0f 85 5c ff ff ff    	jne    801058c3 <trap+0x53>
80105967:	e9 79 ff ff ff       	jmp    801058e5 <trap+0x75>
8010596c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed)
80105970:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105976:	8b 70 24             	mov    0x24(%eax),%esi
80105979:	85 f6                	test   %esi,%esi
8010597b:	0f 85 9f 00 00 00    	jne    80105a20 <trap+0x1b0>
    proc->tf = tf;
80105981:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105984:	e8 c7 ef ff ff       	call   80104950 <syscall>
    if(proc->killed)
80105989:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010598f:	8b 58 24             	mov    0x24(%eax),%ebx
80105992:	85 db                	test   %ebx,%ebx
80105994:	0f 84 4b ff ff ff    	je     801058e5 <trap+0x75>
}
8010599a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010599d:	5b                   	pop    %ebx
8010599e:	5e                   	pop    %esi
8010599f:	5f                   	pop    %edi
801059a0:	5d                   	pop    %ebp
      exit();
801059a1:	e9 6a e4 ff ff       	jmp    80103e10 <exit>
    ideintr();
801059a6:	e8 25 c8 ff ff       	call   801021d0 <ideintr>
    lapiceoi();
801059ab:	e8 a0 cf ff ff       	call   80102950 <lapiceoi>
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801059b0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801059b6:	85 c0                	test   %eax,%eax
801059b8:	0f 85 fa fe ff ff    	jne    801058b8 <trap+0x48>
801059be:	e9 22 ff ff ff       	jmp    801058e5 <trap+0x75>
    kbdintr();
801059c3:	e8 c8 cd ff ff       	call   80102790 <kbdintr>
    lapiceoi();
801059c8:	e8 83 cf ff ff       	call   80102950 <lapiceoi>
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801059cd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801059d3:	85 c0                	test   %eax,%eax
801059d5:	0f 85 dd fe ff ff    	jne    801058b8 <trap+0x48>
801059db:	e9 05 ff ff ff       	jmp    801058e5 <trap+0x75>
    uartintr();
801059e0:	e8 5b 02 00 00       	call   80105c40 <uartintr>
801059e5:	e9 bf fe ff ff       	jmp    801058a9 <trap+0x39>
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
801059ea:	8b 7b 38             	mov    0x38(%ebx),%edi
801059ed:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
801059f1:	e8 ba ce ff ff       	call   801028b0 <cpunum>
801059f6:	57                   	push   %edi
801059f7:	56                   	push   %esi
801059f8:	50                   	push   %eax
801059f9:	68 44 77 10 80       	push   $0x80107744
801059fe:	e8 9d ac ff ff       	call   801006a0 <cprintf>
    lapiceoi();
80105a03:	e8 48 cf ff ff       	call   80102950 <lapiceoi>
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105a08:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
80105a0e:	83 c4 10             	add    $0x10,%esp
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105a11:	85 c0                	test   %eax,%eax
80105a13:	0f 85 9f fe ff ff    	jne    801058b8 <trap+0x48>
80105a19:	e9 c7 fe ff ff       	jmp    801058e5 <trap+0x75>
80105a1e:	66 90                	xchg   %ax,%ax
      exit();
80105a20:	e8 eb e3 ff ff       	call   80103e10 <exit>
80105a25:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105a2b:	e9 51 ff ff ff       	jmp    80105981 <trap+0x111>
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105a30:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105a34:	0f 85 93 fe ff ff    	jne    801058cd <trap+0x5d>
    yield();
80105a3a:	e8 21 e5 ff ff       	call   80103f60 <yield>
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105a3f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105a45:	85 c0                	test   %eax,%eax
80105a47:	0f 85 80 fe ff ff    	jne    801058cd <trap+0x5d>
80105a4d:	e9 93 fe ff ff       	jmp    801058e5 <trap+0x75>
80105a52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      acquire(&tickslock);
80105a58:	83 ec 0c             	sub    $0xc,%esp
80105a5b:	68 20 38 11 80       	push   $0x80113820
80105a60:	e8 db e8 ff ff       	call   80104340 <acquire>
      wakeup(&ticks);
80105a65:	c7 04 24 60 40 11 80 	movl   $0x80114060,(%esp)
      ticks++;
80105a6c:	83 05 60 40 11 80 01 	addl   $0x1,0x80114060
      wakeup(&ticks);
80105a73:	e8 e8 e6 ff ff       	call   80104160 <wakeup>
      release(&tickslock);
80105a78:	c7 04 24 20 38 11 80 	movl   $0x80113820,(%esp)
80105a7f:	e8 9c ea ff ff       	call   80104520 <release>
80105a84:	83 c4 10             	add    $0x10,%esp
    lapiceoi();
80105a87:	e9 1d fe ff ff       	jmp    801058a9 <trap+0x39>
80105a8c:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105a8f:	e8 1c ce ff ff       	call   801028b0 <cpunum>
80105a94:	83 ec 0c             	sub    $0xc,%esp
80105a97:	57                   	push   %edi
80105a98:	56                   	push   %esi
80105a99:	50                   	push   %eax
80105a9a:	ff 73 30             	pushl  0x30(%ebx)
80105a9d:	68 68 77 10 80       	push   $0x80107768
80105aa2:	e8 f9 ab ff ff       	call   801006a0 <cprintf>
      panic("trap");
80105aa7:	83 c4 14             	add    $0x14,%esp
80105aaa:	68 3e 77 10 80       	push   $0x8010773e
80105aaf:	e8 cc a8 ff ff       	call   80100380 <panic>
80105ab4:	66 90                	xchg   %ax,%ax
80105ab6:	66 90                	xchg   %ax,%ax
80105ab8:	66 90                	xchg   %ax,%ax
80105aba:	66 90                	xchg   %ax,%ax
80105abc:	66 90                	xchg   %ax,%ax
80105abe:	66 90                	xchg   %ax,%ax

80105ac0 <uartgetc>:
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105ac0:	f3 0f 1e fb          	endbr32 
  if(!uart)
80105ac4:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
80105ac9:	85 c0                	test   %eax,%eax
80105acb:	74 1b                	je     80105ae8 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105acd:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ad2:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105ad3:	a8 01                	test   $0x1,%al
80105ad5:	74 11                	je     80105ae8 <uartgetc+0x28>
80105ad7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105adc:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105add:	0f b6 c0             	movzbl %al,%eax
80105ae0:	c3                   	ret    
80105ae1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105ae8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105aed:	c3                   	ret    
80105aee:	66 90                	xchg   %ax,%ax

80105af0 <uartputc.part.0>:
uartputc(int c)
80105af0:	55                   	push   %ebp
80105af1:	89 e5                	mov    %esp,%ebp
80105af3:	57                   	push   %edi
80105af4:	89 c7                	mov    %eax,%edi
80105af6:	56                   	push   %esi
80105af7:	be fd 03 00 00       	mov    $0x3fd,%esi
80105afc:	53                   	push   %ebx
80105afd:	bb 80 00 00 00       	mov    $0x80,%ebx
80105b02:	83 ec 0c             	sub    $0xc,%esp
80105b05:	eb 1b                	jmp    80105b22 <uartputc.part.0+0x32>
80105b07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b0e:	66 90                	xchg   %ax,%ax
    microdelay(10);
80105b10:	83 ec 0c             	sub    $0xc,%esp
80105b13:	6a 0a                	push   $0xa
80105b15:	e8 56 ce ff ff       	call   80102970 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105b1a:	83 c4 10             	add    $0x10,%esp
80105b1d:	83 eb 01             	sub    $0x1,%ebx
80105b20:	74 07                	je     80105b29 <uartputc.part.0+0x39>
80105b22:	89 f2                	mov    %esi,%edx
80105b24:	ec                   	in     (%dx),%al
80105b25:	a8 20                	test   $0x20,%al
80105b27:	74 e7                	je     80105b10 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105b29:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b2e:	89 f8                	mov    %edi,%eax
80105b30:	ee                   	out    %al,(%dx)
}
80105b31:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b34:	5b                   	pop    %ebx
80105b35:	5e                   	pop    %esi
80105b36:	5f                   	pop    %edi
80105b37:	5d                   	pop    %ebp
80105b38:	c3                   	ret    
80105b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105b40 <uartinit>:
{
80105b40:	f3 0f 1e fb          	endbr32 
80105b44:	55                   	push   %ebp
80105b45:	31 c9                	xor    %ecx,%ecx
80105b47:	89 c8                	mov    %ecx,%eax
80105b49:	89 e5                	mov    %esp,%ebp
80105b4b:	57                   	push   %edi
80105b4c:	56                   	push   %esi
80105b4d:	53                   	push   %ebx
80105b4e:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105b53:	89 da                	mov    %ebx,%edx
80105b55:	83 ec 0c             	sub    $0xc,%esp
80105b58:	ee                   	out    %al,(%dx)
80105b59:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105b5e:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105b63:	89 fa                	mov    %edi,%edx
80105b65:	ee                   	out    %al,(%dx)
80105b66:	b8 0c 00 00 00       	mov    $0xc,%eax
80105b6b:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b70:	ee                   	out    %al,(%dx)
80105b71:	be f9 03 00 00       	mov    $0x3f9,%esi
80105b76:	89 c8                	mov    %ecx,%eax
80105b78:	89 f2                	mov    %esi,%edx
80105b7a:	ee                   	out    %al,(%dx)
80105b7b:	b8 03 00 00 00       	mov    $0x3,%eax
80105b80:	89 fa                	mov    %edi,%edx
80105b82:	ee                   	out    %al,(%dx)
80105b83:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105b88:	89 c8                	mov    %ecx,%eax
80105b8a:	ee                   	out    %al,(%dx)
80105b8b:	b8 01 00 00 00       	mov    $0x1,%eax
80105b90:	89 f2                	mov    %esi,%edx
80105b92:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105b93:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105b98:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105b99:	3c ff                	cmp    $0xff,%al
80105b9b:	74 62                	je     80105bff <uartinit+0xbf>
  uart = 1;
80105b9d:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105ba4:	00 00 00 
80105ba7:	89 da                	mov    %ebx,%edx
80105ba9:	ec                   	in     (%dx),%al
80105baa:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105baf:	ec                   	in     (%dx),%al
  picenable(IRQ_COM1);
80105bb0:	83 ec 0c             	sub    $0xc,%esp
  ioapicenable(IRQ_COM1, 0);
80105bb3:	be 76 00 00 00       	mov    $0x76,%esi
  picenable(IRQ_COM1);
80105bb8:	6a 04                	push   $0x4
80105bba:	e8 d1 d8 ff ff       	call   80103490 <picenable>
  ioapicenable(IRQ_COM1, 0);
80105bbf:	59                   	pop    %ecx
80105bc0:	5b                   	pop    %ebx
80105bc1:	6a 00                	push   $0x0
80105bc3:	6a 04                	push   $0x4
  for(p="xv6...\n"; *p; p++)
80105bc5:	bb 60 78 10 80       	mov    $0x80107860,%ebx
  ioapicenable(IRQ_COM1, 0);
80105bca:	e8 61 c8 ff ff       	call   80102430 <ioapicenable>
80105bcf:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
80105bd2:	b8 78 00 00 00       	mov    $0x78,%eax
80105bd7:	eb 0b                	jmp    80105be4 <uartinit+0xa4>
80105bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105be0:	0f b6 73 01          	movzbl 0x1(%ebx),%esi
  if(!uart)
80105be4:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105bea:	85 d2                	test   %edx,%edx
80105bec:	74 08                	je     80105bf6 <uartinit+0xb6>
    uartputc(*p);
80105bee:	0f be c0             	movsbl %al,%eax
80105bf1:	e8 fa fe ff ff       	call   80105af0 <uartputc.part.0>
  for(p="xv6...\n"; *p; p++)
80105bf6:	89 f0                	mov    %esi,%eax
80105bf8:	83 c3 01             	add    $0x1,%ebx
80105bfb:	84 c0                	test   %al,%al
80105bfd:	75 e1                	jne    80105be0 <uartinit+0xa0>
}
80105bff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c02:	5b                   	pop    %ebx
80105c03:	5e                   	pop    %esi
80105c04:	5f                   	pop    %edi
80105c05:	5d                   	pop    %ebp
80105c06:	c3                   	ret    
80105c07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c0e:	66 90                	xchg   %ax,%ax

80105c10 <uartputc>:
{
80105c10:	f3 0f 1e fb          	endbr32 
80105c14:	55                   	push   %ebp
  if(!uart)
80105c15:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
{
80105c1b:	89 e5                	mov    %esp,%ebp
80105c1d:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
80105c20:	85 d2                	test   %edx,%edx
80105c22:	74 0c                	je     80105c30 <uartputc+0x20>
}
80105c24:	5d                   	pop    %ebp
80105c25:	e9 c6 fe ff ff       	jmp    80105af0 <uartputc.part.0>
80105c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105c30:	5d                   	pop    %ebp
80105c31:	c3                   	ret    
80105c32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105c40 <uartintr>:

void
uartintr(void)
{
80105c40:	f3 0f 1e fb          	endbr32 
80105c44:	55                   	push   %ebp
80105c45:	89 e5                	mov    %esp,%ebp
80105c47:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105c4a:	68 c0 5a 10 80       	push   $0x80105ac0
80105c4f:	e8 fc ab ff ff       	call   80100850 <consoleintr>
}
80105c54:	83 c4 10             	add    $0x10,%esp
80105c57:	c9                   	leave  
80105c58:	c3                   	ret    

80105c59 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105c59:	6a 00                	push   $0x0
  pushl $0
80105c5b:	6a 00                	push   $0x0
  jmp alltraps
80105c5d:	e9 30 fb ff ff       	jmp    80105792 <alltraps>

80105c62 <vector1>:
.globl vector1
vector1:
  pushl $0
80105c62:	6a 00                	push   $0x0
  pushl $1
80105c64:	6a 01                	push   $0x1
  jmp alltraps
80105c66:	e9 27 fb ff ff       	jmp    80105792 <alltraps>

80105c6b <vector2>:
.globl vector2
vector2:
  pushl $0
80105c6b:	6a 00                	push   $0x0
  pushl $2
80105c6d:	6a 02                	push   $0x2
  jmp alltraps
80105c6f:	e9 1e fb ff ff       	jmp    80105792 <alltraps>

80105c74 <vector3>:
.globl vector3
vector3:
  pushl $0
80105c74:	6a 00                	push   $0x0
  pushl $3
80105c76:	6a 03                	push   $0x3
  jmp alltraps
80105c78:	e9 15 fb ff ff       	jmp    80105792 <alltraps>

80105c7d <vector4>:
.globl vector4
vector4:
  pushl $0
80105c7d:	6a 00                	push   $0x0
  pushl $4
80105c7f:	6a 04                	push   $0x4
  jmp alltraps
80105c81:	e9 0c fb ff ff       	jmp    80105792 <alltraps>

80105c86 <vector5>:
.globl vector5
vector5:
  pushl $0
80105c86:	6a 00                	push   $0x0
  pushl $5
80105c88:	6a 05                	push   $0x5
  jmp alltraps
80105c8a:	e9 03 fb ff ff       	jmp    80105792 <alltraps>

80105c8f <vector6>:
.globl vector6
vector6:
  pushl $0
80105c8f:	6a 00                	push   $0x0
  pushl $6
80105c91:	6a 06                	push   $0x6
  jmp alltraps
80105c93:	e9 fa fa ff ff       	jmp    80105792 <alltraps>

80105c98 <vector7>:
.globl vector7
vector7:
  pushl $0
80105c98:	6a 00                	push   $0x0
  pushl $7
80105c9a:	6a 07                	push   $0x7
  jmp alltraps
80105c9c:	e9 f1 fa ff ff       	jmp    80105792 <alltraps>

80105ca1 <vector8>:
.globl vector8
vector8:
  pushl $8
80105ca1:	6a 08                	push   $0x8
  jmp alltraps
80105ca3:	e9 ea fa ff ff       	jmp    80105792 <alltraps>

80105ca8 <vector9>:
.globl vector9
vector9:
  pushl $0
80105ca8:	6a 00                	push   $0x0
  pushl $9
80105caa:	6a 09                	push   $0x9
  jmp alltraps
80105cac:	e9 e1 fa ff ff       	jmp    80105792 <alltraps>

80105cb1 <vector10>:
.globl vector10
vector10:
  pushl $10
80105cb1:	6a 0a                	push   $0xa
  jmp alltraps
80105cb3:	e9 da fa ff ff       	jmp    80105792 <alltraps>

80105cb8 <vector11>:
.globl vector11
vector11:
  pushl $11
80105cb8:	6a 0b                	push   $0xb
  jmp alltraps
80105cba:	e9 d3 fa ff ff       	jmp    80105792 <alltraps>

80105cbf <vector12>:
.globl vector12
vector12:
  pushl $12
80105cbf:	6a 0c                	push   $0xc
  jmp alltraps
80105cc1:	e9 cc fa ff ff       	jmp    80105792 <alltraps>

80105cc6 <vector13>:
.globl vector13
vector13:
  pushl $13
80105cc6:	6a 0d                	push   $0xd
  jmp alltraps
80105cc8:	e9 c5 fa ff ff       	jmp    80105792 <alltraps>

80105ccd <vector14>:
.globl vector14
vector14:
  pushl $14
80105ccd:	6a 0e                	push   $0xe
  jmp alltraps
80105ccf:	e9 be fa ff ff       	jmp    80105792 <alltraps>

80105cd4 <vector15>:
.globl vector15
vector15:
  pushl $0
80105cd4:	6a 00                	push   $0x0
  pushl $15
80105cd6:	6a 0f                	push   $0xf
  jmp alltraps
80105cd8:	e9 b5 fa ff ff       	jmp    80105792 <alltraps>

80105cdd <vector16>:
.globl vector16
vector16:
  pushl $0
80105cdd:	6a 00                	push   $0x0
  pushl $16
80105cdf:	6a 10                	push   $0x10
  jmp alltraps
80105ce1:	e9 ac fa ff ff       	jmp    80105792 <alltraps>

80105ce6 <vector17>:
.globl vector17
vector17:
  pushl $17
80105ce6:	6a 11                	push   $0x11
  jmp alltraps
80105ce8:	e9 a5 fa ff ff       	jmp    80105792 <alltraps>

80105ced <vector18>:
.globl vector18
vector18:
  pushl $0
80105ced:	6a 00                	push   $0x0
  pushl $18
80105cef:	6a 12                	push   $0x12
  jmp alltraps
80105cf1:	e9 9c fa ff ff       	jmp    80105792 <alltraps>

80105cf6 <vector19>:
.globl vector19
vector19:
  pushl $0
80105cf6:	6a 00                	push   $0x0
  pushl $19
80105cf8:	6a 13                	push   $0x13
  jmp alltraps
80105cfa:	e9 93 fa ff ff       	jmp    80105792 <alltraps>

80105cff <vector20>:
.globl vector20
vector20:
  pushl $0
80105cff:	6a 00                	push   $0x0
  pushl $20
80105d01:	6a 14                	push   $0x14
  jmp alltraps
80105d03:	e9 8a fa ff ff       	jmp    80105792 <alltraps>

80105d08 <vector21>:
.globl vector21
vector21:
  pushl $0
80105d08:	6a 00                	push   $0x0
  pushl $21
80105d0a:	6a 15                	push   $0x15
  jmp alltraps
80105d0c:	e9 81 fa ff ff       	jmp    80105792 <alltraps>

80105d11 <vector22>:
.globl vector22
vector22:
  pushl $0
80105d11:	6a 00                	push   $0x0
  pushl $22
80105d13:	6a 16                	push   $0x16
  jmp alltraps
80105d15:	e9 78 fa ff ff       	jmp    80105792 <alltraps>

80105d1a <vector23>:
.globl vector23
vector23:
  pushl $0
80105d1a:	6a 00                	push   $0x0
  pushl $23
80105d1c:	6a 17                	push   $0x17
  jmp alltraps
80105d1e:	e9 6f fa ff ff       	jmp    80105792 <alltraps>

80105d23 <vector24>:
.globl vector24
vector24:
  pushl $0
80105d23:	6a 00                	push   $0x0
  pushl $24
80105d25:	6a 18                	push   $0x18
  jmp alltraps
80105d27:	e9 66 fa ff ff       	jmp    80105792 <alltraps>

80105d2c <vector25>:
.globl vector25
vector25:
  pushl $0
80105d2c:	6a 00                	push   $0x0
  pushl $25
80105d2e:	6a 19                	push   $0x19
  jmp alltraps
80105d30:	e9 5d fa ff ff       	jmp    80105792 <alltraps>

80105d35 <vector26>:
.globl vector26
vector26:
  pushl $0
80105d35:	6a 00                	push   $0x0
  pushl $26
80105d37:	6a 1a                	push   $0x1a
  jmp alltraps
80105d39:	e9 54 fa ff ff       	jmp    80105792 <alltraps>

80105d3e <vector27>:
.globl vector27
vector27:
  pushl $0
80105d3e:	6a 00                	push   $0x0
  pushl $27
80105d40:	6a 1b                	push   $0x1b
  jmp alltraps
80105d42:	e9 4b fa ff ff       	jmp    80105792 <alltraps>

80105d47 <vector28>:
.globl vector28
vector28:
  pushl $0
80105d47:	6a 00                	push   $0x0
  pushl $28
80105d49:	6a 1c                	push   $0x1c
  jmp alltraps
80105d4b:	e9 42 fa ff ff       	jmp    80105792 <alltraps>

80105d50 <vector29>:
.globl vector29
vector29:
  pushl $0
80105d50:	6a 00                	push   $0x0
  pushl $29
80105d52:	6a 1d                	push   $0x1d
  jmp alltraps
80105d54:	e9 39 fa ff ff       	jmp    80105792 <alltraps>

80105d59 <vector30>:
.globl vector30
vector30:
  pushl $0
80105d59:	6a 00                	push   $0x0
  pushl $30
80105d5b:	6a 1e                	push   $0x1e
  jmp alltraps
80105d5d:	e9 30 fa ff ff       	jmp    80105792 <alltraps>

80105d62 <vector31>:
.globl vector31
vector31:
  pushl $0
80105d62:	6a 00                	push   $0x0
  pushl $31
80105d64:	6a 1f                	push   $0x1f
  jmp alltraps
80105d66:	e9 27 fa ff ff       	jmp    80105792 <alltraps>

80105d6b <vector32>:
.globl vector32
vector32:
  pushl $0
80105d6b:	6a 00                	push   $0x0
  pushl $32
80105d6d:	6a 20                	push   $0x20
  jmp alltraps
80105d6f:	e9 1e fa ff ff       	jmp    80105792 <alltraps>

80105d74 <vector33>:
.globl vector33
vector33:
  pushl $0
80105d74:	6a 00                	push   $0x0
  pushl $33
80105d76:	6a 21                	push   $0x21
  jmp alltraps
80105d78:	e9 15 fa ff ff       	jmp    80105792 <alltraps>

80105d7d <vector34>:
.globl vector34
vector34:
  pushl $0
80105d7d:	6a 00                	push   $0x0
  pushl $34
80105d7f:	6a 22                	push   $0x22
  jmp alltraps
80105d81:	e9 0c fa ff ff       	jmp    80105792 <alltraps>

80105d86 <vector35>:
.globl vector35
vector35:
  pushl $0
80105d86:	6a 00                	push   $0x0
  pushl $35
80105d88:	6a 23                	push   $0x23
  jmp alltraps
80105d8a:	e9 03 fa ff ff       	jmp    80105792 <alltraps>

80105d8f <vector36>:
.globl vector36
vector36:
  pushl $0
80105d8f:	6a 00                	push   $0x0
  pushl $36
80105d91:	6a 24                	push   $0x24
  jmp alltraps
80105d93:	e9 fa f9 ff ff       	jmp    80105792 <alltraps>

80105d98 <vector37>:
.globl vector37
vector37:
  pushl $0
80105d98:	6a 00                	push   $0x0
  pushl $37
80105d9a:	6a 25                	push   $0x25
  jmp alltraps
80105d9c:	e9 f1 f9 ff ff       	jmp    80105792 <alltraps>

80105da1 <vector38>:
.globl vector38
vector38:
  pushl $0
80105da1:	6a 00                	push   $0x0
  pushl $38
80105da3:	6a 26                	push   $0x26
  jmp alltraps
80105da5:	e9 e8 f9 ff ff       	jmp    80105792 <alltraps>

80105daa <vector39>:
.globl vector39
vector39:
  pushl $0
80105daa:	6a 00                	push   $0x0
  pushl $39
80105dac:	6a 27                	push   $0x27
  jmp alltraps
80105dae:	e9 df f9 ff ff       	jmp    80105792 <alltraps>

80105db3 <vector40>:
.globl vector40
vector40:
  pushl $0
80105db3:	6a 00                	push   $0x0
  pushl $40
80105db5:	6a 28                	push   $0x28
  jmp alltraps
80105db7:	e9 d6 f9 ff ff       	jmp    80105792 <alltraps>

80105dbc <vector41>:
.globl vector41
vector41:
  pushl $0
80105dbc:	6a 00                	push   $0x0
  pushl $41
80105dbe:	6a 29                	push   $0x29
  jmp alltraps
80105dc0:	e9 cd f9 ff ff       	jmp    80105792 <alltraps>

80105dc5 <vector42>:
.globl vector42
vector42:
  pushl $0
80105dc5:	6a 00                	push   $0x0
  pushl $42
80105dc7:	6a 2a                	push   $0x2a
  jmp alltraps
80105dc9:	e9 c4 f9 ff ff       	jmp    80105792 <alltraps>

80105dce <vector43>:
.globl vector43
vector43:
  pushl $0
80105dce:	6a 00                	push   $0x0
  pushl $43
80105dd0:	6a 2b                	push   $0x2b
  jmp alltraps
80105dd2:	e9 bb f9 ff ff       	jmp    80105792 <alltraps>

80105dd7 <vector44>:
.globl vector44
vector44:
  pushl $0
80105dd7:	6a 00                	push   $0x0
  pushl $44
80105dd9:	6a 2c                	push   $0x2c
  jmp alltraps
80105ddb:	e9 b2 f9 ff ff       	jmp    80105792 <alltraps>

80105de0 <vector45>:
.globl vector45
vector45:
  pushl $0
80105de0:	6a 00                	push   $0x0
  pushl $45
80105de2:	6a 2d                	push   $0x2d
  jmp alltraps
80105de4:	e9 a9 f9 ff ff       	jmp    80105792 <alltraps>

80105de9 <vector46>:
.globl vector46
vector46:
  pushl $0
80105de9:	6a 00                	push   $0x0
  pushl $46
80105deb:	6a 2e                	push   $0x2e
  jmp alltraps
80105ded:	e9 a0 f9 ff ff       	jmp    80105792 <alltraps>

80105df2 <vector47>:
.globl vector47
vector47:
  pushl $0
80105df2:	6a 00                	push   $0x0
  pushl $47
80105df4:	6a 2f                	push   $0x2f
  jmp alltraps
80105df6:	e9 97 f9 ff ff       	jmp    80105792 <alltraps>

80105dfb <vector48>:
.globl vector48
vector48:
  pushl $0
80105dfb:	6a 00                	push   $0x0
  pushl $48
80105dfd:	6a 30                	push   $0x30
  jmp alltraps
80105dff:	e9 8e f9 ff ff       	jmp    80105792 <alltraps>

80105e04 <vector49>:
.globl vector49
vector49:
  pushl $0
80105e04:	6a 00                	push   $0x0
  pushl $49
80105e06:	6a 31                	push   $0x31
  jmp alltraps
80105e08:	e9 85 f9 ff ff       	jmp    80105792 <alltraps>

80105e0d <vector50>:
.globl vector50
vector50:
  pushl $0
80105e0d:	6a 00                	push   $0x0
  pushl $50
80105e0f:	6a 32                	push   $0x32
  jmp alltraps
80105e11:	e9 7c f9 ff ff       	jmp    80105792 <alltraps>

80105e16 <vector51>:
.globl vector51
vector51:
  pushl $0
80105e16:	6a 00                	push   $0x0
  pushl $51
80105e18:	6a 33                	push   $0x33
  jmp alltraps
80105e1a:	e9 73 f9 ff ff       	jmp    80105792 <alltraps>

80105e1f <vector52>:
.globl vector52
vector52:
  pushl $0
80105e1f:	6a 00                	push   $0x0
  pushl $52
80105e21:	6a 34                	push   $0x34
  jmp alltraps
80105e23:	e9 6a f9 ff ff       	jmp    80105792 <alltraps>

80105e28 <vector53>:
.globl vector53
vector53:
  pushl $0
80105e28:	6a 00                	push   $0x0
  pushl $53
80105e2a:	6a 35                	push   $0x35
  jmp alltraps
80105e2c:	e9 61 f9 ff ff       	jmp    80105792 <alltraps>

80105e31 <vector54>:
.globl vector54
vector54:
  pushl $0
80105e31:	6a 00                	push   $0x0
  pushl $54
80105e33:	6a 36                	push   $0x36
  jmp alltraps
80105e35:	e9 58 f9 ff ff       	jmp    80105792 <alltraps>

80105e3a <vector55>:
.globl vector55
vector55:
  pushl $0
80105e3a:	6a 00                	push   $0x0
  pushl $55
80105e3c:	6a 37                	push   $0x37
  jmp alltraps
80105e3e:	e9 4f f9 ff ff       	jmp    80105792 <alltraps>

80105e43 <vector56>:
.globl vector56
vector56:
  pushl $0
80105e43:	6a 00                	push   $0x0
  pushl $56
80105e45:	6a 38                	push   $0x38
  jmp alltraps
80105e47:	e9 46 f9 ff ff       	jmp    80105792 <alltraps>

80105e4c <vector57>:
.globl vector57
vector57:
  pushl $0
80105e4c:	6a 00                	push   $0x0
  pushl $57
80105e4e:	6a 39                	push   $0x39
  jmp alltraps
80105e50:	e9 3d f9 ff ff       	jmp    80105792 <alltraps>

80105e55 <vector58>:
.globl vector58
vector58:
  pushl $0
80105e55:	6a 00                	push   $0x0
  pushl $58
80105e57:	6a 3a                	push   $0x3a
  jmp alltraps
80105e59:	e9 34 f9 ff ff       	jmp    80105792 <alltraps>

80105e5e <vector59>:
.globl vector59
vector59:
  pushl $0
80105e5e:	6a 00                	push   $0x0
  pushl $59
80105e60:	6a 3b                	push   $0x3b
  jmp alltraps
80105e62:	e9 2b f9 ff ff       	jmp    80105792 <alltraps>

80105e67 <vector60>:
.globl vector60
vector60:
  pushl $0
80105e67:	6a 00                	push   $0x0
  pushl $60
80105e69:	6a 3c                	push   $0x3c
  jmp alltraps
80105e6b:	e9 22 f9 ff ff       	jmp    80105792 <alltraps>

80105e70 <vector61>:
.globl vector61
vector61:
  pushl $0
80105e70:	6a 00                	push   $0x0
  pushl $61
80105e72:	6a 3d                	push   $0x3d
  jmp alltraps
80105e74:	e9 19 f9 ff ff       	jmp    80105792 <alltraps>

80105e79 <vector62>:
.globl vector62
vector62:
  pushl $0
80105e79:	6a 00                	push   $0x0
  pushl $62
80105e7b:	6a 3e                	push   $0x3e
  jmp alltraps
80105e7d:	e9 10 f9 ff ff       	jmp    80105792 <alltraps>

80105e82 <vector63>:
.globl vector63
vector63:
  pushl $0
80105e82:	6a 00                	push   $0x0
  pushl $63
80105e84:	6a 3f                	push   $0x3f
  jmp alltraps
80105e86:	e9 07 f9 ff ff       	jmp    80105792 <alltraps>

80105e8b <vector64>:
.globl vector64
vector64:
  pushl $0
80105e8b:	6a 00                	push   $0x0
  pushl $64
80105e8d:	6a 40                	push   $0x40
  jmp alltraps
80105e8f:	e9 fe f8 ff ff       	jmp    80105792 <alltraps>

80105e94 <vector65>:
.globl vector65
vector65:
  pushl $0
80105e94:	6a 00                	push   $0x0
  pushl $65
80105e96:	6a 41                	push   $0x41
  jmp alltraps
80105e98:	e9 f5 f8 ff ff       	jmp    80105792 <alltraps>

80105e9d <vector66>:
.globl vector66
vector66:
  pushl $0
80105e9d:	6a 00                	push   $0x0
  pushl $66
80105e9f:	6a 42                	push   $0x42
  jmp alltraps
80105ea1:	e9 ec f8 ff ff       	jmp    80105792 <alltraps>

80105ea6 <vector67>:
.globl vector67
vector67:
  pushl $0
80105ea6:	6a 00                	push   $0x0
  pushl $67
80105ea8:	6a 43                	push   $0x43
  jmp alltraps
80105eaa:	e9 e3 f8 ff ff       	jmp    80105792 <alltraps>

80105eaf <vector68>:
.globl vector68
vector68:
  pushl $0
80105eaf:	6a 00                	push   $0x0
  pushl $68
80105eb1:	6a 44                	push   $0x44
  jmp alltraps
80105eb3:	e9 da f8 ff ff       	jmp    80105792 <alltraps>

80105eb8 <vector69>:
.globl vector69
vector69:
  pushl $0
80105eb8:	6a 00                	push   $0x0
  pushl $69
80105eba:	6a 45                	push   $0x45
  jmp alltraps
80105ebc:	e9 d1 f8 ff ff       	jmp    80105792 <alltraps>

80105ec1 <vector70>:
.globl vector70
vector70:
  pushl $0
80105ec1:	6a 00                	push   $0x0
  pushl $70
80105ec3:	6a 46                	push   $0x46
  jmp alltraps
80105ec5:	e9 c8 f8 ff ff       	jmp    80105792 <alltraps>

80105eca <vector71>:
.globl vector71
vector71:
  pushl $0
80105eca:	6a 00                	push   $0x0
  pushl $71
80105ecc:	6a 47                	push   $0x47
  jmp alltraps
80105ece:	e9 bf f8 ff ff       	jmp    80105792 <alltraps>

80105ed3 <vector72>:
.globl vector72
vector72:
  pushl $0
80105ed3:	6a 00                	push   $0x0
  pushl $72
80105ed5:	6a 48                	push   $0x48
  jmp alltraps
80105ed7:	e9 b6 f8 ff ff       	jmp    80105792 <alltraps>

80105edc <vector73>:
.globl vector73
vector73:
  pushl $0
80105edc:	6a 00                	push   $0x0
  pushl $73
80105ede:	6a 49                	push   $0x49
  jmp alltraps
80105ee0:	e9 ad f8 ff ff       	jmp    80105792 <alltraps>

80105ee5 <vector74>:
.globl vector74
vector74:
  pushl $0
80105ee5:	6a 00                	push   $0x0
  pushl $74
80105ee7:	6a 4a                	push   $0x4a
  jmp alltraps
80105ee9:	e9 a4 f8 ff ff       	jmp    80105792 <alltraps>

80105eee <vector75>:
.globl vector75
vector75:
  pushl $0
80105eee:	6a 00                	push   $0x0
  pushl $75
80105ef0:	6a 4b                	push   $0x4b
  jmp alltraps
80105ef2:	e9 9b f8 ff ff       	jmp    80105792 <alltraps>

80105ef7 <vector76>:
.globl vector76
vector76:
  pushl $0
80105ef7:	6a 00                	push   $0x0
  pushl $76
80105ef9:	6a 4c                	push   $0x4c
  jmp alltraps
80105efb:	e9 92 f8 ff ff       	jmp    80105792 <alltraps>

80105f00 <vector77>:
.globl vector77
vector77:
  pushl $0
80105f00:	6a 00                	push   $0x0
  pushl $77
80105f02:	6a 4d                	push   $0x4d
  jmp alltraps
80105f04:	e9 89 f8 ff ff       	jmp    80105792 <alltraps>

80105f09 <vector78>:
.globl vector78
vector78:
  pushl $0
80105f09:	6a 00                	push   $0x0
  pushl $78
80105f0b:	6a 4e                	push   $0x4e
  jmp alltraps
80105f0d:	e9 80 f8 ff ff       	jmp    80105792 <alltraps>

80105f12 <vector79>:
.globl vector79
vector79:
  pushl $0
80105f12:	6a 00                	push   $0x0
  pushl $79
80105f14:	6a 4f                	push   $0x4f
  jmp alltraps
80105f16:	e9 77 f8 ff ff       	jmp    80105792 <alltraps>

80105f1b <vector80>:
.globl vector80
vector80:
  pushl $0
80105f1b:	6a 00                	push   $0x0
  pushl $80
80105f1d:	6a 50                	push   $0x50
  jmp alltraps
80105f1f:	e9 6e f8 ff ff       	jmp    80105792 <alltraps>

80105f24 <vector81>:
.globl vector81
vector81:
  pushl $0
80105f24:	6a 00                	push   $0x0
  pushl $81
80105f26:	6a 51                	push   $0x51
  jmp alltraps
80105f28:	e9 65 f8 ff ff       	jmp    80105792 <alltraps>

80105f2d <vector82>:
.globl vector82
vector82:
  pushl $0
80105f2d:	6a 00                	push   $0x0
  pushl $82
80105f2f:	6a 52                	push   $0x52
  jmp alltraps
80105f31:	e9 5c f8 ff ff       	jmp    80105792 <alltraps>

80105f36 <vector83>:
.globl vector83
vector83:
  pushl $0
80105f36:	6a 00                	push   $0x0
  pushl $83
80105f38:	6a 53                	push   $0x53
  jmp alltraps
80105f3a:	e9 53 f8 ff ff       	jmp    80105792 <alltraps>

80105f3f <vector84>:
.globl vector84
vector84:
  pushl $0
80105f3f:	6a 00                	push   $0x0
  pushl $84
80105f41:	6a 54                	push   $0x54
  jmp alltraps
80105f43:	e9 4a f8 ff ff       	jmp    80105792 <alltraps>

80105f48 <vector85>:
.globl vector85
vector85:
  pushl $0
80105f48:	6a 00                	push   $0x0
  pushl $85
80105f4a:	6a 55                	push   $0x55
  jmp alltraps
80105f4c:	e9 41 f8 ff ff       	jmp    80105792 <alltraps>

80105f51 <vector86>:
.globl vector86
vector86:
  pushl $0
80105f51:	6a 00                	push   $0x0
  pushl $86
80105f53:	6a 56                	push   $0x56
  jmp alltraps
80105f55:	e9 38 f8 ff ff       	jmp    80105792 <alltraps>

80105f5a <vector87>:
.globl vector87
vector87:
  pushl $0
80105f5a:	6a 00                	push   $0x0
  pushl $87
80105f5c:	6a 57                	push   $0x57
  jmp alltraps
80105f5e:	e9 2f f8 ff ff       	jmp    80105792 <alltraps>

80105f63 <vector88>:
.globl vector88
vector88:
  pushl $0
80105f63:	6a 00                	push   $0x0
  pushl $88
80105f65:	6a 58                	push   $0x58
  jmp alltraps
80105f67:	e9 26 f8 ff ff       	jmp    80105792 <alltraps>

80105f6c <vector89>:
.globl vector89
vector89:
  pushl $0
80105f6c:	6a 00                	push   $0x0
  pushl $89
80105f6e:	6a 59                	push   $0x59
  jmp alltraps
80105f70:	e9 1d f8 ff ff       	jmp    80105792 <alltraps>

80105f75 <vector90>:
.globl vector90
vector90:
  pushl $0
80105f75:	6a 00                	push   $0x0
  pushl $90
80105f77:	6a 5a                	push   $0x5a
  jmp alltraps
80105f79:	e9 14 f8 ff ff       	jmp    80105792 <alltraps>

80105f7e <vector91>:
.globl vector91
vector91:
  pushl $0
80105f7e:	6a 00                	push   $0x0
  pushl $91
80105f80:	6a 5b                	push   $0x5b
  jmp alltraps
80105f82:	e9 0b f8 ff ff       	jmp    80105792 <alltraps>

80105f87 <vector92>:
.globl vector92
vector92:
  pushl $0
80105f87:	6a 00                	push   $0x0
  pushl $92
80105f89:	6a 5c                	push   $0x5c
  jmp alltraps
80105f8b:	e9 02 f8 ff ff       	jmp    80105792 <alltraps>

80105f90 <vector93>:
.globl vector93
vector93:
  pushl $0
80105f90:	6a 00                	push   $0x0
  pushl $93
80105f92:	6a 5d                	push   $0x5d
  jmp alltraps
80105f94:	e9 f9 f7 ff ff       	jmp    80105792 <alltraps>

80105f99 <vector94>:
.globl vector94
vector94:
  pushl $0
80105f99:	6a 00                	push   $0x0
  pushl $94
80105f9b:	6a 5e                	push   $0x5e
  jmp alltraps
80105f9d:	e9 f0 f7 ff ff       	jmp    80105792 <alltraps>

80105fa2 <vector95>:
.globl vector95
vector95:
  pushl $0
80105fa2:	6a 00                	push   $0x0
  pushl $95
80105fa4:	6a 5f                	push   $0x5f
  jmp alltraps
80105fa6:	e9 e7 f7 ff ff       	jmp    80105792 <alltraps>

80105fab <vector96>:
.globl vector96
vector96:
  pushl $0
80105fab:	6a 00                	push   $0x0
  pushl $96
80105fad:	6a 60                	push   $0x60
  jmp alltraps
80105faf:	e9 de f7 ff ff       	jmp    80105792 <alltraps>

80105fb4 <vector97>:
.globl vector97
vector97:
  pushl $0
80105fb4:	6a 00                	push   $0x0
  pushl $97
80105fb6:	6a 61                	push   $0x61
  jmp alltraps
80105fb8:	e9 d5 f7 ff ff       	jmp    80105792 <alltraps>

80105fbd <vector98>:
.globl vector98
vector98:
  pushl $0
80105fbd:	6a 00                	push   $0x0
  pushl $98
80105fbf:	6a 62                	push   $0x62
  jmp alltraps
80105fc1:	e9 cc f7 ff ff       	jmp    80105792 <alltraps>

80105fc6 <vector99>:
.globl vector99
vector99:
  pushl $0
80105fc6:	6a 00                	push   $0x0
  pushl $99
80105fc8:	6a 63                	push   $0x63
  jmp alltraps
80105fca:	e9 c3 f7 ff ff       	jmp    80105792 <alltraps>

80105fcf <vector100>:
.globl vector100
vector100:
  pushl $0
80105fcf:	6a 00                	push   $0x0
  pushl $100
80105fd1:	6a 64                	push   $0x64
  jmp alltraps
80105fd3:	e9 ba f7 ff ff       	jmp    80105792 <alltraps>

80105fd8 <vector101>:
.globl vector101
vector101:
  pushl $0
80105fd8:	6a 00                	push   $0x0
  pushl $101
80105fda:	6a 65                	push   $0x65
  jmp alltraps
80105fdc:	e9 b1 f7 ff ff       	jmp    80105792 <alltraps>

80105fe1 <vector102>:
.globl vector102
vector102:
  pushl $0
80105fe1:	6a 00                	push   $0x0
  pushl $102
80105fe3:	6a 66                	push   $0x66
  jmp alltraps
80105fe5:	e9 a8 f7 ff ff       	jmp    80105792 <alltraps>

80105fea <vector103>:
.globl vector103
vector103:
  pushl $0
80105fea:	6a 00                	push   $0x0
  pushl $103
80105fec:	6a 67                	push   $0x67
  jmp alltraps
80105fee:	e9 9f f7 ff ff       	jmp    80105792 <alltraps>

80105ff3 <vector104>:
.globl vector104
vector104:
  pushl $0
80105ff3:	6a 00                	push   $0x0
  pushl $104
80105ff5:	6a 68                	push   $0x68
  jmp alltraps
80105ff7:	e9 96 f7 ff ff       	jmp    80105792 <alltraps>

80105ffc <vector105>:
.globl vector105
vector105:
  pushl $0
80105ffc:	6a 00                	push   $0x0
  pushl $105
80105ffe:	6a 69                	push   $0x69
  jmp alltraps
80106000:	e9 8d f7 ff ff       	jmp    80105792 <alltraps>

80106005 <vector106>:
.globl vector106
vector106:
  pushl $0
80106005:	6a 00                	push   $0x0
  pushl $106
80106007:	6a 6a                	push   $0x6a
  jmp alltraps
80106009:	e9 84 f7 ff ff       	jmp    80105792 <alltraps>

8010600e <vector107>:
.globl vector107
vector107:
  pushl $0
8010600e:	6a 00                	push   $0x0
  pushl $107
80106010:	6a 6b                	push   $0x6b
  jmp alltraps
80106012:	e9 7b f7 ff ff       	jmp    80105792 <alltraps>

80106017 <vector108>:
.globl vector108
vector108:
  pushl $0
80106017:	6a 00                	push   $0x0
  pushl $108
80106019:	6a 6c                	push   $0x6c
  jmp alltraps
8010601b:	e9 72 f7 ff ff       	jmp    80105792 <alltraps>

80106020 <vector109>:
.globl vector109
vector109:
  pushl $0
80106020:	6a 00                	push   $0x0
  pushl $109
80106022:	6a 6d                	push   $0x6d
  jmp alltraps
80106024:	e9 69 f7 ff ff       	jmp    80105792 <alltraps>

80106029 <vector110>:
.globl vector110
vector110:
  pushl $0
80106029:	6a 00                	push   $0x0
  pushl $110
8010602b:	6a 6e                	push   $0x6e
  jmp alltraps
8010602d:	e9 60 f7 ff ff       	jmp    80105792 <alltraps>

80106032 <vector111>:
.globl vector111
vector111:
  pushl $0
80106032:	6a 00                	push   $0x0
  pushl $111
80106034:	6a 6f                	push   $0x6f
  jmp alltraps
80106036:	e9 57 f7 ff ff       	jmp    80105792 <alltraps>

8010603b <vector112>:
.globl vector112
vector112:
  pushl $0
8010603b:	6a 00                	push   $0x0
  pushl $112
8010603d:	6a 70                	push   $0x70
  jmp alltraps
8010603f:	e9 4e f7 ff ff       	jmp    80105792 <alltraps>

80106044 <vector113>:
.globl vector113
vector113:
  pushl $0
80106044:	6a 00                	push   $0x0
  pushl $113
80106046:	6a 71                	push   $0x71
  jmp alltraps
80106048:	e9 45 f7 ff ff       	jmp    80105792 <alltraps>

8010604d <vector114>:
.globl vector114
vector114:
  pushl $0
8010604d:	6a 00                	push   $0x0
  pushl $114
8010604f:	6a 72                	push   $0x72
  jmp alltraps
80106051:	e9 3c f7 ff ff       	jmp    80105792 <alltraps>

80106056 <vector115>:
.globl vector115
vector115:
  pushl $0
80106056:	6a 00                	push   $0x0
  pushl $115
80106058:	6a 73                	push   $0x73
  jmp alltraps
8010605a:	e9 33 f7 ff ff       	jmp    80105792 <alltraps>

8010605f <vector116>:
.globl vector116
vector116:
  pushl $0
8010605f:	6a 00                	push   $0x0
  pushl $116
80106061:	6a 74                	push   $0x74
  jmp alltraps
80106063:	e9 2a f7 ff ff       	jmp    80105792 <alltraps>

80106068 <vector117>:
.globl vector117
vector117:
  pushl $0
80106068:	6a 00                	push   $0x0
  pushl $117
8010606a:	6a 75                	push   $0x75
  jmp alltraps
8010606c:	e9 21 f7 ff ff       	jmp    80105792 <alltraps>

80106071 <vector118>:
.globl vector118
vector118:
  pushl $0
80106071:	6a 00                	push   $0x0
  pushl $118
80106073:	6a 76                	push   $0x76
  jmp alltraps
80106075:	e9 18 f7 ff ff       	jmp    80105792 <alltraps>

8010607a <vector119>:
.globl vector119
vector119:
  pushl $0
8010607a:	6a 00                	push   $0x0
  pushl $119
8010607c:	6a 77                	push   $0x77
  jmp alltraps
8010607e:	e9 0f f7 ff ff       	jmp    80105792 <alltraps>

80106083 <vector120>:
.globl vector120
vector120:
  pushl $0
80106083:	6a 00                	push   $0x0
  pushl $120
80106085:	6a 78                	push   $0x78
  jmp alltraps
80106087:	e9 06 f7 ff ff       	jmp    80105792 <alltraps>

8010608c <vector121>:
.globl vector121
vector121:
  pushl $0
8010608c:	6a 00                	push   $0x0
  pushl $121
8010608e:	6a 79                	push   $0x79
  jmp alltraps
80106090:	e9 fd f6 ff ff       	jmp    80105792 <alltraps>

80106095 <vector122>:
.globl vector122
vector122:
  pushl $0
80106095:	6a 00                	push   $0x0
  pushl $122
80106097:	6a 7a                	push   $0x7a
  jmp alltraps
80106099:	e9 f4 f6 ff ff       	jmp    80105792 <alltraps>

8010609e <vector123>:
.globl vector123
vector123:
  pushl $0
8010609e:	6a 00                	push   $0x0
  pushl $123
801060a0:	6a 7b                	push   $0x7b
  jmp alltraps
801060a2:	e9 eb f6 ff ff       	jmp    80105792 <alltraps>

801060a7 <vector124>:
.globl vector124
vector124:
  pushl $0
801060a7:	6a 00                	push   $0x0
  pushl $124
801060a9:	6a 7c                	push   $0x7c
  jmp alltraps
801060ab:	e9 e2 f6 ff ff       	jmp    80105792 <alltraps>

801060b0 <vector125>:
.globl vector125
vector125:
  pushl $0
801060b0:	6a 00                	push   $0x0
  pushl $125
801060b2:	6a 7d                	push   $0x7d
  jmp alltraps
801060b4:	e9 d9 f6 ff ff       	jmp    80105792 <alltraps>

801060b9 <vector126>:
.globl vector126
vector126:
  pushl $0
801060b9:	6a 00                	push   $0x0
  pushl $126
801060bb:	6a 7e                	push   $0x7e
  jmp alltraps
801060bd:	e9 d0 f6 ff ff       	jmp    80105792 <alltraps>

801060c2 <vector127>:
.globl vector127
vector127:
  pushl $0
801060c2:	6a 00                	push   $0x0
  pushl $127
801060c4:	6a 7f                	push   $0x7f
  jmp alltraps
801060c6:	e9 c7 f6 ff ff       	jmp    80105792 <alltraps>

801060cb <vector128>:
.globl vector128
vector128:
  pushl $0
801060cb:	6a 00                	push   $0x0
  pushl $128
801060cd:	68 80 00 00 00       	push   $0x80
  jmp alltraps
801060d2:	e9 bb f6 ff ff       	jmp    80105792 <alltraps>

801060d7 <vector129>:
.globl vector129
vector129:
  pushl $0
801060d7:	6a 00                	push   $0x0
  pushl $129
801060d9:	68 81 00 00 00       	push   $0x81
  jmp alltraps
801060de:	e9 af f6 ff ff       	jmp    80105792 <alltraps>

801060e3 <vector130>:
.globl vector130
vector130:
  pushl $0
801060e3:	6a 00                	push   $0x0
  pushl $130
801060e5:	68 82 00 00 00       	push   $0x82
  jmp alltraps
801060ea:	e9 a3 f6 ff ff       	jmp    80105792 <alltraps>

801060ef <vector131>:
.globl vector131
vector131:
  pushl $0
801060ef:	6a 00                	push   $0x0
  pushl $131
801060f1:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801060f6:	e9 97 f6 ff ff       	jmp    80105792 <alltraps>

801060fb <vector132>:
.globl vector132
vector132:
  pushl $0
801060fb:	6a 00                	push   $0x0
  pushl $132
801060fd:	68 84 00 00 00       	push   $0x84
  jmp alltraps
80106102:	e9 8b f6 ff ff       	jmp    80105792 <alltraps>

80106107 <vector133>:
.globl vector133
vector133:
  pushl $0
80106107:	6a 00                	push   $0x0
  pushl $133
80106109:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010610e:	e9 7f f6 ff ff       	jmp    80105792 <alltraps>

80106113 <vector134>:
.globl vector134
vector134:
  pushl $0
80106113:	6a 00                	push   $0x0
  pushl $134
80106115:	68 86 00 00 00       	push   $0x86
  jmp alltraps
8010611a:	e9 73 f6 ff ff       	jmp    80105792 <alltraps>

8010611f <vector135>:
.globl vector135
vector135:
  pushl $0
8010611f:	6a 00                	push   $0x0
  pushl $135
80106121:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106126:	e9 67 f6 ff ff       	jmp    80105792 <alltraps>

8010612b <vector136>:
.globl vector136
vector136:
  pushl $0
8010612b:	6a 00                	push   $0x0
  pushl $136
8010612d:	68 88 00 00 00       	push   $0x88
  jmp alltraps
80106132:	e9 5b f6 ff ff       	jmp    80105792 <alltraps>

80106137 <vector137>:
.globl vector137
vector137:
  pushl $0
80106137:	6a 00                	push   $0x0
  pushl $137
80106139:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010613e:	e9 4f f6 ff ff       	jmp    80105792 <alltraps>

80106143 <vector138>:
.globl vector138
vector138:
  pushl $0
80106143:	6a 00                	push   $0x0
  pushl $138
80106145:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
8010614a:	e9 43 f6 ff ff       	jmp    80105792 <alltraps>

8010614f <vector139>:
.globl vector139
vector139:
  pushl $0
8010614f:	6a 00                	push   $0x0
  pushl $139
80106151:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106156:	e9 37 f6 ff ff       	jmp    80105792 <alltraps>

8010615b <vector140>:
.globl vector140
vector140:
  pushl $0
8010615b:	6a 00                	push   $0x0
  pushl $140
8010615d:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
80106162:	e9 2b f6 ff ff       	jmp    80105792 <alltraps>

80106167 <vector141>:
.globl vector141
vector141:
  pushl $0
80106167:	6a 00                	push   $0x0
  pushl $141
80106169:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010616e:	e9 1f f6 ff ff       	jmp    80105792 <alltraps>

80106173 <vector142>:
.globl vector142
vector142:
  pushl $0
80106173:	6a 00                	push   $0x0
  pushl $142
80106175:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
8010617a:	e9 13 f6 ff ff       	jmp    80105792 <alltraps>

8010617f <vector143>:
.globl vector143
vector143:
  pushl $0
8010617f:	6a 00                	push   $0x0
  pushl $143
80106181:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106186:	e9 07 f6 ff ff       	jmp    80105792 <alltraps>

8010618b <vector144>:
.globl vector144
vector144:
  pushl $0
8010618b:	6a 00                	push   $0x0
  pushl $144
8010618d:	68 90 00 00 00       	push   $0x90
  jmp alltraps
80106192:	e9 fb f5 ff ff       	jmp    80105792 <alltraps>

80106197 <vector145>:
.globl vector145
vector145:
  pushl $0
80106197:	6a 00                	push   $0x0
  pushl $145
80106199:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010619e:	e9 ef f5 ff ff       	jmp    80105792 <alltraps>

801061a3 <vector146>:
.globl vector146
vector146:
  pushl $0
801061a3:	6a 00                	push   $0x0
  pushl $146
801061a5:	68 92 00 00 00       	push   $0x92
  jmp alltraps
801061aa:	e9 e3 f5 ff ff       	jmp    80105792 <alltraps>

801061af <vector147>:
.globl vector147
vector147:
  pushl $0
801061af:	6a 00                	push   $0x0
  pushl $147
801061b1:	68 93 00 00 00       	push   $0x93
  jmp alltraps
801061b6:	e9 d7 f5 ff ff       	jmp    80105792 <alltraps>

801061bb <vector148>:
.globl vector148
vector148:
  pushl $0
801061bb:	6a 00                	push   $0x0
  pushl $148
801061bd:	68 94 00 00 00       	push   $0x94
  jmp alltraps
801061c2:	e9 cb f5 ff ff       	jmp    80105792 <alltraps>

801061c7 <vector149>:
.globl vector149
vector149:
  pushl $0
801061c7:	6a 00                	push   $0x0
  pushl $149
801061c9:	68 95 00 00 00       	push   $0x95
  jmp alltraps
801061ce:	e9 bf f5 ff ff       	jmp    80105792 <alltraps>

801061d3 <vector150>:
.globl vector150
vector150:
  pushl $0
801061d3:	6a 00                	push   $0x0
  pushl $150
801061d5:	68 96 00 00 00       	push   $0x96
  jmp alltraps
801061da:	e9 b3 f5 ff ff       	jmp    80105792 <alltraps>

801061df <vector151>:
.globl vector151
vector151:
  pushl $0
801061df:	6a 00                	push   $0x0
  pushl $151
801061e1:	68 97 00 00 00       	push   $0x97
  jmp alltraps
801061e6:	e9 a7 f5 ff ff       	jmp    80105792 <alltraps>

801061eb <vector152>:
.globl vector152
vector152:
  pushl $0
801061eb:	6a 00                	push   $0x0
  pushl $152
801061ed:	68 98 00 00 00       	push   $0x98
  jmp alltraps
801061f2:	e9 9b f5 ff ff       	jmp    80105792 <alltraps>

801061f7 <vector153>:
.globl vector153
vector153:
  pushl $0
801061f7:	6a 00                	push   $0x0
  pushl $153
801061f9:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801061fe:	e9 8f f5 ff ff       	jmp    80105792 <alltraps>

80106203 <vector154>:
.globl vector154
vector154:
  pushl $0
80106203:	6a 00                	push   $0x0
  pushl $154
80106205:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
8010620a:	e9 83 f5 ff ff       	jmp    80105792 <alltraps>

8010620f <vector155>:
.globl vector155
vector155:
  pushl $0
8010620f:	6a 00                	push   $0x0
  pushl $155
80106211:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106216:	e9 77 f5 ff ff       	jmp    80105792 <alltraps>

8010621b <vector156>:
.globl vector156
vector156:
  pushl $0
8010621b:	6a 00                	push   $0x0
  pushl $156
8010621d:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
80106222:	e9 6b f5 ff ff       	jmp    80105792 <alltraps>

80106227 <vector157>:
.globl vector157
vector157:
  pushl $0
80106227:	6a 00                	push   $0x0
  pushl $157
80106229:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
8010622e:	e9 5f f5 ff ff       	jmp    80105792 <alltraps>

80106233 <vector158>:
.globl vector158
vector158:
  pushl $0
80106233:	6a 00                	push   $0x0
  pushl $158
80106235:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
8010623a:	e9 53 f5 ff ff       	jmp    80105792 <alltraps>

8010623f <vector159>:
.globl vector159
vector159:
  pushl $0
8010623f:	6a 00                	push   $0x0
  pushl $159
80106241:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80106246:	e9 47 f5 ff ff       	jmp    80105792 <alltraps>

8010624b <vector160>:
.globl vector160
vector160:
  pushl $0
8010624b:	6a 00                	push   $0x0
  pushl $160
8010624d:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
80106252:	e9 3b f5 ff ff       	jmp    80105792 <alltraps>

80106257 <vector161>:
.globl vector161
vector161:
  pushl $0
80106257:	6a 00                	push   $0x0
  pushl $161
80106259:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
8010625e:	e9 2f f5 ff ff       	jmp    80105792 <alltraps>

80106263 <vector162>:
.globl vector162
vector162:
  pushl $0
80106263:	6a 00                	push   $0x0
  pushl $162
80106265:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
8010626a:	e9 23 f5 ff ff       	jmp    80105792 <alltraps>

8010626f <vector163>:
.globl vector163
vector163:
  pushl $0
8010626f:	6a 00                	push   $0x0
  pushl $163
80106271:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106276:	e9 17 f5 ff ff       	jmp    80105792 <alltraps>

8010627b <vector164>:
.globl vector164
vector164:
  pushl $0
8010627b:	6a 00                	push   $0x0
  pushl $164
8010627d:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
80106282:	e9 0b f5 ff ff       	jmp    80105792 <alltraps>

80106287 <vector165>:
.globl vector165
vector165:
  pushl $0
80106287:	6a 00                	push   $0x0
  pushl $165
80106289:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010628e:	e9 ff f4 ff ff       	jmp    80105792 <alltraps>

80106293 <vector166>:
.globl vector166
vector166:
  pushl $0
80106293:	6a 00                	push   $0x0
  pushl $166
80106295:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
8010629a:	e9 f3 f4 ff ff       	jmp    80105792 <alltraps>

8010629f <vector167>:
.globl vector167
vector167:
  pushl $0
8010629f:	6a 00                	push   $0x0
  pushl $167
801062a1:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
801062a6:	e9 e7 f4 ff ff       	jmp    80105792 <alltraps>

801062ab <vector168>:
.globl vector168
vector168:
  pushl $0
801062ab:	6a 00                	push   $0x0
  pushl $168
801062ad:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
801062b2:	e9 db f4 ff ff       	jmp    80105792 <alltraps>

801062b7 <vector169>:
.globl vector169
vector169:
  pushl $0
801062b7:	6a 00                	push   $0x0
  pushl $169
801062b9:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
801062be:	e9 cf f4 ff ff       	jmp    80105792 <alltraps>

801062c3 <vector170>:
.globl vector170
vector170:
  pushl $0
801062c3:	6a 00                	push   $0x0
  pushl $170
801062c5:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801062ca:	e9 c3 f4 ff ff       	jmp    80105792 <alltraps>

801062cf <vector171>:
.globl vector171
vector171:
  pushl $0
801062cf:	6a 00                	push   $0x0
  pushl $171
801062d1:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
801062d6:	e9 b7 f4 ff ff       	jmp    80105792 <alltraps>

801062db <vector172>:
.globl vector172
vector172:
  pushl $0
801062db:	6a 00                	push   $0x0
  pushl $172
801062dd:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
801062e2:	e9 ab f4 ff ff       	jmp    80105792 <alltraps>

801062e7 <vector173>:
.globl vector173
vector173:
  pushl $0
801062e7:	6a 00                	push   $0x0
  pushl $173
801062e9:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
801062ee:	e9 9f f4 ff ff       	jmp    80105792 <alltraps>

801062f3 <vector174>:
.globl vector174
vector174:
  pushl $0
801062f3:	6a 00                	push   $0x0
  pushl $174
801062f5:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801062fa:	e9 93 f4 ff ff       	jmp    80105792 <alltraps>

801062ff <vector175>:
.globl vector175
vector175:
  pushl $0
801062ff:	6a 00                	push   $0x0
  pushl $175
80106301:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106306:	e9 87 f4 ff ff       	jmp    80105792 <alltraps>

8010630b <vector176>:
.globl vector176
vector176:
  pushl $0
8010630b:	6a 00                	push   $0x0
  pushl $176
8010630d:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
80106312:	e9 7b f4 ff ff       	jmp    80105792 <alltraps>

80106317 <vector177>:
.globl vector177
vector177:
  pushl $0
80106317:	6a 00                	push   $0x0
  pushl $177
80106319:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010631e:	e9 6f f4 ff ff       	jmp    80105792 <alltraps>

80106323 <vector178>:
.globl vector178
vector178:
  pushl $0
80106323:	6a 00                	push   $0x0
  pushl $178
80106325:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
8010632a:	e9 63 f4 ff ff       	jmp    80105792 <alltraps>

8010632f <vector179>:
.globl vector179
vector179:
  pushl $0
8010632f:	6a 00                	push   $0x0
  pushl $179
80106331:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106336:	e9 57 f4 ff ff       	jmp    80105792 <alltraps>

8010633b <vector180>:
.globl vector180
vector180:
  pushl $0
8010633b:	6a 00                	push   $0x0
  pushl $180
8010633d:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
80106342:	e9 4b f4 ff ff       	jmp    80105792 <alltraps>

80106347 <vector181>:
.globl vector181
vector181:
  pushl $0
80106347:	6a 00                	push   $0x0
  pushl $181
80106349:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
8010634e:	e9 3f f4 ff ff       	jmp    80105792 <alltraps>

80106353 <vector182>:
.globl vector182
vector182:
  pushl $0
80106353:	6a 00                	push   $0x0
  pushl $182
80106355:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
8010635a:	e9 33 f4 ff ff       	jmp    80105792 <alltraps>

8010635f <vector183>:
.globl vector183
vector183:
  pushl $0
8010635f:	6a 00                	push   $0x0
  pushl $183
80106361:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106366:	e9 27 f4 ff ff       	jmp    80105792 <alltraps>

8010636b <vector184>:
.globl vector184
vector184:
  pushl $0
8010636b:	6a 00                	push   $0x0
  pushl $184
8010636d:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
80106372:	e9 1b f4 ff ff       	jmp    80105792 <alltraps>

80106377 <vector185>:
.globl vector185
vector185:
  pushl $0
80106377:	6a 00                	push   $0x0
  pushl $185
80106379:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010637e:	e9 0f f4 ff ff       	jmp    80105792 <alltraps>

80106383 <vector186>:
.globl vector186
vector186:
  pushl $0
80106383:	6a 00                	push   $0x0
  pushl $186
80106385:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
8010638a:	e9 03 f4 ff ff       	jmp    80105792 <alltraps>

8010638f <vector187>:
.globl vector187
vector187:
  pushl $0
8010638f:	6a 00                	push   $0x0
  pushl $187
80106391:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106396:	e9 f7 f3 ff ff       	jmp    80105792 <alltraps>

8010639b <vector188>:
.globl vector188
vector188:
  pushl $0
8010639b:	6a 00                	push   $0x0
  pushl $188
8010639d:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
801063a2:	e9 eb f3 ff ff       	jmp    80105792 <alltraps>

801063a7 <vector189>:
.globl vector189
vector189:
  pushl $0
801063a7:	6a 00                	push   $0x0
  pushl $189
801063a9:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
801063ae:	e9 df f3 ff ff       	jmp    80105792 <alltraps>

801063b3 <vector190>:
.globl vector190
vector190:
  pushl $0
801063b3:	6a 00                	push   $0x0
  pushl $190
801063b5:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
801063ba:	e9 d3 f3 ff ff       	jmp    80105792 <alltraps>

801063bf <vector191>:
.globl vector191
vector191:
  pushl $0
801063bf:	6a 00                	push   $0x0
  pushl $191
801063c1:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
801063c6:	e9 c7 f3 ff ff       	jmp    80105792 <alltraps>

801063cb <vector192>:
.globl vector192
vector192:
  pushl $0
801063cb:	6a 00                	push   $0x0
  pushl $192
801063cd:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
801063d2:	e9 bb f3 ff ff       	jmp    80105792 <alltraps>

801063d7 <vector193>:
.globl vector193
vector193:
  pushl $0
801063d7:	6a 00                	push   $0x0
  pushl $193
801063d9:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
801063de:	e9 af f3 ff ff       	jmp    80105792 <alltraps>

801063e3 <vector194>:
.globl vector194
vector194:
  pushl $0
801063e3:	6a 00                	push   $0x0
  pushl $194
801063e5:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
801063ea:	e9 a3 f3 ff ff       	jmp    80105792 <alltraps>

801063ef <vector195>:
.globl vector195
vector195:
  pushl $0
801063ef:	6a 00                	push   $0x0
  pushl $195
801063f1:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
801063f6:	e9 97 f3 ff ff       	jmp    80105792 <alltraps>

801063fb <vector196>:
.globl vector196
vector196:
  pushl $0
801063fb:	6a 00                	push   $0x0
  pushl $196
801063fd:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
80106402:	e9 8b f3 ff ff       	jmp    80105792 <alltraps>

80106407 <vector197>:
.globl vector197
vector197:
  pushl $0
80106407:	6a 00                	push   $0x0
  pushl $197
80106409:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010640e:	e9 7f f3 ff ff       	jmp    80105792 <alltraps>

80106413 <vector198>:
.globl vector198
vector198:
  pushl $0
80106413:	6a 00                	push   $0x0
  pushl $198
80106415:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
8010641a:	e9 73 f3 ff ff       	jmp    80105792 <alltraps>

8010641f <vector199>:
.globl vector199
vector199:
  pushl $0
8010641f:	6a 00                	push   $0x0
  pushl $199
80106421:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106426:	e9 67 f3 ff ff       	jmp    80105792 <alltraps>

8010642b <vector200>:
.globl vector200
vector200:
  pushl $0
8010642b:	6a 00                	push   $0x0
  pushl $200
8010642d:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
80106432:	e9 5b f3 ff ff       	jmp    80105792 <alltraps>

80106437 <vector201>:
.globl vector201
vector201:
  pushl $0
80106437:	6a 00                	push   $0x0
  pushl $201
80106439:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
8010643e:	e9 4f f3 ff ff       	jmp    80105792 <alltraps>

80106443 <vector202>:
.globl vector202
vector202:
  pushl $0
80106443:	6a 00                	push   $0x0
  pushl $202
80106445:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
8010644a:	e9 43 f3 ff ff       	jmp    80105792 <alltraps>

8010644f <vector203>:
.globl vector203
vector203:
  pushl $0
8010644f:	6a 00                	push   $0x0
  pushl $203
80106451:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106456:	e9 37 f3 ff ff       	jmp    80105792 <alltraps>

8010645b <vector204>:
.globl vector204
vector204:
  pushl $0
8010645b:	6a 00                	push   $0x0
  pushl $204
8010645d:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
80106462:	e9 2b f3 ff ff       	jmp    80105792 <alltraps>

80106467 <vector205>:
.globl vector205
vector205:
  pushl $0
80106467:	6a 00                	push   $0x0
  pushl $205
80106469:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
8010646e:	e9 1f f3 ff ff       	jmp    80105792 <alltraps>

80106473 <vector206>:
.globl vector206
vector206:
  pushl $0
80106473:	6a 00                	push   $0x0
  pushl $206
80106475:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
8010647a:	e9 13 f3 ff ff       	jmp    80105792 <alltraps>

8010647f <vector207>:
.globl vector207
vector207:
  pushl $0
8010647f:	6a 00                	push   $0x0
  pushl $207
80106481:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106486:	e9 07 f3 ff ff       	jmp    80105792 <alltraps>

8010648b <vector208>:
.globl vector208
vector208:
  pushl $0
8010648b:	6a 00                	push   $0x0
  pushl $208
8010648d:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
80106492:	e9 fb f2 ff ff       	jmp    80105792 <alltraps>

80106497 <vector209>:
.globl vector209
vector209:
  pushl $0
80106497:	6a 00                	push   $0x0
  pushl $209
80106499:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010649e:	e9 ef f2 ff ff       	jmp    80105792 <alltraps>

801064a3 <vector210>:
.globl vector210
vector210:
  pushl $0
801064a3:	6a 00                	push   $0x0
  pushl $210
801064a5:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
801064aa:	e9 e3 f2 ff ff       	jmp    80105792 <alltraps>

801064af <vector211>:
.globl vector211
vector211:
  pushl $0
801064af:	6a 00                	push   $0x0
  pushl $211
801064b1:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
801064b6:	e9 d7 f2 ff ff       	jmp    80105792 <alltraps>

801064bb <vector212>:
.globl vector212
vector212:
  pushl $0
801064bb:	6a 00                	push   $0x0
  pushl $212
801064bd:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
801064c2:	e9 cb f2 ff ff       	jmp    80105792 <alltraps>

801064c7 <vector213>:
.globl vector213
vector213:
  pushl $0
801064c7:	6a 00                	push   $0x0
  pushl $213
801064c9:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
801064ce:	e9 bf f2 ff ff       	jmp    80105792 <alltraps>

801064d3 <vector214>:
.globl vector214
vector214:
  pushl $0
801064d3:	6a 00                	push   $0x0
  pushl $214
801064d5:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
801064da:	e9 b3 f2 ff ff       	jmp    80105792 <alltraps>

801064df <vector215>:
.globl vector215
vector215:
  pushl $0
801064df:	6a 00                	push   $0x0
  pushl $215
801064e1:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
801064e6:	e9 a7 f2 ff ff       	jmp    80105792 <alltraps>

801064eb <vector216>:
.globl vector216
vector216:
  pushl $0
801064eb:	6a 00                	push   $0x0
  pushl $216
801064ed:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
801064f2:	e9 9b f2 ff ff       	jmp    80105792 <alltraps>

801064f7 <vector217>:
.globl vector217
vector217:
  pushl $0
801064f7:	6a 00                	push   $0x0
  pushl $217
801064f9:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
801064fe:	e9 8f f2 ff ff       	jmp    80105792 <alltraps>

80106503 <vector218>:
.globl vector218
vector218:
  pushl $0
80106503:	6a 00                	push   $0x0
  pushl $218
80106505:	68 da 00 00 00       	push   $0xda
  jmp alltraps
8010650a:	e9 83 f2 ff ff       	jmp    80105792 <alltraps>

8010650f <vector219>:
.globl vector219
vector219:
  pushl $0
8010650f:	6a 00                	push   $0x0
  pushl $219
80106511:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106516:	e9 77 f2 ff ff       	jmp    80105792 <alltraps>

8010651b <vector220>:
.globl vector220
vector220:
  pushl $0
8010651b:	6a 00                	push   $0x0
  pushl $220
8010651d:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80106522:	e9 6b f2 ff ff       	jmp    80105792 <alltraps>

80106527 <vector221>:
.globl vector221
vector221:
  pushl $0
80106527:	6a 00                	push   $0x0
  pushl $221
80106529:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
8010652e:	e9 5f f2 ff ff       	jmp    80105792 <alltraps>

80106533 <vector222>:
.globl vector222
vector222:
  pushl $0
80106533:	6a 00                	push   $0x0
  pushl $222
80106535:	68 de 00 00 00       	push   $0xde
  jmp alltraps
8010653a:	e9 53 f2 ff ff       	jmp    80105792 <alltraps>

8010653f <vector223>:
.globl vector223
vector223:
  pushl $0
8010653f:	6a 00                	push   $0x0
  pushl $223
80106541:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106546:	e9 47 f2 ff ff       	jmp    80105792 <alltraps>

8010654b <vector224>:
.globl vector224
vector224:
  pushl $0
8010654b:	6a 00                	push   $0x0
  pushl $224
8010654d:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80106552:	e9 3b f2 ff ff       	jmp    80105792 <alltraps>

80106557 <vector225>:
.globl vector225
vector225:
  pushl $0
80106557:	6a 00                	push   $0x0
  pushl $225
80106559:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
8010655e:	e9 2f f2 ff ff       	jmp    80105792 <alltraps>

80106563 <vector226>:
.globl vector226
vector226:
  pushl $0
80106563:	6a 00                	push   $0x0
  pushl $226
80106565:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
8010656a:	e9 23 f2 ff ff       	jmp    80105792 <alltraps>

8010656f <vector227>:
.globl vector227
vector227:
  pushl $0
8010656f:	6a 00                	push   $0x0
  pushl $227
80106571:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106576:	e9 17 f2 ff ff       	jmp    80105792 <alltraps>

8010657b <vector228>:
.globl vector228
vector228:
  pushl $0
8010657b:	6a 00                	push   $0x0
  pushl $228
8010657d:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80106582:	e9 0b f2 ff ff       	jmp    80105792 <alltraps>

80106587 <vector229>:
.globl vector229
vector229:
  pushl $0
80106587:	6a 00                	push   $0x0
  pushl $229
80106589:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010658e:	e9 ff f1 ff ff       	jmp    80105792 <alltraps>

80106593 <vector230>:
.globl vector230
vector230:
  pushl $0
80106593:	6a 00                	push   $0x0
  pushl $230
80106595:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
8010659a:	e9 f3 f1 ff ff       	jmp    80105792 <alltraps>

8010659f <vector231>:
.globl vector231
vector231:
  pushl $0
8010659f:	6a 00                	push   $0x0
  pushl $231
801065a1:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
801065a6:	e9 e7 f1 ff ff       	jmp    80105792 <alltraps>

801065ab <vector232>:
.globl vector232
vector232:
  pushl $0
801065ab:	6a 00                	push   $0x0
  pushl $232
801065ad:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
801065b2:	e9 db f1 ff ff       	jmp    80105792 <alltraps>

801065b7 <vector233>:
.globl vector233
vector233:
  pushl $0
801065b7:	6a 00                	push   $0x0
  pushl $233
801065b9:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
801065be:	e9 cf f1 ff ff       	jmp    80105792 <alltraps>

801065c3 <vector234>:
.globl vector234
vector234:
  pushl $0
801065c3:	6a 00                	push   $0x0
  pushl $234
801065c5:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
801065ca:	e9 c3 f1 ff ff       	jmp    80105792 <alltraps>

801065cf <vector235>:
.globl vector235
vector235:
  pushl $0
801065cf:	6a 00                	push   $0x0
  pushl $235
801065d1:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
801065d6:	e9 b7 f1 ff ff       	jmp    80105792 <alltraps>

801065db <vector236>:
.globl vector236
vector236:
  pushl $0
801065db:	6a 00                	push   $0x0
  pushl $236
801065dd:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
801065e2:	e9 ab f1 ff ff       	jmp    80105792 <alltraps>

801065e7 <vector237>:
.globl vector237
vector237:
  pushl $0
801065e7:	6a 00                	push   $0x0
  pushl $237
801065e9:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
801065ee:	e9 9f f1 ff ff       	jmp    80105792 <alltraps>

801065f3 <vector238>:
.globl vector238
vector238:
  pushl $0
801065f3:	6a 00                	push   $0x0
  pushl $238
801065f5:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
801065fa:	e9 93 f1 ff ff       	jmp    80105792 <alltraps>

801065ff <vector239>:
.globl vector239
vector239:
  pushl $0
801065ff:	6a 00                	push   $0x0
  pushl $239
80106601:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106606:	e9 87 f1 ff ff       	jmp    80105792 <alltraps>

8010660b <vector240>:
.globl vector240
vector240:
  pushl $0
8010660b:	6a 00                	push   $0x0
  pushl $240
8010660d:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80106612:	e9 7b f1 ff ff       	jmp    80105792 <alltraps>

80106617 <vector241>:
.globl vector241
vector241:
  pushl $0
80106617:	6a 00                	push   $0x0
  pushl $241
80106619:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
8010661e:	e9 6f f1 ff ff       	jmp    80105792 <alltraps>

80106623 <vector242>:
.globl vector242
vector242:
  pushl $0
80106623:	6a 00                	push   $0x0
  pushl $242
80106625:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
8010662a:	e9 63 f1 ff ff       	jmp    80105792 <alltraps>

8010662f <vector243>:
.globl vector243
vector243:
  pushl $0
8010662f:	6a 00                	push   $0x0
  pushl $243
80106631:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106636:	e9 57 f1 ff ff       	jmp    80105792 <alltraps>

8010663b <vector244>:
.globl vector244
vector244:
  pushl $0
8010663b:	6a 00                	push   $0x0
  pushl $244
8010663d:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106642:	e9 4b f1 ff ff       	jmp    80105792 <alltraps>

80106647 <vector245>:
.globl vector245
vector245:
  pushl $0
80106647:	6a 00                	push   $0x0
  pushl $245
80106649:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
8010664e:	e9 3f f1 ff ff       	jmp    80105792 <alltraps>

80106653 <vector246>:
.globl vector246
vector246:
  pushl $0
80106653:	6a 00                	push   $0x0
  pushl $246
80106655:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
8010665a:	e9 33 f1 ff ff       	jmp    80105792 <alltraps>

8010665f <vector247>:
.globl vector247
vector247:
  pushl $0
8010665f:	6a 00                	push   $0x0
  pushl $247
80106661:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106666:	e9 27 f1 ff ff       	jmp    80105792 <alltraps>

8010666b <vector248>:
.globl vector248
vector248:
  pushl $0
8010666b:	6a 00                	push   $0x0
  pushl $248
8010666d:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106672:	e9 1b f1 ff ff       	jmp    80105792 <alltraps>

80106677 <vector249>:
.globl vector249
vector249:
  pushl $0
80106677:	6a 00                	push   $0x0
  pushl $249
80106679:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
8010667e:	e9 0f f1 ff ff       	jmp    80105792 <alltraps>

80106683 <vector250>:
.globl vector250
vector250:
  pushl $0
80106683:	6a 00                	push   $0x0
  pushl $250
80106685:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
8010668a:	e9 03 f1 ff ff       	jmp    80105792 <alltraps>

8010668f <vector251>:
.globl vector251
vector251:
  pushl $0
8010668f:	6a 00                	push   $0x0
  pushl $251
80106691:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106696:	e9 f7 f0 ff ff       	jmp    80105792 <alltraps>

8010669b <vector252>:
.globl vector252
vector252:
  pushl $0
8010669b:	6a 00                	push   $0x0
  pushl $252
8010669d:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
801066a2:	e9 eb f0 ff ff       	jmp    80105792 <alltraps>

801066a7 <vector253>:
.globl vector253
vector253:
  pushl $0
801066a7:	6a 00                	push   $0x0
  pushl $253
801066a9:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
801066ae:	e9 df f0 ff ff       	jmp    80105792 <alltraps>

801066b3 <vector254>:
.globl vector254
vector254:
  pushl $0
801066b3:	6a 00                	push   $0x0
  pushl $254
801066b5:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
801066ba:	e9 d3 f0 ff ff       	jmp    80105792 <alltraps>

801066bf <vector255>:
.globl vector255
vector255:
  pushl $0
801066bf:	6a 00                	push   $0x0
  pushl $255
801066c1:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
801066c6:	e9 c7 f0 ff ff       	jmp    80105792 <alltraps>
801066cb:	66 90                	xchg   %ax,%ax
801066cd:	66 90                	xchg   %ax,%ax
801066cf:	90                   	nop

801066d0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801066d0:	55                   	push   %ebp
801066d1:	89 e5                	mov    %esp,%ebp
801066d3:	57                   	push   %edi
801066d4:	56                   	push   %esi
801066d5:	89 d6                	mov    %edx,%esi
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801066d7:	c1 ea 16             	shr    $0x16,%edx
{
801066da:	53                   	push   %ebx
  pde = &pgdir[PDX(va)];
801066db:	8d 3c 90             	lea    (%eax,%edx,4),%edi
{
801066de:	83 ec 0c             	sub    $0xc,%esp
  if(*pde & PTE_P){
801066e1:	8b 1f                	mov    (%edi),%ebx
801066e3:	f6 c3 01             	test   $0x1,%bl
801066e6:	74 28                	je     80106710 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801066e8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801066ee:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801066f4:	89 f0                	mov    %esi,%eax
}
801066f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
801066f9:	c1 e8 0a             	shr    $0xa,%eax
801066fc:	25 fc 0f 00 00       	and    $0xffc,%eax
80106701:	01 d8                	add    %ebx,%eax
}
80106703:	5b                   	pop    %ebx
80106704:	5e                   	pop    %esi
80106705:	5f                   	pop    %edi
80106706:	5d                   	pop    %ebp
80106707:	c3                   	ret    
80106708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010670f:	90                   	nop
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106710:	85 c9                	test   %ecx,%ecx
80106712:	74 2c                	je     80106740 <walkpgdir+0x70>
80106714:	e8 27 bf ff ff       	call   80102640 <kalloc>
80106719:	89 c3                	mov    %eax,%ebx
8010671b:	85 c0                	test   %eax,%eax
8010671d:	74 21                	je     80106740 <walkpgdir+0x70>
    memset(pgtab, 0, PGSIZE);
8010671f:	83 ec 04             	sub    $0x4,%esp
80106722:	68 00 10 00 00       	push   $0x1000
80106727:	6a 00                	push   $0x0
80106729:	50                   	push   %eax
8010672a:	e8 41 de ff ff       	call   80104570 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010672f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106735:	83 c4 10             	add    $0x10,%esp
80106738:	83 c8 07             	or     $0x7,%eax
8010673b:	89 07                	mov    %eax,(%edi)
8010673d:	eb b5                	jmp    801066f4 <walkpgdir+0x24>
8010673f:	90                   	nop
}
80106740:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
80106743:	31 c0                	xor    %eax,%eax
}
80106745:	5b                   	pop    %ebx
80106746:	5e                   	pop    %esi
80106747:	5f                   	pop    %edi
80106748:	5d                   	pop    %ebp
80106749:	c3                   	ret    
8010674a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106750 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106750:	55                   	push   %ebp
80106751:	89 e5                	mov    %esp,%ebp
80106753:	57                   	push   %edi
80106754:	89 c7                	mov    %eax,%edi
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106756:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
{
8010675a:	56                   	push   %esi
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
8010675b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  a = (char*)PGROUNDDOWN((uint)va);
80106760:	89 d6                	mov    %edx,%esi
{
80106762:	53                   	push   %ebx
  a = (char*)PGROUNDDOWN((uint)va);
80106763:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
{
80106769:	83 ec 1c             	sub    $0x1c,%esp
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
8010676c:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010676f:	8b 45 08             	mov    0x8(%ebp),%eax
80106772:	29 f0                	sub    %esi,%eax
80106774:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106777:	eb 1f                	jmp    80106798 <mappages+0x48>
80106779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106780:	f6 00 01             	testb  $0x1,(%eax)
80106783:	75 45                	jne    801067ca <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106785:	0b 5d 0c             	or     0xc(%ebp),%ebx
80106788:	83 cb 01             	or     $0x1,%ebx
8010678b:	89 18                	mov    %ebx,(%eax)
    if(a == last)
8010678d:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80106790:	74 2e                	je     801067c0 <mappages+0x70>
      break;
    a += PGSIZE;
80106792:	81 c6 00 10 00 00    	add    $0x1000,%esi
  for(;;){
80106798:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
8010679b:	b9 01 00 00 00       	mov    $0x1,%ecx
801067a0:	89 f2                	mov    %esi,%edx
801067a2:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
801067a5:	89 f8                	mov    %edi,%eax
801067a7:	e8 24 ff ff ff       	call   801066d0 <walkpgdir>
801067ac:	85 c0                	test   %eax,%eax
801067ae:	75 d0                	jne    80106780 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
801067b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
801067b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801067b8:	5b                   	pop    %ebx
801067b9:	5e                   	pop    %esi
801067ba:	5f                   	pop    %edi
801067bb:	5d                   	pop    %ebp
801067bc:	c3                   	ret    
801067bd:	8d 76 00             	lea    0x0(%esi),%esi
801067c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801067c3:	31 c0                	xor    %eax,%eax
}
801067c5:	5b                   	pop    %ebx
801067c6:	5e                   	pop    %esi
801067c7:	5f                   	pop    %edi
801067c8:	5d                   	pop    %ebp
801067c9:	c3                   	ret    
      panic("remap");
801067ca:	83 ec 0c             	sub    $0xc,%esp
801067cd:	68 68 78 10 80       	push   $0x80107868
801067d2:	e8 a9 9b ff ff       	call   80100380 <panic>
801067d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801067de:	66 90                	xchg   %ax,%ax

801067e0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067e0:	55                   	push   %ebp
801067e1:	89 e5                	mov    %esp,%ebp
801067e3:	57                   	push   %edi
801067e4:	56                   	push   %esi
801067e5:	89 c6                	mov    %eax,%esi
801067e7:	53                   	push   %ebx
801067e8:	89 d3                	mov    %edx,%ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801067ea:	8d 91 ff 0f 00 00    	lea    0xfff(%ecx),%edx
801067f0:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801067f6:	83 ec 1c             	sub    $0x1c,%esp
801067f9:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
801067fc:	39 da                	cmp    %ebx,%edx
801067fe:	73 61                	jae    80106861 <deallocuvm.part.0+0x81>
80106800:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80106803:	89 d7                	mov    %edx,%edi
80106805:	eb 38                	jmp    8010683f <deallocuvm.part.0+0x5f>
80106807:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010680e:	66 90                	xchg   %ax,%ax
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a += (NPTENTRIES - 1) * PGSIZE;
    else if((*pte & PTE_P) != 0){
80106810:	8b 00                	mov    (%eax),%eax
80106812:	a8 01                	test   $0x1,%al
80106814:	74 1e                	je     80106834 <deallocuvm.part.0+0x54>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106816:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010681b:	74 4f                	je     8010686c <deallocuvm.part.0+0x8c>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
8010681d:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106820:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106825:	50                   	push   %eax
80106826:	e8 55 bc ff ff       	call   80102480 <kfree>
      *pte = 0;
8010682b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80106831:	83 c4 10             	add    $0x10,%esp
  for(; a  < oldsz; a += PGSIZE){
80106834:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010683a:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
8010683d:	73 22                	jae    80106861 <deallocuvm.part.0+0x81>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010683f:	31 c9                	xor    %ecx,%ecx
80106841:	89 fa                	mov    %edi,%edx
80106843:	89 f0                	mov    %esi,%eax
80106845:	e8 86 fe ff ff       	call   801066d0 <walkpgdir>
8010684a:	89 c3                	mov    %eax,%ebx
    if(!pte)
8010684c:	85 c0                	test   %eax,%eax
8010684e:	75 c0                	jne    80106810 <deallocuvm.part.0+0x30>
      a += (NPTENTRIES - 1) * PGSIZE;
80106850:	81 c7 00 f0 3f 00    	add    $0x3ff000,%edi
  for(; a  < oldsz; a += PGSIZE){
80106856:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010685c:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
8010685f:	72 de                	jb     8010683f <deallocuvm.part.0+0x5f>
    }
  }
  return newsz;
}
80106861:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106864:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106867:	5b                   	pop    %ebx
80106868:	5e                   	pop    %esi
80106869:	5f                   	pop    %edi
8010686a:	5d                   	pop    %ebp
8010686b:	c3                   	ret    
        panic("kfree");
8010686c:	83 ec 0c             	sub    $0xc,%esp
8010686f:	68 3a 72 10 80       	push   $0x8010723a
80106874:	e8 07 9b ff ff       	call   80100380 <panic>
80106879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106880 <seginit>:
{
80106880:	f3 0f 1e fb          	endbr32 
80106884:	55                   	push   %ebp
80106885:	89 e5                	mov    %esp,%ebp
80106887:	53                   	push   %ebx
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106888:	31 db                	xor    %ebx,%ebx
{
8010688a:	83 ec 14             	sub    $0x14,%esp
  c = &cpus[cpunum()];
8010688d:	e8 1e c0 ff ff       	call   801028b0 <cpunum>
80106892:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106898:	8d 90 e0 12 11 80    	lea    -0x7feeed20(%eax),%edx
8010689e:	8d 88 94 13 11 80    	lea    -0x7feeec6c(%eax),%ecx
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801068a4:	c7 80 58 13 11 80 ff 	movl   $0xffff,-0x7feeeca8(%eax)
801068ab:	ff 00 00 
801068ae:	c7 80 5c 13 11 80 00 	movl   $0xcf9a00,-0x7feeeca4(%eax)
801068b5:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801068b8:	c7 80 60 13 11 80 ff 	movl   $0xffff,-0x7feeeca0(%eax)
801068bf:	ff 00 00 
801068c2:	c7 80 64 13 11 80 00 	movl   $0xcf9200,-0x7feeec9c(%eax)
801068c9:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801068cc:	c7 80 70 13 11 80 ff 	movl   $0xffff,-0x7feeec90(%eax)
801068d3:	ff 00 00 
801068d6:	c7 80 74 13 11 80 00 	movl   $0xcffa00,-0x7feeec8c(%eax)
801068dd:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801068e0:	c7 80 78 13 11 80 ff 	movl   $0xffff,-0x7feeec88(%eax)
801068e7:	ff 00 00 
801068ea:	c7 80 7c 13 11 80 00 	movl   $0xcff200,-0x7feeec84(%eax)
801068f1:	f2 cf 00 
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
801068f4:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
801068fb:	89 cb                	mov    %ecx,%ebx
801068fd:	c1 eb 10             	shr    $0x10,%ebx
80106900:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
80106907:	c1 e9 18             	shr    $0x18,%ecx
8010690a:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
80106910:	bb 92 c0 ff ff       	mov    $0xffffc092,%ebx
80106915:	66 89 98 6d 13 11 80 	mov    %bx,-0x7feeec93(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
8010691c:	05 50 13 11 80       	add    $0x80111350,%eax
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106921:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
  pd[0] = size-1;
80106927:	b9 37 00 00 00       	mov    $0x37,%ecx
8010692c:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  pd[1] = (uint)p;
80106930:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106934:	c1 e8 10             	shr    $0x10,%eax
80106937:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
8010693b:	8d 45 f2             	lea    -0xe(%ebp),%eax
8010693e:	0f 01 10             	lgdtl  (%eax)
  asm volatile("movw %0, %%gs" : : "r" (v));
80106941:	b8 18 00 00 00       	mov    $0x18,%eax
80106946:	8e e8                	mov    %eax,%gs
  proc = 0;
80106948:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
8010694f:	00 00 00 00 
  c = &cpus[cpunum()];
80106953:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
}
8010695a:	83 c4 14             	add    $0x14,%esp
8010695d:	5b                   	pop    %ebx
8010695e:	5d                   	pop    %ebp
8010695f:	c3                   	ret    

80106960 <setupkvm>:
{
80106960:	f3 0f 1e fb          	endbr32 
80106964:	55                   	push   %ebp
80106965:	89 e5                	mov    %esp,%ebp
80106967:	56                   	push   %esi
80106968:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80106969:	e8 d2 bc ff ff       	call   80102640 <kalloc>
8010696e:	85 c0                	test   %eax,%eax
80106970:	74 4e                	je     801069c0 <setupkvm+0x60>
  memset(pgdir, 0, PGSIZE);
80106972:	83 ec 04             	sub    $0x4,%esp
80106975:	89 c6                	mov    %eax,%esi
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106977:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  memset(pgdir, 0, PGSIZE);
8010697c:	68 00 10 00 00       	push   $0x1000
80106981:	6a 00                	push   $0x0
80106983:	50                   	push   %eax
80106984:	e8 e7 db ff ff       	call   80104570 <memset>
80106989:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0)
8010698c:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
8010698f:	83 ec 08             	sub    $0x8,%esp
80106992:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106995:	ff 73 0c             	pushl  0xc(%ebx)
80106998:	8b 13                	mov    (%ebx),%edx
8010699a:	50                   	push   %eax
8010699b:	29 c1                	sub    %eax,%ecx
8010699d:	89 f0                	mov    %esi,%eax
8010699f:	e8 ac fd ff ff       	call   80106750 <mappages>
801069a4:	83 c4 10             	add    $0x10,%esp
801069a7:	85 c0                	test   %eax,%eax
801069a9:	78 15                	js     801069c0 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
801069ab:	83 c3 10             	add    $0x10,%ebx
801069ae:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
801069b4:	75 d6                	jne    8010698c <setupkvm+0x2c>
}
801069b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801069b9:	89 f0                	mov    %esi,%eax
801069bb:	5b                   	pop    %ebx
801069bc:	5e                   	pop    %esi
801069bd:	5d                   	pop    %ebp
801069be:	c3                   	ret    
801069bf:	90                   	nop
801069c0:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
801069c3:	31 f6                	xor    %esi,%esi
}
801069c5:	89 f0                	mov    %esi,%eax
801069c7:	5b                   	pop    %ebx
801069c8:	5e                   	pop    %esi
801069c9:	5d                   	pop    %ebp
801069ca:	c3                   	ret    
801069cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801069cf:	90                   	nop

801069d0 <kvmalloc>:
{
801069d0:	f3 0f 1e fb          	endbr32 
801069d4:	55                   	push   %ebp
801069d5:	89 e5                	mov    %esp,%ebp
801069d7:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
801069da:	e8 81 ff ff ff       	call   80106960 <setupkvm>
801069df:	a3 64 40 11 80       	mov    %eax,0x80114064
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801069e4:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
801069e9:	0f 22 d8             	mov    %eax,%cr3
}
801069ec:	c9                   	leave  
801069ed:	c3                   	ret    
801069ee:	66 90                	xchg   %ax,%ax

801069f0 <switchkvm>:
{
801069f0:	f3 0f 1e fb          	endbr32 
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801069f4:	a1 64 40 11 80       	mov    0x80114064,%eax
801069f9:	05 00 00 00 80       	add    $0x80000000,%eax
801069fe:	0f 22 d8             	mov    %eax,%cr3
}
80106a01:	c3                   	ret    
80106a02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106a10 <switchuvm>:
{
80106a10:	f3 0f 1e fb          	endbr32 
80106a14:	55                   	push   %ebp
80106a15:	89 e5                	mov    %esp,%ebp
80106a17:	53                   	push   %ebx
80106a18:	83 ec 04             	sub    $0x4,%esp
80106a1b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80106a1e:	e8 7d da ff ff       	call   801044a0 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106a23:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106a29:	b9 67 00 00 00       	mov    $0x67,%ecx
80106a2e:	8d 50 08             	lea    0x8(%eax),%edx
80106a31:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106a38:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106a3f:	89 d1                	mov    %edx,%ecx
80106a41:	c1 ea 18             	shr    $0x18,%edx
80106a44:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106a4a:	ba 89 40 00 00       	mov    $0x4089,%edx
80106a4f:	c1 e9 10             	shr    $0x10,%ecx
80106a52:	66 89 90 a5 00 00 00 	mov    %dx,0xa5(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106a59:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106a60:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
  cpu->ts.ss0 = SEG_KDATA << 3;
80106a66:	b9 10 00 00 00       	mov    $0x10,%ecx
80106a6b:	66 89 48 10          	mov    %cx,0x10(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106a6f:	8b 52 08             	mov    0x8(%edx),%edx
80106a72:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106a78:	89 50 0c             	mov    %edx,0xc(%eax)
  cpu->ts.iomb = (ushort) 0xFFFF;
80106a7b:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106a80:	66 89 50 6e          	mov    %dx,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106a84:	b8 30 00 00 00       	mov    $0x30,%eax
80106a89:	0f 00 d8             	ltr    %ax
  if(p->pgdir == 0)
80106a8c:	8b 43 04             	mov    0x4(%ebx),%eax
80106a8f:	85 c0                	test   %eax,%eax
80106a91:	74 11                	je     80106aa4 <switchuvm+0x94>
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106a93:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106a98:	0f 22 d8             	mov    %eax,%cr3
}
80106a9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106a9e:	c9                   	leave  
  popcli();
80106a9f:	e9 2c da ff ff       	jmp    801044d0 <popcli>
    panic("switchuvm: no pgdir");
80106aa4:	83 ec 0c             	sub    $0xc,%esp
80106aa7:	68 6e 78 10 80       	push   $0x8010786e
80106aac:	e8 cf 98 ff ff       	call   80100380 <panic>
80106ab1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ab8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106abf:	90                   	nop

80106ac0 <inituvm>:
{
80106ac0:	f3 0f 1e fb          	endbr32 
80106ac4:	55                   	push   %ebp
80106ac5:	89 e5                	mov    %esp,%ebp
80106ac7:	57                   	push   %edi
80106ac8:	56                   	push   %esi
80106ac9:	53                   	push   %ebx
80106aca:	83 ec 1c             	sub    $0x1c,%esp
80106acd:	8b 45 0c             	mov    0xc(%ebp),%eax
80106ad0:	8b 75 10             	mov    0x10(%ebp),%esi
80106ad3:	8b 7d 08             	mov    0x8(%ebp),%edi
80106ad6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106ad9:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106adf:	77 4b                	ja     80106b2c <inituvm+0x6c>
  mem = kalloc();
80106ae1:	e8 5a bb ff ff       	call   80102640 <kalloc>
  memset(mem, 0, PGSIZE);
80106ae6:	83 ec 04             	sub    $0x4,%esp
80106ae9:	68 00 10 00 00       	push   $0x1000
  mem = kalloc();
80106aee:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106af0:	6a 00                	push   $0x0
80106af2:	50                   	push   %eax
80106af3:	e8 78 da ff ff       	call   80104570 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106af8:	58                   	pop    %eax
80106af9:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106aff:	5a                   	pop    %edx
80106b00:	6a 06                	push   $0x6
80106b02:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b07:	31 d2                	xor    %edx,%edx
80106b09:	50                   	push   %eax
80106b0a:	89 f8                	mov    %edi,%eax
80106b0c:	e8 3f fc ff ff       	call   80106750 <mappages>
  memmove(mem, init, sz);
80106b11:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b14:	89 75 10             	mov    %esi,0x10(%ebp)
80106b17:	83 c4 10             	add    $0x10,%esp
80106b1a:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106b1d:	89 45 0c             	mov    %eax,0xc(%ebp)
}
80106b20:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b23:	5b                   	pop    %ebx
80106b24:	5e                   	pop    %esi
80106b25:	5f                   	pop    %edi
80106b26:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106b27:	e9 e4 da ff ff       	jmp    80104610 <memmove>
    panic("inituvm: more than a page");
80106b2c:	83 ec 0c             	sub    $0xc,%esp
80106b2f:	68 82 78 10 80       	push   $0x80107882
80106b34:	e8 47 98 ff ff       	call   80100380 <panic>
80106b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106b40 <loaduvm>:
{
80106b40:	f3 0f 1e fb          	endbr32 
80106b44:	55                   	push   %ebp
80106b45:	89 e5                	mov    %esp,%ebp
80106b47:	57                   	push   %edi
80106b48:	56                   	push   %esi
80106b49:	53                   	push   %ebx
80106b4a:	83 ec 1c             	sub    $0x1c,%esp
80106b4d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106b50:	8b 75 18             	mov    0x18(%ebp),%esi
  if((uint) addr % PGSIZE != 0)
80106b53:	a9 ff 0f 00 00       	test   $0xfff,%eax
80106b58:	0f 85 99 00 00 00    	jne    80106bf7 <loaduvm+0xb7>
  for(i = 0; i < sz; i += PGSIZE){
80106b5e:	01 f0                	add    %esi,%eax
80106b60:	89 f3                	mov    %esi,%ebx
80106b62:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106b65:	8b 45 14             	mov    0x14(%ebp),%eax
80106b68:	01 f0                	add    %esi,%eax
80106b6a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
80106b6d:	85 f6                	test   %esi,%esi
80106b6f:	75 15                	jne    80106b86 <loaduvm+0x46>
80106b71:	eb 6d                	jmp    80106be0 <loaduvm+0xa0>
80106b73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106b77:	90                   	nop
80106b78:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
80106b7e:	89 f0                	mov    %esi,%eax
80106b80:	29 d8                	sub    %ebx,%eax
80106b82:	39 c6                	cmp    %eax,%esi
80106b84:	76 5a                	jbe    80106be0 <loaduvm+0xa0>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106b86:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106b89:	8b 45 08             	mov    0x8(%ebp),%eax
80106b8c:	31 c9                	xor    %ecx,%ecx
80106b8e:	29 da                	sub    %ebx,%edx
80106b90:	e8 3b fb ff ff       	call   801066d0 <walkpgdir>
80106b95:	85 c0                	test   %eax,%eax
80106b97:	74 51                	je     80106bea <loaduvm+0xaa>
    pa = PTE_ADDR(*pte);
80106b99:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106b9b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    if(sz - i < PGSIZE)
80106b9e:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80106ba3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106ba8:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
80106bae:	0f 46 fb             	cmovbe %ebx,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106bb1:	29 d9                	sub    %ebx,%ecx
80106bb3:	05 00 00 00 80       	add    $0x80000000,%eax
80106bb8:	57                   	push   %edi
80106bb9:	51                   	push   %ecx
80106bba:	50                   	push   %eax
80106bbb:	ff 75 10             	pushl  0x10(%ebp)
80106bbe:	e8 8d ae ff ff       	call   80101a50 <readi>
80106bc3:	83 c4 10             	add    $0x10,%esp
80106bc6:	39 f8                	cmp    %edi,%eax
80106bc8:	74 ae                	je     80106b78 <loaduvm+0x38>
}
80106bca:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106bcd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106bd2:	5b                   	pop    %ebx
80106bd3:	5e                   	pop    %esi
80106bd4:	5f                   	pop    %edi
80106bd5:	5d                   	pop    %ebp
80106bd6:	c3                   	ret    
80106bd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106bde:	66 90                	xchg   %ax,%ax
80106be0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106be3:	31 c0                	xor    %eax,%eax
}
80106be5:	5b                   	pop    %ebx
80106be6:	5e                   	pop    %esi
80106be7:	5f                   	pop    %edi
80106be8:	5d                   	pop    %ebp
80106be9:	c3                   	ret    
      panic("loaduvm: address should exist");
80106bea:	83 ec 0c             	sub    $0xc,%esp
80106bed:	68 9c 78 10 80       	push   $0x8010789c
80106bf2:	e8 89 97 ff ff       	call   80100380 <panic>
    panic("loaduvm: addr must be page aligned");
80106bf7:	83 ec 0c             	sub    $0xc,%esp
80106bfa:	68 40 79 10 80       	push   $0x80107940
80106bff:	e8 7c 97 ff ff       	call   80100380 <panic>
80106c04:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106c0f:	90                   	nop

80106c10 <allocuvm>:
{
80106c10:	f3 0f 1e fb          	endbr32 
80106c14:	55                   	push   %ebp
80106c15:	89 e5                	mov    %esp,%ebp
80106c17:	57                   	push   %edi
80106c18:	56                   	push   %esi
80106c19:	53                   	push   %ebx
80106c1a:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80106c1d:	8b 45 10             	mov    0x10(%ebp),%eax
{
80106c20:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(newsz >= KERNBASE)
80106c23:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106c26:	85 c0                	test   %eax,%eax
80106c28:	0f 88 b2 00 00 00    	js     80106ce0 <allocuvm+0xd0>
  if(newsz < oldsz)
80106c2e:	3b 45 0c             	cmp    0xc(%ebp),%eax
    return oldsz;
80106c31:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(newsz < oldsz)
80106c34:	0f 82 96 00 00 00    	jb     80106cd0 <allocuvm+0xc0>
  a = PGROUNDUP(oldsz);
80106c3a:	8d b0 ff 0f 00 00    	lea    0xfff(%eax),%esi
80106c40:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  for(; a < newsz; a += PGSIZE){
80106c46:	39 75 10             	cmp    %esi,0x10(%ebp)
80106c49:	77 40                	ja     80106c8b <allocuvm+0x7b>
80106c4b:	e9 83 00 00 00       	jmp    80106cd3 <allocuvm+0xc3>
    memset(mem, 0, PGSIZE);
80106c50:	83 ec 04             	sub    $0x4,%esp
80106c53:	68 00 10 00 00       	push   $0x1000
80106c58:	6a 00                	push   $0x0
80106c5a:	50                   	push   %eax
80106c5b:	e8 10 d9 ff ff       	call   80104570 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106c60:	58                   	pop    %eax
80106c61:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106c67:	5a                   	pop    %edx
80106c68:	6a 06                	push   $0x6
80106c6a:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c6f:	89 f2                	mov    %esi,%edx
80106c71:	50                   	push   %eax
80106c72:	89 f8                	mov    %edi,%eax
80106c74:	e8 d7 fa ff ff       	call   80106750 <mappages>
80106c79:	83 c4 10             	add    $0x10,%esp
80106c7c:	85 c0                	test   %eax,%eax
80106c7e:	78 78                	js     80106cf8 <allocuvm+0xe8>
  for(; a < newsz; a += PGSIZE){
80106c80:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106c86:	39 75 10             	cmp    %esi,0x10(%ebp)
80106c89:	76 48                	jbe    80106cd3 <allocuvm+0xc3>
    mem = kalloc();
80106c8b:	e8 b0 b9 ff ff       	call   80102640 <kalloc>
80106c90:	89 c3                	mov    %eax,%ebx
    if(mem == 0){
80106c92:	85 c0                	test   %eax,%eax
80106c94:	75 ba                	jne    80106c50 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
80106c96:	83 ec 0c             	sub    $0xc,%esp
80106c99:	68 ba 78 10 80       	push   $0x801078ba
80106c9e:	e8 fd 99 ff ff       	call   801006a0 <cprintf>
  if(newsz >= oldsz)
80106ca3:	8b 45 0c             	mov    0xc(%ebp),%eax
80106ca6:	83 c4 10             	add    $0x10,%esp
80106ca9:	39 45 10             	cmp    %eax,0x10(%ebp)
80106cac:	74 32                	je     80106ce0 <allocuvm+0xd0>
80106cae:	8b 55 10             	mov    0x10(%ebp),%edx
80106cb1:	89 c1                	mov    %eax,%ecx
80106cb3:	89 f8                	mov    %edi,%eax
80106cb5:	e8 26 fb ff ff       	call   801067e0 <deallocuvm.part.0>
      return 0;
80106cba:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
}
80106cc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106cc4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cc7:	5b                   	pop    %ebx
80106cc8:	5e                   	pop    %esi
80106cc9:	5f                   	pop    %edi
80106cca:	5d                   	pop    %ebp
80106ccb:	c3                   	ret    
80106ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return oldsz;
80106cd0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}
80106cd3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106cd6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cd9:	5b                   	pop    %ebx
80106cda:	5e                   	pop    %esi
80106cdb:	5f                   	pop    %edi
80106cdc:	5d                   	pop    %ebp
80106cdd:	c3                   	ret    
80106cde:	66 90                	xchg   %ax,%ax
    return 0;
80106ce0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
}
80106ce7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106cea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ced:	5b                   	pop    %ebx
80106cee:	5e                   	pop    %esi
80106cef:	5f                   	pop    %edi
80106cf0:	5d                   	pop    %ebp
80106cf1:	c3                   	ret    
80106cf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80106cf8:	83 ec 0c             	sub    $0xc,%esp
80106cfb:	68 d2 78 10 80       	push   $0x801078d2
80106d00:	e8 9b 99 ff ff       	call   801006a0 <cprintf>
  if(newsz >= oldsz)
80106d05:	8b 45 0c             	mov    0xc(%ebp),%eax
80106d08:	83 c4 10             	add    $0x10,%esp
80106d0b:	39 45 10             	cmp    %eax,0x10(%ebp)
80106d0e:	74 0c                	je     80106d1c <allocuvm+0x10c>
80106d10:	8b 55 10             	mov    0x10(%ebp),%edx
80106d13:	89 c1                	mov    %eax,%ecx
80106d15:	89 f8                	mov    %edi,%eax
80106d17:	e8 c4 fa ff ff       	call   801067e0 <deallocuvm.part.0>
      kfree(mem);
80106d1c:	83 ec 0c             	sub    $0xc,%esp
80106d1f:	53                   	push   %ebx
80106d20:	e8 5b b7 ff ff       	call   80102480 <kfree>
      return 0;
80106d25:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80106d2c:	83 c4 10             	add    $0x10,%esp
}
80106d2f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d32:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d35:	5b                   	pop    %ebx
80106d36:	5e                   	pop    %esi
80106d37:	5f                   	pop    %edi
80106d38:	5d                   	pop    %ebp
80106d39:	c3                   	ret    
80106d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d40 <deallocuvm>:
{
80106d40:	f3 0f 1e fb          	endbr32 
80106d44:	55                   	push   %ebp
80106d45:	89 e5                	mov    %esp,%ebp
80106d47:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d4a:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106d4d:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
80106d50:	39 d1                	cmp    %edx,%ecx
80106d52:	73 0c                	jae    80106d60 <deallocuvm+0x20>
}
80106d54:	5d                   	pop    %ebp
80106d55:	e9 86 fa ff ff       	jmp    801067e0 <deallocuvm.part.0>
80106d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d60:	89 d0                	mov    %edx,%eax
80106d62:	5d                   	pop    %ebp
80106d63:	c3                   	ret    
80106d64:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106d6f:	90                   	nop

80106d70 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106d70:	f3 0f 1e fb          	endbr32 
80106d74:	55                   	push   %ebp
80106d75:	89 e5                	mov    %esp,%ebp
80106d77:	57                   	push   %edi
80106d78:	56                   	push   %esi
80106d79:	53                   	push   %ebx
80106d7a:	83 ec 0c             	sub    $0xc,%esp
80106d7d:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106d80:	85 f6                	test   %esi,%esi
80106d82:	74 55                	je     80106dd9 <freevm+0x69>
  if(newsz >= oldsz)
80106d84:	31 c9                	xor    %ecx,%ecx
80106d86:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106d8b:	89 f0                	mov    %esi,%eax
80106d8d:	89 f3                	mov    %esi,%ebx
80106d8f:	e8 4c fa ff ff       	call   801067e0 <deallocuvm.part.0>
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106d94:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106d9a:	eb 0b                	jmp    80106da7 <freevm+0x37>
80106d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106da0:	83 c3 04             	add    $0x4,%ebx
80106da3:	39 df                	cmp    %ebx,%edi
80106da5:	74 23                	je     80106dca <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106da7:	8b 03                	mov    (%ebx),%eax
80106da9:	a8 01                	test   $0x1,%al
80106dab:	74 f3                	je     80106da0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106dad:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80106db2:	83 ec 0c             	sub    $0xc,%esp
80106db5:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106db8:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106dbd:	50                   	push   %eax
80106dbe:	e8 bd b6 ff ff       	call   80102480 <kfree>
80106dc3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80106dc6:	39 df                	cmp    %ebx,%edi
80106dc8:	75 dd                	jne    80106da7 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
80106dca:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106dcd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106dd0:	5b                   	pop    %ebx
80106dd1:	5e                   	pop    %esi
80106dd2:	5f                   	pop    %edi
80106dd3:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80106dd4:	e9 a7 b6 ff ff       	jmp    80102480 <kfree>
    panic("freevm: no pgdir");
80106dd9:	83 ec 0c             	sub    $0xc,%esp
80106ddc:	68 ee 78 10 80       	push   $0x801078ee
80106de1:	e8 9a 95 ff ff       	call   80100380 <panic>
80106de6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ded:	8d 76 00             	lea    0x0(%esi),%esi

80106df0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106df0:	f3 0f 1e fb          	endbr32 
80106df4:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106df5:	31 c9                	xor    %ecx,%ecx
{
80106df7:	89 e5                	mov    %esp,%ebp
80106df9:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106dfc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106dff:	8b 45 08             	mov    0x8(%ebp),%eax
80106e02:	e8 c9 f8 ff ff       	call   801066d0 <walkpgdir>
  if(pte == 0)
80106e07:	85 c0                	test   %eax,%eax
80106e09:	74 05                	je     80106e10 <clearpteu+0x20>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106e0b:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106e0e:	c9                   	leave  
80106e0f:	c3                   	ret    
    panic("clearpteu");
80106e10:	83 ec 0c             	sub    $0xc,%esp
80106e13:	68 ff 78 10 80       	push   $0x801078ff
80106e18:	e8 63 95 ff ff       	call   80100380 <panic>
80106e1d:	8d 76 00             	lea    0x0(%esi),%esi

80106e20 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106e20:	f3 0f 1e fb          	endbr32 
80106e24:	55                   	push   %ebp
80106e25:	89 e5                	mov    %esp,%ebp
80106e27:	57                   	push   %edi
80106e28:	56                   	push   %esi
80106e29:	53                   	push   %ebx
80106e2a:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106e2d:	e8 2e fb ff ff       	call   80106960 <setupkvm>
80106e32:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106e35:	85 c0                	test   %eax,%eax
80106e37:	0f 84 9c 00 00 00    	je     80106ed9 <copyuvm+0xb9>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106e3d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106e40:	85 c9                	test   %ecx,%ecx
80106e42:	0f 84 91 00 00 00    	je     80106ed9 <copyuvm+0xb9>
80106e48:	31 f6                	xor    %esi,%esi
80106e4a:	eb 4a                	jmp    80106e96 <copyuvm+0x76>
80106e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106e50:	83 ec 04             	sub    $0x4,%esp
80106e53:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106e59:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106e5c:	68 00 10 00 00       	push   $0x1000
80106e61:	57                   	push   %edi
80106e62:	50                   	push   %eax
80106e63:	e8 a8 d7 ff ff       	call   80104610 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80106e68:	58                   	pop    %eax
80106e69:	5a                   	pop    %edx
80106e6a:	53                   	push   %ebx
80106e6b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106e6e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e71:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e76:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106e7c:	52                   	push   %edx
80106e7d:	89 f2                	mov    %esi,%edx
80106e7f:	e8 cc f8 ff ff       	call   80106750 <mappages>
80106e84:	83 c4 10             	add    $0x10,%esp
80106e87:	85 c0                	test   %eax,%eax
80106e89:	78 39                	js     80106ec4 <copyuvm+0xa4>
  for(i = 0; i < sz; i += PGSIZE){
80106e8b:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106e91:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106e94:	76 43                	jbe    80106ed9 <copyuvm+0xb9>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106e96:	8b 45 08             	mov    0x8(%ebp),%eax
80106e99:	31 c9                	xor    %ecx,%ecx
80106e9b:	89 f2                	mov    %esi,%edx
80106e9d:	e8 2e f8 ff ff       	call   801066d0 <walkpgdir>
80106ea2:	85 c0                	test   %eax,%eax
80106ea4:	74 3e                	je     80106ee4 <copyuvm+0xc4>
    if(!(*pte & PTE_P))
80106ea6:	8b 18                	mov    (%eax),%ebx
80106ea8:	f6 c3 01             	test   $0x1,%bl
80106eab:	74 44                	je     80106ef1 <copyuvm+0xd1>
    pa = PTE_ADDR(*pte);
80106ead:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
80106eaf:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
    pa = PTE_ADDR(*pte);
80106eb5:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    if((mem = kalloc()) == 0)
80106ebb:	e8 80 b7 ff ff       	call   80102640 <kalloc>
80106ec0:	85 c0                	test   %eax,%eax
80106ec2:	75 8c                	jne    80106e50 <copyuvm+0x30>
      goto bad;
  }
  return d;

bad:
  freevm(d);
80106ec4:	83 ec 0c             	sub    $0xc,%esp
80106ec7:	ff 75 e0             	pushl  -0x20(%ebp)
80106eca:	e8 a1 fe ff ff       	call   80106d70 <freevm>
  return 0;
80106ecf:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80106ed6:	83 c4 10             	add    $0x10,%esp
}
80106ed9:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106edc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106edf:	5b                   	pop    %ebx
80106ee0:	5e                   	pop    %esi
80106ee1:	5f                   	pop    %edi
80106ee2:	5d                   	pop    %ebp
80106ee3:	c3                   	ret    
      panic("copyuvm: pte should exist");
80106ee4:	83 ec 0c             	sub    $0xc,%esp
80106ee7:	68 09 79 10 80       	push   $0x80107909
80106eec:	e8 8f 94 ff ff       	call   80100380 <panic>
      panic("copyuvm: page not present");
80106ef1:	83 ec 0c             	sub    $0xc,%esp
80106ef4:	68 23 79 10 80       	push   $0x80107923
80106ef9:	e8 82 94 ff ff       	call   80100380 <panic>
80106efe:	66 90                	xchg   %ax,%ax

80106f00 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106f00:	f3 0f 1e fb          	endbr32 
80106f04:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f05:	31 c9                	xor    %ecx,%ecx
{
80106f07:	89 e5                	mov    %esp,%ebp
80106f09:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80106f0c:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f0f:	8b 45 08             	mov    0x8(%ebp),%eax
80106f12:	e8 b9 f7 ff ff       	call   801066d0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106f17:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80106f19:	c9                   	leave  
  if((*pte & PTE_U) == 0)
80106f1a:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80106f1c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
80106f21:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80106f24:	05 00 00 00 80       	add    $0x80000000,%eax
80106f29:	83 fa 05             	cmp    $0x5,%edx
80106f2c:	ba 00 00 00 00       	mov    $0x0,%edx
80106f31:	0f 45 c2             	cmovne %edx,%eax
}
80106f34:	c3                   	ret    
80106f35:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106f40 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106f40:	f3 0f 1e fb          	endbr32 
80106f44:	55                   	push   %ebp
80106f45:	89 e5                	mov    %esp,%ebp
80106f47:	57                   	push   %edi
80106f48:	56                   	push   %esi
80106f49:	53                   	push   %ebx
80106f4a:	83 ec 0c             	sub    $0xc,%esp
80106f4d:	8b 75 14             	mov    0x14(%ebp),%esi
80106f50:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106f53:	85 f6                	test   %esi,%esi
80106f55:	75 3c                	jne    80106f93 <copyout+0x53>
80106f57:	eb 67                	jmp    80106fc0 <copyout+0x80>
80106f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106f60:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f63:	89 fb                	mov    %edi,%ebx
80106f65:	29 d3                	sub    %edx,%ebx
80106f67:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if(n > len)
80106f6d:	39 f3                	cmp    %esi,%ebx
80106f6f:	0f 47 de             	cmova  %esi,%ebx
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106f72:	29 fa                	sub    %edi,%edx
80106f74:	83 ec 04             	sub    $0x4,%esp
80106f77:	01 c2                	add    %eax,%edx
80106f79:	53                   	push   %ebx
80106f7a:	ff 75 10             	pushl  0x10(%ebp)
80106f7d:	52                   	push   %edx
80106f7e:	e8 8d d6 ff ff       	call   80104610 <memmove>
    len -= n;
    buf += n;
80106f83:	01 5d 10             	add    %ebx,0x10(%ebp)
    va = va0 + PGSIZE;
80106f86:	8d 97 00 10 00 00    	lea    0x1000(%edi),%edx
  while(len > 0){
80106f8c:	83 c4 10             	add    $0x10,%esp
80106f8f:	29 de                	sub    %ebx,%esi
80106f91:	74 2d                	je     80106fc0 <copyout+0x80>
    va0 = (uint)PGROUNDDOWN(va);
80106f93:	89 d7                	mov    %edx,%edi
    pa0 = uva2ka(pgdir, (char*)va0);
80106f95:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
80106f98:	89 55 0c             	mov    %edx,0xc(%ebp)
80106f9b:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    pa0 = uva2ka(pgdir, (char*)va0);
80106fa1:	57                   	push   %edi
80106fa2:	ff 75 08             	pushl  0x8(%ebp)
80106fa5:	e8 56 ff ff ff       	call   80106f00 <uva2ka>
    if(pa0 == 0)
80106faa:	83 c4 10             	add    $0x10,%esp
80106fad:	85 c0                	test   %eax,%eax
80106faf:	75 af                	jne    80106f60 <copyout+0x20>
  }
  return 0;
}
80106fb1:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106fb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106fb9:	5b                   	pop    %ebx
80106fba:	5e                   	pop    %esi
80106fbb:	5f                   	pop    %edi
80106fbc:	5d                   	pop    %ebp
80106fbd:	c3                   	ret    
80106fbe:	66 90                	xchg   %ax,%ax
80106fc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106fc3:	31 c0                	xor    %eax,%eax
}
80106fc5:	5b                   	pop    %ebx
80106fc6:	5e                   	pop    %esi
80106fc7:	5f                   	pop    %edi
80106fc8:	5d                   	pop    %ebp
80106fc9:	c3                   	ret    
