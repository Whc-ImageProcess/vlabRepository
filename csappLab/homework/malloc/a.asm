
a.out：     文件格式 elf64-x86-64


Disassembly of section .interp:

0000000000000318 <.interp>:
 318:	2f                   	(bad)  
 319:	6c                   	insb   (%dx),%es:(%rdi)
 31a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
 321:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
 326:	78 2d                	js     355 <_init-0xcab>
 328:	78 38                	js     362 <_init-0xc9e>
 32a:	36 2d 36 34 2e 73    	ss sub $0x732e3436,%eax
 330:	6f                   	outsl  %ds:(%rsi),(%dx)
 331:	2e 32 00             	xor    %cs:(%rax),%al

Disassembly of section .note.gnu.property:

0000000000000338 <.note.gnu.property>:
 338:	04 00                	add    $0x0,%al
 33a:	00 00                	add    %al,(%rax)
 33c:	10 00                	adc    %al,(%rax)
 33e:	00 00                	add    %al,(%rax)
 340:	05 00 00 00 47       	add    $0x47000000,%eax
 345:	4e 55                	rex.WRX push %rbp
 347:	00 02                	add    %al,(%rdx)
 349:	00 00                	add    %al,(%rax)
 34b:	c0 04 00 00          	rolb   $0x0,(%rax,%rax,1)
 34f:	00 03                	add    %al,(%rbx)
 351:	00 00                	add    %al,(%rax)
 353:	00 00                	add    %al,(%rax)
 355:	00 00                	add    %al,(%rax)
	...

Disassembly of section .note.gnu.build-id:

0000000000000358 <.note.gnu.build-id>:
 358:	04 00                	add    $0x0,%al
 35a:	00 00                	add    %al,(%rax)
 35c:	14 00                	adc    $0x0,%al
 35e:	00 00                	add    %al,(%rax)
 360:	03 00                	add    (%rax),%eax
 362:	00 00                	add    %al,(%rax)
 364:	47                   	rex.RXB
 365:	4e 55                	rex.WRX push %rbp
 367:	00 0d 24 bf 3b 06    	add    %cl,0x63bbf24(%rip)        # 63bc291 <_end+0x63b8279>
 36d:	bc 59 a1 21 b5       	mov    $0xb521a159,%esp
 372:	da f8                	(bad)  
 374:	49 72 20             	rex.WB jb 397 <_init-0xc69>
 377:	31 6c 8f 5e          	xor    %ebp,0x5e(%rdi,%rcx,4)
 37b:	1a                   	.byte 0x1a

Disassembly of section .note.ABI-tag:

000000000000037c <.note.ABI-tag>:
 37c:	04 00                	add    $0x0,%al
 37e:	00 00                	add    %al,(%rax)
 380:	10 00                	adc    %al,(%rax)
 382:	00 00                	add    %al,(%rax)
 384:	01 00                	add    %eax,(%rax)
 386:	00 00                	add    %al,(%rax)
 388:	47                   	rex.RXB
 389:	4e 55                	rex.WRX push %rbp
 38b:	00 00                	add    %al,(%rax)
 38d:	00 00                	add    %al,(%rax)
 38f:	00 03                	add    %al,(%rbx)
 391:	00 00                	add    %al,(%rax)
 393:	00 02                	add    %al,(%rdx)
 395:	00 00                	add    %al,(%rax)
 397:	00 00                	add    %al,(%rax)
 399:	00 00                	add    %al,(%rax)
	...

Disassembly of section .gnu.hash:

00000000000003a0 <.gnu.hash>:
 3a0:	02 00                	add    (%rax),%al
 3a2:	00 00                	add    %al,(%rax)
 3a4:	08 00                	or     %al,(%rax)
 3a6:	00 00                	add    %al,(%rax)
 3a8:	01 00                	add    %eax,(%rax)
 3aa:	00 00                	add    %al,(%rax)
 3ac:	06                   	(bad)  
 3ad:	00 00                	add    %al,(%rax)
 3af:	00 00                	add    %al,(%rax)
 3b1:	00 81 00 00 00 00    	add    %al,0x0(%rcx)
 3b7:	00 08                	add    %cl,(%rax)
 3b9:	00 00                	add    %al,(%rax)
 3bb:	00 00                	add    %al,(%rax)
 3bd:	00 00                	add    %al,(%rax)
 3bf:	00 d1                	add    %dl,%cl
 3c1:	65 ce                	gs (bad) 
 3c3:	6d                   	insl   (%dx),%es:(%rdi)

Disassembly of section .dynsym:

00000000000003c8 <.dynsym>:
	...
 3e0:	61                   	(bad)  
 3e1:	00 00                	add    %al,(%rax)
 3e3:	00 20                	add    %ah,(%rax)
	...
 3f5:	00 00                	add    %al,(%rax)
 3f7:	00 0b                	add    %cl,(%rbx)
 3f9:	00 00                	add    %al,(%rax)
 3fb:	00 12                	add    %dl,(%rdx)
	...
 40d:	00 00                	add    %al,(%rax)
 40f:	00 1c 00             	add    %bl,(%rax,%rax,1)
 412:	00 00                	add    %al,(%rax)
 414:	12 00                	adc    (%rax),%al
	...
 426:	00 00                	add    %al,(%rax)
 428:	39 00                	cmp    %eax,(%rax)
 42a:	00 00                	add    %al,(%rax)
 42c:	12 00                	adc    (%rax),%al
	...
 43e:	00 00                	add    %al,(%rax)
 440:	7d 00                	jge    442 <_init-0xbbe>
 442:	00 00                	add    %al,(%rax)
 444:	20 00                	and    %al,(%rax)
	...
 456:	00 00                	add    %al,(%rax)
 458:	23 00                	and    (%rax),%eax
 45a:	00 00                	add    %al,(%rax)
 45c:	12 00                	adc    (%rax),%al
	...
 46e:	00 00                	add    %al,(%rax)
 470:	8c 00                	mov    %es,(%rax)
 472:	00 00                	add    %al,(%rax)
 474:	20 00                	and    %al,(%rax)
	...
 486:	00 00                	add    %al,(%rax)
 488:	2a 00                	sub    (%rax),%al
 48a:	00 00                	add    %al,(%rax)
 48c:	22 00                	and    (%rax),%al
	...

Disassembly of section .dynstr:

00000000000004a0 <.dynstr>:
 4a0:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
 4a4:	63 2e                	movslq (%rsi),%ebp
 4a6:	73 6f                	jae    517 <_init-0xae9>
 4a8:	2e 36 00 5f 5f       	cs add %bl,%ss:0x5f(%rdi)
 4ad:	73 74                	jae    523 <_init-0xadd>
 4af:	61                   	(bad)  
 4b0:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
 4b3:	63 68 6b             	movslq 0x6b(%rax),%ebp
 4b6:	5f                   	pop    %rdi
 4b7:	66 61                	data16 (bad) 
 4b9:	69 6c 00 70 72 69 6e 	imul   $0x746e6972,0x70(%rax,%rax,1),%ebp
 4c0:	74 
 4c1:	66 00 6d 61          	data16 add %ch,0x61(%rbp)
 4c5:	6c                   	insb   (%dx),%es:(%rdi)
 4c6:	6c                   	insb   (%dx),%es:(%rdi)
 4c7:	6f                   	outsl  %ds:(%rsi),(%dx)
 4c8:	63 00                	movslq (%rax),%eax
 4ca:	5f                   	pop    %rdi
 4cb:	5f                   	pop    %rdi
 4cc:	63 78 61             	movslq 0x61(%rax),%edi
 4cf:	5f                   	pop    %rdi
 4d0:	66 69 6e 61 6c 69    	imul   $0x696c,0x61(%rsi),%bp
 4d6:	7a 65                	jp     53d <_init-0xac3>
 4d8:	00 5f 5f             	add    %bl,0x5f(%rdi)
 4db:	6c                   	insb   (%dx),%es:(%rdi)
 4dc:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
 4e3:	72 74                	jb     559 <_init-0xaa7>
 4e5:	5f                   	pop    %rdi
 4e6:	6d                   	insl   (%dx),%es:(%rdi)
 4e7:	61                   	(bad)  
 4e8:	69 6e 00 47 4c 49 42 	imul   $0x42494c47,0x0(%rsi),%ebp
 4ef:	43 5f                	rex.XB pop %r15
 4f1:	32 2e                	xor    (%rsi),%ch
 4f3:	32 2e                	xor    (%rsi),%ch
 4f5:	35 00 47 4c 49       	xor    $0x494c4700,%eax
 4fa:	42                   	rex.X
 4fb:	43 5f                	rex.XB pop %r15
 4fd:	32 2e                	xor    (%rsi),%ch
 4ff:	34 00                	xor    $0x0,%al
 501:	5f                   	pop    %rdi
 502:	49 54                	rex.WB push %r12
 504:	4d 5f                	rex.WRB pop %r15
 506:	64 65 72 65          	fs gs jb 56f <_init-0xa91>
 50a:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
 511:	4d 
 512:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
 514:	6f                   	outsl  %ds:(%rsi),(%dx)
 515:	6e                   	outsb  %ds:(%rsi),(%dx)
 516:	65 54                	gs push %rsp
 518:	61                   	(bad)  
 519:	62                   	(bad)  
 51a:	6c                   	insb   (%dx),%es:(%rdi)
 51b:	65 00 5f 5f          	add    %bl,%gs:0x5f(%rdi)
 51f:	67 6d                	insl   (%dx),%es:(%edi)
 521:	6f                   	outsl  %ds:(%rsi),(%dx)
 522:	6e                   	outsb  %ds:(%rsi),(%dx)
 523:	5f                   	pop    %rdi
 524:	73 74                	jae    59a <_init-0xa66>
 526:	61                   	(bad)  
 527:	72 74                	jb     59d <_init-0xa63>
 529:	5f                   	pop    %rdi
 52a:	5f                   	pop    %rdi
 52b:	00 5f 49             	add    %bl,0x49(%rdi)
 52e:	54                   	push   %rsp
 52f:	4d 5f                	rex.WRB pop %r15
 531:	72 65                	jb     598 <_init-0xa68>
 533:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
 53a:	4d 
 53b:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
 53d:	6f                   	outsl  %ds:(%rsi),(%dx)
 53e:	6e                   	outsb  %ds:(%rsi),(%dx)
 53f:	65 54                	gs push %rsp
 541:	61                   	(bad)  
 542:	62                   	.byte 0x62
 543:	6c                   	insb   (%dx),%es:(%rdi)
 544:	65                   	gs
	...

Disassembly of section .gnu.version:

0000000000000546 <.gnu.version>:
 546:	00 00                	add    %al,(%rax)
 548:	00 00                	add    %al,(%rax)
 54a:	02 00                	add    (%rax),%al
 54c:	03 00                	add    (%rax),%eax
 54e:	03 00                	add    (%rax),%eax
 550:	00 00                	add    %al,(%rax)
 552:	03 00                	add    (%rax),%eax
 554:	00 00                	add    %al,(%rax)
 556:	03 00                	add    (%rax),%eax

Disassembly of section .gnu.version_r:

0000000000000558 <.gnu.version_r>:
 558:	01 00                	add    %eax,(%rax)
 55a:	02 00                	add    (%rax),%al
 55c:	01 00                	add    %eax,(%rax)
 55e:	00 00                	add    %al,(%rax)
 560:	10 00                	adc    %al,(%rax)
 562:	00 00                	add    %al,(%rax)
 564:	00 00                	add    %al,(%rax)
 566:	00 00                	add    %al,(%rax)
 568:	75 1a                	jne    584 <_init-0xa7c>
 56a:	69 09 00 00 03 00    	imul   $0x30000,(%rcx),%ecx
 570:	4b 00 00             	rex.WXB add %al,(%r8)
 573:	00 10                	add    %dl,(%rax)
 575:	00 00                	add    %al,(%rax)
 577:	00 14 69             	add    %dl,(%rcx,%rbp,2)
 57a:	69 0d 00 00 02 00 57 	imul   $0x57,0x20000(%rip),%ecx        # 20584 <_end+0x1c56c>
 581:	00 00 00 
 584:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

0000000000000588 <.rela.dyn>:
 588:	a8 3d                	test   $0x3d,%al
 58a:	00 00                	add    %al,(%rax)
 58c:	00 00                	add    %al,(%rax)
 58e:	00 00                	add    %al,(%rax)
 590:	08 00                	or     %al,(%rax)
 592:	00 00                	add    %al,(%rax)
 594:	00 00                	add    %al,(%rax)
 596:	00 00                	add    %al,(%rax)
 598:	80 11 00             	adcb   $0x0,(%rcx)
 59b:	00 00                	add    %al,(%rax)
 59d:	00 00                	add    %al,(%rax)
 59f:	00 b0 3d 00 00 00    	add    %dh,0x3d(%rax)
 5a5:	00 00                	add    %al,(%rax)
 5a7:	00 08                	add    %cl,(%rax)
 5a9:	00 00                	add    %al,(%rax)
 5ab:	00 00                	add    %al,(%rax)
 5ad:	00 00                	add    %al,(%rax)
 5af:	00 40 11             	add    %al,0x11(%rax)
 5b2:	00 00                	add    %al,(%rax)
 5b4:	00 00                	add    %al,(%rax)
 5b6:	00 00                	add    %al,(%rax)
 5b8:	08 40 00             	or     %al,0x0(%rax)
 5bb:	00 00                	add    %al,(%rax)
 5bd:	00 00                	add    %al,(%rax)
 5bf:	00 08                	add    %cl,(%rax)
 5c1:	00 00                	add    %al,(%rax)
 5c3:	00 00                	add    %al,(%rax)
 5c5:	00 00                	add    %al,(%rax)
 5c7:	00 08                	add    %cl,(%rax)
 5c9:	40 00 00             	add    %al,(%rax)
 5cc:	00 00                	add    %al,(%rax)
 5ce:	00 00                	add    %al,(%rax)
 5d0:	d8 3f                	fdivrs (%rdi)
 5d2:	00 00                	add    %al,(%rax)
 5d4:	00 00                	add    %al,(%rax)
 5d6:	00 00                	add    %al,(%rax)
 5d8:	06                   	(bad)  
 5d9:	00 00                	add    %al,(%rax)
 5db:	00 01                	add    %al,(%rcx)
	...
 5e5:	00 00                	add    %al,(%rax)
 5e7:	00 e0                	add    %ah,%al
 5e9:	3f                   	(bad)  
 5ea:	00 00                	add    %al,(%rax)
 5ec:	00 00                	add    %al,(%rax)
 5ee:	00 00                	add    %al,(%rax)
 5f0:	06                   	(bad)  
 5f1:	00 00                	add    %al,(%rax)
 5f3:	00 04 00             	add    %al,(%rax,%rax,1)
	...
 5fe:	00 00                	add    %al,(%rax)
 600:	e8 3f 00 00 00       	callq  644 <_init-0x9bc>
 605:	00 00                	add    %al,(%rax)
 607:	00 06                	add    %al,(%rsi)
 609:	00 00                	add    %al,(%rax)
 60b:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 611 <_init-0x9ef>
 611:	00 00                	add    %al,(%rax)
 613:	00 00                	add    %al,(%rax)
 615:	00 00                	add    %al,(%rax)
 617:	00 f0                	add    %dh,%al
 619:	3f                   	(bad)  
 61a:	00 00                	add    %al,(%rax)
 61c:	00 00                	add    %al,(%rax)
 61e:	00 00                	add    %al,(%rax)
 620:	06                   	(bad)  
 621:	00 00                	add    %al,(%rax)
 623:	00 07                	add    %al,(%rdi)
	...
 62d:	00 00                	add    %al,(%rax)
 62f:	00 f8                	add    %bh,%al
 631:	3f                   	(bad)  
 632:	00 00                	add    %al,(%rax)
 634:	00 00                	add    %al,(%rax)
 636:	00 00                	add    %al,(%rax)
 638:	06                   	(bad)  
 639:	00 00                	add    %al,(%rax)
 63b:	00 08                	add    %cl,(%rax)
	...

Disassembly of section .rela.plt:

0000000000000648 <.rela.plt>:
 648:	c0 3f 00             	sarb   $0x0,(%rdi)
 64b:	00 00                	add    %al,(%rax)
 64d:	00 00                	add    %al,(%rax)
 64f:	00 07                	add    %al,(%rdi)
 651:	00 00                	add    %al,(%rax)
 653:	00 02                	add    %al,(%rdx)
	...
 65d:	00 00                	add    %al,(%rax)
 65f:	00 c8                	add    %cl,%al
 661:	3f                   	(bad)  
 662:	00 00                	add    %al,(%rax)
 664:	00 00                	add    %al,(%rax)
 666:	00 00                	add    %al,(%rax)
 668:	07                   	(bad)  
 669:	00 00                	add    %al,(%rax)
 66b:	00 03                	add    %al,(%rbx)
	...
 675:	00 00                	add    %al,(%rax)
 677:	00 d0                	add    %dl,%al
 679:	3f                   	(bad)  
 67a:	00 00                	add    %al,(%rax)
 67c:	00 00                	add    %al,(%rax)
 67e:	00 00                	add    %al,(%rax)
 680:	07                   	(bad)  
 681:	00 00                	add    %al,(%rax)
 683:	00 06                	add    %al,(%rsi)
	...

Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 8a 2f 00 00    	pushq  0x2f8a(%rip)        # 3fb0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 8b 2f 00 00 	bnd jmpq *0x2f8b(%rip)        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <.plt>
    105f:	90                   	nop

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 8d 2f 00 00 	bnd jmpq *0x2f8d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001070 <__stack_chk_fail@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 45 2f 00 00 	bnd jmpq *0x2f45(%rip)        # 3fc0 <__stack_chk_fail@GLIBC_2.4>
    107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001080 <printf@plt>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	f2 ff 25 3d 2f 00 00 	bnd jmpq *0x2f3d(%rip)        # 3fc8 <printf@GLIBC_2.2.5>
    108b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001090 <malloc@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 35 2f 00 00 	bnd jmpq *0x2f35(%rip)        # 3fd0 <malloc@GLIBC_2.2.5>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010a0 <_start>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	31 ed                	xor    %ebp,%ebp
    10a6:	49 89 d1             	mov    %rdx,%r9
    10a9:	5e                   	pop    %rsi
    10aa:	48 89 e2             	mov    %rsp,%rdx
    10ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10b1:	50                   	push   %rax
    10b2:	54                   	push   %rsp
    10b3:	4c 8d 05 46 02 00 00 	lea    0x246(%rip),%r8        # 1300 <__libc_csu_fini>
    10ba:	48 8d 0d cf 01 00 00 	lea    0x1cf(%rip),%rcx        # 1290 <__libc_csu_init>
    10c1:	48 8d 3d ae 01 00 00 	lea    0x1ae(%rip),%rdi        # 1276 <main>
    10c8:	ff 15 12 2f 00 00    	callq  *0x2f12(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    10ce:	f4                   	hlt    
    10cf:	90                   	nop

00000000000010d0 <deregister_tm_clones>:
    10d0:	48 8d 3d 39 2f 00 00 	lea    0x2f39(%rip),%rdi        # 4010 <__TMC_END__>
    10d7:	48 8d 05 32 2f 00 00 	lea    0x2f32(%rip),%rax        # 4010 <__TMC_END__>
    10de:	48 39 f8             	cmp    %rdi,%rax
    10e1:	74 15                	je     10f8 <deregister_tm_clones+0x28>
    10e3:	48 8b 05 ee 2e 00 00 	mov    0x2eee(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable>
    10ea:	48 85 c0             	test   %rax,%rax
    10ed:	74 09                	je     10f8 <deregister_tm_clones+0x28>
    10ef:	ff e0                	jmpq   *%rax
    10f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10f8:	c3                   	retq   
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001100 <register_tm_clones>:
    1100:	48 8d 3d 09 2f 00 00 	lea    0x2f09(%rip),%rdi        # 4010 <__TMC_END__>
    1107:	48 8d 35 02 2f 00 00 	lea    0x2f02(%rip),%rsi        # 4010 <__TMC_END__>
    110e:	48 29 fe             	sub    %rdi,%rsi
    1111:	48 89 f0             	mov    %rsi,%rax
    1114:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1118:	48 c1 f8 03          	sar    $0x3,%rax
    111c:	48 01 c6             	add    %rax,%rsi
    111f:	48 d1 fe             	sar    %rsi
    1122:	74 14                	je     1138 <register_tm_clones+0x38>
    1124:	48 8b 05 c5 2e 00 00 	mov    0x2ec5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
    112b:	48 85 c0             	test   %rax,%rax
    112e:	74 08                	je     1138 <register_tm_clones+0x38>
    1130:	ff e0                	jmpq   *%rax
    1132:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1138:	c3                   	retq   
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <__do_global_dtors_aux>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	80 3d c5 2e 00 00 00 	cmpb   $0x0,0x2ec5(%rip)        # 4010 <__TMC_END__>
    114b:	75 2b                	jne    1178 <__do_global_dtors_aux+0x38>
    114d:	55                   	push   %rbp
    114e:	48 83 3d a2 2e 00 00 	cmpq   $0x0,0x2ea2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1155:	00 
    1156:	48 89 e5             	mov    %rsp,%rbp
    1159:	74 0c                	je     1167 <__do_global_dtors_aux+0x27>
    115b:	48 8b 3d a6 2e 00 00 	mov    0x2ea6(%rip),%rdi        # 4008 <__dso_handle>
    1162:	e8 f9 fe ff ff       	callq  1060 <__cxa_finalize@plt>
    1167:	e8 64 ff ff ff       	callq  10d0 <deregister_tm_clones>
    116c:	c6 05 9d 2e 00 00 01 	movb   $0x1,0x2e9d(%rip)        # 4010 <__TMC_END__>
    1173:	5d                   	pop    %rbp
    1174:	c3                   	retq   
    1175:	0f 1f 00             	nopl   (%rax)
    1178:	c3                   	retq   
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <frame_dummy>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	e9 77 ff ff ff       	jmpq   1100 <register_tm_clones>

0000000000001189 <func>:
    1189:	f3 0f 1e fa          	endbr64 
    118d:	55                   	push   %rbp
    118e:	48 89 e5             	mov    %rsp,%rbp
    1191:	48 83 ec 40          	sub    $0x40,%rsp
    1195:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    119c:	00 00 
    119e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    11a2:	31 c0                	xor    %eax,%eax
    11a4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    11ab:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%rbp)
    11b2:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%rbp)
    11b9:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%rbp)
    11c0:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%rbp)
    11c7:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%rbp)
    11ce:	8b 45 e8             	mov    -0x18(%rbp),%eax
    11d1:	89 c6                	mov    %eax,%esi
    11d3:	48 8d 3d 2a 0e 00 00 	lea    0xe2a(%rip),%rdi        # 2004 <_IO_stdin_used+0x4>
    11da:	b8 00 00 00 00       	mov    $0x0,%eax
    11df:	e8 9c fe ff ff       	callq  1080 <printf@plt>
    11e4:	8b 45 e8             	mov    -0x18(%rbp),%eax
    11e7:	89 c6                	mov    %eax,%esi
    11e9:	48 8d 3d 14 0e 00 00 	lea    0xe14(%rip),%rdi        # 2004 <_IO_stdin_used+0x4>
    11f0:	b8 00 00 00 00       	mov    $0x0,%eax
    11f5:	e8 86 fe ff ff       	callq  1080 <printf@plt>
    11fa:	bf 18 00 00 00       	mov    $0x18,%edi
    11ff:	e8 8c fe ff ff       	callq  1090 <malloc@plt>
    1204:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1208:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    120c:	48 83 e8 08          	sub    $0x8,%rax
    1210:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    1214:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1218:	48 83 e8 08          	sub    $0x8,%rax
    121c:	8b 00                	mov    (%rax),%eax
    121e:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    1221:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    1224:	83 e0 fe             	and    $0xfffffffe,%eax
    1227:	89 45 c8             	mov    %eax,-0x38(%rbp)
    122a:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    122d:	83 e0 01             	and    $0x1,%eax
    1230:	89 45 cc             	mov    %eax,-0x34(%rbp)
    1233:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1236:	89 c6                	mov    %eax,%esi
    1238:	48 8d 3d c9 0d 00 00 	lea    0xdc9(%rip),%rdi        # 2008 <_IO_stdin_used+0x8>
    123f:	b8 00 00 00 00       	mov    $0x0,%eax
    1244:	e8 37 fe ff ff       	callq  1080 <printf@plt>
    1249:	8b 45 cc             	mov    -0x34(%rbp),%eax
    124c:	89 c6                	mov    %eax,%esi
    124e:	48 8d 3d c4 0d 00 00 	lea    0xdc4(%rip),%rdi        # 2019 <_IO_stdin_used+0x19>
    1255:	b8 00 00 00 00       	mov    $0x0,%eax
    125a:	e8 21 fe ff ff       	callq  1080 <printf@plt>
    125f:	90                   	nop
    1260:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1264:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    126b:	00 00 
    126d:	74 05                	je     1274 <func+0xeb>
    126f:	e8 fc fd ff ff       	callq  1070 <__stack_chk_fail@plt>
    1274:	c9                   	leaveq 
    1275:	c3                   	retq   

0000000000001276 <main>:
    1276:	f3 0f 1e fa          	endbr64 
    127a:	55                   	push   %rbp
    127b:	48 89 e5             	mov    %rsp,%rbp
    127e:	b8 00 00 00 00       	mov    $0x0,%eax
    1283:	e8 01 ff ff ff       	callq  1189 <func>
    1288:	90                   	nop
    1289:	5d                   	pop    %rbp
    128a:	c3                   	retq   
    128b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001290 <__libc_csu_init>:
    1290:	f3 0f 1e fa          	endbr64 
    1294:	41 57                	push   %r15
    1296:	4c 8d 3d 0b 2b 00 00 	lea    0x2b0b(%rip),%r15        # 3da8 <__frame_dummy_init_array_entry>
    129d:	41 56                	push   %r14
    129f:	49 89 d6             	mov    %rdx,%r14
    12a2:	41 55                	push   %r13
    12a4:	49 89 f5             	mov    %rsi,%r13
    12a7:	41 54                	push   %r12
    12a9:	41 89 fc             	mov    %edi,%r12d
    12ac:	55                   	push   %rbp
    12ad:	48 8d 2d fc 2a 00 00 	lea    0x2afc(%rip),%rbp        # 3db0 <__do_global_dtors_aux_fini_array_entry>
    12b4:	53                   	push   %rbx
    12b5:	4c 29 fd             	sub    %r15,%rbp
    12b8:	48 83 ec 08          	sub    $0x8,%rsp
    12bc:	e8 3f fd ff ff       	callq  1000 <_init>
    12c1:	48 c1 fd 03          	sar    $0x3,%rbp
    12c5:	74 1f                	je     12e6 <__libc_csu_init+0x56>
    12c7:	31 db                	xor    %ebx,%ebx
    12c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    12d0:	4c 89 f2             	mov    %r14,%rdx
    12d3:	4c 89 ee             	mov    %r13,%rsi
    12d6:	44 89 e7             	mov    %r12d,%edi
    12d9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    12dd:	48 83 c3 01          	add    $0x1,%rbx
    12e1:	48 39 dd             	cmp    %rbx,%rbp
    12e4:	75 ea                	jne    12d0 <__libc_csu_init+0x40>
    12e6:	48 83 c4 08          	add    $0x8,%rsp
    12ea:	5b                   	pop    %rbx
    12eb:	5d                   	pop    %rbp
    12ec:	41 5c                	pop    %r12
    12ee:	41 5d                	pop    %r13
    12f0:	41 5e                	pop    %r14
    12f2:	41 5f                	pop    %r15
    12f4:	c3                   	retq   
    12f5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    12fc:	00 00 00 00 

0000000000001300 <__libc_csu_fini>:
    1300:	f3 0f 1e fa          	endbr64 
    1304:	c3                   	retq   

Disassembly of section .fini:

0000000000001308 <_fini>:
    1308:	f3 0f 1e fa          	endbr64 
    130c:	48 83 ec 08          	sub    $0x8,%rsp
    1310:	48 83 c4 08          	add    $0x8,%rsp
    1314:	c3                   	retq   

Disassembly of section .rodata:

0000000000002000 <_IO_stdin_used>:
    2000:	01 00                	add    %eax,(%rax)
    2002:	02 00                	add    (%rax),%al
    2004:	25 64 0a 00 62       	and    $0x62000a64,%eax
    2009:	6c                   	insb   (%dx),%es:(%rdi)
    200a:	6f                   	outsl  %ds:(%rsi),(%dx)
    200b:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
    200e:	73 69                	jae    2079 <__GNU_EH_FRAME_HDR+0x4d>
    2010:	7a 65                	jp     2077 <__GNU_EH_FRAME_HDR+0x4b>
    2012:	20 3d 20 25 64 0a    	and    %bh,0xa642520(%rip)        # a644538 <_end+0xa640520>
    2018:	00 61 6c             	add    %ah,0x6c(%rcx)
    201b:	6c                   	insb   (%dx),%es:(%rdi)
    201c:	6f                   	outsl  %ds:(%rsi),(%dx)
    201d:	63 61 74             	movslq 0x74(%rcx),%esp
    2020:	65 64 20 3d 20 25 64 	gs and %bh,%fs:0xa642520(%rip)        # a644548 <_end+0xa640530>
    2027:	0a 
	...

Disassembly of section .eh_frame_hdr:

000000000000202c <__GNU_EH_FRAME_HDR>:
    202c:	01 1b                	add    %ebx,(%rbx)
    202e:	03 3b                	add    (%rbx),%edi
    2030:	48 00 00             	rex.W add %al,(%rax)
    2033:	00 08                	add    %cl,(%rax)
    2035:	00 00                	add    %al,(%rax)
    2037:	00 f4                	add    %dh,%ah
    2039:	ef                   	out    %eax,(%dx)
    203a:	ff                   	(bad)  
    203b:	ff                   	(bad)  
    203c:	7c 00                	jl     203e <__GNU_EH_FRAME_HDR+0x12>
    203e:	00 00                	add    %al,(%rax)
    2040:	34 f0                	xor    $0xf0,%al
    2042:	ff                   	(bad)  
    2043:	ff a4 00 00 00 44 f0 	jmpq   *-0xfbc0000(%rax,%rax,1)
    204a:	ff                   	(bad)  
    204b:	ff                   	(bad)  
    204c:	bc 00 00 00 74       	mov    $0x74000000,%esp
    2051:	f0 ff                	lock (bad) 
    2053:	ff 64 00 00          	jmpq   *0x0(%rax,%rax,1)
    2057:	00 5d f1             	add    %bl,-0xf(%rbp)
    205a:	ff                   	(bad)  
    205b:	ff d4                	callq  *%rsp
    205d:	00 00                	add    %al,(%rax)
    205f:	00 4a f2             	add    %cl,-0xe(%rdx)
    2062:	ff                   	(bad)  
    2063:	ff f4                	push   %rsp
    2065:	00 00                	add    %al,(%rax)
    2067:	00 64 f2 ff          	add    %ah,-0x1(%rdx,%rsi,8)
    206b:	ff 14 01             	callq  *(%rcx,%rax,1)
    206e:	00 00                	add    %al,(%rax)
    2070:	d4                   	(bad)  
    2071:	f2 ff                	repnz (bad) 
    2073:	ff 5c 01 00          	lcall  *0x0(%rcx,%rax,1)
	...

Disassembly of section .eh_frame:

0000000000002078 <__FRAME_END__-0x124>:
    2078:	14 00                	adc    $0x0,%al
    207a:	00 00                	add    %al,(%rax)
    207c:	00 00                	add    %al,(%rax)
    207e:	00 00                	add    %al,(%rax)
    2080:	01 7a 52             	add    %edi,0x52(%rdx)
    2083:	00 01                	add    %al,(%rcx)
    2085:	78 10                	js     2097 <__GNU_EH_FRAME_HDR+0x6b>
    2087:	01 1b                	add    %ebx,(%rbx)
    2089:	0c 07                	or     $0x7,%al
    208b:	08 90 01 00 00 14    	or     %dl,0x14000001(%rax)
    2091:	00 00                	add    %al,(%rax)
    2093:	00 1c 00             	add    %bl,(%rax,%rax,1)
    2096:	00 00                	add    %al,(%rax)
    2098:	08 f0                	or     %dh,%al
    209a:	ff                   	(bad)  
    209b:	ff 2f                	ljmp   *(%rdi)
    209d:	00 00                	add    %al,(%rax)
    209f:	00 00                	add    %al,(%rax)
    20a1:	44 07                	rex.R (bad) 
    20a3:	10 00                	adc    %al,(%rax)
    20a5:	00 00                	add    %al,(%rax)
    20a7:	00 24 00             	add    %ah,(%rax,%rax,1)
    20aa:	00 00                	add    %al,(%rax)
    20ac:	34 00                	xor    $0x0,%al
    20ae:	00 00                	add    %al,(%rax)
    20b0:	70 ef                	jo     20a1 <__GNU_EH_FRAME_HDR+0x75>
    20b2:	ff                   	(bad)  
    20b3:	ff 40 00             	incl   0x0(%rax)
    20b6:	00 00                	add    %al,(%rax)
    20b8:	00 0e                	add    %cl,(%rsi)
    20ba:	10 46 0e             	adc    %al,0xe(%rsi)
    20bd:	18 4a 0f             	sbb    %cl,0xf(%rdx)
    20c0:	0b 77 08             	or     0x8(%rdi),%esi
    20c3:	80 00 3f             	addb   $0x3f,(%rax)
    20c6:	1a 3a                	sbb    (%rdx),%bh
    20c8:	2a 33                	sub    (%rbx),%dh
    20ca:	24 22                	and    $0x22,%al
    20cc:	00 00                	add    %al,(%rax)
    20ce:	00 00                	add    %al,(%rax)
    20d0:	14 00                	adc    $0x0,%al
    20d2:	00 00                	add    %al,(%rax)
    20d4:	5c                   	pop    %rsp
    20d5:	00 00                	add    %al,(%rax)
    20d7:	00 88 ef ff ff 10    	add    %cl,0x10ffffef(%rax)
	...
    20e5:	00 00                	add    %al,(%rax)
    20e7:	00 14 00             	add    %dl,(%rax,%rax,1)
    20ea:	00 00                	add    %al,(%rax)
    20ec:	74 00                	je     20ee <__GNU_EH_FRAME_HDR+0xc2>
    20ee:	00 00                	add    %al,(%rax)
    20f0:	80 ef ff             	sub    $0xff,%bh
    20f3:	ff 30                	pushq  (%rax)
	...
    20fd:	00 00                	add    %al,(%rax)
    20ff:	00 1c 00             	add    %bl,(%rax,%rax,1)
    2102:	00 00                	add    %al,(%rax)
    2104:	8c 00                	mov    %es,(%rax)
    2106:	00 00                	add    %al,(%rax)
    2108:	81 f0 ff ff ed 00    	xor    $0xedffff,%eax
    210e:	00 00                	add    %al,(%rax)
    2110:	00 45 0e             	add    %al,0xe(%rbp)
    2113:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    2119:	02 e4                	add    %ah,%ah
    211b:	0c 07                	or     $0x7,%al
    211d:	08 00                	or     %al,(%rax)
    211f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    2122:	00 00                	add    %al,(%rax)
    2124:	ac                   	lods   %ds:(%rsi),%al
    2125:	00 00                	add    %al,(%rax)
    2127:	00 4e f1             	add    %cl,-0xf(%rsi)
    212a:	ff                   	(bad)  
    212b:	ff 15 00 00 00 00    	callq  *0x0(%rip)        # 2131 <__GNU_EH_FRAME_HDR+0x105>
    2131:	45 0e                	rex.RB (bad) 
    2133:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    2139:	4c 0c 07             	rex.WR or $0x7,%al
    213c:	08 00                	or     %al,(%rax)
    213e:	00 00                	add    %al,(%rax)
    2140:	44 00 00             	add    %r8b,(%rax)
    2143:	00 cc                	add    %cl,%ah
    2145:	00 00                	add    %al,(%rax)
    2147:	00 48 f1             	add    %cl,-0xf(%rax)
    214a:	ff                   	(bad)  
    214b:	ff 65 00             	jmpq   *0x0(%rbp)
    214e:	00 00                	add    %al,(%rax)
    2150:	00 46 0e             	add    %al,0xe(%rsi)
    2153:	10 8f 02 49 0e 18    	adc    %cl,0x180e4902(%rdi)
    2159:	8e 03                	mov    (%rbx),%es
    215b:	45 0e                	rex.RB (bad) 
    215d:	20 8d 04 45 0e 28    	and    %cl,0x280e4504(%rbp)
    2163:	8c 05 44 0e 30 86    	mov    %es,-0x79cff1bc(%rip)        # ffffffff86302fad <_end+0xffffffff862fef95>
    2169:	06                   	(bad)  
    216a:	48 0e                	rex.W (bad) 
    216c:	38 83 07 47 0e 40    	cmp    %al,0x400e4707(%rbx)
    2172:	6e                   	outsb  %ds:(%rsi),(%dx)
    2173:	0e                   	(bad)  
    2174:	38 41 0e             	cmp    %al,0xe(%rcx)
    2177:	30 41 0e             	xor    %al,0xe(%rcx)
    217a:	28 42 0e             	sub    %al,0xe(%rdx)
    217d:	20 42 0e             	and    %al,0xe(%rdx)
    2180:	18 42 0e             	sbb    %al,0xe(%rdx)
    2183:	10 42 0e             	adc    %al,0xe(%rdx)
    2186:	08 00                	or     %al,(%rax)
    2188:	10 00                	adc    %al,(%rax)
    218a:	00 00                	add    %al,(%rax)
    218c:	14 01                	adc    $0x1,%al
    218e:	00 00                	add    %al,(%rax)
    2190:	70 f1                	jo     2183 <__GNU_EH_FRAME_HDR+0x157>
    2192:	ff                   	(bad)  
    2193:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 2199 <__GNU_EH_FRAME_HDR+0x16d>
    2199:	00 00                	add    %al,(%rax)
	...

000000000000219c <__FRAME_END__>:
    219c:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000003da8 <__frame_dummy_init_array_entry>:
    3da8:	80 11 00             	adcb   $0x0,(%rcx)
    3dab:	00 00                	add    %al,(%rax)
    3dad:	00 00                	add    %al,(%rax)
	...

Disassembly of section .fini_array:

0000000000003db0 <__do_global_dtors_aux_fini_array_entry>:
    3db0:	40 11 00             	rex adc %eax,(%rax)
    3db3:	00 00                	add    %al,(%rax)
    3db5:	00 00                	add    %al,(%rax)
	...

Disassembly of section .dynamic:

0000000000003db8 <_DYNAMIC>:
    3db8:	01 00                	add    %eax,(%rax)
    3dba:	00 00                	add    %al,(%rax)
    3dbc:	00 00                	add    %al,(%rax)
    3dbe:	00 00                	add    %al,(%rax)
    3dc0:	01 00                	add    %eax,(%rax)
    3dc2:	00 00                	add    %al,(%rax)
    3dc4:	00 00                	add    %al,(%rax)
    3dc6:	00 00                	add    %al,(%rax)
    3dc8:	0c 00                	or     $0x0,%al
    3dca:	00 00                	add    %al,(%rax)
    3dcc:	00 00                	add    %al,(%rax)
    3dce:	00 00                	add    %al,(%rax)
    3dd0:	00 10                	add    %dl,(%rax)
    3dd2:	00 00                	add    %al,(%rax)
    3dd4:	00 00                	add    %al,(%rax)
    3dd6:	00 00                	add    %al,(%rax)
    3dd8:	0d 00 00 00 00       	or     $0x0,%eax
    3ddd:	00 00                	add    %al,(%rax)
    3ddf:	00 08                	add    %cl,(%rax)
    3de1:	13 00                	adc    (%rax),%eax
    3de3:	00 00                	add    %al,(%rax)
    3de5:	00 00                	add    %al,(%rax)
    3de7:	00 19                	add    %bl,(%rcx)
    3de9:	00 00                	add    %al,(%rax)
    3deb:	00 00                	add    %al,(%rax)
    3ded:	00 00                	add    %al,(%rax)
    3def:	00 a8 3d 00 00 00    	add    %ch,0x3d(%rax)
    3df5:	00 00                	add    %al,(%rax)
    3df7:	00 1b                	add    %bl,(%rbx)
    3df9:	00 00                	add    %al,(%rax)
    3dfb:	00 00                	add    %al,(%rax)
    3dfd:	00 00                	add    %al,(%rax)
    3dff:	00 08                	add    %cl,(%rax)
    3e01:	00 00                	add    %al,(%rax)
    3e03:	00 00                	add    %al,(%rax)
    3e05:	00 00                	add    %al,(%rax)
    3e07:	00 1a                	add    %bl,(%rdx)
    3e09:	00 00                	add    %al,(%rax)
    3e0b:	00 00                	add    %al,(%rax)
    3e0d:	00 00                	add    %al,(%rax)
    3e0f:	00 b0 3d 00 00 00    	add    %dh,0x3d(%rax)
    3e15:	00 00                	add    %al,(%rax)
    3e17:	00 1c 00             	add    %bl,(%rax,%rax,1)
    3e1a:	00 00                	add    %al,(%rax)
    3e1c:	00 00                	add    %al,(%rax)
    3e1e:	00 00                	add    %al,(%rax)
    3e20:	08 00                	or     %al,(%rax)
    3e22:	00 00                	add    %al,(%rax)
    3e24:	00 00                	add    %al,(%rax)
    3e26:	00 00                	add    %al,(%rax)
    3e28:	f5                   	cmc    
    3e29:	fe                   	(bad)  
    3e2a:	ff 6f 00             	ljmp   *0x0(%rdi)
    3e2d:	00 00                	add    %al,(%rax)
    3e2f:	00 a0 03 00 00 00    	add    %ah,0x3(%rax)
    3e35:	00 00                	add    %al,(%rax)
    3e37:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 3e3d <_DYNAMIC+0x85>
    3e3d:	00 00                	add    %al,(%rax)
    3e3f:	00 a0 04 00 00 00    	add    %ah,0x4(%rax)
    3e45:	00 00                	add    %al,(%rax)
    3e47:	00 06                	add    %al,(%rsi)
    3e49:	00 00                	add    %al,(%rax)
    3e4b:	00 00                	add    %al,(%rax)
    3e4d:	00 00                	add    %al,(%rax)
    3e4f:	00 c8                	add    %cl,%al
    3e51:	03 00                	add    (%rax),%eax
    3e53:	00 00                	add    %al,(%rax)
    3e55:	00 00                	add    %al,(%rax)
    3e57:	00 0a                	add    %cl,(%rdx)
    3e59:	00 00                	add    %al,(%rax)
    3e5b:	00 00                	add    %al,(%rax)
    3e5d:	00 00                	add    %al,(%rax)
    3e5f:	00 a6 00 00 00 00    	add    %ah,0x0(%rsi)
    3e65:	00 00                	add    %al,(%rax)
    3e67:	00 0b                	add    %cl,(%rbx)
    3e69:	00 00                	add    %al,(%rax)
    3e6b:	00 00                	add    %al,(%rax)
    3e6d:	00 00                	add    %al,(%rax)
    3e6f:	00 18                	add    %bl,(%rax)
    3e71:	00 00                	add    %al,(%rax)
    3e73:	00 00                	add    %al,(%rax)
    3e75:	00 00                	add    %al,(%rax)
    3e77:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 3e7d <_DYNAMIC+0xc5>
	...
    3e85:	00 00                	add    %al,(%rax)
    3e87:	00 03                	add    %al,(%rbx)
    3e89:	00 00                	add    %al,(%rax)
    3e8b:	00 00                	add    %al,(%rax)
    3e8d:	00 00                	add    %al,(%rax)
    3e8f:	00 a8 3f 00 00 00    	add    %ch,0x3f(%rax)
    3e95:	00 00                	add    %al,(%rax)
    3e97:	00 02                	add    %al,(%rdx)
    3e99:	00 00                	add    %al,(%rax)
    3e9b:	00 00                	add    %al,(%rax)
    3e9d:	00 00                	add    %al,(%rax)
    3e9f:	00 48 00             	add    %cl,0x0(%rax)
    3ea2:	00 00                	add    %al,(%rax)
    3ea4:	00 00                	add    %al,(%rax)
    3ea6:	00 00                	add    %al,(%rax)
    3ea8:	14 00                	adc    $0x0,%al
    3eaa:	00 00                	add    %al,(%rax)
    3eac:	00 00                	add    %al,(%rax)
    3eae:	00 00                	add    %al,(%rax)
    3eb0:	07                   	(bad)  
    3eb1:	00 00                	add    %al,(%rax)
    3eb3:	00 00                	add    %al,(%rax)
    3eb5:	00 00                	add    %al,(%rax)
    3eb7:	00 17                	add    %dl,(%rdi)
    3eb9:	00 00                	add    %al,(%rax)
    3ebb:	00 00                	add    %al,(%rax)
    3ebd:	00 00                	add    %al,(%rax)
    3ebf:	00 48 06             	add    %cl,0x6(%rax)
    3ec2:	00 00                	add    %al,(%rax)
    3ec4:	00 00                	add    %al,(%rax)
    3ec6:	00 00                	add    %al,(%rax)
    3ec8:	07                   	(bad)  
    3ec9:	00 00                	add    %al,(%rax)
    3ecb:	00 00                	add    %al,(%rax)
    3ecd:	00 00                	add    %al,(%rax)
    3ecf:	00 88 05 00 00 00    	add    %cl,0x5(%rax)
    3ed5:	00 00                	add    %al,(%rax)
    3ed7:	00 08                	add    %cl,(%rax)
    3ed9:	00 00                	add    %al,(%rax)
    3edb:	00 00                	add    %al,(%rax)
    3edd:	00 00                	add    %al,(%rax)
    3edf:	00 c0                	add    %al,%al
    3ee1:	00 00                	add    %al,(%rax)
    3ee3:	00 00                	add    %al,(%rax)
    3ee5:	00 00                	add    %al,(%rax)
    3ee7:	00 09                	add    %cl,(%rcx)
    3ee9:	00 00                	add    %al,(%rax)
    3eeb:	00 00                	add    %al,(%rax)
    3eed:	00 00                	add    %al,(%rax)
    3eef:	00 18                	add    %bl,(%rax)
    3ef1:	00 00                	add    %al,(%rax)
    3ef3:	00 00                	add    %al,(%rax)
    3ef5:	00 00                	add    %al,(%rax)
    3ef7:	00 1e                	add    %bl,(%rsi)
    3ef9:	00 00                	add    %al,(%rax)
    3efb:	00 00                	add    %al,(%rax)
    3efd:	00 00                	add    %al,(%rax)
    3eff:	00 08                	add    %cl,(%rax)
    3f01:	00 00                	add    %al,(%rax)
    3f03:	00 00                	add    %al,(%rax)
    3f05:	00 00                	add    %al,(%rax)
    3f07:	00 fb                	add    %bh,%bl
    3f09:	ff                   	(bad)  
    3f0a:	ff 6f 00             	ljmp   *0x0(%rdi)
    3f0d:	00 00                	add    %al,(%rax)
    3f0f:	00 01                	add    %al,(%rcx)
    3f11:	00 00                	add    %al,(%rax)
    3f13:	08 00                	or     %al,(%rax)
    3f15:	00 00                	add    %al,(%rax)
    3f17:	00 fe                	add    %bh,%dh
    3f19:	ff                   	(bad)  
    3f1a:	ff 6f 00             	ljmp   *0x0(%rdi)
    3f1d:	00 00                	add    %al,(%rax)
    3f1f:	00 58 05             	add    %bl,0x5(%rax)
    3f22:	00 00                	add    %al,(%rax)
    3f24:	00 00                	add    %al,(%rax)
    3f26:	00 00                	add    %al,(%rax)
    3f28:	ff                   	(bad)  
    3f29:	ff                   	(bad)  
    3f2a:	ff 6f 00             	ljmp   *0x0(%rdi)
    3f2d:	00 00                	add    %al,(%rax)
    3f2f:	00 01                	add    %al,(%rcx)
    3f31:	00 00                	add    %al,(%rax)
    3f33:	00 00                	add    %al,(%rax)
    3f35:	00 00                	add    %al,(%rax)
    3f37:	00 f0                	add    %dh,%al
    3f39:	ff                   	(bad)  
    3f3a:	ff 6f 00             	ljmp   *0x0(%rdi)
    3f3d:	00 00                	add    %al,(%rax)
    3f3f:	00 46 05             	add    %al,0x5(%rsi)
    3f42:	00 00                	add    %al,(%rax)
    3f44:	00 00                	add    %al,(%rax)
    3f46:	00 00                	add    %al,(%rax)
    3f48:	f9                   	stc    
    3f49:	ff                   	(bad)  
    3f4a:	ff 6f 00             	ljmp   *0x0(%rdi)
    3f4d:	00 00                	add    %al,(%rax)
    3f4f:	00 03                	add    %al,(%rbx)
	...

Disassembly of section .got:

0000000000003fa8 <_GLOBAL_OFFSET_TABLE_>:
    3fa8:	b8 3d 00 00 00       	mov    $0x3d,%eax
	...
    3fbd:	00 00                	add    %al,(%rax)
    3fbf:	00 30                	add    %dh,(%rax)
    3fc1:	10 00                	adc    %al,(%rax)
    3fc3:	00 00                	add    %al,(%rax)
    3fc5:	00 00                	add    %al,(%rax)
    3fc7:	00 40 10             	add    %al,0x10(%rax)
    3fca:	00 00                	add    %al,(%rax)
    3fcc:	00 00                	add    %al,(%rax)
    3fce:	00 00                	add    %al,(%rax)
    3fd0:	50                   	push   %rax
    3fd1:	10 00                	adc    %al,(%rax)
	...

Disassembly of section .data:

0000000000004000 <__data_start>:
	...

0000000000004008 <__dso_handle>:
    4008:	08 40 00             	or     %al,0x0(%rax)
    400b:	00 00                	add    %al,(%rax)
    400d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .bss:

0000000000004010 <completed.8061>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 55 62             	sub    %dl,0x62(%rbp)
   8:	75 6e                	jne    78 <_init-0xf88>
   a:	74 75                	je     81 <_init-0xf7f>
   c:	20 39                	and    %bh,(%rcx)
   e:	2e 34 2e             	cs xor $0x2e,%al
  11:	30 2d 31 75 62 75    	xor    %ch,0x75627531(%rip)        # 75627548 <_end+0x75623530>
  17:	6e                   	outsb  %ds:(%rsi),(%dx)
  18:	74 75                	je     8f <_init-0xf71>
  1a:	31 7e 32             	xor    %edi,0x32(%rsi)
  1d:	30 2e                	xor    %ch,(%rsi)
  1f:	30 34 2e             	xor    %dh,(%rsi,%rbp,1)
  22:	31 29                	xor    %ebp,(%rcx)
  24:	20 39                	and    %bh,(%rcx)
  26:	2e 34 2e             	cs xor $0x2e,%al
  29:	30 00                	xor    %al,(%rax)
