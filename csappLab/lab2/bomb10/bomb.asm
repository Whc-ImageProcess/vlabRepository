
bomb：     文件格式 elf32-i386


Disassembly of section .interp:

08048114 <.interp>:
 8048114:	2f                   	das    
 8048115:	6c                   	insb   (%dx),%es:(%edi)
 8048116:	69 62 2f 6c 64 2d 6c 	imul   $0x6c2d646c,0x2f(%edx),%esp
 804811d:	69 6e 75 78 2e 73 6f 	imul   $0x6f732e78,0x75(%esi),%ebp
 8048124:	2e 32 00             	xor    %cs:(%eax),%al

Disassembly of section .note.ABI-tag:

08048128 <.note.ABI-tag>:
 8048128:	04 00                	add    $0x0,%al
 804812a:	00 00                	add    %al,(%eax)
 804812c:	10 00                	adc    %al,(%eax)
 804812e:	00 00                	add    %al,(%eax)
 8048130:	01 00                	add    %eax,(%eax)
 8048132:	00 00                	add    %al,(%eax)
 8048134:	47                   	inc    %edi
 8048135:	4e                   	dec    %esi
 8048136:	55                   	push   %ebp
 8048137:	00 00                	add    %al,(%eax)
 8048139:	00 00                	add    %al,(%eax)
 804813b:	00 02                	add    %al,(%edx)
 804813d:	00 00                	add    %al,(%eax)
 804813f:	00 04 00             	add    %al,(%eax,%eax,1)
 8048142:	00 00                	add    %al,(%eax)
 8048144:	01 00                	add    %eax,(%eax)
	...

Disassembly of section .hash:

08048148 <.hash>:
 8048148:	11 00                	adc    %eax,(%eax)
 804814a:	00 00                	add    %al,(%eax)
 804814c:	23 00                	and    (%eax),%eax
 804814e:	00 00                	add    %al,(%eax)
 8048150:	0d 00 00 00 00       	or     $0x0,%eax
 8048155:	00 00                	add    %al,(%eax)
 8048157:	00 1e                	add    %bl,(%esi)
 8048159:	00 00                	add    %al,(%eax)
 804815b:	00 11                	add    %dl,(%ecx)
 804815d:	00 00                	add    %al,(%eax)
 804815f:	00 0a                	add    %cl,(%edx)
 8048161:	00 00                	add    %al,(%eax)
 8048163:	00 0e                	add    %cl,(%esi)
 8048165:	00 00                	add    %al,(%eax)
 8048167:	00 1f                	add    %bl,(%edi)
 8048169:	00 00                	add    %al,(%eax)
 804816b:	00 15 00 00 00 17    	add    %dl,0x17000000
 8048171:	00 00                	add    %al,(%eax)
 8048173:	00 00                	add    %al,(%eax)
 8048175:	00 00                	add    %al,(%eax)
 8048177:	00 1d 00 00 00 0b    	add    %bl,0xb000000
 804817d:	00 00                	add    %al,(%eax)
 804817f:	00 22                	add    %ah,(%edx)
 8048181:	00 00                	add    %al,(%eax)
 8048183:	00 1b                	add    %bl,(%ebx)
 8048185:	00 00                	add    %al,(%eax)
 8048187:	00 0c 00             	add    %cl,(%eax,%eax,1)
 804818a:	00 00                	add    %al,(%eax)
 804818c:	21 00                	and    %eax,(%eax)
	...
 80481a6:	00 00                	add    %al,(%eax)
 80481a8:	04 00                	add    $0x0,%al
 80481aa:	00 00                	add    %al,(%eax)
 80481ac:	00 00                	add    %al,(%eax)
 80481ae:	00 00                	add    %al,(%eax)
 80481b0:	03 00                	add    (%eax),%eax
 80481b2:	00 00                	add    %al,(%eax)
 80481b4:	02 00                	add    (%eax),%al
 80481b6:	00 00                	add    %al,(%eax)
 80481b8:	06                   	push   %es
	...
 80481c1:	00 00                	add    %al,(%eax)
 80481c3:	00 08                	add    %cl,(%eax)
 80481c5:	00 00                	add    %al,(%eax)
 80481c7:	00 07                	add    %al,(%edi)
	...
 80481d5:	00 00                	add    %al,(%eax)
 80481d7:	00 01                	add    %al,(%ecx)
	...
 80481e1:	00 00                	add    %al,(%eax)
 80481e3:	00 13                	add    %dl,(%ebx)
 80481e5:	00 00                	add    %al,(%eax)
 80481e7:	00 0f                	add    %cl,(%edi)
 80481e9:	00 00                	add    %al,(%eax)
 80481eb:	00 00                	add    %al,(%eax)
 80481ed:	00 00                	add    %al,(%eax)
 80481ef:	00 05 00 00 00 16    	add    %al,0x16000000
 80481f5:	00 00                	add    %al,(%eax)
 80481f7:	00 10                	add    %dl,(%eax)
 80481f9:	00 00                	add    %al,(%eax)
 80481fb:	00 19                	add    %bl,(%ecx)
 80481fd:	00 00                	add    %al,(%eax)
 80481ff:	00 14 00             	add    %dl,(%eax,%eax,1)
 8048202:	00 00                	add    %al,(%eax)
 8048204:	1a 00                	sbb    (%eax),%al
 8048206:	00 00                	add    %al,(%eax)
 8048208:	1c 00                	sbb    $0x0,%al
 804820a:	00 00                	add    %al,(%eax)
 804820c:	18 00                	sbb    %al,(%eax)
 804820e:	00 00                	add    %al,(%eax)
 8048210:	12 00                	adc    (%eax),%al
 8048212:	00 00                	add    %al,(%eax)
 8048214:	09 00                	or     %eax,(%eax)
 8048216:	00 00                	add    %al,(%eax)
 8048218:	20 00                	and    %al,(%eax)
 804821a:	00 00                	add    %al,(%eax)
 804821c:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dynsym:

08048220 <.dynsym>:
	...
 8048230:	aa                   	stos   %al,%es:(%edi)
 8048231:	00 00                	add    %al,(%eax)
 8048233:	00 00                	add    %al,(%eax)
 8048235:	00 00                	add    %al,(%eax)
 8048237:	00 71 00             	add    %dh,0x0(%ecx)
 804823a:	00 00                	add    %al,(%eax)
 804823c:	12 00                	adc    (%eax),%al
 804823e:	00 00                	add    %al,(%eax)
 8048240:	6d                   	insl   (%dx),%es:(%edi)
 8048241:	00 00                	add    %al,(%eax)
 8048243:	00 00                	add    %al,(%eax)
 8048245:	00 00                	add    %al,(%eax)
 8048247:	00 24 00             	add    %ah,(%eax,%eax,1)
 804824a:	00 00                	add    %al,(%eax)
 804824c:	12 00                	adc    (%eax),%al
 804824e:	00 00                	add    %al,(%eax)
 8048250:	3d 00 00 00 00       	cmp    $0x0,%eax
 8048255:	00 00                	add    %al,(%eax)
 8048257:	00 9d 00 00 00 12    	add    %bl,0x12000000(%ebp)
 804825d:	00 00                	add    %al,(%eax)
 804825f:	00 30                	add    %dh,(%eax)
 8048261:	00 00                	add    %al,(%eax)
 8048263:	00 00                	add    %al,(%eax)
 8048265:	00 00                	add    %al,(%eax)
 8048267:	00 ef                	add    %ch,%bh
 8048269:	00 00                	add    %al,(%eax)
 804826b:	00 12                	add    %dl,(%edx)
 804826d:	00 00                	add    %al,(%eax)
 804826f:	00 7b 00             	add    %bh,0x0(%ebx)
 8048272:	00 00                	add    %al,(%eax)
 8048274:	00 00                	add    %al,(%eax)
 8048276:	00 00                	add    %al,(%eax)
 8048278:	da 00                	fiaddl (%eax)
 804827a:	00 00                	add    %al,(%eax)
 804827c:	12 00                	adc    (%eax),%al
 804827e:	00 00                	add    %al,(%eax)
 8048280:	5e                   	pop    %esi
 8048281:	00 00                	add    %al,(%eax)
 8048283:	00 00                	add    %al,(%eax)
 8048285:	00 00                	add    %al,(%eax)
 8048287:	00 eb                	add    %ch,%bl
 8048289:	00 00                	add    %al,(%eax)
 804828b:	00 12                	add    %dl,(%edx)
 804828d:	00 00                	add    %al,(%eax)
 804828f:	00 82 00 00 00 00    	add    %al,0x0(%edx)
 8048295:	00 00                	add    %al,(%eax)
 8048297:	00 9d 00 00 00 12    	add    %bl,0x12000000(%ebp)
 804829d:	00 00                	add    %al,(%eax)
 804829f:	00 d1                	add    %dl,%cl
 80482a1:	00 00                	add    %al,(%eax)
 80482a3:	00 00                	add    %al,(%eax)
 80482a5:	00 00                	add    %al,(%eax)
 80482a7:	00 d2                	add    %dl,%dl
 80482a9:	00 00                	add    %al,(%eax)
 80482ab:	00 12                	add    %dl,(%edx)
 80482ad:	00 00                	add    %al,(%eax)
 80482af:	00 4a 00             	add    %cl,0x0(%edx)
 80482b2:	00 00                	add    %al,(%eax)
 80482b4:	00 00                	add    %al,(%eax)
 80482b6:	00 00                	add    %al,(%eax)
 80482b8:	7d 00                	jge    80482ba <_init-0x456>
 80482ba:	00 00                	add    %al,(%eax)
 80482bc:	12 00                	adc    (%eax),%al
 80482be:	00 00                	add    %al,(%eax)
 80482c0:	45                   	inc    %ebp
 80482c1:	00 00                	add    %al,(%eax)
 80482c3:	00 00                	add    %al,(%eax)
 80482c5:	00 00                	add    %al,(%eax)
 80482c7:	00 7f 01             	add    %bh,0x1(%edi)
 80482ca:	00 00                	add    %al,(%eax)
 80482cc:	12 00                	adc    (%eax),%al
 80482ce:	00 00                	add    %al,(%eax)
 80482d0:	21 00                	and    %eax,(%eax)
 80482d2:	00 00                	add    %al,(%eax)
 80482d4:	40                   	inc    %eax
 80482d5:	a8 04                	test   $0x4,%al
 80482d7:	08 04 00             	or     %al,(%eax,%eax,1)
 80482da:	00 00                	add    %al,(%eax)
 80482dc:	11 00                	adc    %eax,(%eax)
 80482de:	17                   	pop    %ss
 80482df:	00 37                	add    %dh,(%edi)
 80482e1:	00 00                	add    %al,(%eax)
 80482e3:	00 00                	add    %al,(%eax)
 80482e5:	00 00                	add    %al,(%eax)
 80482e7:	00 51 01             	add    %dl,0x1(%ecx)
 80482ea:	00 00                	add    %al,(%eax)
 80482ec:	12 00                	adc    (%eax),%al
 80482ee:	00 00                	add    %al,(%eax)
 80482f0:	51                   	push   %ecx
 80482f1:	00 00                	add    %al,(%eax)
 80482f3:	00 00                	add    %al,(%eax)
 80482f5:	00 00                	add    %al,(%eax)
 80482f7:	00 4e 02             	add    %cl,0x2(%esi)
 80482fa:	00 00                	add    %al,(%eax)
 80482fc:	12 00                	adc    (%eax),%al
 80482fe:	00 00                	add    %al,(%eax)
 8048300:	b0 00                	mov    $0x0,%al
 8048302:	00 00                	add    %al,(%eax)
 8048304:	00 00                	add    %al,(%eax)
 8048306:	00 00                	add    %al,(%eax)
 8048308:	e7 00                	out    %eax,$0x0
 804830a:	00 00                	add    %al,(%eax)
 804830c:	12 00                	adc    (%eax),%al
 804830e:	00 00                	add    %al,(%eax)
 8048310:	f7 00 00 00 00 00    	testl  $0x0,(%eax)
 8048316:	00 00                	add    %al,(%eax)
 8048318:	e7 00                	out    %eax,$0x0
 804831a:	00 00                	add    %al,(%eax)
 804831c:	12 00                	adc    (%eax),%al
 804831e:	00 00                	add    %al,(%eax)
 8048320:	6e                   	outsb  %ds:(%esi),(%dx)
 8048321:	00 00                	add    %al,(%eax)
 8048323:	00 00                	add    %al,(%eax)
 8048325:	00 00                	add    %al,(%eax)
 8048327:	00 39                	add    %bh,(%ecx)
 8048329:	00 00                	add    %al,(%eax)
 804832b:	00 12                	add    %dl,(%edx)
 804832d:	00 00                	add    %al,(%eax)
 804832f:	00 a9 00 00 00 00    	add    %ch,0x0(%ecx)
 8048335:	00 00                	add    %al,(%eax)
 8048337:	00 ca                	add    %cl,%dl
 8048339:	01 00                	add    %eax,(%eax)
 804833b:	00 12                	add    %dl,(%edx)
 804833d:	00 00                	add    %al,(%eax)
 804833f:	00 93 00 00 00 00    	add    %dl,0x0(%ebx)
 8048345:	00 00                	add    %al,(%eax)
 8048347:	00 9a 01 00 00 12    	add    %bl,0x12000001(%edx)
 804834d:	00 00                	add    %al,(%eax)
 804834f:	00 d8                	add    %bl,%al
 8048351:	00 00                	add    %al,(%eax)
 8048353:	00 00                	add    %al,(%eax)
 8048355:	00 00                	add    %al,(%eax)
 8048357:	00 db                	add    %bl,%bl
 8048359:	00 00                	add    %al,(%eax)
 804835b:	00 12                	add    %dl,(%edx)
 804835d:	00 00                	add    %al,(%eax)
 804835f:	00 e3                	add    %ah,%bl
 8048361:	00 00                	add    %al,(%eax)
 8048363:	00 00                	add    %al,(%eax)
 8048365:	00 00                	add    %al,(%eax)
 8048367:	00 28                	add    %ch,(%eax)
 8048369:	00 00                	add    %al,(%eax)
 804836b:	00 12                	add    %dl,(%edx)
 804836d:	00 00                	add    %al,(%eax)
 804836f:	00 88 00 00 00 00    	add    %cl,0x0(%eax)
 8048375:	00 00                	add    %al,(%eax)
 8048377:	00 34 00             	add    %dh,(%eax,%eax,1)
 804837a:	00 00                	add    %al,(%eax)
 804837c:	12 00                	adc    (%eax),%al
 804837e:	00 00                	add    %al,(%eax)
 8048380:	cb                   	lret   
 8048381:	00 00                	add    %al,(%eax)
 8048383:	00 00                	add    %al,(%eax)
 8048385:	00 00                	add    %al,(%eax)
 8048387:	00 0e                	add    %cl,(%esi)
 8048389:	00 00                	add    %al,(%eax)
 804838b:	00 12                	add    %dl,(%edx)
 804838d:	00 00                	add    %al,(%eax)
 804838f:	00 28                	add    %ch,(%eax)
 8048391:	00 00                	add    %al,(%eax)
 8048393:	00 00                	add    %al,(%eax)
 8048395:	00 00                	add    %al,(%eax)
 8048397:	00 78 00             	add    %bh,0x0(%eax)
 804839a:	00 00                	add    %al,(%eax)
 804839c:	12 00                	adc    (%eax),%al
 804839e:	00 00                	add    %al,(%eax)
 80483a0:	75 00                	jne    80483a2 <_init-0x36e>
 80483a2:	00 00                	add    %al,(%eax)
 80483a4:	44                   	inc    %esp
 80483a5:	a8 04                	test   $0x4,%al
 80483a7:	08 04 00             	or     %al,(%eax,%eax,1)
 80483aa:	00 00                	add    %al,(%eax)
 80483ac:	11 00                	adc    %eax,(%eax)
 80483ae:	17                   	pop    %ss
 80483af:	00 dd                	add    %bl,%ch
 80483b1:	00 00                	add    %al,(%eax)
 80483b3:	00 00                	add    %al,(%eax)
 80483b5:	00 00                	add    %al,(%eax)
 80483b7:	00 33                	add    %dh,(%ebx)
 80483b9:	00 00                	add    %al,(%eax)
 80483bb:	00 12                	add    %dl,(%edx)
 80483bd:	00 00                	add    %al,(%eax)
 80483bf:	00 8f 00 00 00 00    	add    %cl,0x0(%edi)
 80483c5:	00 00                	add    %al,(%eax)
 80483c7:	00 36                	add    %dh,(%esi)
 80483c9:	00 00                	add    %al,(%eax)
 80483cb:	00 12                	add    %dl,(%edx)
 80483cd:	00 00                	add    %al,(%eax)
 80483cf:	00 e8                	add    %ch,%al
 80483d1:	00 00                	add    %al,(%eax)
 80483d3:	00 94 98 04 08 04 00 	add    %dl,0x40804(%eax,%ebx,4)
 80483da:	00 00                	add    %al,(%eax)
 80483dc:	11 00                	adc    %eax,(%eax)
 80483de:	0e                   	push   %cs
 80483df:	00 a1 00 00 00 00    	add    %ah,0x0(%ecx)
 80483e5:	00 00                	add    %al,(%eax)
 80483e7:	00 34 00             	add    %dh,(%eax,%eax,1)
 80483ea:	00 00                	add    %al,(%eax)
 80483ec:	12 00                	adc    (%eax),%al
 80483ee:	00 00                	add    %al,(%eax)
 80483f0:	c4 00                	les    (%eax),%eax
 80483f2:	00 00                	add    %al,(%eax)
 80483f4:	00 00                	add    %al,(%eax)
 80483f6:	00 00                	add    %al,(%eax)
 80483f8:	67 01 00             	add    %eax,(%bx,%si)
 80483fb:	00 12                	add    %dl,(%edx)
 80483fd:	00 00                	add    %al,(%eax)
 80483ff:	00 57 00             	add    %dl,0x0(%edi)
 8048402:	00 00                	add    %al,(%eax)
 8048404:	00 00                	add    %al,(%eax)
 8048406:	00 00                	add    %al,(%eax)
 8048408:	39 00                	cmp    %eax,(%eax)
 804840a:	00 00                	add    %al,(%eax)
 804840c:	12 00                	adc    (%eax),%al
 804840e:	00 00                	add    %al,(%eax)
 8048410:	b6 00                	mov    $0x0,%dh
 8048412:	00 00                	add    %al,(%eax)
 8048414:	00 00                	add    %al,(%eax)
 8048416:	00 00                	add    %al,(%eax)
 8048418:	71 00                	jno    804841a <_init-0x2f6>
 804841a:	00 00                	add    %al,(%eax)
 804841c:	12 00                	adc    (%eax),%al
 804841e:	00 00                	add    %al,(%eax)
 8048420:	65 00 00             	add    %al,%gs:(%eax)
 8048423:	00 00                	add    %al,(%eax)
 8048425:	00 00                	add    %al,(%eax)
 8048427:	00 9b 00 00 00 12    	add    %bl,0x12000000(%ebx)
 804842d:	00 00                	add    %al,(%eax)
 804842f:	00 01                	add    %al,(%ecx)
	...
 8048439:	00 00                	add    %al,(%eax)
 804843b:	00 20                	add    %ah,(%eax)
 804843d:	00 00                	add    %al,(%eax)
 804843f:	00 1a                	add    %bl,(%edx)
 8048441:	00 00                	add    %al,(%eax)
 8048443:	00 00                	add    %al,(%eax)
 8048445:	00 00                	add    %al,(%eax)
 8048447:	00 20                	add    %ah,(%eax)
 8048449:	00 00                	add    %al,(%eax)
 804844b:	00 12                	add    %dl,(%edx)
 804844d:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dynstr:

08048450 <.dynstr>:
 8048450:	00 5f 5f             	add    %bl,0x5f(%edi)
 8048453:	67 6d                	insl   (%dx),%es:(%di)
 8048455:	6f                   	outsl  %ds:(%esi),(%dx)
 8048456:	6e                   	outsb  %ds:(%esi),(%dx)
 8048457:	5f                   	pop    %edi
 8048458:	73 74                	jae    80484ce <_init-0x242>
 804845a:	61                   	popa   
 804845b:	72 74                	jb     80484d1 <_init-0x23f>
 804845d:	5f                   	pop    %edi
 804845e:	5f                   	pop    %edi
 804845f:	00 6c 69 62          	add    %ch,0x62(%ecx,%ebp,2)
 8048463:	63 2e                	arpl   %bp,(%esi)
 8048465:	73 6f                	jae    80484d6 <_init-0x23a>
 8048467:	2e 36 00 73 74       	cs add %dh,%ss:0x74(%ebx)
 804846c:	72 63                	jb     80484d1 <_init-0x23f>
 804846e:	70 79                	jo     80484e9 <_init-0x227>
 8048470:	00 73 74             	add    %dh,0x74(%ebx)
 8048473:	64 6f                	outsl  %fs:(%esi),(%dx)
 8048475:	75 74                	jne    80484eb <_init-0x225>
 8048477:	00 63 6f             	add    %ah,0x6f(%ebx)
 804847a:	6e                   	outsb  %ds:(%esi),(%dx)
 804847b:	6e                   	outsb  %ds:(%esi),(%dx)
 804847c:	65 63 74 00 67       	arpl   %si,%gs:0x67(%eax,%eax,1)
 8048481:	65 74 65             	gs je  80484e9 <_init-0x227>
 8048484:	6e                   	outsb  %ds:(%esi),(%dx)
 8048485:	76 00                	jbe    8048487 <_init-0x289>
 8048487:	66 67 65 74 73       	data16 addr16 gs je 80484ff <_init-0x211>
 804848c:	00 74 6d 70          	add    %dh,0x70(%ebp,%ebp,2)
 8048490:	66 69 6c 65 00 70 75 	imul   $0x7570,0x0(%ebp,%eiz,2),%bp
 8048497:	74 73                	je     804850c <_init-0x204>
 8048499:	00 73 79             	add    %dh,0x79(%ebx)
 804849c:	73 74                	jae    8048512 <_init-0x1fe>
 804849e:	65 6d                	gs insl (%dx),%es:(%edi)
 80484a0:	00 73 6c             	add    %dh,0x6c(%ebx)
 80484a3:	65 65 70 00          	gs gs jo 80484a7 <_init-0x269>
 80484a7:	73 6f                	jae    8048518 <_init-0x1f8>
 80484a9:	63 6b 65             	arpl   %bp,0x65(%ebx)
 80484ac:	74 00                	je     80484ae <_init-0x262>
 80484ae:	66 66 6c             	data16 data16 insb (%dx),%es:(%edi)
 80484b1:	75 73                	jne    8048526 <_init-0x1ea>
 80484b3:	68 00 63 75 73       	push   $0x73756300
 80484b8:	65 72 69             	gs jb  8048524 <_init-0x1ec>
 80484bb:	64 00 66 70          	add    %ah,%fs:0x70(%esi)
 80484bf:	72 69                	jb     804852a <_init-0x1e6>
 80484c1:	6e                   	outsb  %ds:(%esi),(%dx)
 80484c2:	74 66                	je     804852a <_init-0x1e6>
 80484c4:	00 73 74             	add    %dh,0x74(%ebx)
 80484c7:	64 69 6e 00 73 69 67 	imul   $0x6e676973,%fs:0x0(%esi),%ebp
 80484ce:	6e 
 80484cf:	61                   	popa   
 80484d0:	6c                   	insb   (%dx),%es:(%edi)
 80484d1:	00 62 63             	add    %ah,0x63(%edx)
 80484d4:	6f                   	outsl  %ds:(%esi),(%dx)
 80484d5:	70 79                	jo     8048550 <_init-0x1c0>
 80484d7:	00 73 73             	add    %dh,0x73(%ebx)
 80484da:	63 61 6e             	arpl   %sp,0x6e(%ecx)
 80484dd:	66 00 64 75 70       	data16 add %ah,0x70(%ebp,%esi,2)
 80484e2:	00 67 65             	add    %ah,0x65(%edi)
 80484e5:	74 68                	je     804854f <_init-0x1c1>
 80484e7:	6f                   	outsl  %ds:(%esi),(%dx)
 80484e8:	73 74                	jae    804855e <_init-0x1b2>
 80484ea:	62 79 6e             	bound  %edi,0x6e(%ecx)
 80484ed:	61                   	popa   
 80484ee:	6d                   	insl   (%dx),%es:(%edi)
 80484ef:	65 00 73 70          	add    %dh,%gs:0x70(%ebx)
 80484f3:	72 69                	jb     804855e <_init-0x1b2>
 80484f5:	6e                   	outsb  %ds:(%esi),(%dx)
 80484f6:	74 66                	je     804855e <_init-0x1b2>
 80484f8:	00 66 63             	add    %ah,0x63(%esi)
 80484fb:	6c                   	insb   (%dx),%es:(%edi)
 80484fc:	6f                   	outsl  %ds:(%esi),(%dx)
 80484fd:	73 65                	jae    8048564 <_init-0x1ac>
 80484ff:	00 66 70             	add    %ah,0x70(%esi)
 8048502:	75 74                	jne    8048578 <_init-0x198>
 8048504:	63 00                	arpl   %ax,(%eax)
 8048506:	5f                   	pop    %edi
 8048507:	5f                   	pop    %edi
 8048508:	63 74 79 70          	arpl   %si,0x70(%ecx,%edi,2)
 804850c:	65 5f                	gs pop %edi
 804850e:	62 5f 6c             	bound  %ebx,0x6c(%edi)
 8048511:	6f                   	outsl  %ds:(%esi),(%dx)
 8048512:	63 00                	arpl   %ax,(%eax)
 8048514:	66 77 72             	data16 ja 8048589 <_init-0x187>
 8048517:	69 74 65 00 68 74 6f 	imul   $0x6e6f7468,0x0(%ebp,%eiz,2),%esi
 804851e:	6e 
 804851f:	73 00                	jae    8048521 <_init-0x1ef>
 8048521:	72 65                	jb     8048588 <_init-0x188>
 8048523:	77 69                	ja     804858e <_init-0x182>
 8048525:	6e                   	outsb  %ds:(%esi),(%dx)
 8048526:	64 00 65 78          	add    %ah,%fs:0x78(%ebp)
 804852a:	69 74 00 66 6f 70 65 	imul   $0x6e65706f,0x66(%eax,%eax,1),%esi
 8048531:	6e 
 8048532:	00 61 74             	add    %ah,0x74(%ecx)
 8048535:	6f                   	outsl  %ds:(%esi),(%dx)
 8048536:	69 00 5f 49 4f 5f    	imul   $0x5f4f495f,(%eax),%eax
 804853c:	73 74                	jae    80485b2 <_init-0x15e>
 804853e:	64 69 6e 5f 75 73 65 	imul   $0x64657375,%fs:0x5f(%esi),%ebp
 8048545:	64 
 8048546:	00 5f 5f             	add    %bl,0x5f(%edi)
 8048549:	6c                   	insb   (%dx),%es:(%edi)
 804854a:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%edx),%esp
 8048551:	72 74                	jb     80485c7 <_init-0x149>
 8048553:	5f                   	pop    %edi
 8048554:	6d                   	insl   (%dx),%es:(%edi)
 8048555:	61                   	popa   
 8048556:	69 6e 00 47 4c 49 42 	imul   $0x42494c47,0x0(%esi),%ebp
 804855d:	43                   	inc    %ebx
 804855e:	5f                   	pop    %edi
 804855f:	32 2e                	xor    (%esi),%ch
 8048561:	33 00                	xor    (%eax),%eax
 8048563:	47                   	inc    %edi
 8048564:	4c                   	dec    %esp
 8048565:	49                   	dec    %ecx
 8048566:	42                   	inc    %edx
 8048567:	43                   	inc    %ebx
 8048568:	5f                   	pop    %edi
 8048569:	32 2e                	xor    (%esi),%ch
 804856b:	31 00                	xor    %eax,(%eax)
 804856d:	47                   	inc    %edi
 804856e:	4c                   	dec    %esp
 804856f:	49                   	dec    %ecx
 8048570:	42                   	inc    %edx
 8048571:	43                   	inc    %ebx
 8048572:	5f                   	pop    %edi
 8048573:	32 2e                	xor    (%esi),%ch
 8048575:	30 00                	xor    %al,(%eax)

Disassembly of section .gnu.version:

08048578 <.gnu.version>:
 8048578:	00 00                	add    %al,(%eax)
 804857a:	02 00                	add    (%eax),%al
 804857c:	02 00                	add    (%eax),%al
 804857e:	03 00                	add    (%eax),%eax
 8048580:	02 00                	add    (%eax),%al
 8048582:	02 00                	add    (%eax),%al
 8048584:	02 00                	add    (%eax),%al
 8048586:	02 00                	add    (%eax),%al
 8048588:	02 00                	add    (%eax),%al
 804858a:	02 00                	add    (%eax),%al
 804858c:	02 00                	add    (%eax),%al
 804858e:	02 00                	add    (%eax),%al
 8048590:	02 00                	add    (%eax),%al
 8048592:	02 00                	add    (%eax),%al
 8048594:	02 00                	add    (%eax),%al
 8048596:	02 00                	add    (%eax),%al
 8048598:	02 00                	add    (%eax),%al
 804859a:	03 00                	add    (%eax),%eax
 804859c:	02 00                	add    (%eax),%al
 804859e:	02 00                	add    (%eax),%al
 80485a0:	02 00                	add    (%eax),%al
 80485a2:	02 00                	add    (%eax),%al
 80485a4:	02 00                	add    (%eax),%al
 80485a6:	02 00                	add    (%eax),%al
 80485a8:	02 00                	add    (%eax),%al
 80485aa:	03 00                	add    (%eax),%eax
 80485ac:	02 00                	add    (%eax),%al
 80485ae:	01 00                	add    %eax,(%eax)
 80485b0:	02 00                	add    (%eax),%al
 80485b2:	02 00                	add    (%eax),%al
 80485b4:	02 00                	add    (%eax),%al
 80485b6:	04 00                	add    $0x0,%al
 80485b8:	02 00                	add    (%eax),%al
 80485ba:	00 00                	add    %al,(%eax)
 80485bc:	02 00                	add    (%eax),%al

Disassembly of section .gnu.version_r:

080485c0 <.gnu.version_r>:
 80485c0:	01 00                	add    %eax,(%eax)
 80485c2:	03 00                	add    (%eax),%eax
 80485c4:	10 00                	adc    %al,(%eax)
 80485c6:	00 00                	add    %al,(%eax)
 80485c8:	10 00                	adc    %al,(%eax)
 80485ca:	00 00                	add    %al,(%eax)
 80485cc:	00 00                	add    %al,(%eax)
 80485ce:	00 00                	add    %al,(%eax)
 80485d0:	13 69 69             	adc    0x69(%ecx),%ebp
 80485d3:	0d 00 00 04 00       	or     $0x40000,%eax
 80485d8:	09 01                	or     %eax,(%ecx)
 80485da:	00 00                	add    %al,(%eax)
 80485dc:	10 00                	adc    %al,(%eax)
 80485de:	00 00                	add    %al,(%eax)
 80485e0:	11 69 69             	adc    %ebp,0x69(%ecx)
 80485e3:	0d 00 00 03 00       	or     $0x30000,%eax
 80485e8:	13 01                	adc    (%ecx),%eax
 80485ea:	00 00                	add    %al,(%eax)
 80485ec:	10 00                	adc    %al,(%eax)
 80485ee:	00 00                	add    %al,(%eax)
 80485f0:	10 69 69             	adc    %ch,0x69(%ecx)
 80485f3:	0d 00 00 02 00       	or     $0x20000,%eax
 80485f8:	1d 01 00 00 00       	sbb    $0x1,%eax
 80485fd:	00 00                	add    %al,(%eax)
	...

Disassembly of section .rel.dyn:

08048600 <.rel.dyn>:
 8048600:	dc a0 04 08 06 21    	fsubl  0x21060804(%eax)
 8048606:	00 00                	add    %al,(%eax)
 8048608:	40                   	inc    %eax
 8048609:	a8 04                	test   $0x4,%al
 804860b:	08 05 0b 00 00 44    	or     %al,0x4400000b
 8048611:	a8 04                	test   $0x4,%al
 8048613:	08                   	.byte 0x8
 8048614:	05                   	.byte 0x5
 8048615:	18 00                	sbb    %al,(%eax)
	...

Disassembly of section .rel.plt:

08048618 <.rel.plt>:
 8048618:	ec                   	in     (%dx),%al
 8048619:	a0 04 08 07 01       	mov    0x1070804,%al
 804861e:	00 00                	add    %al,(%eax)
 8048620:	f0 a0 04 08 07 02    	lock mov 0x2070804,%al
 8048626:	00 00                	add    %al,(%eax)
 8048628:	f4                   	hlt    
 8048629:	a0 04 08 07 03       	mov    0x3070804,%al
 804862e:	00 00                	add    %al,(%eax)
 8048630:	f8                   	clc    
 8048631:	a0 04 08 07 04       	mov    0x4070804,%al
 8048636:	00 00                	add    %al,(%eax)
 8048638:	fc                   	cld    
 8048639:	a0 04 08 07 05       	mov    0x5070804,%al
 804863e:	00 00                	add    %al,(%eax)
 8048640:	00 a1 04 08 07 06    	add    %ah,0x6070804(%ecx)
 8048646:	00 00                	add    %al,(%eax)
 8048648:	04 a1                	add    $0xa1,%al
 804864a:	04 08                	add    $0x8,%al
 804864c:	07                   	pop    %es
 804864d:	07                   	pop    %es
 804864e:	00 00                	add    %al,(%eax)
 8048650:	08 a1 04 08 07 08    	or     %ah,0x8070804(%ecx)
 8048656:	00 00                	add    %al,(%eax)
 8048658:	0c a1                	or     $0xa1,%al
 804865a:	04 08                	add    $0x8,%al
 804865c:	07                   	pop    %es
 804865d:	09 00                	or     %eax,(%eax)
 804865f:	00 10                	add    %dl,(%eax)
 8048661:	a1 04 08 07 0a       	mov    0xa070804,%eax
 8048666:	00 00                	add    %al,(%eax)
 8048668:	14 a1                	adc    $0xa1,%al
 804866a:	04 08                	add    $0x8,%al
 804866c:	07                   	pop    %es
 804866d:	0c 00                	or     $0x0,%al
 804866f:	00 18                	add    %bl,(%eax)
 8048671:	a1 04 08 07 0d       	mov    0xd070804,%eax
 8048676:	00 00                	add    %al,(%eax)
 8048678:	1c a1                	sbb    $0xa1,%al
 804867a:	04 08                	add    $0x8,%al
 804867c:	07                   	pop    %es
 804867d:	0e                   	push   %cs
 804867e:	00 00                	add    %al,(%eax)
 8048680:	20 a1 04 08 07 0f    	and    %ah,0xf070804(%ecx)
 8048686:	00 00                	add    %al,(%eax)
 8048688:	24 a1                	and    $0xa1,%al
 804868a:	04 08                	add    $0x8,%al
 804868c:	07                   	pop    %es
 804868d:	10 00                	adc    %al,(%eax)
 804868f:	00 28                	add    %ch,(%eax)
 8048691:	a1 04 08 07 11       	mov    0x11070804,%eax
 8048696:	00 00                	add    %al,(%eax)
 8048698:	2c a1                	sub    $0xa1,%al
 804869a:	04 08                	add    $0x8,%al
 804869c:	07                   	pop    %es
 804869d:	12 00                	adc    (%eax),%al
 804869f:	00 30                	add    %dh,(%eax)
 80486a1:	a1 04 08 07 13       	mov    0x13070804,%eax
 80486a6:	00 00                	add    %al,(%eax)
 80486a8:	34 a1                	xor    $0xa1,%al
 80486aa:	04 08                	add    $0x8,%al
 80486ac:	07                   	pop    %es
 80486ad:	14 00                	adc    $0x0,%al
 80486af:	00 38                	add    %bh,(%eax)
 80486b1:	a1 04 08 07 15       	mov    0x15070804,%eax
 80486b6:	00 00                	add    %al,(%eax)
 80486b8:	3c a1                	cmp    $0xa1,%al
 80486ba:	04 08                	add    $0x8,%al
 80486bc:	07                   	pop    %es
 80486bd:	16                   	push   %ss
 80486be:	00 00                	add    %al,(%eax)
 80486c0:	40                   	inc    %eax
 80486c1:	a1 04 08 07 17       	mov    0x17070804,%eax
 80486c6:	00 00                	add    %al,(%eax)
 80486c8:	44                   	inc    %esp
 80486c9:	a1 04 08 07 19       	mov    0x19070804,%eax
 80486ce:	00 00                	add    %al,(%eax)
 80486d0:	48                   	dec    %eax
 80486d1:	a1 04 08 07 1a       	mov    0x1a070804,%eax
 80486d6:	00 00                	add    %al,(%eax)
 80486d8:	4c                   	dec    %esp
 80486d9:	a1 04 08 07 1c       	mov    0x1c070804,%eax
 80486de:	00 00                	add    %al,(%eax)
 80486e0:	50                   	push   %eax
 80486e1:	a1 04 08 07 1d       	mov    0x1d070804,%eax
 80486e6:	00 00                	add    %al,(%eax)
 80486e8:	54                   	push   %esp
 80486e9:	a1 04 08 07 1e       	mov    0x1e070804,%eax
 80486ee:	00 00                	add    %al,(%eax)
 80486f0:	58                   	pop    %eax
 80486f1:	a1 04 08 07 1f       	mov    0x1f070804,%eax
 80486f6:	00 00                	add    %al,(%eax)
 80486f8:	5c                   	pop    %esp
 80486f9:	a1 04 08 07 20       	mov    0x20070804,%eax
 80486fe:	00 00                	add    %al,(%eax)
 8048700:	60                   	pusha  
 8048701:	a1 04 08 07 21       	mov    0x21070804,%eax
 8048706:	00 00                	add    %al,(%eax)
 8048708:	64 a1 04 08 07 22    	mov    %fs:0x22070804,%eax
	...

Disassembly of section .init:

08048710 <_init>:
 8048710:	55                   	push   %ebp
 8048711:	89 e5                	mov    %esp,%ebp
 8048713:	83 ec 08             	sub    $0x8,%esp
 8048716:	e8 39 02 00 00       	call   8048954 <call_gmon_start>
 804871b:	e8 90 02 00 00       	call   80489b0 <frame_dummy>
 8048720:	e8 1b 11 00 00       	call   8049840 <__do_global_ctors_aux>
 8048725:	c9                   	leave  
 8048726:	c3                   	ret    

Disassembly of section .plt:

08048728 <.plt>:
 8048728:	ff 35 e4 a0 04 08    	pushl  0x804a0e4
 804872e:	ff 25 e8 a0 04 08    	jmp    *0x804a0e8
 8048734:	00 00                	add    %al,(%eax)
	...

08048738 <close@plt>:
 8048738:	ff 25 ec a0 04 08    	jmp    *0x804a0ec
 804873e:	68 00 00 00 00       	push   $0x0
 8048743:	e9 e0 ff ff ff       	jmp    8048728 <.plt>

08048748 <fprintf@plt>:
 8048748:	ff 25 f0 a0 04 08    	jmp    *0x804a0f0
 804874e:	68 08 00 00 00       	push   $0x8
 8048753:	e9 d0 ff ff ff       	jmp    8048728 <.plt>

08048758 <tmpfile@plt>:
 8048758:	ff 25 f4 a0 04 08    	jmp    *0x804a0f4
 804875e:	68 10 00 00 00       	push   $0x10
 8048763:	e9 c0 ff ff ff       	jmp    8048728 <.plt>

08048768 <getenv@plt>:
 8048768:	ff 25 f8 a0 04 08    	jmp    *0x804a0f8
 804876e:	68 18 00 00 00       	push   $0x18
 8048773:	e9 b0 ff ff ff       	jmp    8048728 <.plt>

08048778 <signal@plt>:
 8048778:	ff 25 fc a0 04 08    	jmp    *0x804a0fc
 804877e:	68 20 00 00 00       	push   $0x20
 8048783:	e9 a0 ff ff ff       	jmp    8048728 <.plt>

08048788 <fflush@plt>:
 8048788:	ff 25 00 a1 04 08    	jmp    *0x804a100
 804878e:	68 28 00 00 00       	push   $0x28
 8048793:	e9 90 ff ff ff       	jmp    8048728 <.plt>

08048798 <bcopy@plt>:
 8048798:	ff 25 04 a1 04 08    	jmp    *0x804a104
 804879e:	68 30 00 00 00       	push   $0x30
 80487a3:	e9 80 ff ff ff       	jmp    8048728 <.plt>

080487a8 <rewind@plt>:
 80487a8:	ff 25 08 a1 04 08    	jmp    *0x804a108
 80487ae:	68 38 00 00 00       	push   $0x38
 80487b3:	e9 70 ff ff ff       	jmp    8048728 <.plt>

080487b8 <system@plt>:
 80487b8:	ff 25 0c a1 04 08    	jmp    *0x804a10c
 80487be:	68 40 00 00 00       	push   $0x40
 80487c3:	e9 60 ff ff ff       	jmp    8048728 <.plt>

080487c8 <puts@plt>:
 80487c8:	ff 25 10 a1 04 08    	jmp    *0x804a110
 80487ce:	68 48 00 00 00       	push   $0x48
 80487d3:	e9 50 ff ff ff       	jmp    8048728 <.plt>

080487d8 <fgets@plt>:
 80487d8:	ff 25 14 a1 04 08    	jmp    *0x804a114
 80487de:	68 50 00 00 00       	push   $0x50
 80487e3:	e9 40 ff ff ff       	jmp    8048728 <.plt>

080487e8 <sleep@plt>:
 80487e8:	ff 25 18 a1 04 08    	jmp    *0x804a118
 80487ee:	68 58 00 00 00       	push   $0x58
 80487f3:	e9 30 ff ff ff       	jmp    8048728 <.plt>

080487f8 <fputc@plt>:
 80487f8:	ff 25 1c a1 04 08    	jmp    *0x804a11c
 80487fe:	68 60 00 00 00       	push   $0x60
 8048803:	e9 20 ff ff ff       	jmp    8048728 <.plt>

08048808 <__libc_start_main@plt>:
 8048808:	ff 25 20 a1 04 08    	jmp    *0x804a120
 804880e:	68 68 00 00 00       	push   $0x68
 8048813:	e9 10 ff ff ff       	jmp    8048728 <.plt>

08048818 <printf@plt>:
 8048818:	ff 25 24 a1 04 08    	jmp    *0x804a124
 804881e:	68 70 00 00 00       	push   $0x70
 8048823:	e9 00 ff ff ff       	jmp    8048728 <.plt>

08048828 <fclose@plt>:
 8048828:	ff 25 28 a1 04 08    	jmp    *0x804a128
 804882e:	68 78 00 00 00       	push   $0x78
 8048833:	e9 f0 fe ff ff       	jmp    8048728 <.plt>

08048838 <gethostbyname@plt>:
 8048838:	ff 25 2c a1 04 08    	jmp    *0x804a12c
 804883e:	68 80 00 00 00       	push   $0x80
 8048843:	e9 e0 fe ff ff       	jmp    8048728 <.plt>

08048848 <exit@plt>:
 8048848:	ff 25 30 a1 04 08    	jmp    *0x804a130
 804884e:	68 88 00 00 00       	push   $0x88
 8048853:	e9 d0 fe ff ff       	jmp    8048728 <.plt>

08048858 <atoi@plt>:
 8048858:	ff 25 34 a1 04 08    	jmp    *0x804a134
 804885e:	68 90 00 00 00       	push   $0x90
 8048863:	e9 c0 fe ff ff       	jmp    8048728 <.plt>

08048868 <sscanf@plt>:
 8048868:	ff 25 38 a1 04 08    	jmp    *0x804a138
 804886e:	68 98 00 00 00       	push   $0x98
 8048873:	e9 b0 fe ff ff       	jmp    8048728 <.plt>

08048878 <htons@plt>:
 8048878:	ff 25 3c a1 04 08    	jmp    *0x804a13c
 804887e:	68 a0 00 00 00       	push   $0xa0
 8048883:	e9 a0 fe ff ff       	jmp    8048728 <.plt>

08048888 <connect@plt>:
 8048888:	ff 25 40 a1 04 08    	jmp    *0x804a140
 804888e:	68 a8 00 00 00       	push   $0xa8
 8048893:	e9 90 fe ff ff       	jmp    8048728 <.plt>

08048898 <fopen@plt>:
 8048898:	ff 25 44 a1 04 08    	jmp    *0x804a144
 804889e:	68 b0 00 00 00       	push   $0xb0
 80488a3:	e9 80 fe ff ff       	jmp    8048728 <.plt>

080488a8 <dup@plt>:
 80488a8:	ff 25 48 a1 04 08    	jmp    *0x804a148
 80488ae:	68 b8 00 00 00       	push   $0xb8
 80488b3:	e9 70 fe ff ff       	jmp    8048728 <.plt>

080488b8 <sprintf@plt>:
 80488b8:	ff 25 4c a1 04 08    	jmp    *0x804a14c
 80488be:	68 c0 00 00 00       	push   $0xc0
 80488c3:	e9 60 fe ff ff       	jmp    8048728 <.plt>

080488c8 <fwrite@plt>:
 80488c8:	ff 25 50 a1 04 08    	jmp    *0x804a150
 80488ce:	68 c8 00 00 00       	push   $0xc8
 80488d3:	e9 50 fe ff ff       	jmp    8048728 <.plt>

080488d8 <socket@plt>:
 80488d8:	ff 25 54 a1 04 08    	jmp    *0x804a154
 80488de:	68 d0 00 00 00       	push   $0xd0
 80488e3:	e9 40 fe ff ff       	jmp    8048728 <.plt>

080488e8 <__ctype_b_loc@plt>:
 80488e8:	ff 25 58 a1 04 08    	jmp    *0x804a158
 80488ee:	68 d8 00 00 00       	push   $0xd8
 80488f3:	e9 30 fe ff ff       	jmp    8048728 <.plt>

080488f8 <cuserid@plt>:
 80488f8:	ff 25 5c a1 04 08    	jmp    *0x804a15c
 80488fe:	68 e0 00 00 00       	push   $0xe0
 8048903:	e9 20 fe ff ff       	jmp    8048728 <.plt>

08048908 <__gmon_start__@plt>:
 8048908:	ff 25 60 a1 04 08    	jmp    *0x804a160
 804890e:	68 e8 00 00 00       	push   $0xe8
 8048913:	e9 10 fe ff ff       	jmp    8048728 <.plt>

08048918 <strcpy@plt>:
 8048918:	ff 25 64 a1 04 08    	jmp    *0x804a164
 804891e:	68 f0 00 00 00       	push   $0xf0
 8048923:	e9 00 fe ff ff       	jmp    8048728 <.plt>

Disassembly of section .text:

08048930 <_start>:
 8048930:	31 ed                	xor    %ebp,%ebp
 8048932:	5e                   	pop    %esi
 8048933:	89 e1                	mov    %esp,%ecx
 8048935:	83 e4 f0             	and    $0xfffffff0,%esp
 8048938:	50                   	push   %eax
 8048939:	54                   	push   %esp
 804893a:	52                   	push   %edx
 804893b:	68 90 97 04 08       	push   $0x8049790
 8048940:	68 e0 97 04 08       	push   $0x80497e0
 8048945:	51                   	push   %ecx
 8048946:	56                   	push   %esi
 8048947:	68 d4 89 04 08       	push   $0x80489d4
 804894c:	e8 b7 fe ff ff       	call   8048808 <__libc_start_main@plt>
 8048951:	f4                   	hlt    
 8048952:	90                   	nop
 8048953:	90                   	nop

08048954 <call_gmon_start>:
 8048954:	55                   	push   %ebp
 8048955:	89 e5                	mov    %esp,%ebp
 8048957:	53                   	push   %ebx
 8048958:	83 ec 04             	sub    $0x4,%esp
 804895b:	e8 00 00 00 00       	call   8048960 <call_gmon_start+0xc>
 8048960:	5b                   	pop    %ebx
 8048961:	81 c3 80 17 00 00    	add    $0x1780,%ebx
 8048967:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 804896d:	85 d2                	test   %edx,%edx
 804896f:	74 05                	je     8048976 <call_gmon_start+0x22>
 8048971:	e8 92 ff ff ff       	call   8048908 <__gmon_start__@plt>
 8048976:	58                   	pop    %eax
 8048977:	5b                   	pop    %ebx
 8048978:	c9                   	leave  
 8048979:	c3                   	ret    
 804897a:	90                   	nop
 804897b:	90                   	nop
 804897c:	90                   	nop
 804897d:	90                   	nop
 804897e:	90                   	nop
 804897f:	90                   	nop

08048980 <__do_global_dtors_aux>:
 8048980:	55                   	push   %ebp
 8048981:	89 e5                	mov    %esp,%ebp
 8048983:	83 ec 08             	sub    $0x8,%esp
 8048986:	80 3d 48 a8 04 08 00 	cmpb   $0x0,0x804a848
 804898d:	74 0c                	je     804899b <__do_global_dtors_aux+0x1b>
 804898f:	eb 1c                	jmp    80489ad <__do_global_dtors_aux+0x2d>
 8048991:	83 c0 04             	add    $0x4,%eax
 8048994:	a3 88 a1 04 08       	mov    %eax,0x804a188
 8048999:	ff d2                	call   *%edx
 804899b:	a1 88 a1 04 08       	mov    0x804a188,%eax
 80489a0:	8b 10                	mov    (%eax),%edx
 80489a2:	85 d2                	test   %edx,%edx
 80489a4:	75 eb                	jne    8048991 <__do_global_dtors_aux+0x11>
 80489a6:	c6 05 48 a8 04 08 01 	movb   $0x1,0x804a848
 80489ad:	c9                   	leave  
 80489ae:	c3                   	ret    
 80489af:	90                   	nop

080489b0 <frame_dummy>:
 80489b0:	55                   	push   %ebp
 80489b1:	89 e5                	mov    %esp,%ebp
 80489b3:	83 ec 08             	sub    $0x8,%esp
 80489b6:	a1 10 a0 04 08       	mov    0x804a010,%eax
 80489bb:	85 c0                	test   %eax,%eax
 80489bd:	74 12                	je     80489d1 <frame_dummy+0x21>
 80489bf:	b8 00 00 00 00       	mov    $0x0,%eax
 80489c4:	85 c0                	test   %eax,%eax
 80489c6:	74 09                	je     80489d1 <frame_dummy+0x21>
 80489c8:	c7 04 24 10 a0 04 08 	movl   $0x804a010,(%esp)
 80489cf:	ff d0                	call   *%eax
 80489d1:	c9                   	leave  
 80489d2:	c3                   	ret    
 80489d3:	90                   	nop

080489d4 <main>:
 80489d4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 80489d8:	83 e4 f0             	and    $0xfffffff0,%esp
 80489db:	ff 71 fc             	pushl  -0x4(%ecx)
 80489de:	55                   	push   %ebp
 80489df:	89 e5                	mov    %esp,%ebp
 80489e1:	51                   	push   %ecx
 80489e2:	83 ec 24             	sub    $0x24,%esp
 80489e5:	89 4d e8             	mov    %ecx,-0x18(%ebp)
 80489e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80489eb:	83 38 01             	cmpl   $0x1,(%eax)
 80489ee:	75 0f                	jne    80489ff <main+0x2b>
 80489f0:	a1 44 a8 04 08       	mov    0x804a844,%eax
 80489f5:	a3 50 a8 04 08       	mov    %eax,0x804a850
 80489fa:	e9 88 00 00 00       	jmp    8048a87 <main+0xb3>
 80489ff:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048a02:	83 3a 02             	cmpl   $0x2,(%edx)
 8048a05:	75 5c                	jne    8048a63 <main+0x8f>
 8048a07:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048a0a:	8b 41 04             	mov    0x4(%ecx),%eax
 8048a0d:	83 c0 04             	add    $0x4,%eax
 8048a10:	8b 00                	mov    (%eax),%eax
 8048a12:	c7 44 24 04 98 98 04 	movl   $0x8049898,0x4(%esp)
 8048a19:	08 
 8048a1a:	89 04 24             	mov    %eax,(%esp)
 8048a1d:	e8 76 fe ff ff       	call   8048898 <fopen@plt>
 8048a22:	a3 50 a8 04 08       	mov    %eax,0x804a850
 8048a27:	a1 50 a8 04 08       	mov    0x804a850,%eax
 8048a2c:	85 c0                	test   %eax,%eax
 8048a2e:	75 57                	jne    8048a87 <main+0xb3>
 8048a30:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048a33:	8b 42 04             	mov    0x4(%edx),%eax
 8048a36:	83 c0 04             	add    $0x4,%eax
 8048a39:	8b 10                	mov    (%eax),%edx
 8048a3b:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048a3e:	8b 41 04             	mov    0x4(%ecx),%eax
 8048a41:	8b 00                	mov    (%eax),%eax
 8048a43:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048a47:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048a4b:	c7 04 24 9a 98 04 08 	movl   $0x804989a,(%esp)
 8048a52:	e8 c1 fd ff ff       	call   8048818 <printf@plt>
 8048a57:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048a5e:	e8 e5 fd ff ff       	call   8048848 <exit@plt>
 8048a63:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048a66:	8b 42 04             	mov    0x4(%edx),%eax
 8048a69:	8b 00                	mov    (%eax),%eax
 8048a6b:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048a6f:	c7 04 24 b7 98 04 08 	movl   $0x80498b7,(%esp)
 8048a76:	e8 9d fd ff ff       	call   8048818 <printf@plt>
 8048a7b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048a82:	e8 c1 fd ff ff       	call   8048848 <exit@plt>
 8048a87:	e8 03 08 00 00       	call   804928f <initialize_bomb>
 8048a8c:	c7 04 24 d4 98 04 08 	movl   $0x80498d4,(%esp)
 8048a93:	e8 30 fd ff ff       	call   80487c8 <puts@plt>
 8048a98:	c7 04 24 10 99 04 08 	movl   $0x8049910,(%esp)
 8048a9f:	e8 24 fd ff ff       	call   80487c8 <puts@plt>
 8048aa4:	e8 a5 08 00 00       	call   804934e <read_line>
 8048aa9:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048aac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048aaf:	89 04 24             	mov    %eax,(%esp)
 8048ab2:	e8 c9 00 00 00       	call   8048b80 <phase_1>
 8048ab7:	e8 48 0c 00 00       	call   8049704 <phase_defused>
 8048abc:	c7 04 24 3c 99 04 08 	movl   $0x804993c,(%esp)
 8048ac3:	e8 00 fd ff ff       	call   80487c8 <puts@plt>
 8048ac8:	e8 81 08 00 00       	call   804934e <read_line>
 8048acd:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048ad0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048ad3:	89 04 24             	mov    %eax,(%esp)
 8048ad6:	e8 c9 00 00 00       	call   8048ba4 <phase_2>
 8048adb:	e8 24 0c 00 00       	call   8049704 <phase_defused>
 8048ae0:	c7 04 24 65 99 04 08 	movl   $0x8049965,(%esp)
 8048ae7:	e8 dc fc ff ff       	call   80487c8 <puts@plt>
 8048aec:	e8 5d 08 00 00       	call   804934e <read_line>
 8048af1:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048af4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048af7:	89 04 24             	mov    %eax,(%esp)
 8048afa:	e8 07 01 00 00       	call   8048c06 <phase_3>
 8048aff:	e8 00 0c 00 00       	call   8049704 <phase_defused>
 8048b04:	c7 04 24 83 99 04 08 	movl   $0x8049983,(%esp)
 8048b0b:	e8 b8 fc ff ff       	call   80487c8 <puts@plt>
 8048b10:	e8 39 08 00 00       	call   804934e <read_line>
 8048b15:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048b18:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048b1b:	89 04 24             	mov    %eax,(%esp)
 8048b1e:	e8 4f 02 00 00       	call   8048d72 <phase_4>
 8048b23:	e8 dc 0b 00 00       	call   8049704 <phase_defused>
 8048b28:	c7 04 24 94 99 04 08 	movl   $0x8049994,(%esp)
 8048b2f:	e8 94 fc ff ff       	call   80487c8 <puts@plt>
 8048b34:	e8 15 08 00 00       	call   804934e <read_line>
 8048b39:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048b3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048b3f:	89 04 24             	mov    %eax,(%esp)
 8048b42:	e8 7e 02 00 00       	call   8048dc5 <phase_5>
 8048b47:	e8 b8 0b 00 00       	call   8049704 <phase_defused>
 8048b4c:	c7 04 24 b8 99 04 08 	movl   $0x80499b8,(%esp)
 8048b53:	e8 70 fc ff ff       	call   80487c8 <puts@plt>
 8048b58:	e8 f1 07 00 00       	call   804934e <read_line>
 8048b5d:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048b60:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048b63:	89 04 24             	mov    %eax,(%esp)
 8048b66:	e8 5e 03 00 00       	call   8048ec9 <phase_6>
 8048b6b:	e8 94 0b 00 00       	call   8049704 <phase_defused>
 8048b70:	b8 00 00 00 00       	mov    $0x0,%eax
 8048b75:	83 c4 24             	add    $0x24,%esp
 8048b78:	59                   	pop    %ecx
 8048b79:	5d                   	pop    %ebp
 8048b7a:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048b7d:	c3                   	ret    
 8048b7e:	90                   	nop
 8048b7f:	90                   	nop

08048b80 <phase_1>:
 8048b80:	55                   	push   %ebp
 8048b81:	89 e5                	mov    %esp,%ebp
 8048b83:	83 ec 08             	sub    $0x8,%esp
 8048b86:	c7 44 24 04 d8 99 04 	movl   $0x80499d8,0x4(%esp)
 8048b8d:	08 
 8048b8e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b91:	89 04 24             	mov    %eax,(%esp)
 8048b94:	e8 7a 05 00 00       	call   8049113 <strings_not_equal>
 8048b99:	85 c0                	test   %eax,%eax
 8048b9b:	74 05                	je     8048ba2 <phase_1+0x22>
 8048b9d:	e8 38 0b 00 00       	call   80496da <explode_bomb>
 8048ba2:	c9                   	leave  
 8048ba3:	c3                   	ret    

08048ba4 <phase_2>:
 8048ba4:	55                   	push   %ebp
 8048ba5:	89 e5                	mov    %esp,%ebp
 8048ba7:	83 ec 28             	sub    $0x28,%esp
 8048baa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048bb1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 8048bb4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048bb8:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bbb:	89 04 24             	mov    %eax,(%esp)
 8048bbe:	e8 bd 04 00 00       	call   8049080 <read_six_numbers>
 8048bc3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8048bca:	eb 27                	jmp    8048bf3 <phase_2+0x4f>
 8048bcc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048bcf:	8b 54 85 e0          	mov    -0x20(%ebp,%eax,4),%edx
 8048bd3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048bd6:	83 c0 03             	add    $0x3,%eax
 8048bd9:	8b 44 85 e0          	mov    -0x20(%ebp,%eax,4),%eax
 8048bdd:	39 c2                	cmp    %eax,%edx
 8048bdf:	74 05                	je     8048be6 <phase_2+0x42>
 8048be1:	e8 f4 0a 00 00       	call   80496da <explode_bomb>
 8048be6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048be9:	8b 44 85 e0          	mov    -0x20(%ebp,%eax,4),%eax
 8048bed:	01 45 fc             	add    %eax,-0x4(%ebp)
 8048bf0:	ff 45 f8             	incl   -0x8(%ebp)
 8048bf3:	83 7d f8 02          	cmpl   $0x2,-0x8(%ebp)
 8048bf7:	7e d3                	jle    8048bcc <phase_2+0x28>
 8048bf9:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 8048bfd:	75 05                	jne    8048c04 <phase_2+0x60>
 8048bff:	e8 d6 0a 00 00       	call   80496da <explode_bomb>
 8048c04:	c9                   	leave  
 8048c05:	c3                   	ret    

08048c06 <phase_3>:
 8048c06:	55                   	push   %ebp
 8048c07:	89 e5                	mov    %esp,%ebp
 8048c09:	83 ec 38             	sub    $0x38,%esp
 8048c0c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8048c13:	8d 45 f0             	lea    -0x10(%ebp),%eax
 8048c16:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048c1a:	8d 45 ef             	lea    -0x11(%ebp),%eax
 8048c1d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048c21:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8048c24:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048c28:	c7 44 24 04 16 9a 04 	movl   $0x8049a16,0x4(%esp)
 8048c2f:	08 
 8048c30:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c33:	89 04 24             	mov    %eax,(%esp)
 8048c36:	e8 2d fc ff ff       	call   8048868 <sscanf@plt>
 8048c3b:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048c3e:	83 7d f8 02          	cmpl   $0x2,-0x8(%ebp)
 8048c42:	7f 05                	jg     8048c49 <phase_3+0x43>
 8048c44:	e8 91 0a 00 00       	call   80496da <explode_bomb>
 8048c49:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c4c:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8048c4f:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
 8048c53:	0f 87 c0 00 00 00    	ja     8048d19 <phase_3+0x113>
 8048c59:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8048c5c:	8b 04 95 20 9a 04 08 	mov    0x8049a20(,%edx,4),%eax
 8048c63:	ff e0                	jmp    *%eax
 8048c65:	c6 45 ff 6d          	movb   $0x6d,-0x1(%ebp)
 8048c69:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048c6c:	3d 9b 01 00 00       	cmp    $0x19b,%eax
 8048c71:	0f 84 ab 00 00 00    	je     8048d22 <phase_3+0x11c>
 8048c77:	e8 5e 0a 00 00       	call   80496da <explode_bomb>
 8048c7c:	e9 a1 00 00 00       	jmp    8048d22 <phase_3+0x11c>
 8048c81:	c6 45 ff 66          	movb   $0x66,-0x1(%ebp)
 8048c85:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048c88:	3d 81 00 00 00       	cmp    $0x81,%eax
 8048c8d:	0f 84 8f 00 00 00    	je     8048d22 <phase_3+0x11c>
 8048c93:	e8 42 0a 00 00       	call   80496da <explode_bomb>
 8048c98:	e9 85 00 00 00       	jmp    8048d22 <phase_3+0x11c>
 8048c9d:	c6 45 ff 6f          	movb   $0x6f,-0x1(%ebp)
 8048ca1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048ca4:	3d 24 01 00 00       	cmp    $0x124,%eax
 8048ca9:	74 77                	je     8048d22 <phase_3+0x11c>
 8048cab:	e8 2a 0a 00 00       	call   80496da <explode_bomb>
 8048cb0:	eb 70                	jmp    8048d22 <phase_3+0x11c>
 8048cb2:	c6 45 ff 70          	movb   $0x70,-0x1(%ebp)
 8048cb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048cb9:	3d 6f 01 00 00       	cmp    $0x16f,%eax
 8048cbe:	74 62                	je     8048d22 <phase_3+0x11c>
 8048cc0:	e8 15 0a 00 00       	call   80496da <explode_bomb>
 8048cc5:	eb 5b                	jmp    8048d22 <phase_3+0x11c>
 8048cc7:	c6 45 ff 67          	movb   $0x67,-0x1(%ebp)
 8048ccb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048cce:	3d 34 01 00 00       	cmp    $0x134,%eax
 8048cd3:	74 4d                	je     8048d22 <phase_3+0x11c>
 8048cd5:	e8 00 0a 00 00       	call   80496da <explode_bomb>
 8048cda:	eb 46                	jmp    8048d22 <phase_3+0x11c>
 8048cdc:	c6 45 ff 70          	movb   $0x70,-0x1(%ebp)
 8048ce0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048ce3:	3d 0e 03 00 00       	cmp    $0x30e,%eax
 8048ce8:	74 38                	je     8048d22 <phase_3+0x11c>
 8048cea:	e8 eb 09 00 00       	call   80496da <explode_bomb>
 8048cef:	eb 31                	jmp    8048d22 <phase_3+0x11c>
 8048cf1:	c6 45 ff 79          	movb   $0x79,-0x1(%ebp)
 8048cf5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048cf8:	3d 14 02 00 00       	cmp    $0x214,%eax
 8048cfd:	74 23                	je     8048d22 <phase_3+0x11c>
 8048cff:	e8 d6 09 00 00       	call   80496da <explode_bomb>
 8048d04:	eb 1c                	jmp    8048d22 <phase_3+0x11c>
 8048d06:	c6 45 ff 77          	movb   $0x77,-0x1(%ebp)
 8048d0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d0d:	83 f8 6e             	cmp    $0x6e,%eax
 8048d10:	74 10                	je     8048d22 <phase_3+0x11c>
 8048d12:	e8 c3 09 00 00       	call   80496da <explode_bomb>
 8048d17:	eb 09                	jmp    8048d22 <phase_3+0x11c>
 8048d19:	c6 45 ff 62          	movb   $0x62,-0x1(%ebp)
 8048d1d:	e8 b8 09 00 00       	call   80496da <explode_bomb>
 8048d22:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 8048d26:	38 45 ff             	cmp    %al,-0x1(%ebp)
 8048d29:	74 05                	je     8048d30 <phase_3+0x12a>
 8048d2b:	e8 aa 09 00 00       	call   80496da <explode_bomb>
 8048d30:	c9                   	leave  
 8048d31:	c3                   	ret    

08048d32 <func4>:
 8048d32:	55                   	push   %ebp
 8048d33:	89 e5                	mov    %esp,%ebp
 8048d35:	53                   	push   %ebx
 8048d36:	83 ec 08             	sub    $0x8,%esp
 8048d39:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 8048d3d:	7f 09                	jg     8048d48 <func4+0x16>
 8048d3f:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
 8048d46:	eb 21                	jmp    8048d69 <func4+0x37>
 8048d48:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d4b:	48                   	dec    %eax
 8048d4c:	89 04 24             	mov    %eax,(%esp)
 8048d4f:	e8 de ff ff ff       	call   8048d32 <func4>
 8048d54:	89 c3                	mov    %eax,%ebx
 8048d56:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d59:	83 e8 02             	sub    $0x2,%eax
 8048d5c:	89 04 24             	mov    %eax,(%esp)
 8048d5f:	e8 ce ff ff ff       	call   8048d32 <func4>
 8048d64:	01 c3                	add    %eax,%ebx
 8048d66:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 8048d69:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048d6c:	83 c4 08             	add    $0x8,%esp
 8048d6f:	5b                   	pop    %ebx
 8048d70:	5d                   	pop    %ebp
 8048d71:	c3                   	ret    

08048d72 <phase_4>:
 8048d72:	55                   	push   %ebp
 8048d73:	89 e5                	mov    %esp,%ebp
 8048d75:	83 ec 28             	sub    $0x28,%esp
 8048d78:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8048d7b:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048d7f:	c7 44 24 04 40 9a 04 	movl   $0x8049a40,0x4(%esp)
 8048d86:	08 
 8048d87:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d8a:	89 04 24             	mov    %eax,(%esp)
 8048d8d:	e8 d6 fa ff ff       	call   8048868 <sscanf@plt>
 8048d92:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048d95:	83 7d fc 01          	cmpl   $0x1,-0x4(%ebp)
 8048d99:	75 07                	jne    8048da2 <phase_4+0x30>
 8048d9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d9e:	85 c0                	test   %eax,%eax
 8048da0:	7f 05                	jg     8048da7 <phase_4+0x35>
 8048da2:	e8 33 09 00 00       	call   80496da <explode_bomb>
 8048da7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048daa:	89 04 24             	mov    %eax,(%esp)
 8048dad:	e8 80 ff ff ff       	call   8048d32 <func4>
 8048db2:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048db5:	81 7d f8 2f 45 00 00 	cmpl   $0x452f,-0x8(%ebp)
 8048dbc:	74 05                	je     8048dc3 <phase_4+0x51>
 8048dbe:	e8 17 09 00 00       	call   80496da <explode_bomb>
 8048dc3:	c9                   	leave  
 8048dc4:	c3                   	ret    

08048dc5 <phase_5>:
 8048dc5:	55                   	push   %ebp
 8048dc6:	89 e5                	mov    %esp,%ebp
 8048dc8:	83 ec 18             	sub    $0x18,%esp
 8048dcb:	8b 45 08             	mov    0x8(%ebp),%eax
 8048dce:	89 04 24             	mov    %eax,(%esp)
 8048dd1:	e8 13 03 00 00       	call   80490e9 <string_length>
 8048dd6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048dd9:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
 8048ddd:	74 05                	je     8048de4 <phase_5+0x1f>
 8048ddf:	e8 f6 08 00 00       	call   80496da <explode_bomb>
 8048de4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8048deb:	eb 20                	jmp    8048e0d <phase_5+0x48>
 8048ded:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048df0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048df3:	03 45 08             	add    0x8(%ebp),%eax
 8048df6:	0f b6 00             	movzbl (%eax),%eax
 8048df9:	0f be c0             	movsbl %al,%eax
 8048dfc:	83 e0 0f             	and    $0xf,%eax
 8048dff:	0f b6 80 c0 a5 04 08 	movzbl 0x804a5c0(%eax),%eax
 8048e06:	88 44 15 f1          	mov    %al,-0xf(%ebp,%edx,1)
 8048e0a:	ff 45 f8             	incl   -0x8(%ebp)
 8048e0d:	83 7d f8 05          	cmpl   $0x5,-0x8(%ebp)
 8048e11:	7e da                	jle    8048ded <phase_5+0x28>
 8048e13:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
 8048e17:	c7 44 24 04 43 9a 04 	movl   $0x8049a43,0x4(%esp)
 8048e1e:	08 
 8048e1f:	8d 45 f1             	lea    -0xf(%ebp),%eax
 8048e22:	89 04 24             	mov    %eax,(%esp)
 8048e25:	e8 e9 02 00 00       	call   8049113 <strings_not_equal>
 8048e2a:	85 c0                	test   %eax,%eax
 8048e2c:	74 05                	je     8048e33 <phase_5+0x6e>
 8048e2e:	e8 a7 08 00 00       	call   80496da <explode_bomb>
 8048e33:	c9                   	leave  
 8048e34:	c3                   	ret    

08048e35 <fun6>:
 8048e35:	55                   	push   %ebp
 8048e36:	89 e5                	mov    %esp,%ebp
 8048e38:	83 ec 10             	sub    $0x10,%esp
 8048e3b:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048e41:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e44:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048e47:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e4a:	8b 40 08             	mov    0x8(%eax),%eax
 8048e4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048e50:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e53:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 8048e5a:	eb 62                	jmp    8048ebe <fun6+0x89>
 8048e5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e5f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048e62:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048e65:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048e68:	eb 0f                	jmp    8048e79 <fun6+0x44>
 8048e6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e6d:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048e70:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e73:	8b 40 08             	mov    0x8(%eax),%eax
 8048e76:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048e79:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 8048e7d:	74 0e                	je     8048e8d <fun6+0x58>
 8048e7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e82:	8b 10                	mov    (%eax),%edx
 8048e84:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e87:	8b 00                	mov    (%eax),%eax
 8048e89:	39 c2                	cmp    %eax,%edx
 8048e8b:	7f dd                	jg     8048e6a <fun6+0x35>
 8048e8d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048e90:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8048e93:	74 0b                	je     8048ea0 <fun6+0x6b>
 8048e95:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048e98:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e9b:	89 42 08             	mov    %eax,0x8(%edx)
 8048e9e:	eb 06                	jmp    8048ea6 <fun6+0x71>
 8048ea0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ea3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048ea6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ea9:	8b 40 08             	mov    0x8(%eax),%eax
 8048eac:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048eaf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048eb2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048eb5:	89 42 08             	mov    %eax,0x8(%edx)
 8048eb8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048ebb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048ebe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048ec2:	75 98                	jne    8048e5c <fun6+0x27>
 8048ec4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048ec7:	c9                   	leave  
 8048ec8:	c3                   	ret    

08048ec9 <phase_6>:
 8048ec9:	55                   	push   %ebp
 8048eca:	89 e5                	mov    %esp,%ebp
 8048ecc:	83 ec 18             	sub    $0x18,%esp
 8048ecf:	c7 45 f8 3c a6 04 08 	movl   $0x804a63c,-0x8(%ebp)
 8048ed6:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ed9:	89 04 24             	mov    %eax,(%esp)
 8048edc:	e8 77 f9 ff ff       	call   8048858 <atoi@plt>
 8048ee1:	89 c2                	mov    %eax,%edx
 8048ee3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048ee6:	89 10                	mov    %edx,(%eax)
 8048ee8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048eeb:	89 04 24             	mov    %eax,(%esp)
 8048eee:	e8 42 ff ff ff       	call   8048e35 <fun6>
 8048ef3:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048ef6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048ef9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048efc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 8048f03:	eb 0c                	jmp    8048f11 <phase_6+0x48>
 8048f05:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048f08:	8b 40 08             	mov    0x8(%eax),%eax
 8048f0b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048f0e:	ff 45 f4             	incl   -0xc(%ebp)
 8048f11:	83 7d f4 08          	cmpl   $0x8,-0xc(%ebp)
 8048f15:	7e ee                	jle    8048f05 <phase_6+0x3c>
 8048f17:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048f1a:	8b 10                	mov    (%eax),%edx
 8048f1c:	a1 3c a6 04 08       	mov    0x804a63c,%eax
 8048f21:	39 c2                	cmp    %eax,%edx
 8048f23:	74 05                	je     8048f2a <phase_6+0x61>
 8048f25:	e8 b0 07 00 00       	call   80496da <explode_bomb>
 8048f2a:	c9                   	leave  
 8048f2b:	c3                   	ret    

08048f2c <fun7>:
 8048f2c:	55                   	push   %ebp
 8048f2d:	89 e5                	mov    %esp,%ebp
 8048f2f:	83 ec 0c             	sub    $0xc,%esp
 8048f32:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048f36:	75 09                	jne    8048f41 <fun7+0x15>
 8048f38:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%ebp)
 8048f3f:	eb 54                	jmp    8048f95 <fun7+0x69>
 8048f41:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f44:	8b 00                	mov    (%eax),%eax
 8048f46:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048f49:	7e 1c                	jle    8048f67 <fun7+0x3b>
 8048f4b:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f4e:	8b 50 04             	mov    0x4(%eax),%edx
 8048f51:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f54:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f58:	89 14 24             	mov    %edx,(%esp)
 8048f5b:	e8 cc ff ff ff       	call   8048f2c <fun7>
 8048f60:	01 c0                	add    %eax,%eax
 8048f62:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048f65:	eb 2e                	jmp    8048f95 <fun7+0x69>
 8048f67:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f6a:	8b 00                	mov    (%eax),%eax
 8048f6c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048f6f:	75 09                	jne    8048f7a <fun7+0x4e>
 8048f71:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048f78:	eb 1b                	jmp    8048f95 <fun7+0x69>
 8048f7a:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f7d:	8b 50 08             	mov    0x8(%eax),%edx
 8048f80:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f83:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f87:	89 14 24             	mov    %edx,(%esp)
 8048f8a:	e8 9d ff ff ff       	call   8048f2c <fun7>
 8048f8f:	01 c0                	add    %eax,%eax
 8048f91:	40                   	inc    %eax
 8048f92:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048f95:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048f98:	c9                   	leave  
 8048f99:	c3                   	ret    

08048f9a <secret_phase>:
 8048f9a:	55                   	push   %ebp
 8048f9b:	89 e5                	mov    %esp,%ebp
 8048f9d:	83 ec 18             	sub    $0x18,%esp
 8048fa0:	e8 a9 03 00 00       	call   804934e <read_line>
 8048fa5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048fa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048fab:	89 04 24             	mov    %eax,(%esp)
 8048fae:	e8 a5 f8 ff ff       	call   8048858 <atoi@plt>
 8048fb3:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048fb6:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 8048fba:	7e 09                	jle    8048fc5 <secret_phase+0x2b>
 8048fbc:	81 7d f8 e9 03 00 00 	cmpl   $0x3e9,-0x8(%ebp)
 8048fc3:	7e 05                	jle    8048fca <secret_phase+0x30>
 8048fc5:	e8 10 07 00 00       	call   80496da <explode_bomb>
 8048fca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048fcd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048fd1:	c7 04 24 f0 a6 04 08 	movl   $0x804a6f0,(%esp)
 8048fd8:	e8 4f ff ff ff       	call   8048f2c <fun7>
 8048fdd:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048fe0:	83 7d fc 02          	cmpl   $0x2,-0x4(%ebp)
 8048fe4:	74 05                	je     8048feb <secret_phase+0x51>
 8048fe6:	e8 ef 06 00 00       	call   80496da <explode_bomb>
 8048feb:	c7 04 24 4c 9a 04 08 	movl   $0x8049a4c,(%esp)
 8048ff2:	e8 d1 f7 ff ff       	call   80487c8 <puts@plt>
 8048ff7:	e8 08 07 00 00       	call   8049704 <phase_defused>
 8048ffc:	c9                   	leave  
 8048ffd:	c3                   	ret    
 8048ffe:	90                   	nop
 8048fff:	90                   	nop

08049000 <sig_handler>:
 8049000:	55                   	push   %ebp
 8049001:	89 e5                	mov    %esp,%ebp
 8049003:	83 ec 08             	sub    $0x8,%esp
 8049006:	c7 04 24 c4 9c 04 08 	movl   $0x8049cc4,(%esp)
 804900d:	e8 b6 f7 ff ff       	call   80487c8 <puts@plt>
 8049012:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8049019:	e8 ca f7 ff ff       	call   80487e8 <sleep@plt>
 804901e:	c7 04 24 fc 9c 04 08 	movl   $0x8049cfc,(%esp)
 8049025:	e8 ee f7 ff ff       	call   8048818 <printf@plt>
 804902a:	a1 40 a8 04 08       	mov    0x804a840,%eax
 804902f:	89 04 24             	mov    %eax,(%esp)
 8049032:	e8 51 f7 ff ff       	call   8048788 <fflush@plt>
 8049037:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804903e:	e8 a5 f7 ff ff       	call   80487e8 <sleep@plt>
 8049043:	c7 04 24 04 9d 04 08 	movl   $0x8049d04,(%esp)
 804904a:	e8 79 f7 ff ff       	call   80487c8 <puts@plt>
 804904f:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
 8049056:	e8 ed f7 ff ff       	call   8048848 <exit@plt>

0804905b <invalid_phase>:
 804905b:	55                   	push   %ebp
 804905c:	89 e5                	mov    %esp,%ebp
 804905e:	83 ec 08             	sub    $0x8,%esp
 8049061:	8b 45 08             	mov    0x8(%ebp),%eax
 8049064:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049068:	c7 04 24 0c 9d 04 08 	movl   $0x8049d0c,(%esp)
 804906f:	e8 a4 f7 ff ff       	call   8048818 <printf@plt>
 8049074:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 804907b:	e8 c8 f7 ff ff       	call   8048848 <exit@plt>

08049080 <read_six_numbers>:
 8049080:	55                   	push   %ebp
 8049081:	89 e5                	mov    %esp,%ebp
 8049083:	56                   	push   %esi
 8049084:	53                   	push   %ebx
 8049085:	83 ec 30             	sub    $0x30,%esp
 8049088:	8b 45 0c             	mov    0xc(%ebp),%eax
 804908b:	83 c0 14             	add    $0x14,%eax
 804908e:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049091:	83 c2 10             	add    $0x10,%edx
 8049094:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8049097:	83 c1 0c             	add    $0xc,%ecx
 804909a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804909d:	83 c3 08             	add    $0x8,%ebx
 80490a0:	8b 75 0c             	mov    0xc(%ebp),%esi
 80490a3:	83 c6 04             	add    $0x4,%esi
 80490a6:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 80490aa:	89 54 24 18          	mov    %edx,0x18(%esp)
 80490ae:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 80490b2:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 80490b6:	89 74 24 0c          	mov    %esi,0xc(%esp)
 80490ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490bd:	89 44 24 08          	mov    %eax,0x8(%esp)
 80490c1:	c7 44 24 04 1d 9d 04 	movl   $0x8049d1d,0x4(%esp)
 80490c8:	08 
 80490c9:	8b 45 08             	mov    0x8(%ebp),%eax
 80490cc:	89 04 24             	mov    %eax,(%esp)
 80490cf:	e8 94 f7 ff ff       	call   8048868 <sscanf@plt>
 80490d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80490d7:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
 80490db:	7f 05                	jg     80490e2 <read_six_numbers+0x62>
 80490dd:	e8 f8 05 00 00       	call   80496da <explode_bomb>
 80490e2:	83 c4 30             	add    $0x30,%esp
 80490e5:	5b                   	pop    %ebx
 80490e6:	5e                   	pop    %esi
 80490e7:	5d                   	pop    %ebp
 80490e8:	c3                   	ret    

080490e9 <string_length>:
 80490e9:	55                   	push   %ebp
 80490ea:	89 e5                	mov    %esp,%ebp
 80490ec:	83 ec 10             	sub    $0x10,%esp
 80490ef:	8b 45 08             	mov    0x8(%ebp),%eax
 80490f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80490f5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 80490fc:	eb 06                	jmp    8049104 <string_length+0x1b>
 80490fe:	ff 45 fc             	incl   -0x4(%ebp)
 8049101:	ff 45 f8             	incl   -0x8(%ebp)
 8049104:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049107:	0f b6 00             	movzbl (%eax),%eax
 804910a:	84 c0                	test   %al,%al
 804910c:	75 f0                	jne    80490fe <string_length+0x15>
 804910e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049111:	c9                   	leave  
 8049112:	c3                   	ret    

08049113 <strings_not_equal>:
 8049113:	55                   	push   %ebp
 8049114:	89 e5                	mov    %esp,%ebp
 8049116:	53                   	push   %ebx
 8049117:	83 ec 18             	sub    $0x18,%esp
 804911a:	8b 45 08             	mov    0x8(%ebp),%eax
 804911d:	89 04 24             	mov    %eax,(%esp)
 8049120:	e8 c4 ff ff ff       	call   80490e9 <string_length>
 8049125:	89 c3                	mov    %eax,%ebx
 8049127:	8b 45 0c             	mov    0xc(%ebp),%eax
 804912a:	89 04 24             	mov    %eax,(%esp)
 804912d:	e8 b7 ff ff ff       	call   80490e9 <string_length>
 8049132:	39 c3                	cmp    %eax,%ebx
 8049134:	74 09                	je     804913f <strings_not_equal+0x2c>
 8049136:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
 804913d:	eb 3e                	jmp    804917d <strings_not_equal+0x6a>
 804913f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049142:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049145:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049148:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804914b:	eb 1f                	jmp    804916c <strings_not_equal+0x59>
 804914d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049150:	0f b6 10             	movzbl (%eax),%edx
 8049153:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049156:	0f b6 00             	movzbl (%eax),%eax
 8049159:	38 c2                	cmp    %al,%dl
 804915b:	74 09                	je     8049166 <strings_not_equal+0x53>
 804915d:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
 8049164:	eb 17                	jmp    804917d <strings_not_equal+0x6a>
 8049166:	ff 45 f4             	incl   -0xc(%ebp)
 8049169:	ff 45 f8             	incl   -0x8(%ebp)
 804916c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804916f:	0f b6 00             	movzbl (%eax),%eax
 8049172:	84 c0                	test   %al,%al
 8049174:	75 d7                	jne    804914d <strings_not_equal+0x3a>
 8049176:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804917d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049180:	83 c4 18             	add    $0x18,%esp
 8049183:	5b                   	pop    %ebx
 8049184:	5d                   	pop    %ebp
 8049185:	c3                   	ret    

08049186 <open_clientfd>:
 8049186:	55                   	push   %ebp
 8049187:	89 e5                	mov    %esp,%ebp
 8049189:	83 ec 38             	sub    $0x38,%esp
 804918c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8049193:	00 
 8049194:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804919b:	00 
 804919c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80491a3:	e8 30 f7 ff ff       	call   80488d8 <socket@plt>
 80491a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80491ab:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 80491af:	79 18                	jns    80491c9 <open_clientfd+0x43>
 80491b1:	c7 04 24 2f 9d 04 08 	movl   $0x8049d2f,(%esp)
 80491b8:	e8 0b f6 ff ff       	call   80487c8 <puts@plt>
 80491bd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80491c4:	e8 7f f6 ff ff       	call   8048848 <exit@plt>
 80491c9:	8b 45 08             	mov    0x8(%ebp),%eax
 80491cc:	89 04 24             	mov    %eax,(%esp)
 80491cf:	e8 64 f6 ff ff       	call   8048838 <gethostbyname@plt>
 80491d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80491d7:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 80491db:	75 18                	jne    80491f5 <open_clientfd+0x6f>
 80491dd:	c7 04 24 3d 9d 04 08 	movl   $0x8049d3d,(%esp)
 80491e4:	e8 df f5 ff ff       	call   80487c8 <puts@plt>
 80491e9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80491f0:	e8 53 f6 ff ff       	call   8048848 <exit@plt>
 80491f5:	8d 45 e8             	lea    -0x18(%ebp),%eax
 80491f8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 80491fe:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8049205:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 804920c:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
 8049213:	66 c7 45 e8 02 00    	movw   $0x2,-0x18(%ebp)
 8049219:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804921c:	8b 40 0c             	mov    0xc(%eax),%eax
 804921f:	89 c1                	mov    %eax,%ecx
 8049221:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8049224:	8d 50 04             	lea    0x4(%eax),%edx
 8049227:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804922a:	8b 40 10             	mov    0x10(%eax),%eax
 804922d:	8b 00                	mov    (%eax),%eax
 804922f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049233:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049237:	89 04 24             	mov    %eax,(%esp)
 804923a:	e8 59 f5 ff ff       	call   8048798 <bcopy@plt>
 804923f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049242:	0f b7 c0             	movzwl %ax,%eax
 8049245:	89 04 24             	mov    %eax,(%esp)
 8049248:	e8 2b f6 ff ff       	call   8048878 <htons@plt>
 804924d:	0f b7 c0             	movzwl %ax,%eax
 8049250:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
 8049254:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8049257:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 804925e:	00 
 804925f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049263:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049266:	89 04 24             	mov    %eax,(%esp)
 8049269:	e8 1a f6 ff ff       	call   8048888 <connect@plt>
 804926e:	85 c0                	test   %eax,%eax
 8049270:	79 18                	jns    804928a <open_clientfd+0x104>
 8049272:	c7 04 24 4b 9d 04 08 	movl   $0x8049d4b,(%esp)
 8049279:	e8 4a f5 ff ff       	call   80487c8 <puts@plt>
 804927e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049285:	e8 be f5 ff ff       	call   8048848 <exit@plt>
 804928a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804928d:	c9                   	leave  
 804928e:	c3                   	ret    

0804928f <initialize_bomb>:
 804928f:	55                   	push   %ebp
 8049290:	89 e5                	mov    %esp,%ebp
 8049292:	83 ec 08             	sub    $0x8,%esp
 8049295:	c7 44 24 04 00 90 04 	movl   $0x8049000,0x4(%esp)
 804929c:	08 
 804929d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80492a4:	e8 cf f4 ff ff       	call   8048778 <signal@plt>
 80492a9:	c9                   	leave  
 80492aa:	c3                   	ret    

080492ab <blank_line>:
 80492ab:	55                   	push   %ebp
 80492ac:	89 e5                	mov    %esp,%ebp
 80492ae:	83 ec 08             	sub    $0x8,%esp
 80492b1:	eb 32                	jmp    80492e5 <blank_line+0x3a>
 80492b3:	e8 30 f6 ff ff       	call   80488e8 <__ctype_b_loc@plt>
 80492b8:	8b 10                	mov    (%eax),%edx
 80492ba:	8b 45 08             	mov    0x8(%ebp),%eax
 80492bd:	0f b6 00             	movzbl (%eax),%eax
 80492c0:	0f be c0             	movsbl %al,%eax
 80492c3:	01 c0                	add    %eax,%eax
 80492c5:	8d 04 02             	lea    (%edx,%eax,1),%eax
 80492c8:	0f b7 00             	movzwl (%eax),%eax
 80492cb:	25 00 20 00 00       	and    $0x2000,%eax
 80492d0:	85 c0                	test   %eax,%eax
 80492d2:	0f 94 c0             	sete   %al
 80492d5:	ff 45 08             	incl   0x8(%ebp)
 80492d8:	84 c0                	test   %al,%al
 80492da:	74 09                	je     80492e5 <blank_line+0x3a>
 80492dc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 80492e3:	eb 11                	jmp    80492f6 <blank_line+0x4b>
 80492e5:	8b 45 08             	mov    0x8(%ebp),%eax
 80492e8:	0f b6 00             	movzbl (%eax),%eax
 80492eb:	84 c0                	test   %al,%al
 80492ed:	75 c4                	jne    80492b3 <blank_line+0x8>
 80492ef:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
 80492f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492f9:	c9                   	leave  
 80492fa:	c3                   	ret    

080492fb <skip>:
 80492fb:	55                   	push   %ebp
 80492fc:	89 e5                	mov    %esp,%ebp
 80492fe:	83 ec 28             	sub    $0x28,%esp
 8049301:	8b 0d 50 a8 04 08    	mov    0x804a850,%ecx
 8049307:	a1 4c a8 04 08       	mov    0x804a84c,%eax
 804930c:	89 c2                	mov    %eax,%edx
 804930e:	89 d0                	mov    %edx,%eax
 8049310:	c1 e0 02             	shl    $0x2,%eax
 8049313:	01 d0                	add    %edx,%eax
 8049315:	c1 e0 04             	shl    $0x4,%eax
 8049318:	05 60 a8 04 08       	add    $0x804a860,%eax
 804931d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049321:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
 8049328:	00 
 8049329:	89 04 24             	mov    %eax,(%esp)
 804932c:	e8 a7 f4 ff ff       	call   80487d8 <fgets@plt>
 8049331:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049334:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 8049338:	74 0f                	je     8049349 <skip+0x4e>
 804933a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804933d:	89 04 24             	mov    %eax,(%esp)
 8049340:	e8 66 ff ff ff       	call   80492ab <blank_line>
 8049345:	85 c0                	test   %eax,%eax
 8049347:	75 b8                	jne    8049301 <skip+0x6>
 8049349:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804934c:	c9                   	leave  
 804934d:	c3                   	ret    

0804934e <read_line>:
 804934e:	55                   	push   %ebp
 804934f:	89 e5                	mov    %esp,%ebp
 8049351:	57                   	push   %edi
 8049352:	83 ec 24             	sub    $0x24,%esp
 8049355:	e8 a1 ff ff ff       	call   80492fb <skip>
 804935a:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804935d:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 8049361:	75 67                	jne    80493ca <read_line+0x7c>
 8049363:	8b 15 50 a8 04 08    	mov    0x804a850,%edx
 8049369:	a1 44 a8 04 08       	mov    0x804a844,%eax
 804936e:	39 c2                	cmp    %eax,%edx
 8049370:	75 13                	jne    8049385 <read_line+0x37>
 8049372:	c7 04 24 59 9d 04 08 	movl   $0x8049d59,(%esp)
 8049379:	e8 4a f4 ff ff       	call   80487c8 <puts@plt>
 804937e:	e8 57 03 00 00       	call   80496da <explode_bomb>
 8049383:	eb 45                	jmp    80493ca <read_line+0x7c>
 8049385:	c7 04 24 77 9d 04 08 	movl   $0x8049d77,(%esp)
 804938c:	e8 d7 f3 ff ff       	call   8048768 <getenv@plt>
 8049391:	85 c0                	test   %eax,%eax
 8049393:	74 0c                	je     80493a1 <read_line+0x53>
 8049395:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804939c:	e8 a7 f4 ff ff       	call   8048848 <exit@plt>
 80493a1:	a1 44 a8 04 08       	mov    0x804a844,%eax
 80493a6:	a3 50 a8 04 08       	mov    %eax,0x804a850
 80493ab:	e8 4b ff ff ff       	call   80492fb <skip>
 80493b0:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80493b3:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 80493b7:	75 11                	jne    80493ca <read_line+0x7c>
 80493b9:	c7 04 24 59 9d 04 08 	movl   $0x8049d59,(%esp)
 80493c0:	e8 03 f4 ff ff       	call   80487c8 <puts@plt>
 80493c5:	e8 10 03 00 00       	call   80496da <explode_bomb>
 80493ca:	a1 4c a8 04 08       	mov    0x804a84c,%eax
 80493cf:	89 c2                	mov    %eax,%edx
 80493d1:	89 d0                	mov    %edx,%eax
 80493d3:	c1 e0 02             	shl    $0x2,%eax
 80493d6:	01 d0                	add    %edx,%eax
 80493d8:	c1 e0 04             	shl    $0x4,%eax
 80493db:	05 60 a8 04 08       	add    $0x804a860,%eax
 80493e0:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 80493e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80493e8:	b0 00                	mov    $0x0,%al
 80493ea:	fc                   	cld    
 80493eb:	8b 7d e8             	mov    -0x18(%ebp),%edi
 80493ee:	f2 ae                	repnz scas %es:(%edi),%al
 80493f0:	89 c8                	mov    %ecx,%eax
 80493f2:	f7 d0                	not    %eax
 80493f4:	48                   	dec    %eax
 80493f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80493f8:	83 7d f4 4f          	cmpl   $0x4f,-0xc(%ebp)
 80493fc:	75 11                	jne    804940f <read_line+0xc1>
 80493fe:	c7 04 24 82 9d 04 08 	movl   $0x8049d82,(%esp)
 8049405:	e8 be f3 ff ff       	call   80487c8 <puts@plt>
 804940a:	e8 cb 02 00 00       	call   80496da <explode_bomb>
 804940f:	8b 15 4c a8 04 08    	mov    0x804a84c,%edx
 8049415:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8049418:	49                   	dec    %ecx
 8049419:	89 d0                	mov    %edx,%eax
 804941b:	c1 e0 02             	shl    $0x2,%eax
 804941e:	01 d0                	add    %edx,%eax
 8049420:	c1 e0 04             	shl    $0x4,%eax
 8049423:	01 c8                	add    %ecx,%eax
 8049425:	05 60 a8 04 08       	add    $0x804a860,%eax
 804942a:	c6 00 00             	movb   $0x0,(%eax)
 804942d:	8b 0d 4c a8 04 08    	mov    0x804a84c,%ecx
 8049433:	89 ca                	mov    %ecx,%edx
 8049435:	89 d0                	mov    %edx,%eax
 8049437:	c1 e0 02             	shl    $0x2,%eax
 804943a:	01 d0                	add    %edx,%eax
 804943c:	c1 e0 04             	shl    $0x4,%eax
 804943f:	05 60 a8 04 08       	add    $0x804a860,%eax
 8049444:	89 c2                	mov    %eax,%edx
 8049446:	8d 41 01             	lea    0x1(%ecx),%eax
 8049449:	a3 4c a8 04 08       	mov    %eax,0x804a84c
 804944e:	89 d0                	mov    %edx,%eax
 8049450:	83 c4 24             	add    $0x24,%esp
 8049453:	5f                   	pop    %edi
 8049454:	5d                   	pop    %ebp
 8049455:	c3                   	ret    

08049456 <send_msg>:
 8049456:	55                   	push   %ebp
 8049457:	89 e5                	mov    %esp,%ebp
 8049459:	81 ec 88 00 00 00    	sub    $0x88,%esp
 804945f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049466:	e8 3d f4 ff ff       	call   80488a8 <dup@plt>
 804946b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804946e:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
 8049472:	75 18                	jne    804948c <send_msg+0x36>
 8049474:	c7 04 24 9d 9d 04 08 	movl   $0x8049d9d,(%esp)
 804947b:	e8 48 f3 ff ff       	call   80487c8 <puts@plt>
 8049480:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049487:	e8 bc f3 ff ff       	call   8048848 <exit@plt>
 804948c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049493:	e8 a0 f2 ff ff       	call   8048738 <close@plt>
 8049498:	83 f8 ff             	cmp    $0xffffffff,%eax
 804949b:	75 18                	jne    80494b5 <send_msg+0x5f>
 804949d:	c7 04 24 b1 9d 04 08 	movl   $0x8049db1,(%esp)
 80494a4:	e8 1f f3 ff ff       	call   80487c8 <puts@plt>
 80494a9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80494b0:	e8 93 f3 ff ff       	call   8048848 <exit@plt>
 80494b5:	e8 9e f2 ff ff       	call   8048758 <tmpfile@plt>
 80494ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80494bd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80494c1:	75 18                	jne    80494db <send_msg+0x85>
 80494c3:	c7 04 24 c4 9d 04 08 	movl   $0x8049dc4,(%esp)
 80494ca:	e8 f9 f2 ff ff       	call   80487c8 <puts@plt>
 80494cf:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80494d6:	e8 6d f3 ff ff       	call   8048848 <exit@plt>
 80494db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80494de:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80494e2:	c7 44 24 08 1b 00 00 	movl   $0x1b,0x8(%esp)
 80494e9:	00 
 80494ea:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80494f1:	00 
 80494f2:	c7 04 24 d9 9d 04 08 	movl   $0x8049dd9,(%esp)
 80494f9:	e8 ca f3 ff ff       	call   80488c8 <fwrite@plt>
 80494fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049501:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049505:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 804950c:	e8 e7 f2 ff ff       	call   80487f8 <fputc@plt>
 8049511:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049518:	e8 db f3 ff ff       	call   80488f8 <cuserid@plt>
 804951d:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049520:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 8049524:	75 15                	jne    804953b <send_msg+0xe5>
 8049526:	8d 45 a0             	lea    -0x60(%ebp),%eax
 8049529:	c7 00 6e 6f 62 6f    	movl   $0x6f626f6e,(%eax)
 804952f:	66 c7 40 04 64 79    	movw   $0x7964,0x4(%eax)
 8049535:	c6 40 06 00          	movb   $0x0,0x6(%eax)
 8049539:	eb 12                	jmp    804954d <send_msg+0xf7>
 804953b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804953e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049542:	8d 45 a0             	lea    -0x60(%ebp),%eax
 8049545:	89 04 24             	mov    %eax,(%esp)
 8049548:	e8 cb f3 ff ff       	call   8048918 <strcpy@plt>
 804954d:	a1 4c a8 04 08       	mov    0x804a84c,%eax
 8049552:	89 45 98             	mov    %eax,-0x68(%ebp)
 8049555:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049559:	74 09                	je     8049564 <send_msg+0x10e>
 804955b:	c7 45 9c f5 9d 04 08 	movl   $0x8049df5,-0x64(%ebp)
 8049562:	eb 07                	jmp    804956b <send_msg+0x115>
 8049564:	c7 45 9c fd 9d 04 08 	movl   $0x8049dfd,-0x64(%ebp)
 804956b:	a1 a0 a1 04 08       	mov    0x804a1a0,%eax
 8049570:	8b 55 98             	mov    -0x68(%ebp),%edx
 8049573:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049577:	8b 55 9c             	mov    -0x64(%ebp),%edx
 804957a:	89 54 24 14          	mov    %edx,0x14(%esp)
 804957e:	8d 55 a0             	lea    -0x60(%ebp),%edx
 8049581:	89 54 24 10          	mov    %edx,0x10(%esp)
 8049585:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049589:	c7 44 24 08 c0 a1 04 	movl   $0x804a1c0,0x8(%esp)
 8049590:	08 
 8049591:	c7 44 24 04 06 9e 04 	movl   $0x8049e06,0x4(%esp)
 8049598:	08 
 8049599:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804959c:	89 04 24             	mov    %eax,(%esp)
 804959f:	e8 a4 f1 ff ff       	call   8048748 <fprintf@plt>
 80495a4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80495ab:	eb 4d                	jmp    80495fa <send_msg+0x1a4>
 80495ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80495b0:	89 d0                	mov    %edx,%eax
 80495b2:	c1 e0 02             	shl    $0x2,%eax
 80495b5:	01 d0                	add    %edx,%eax
 80495b7:	c1 e0 04             	shl    $0x4,%eax
 80495ba:	05 60 a8 04 08       	add    $0x804a860,%eax
 80495bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80495c2:	42                   	inc    %edx
 80495c3:	8b 0d a0 a1 04 08    	mov    0x804a1a0,%ecx
 80495c9:	89 44 24 18          	mov    %eax,0x18(%esp)
 80495cd:	89 54 24 14          	mov    %edx,0x14(%esp)
 80495d1:	8d 45 a0             	lea    -0x60(%ebp),%eax
 80495d4:	89 44 24 10          	mov    %eax,0x10(%esp)
 80495d8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 80495dc:	c7 44 24 08 c0 a1 04 	movl   $0x804a1c0,0x8(%esp)
 80495e3:	08 
 80495e4:	c7 44 24 04 22 9e 04 	movl   $0x8049e22,0x4(%esp)
 80495eb:	08 
 80495ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80495ef:	89 04 24             	mov    %eax,(%esp)
 80495f2:	e8 51 f1 ff ff       	call   8048748 <fprintf@plt>
 80495f7:	ff 45 f4             	incl   -0xc(%ebp)
 80495fa:	a1 4c a8 04 08       	mov    0x804a84c,%eax
 80495ff:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8049602:	7c a9                	jl     80495ad <send_msg+0x157>
 8049604:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049607:	89 04 24             	mov    %eax,(%esp)
 804960a:	e8 99 f1 ff ff       	call   80487a8 <rewind@plt>
 804960f:	c7 44 24 10 89 9a 04 	movl   $0x8049a89,0x10(%esp)
 8049616:	08 
 8049617:	c7 44 24 0c 3e 9e 04 	movl   $0x8049e3e,0xc(%esp)
 804961e:	08 
 804961f:	c7 44 24 08 43 9e 04 	movl   $0x8049e43,0x8(%esp)
 8049626:	08 
 8049627:	c7 44 24 04 5a 9e 04 	movl   $0x8049e5a,0x4(%esp)
 804962e:	08 
 804962f:	c7 04 24 a0 ae 04 08 	movl   $0x804aea0,(%esp)
 8049636:	e8 7d f2 ff ff       	call   80488b8 <sprintf@plt>
 804963b:	c7 04 24 a0 ae 04 08 	movl   $0x804aea0,(%esp)
 8049642:	e8 71 f1 ff ff       	call   80487b8 <system@plt>
 8049647:	85 c0                	test   %eax,%eax
 8049649:	74 18                	je     8049663 <send_msg+0x20d>
 804964b:	c7 04 24 63 9e 04 08 	movl   $0x8049e63,(%esp)
 8049652:	e8 71 f1 ff ff       	call   80487c8 <puts@plt>
 8049657:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 804965e:	e8 e5 f1 ff ff       	call   8048848 <exit@plt>
 8049663:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049666:	89 04 24             	mov    %eax,(%esp)
 8049669:	e8 ba f1 ff ff       	call   8048828 <fclose@plt>
 804966e:	85 c0                	test   %eax,%eax
 8049670:	74 18                	je     804968a <send_msg+0x234>
 8049672:	c7 04 24 7d 9e 04 08 	movl   $0x8049e7d,(%esp)
 8049679:	e8 4a f1 ff ff       	call   80487c8 <puts@plt>
 804967e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049685:	e8 be f1 ff ff       	call   8048848 <exit@plt>
 804968a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804968d:	89 04 24             	mov    %eax,(%esp)
 8049690:	e8 13 f2 ff ff       	call   80488a8 <dup@plt>
 8049695:	85 c0                	test   %eax,%eax
 8049697:	74 18                	je     80496b1 <send_msg+0x25b>
 8049699:	c7 04 24 96 9e 04 08 	movl   $0x8049e96,(%esp)
 80496a0:	e8 23 f1 ff ff       	call   80487c8 <puts@plt>
 80496a5:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80496ac:	e8 97 f1 ff ff       	call   8048848 <exit@plt>
 80496b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80496b4:	89 04 24             	mov    %eax,(%esp)
 80496b7:	e8 7c f0 ff ff       	call   8048738 <close@plt>
 80496bc:	85 c0                	test   %eax,%eax
 80496be:	74 18                	je     80496d8 <send_msg+0x282>
 80496c0:	c7 04 24 b1 9e 04 08 	movl   $0x8049eb1,(%esp)
 80496c7:	e8 fc f0 ff ff       	call   80487c8 <puts@plt>
 80496cc:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80496d3:	e8 70 f1 ff ff       	call   8048848 <exit@plt>
 80496d8:	c9                   	leave  
 80496d9:	c3                   	ret    

080496da <explode_bomb>:
 80496da:	55                   	push   %ebp
 80496db:	89 e5                	mov    %esp,%ebp
 80496dd:	83 ec 08             	sub    $0x8,%esp
 80496e0:	c7 04 24 c8 9e 04 08 	movl   $0x8049ec8,(%esp)
 80496e7:	e8 dc f0 ff ff       	call   80487c8 <puts@plt>
 80496ec:	c7 04 24 d1 9e 04 08 	movl   $0x8049ed1,(%esp)
 80496f3:	e8 d0 f0 ff ff       	call   80487c8 <puts@plt>
 80496f8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80496ff:	e8 44 f1 ff ff       	call   8048848 <exit@plt>

08049704 <phase_defused>:
 8049704:	55                   	push   %ebp
 8049705:	89 e5                	mov    %esp,%ebp
 8049707:	83 ec 78             	sub    $0x78,%esp
 804970a:	a1 4c a8 04 08       	mov    0x804a84c,%eax
 804970f:	83 f8 06             	cmp    $0x6,%eax
 8049712:	75 6e                	jne    8049782 <phase_defused+0x7e>
 8049714:	b8 50 a9 04 08       	mov    $0x804a950,%eax
 8049719:	89 c2                	mov    %eax,%edx
 804971b:	8d 45 ac             	lea    -0x54(%ebp),%eax
 804971e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049722:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8049725:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049729:	c7 44 24 04 e8 9e 04 	movl   $0x8049ee8,0x4(%esp)
 8049730:	08 
 8049731:	89 14 24             	mov    %edx,(%esp)
 8049734:	e8 2f f1 ff ff       	call   8048868 <sscanf@plt>
 8049739:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804973c:	83 7d fc 02          	cmpl   $0x2,-0x4(%ebp)
 8049740:	75 34                	jne    8049776 <phase_defused+0x72>
 8049742:	c7 44 24 04 ee 9e 04 	movl   $0x8049eee,0x4(%esp)
 8049749:	08 
 804974a:	8d 45 ac             	lea    -0x54(%ebp),%eax
 804974d:	89 04 24             	mov    %eax,(%esp)
 8049750:	e8 be f9 ff ff       	call   8049113 <strings_not_equal>
 8049755:	85 c0                	test   %eax,%eax
 8049757:	75 1d                	jne    8049776 <phase_defused+0x72>
 8049759:	c7 04 24 fc 9e 04 08 	movl   $0x8049efc,(%esp)
 8049760:	e8 63 f0 ff ff       	call   80487c8 <puts@plt>
 8049765:	c7 04 24 24 9f 04 08 	movl   $0x8049f24,(%esp)
 804976c:	e8 57 f0 ff ff       	call   80487c8 <puts@plt>
 8049771:	e8 24 f8 ff ff       	call   8048f9a <secret_phase>
 8049776:	c7 04 24 5c 9f 04 08 	movl   $0x8049f5c,(%esp)
 804977d:	e8 46 f0 ff ff       	call   80487c8 <puts@plt>
 8049782:	c9                   	leave  
 8049783:	c3                   	ret    
 8049784:	90                   	nop
 8049785:	90                   	nop
 8049786:	90                   	nop
 8049787:	90                   	nop
 8049788:	90                   	nop
 8049789:	90                   	nop
 804978a:	90                   	nop
 804978b:	90                   	nop
 804978c:	90                   	nop
 804978d:	90                   	nop
 804978e:	90                   	nop
 804978f:	90                   	nop

08049790 <__libc_csu_fini>:
 8049790:	55                   	push   %ebp
 8049791:	89 e5                	mov    %esp,%ebp
 8049793:	57                   	push   %edi
 8049794:	56                   	push   %esi
 8049795:	53                   	push   %ebx
 8049796:	e8 98 00 00 00       	call   8049833 <__i686.get_pc_thunk.bx>
 804979b:	81 c3 45 09 00 00    	add    $0x945,%ebx
 80497a1:	83 ec 0c             	sub    $0xc,%esp
 80497a4:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 80497aa:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 80497b0:	29 f8                	sub    %edi,%eax
 80497b2:	c1 f8 02             	sar    $0x2,%eax
 80497b5:	8d 70 ff             	lea    -0x1(%eax),%esi
 80497b8:	83 fe ff             	cmp    $0xffffffff,%esi
 80497bb:	74 0c                	je     80497c9 <__libc_csu_fini+0x39>
 80497bd:	8d 76 00             	lea    0x0(%esi),%esi
 80497c0:	ff 14 b7             	call   *(%edi,%esi,4)
 80497c3:	4e                   	dec    %esi
 80497c4:	83 fe ff             	cmp    $0xffffffff,%esi
 80497c7:	75 f7                	jne    80497c0 <__libc_csu_fini+0x30>
 80497c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80497d0:	e8 9f 00 00 00       	call   8049874 <_fini>
 80497d5:	83 c4 0c             	add    $0xc,%esp
 80497d8:	5b                   	pop    %ebx
 80497d9:	5e                   	pop    %esi
 80497da:	5f                   	pop    %edi
 80497db:	5d                   	pop    %ebp
 80497dc:	c3                   	ret    
 80497dd:	8d 76 00             	lea    0x0(%esi),%esi

080497e0 <__libc_csu_init>:
 80497e0:	55                   	push   %ebp
 80497e1:	89 e5                	mov    %esp,%ebp
 80497e3:	57                   	push   %edi
 80497e4:	56                   	push   %esi
 80497e5:	53                   	push   %ebx
 80497e6:	e8 48 00 00 00       	call   8049833 <__i686.get_pc_thunk.bx>
 80497eb:	81 c3 f5 08 00 00    	add    $0x8f5,%ebx
 80497f1:	83 ec 0c             	sub    $0xc,%esp
 80497f4:	e8 17 ef ff ff       	call   8048710 <_init>
 80497f9:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 80497ff:	8d 93 20 ff ff ff    	lea    -0xe0(%ebx),%edx
 8049805:	29 d0                	sub    %edx,%eax
 8049807:	c1 f8 02             	sar    $0x2,%eax
 804980a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804980d:	74 1c                	je     804982b <__libc_csu_init+0x4b>
 804980f:	31 ff                	xor    %edi,%edi
 8049811:	89 d6                	mov    %edx,%esi
 8049813:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8049820:	47                   	inc    %edi
 8049821:	ff 16                	call   *(%esi)
 8049823:	83 c6 04             	add    $0x4,%esi
 8049826:	39 7d f0             	cmp    %edi,-0x10(%ebp)
 8049829:	75 f5                	jne    8049820 <__libc_csu_init+0x40>
 804982b:	83 c4 0c             	add    $0xc,%esp
 804982e:	5b                   	pop    %ebx
 804982f:	5e                   	pop    %esi
 8049830:	5f                   	pop    %edi
 8049831:	5d                   	pop    %ebp
 8049832:	c3                   	ret    

08049833 <__i686.get_pc_thunk.bx>:
 8049833:	8b 1c 24             	mov    (%esp),%ebx
 8049836:	c3                   	ret    
 8049837:	90                   	nop
 8049838:	90                   	nop
 8049839:	90                   	nop
 804983a:	90                   	nop
 804983b:	90                   	nop
 804983c:	90                   	nop
 804983d:	90                   	nop
 804983e:	90                   	nop
 804983f:	90                   	nop

08049840 <__do_global_ctors_aux>:
 8049840:	55                   	push   %ebp
 8049841:	89 e5                	mov    %esp,%ebp
 8049843:	53                   	push   %ebx
 8049844:	bb 00 a0 04 08       	mov    $0x804a000,%ebx
 8049849:	83 ec 04             	sub    $0x4,%esp
 804984c:	a1 00 a0 04 08       	mov    0x804a000,%eax
 8049851:	83 f8 ff             	cmp    $0xffffffff,%eax
 8049854:	74 16                	je     804986c <__do_global_ctors_aux+0x2c>
 8049856:	8d 76 00             	lea    0x0(%esi),%esi
 8049859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8049860:	83 eb 04             	sub    $0x4,%ebx
 8049863:	ff d0                	call   *%eax
 8049865:	8b 03                	mov    (%ebx),%eax
 8049867:	83 f8 ff             	cmp    $0xffffffff,%eax
 804986a:	75 f4                	jne    8049860 <__do_global_ctors_aux+0x20>
 804986c:	58                   	pop    %eax
 804986d:	5b                   	pop    %ebx
 804986e:	5d                   	pop    %ebp
 804986f:	90                   	nop
 8049870:	c3                   	ret    
 8049871:	90                   	nop
 8049872:	90                   	nop
 8049873:	90                   	nop

Disassembly of section .fini:

08049874 <_fini>:
 8049874:	55                   	push   %ebp
 8049875:	89 e5                	mov    %esp,%ebp
 8049877:	53                   	push   %ebx
 8049878:	83 ec 04             	sub    $0x4,%esp
 804987b:	e8 00 00 00 00       	call   8049880 <_fini+0xc>
 8049880:	5b                   	pop    %ebx
 8049881:	81 c3 60 08 00 00    	add    $0x860,%ebx
 8049887:	e8 f4 f0 ff ff       	call   8048980 <__do_global_dtors_aux>
 804988c:	59                   	pop    %ecx
 804988d:	5b                   	pop    %ebx
 804988e:	c9                   	leave  
 804988f:	c3                   	ret    

Disassembly of section .rodata:

08049890 <_fp_hw>:
 8049890:	03 00                	add    (%eax),%eax
	...

08049894 <_IO_stdin_used>:
 8049894:	01 00                	add    %eax,(%eax)
 8049896:	02 00                	add    (%eax),%al
 8049898:	72 00                	jb     804989a <_IO_stdin_used+0x6>
 804989a:	25 73 3a 20 45       	and    $0x45203a73,%eax
 804989f:	72 72                	jb     8049913 <_IO_stdin_used+0x7f>
 80498a1:	6f                   	outsl  %ds:(%esi),(%dx)
 80498a2:	72 3a                	jb     80498de <_IO_stdin_used+0x4a>
 80498a4:	20 43 6f             	and    %al,0x6f(%ebx)
 80498a7:	75 6c                	jne    8049915 <_IO_stdin_used+0x81>
 80498a9:	64 6e                	outsb  %fs:(%esi),(%dx)
 80498ab:	27                   	daa    
 80498ac:	74 20                	je     80498ce <_IO_stdin_used+0x3a>
 80498ae:	6f                   	outsl  %ds:(%esi),(%dx)
 80498af:	70 65                	jo     8049916 <_IO_stdin_used+0x82>
 80498b1:	6e                   	outsb  %ds:(%esi),(%dx)
 80498b2:	20 25 73 0a 00 55    	and    %ah,0x55000a73
 80498b8:	73 61                	jae    804991b <_IO_stdin_used+0x87>
 80498ba:	67 65 3a 20          	cmp    %gs:(%bx,%si),%ah
 80498be:	25 73 20 5b 3c       	and    $0x3c5b2073,%eax
 80498c3:	69 6e 70 75 74 5f 66 	imul   $0x665f7475,0x70(%esi),%ebp
 80498ca:	69 6c 65 3e 5d 0a 00 	imul   $0xa5d,0x3e(%ebp,%eiz,2),%ebp
 80498d1:	00 
 80498d2:	00 00                	add    %al,(%eax)
 80498d4:	57                   	push   %edi
 80498d5:	65 6c                	gs insb (%dx),%es:(%edi)
 80498d7:	63 6f 6d             	arpl   %bp,0x6d(%edi)
 80498da:	65 20 74 6f 20       	and    %dh,%gs:0x20(%edi,%ebp,2)
 80498df:	6d                   	insl   (%dx),%es:(%edi)
 80498e0:	79 20                	jns    8049902 <_IO_stdin_used+0x6e>
 80498e2:	66 69 65 6e 64 69    	imul   $0x6964,0x6e(%ebp),%sp
 80498e8:	73 68                	jae    8049952 <_IO_stdin_used+0xbe>
 80498ea:	20 6c 69 74          	and    %ch,0x74(%ecx,%ebp,2)
 80498ee:	74 6c                	je     804995c <_IO_stdin_used+0xc8>
 80498f0:	65 20 62 6f          	and    %ah,%gs:0x6f(%edx)
 80498f4:	6d                   	insl   (%dx),%es:(%edi)
 80498f5:	62 2e                	bound  %ebp,(%esi)
 80498f7:	20 59 6f             	and    %bl,0x6f(%ecx)
 80498fa:	75 20                	jne    804991c <_IO_stdin_used+0x88>
 80498fc:	68 61 76 65 20       	push   $0x20657661
 8049901:	36 20 70 68          	and    %dh,%ss:0x68(%eax)
 8049905:	61                   	popa   
 8049906:	73 65                	jae    804996d <_IO_stdin_used+0xd9>
 8049908:	73 20                	jae    804992a <_IO_stdin_used+0x96>
 804990a:	77 69                	ja     8049975 <_IO_stdin_used+0xe1>
 804990c:	74 68                	je     8049976 <_IO_stdin_used+0xe2>
 804990e:	00 00                	add    %al,(%eax)
 8049910:	77 68                	ja     804997a <_IO_stdin_used+0xe6>
 8049912:	69 63 68 20 74 6f 20 	imul   $0x206f7420,0x68(%ebx),%esp
 8049919:	62 6c 6f 77          	bound  %ebp,0x77(%edi,%ebp,2)
 804991d:	20 79 6f             	and    %bh,0x6f(%ecx)
 8049920:	75 72                	jne    8049994 <_IO_stdin_used+0x100>
 8049922:	73 65                	jae    8049989 <_IO_stdin_used+0xf5>
 8049924:	6c                   	insb   (%dx),%es:(%edi)
 8049925:	66 20 75 70          	data16 and %dh,0x70(%ebp)
 8049929:	2e 20 48 61          	and    %cl,%cs:0x61(%eax)
 804992d:	76 65                	jbe    8049994 <_IO_stdin_used+0x100>
 804992f:	20 61 20             	and    %ah,0x20(%ecx)
 8049932:	6e                   	outsb  %ds:(%esi),(%dx)
 8049933:	69 63 65 20 64 61 79 	imul   $0x79616420,0x65(%ebx),%esp
 804993a:	21 00                	and    %eax,(%eax)
 804993c:	50                   	push   %eax
 804993d:	68 61 73 65 20       	push   $0x20657361
 8049942:	31 20                	xor    %esp,(%eax)
 8049944:	64 65 66 75 73       	fs gs data16 jne 80499bc <_IO_stdin_used+0x128>
 8049949:	65 64 2e 20 48 6f    	gs fs and %cl,%cs:0x6f(%eax)
 804994f:	77 20                	ja     8049971 <_IO_stdin_used+0xdd>
 8049951:	61                   	popa   
 8049952:	62 6f 75             	bound  %ebp,0x75(%edi)
 8049955:	74 20                	je     8049977 <_IO_stdin_used+0xe3>
 8049957:	74 68                	je     80499c1 <_IO_stdin_used+0x12d>
 8049959:	65 20 6e 65          	and    %ch,%gs:0x65(%esi)
 804995d:	78 74                	js     80499d3 <_IO_stdin_used+0x13f>
 804995f:	20 6f 6e             	and    %ch,0x6e(%edi)
 8049962:	65 3f                	gs aas 
 8049964:	00 54 68 61          	add    %dl,0x61(%eax,%ebp,2)
 8049968:	74 27                	je     8049991 <_IO_stdin_used+0xfd>
 804996a:	73 20                	jae    804998c <_IO_stdin_used+0xf8>
 804996c:	6e                   	outsb  %ds:(%esi),(%dx)
 804996d:	75 6d                	jne    80499dc <_IO_stdin_used+0x148>
 804996f:	62 65 72             	bound  %esp,0x72(%ebp)
 8049972:	20 32                	and    %dh,(%edx)
 8049974:	2e 20 20             	and    %ah,%cs:(%eax)
 8049977:	4b                   	dec    %ebx
 8049978:	65 65 70 20          	gs gs jo 804999c <_IO_stdin_used+0x108>
 804997c:	67 6f                	outsl  %ds:(%si),(%dx)
 804997e:	69 6e 67 21 00 48 61 	imul   $0x61480021,0x67(%esi),%ebp
 8049985:	6c                   	insb   (%dx),%es:(%edi)
 8049986:	66 77 61             	data16 ja 80499ea <_IO_stdin_used+0x156>
 8049989:	79 20                	jns    80499ab <_IO_stdin_used+0x117>
 804998b:	74 68                	je     80499f5 <_IO_stdin_used+0x161>
 804998d:	65 72 65             	gs jb  80499f5 <_IO_stdin_used+0x161>
 8049990:	21 00                	and    %eax,(%eax)
 8049992:	00 00                	add    %al,(%eax)
 8049994:	53                   	push   %ebx
 8049995:	6f                   	outsl  %ds:(%esi),(%dx)
 8049996:	20 79 6f             	and    %bh,0x6f(%ecx)
 8049999:	75 20                	jne    80499bb <_IO_stdin_used+0x127>
 804999b:	67 6f                	outsl  %ds:(%si),(%dx)
 804999d:	74 20                	je     80499bf <_IO_stdin_used+0x12b>
 804999f:	74 68                	je     8049a09 <_IO_stdin_used+0x175>
 80499a1:	61                   	popa   
 80499a2:	74 20                	je     80499c4 <_IO_stdin_used+0x130>
 80499a4:	6f                   	outsl  %ds:(%esi),(%dx)
 80499a5:	6e                   	outsb  %ds:(%esi),(%dx)
 80499a6:	65 2e 20 20          	gs and %ah,%cs:(%eax)
 80499aa:	54                   	push   %esp
 80499ab:	72 79                	jb     8049a26 <_IO_stdin_used+0x192>
 80499ad:	20 74 68 69          	and    %dh,0x69(%eax,%ebp,2)
 80499b1:	73 20                	jae    80499d3 <_IO_stdin_used+0x13f>
 80499b3:	6f                   	outsl  %ds:(%esi),(%dx)
 80499b4:	6e                   	outsb  %ds:(%esi),(%dx)
 80499b5:	65 2e 00 47 6f       	gs add %al,%cs:0x6f(%edi)
 80499ba:	6f                   	outsl  %ds:(%esi),(%dx)
 80499bb:	64 20 77 6f          	and    %dh,%fs:0x6f(%edi)
 80499bf:	72 6b                	jb     8049a2c <_IO_stdin_used+0x198>
 80499c1:	21 20                	and    %esp,(%eax)
 80499c3:	20 4f 6e             	and    %cl,0x6e(%edi)
 80499c6:	20 74 6f 20          	and    %dh,0x20(%edi,%ebp,2)
 80499ca:	74 68                	je     8049a34 <_IO_stdin_used+0x1a0>
 80499cc:	65 20 6e 65          	and    %ch,%gs:0x65(%esi)
 80499d0:	78 74                	js     8049a46 <_IO_stdin_used+0x1b2>
 80499d2:	2e 2e 2e 00 00       	cs cs add %al,%cs:(%eax)
 80499d7:	00 49 20             	add    %cl,0x20(%ecx)
 80499da:	74 75                	je     8049a51 <_IO_stdin_used+0x1bd>
 80499dc:	72 6e                	jb     8049a4c <_IO_stdin_used+0x1b8>
 80499de:	65 64 20 74 68 65    	gs and %dh,%fs:0x65(%eax,%ebp,2)
 80499e4:	20 6d 6f             	and    %ch,0x6f(%ebp)
 80499e7:	6f                   	outsl  %ds:(%esi),(%dx)
 80499e8:	6e                   	outsb  %ds:(%esi),(%dx)
 80499e9:	20 69 6e             	and    %ch,0x6e(%ecx)
 80499ec:	74 6f                	je     8049a5d <_IO_stdin_used+0x1c9>
 80499ee:	20 73 6f             	and    %dh,0x6f(%ebx)
 80499f1:	6d                   	insl   (%dx),%es:(%edi)
 80499f2:	65 74 68             	gs je  8049a5d <_IO_stdin_used+0x1c9>
 80499f5:	69 6e 67 20 49 20 6c 	imul   $0x6c204920,0x67(%esi),%ebp
 80499fc:	69 6b 65 20 74 6f 20 	imul   $0x206f7420,0x65(%ebx),%ebp
 8049a03:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 8049a06:	6c                   	insb   (%dx),%es:(%edi)
 8049a07:	20 61 20             	and    %ah,0x20(%ecx)
 8049a0a:	44                   	inc    %esp
 8049a0b:	65 61                	gs popa 
 8049a0d:	74 68                	je     8049a77 <_IO_stdin_used+0x1e3>
 8049a0f:	20 53 74             	and    %dl,0x74(%ebx)
 8049a12:	61                   	popa   
 8049a13:	72 2e                	jb     8049a43 <_IO_stdin_used+0x1af>
 8049a15:	00 25 64 20 25 63    	add    %ah,0x63252064
 8049a1b:	20 25 64 00 00 65    	and    %ah,0x65000064
 8049a21:	8c 04 08             	mov    %es,(%eax,%ecx,1)
 8049a24:	81 8c 04 08 9d 8c 04 	orl    $0x48cb208,0x48c9d08(%esp,%eax,1)
 8049a2b:	08 b2 8c 04 
 8049a2f:	08 c7                	or     %al,%bh
 8049a31:	8c 04 08             	mov    %es,(%eax,%ecx,1)
 8049a34:	dc 8c 04 08 f1 8c 04 	fmull  0x48cf108(%esp,%eax,1)
 8049a3b:	08 06                	or     %al,(%esi)
 8049a3d:	8d 04 08             	lea    (%eax,%ecx,1),%eax
 8049a40:	25 64 00 74 69       	and    $0x69740064,%eax
 8049a45:	74 61                	je     8049aa8 <_IO_stdin_used+0x214>
 8049a47:	6e                   	outsb  %ds:(%esi),(%dx)
 8049a48:	73 00                	jae    8049a4a <_IO_stdin_used+0x1b6>
 8049a4a:	00 00                	add    %al,(%eax)
 8049a4c:	57                   	push   %edi
 8049a4d:	6f                   	outsl  %ds:(%esi),(%dx)
 8049a4e:	77 21                	ja     8049a71 <_IO_stdin_used+0x1dd>
 8049a50:	20 59 6f             	and    %bl,0x6f(%ecx)
 8049a53:	75 27                	jne    8049a7c <_IO_stdin_used+0x1e8>
 8049a55:	76 65                	jbe    8049abc <_IO_stdin_used+0x228>
 8049a57:	20 64 65 66          	and    %ah,0x66(%ebp,%eiz,2)
 8049a5b:	75 73                	jne    8049ad0 <_IO_stdin_used+0x23c>
 8049a5d:	65 64 20 74 68 65    	gs and %dh,%fs:0x65(%eax,%ebp,2)
 8049a63:	20 73 65             	and    %dh,0x65(%ebx)
 8049a66:	63 72 65             	arpl   %si,0x65(%edx)
 8049a69:	74 20                	je     8049a8b <_IO_stdin_used+0x1f7>
 8049a6b:	73 74                	jae    8049ae1 <_IO_stdin_used+0x24d>
 8049a6d:	61                   	popa   
 8049a6e:	67 65 21 00          	and    %eax,%gs:(%bx,%si)
 8049a72:	00 00                	add    %al,(%eax)
 8049a74:	62 61 73             	bound  %esp,0x73(%ecx)
 8049a77:	73 2e                	jae    8049aa7 <_IO_stdin_used+0x213>
 8049a79:	63 6d 63             	arpl   %bp,0x63(%ebp)
 8049a7c:	6c                   	insb   (%dx),%es:(%edi)
 8049a7d:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049a81:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049a84:	2e 65 64 75 00       	cs gs fs jne,pn 8049a89 <_IO_stdin_used+0x1f5>
 8049a89:	62 6c 75 65          	bound  %ebp,0x65(%ebp,%esi,2)
 8049a8d:	67 69 6c 6c 2e 63 6d 	imul   $0x636d632e,0x6c(%si),%ebp
 8049a94:	63 
 8049a95:	6c                   	insb   (%dx),%es:(%edi)
 8049a96:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049a9a:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049a9d:	2e 65 64 75 00       	cs gs fs jne,pn 8049aa2 <_IO_stdin_used+0x20e>
 8049aa2:	63 68 61             	arpl   %bp,0x61(%eax)
 8049aa5:	72 2e                	jb     8049ad5 <_IO_stdin_used+0x241>
 8049aa7:	63 6d 63             	arpl   %bp,0x63(%ebp)
 8049aaa:	6c                   	insb   (%dx),%es:(%edi)
 8049aab:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049aaf:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049ab2:	2e 65 64 75 00       	cs gs fs jne,pn 8049ab7 <_IO_stdin_used+0x223>
 8049ab7:	63 68 75             	arpl   %bp,0x75(%eax)
 8049aba:	6d                   	insl   (%dx),%es:(%edi)
 8049abb:	2e 63 6d 63          	arpl   %bp,%cs:0x63(%ebp)
 8049abf:	6c                   	insb   (%dx),%es:(%edi)
 8049ac0:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049ac4:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049ac7:	2e 65 64 75 00       	cs gs fs jne,pn 8049acc <_IO_stdin_used+0x238>
 8049acc:	66 6c                	data16 insb (%dx),%es:(%edi)
 8049ace:	69 65 72 2e 63 6d 63 	imul   $0x636d632e,0x72(%ebp),%esp
 8049ad5:	6c                   	insb   (%dx),%es:(%edi)
 8049ad6:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049ada:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049add:	2e 65 64 75 00       	cs gs fs jne,pn 8049ae2 <_IO_stdin_used+0x24e>
 8049ae2:	67 6f                	outsl  %ds:(%si),(%dx)
 8049ae4:	62 69 2e             	bound  %ebp,0x2e(%ecx)
 8049ae7:	63 6d 63             	arpl   %bp,0x63(%ebp)
 8049aea:	6c                   	insb   (%dx),%es:(%edi)
 8049aeb:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049aef:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049af2:	2e 65 64 75 00       	cs gs fs jne,pn 8049af7 <_IO_stdin_used+0x263>
 8049af7:	67 72 61             	addr16 jb 8049b5b <_IO_stdin_used+0x2c7>
 8049afa:	79 6c                	jns    8049b68 <_IO_stdin_used+0x2d4>
 8049afc:	69 6e 67 2e 63 6d 63 	imul   $0x636d632e,0x67(%esi),%ebp
 8049b03:	6c                   	insb   (%dx),%es:(%edi)
 8049b04:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049b08:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049b0b:	2e 65 64 75 00       	cs gs fs jne,pn 8049b10 <_IO_stdin_used+0x27c>
 8049b10:	69 6e 63 6f 6e 6e 75 	imul   $0x756e6e6f,0x63(%esi),%ebp
 8049b17:	2e 63 6d 63          	arpl   %bp,%cs:0x63(%ebp)
 8049b1b:	6c                   	insb   (%dx),%es:(%edi)
 8049b1c:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049b20:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049b23:	2e 65 64 75 00       	cs gs fs jne,pn 8049b28 <_IO_stdin_used+0x294>
 8049b28:	6d                   	insl   (%dx),%es:(%edi)
 8049b29:	69 6e 6e 6f 77 2e 63 	imul   $0x632e776f,0x6e(%esi),%ebp
 8049b30:	6d                   	insl   (%dx),%es:(%edi)
 8049b31:	63 6c 2e 63          	arpl   %bp,0x63(%esi,%ebp,1)
 8049b35:	73 2e                	jae    8049b65 <_IO_stdin_used+0x2d1>
 8049b37:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049b3a:	2e 65 64 75 00       	cs gs fs jne,pn 8049b3f <_IO_stdin_used+0x2ab>
 8049b3f:	6d                   	insl   (%dx),%es:(%edi)
 8049b40:	75 73                	jne    8049bb5 <_IO_stdin_used+0x321>
 8049b42:	6b 69 65 2e          	imul   $0x2e,0x65(%ecx),%ebp
 8049b46:	63 6d 63             	arpl   %bp,0x63(%ebp)
 8049b49:	6c                   	insb   (%dx),%es:(%edi)
 8049b4a:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049b4e:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049b51:	2e 65 64 75 00       	cs gs fs jne,pn 8049b56 <_IO_stdin_used+0x2c2>
 8049b56:	70 61                	jo     8049bb9 <_IO_stdin_used+0x325>
 8049b58:	64 64 6c             	fs fs insb (%dx),%es:(%edi)
 8049b5b:	65 66 69 73 68 2e 63 	imul   $0x632e,%gs:0x68(%ebx),%si
 8049b62:	6d                   	insl   (%dx),%es:(%edi)
 8049b63:	63 6c 2e 63          	arpl   %bp,0x63(%esi,%ebp,1)
 8049b67:	73 2e                	jae    8049b97 <_IO_stdin_used+0x303>
 8049b69:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049b6c:	2e 65 64 75 00       	cs gs fs jne,pn 8049b71 <_IO_stdin_used+0x2dd>
 8049b71:	70 65                	jo     8049bd8 <_IO_stdin_used+0x344>
 8049b73:	72 63                	jb     8049bd8 <_IO_stdin_used+0x344>
 8049b75:	68 2e 63 6d 63       	push   $0x636d632e
 8049b7a:	6c                   	insb   (%dx),%es:(%edi)
 8049b7b:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049b7f:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049b82:	2e 65 64 75 00       	cs gs fs jne,pn 8049b87 <_IO_stdin_used+0x2f3>
 8049b87:	70 69                	jo     8049bf2 <_IO_stdin_used+0x35e>
 8049b89:	63 6b 65             	arpl   %bp,0x65(%ebx)
 8049b8c:	72 65                	jb     8049bf3 <_IO_stdin_used+0x35f>
 8049b8e:	6c                   	insb   (%dx),%es:(%edi)
 8049b8f:	2e 63 6d 63          	arpl   %bp,%cs:0x63(%ebp)
 8049b93:	6c                   	insb   (%dx),%es:(%edi)
 8049b94:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049b98:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049b9b:	2e 65 64 75 00       	cs gs fs jne,pn 8049ba0 <_IO_stdin_used+0x30c>
 8049ba0:	70 69                	jo     8049c0b <_IO_stdin_used+0x377>
 8049ba2:	6b 65 2e 63          	imul   $0x63,0x2e(%ebp),%esp
 8049ba6:	6d                   	insl   (%dx),%es:(%edi)
 8049ba7:	63 6c 2e 63          	arpl   %bp,0x63(%esi,%ebp,1)
 8049bab:	73 2e                	jae    8049bdb <_IO_stdin_used+0x347>
 8049bad:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049bb0:	2e 65 64 75 00       	cs gs fs jne,pn 8049bb5 <_IO_stdin_used+0x321>
 8049bb5:	70 75                	jo     8049c2c <_IO_stdin_used+0x398>
 8049bb7:	6d                   	insl   (%dx),%es:(%edi)
 8049bb8:	70 6b                	jo     8049c25 <_IO_stdin_used+0x391>
 8049bba:	69 6e 73 65 65 64 2e 	imul   $0x2e646565,0x73(%esi),%ebp
 8049bc1:	63 6d 63             	arpl   %bp,0x63(%ebp)
 8049bc4:	6c                   	insb   (%dx),%es:(%edi)
 8049bc5:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049bc9:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049bcc:	2e 65 64 75 00       	cs gs fs jne,pn 8049bd1 <_IO_stdin_used+0x33d>
 8049bd1:	73 61                	jae    8049c34 <_IO_stdin_used+0x3a0>
 8049bd3:	6c                   	insb   (%dx),%es:(%edi)
 8049bd4:	6d                   	insl   (%dx),%es:(%edi)
 8049bd5:	6f                   	outsl  %ds:(%esi),(%dx)
 8049bd6:	6e                   	outsb  %ds:(%esi),(%dx)
 8049bd7:	2e 63 6d 63          	arpl   %bp,%cs:0x63(%ebp)
 8049bdb:	6c                   	insb   (%dx),%es:(%edi)
 8049bdc:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049be0:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049be3:	2e 65 64 75 00       	cs gs fs jne,pn 8049be8 <_IO_stdin_used+0x354>
 8049be8:	73 61                	jae    8049c4b <_IO_stdin_used+0x3b7>
 8049bea:	75 67                	jne    8049c53 <_IO_stdin_used+0x3bf>
 8049bec:	65 72 2e             	gs jb  8049c1d <_IO_stdin_used+0x389>
 8049bef:	63 6d 63             	arpl   %bp,0x63(%ebp)
 8049bf2:	6c                   	insb   (%dx),%es:(%edi)
 8049bf3:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049bf7:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049bfa:	2e 65 64 75 00       	cs gs fs jne,pn 8049bff <_IO_stdin_used+0x36b>
 8049bff:	73 68                	jae    8049c69 <_IO_stdin_used+0x3d5>
 8049c01:	61                   	popa   
 8049c02:	64 2e 63 6d 63       	fs arpl %bp,%cs:0x63(%ebp)
 8049c07:	6c                   	insb   (%dx),%es:(%edi)
 8049c08:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049c0c:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049c0f:	2e 65 64 75 00       	cs gs fs jne,pn 8049c14 <_IO_stdin_used+0x380>
 8049c14:	73 68                	jae    8049c7e <_IO_stdin_used+0x3ea>
 8049c16:	65 65 70 73          	gs gs jo 8049c8d <_IO_stdin_used+0x3f9>
 8049c1a:	68 65 61 64 2e       	push   $0x2e646165
 8049c1f:	63 6d 63             	arpl   %bp,0x63(%ebp)
 8049c22:	6c                   	insb   (%dx),%es:(%edi)
 8049c23:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049c27:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049c2a:	2e 65 64 75 00       	cs gs fs jne,pn 8049c2f <_IO_stdin_used+0x39b>
 8049c2f:	73 6f                	jae    8049ca0 <_IO_stdin_used+0x40c>
 8049c31:	63 6b 65             	arpl   %bp,0x65(%ebx)
 8049c34:	79 65                	jns    8049c9b <_IO_stdin_used+0x407>
 8049c36:	2e 63 6d 63          	arpl   %bp,%cs:0x63(%ebp)
 8049c3a:	6c                   	insb   (%dx),%es:(%edi)
 8049c3b:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049c3f:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049c42:	2e 65 64 75 00       	cs gs fs jne,pn 8049c47 <_IO_stdin_used+0x3b3>
 8049c47:	73 74                	jae    8049cbd <_IO_stdin_used+0x429>
 8049c49:	72 69                	jb     8049cb4 <_IO_stdin_used+0x420>
 8049c4b:	70 65                	jo     8049cb2 <_IO_stdin_used+0x41e>
 8049c4d:	72 2e                	jb     8049c7d <_IO_stdin_used+0x3e9>
 8049c4f:	63 6d 63             	arpl   %bp,0x63(%ebp)
 8049c52:	6c                   	insb   (%dx),%es:(%edi)
 8049c53:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049c57:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049c5a:	2e 65 64 75 00       	cs gs fs jne,pn 8049c5f <_IO_stdin_used+0x3cb>
 8049c5f:	73 74                	jae    8049cd5 <_IO_stdin_used+0x441>
 8049c61:	75 72                	jne    8049cd5 <_IO_stdin_used+0x441>
 8049c63:	67 65 6f             	outsl  %gs:(%si),(%dx)
 8049c66:	6e                   	outsb  %ds:(%esi),(%dx)
 8049c67:	2e 63 6d 63          	arpl   %bp,%cs:0x63(%ebp)
 8049c6b:	6c                   	insb   (%dx),%es:(%edi)
 8049c6c:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049c70:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049c73:	2e 65 64 75 00       	cs gs fs jne,pn 8049c78 <_IO_stdin_used+0x3e4>
 8049c78:	77 61                	ja     8049cdb <_IO_stdin_used+0x447>
 8049c7a:	6c                   	insb   (%dx),%es:(%edi)
 8049c7b:	6c                   	insb   (%dx),%es:(%edi)
 8049c7c:	65 79 65             	gs jns 8049ce4 <_IO_stdin_used+0x450>
 8049c7f:	2e 63 6d 63          	arpl   %bp,%cs:0x63(%ebp)
 8049c83:	6c                   	insb   (%dx),%es:(%edi)
 8049c84:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049c88:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049c8b:	2e 65 64 75 00       	cs gs fs jne,pn 8049c90 <_IO_stdin_used+0x3fc>
 8049c90:	77 61                	ja     8049cf3 <_IO_stdin_used+0x45f>
 8049c92:	72 6d                	jb     8049d01 <_IO_stdin_used+0x46d>
 8049c94:	6f                   	outsl  %ds:(%esi),(%dx)
 8049c95:	75 74                	jne    8049d0b <_IO_stdin_used+0x477>
 8049c97:	68 2e 63 6d 63       	push   $0x636d632e
 8049c9c:	6c                   	insb   (%dx),%es:(%edi)
 8049c9d:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049ca1:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049ca4:	2e 65 64 75 00       	cs gs fs jne,pn 8049ca9 <_IO_stdin_used+0x415>
 8049ca9:	77 68                	ja     8049d13 <_IO_stdin_used+0x47f>
 8049cab:	69 74 65 66 69 73 68 	imul   $0x2e687369,0x66(%ebp,%eiz,2),%esi
 8049cb2:	2e 
 8049cb3:	63 6d 63             	arpl   %bp,0x63(%ebp)
 8049cb6:	6c                   	insb   (%dx),%es:(%edi)
 8049cb7:	2e 63 73 2e          	arpl   %si,%cs:0x2e(%ebx)
 8049cbb:	63 6d 75             	arpl   %bp,0x75(%ebp)
 8049cbe:	2e 65 64 75 00       	cs gs fs jne,pn 8049cc3 <_IO_stdin_used+0x42f>
 8049cc3:	00 53 6f             	add    %dl,0x6f(%ebx)
 8049cc6:	20 79 6f             	and    %bh,0x6f(%ecx)
 8049cc9:	75 20                	jne    8049ceb <_IO_stdin_used+0x457>
 8049ccb:	74 68                	je     8049d35 <_IO_stdin_used+0x4a1>
 8049ccd:	69 6e 6b 20 79 6f 75 	imul   $0x756f7920,0x6b(%esi),%ebp
 8049cd4:	20 63 61             	and    %ah,0x61(%ebx)
 8049cd7:	6e                   	outsb  %ds:(%esi),(%dx)
 8049cd8:	20 73 74             	and    %dh,0x74(%ebx)
 8049cdb:	6f                   	outsl  %ds:(%esi),(%dx)
 8049cdc:	70 20                	jo     8049cfe <_IO_stdin_used+0x46a>
 8049cde:	74 68                	je     8049d48 <_IO_stdin_used+0x4b4>
 8049ce0:	65 20 62 6f          	and    %ah,%gs:0x6f(%edx)
 8049ce4:	6d                   	insl   (%dx),%es:(%edi)
 8049ce5:	62 20                	bound  %esp,(%eax)
 8049ce7:	77 69                	ja     8049d52 <_IO_stdin_used+0x4be>
 8049ce9:	74 68                	je     8049d53 <_IO_stdin_used+0x4bf>
 8049ceb:	20 63 74             	and    %ah,0x74(%ebx)
 8049cee:	72 6c                	jb     8049d5c <_IO_stdin_used+0x4c8>
 8049cf0:	2d 63 2c 20 64       	sub    $0x64202c63,%eax
 8049cf5:	6f                   	outsl  %ds:(%esi),(%dx)
 8049cf6:	20 79 6f             	and    %bh,0x6f(%ecx)
 8049cf9:	75 3f                	jne    8049d3a <_IO_stdin_used+0x4a6>
 8049cfb:	00 57 65             	add    %dl,0x65(%edi)
 8049cfe:	6c                   	insb   (%dx),%es:(%edi)
 8049cff:	6c                   	insb   (%dx),%es:(%edi)
 8049d00:	2e 2e 2e 00 4f 4b    	cs cs add %cl,%cs:0x4b(%edi)
 8049d06:	2e 20 3a             	and    %bh,%cs:(%edx)
 8049d09:	2d 29 00 49 6e       	sub    $0x6e490029,%eax
 8049d0e:	76 61                	jbe    8049d71 <_IO_stdin_used+0x4dd>
 8049d10:	6c                   	insb   (%dx),%es:(%edi)
 8049d11:	69 64 20 70 68 61 73 	imul   $0x65736168,0x70(%eax,%eiz,1),%esp
 8049d18:	65 
 8049d19:	25 73 0a 00 25       	and    $0x25000a73,%eax
 8049d1e:	64 20 25 64 20 25 64 	and    %ah,%fs:0x64252064
 8049d25:	20 25 64 20 25 64    	and    %ah,0x64252064
 8049d2b:	20 25 64 00 42 61    	and    %ah,0x61420064
 8049d31:	64 20 68 6f          	and    %ch,%fs:0x6f(%eax)
 8049d35:	73 74                	jae    8049dab <_IO_stdin_used+0x517>
 8049d37:	20 28                	and    %ch,(%eax)
 8049d39:	31 29                	xor    %ebp,(%ecx)
 8049d3b:	2e 00 42 61          	add    %al,%cs:0x61(%edx)
 8049d3f:	64 20 68 6f          	and    %ch,%fs:0x6f(%eax)
 8049d43:	73 74                	jae    8049db9 <_IO_stdin_used+0x525>
 8049d45:	20 28                	and    %ch,(%eax)
 8049d47:	32 29                	xor    (%ecx),%ch
 8049d49:	2e 00 42 61          	add    %al,%cs:0x61(%edx)
 8049d4d:	64 20 68 6f          	and    %ch,%fs:0x6f(%eax)
 8049d51:	73 74                	jae    8049dc7 <_IO_stdin_used+0x533>
 8049d53:	20 28                	and    %ch,(%eax)
 8049d55:	33 29                	xor    (%ecx),%ebp
 8049d57:	2e 00 45 72          	add    %al,%cs:0x72(%ebp)
 8049d5b:	72 6f                	jb     8049dcc <_IO_stdin_used+0x538>
 8049d5d:	72 3a                	jb     8049d99 <_IO_stdin_used+0x505>
 8049d5f:	20 50 72             	and    %dl,0x72(%eax)
 8049d62:	65 6d                	gs insl (%dx),%es:(%edi)
 8049d64:	61                   	popa   
 8049d65:	74 75                	je     8049ddc <_IO_stdin_used+0x548>
 8049d67:	72 65                	jb     8049dce <_IO_stdin_used+0x53a>
 8049d69:	20 45 4f             	and    %al,0x4f(%ebp)
 8049d6c:	46                   	inc    %esi
 8049d6d:	20 6f 6e             	and    %ch,0x6e(%edi)
 8049d70:	20 73 74             	and    %dh,0x74(%ebx)
 8049d73:	64 69 6e 00 47 52 41 	imul   $0x44415247,%fs:0x0(%esi),%ebp
 8049d7a:	44 
 8049d7b:	45                   	inc    %ebp
 8049d7c:	5f                   	pop    %edi
 8049d7d:	42                   	inc    %edx
 8049d7e:	4f                   	dec    %edi
 8049d7f:	4d                   	dec    %ebp
 8049d80:	42                   	inc    %edx
 8049d81:	00 45 72             	add    %al,0x72(%ebp)
 8049d84:	72 6f                	jb     8049df5 <_IO_stdin_used+0x561>
 8049d86:	72 3a                	jb     8049dc2 <_IO_stdin_used+0x52e>
 8049d88:	20 49 6e             	and    %cl,0x6e(%ecx)
 8049d8b:	70 75                	jo     8049e02 <_IO_stdin_used+0x56e>
 8049d8d:	74 20                	je     8049daf <_IO_stdin_used+0x51b>
 8049d8f:	6c                   	insb   (%dx),%es:(%edi)
 8049d90:	69 6e 65 20 74 6f 6f 	imul   $0x6f6f7420,0x65(%esi),%ebp
 8049d97:	20 6c 6f 6e          	and    %ch,0x6e(%edi,%ebp,2)
 8049d9b:	67 00 45 52          	add    %al,0x52(%di)
 8049d9f:	52                   	push   %edx
 8049da0:	4f                   	dec    %edi
 8049da1:	52                   	push   %edx
 8049da2:	3a 20                	cmp    (%eax),%ah
 8049da4:	64 75 70             	fs jne 8049e17 <_IO_stdin_used+0x583>
 8049da7:	28 30                	sub    %dh,(%eax)
 8049da9:	29 20                	sub    %esp,(%eax)
 8049dab:	65 72 72             	gs jb  8049e20 <_IO_stdin_used+0x58c>
 8049dae:	6f                   	outsl  %ds:(%esi),(%dx)
 8049daf:	72 00                	jb     8049db1 <_IO_stdin_used+0x51d>
 8049db1:	45                   	inc    %ebp
 8049db2:	52                   	push   %edx
 8049db3:	52                   	push   %edx
 8049db4:	4f                   	dec    %edi
 8049db5:	52                   	push   %edx
 8049db6:	3a 20                	cmp    (%eax),%ah
 8049db8:	63 6c 6f 73          	arpl   %bp,0x73(%edi,%ebp,2)
 8049dbc:	65 20 65 72          	and    %ah,%gs:0x72(%ebp)
 8049dc0:	72 6f                	jb     8049e31 <_IO_stdin_used+0x59d>
 8049dc2:	72 00                	jb     8049dc4 <_IO_stdin_used+0x530>
 8049dc4:	45                   	inc    %ebp
 8049dc5:	52                   	push   %edx
 8049dc6:	52                   	push   %edx
 8049dc7:	4f                   	dec    %edi
 8049dc8:	52                   	push   %edx
 8049dc9:	3a 20                	cmp    (%eax),%ah
 8049dcb:	74 6d                	je     8049e3a <_IO_stdin_used+0x5a6>
 8049dcd:	70 66                	jo     8049e35 <_IO_stdin_used+0x5a1>
 8049dcf:	69 6c 65 20 65 72 72 	imul   $0x6f727265,0x20(%ebp,%eiz,2),%ebp
 8049dd6:	6f 
 8049dd7:	72 00                	jb     8049dd9 <_IO_stdin_used+0x545>
 8049dd9:	53                   	push   %ebx
 8049dda:	75 62                	jne    8049e3e <_IO_stdin_used+0x5aa>
 8049ddc:	6a 65                	push   $0x65
 8049dde:	63 74 3a 20          	arpl   %si,0x20(%edx,%edi,1)
 8049de2:	42                   	inc    %edx
 8049de3:	6f                   	outsl  %ds:(%esi),(%dx)
 8049de4:	6d                   	insl   (%dx),%es:(%edi)
 8049de5:	62 20                	bound  %esp,(%eax)
 8049de7:	6e                   	outsb  %ds:(%esi),(%dx)
 8049de8:	6f                   	outsl  %ds:(%esi),(%dx)
 8049de9:	74 69                	je     8049e54 <_IO_stdin_used+0x5c0>
 8049deb:	66 69 63 61 74 69    	imul   $0x6974,0x61(%ebx),%sp
 8049df1:	6f                   	outsl  %ds:(%esi),(%dx)
 8049df2:	6e                   	outsb  %ds:(%esi),(%dx)
 8049df3:	0a 00                	or     (%eax),%al
 8049df5:	64 65 66 75 73       	fs gs data16 jne 8049e6d <_IO_stdin_used+0x5d9>
 8049dfa:	65 64 00 65 78       	gs add %ah,%fs:0x78(%ebp)
 8049dff:	70 6c                	jo     8049e6d <_IO_stdin_used+0x5d9>
 8049e01:	6f                   	outsl  %ds:(%esi),(%dx)
 8049e02:	64 65 64 00 62 6f    	fs gs add %ah,%fs:0x6f(%edx)
 8049e08:	6d                   	insl   (%dx),%es:(%edi)
 8049e09:	62 2d 68 65 61 64    	bound  %ebp,0x64616568
 8049e0f:	65 72 3a             	gs jb  8049e4c <_IO_stdin_used+0x5b8>
 8049e12:	25 73 3a 25 64       	and    $0x64253a73,%eax
 8049e17:	3a 25 73 3a 25 73    	cmp    0x73253a73,%ah
 8049e1d:	3a 25 64 0a 00 62    	cmp    0x62000a64,%ah
 8049e23:	6f                   	outsl  %ds:(%esi),(%dx)
 8049e24:	6d                   	insl   (%dx),%es:(%edi)
 8049e25:	62 2d 73 74 72 69    	bound  %ebp,0x69727473
 8049e2b:	6e                   	outsb  %ds:(%esi),(%dx)
 8049e2c:	67 3a 25             	cmp    (%di),%ah
 8049e2f:	73 3a                	jae    8049e6b <_IO_stdin_used+0x5d7>
 8049e31:	25 64 3a 25 73       	and    $0x73253a64,%eax
 8049e36:	3a 25 64 3a 25 73    	cmp    0x73253a64,%ah
 8049e3c:	0a 00                	or     (%eax),%al
 8049e3e:	62 6f 6d             	bound  %ebp,0x6d(%edi)
 8049e41:	62 00                	bound  %eax,(%eax)
 8049e43:	2f                   	das    
 8049e44:	75 73                	jne    8049eb9 <_IO_stdin_used+0x625>
 8049e46:	72 2f                	jb     8049e77 <_IO_stdin_used+0x5e3>
 8049e48:	73 62                	jae    8049eac <_IO_stdin_used+0x618>
 8049e4a:	69 6e 2f 73 65 6e 64 	imul   $0x646e6573,0x2f(%esi),%ebp
 8049e51:	6d                   	insl   (%dx),%es:(%edi)
 8049e52:	61                   	popa   
 8049e53:	69 6c 20 2d 62 6d 00 	imul   $0x25006d62,0x2d(%eax,%eiz,1),%ebp
 8049e5a:	25 
 8049e5b:	73 20                	jae    8049e7d <_IO_stdin_used+0x5e9>
 8049e5d:	25 73 40 25 73       	and    $0x73254073,%eax
 8049e62:	00 45 52             	add    %al,0x52(%ebp)
 8049e65:	52                   	push   %edx
 8049e66:	4f                   	dec    %edi
 8049e67:	52                   	push   %edx
 8049e68:	3a 20                	cmp    (%eax),%ah
 8049e6a:	6e                   	outsb  %ds:(%esi),(%dx)
 8049e6b:	6f                   	outsl  %ds:(%esi),(%dx)
 8049e6c:	74 69                	je     8049ed7 <_IO_stdin_used+0x643>
 8049e6e:	66 69 63 61 74 69    	imul   $0x6974,0x61(%ebx),%sp
 8049e74:	6f                   	outsl  %ds:(%esi),(%dx)
 8049e75:	6e                   	outsb  %ds:(%esi),(%dx)
 8049e76:	20 65 72             	and    %ah,0x72(%ebp)
 8049e79:	72 6f                	jb     8049eea <_IO_stdin_used+0x656>
 8049e7b:	72 00                	jb     8049e7d <_IO_stdin_used+0x5e9>
 8049e7d:	45                   	inc    %ebp
 8049e7e:	52                   	push   %edx
 8049e7f:	52                   	push   %edx
 8049e80:	4f                   	dec    %edi
 8049e81:	52                   	push   %edx
 8049e82:	3a 20                	cmp    (%eax),%ah
 8049e84:	66 63 6c 6f 73       	data16 arpl %bp,0x73(%edi,%ebp,2)
 8049e89:	65 28 74 6d 70       	sub    %dh,%gs:0x70(%ebp,%ebp,2)
 8049e8e:	29 20                	sub    %esp,(%eax)
 8049e90:	65 72 72             	gs jb  8049f05 <_IO_stdin_used+0x671>
 8049e93:	6f                   	outsl  %ds:(%esi),(%dx)
 8049e94:	72 00                	jb     8049e96 <_IO_stdin_used+0x602>
 8049e96:	45                   	inc    %ebp
 8049e97:	52                   	push   %edx
 8049e98:	52                   	push   %edx
 8049e99:	4f                   	dec    %edi
 8049e9a:	52                   	push   %edx
 8049e9b:	3a 20                	cmp    (%eax),%ah
 8049e9d:	64 75 70             	fs jne 8049f10 <_IO_stdin_used+0x67c>
 8049ea0:	28 74 6d 70          	sub    %dh,0x70(%ebp,%ebp,2)
 8049ea4:	73 74                	jae    8049f1a <_IO_stdin_used+0x686>
 8049ea6:	64 69 6e 29 20 65 72 	imul   $0x72726520,%fs:0x29(%esi),%ebp
 8049ead:	72 
 8049eae:	6f                   	outsl  %ds:(%esi),(%dx)
 8049eaf:	72 00                	jb     8049eb1 <_IO_stdin_used+0x61d>
 8049eb1:	45                   	inc    %ebp
 8049eb2:	52                   	push   %edx
 8049eb3:	52                   	push   %edx
 8049eb4:	4f                   	dec    %edi
 8049eb5:	52                   	push   %edx
 8049eb6:	3a 20                	cmp    (%eax),%ah
 8049eb8:	63 6c 6f 73          	arpl   %bp,0x73(%edi,%ebp,2)
 8049ebc:	65 28 74 6d 70       	sub    %dh,%gs:0x70(%ebp,%ebp,2)
 8049ec1:	73 74                	jae    8049f37 <_IO_stdin_used+0x6a3>
 8049ec3:	64 69 6e 29 00 0a 42 	imul   $0x4f420a00,%fs:0x29(%esi),%ebp
 8049eca:	4f 
 8049ecb:	4f                   	dec    %edi
 8049ecc:	4d                   	dec    %ebp
 8049ecd:	21 21                	and    %esp,(%ecx)
 8049ecf:	21 00                	and    %eax,(%eax)
 8049ed1:	54                   	push   %esp
 8049ed2:	68 65 20 62 6f       	push   $0x6f622065
 8049ed7:	6d                   	insl   (%dx),%es:(%edi)
 8049ed8:	62 20                	bound  %esp,(%eax)
 8049eda:	68 61 73 20 62       	push   $0x62207361
 8049edf:	6c                   	insb   (%dx),%es:(%edi)
 8049ee0:	6f                   	outsl  %ds:(%esi),(%dx)
 8049ee1:	77 6e                	ja     8049f51 <_IO_stdin_used+0x6bd>
 8049ee3:	20 75 70             	and    %dh,0x70(%ebp)
 8049ee6:	2e 00 25 64 20 25 73 	add    %ah,%cs:0x73252064
 8049eed:	00 61 75             	add    %ah,0x75(%ecx)
 8049ef0:	73 74                	jae    8049f66 <_IO_stdin_used+0x6d2>
 8049ef2:	69 6e 70 6f 77 65 72 	imul   $0x7265776f,0x70(%esi),%ebp
 8049ef9:	73 00                	jae    8049efb <_IO_stdin_used+0x667>
 8049efb:	00 43 75             	add    %al,0x75(%ebx)
 8049efe:	72 73                	jb     8049f73 <_IO_stdin_used+0x6df>
 8049f00:	65 73 2c             	gs jae 8049f2f <_IO_stdin_used+0x69b>
 8049f03:	20 79 6f             	and    %bh,0x6f(%ecx)
 8049f06:	75 27                	jne    8049f2f <_IO_stdin_used+0x69b>
 8049f08:	76 65                	jbe    8049f6f <_IO_stdin_used+0x6db>
 8049f0a:	20 66 6f             	and    %ah,0x6f(%esi)
 8049f0d:	75 6e                	jne    8049f7d <_IO_stdin_used+0x6e9>
 8049f0f:	64 20 74 68 65       	and    %dh,%fs:0x65(%eax,%ebp,2)
 8049f14:	20 73 65             	and    %dh,0x65(%ebx)
 8049f17:	63 72 65             	arpl   %si,0x65(%edx)
 8049f1a:	74 20                	je     8049f3c <_IO_stdin_used+0x6a8>
 8049f1c:	70 68                	jo     8049f86 <_IO_stdin_used+0x6f2>
 8049f1e:	61                   	popa   
 8049f1f:	73 65                	jae    8049f86 <_IO_stdin_used+0x6f2>
 8049f21:	21 00                	and    %eax,(%eax)
 8049f23:	00 42 75             	add    %al,0x75(%edx)
 8049f26:	74 20                	je     8049f48 <_IO_stdin_used+0x6b4>
 8049f28:	66 69 6e 64 69 6e    	imul   $0x6e69,0x64(%esi),%bp
 8049f2e:	67 20 69 74          	and    %ch,0x74(%bx,%di)
 8049f32:	20 61 6e             	and    %ah,0x6e(%ecx)
 8049f35:	64 20 73 6f          	and    %dh,%fs:0x6f(%ebx)
 8049f39:	6c                   	insb   (%dx),%es:(%edi)
 8049f3a:	76 69                	jbe    8049fa5 <__FRAME_END__+0x1d>
 8049f3c:	6e                   	outsb  %ds:(%esi),(%dx)
 8049f3d:	67 20 69 74          	and    %ch,0x74(%bx,%di)
 8049f41:	20 61 72             	and    %ah,0x72(%ecx)
 8049f44:	65 20 71 75          	and    %dh,%gs:0x75(%ecx)
 8049f48:	69 74 65 20 64 69 66 	imul   $0x66666964,0x20(%ebp,%eiz,2),%esi
 8049f4f:	66 
 8049f50:	65 72 65             	gs jb  8049fb8 <__FRAME_END__+0x30>
 8049f53:	6e                   	outsb  %ds:(%esi),(%dx)
 8049f54:	74 2e                	je     8049f84 <_IO_stdin_used+0x6f0>
 8049f56:	2e 2e 00 00          	cs add %al,%cs:(%eax)
 8049f5a:	00 00                	add    %al,(%eax)
 8049f5c:	43                   	inc    %ebx
 8049f5d:	6f                   	outsl  %ds:(%esi),(%dx)
 8049f5e:	6e                   	outsb  %ds:(%esi),(%dx)
 8049f5f:	67 72 61             	addr16 jb 8049fc3 <__FRAME_END__+0x3b>
 8049f62:	74 75                	je     8049fd9 <__FRAME_END__+0x51>
 8049f64:	6c                   	insb   (%dx),%es:(%edi)
 8049f65:	61                   	popa   
 8049f66:	74 69                	je     8049fd1 <__FRAME_END__+0x49>
 8049f68:	6f                   	outsl  %ds:(%esi),(%dx)
 8049f69:	6e                   	outsb  %ds:(%esi),(%dx)
 8049f6a:	73 21                	jae    8049f8d <__FRAME_END__+0x5>
 8049f6c:	20 59 6f             	and    %bl,0x6f(%ecx)
 8049f6f:	75 27                	jne    8049f98 <__FRAME_END__+0x10>
 8049f71:	76 65                	jbe    8049fd8 <__FRAME_END__+0x50>
 8049f73:	20 64 65 66          	and    %ah,0x66(%ebp,%eiz,2)
 8049f77:	75 73                	jne    8049fec <__FRAME_END__+0x64>
 8049f79:	65 64 20 74 68 65    	gs and %dh,%fs:0x65(%eax,%ebp,2)
 8049f7f:	20 62 6f             	and    %ah,0x6f(%edx)
 8049f82:	6d                   	insl   (%dx),%es:(%edi)
 8049f83:	62 21                	bound  %esp,(%ecx)
	...

Disassembly of section .eh_frame:

08049f88 <__FRAME_END__>:
 8049f88:	00 00                	add    %al,(%eax)
	...

Disassembly of section .ctors:

0804a000 <__CTOR_LIST__>:
 804a000:	ff                   	(bad)  
 804a001:	ff                   	(bad)  
 804a002:	ff                   	(bad)  
 804a003:	ff                 	incl   (%eax)

0804a004 <__CTOR_END__>:
 804a004:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dtors:

0804a008 <__DTOR_LIST__>:
 804a008:	ff                   	(bad)  
 804a009:	ff                   	(bad)  
 804a00a:	ff                   	(bad)  
 804a00b:	ff                 	incl   (%eax)

0804a00c <__DTOR_END__>:
 804a00c:	00 00                	add    %al,(%eax)
	...

Disassembly of section .jcr:

0804a010 <__JCR_END__>:
 804a010:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dynamic:

0804a014 <_DYNAMIC>:
 804a014:	01 00                	add    %eax,(%eax)
 804a016:	00 00                	add    %al,(%eax)
 804a018:	10 00                	adc    %al,(%eax)
 804a01a:	00 00                	add    %al,(%eax)
 804a01c:	0c 00                	or     $0x0,%al
 804a01e:	00 00                	add    %al,(%eax)
 804a020:	10 87 04 08 0d 00    	adc    %al,0xd0804(%edi)
 804a026:	00 00                	add    %al,(%eax)
 804a028:	74 98                	je     8049fc2 <__FRAME_END__+0x3a>
 804a02a:	04 08                	add    $0x8,%al
 804a02c:	04 00                	add    $0x0,%al
 804a02e:	00 00                	add    %al,(%eax)
 804a030:	48                   	dec    %eax
 804a031:	81 04 08 05 00 00 00 	addl   $0x5,(%eax,%ecx,1)
 804a038:	50                   	push   %eax
 804a039:	84 04 08             	test   %al,(%eax,%ecx,1)
 804a03c:	06                   	push   %es
 804a03d:	00 00                	add    %al,(%eax)
 804a03f:	00 20                	add    %ah,(%eax)
 804a041:	82 04 08 0a          	addb   $0xa,(%eax,%ecx,1)
 804a045:	00 00                	add    %al,(%eax)
 804a047:	00 27                	add    %ah,(%edi)
 804a049:	01 00                	add    %eax,(%eax)
 804a04b:	00 0b                	add    %cl,(%ebx)
 804a04d:	00 00                	add    %al,(%eax)
 804a04f:	00 10                	add    %dl,(%eax)
 804a051:	00 00                	add    %al,(%eax)
 804a053:	00 15 00 00 00 00    	add    %dl,0x0
 804a059:	00 00                	add    %al,(%eax)
 804a05b:	00 03                	add    %al,(%ebx)
 804a05d:	00 00                	add    %al,(%eax)
 804a05f:	00 e0                	add    %ah,%al
 804a061:	a0 04 08 02 00       	mov    0x20804,%al
 804a066:	00 00                	add    %al,(%eax)
 804a068:	f8                   	clc    
 804a069:	00 00                	add    %al,(%eax)
 804a06b:	00 14 00             	add    %dl,(%eax,%eax,1)
 804a06e:	00 00                	add    %al,(%eax)
 804a070:	11 00                	adc    %eax,(%eax)
 804a072:	00 00                	add    %al,(%eax)
 804a074:	17                   	pop    %ss
 804a075:	00 00                	add    %al,(%eax)
 804a077:	00 18                	add    %bl,(%eax)
 804a079:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 804a07c:	11 00                	adc    %eax,(%eax)
 804a07e:	00 00                	add    %al,(%eax)
 804a080:	00 86 04 08 12 00    	add    %al,0x120804(%esi)
 804a086:	00 00                	add    %al,(%eax)
 804a088:	18 00                	sbb    %al,(%eax)
 804a08a:	00 00                	add    %al,(%eax)
 804a08c:	13 00                	adc    (%eax),%eax
 804a08e:	00 00                	add    %al,(%eax)
 804a090:	08 00                	or     %al,(%eax)
 804a092:	00 00                	add    %al,(%eax)
 804a094:	fe                   	(bad)  
 804a095:	ff                   	(bad)  
 804a096:	ff 6f c0             	ljmp   *-0x40(%edi)
 804a099:	85 04 08             	test   %eax,(%eax,%ecx,1)
 804a09c:	ff                   	(bad)  
 804a09d:	ff                   	(bad)  
 804a09e:	ff 6f 01             	ljmp   *0x1(%edi)
 804a0a1:	00 00                	add    %al,(%eax)
 804a0a3:	00 f0                	add    %dh,%al
 804a0a5:	ff                   	(bad)  
 804a0a6:	ff 6f 78             	ljmp   *0x78(%edi)
 804a0a9:	85 04 08             	test   %eax,(%eax,%ecx,1)
	...

Disassembly of section .got:

0804a0dc <.got>:
 804a0dc:	00 00                	add    %al,(%eax)
	...

Disassembly of section .got.plt:

0804a0e0 <_GLOBAL_OFFSET_TABLE_>:
 804a0e0:	14 a0                	adc    $0xa0,%al
 804a0e2:	04 08                	add    $0x8,%al
	...
 804a0ec:	3e 87 04 08          	xchg   %eax,%ds:(%eax,%ecx,1)
 804a0f0:	4e                   	dec    %esi
 804a0f1:	87 04 08             	xchg   %eax,(%eax,%ecx,1)
 804a0f4:	5e                   	pop    %esi
 804a0f5:	87 04 08             	xchg   %eax,(%eax,%ecx,1)
 804a0f8:	6e                   	outsb  %ds:(%esi),(%dx)
 804a0f9:	87 04 08             	xchg   %eax,(%eax,%ecx,1)
 804a0fc:	7e 87                	jle    804a085 <_DYNAMIC+0x71>
 804a0fe:	04 08                	add    $0x8,%al
 804a100:	8e 87 04 08 9e 87    	mov    -0x7861f7fc(%edi),%es
 804a106:	04 08                	add    $0x8,%al
 804a108:	ae                   	scas   %es:(%edi),%al
 804a109:	87 04 08             	xchg   %eax,(%eax,%ecx,1)
 804a10c:	be 87 04 08 ce       	mov    $0xce080487,%esi
 804a111:	87 04 08             	xchg   %eax,(%eax,%ecx,1)
 804a114:	de 87 04 08 ee 87    	fiadds -0x7811f7fc(%edi)
 804a11a:	04 08                	add    $0x8,%al
 804a11c:	fe 87 04 08 0e 88    	incb   -0x77f1f7fc(%edi)
 804a122:	04 08                	add    $0x8,%al
 804a124:	1e                   	push   %ds
 804a125:	88 04 08             	mov    %al,(%eax,%ecx,1)
 804a128:	2e 88 04 08          	mov    %al,%cs:(%eax,%ecx,1)
 804a12c:	3e 88 04 08          	mov    %al,%ds:(%eax,%ecx,1)
 804a130:	4e                   	dec    %esi
 804a131:	88 04 08             	mov    %al,(%eax,%ecx,1)
 804a134:	5e                   	pop    %esi
 804a135:	88 04 08             	mov    %al,(%eax,%ecx,1)
 804a138:	6e                   	outsb  %ds:(%esi),(%dx)
 804a139:	88 04 08             	mov    %al,(%eax,%ecx,1)
 804a13c:	7e 88                	jle    804a0c6 <_DYNAMIC+0xb2>
 804a13e:	04 08                	add    $0x8,%al
 804a140:	8e 88 04 08 9e 88    	mov    -0x7761f7fc(%eax),%cs
 804a146:	04 08                	add    $0x8,%al
 804a148:	ae                   	scas   %es:(%edi),%al
 804a149:	88 04 08             	mov    %al,(%eax,%ecx,1)
 804a14c:	be 88 04 08 ce       	mov    $0xce080488,%esi
 804a151:	88 04 08             	mov    %al,(%eax,%ecx,1)
 804a154:	de 88 04 08 ee 88    	fimuls -0x7711f7fc(%eax)
 804a15a:	04 08                	add    $0x8,%al
 804a15c:	fe 88 04 08 0e 89    	decb   -0x76f1f7fc(%eax)
 804a162:	04 08                	add    $0x8,%al
 804a164:	1e                   	push   %ds
 804a165:	89 04 08             	mov    %eax,(%eax,%ecx,1)

Disassembly of section .data:

0804a180 <__data_start>:
 804a180:	00 00                	add    %al,(%eax)
	...

0804a184 <__dso_handle>:
 804a184:	00 00                	add    %al,(%eax)
	...

0804a188 <p.5619>:
 804a188:	0c a0                	or     $0xa0,%al
 804a18a:	04 08                	add    $0x8,%al
	...

0804a1a0 <bomb_id>:
 804a1a0:	0a 00                	or     (%eax),%al
	...

0804a1c0 <lab_id>:
 804a1c0:	63 73 61             	arpl   %si,0x61(%ebx)
 804a1c3:	70 70                	jo     804a235 <lab_id+0x75>
 804a1c5:	32 30                	xor    (%eax),%dh
 804a1c7:	30 38                	xor    %bh,(%eax)
	...

0804a5c0 <array.2511>:
 804a5c0:	69 73 72 76 65 61 77 	imul   $0x77616576,0x72(%ebx),%esi
 804a5c7:	68 6f 62 70 6e       	push   $0x6e70626f
 804a5cc:	75 74                	jne    804a642 <node0+0x6>
 804a5ce:	66 67              	addr16 push %di

0804a5d0 <node9>:
 804a5d0:	57                   	push   %edi
 804a5d1:	00 00                	add    %al,(%eax)
 804a5d3:	00 09                	add    %cl,(%ecx)
 804a5d5:	00 00                	add    %al,(%eax)
 804a5d7:	00 00                	add    %al,(%eax)
 804a5d9:	00 00                	add    %al,(%eax)
	...

0804a5dc <node8>:
 804a5dc:	0b 03                	or     (%ebx),%eax
 804a5de:	00 00                	add    %al,(%eax)
 804a5e0:	08 00                	or     %al,(%eax)
 804a5e2:	00 00                	add    %al,(%eax)
 804a5e4:	d0 a5 04 08      	shlb   0x2b90804(%ebp)

0804a5e8 <node7>:
 804a5e8:	b9 02 00 00 07       	mov    $0x7000002,%ecx
 804a5ed:	00 00                	add    %al,(%eax)
 804a5ef:	00 dc                	add    %bl,%ah
 804a5f1:	a5                   	movsl  %ds:(%esi),%es:(%edi)
 804a5f2:	04 08                	add    $0x8,%al

0804a5f4 <node6>:
 804a5f4:	20 02                	and    %al,(%edx)
 804a5f6:	00 00                	add    %al,(%eax)
 804a5f8:	06                   	push   %es
 804a5f9:	00 00                	add    %al,(%eax)
 804a5fb:	00 e8                	add    %ch,%al
 804a5fd:	a5                   	movsl  %ds:(%esi),%es:(%edi)
 804a5fe:	04 08                	add    $0x8,%al

0804a600 <node5>:
 804a600:	82 03 00             	addb   $0x0,(%ebx)
 804a603:	00 05 00 00 00 f4    	add    %al,0xf4000000
 804a609:	a5                   	movsl  %ds:(%esi),%es:(%edi)
 804a60a:	04 08                	add    $0x8,%al

0804a60c <node4>:
 804a60c:	97                   	xchg   %eax,%edi
 804a60d:	02 00                	add    (%eax),%al
 804a60f:	00 04 00             	add    %al,(%eax,%eax,1)
 804a612:	00 00                	add    %al,(%eax)
 804a614:	00 a6 04 08      	add    %ah,0x800804(%esi)

0804a618 <node3>:
 804a618:	80 00 00             	addb   $0x0,(%eax)
 804a61b:	00 03                	add    %al,(%ebx)
 804a61d:	00 00                	add    %al,(%eax)
 804a61f:	00 0c a6             	add    %cl,(%esi,%eiz,4)
 804a622:	04 08                	add    $0x8,%al

0804a624 <node2>:
 804a624:	9e                   	sahf   
 804a625:	00 00                	add    %al,(%eax)
 804a627:	00 02                	add    %al,(%edx)
 804a629:	00 00                	add    %al,(%eax)
 804a62b:	00 18                	add    %bl,(%eax)
 804a62d:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 804a62e:	04 08                	add    $0x8,%al

0804a630 <node1>:
 804a630:	57                   	push   %edi
 804a631:	03 00                	add    (%eax),%eax
 804a633:	00 01                	add    %al,(%ecx)
 804a635:	00 00                	add    %al,(%eax)
 804a637:	00 24 a6             	add    %ah,(%esi,%eiz,4)
 804a63a:	04 08                	add    $0x8,%al

0804a63c <node0>:
	...
 804a644:	30 a6 04 08      	xor    %ah,0x3e90804(%esi)

0804a648 <n48>:
 804a648:	e9 03 00 00 00       	jmp    804a650 <n48+0x8>
 804a64d:	00 00                	add    %al,(%eax)
 804a64f:	00 00                	add    %al,(%eax)
 804a651:	00 00                	add    %al,(%eax)
	...

0804a654 <n46>:
 804a654:	2f                   	das    
	...

0804a660 <n43>:
 804a660:	14 00                	adc    $0x0,%al
	...

0804a66c <n42>:
 804a66c:	07                   	pop    %es
	...

0804a678 <n44>:
 804a678:	23 00                	and    (%eax),%eax
	...

0804a684 <n47>:
 804a684:	63 00                	arpl   %ax,(%eax)
	...

0804a690 <n41>:
 804a690:	01 00                	add    %eax,(%eax)
	...

0804a69c <n45>:
 804a69c:	28 00                	sub    %al,(%eax)
	...

0804a6a8 <n34>:
 804a6a8:	6b 00 00             	imul   $0x0,(%eax),%eax
 804a6ab:	00 84 a6 04 08 48 a6 	add    %al,-0x59b7f7fc(%esi,%eiz,4)
 804a6b2:	04 08                	add    $0x8,%al

0804a6b4 <n31>:
 804a6b4:	06                   	push   %es
 804a6b5:	00 00                	add    %al,(%eax)
 804a6b7:	00 90 a6 04 08 6c    	add    %dl,0x6c0804a6(%eax)
 804a6bd:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 804a6be:	04 08                	add    $0x8,%al

0804a6c0 <n33>:
 804a6c0:	2d 00 00 00 9c       	sub    $0x9c000000,%eax
 804a6c5:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 804a6c6:	04 08                	add    $0x8,%al
 804a6c8:	54                   	push   %esp
 804a6c9:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 804a6ca:	04 08                	add    $0x8,%al

0804a6cc <n32>:
 804a6cc:	16                   	push   %ss
 804a6cd:	00 00                	add    %al,(%eax)
 804a6cf:	00 60 a6             	add    %ah,-0x5a(%eax)
 804a6d2:	04 08                	add    $0x8,%al
 804a6d4:	78 a6                	js     804a67c <n44+0x4>
 804a6d6:	04 08                	add    $0x8,%al

0804a6d8 <n22>:
 804a6d8:	32 00                	xor    (%eax),%al
 804a6da:	00 00                	add    %al,(%eax)
 804a6dc:	c0 a6 04 08 a8 a6 04 	shlb   $0x4,-0x5957f7fc(%esi)
 804a6e3:	08                 	or     %cl,(%eax)

0804a6e4 <n21>:
 804a6e4:	08 00                	or     %al,(%eax)
 804a6e6:	00 00                	add    %al,(%eax)
 804a6e8:	b4 a6                	mov    $0xa6,%ah
 804a6ea:	04 08                	add    $0x8,%al
 804a6ec:	cc                   	int3   
 804a6ed:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 804a6ee:	04 08                	add    $0x8,%al

0804a6f0 <n1>:
 804a6f0:	24 00                	and    $0x0,%al
 804a6f2:	00 00                	add    %al,(%eax)
 804a6f4:	e4 a6                	in     $0xa6,%al
 804a6f6:	04 08                	add    $0x8,%al
 804a6f8:	d8 a6 04 08 00 00    	fsubs  0x804(%esi)
	...

0804a700 <host_table>:
 804a700:	74 9a                	je     804a69c <n45>
 804a702:	04 08                	add    $0x8,%al
 804a704:	89 9a 04 08 a2 9a    	mov    %ebx,-0x655df7fc(%edx)
 804a70a:	04 08                	add    $0x8,%al
 804a70c:	b7 9a                	mov    $0x9a,%bh
 804a70e:	04 08                	add    $0x8,%al
 804a710:	cc                   	int3   
 804a711:	9a 04 08 e2 9a 04 08 	lcall  $0x804,$0x9ae20804
 804a718:	f7 9a 04 08 10 9b    	negl   -0x64eff7fc(%edx)
 804a71e:	04 08                	add    $0x8,%al
 804a720:	28 9b 04 08 3f 9b    	sub    %bl,-0x64c0f7fc(%ebx)
 804a726:	04 08                	add    $0x8,%al
 804a728:	56                   	push   %esi
 804a729:	9b                   	fwait
 804a72a:	04 08                	add    $0x8,%al
 804a72c:	71 9b                	jno    804a6c9 <n33+0x9>
 804a72e:	04 08                	add    $0x8,%al
 804a730:	87 9b 04 08 a0 9b    	xchg   %ebx,-0x645ff7fc(%ebx)
 804a736:	04 08                	add    $0x8,%al
 804a738:	b5 9b                	mov    $0x9b,%ch
 804a73a:	04 08                	add    $0x8,%al
 804a73c:	d1 9b 04 08 e8 9b    	rcrl   -0x6417f7fc(%ebx)
 804a742:	04 08                	add    $0x8,%al
 804a744:	ff 9b 04 08 14 9c    	lcall  *-0x63ebf7fc(%ebx)
 804a74a:	04 08                	add    $0x8,%al
 804a74c:	2f                   	das    
 804a74d:	9c                   	pushf  
 804a74e:	04 08                	add    $0x8,%al
 804a750:	47                   	inc    %edi
 804a751:	9c                   	pushf  
 804a752:	04 08                	add    $0x8,%al
 804a754:	5f                   	pop    %edi
 804a755:	9c                   	pushf  
 804a756:	04 08                	add    $0x8,%al
 804a758:	78 9c                	js     804a6f6 <n1+0x6>
 804a75a:	04 08                	add    $0x8,%al
 804a75c:	90                   	nop
 804a75d:	9c                   	pushf  
 804a75e:	04 08                	add    $0x8,%al
 804a760:	a9 9c 04 08 00       	test   $0x8049c,%eax
	...

Disassembly of section .bss:

0804a840 <stdout@@GLIBC_2.0>:
 804a840:	00 00                	add    %al,(%eax)
	...

0804a844 <stdin@@GLIBC_2.0>:
 804a844:	00 00                	add    %al,(%eax)
	...

0804a848 <completed.5621>:
 804a848:	00 00                	add    %al,(%eax)
	...

0804a84c <num_input_strings>:
 804a84c:	00 00                	add    %al,(%eax)
	...

0804a850 <infile>:
	...

0804a860 <input_strings>:
	...

0804aea0 <scratch>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	00 47 43             	add    %al,0x43(%edi)
   3:	43                   	inc    %ebx
   4:	3a 20                	cmp    (%eax),%ah
   6:	28 47 4e             	sub    %al,0x4e(%edi)
   9:	55                   	push   %ebp
   a:	29 20                	sub    %esp,(%eax)
   c:	34 2e                	xor    $0x2e,%al
   e:	31 2e                	xor    %ebp,(%esi)
  10:	32 20                	xor    (%eax),%ah
  12:	32 30                	xor    (%eax),%dh
  14:	30 36                	xor    %dh,(%esi)
  16:	31 31                	xor    %esi,(%ecx)
  18:	31 35 20 28 70 72    	xor    %esi,0x72702820
  1e:	65 72 65             	gs jb  86 <_init-0x804868a>
  21:	6c                   	insb   (%dx),%es:(%edi)
  22:	65 61                	gs popa 
  24:	73 65                	jae    8b <_init-0x8048685>
  26:	29 20                	sub    %esp,(%eax)
  28:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
  2c:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
  33:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132
  3a:	00 47 43             	add    %al,0x43(%edi)
  3d:	43                   	inc    %ebx
  3e:	3a 20                	cmp    (%eax),%ah
  40:	28 47 4e             	sub    %al,0x4e(%edi)
  43:	55                   	push   %ebp
  44:	29 20                	sub    %esp,(%eax)
  46:	34 2e                	xor    $0x2e,%al
  48:	31 2e                	xor    %ebp,(%esi)
  4a:	32 20                	xor    (%eax),%ah
  4c:	32 30                	xor    (%eax),%dh
  4e:	30 36                	xor    %dh,(%esi)
  50:	31 31                	xor    %esi,(%ecx)
  52:	31 35 20 28 70 72    	xor    %esi,0x72702820
  58:	65 72 65             	gs jb  c0 <_init-0x8048650>
  5b:	6c                   	insb   (%dx),%es:(%edi)
  5c:	65 61                	gs popa 
  5e:	73 65                	jae    c5 <_init-0x804864b>
  60:	29 20                	sub    %esp,(%eax)
  62:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
  66:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
  6d:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132
  74:	00 47 43             	add    %al,0x43(%edi)
  77:	43                   	inc    %ebx
  78:	3a 20                	cmp    (%eax),%ah
  7a:	28 47 4e             	sub    %al,0x4e(%edi)
  7d:	55                   	push   %ebp
  7e:	29 20                	sub    %esp,(%eax)
  80:	34 2e                	xor    $0x2e,%al
  82:	31 2e                	xor    %ebp,(%esi)
  84:	32 20                	xor    (%eax),%ah
  86:	32 30                	xor    (%eax),%dh
  88:	30 36                	xor    %dh,(%esi)
  8a:	31 31                	xor    %esi,(%ecx)
  8c:	31 35 20 28 70 72    	xor    %esi,0x72702820
  92:	65 72 65             	gs jb  fa <_init-0x8048616>
  95:	6c                   	insb   (%dx),%es:(%edi)
  96:	65 61                	gs popa 
  98:	73 65                	jae    ff <_init-0x8048611>
  9a:	29 20                	sub    %esp,(%eax)
  9c:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
  a0:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
  a7:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132
  ae:	00 47 43             	add    %al,0x43(%edi)
  b1:	43                   	inc    %ebx
  b2:	3a 20                	cmp    (%eax),%ah
  b4:	28 47 4e             	sub    %al,0x4e(%edi)
  b7:	55                   	push   %ebp
  b8:	29 20                	sub    %esp,(%eax)
  ba:	34 2e                	xor    $0x2e,%al
  bc:	31 2e                	xor    %ebp,(%esi)
  be:	32 20                	xor    (%eax),%ah
  c0:	32 30                	xor    (%eax),%dh
  c2:	30 36                	xor    %dh,(%esi)
  c4:	31 31                	xor    %esi,(%ecx)
  c6:	31 35 20 28 70 72    	xor    %esi,0x72702820
  cc:	65 72 65             	gs jb  134 <_init-0x80485dc>
  cf:	6c                   	insb   (%dx),%es:(%edi)
  d0:	65 61                	gs popa 
  d2:	73 65                	jae    139 <_init-0x80485d7>
  d4:	29 20                	sub    %esp,(%eax)
  d6:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
  da:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
  e1:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132
  e8:	00 47 43             	add    %al,0x43(%edi)
  eb:	43                   	inc    %ebx
  ec:	3a 20                	cmp    (%eax),%ah
  ee:	28 47 4e             	sub    %al,0x4e(%edi)
  f1:	55                   	push   %ebp
  f2:	29 20                	sub    %esp,(%eax)
  f4:	34 2e                	xor    $0x2e,%al
  f6:	31 2e                	xor    %ebp,(%esi)
  f8:	32 20                	xor    (%eax),%ah
  fa:	32 30                	xor    (%eax),%dh
  fc:	30 36                	xor    %dh,(%esi)
  fe:	31 31                	xor    %esi,(%ecx)
 100:	31 35 20 28 70 72    	xor    %esi,0x72702820
 106:	65 72 65             	gs jb  16e <_init-0x80485a2>
 109:	6c                   	insb   (%dx),%es:(%edi)
 10a:	65 61                	gs popa 
 10c:	73 65                	jae    173 <_init-0x804859d>
 10e:	29 20                	sub    %esp,(%eax)
 110:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
 114:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
 11b:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132
 122:	00 47 43             	add    %al,0x43(%edi)
 125:	43                   	inc    %ebx
 126:	3a 20                	cmp    (%eax),%ah
 128:	28 47 4e             	sub    %al,0x4e(%edi)
 12b:	55                   	push   %ebp
 12c:	29 20                	sub    %esp,(%eax)
 12e:	34 2e                	xor    $0x2e,%al
 130:	31 2e                	xor    %ebp,(%esi)
 132:	32 20                	xor    (%eax),%ah
 134:	32 30                	xor    (%eax),%dh
 136:	30 36                	xor    %dh,(%esi)
 138:	31 31                	xor    %esi,(%ecx)
 13a:	31 35 20 28 70 72    	xor    %esi,0x72702820
 140:	65 72 65             	gs jb  1a8 <_init-0x8048568>
 143:	6c                   	insb   (%dx),%es:(%edi)
 144:	65 61                	gs popa 
 146:	73 65                	jae    1ad <_init-0x8048563>
 148:	29 20                	sub    %esp,(%eax)
 14a:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
 14e:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
 155:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132
 15c:	00 47 43             	add    %al,0x43(%edi)
 15f:	43                   	inc    %ebx
 160:	3a 20                	cmp    (%eax),%ah
 162:	28 47 4e             	sub    %al,0x4e(%edi)
 165:	55                   	push   %ebp
 166:	29 20                	sub    %esp,(%eax)
 168:	34 2e                	xor    $0x2e,%al
 16a:	31 2e                	xor    %ebp,(%esi)
 16c:	32 20                	xor    (%eax),%ah
 16e:	32 30                	xor    (%eax),%dh
 170:	30 36                	xor    %dh,(%esi)
 172:	31 31                	xor    %esi,(%ecx)
 174:	31 35 20 28 70 72    	xor    %esi,0x72702820
 17a:	65 72 65             	gs jb  1e2 <_init-0x804852e>
 17d:	6c                   	insb   (%dx),%es:(%edi)
 17e:	65 61                	gs popa 
 180:	73 65                	jae    1e7 <_init-0x8048529>
 182:	29 20                	sub    %esp,(%eax)
 184:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
 188:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
 18f:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132
 196:	00 47 43             	add    %al,0x43(%edi)
 199:	43                   	inc    %ebx
 19a:	3a 20                	cmp    (%eax),%ah
 19c:	28 47 4e             	sub    %al,0x4e(%edi)
 19f:	55                   	push   %ebp
 1a0:	29 20                	sub    %esp,(%eax)
 1a2:	34 2e                	xor    $0x2e,%al
 1a4:	31 2e                	xor    %ebp,(%esi)
 1a6:	32 20                	xor    (%eax),%ah
 1a8:	32 30                	xor    (%eax),%dh
 1aa:	30 36                	xor    %dh,(%esi)
 1ac:	31 31                	xor    %esi,(%ecx)
 1ae:	31 35 20 28 70 72    	xor    %esi,0x72702820
 1b4:	65 72 65             	gs jb  21c <_init-0x80484f4>
 1b7:	6c                   	insb   (%dx),%es:(%edi)
 1b8:	65 61                	gs popa 
 1ba:	73 65                	jae    221 <_init-0x80484ef>
 1bc:	29 20                	sub    %esp,(%eax)
 1be:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
 1c2:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
 1c9:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132
 1d0:	00 47 43             	add    %al,0x43(%edi)
 1d3:	43                   	inc    %ebx
 1d4:	3a 20                	cmp    (%eax),%ah
 1d6:	28 47 4e             	sub    %al,0x4e(%edi)
 1d9:	55                   	push   %ebp
 1da:	29 20                	sub    %esp,(%eax)
 1dc:	34 2e                	xor    $0x2e,%al
 1de:	31 2e                	xor    %ebp,(%esi)
 1e0:	32 20                	xor    (%eax),%ah
 1e2:	32 30                	xor    (%eax),%dh
 1e4:	30 36                	xor    %dh,(%esi)
 1e6:	31 31                	xor    %esi,(%ecx)
 1e8:	31 35 20 28 70 72    	xor    %esi,0x72702820
 1ee:	65 72 65             	gs jb  256 <_init-0x80484ba>
 1f1:	6c                   	insb   (%dx),%es:(%edi)
 1f2:	65 61                	gs popa 
 1f4:	73 65                	jae    25b <_init-0x80484b5>
 1f6:	29 20                	sub    %esp,(%eax)
 1f8:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
 1fc:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
 203:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	1c 00                	sbb    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	30 89 04 08 22 00    	xor    %cl,0x220804(%ecx)
	...
  1e:	00 00                	add    %al,(%eax)
  20:	2c 00                	sub    $0x0,%al
  22:	00 00                	add    %al,(%eax)
  24:	02 00                	add    (%eax),%al
  26:	0c 01                	or     $0x1,%al
  28:	00 00                	add    %al,(%eax)
  2a:	04 00                	add    $0x0,%al
  2c:	00 00                	add    %al,(%eax)
  2e:	00 00                	add    %al,(%eax)
  30:	54                   	push   %esp
  31:	89 04 08             	mov    %eax,(%eax,%ecx,1)
  34:	26 00 00             	add    %al,%es:(%eax)
  37:	00 10                	add    %dl,(%eax)
  39:	87 04 08             	xchg   %eax,(%eax,%ecx,1)
  3c:	0b 00                	or     (%eax),%eax
  3e:	00 00                	add    %al,(%eax)
  40:	74 98                	je     ffffffda <_end+0xf7fb50ea>
  42:	04 08                	add    $0x8,%al
  44:	13 00                	adc    (%eax),%eax
	...
  4e:	00 00                	add    %al,(%eax)
  50:	1c 00                	sbb    $0x0,%al
  52:	00 00                	add    %al,(%eax)
  54:	02 00                	add    (%eax),%al
  56:	a1 01 00 00 04       	mov    0x4000001,%eax
  5b:	00 00                	add    %al,(%eax)
  5d:	00 00                	add    %al,(%eax)
  5f:	00 d4                	add    %dl,%ah
  61:	89 04 08             	mov    %eax,(%eax,%ecx,1)
  64:	aa                   	stos   %al,%es:(%edi)
  65:	01 00                	add    %eax,(%eax)
	...
  6f:	00 24 00             	add    %ah,(%eax,%eax,1)
  72:	00 00                	add    %al,(%eax)
  74:	02 00                	add    (%eax),%al
  76:	4b                   	dec    %ebx
  77:	06                   	push   %es
  78:	00 00                	add    %al,(%eax)
  7a:	04 00                	add    $0x0,%al
  7c:	00 00                	add    %al,(%eax)
  7e:	00 00                	add    %al,(%eax)
  80:	25 87 04 08 02       	and    $0x2080487,%eax
  85:	00 00                	add    %al,(%eax)
  87:	00 8c 98 04 08 04 00 	add    %cl,0x40804(%eax,%ebx,4)
	...

Disassembly of section .debug_pubnames:

00000000 <.debug_pubnames>:
   0:	21 00                	and    %eax,(%eax)
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	7b 00                	jnp    8 <_init-0x8048708>
   8:	00 00                	add    %al,(%eax)
   a:	91                   	xchg   %eax,%ecx
   b:	00 00                	add    %al,(%eax)
   d:	00 79 00             	add    %bh,0x0(%ecx)
  10:	00 00                	add    %al,(%eax)
  12:	5f                   	pop    %edi
  13:	49                   	dec    %ecx
  14:	4f                   	dec    %edi
  15:	5f                   	pop    %edi
  16:	73 74                	jae    8c <_init-0x8048684>
  18:	64 69 6e 5f 75 73 65 	imul   $0x64657375,%fs:0x5f(%esi),%ebp
  1f:	64 
  20:	00 00                	add    %al,(%eax)
  22:	00 00                	add    %al,(%eax)
  24:	00 22                	add    %ah,(%edx)
  26:	00 00                	add    %al,(%eax)
  28:	00 02                	add    %al,(%edx)
  2a:	00 a1 01 00 00 aa    	add    %ah,-0x55ffffff(%ecx)
  30:	04 00                	add    $0x0,%al
  32:	00 28                	add    %ch,(%eax)
  34:	04 00                	add    $0x0,%al
  36:	00 6d 61             	add    %ch,0x61(%ebp)
  39:	69 6e 00 8e 04 00 00 	imul   $0x48e,0x0(%esi),%ebp
  40:	69 6e 66 69 6c 65 00 	imul   $0x656c69,0x66(%esi),%ebp
  47:	00 00                	add    %al,(%eax)
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	77 00                	ja     2 <_init-0x804870e>
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 01                	add    $0x1,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	30 89 04 08 52 89    	xor    %cl,-0x76adf7fc(%ecx)
  16:	04 08                	add    $0x8,%al
  18:	2e 2e 2f             	cs cs das 
  1b:	73 79                	jae    96 <_init-0x804867a>
  1d:	73 64                	jae    83 <_init-0x804868d>
  1f:	65 70 73             	gs jo  95 <_init-0x804867b>
  22:	2f                   	das    
  23:	69 33 38 36 2f 65    	imul   $0x652f3638,(%ebx),%esi
  29:	6c                   	insb   (%dx),%es:(%edi)
  2a:	66 2f                	data16 das 
  2c:	73 74                	jae    a2 <_init-0x804866e>
  2e:	61                   	popa   
  2f:	72 74                	jb     a5 <_init-0x804866b>
  31:	2e 53                	cs push %ebx
  33:	00 2f                	add    %ch,(%edi)
  35:	62 75 69             	bound  %esi,0x69(%ebp)
  38:	6c                   	insb   (%dx),%es:(%edi)
  39:	64 2f                	fs das 
  3b:	62 75 69             	bound  %esi,0x69(%ebp)
  3e:	6c                   	insb   (%dx),%es:(%edi)
  3f:	64 64 2f             	fs fs das 
  42:	67 6c                	insb   (%dx),%es:(%di)
  44:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
  4b:	2e 36 2e 64 73 31    	cs ss cs fs jae,pn 82 <_init-0x804868e>
  51:	2f                   	das    
  52:	62 75 69             	bound  %esi,0x69(%ebp)
  55:	6c                   	insb   (%dx),%es:(%edi)
  56:	64 2d 74 72 65 65    	fs sub $0x65657274,%eax
  5c:	2f                   	das    
  5d:	67 6c                	insb   (%dx),%es:(%di)
  5f:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
  66:	2e 36 2f             	cs ss das 
  69:	63 73 75             	arpl   %si,0x75(%ebx)
  6c:	00 47 4e             	add    %al,0x4e(%edi)
  6f:	55                   	push   %ebp
  70:	20 41 53             	and    %al,0x53(%ecx)
  73:	20 32                	and    %dh,(%edx)
  75:	2e 31 37             	xor    %esi,%cs:(%edi)
  78:	00 01                	add    %al,(%ecx)
  7a:	80 8d 00 00 00 02 00 	orb    $0x0,0x2000000(%ebp)
  81:	14 00                	adc    $0x0,%al
  83:	00 00                	add    %al,(%eax)
  85:	04 01                	add    $0x1,%al
  87:	5b                   	pop    %ebx
  88:	00 00                	add    %al,(%eax)
  8a:	00 54 89 04          	add    %dl,0x4(%ecx,%ecx,4)
  8e:	08 54 89 04          	or     %dl,0x4(%ecx,%ecx,4)
  92:	08 00                	or     %al,(%eax)
  94:	00 00                	add    %al,(%eax)
  96:	00 01                	add    %al,(%ecx)
  98:	34 00                	xor    $0x0,%al
  9a:	00 00                	add    %al,(%eax)
  9c:	45                   	inc    %ebp
  9d:	00 00                	add    %al,(%eax)
  9f:	00 02                	add    %al,(%edx)
  a1:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  a2:	00 00                	add    %al,(%eax)
  a4:	00 04 07             	add    %al,(%edi,%eax,1)
  a7:	02 8c 00 00 00 01 08 	add    0x8010000(%eax,%eax,1),%cl
  ae:	02 b1 00 00 00 02    	add    0x2000000(%ecx),%dh
  b4:	07                   	pop    %es
  b5:	02 9f 00 00 00 04    	add    0x4000000(%edi),%bl
  bb:	07                   	pop    %es
  bc:	02 8e 00 00 00 01    	add    0x1000000(%esi),%cl
  c2:	06                   	push   %es
  c3:	02 3b                	add    (%ebx),%bh
  c5:	00 00                	add    %al,(%eax)
  c7:	00 02                	add    %al,(%edx)
  c9:	05 03 69 6e 74       	add    $0x746e6903,%eax
  ce:	00 04 05 02 7e 00 00 	add    %al,0x7e02(,%eax,1)
  d5:	00 08                	add    %cl,(%eax)
  d7:	05 02 9a 00 00       	add    $0x9a02,%eax
  dc:	00 08                	add    %cl,(%eax)
  de:	07                   	pop    %es
  df:	02 83 00 00 00 04    	add    0x4000000(%ebx),%al
  e5:	05 02 a4 00 00       	add    $0xa402,%eax
  ea:	00 04 07             	add    %al,(%edi,%eax,1)
  ed:	02 95 00 00 00 01    	add    0x1000000(%ebp),%dl
  f3:	06                   	push   %es
  f4:	04 c4                	add    $0xc4,%al
  f6:	00 00                	add    %al,(%eax)
  f8:	00 01                	add    %al,(%ecx)
  fa:	19 8b 00 00 00 01    	sbb    %ecx,0x1000000(%ebx)
 100:	05 03 94 98 04       	add    $0x4989403,%eax
 105:	08 05 4f 00 00 00    	or     %al,0x4f
 10b:	00 91 00 00 00 02    	add    %dl,0x2000000(%ecx)
 111:	00 56 00             	add    %dl,0x0(%esi)
 114:	00 00                	add    %al,(%eax)
 116:	04 01                	add    $0x1,%al
 118:	82 00 00             	addb   $0x0,(%eax)
 11b:	00 2f                	add    %ch,(%edi)
 11d:	62 75 69             	bound  %esi,0x69(%ebp)
 120:	6c                   	insb   (%dx),%es:(%edi)
 121:	64 2f                	fs das 
 123:	62 75 69             	bound  %esi,0x69(%ebp)
 126:	6c                   	insb   (%dx),%es:(%edi)
 127:	64 64 2f             	fs fs das 
 12a:	67 6c                	insb   (%dx),%es:(%di)
 12c:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
 133:	2e 36 2e 64 73 31    	cs ss cs fs jae,pn 16a <_init-0x80485a6>
 139:	2f                   	das    
 13a:	62 75 69             	bound  %esi,0x69(%ebp)
 13d:	6c                   	insb   (%dx),%es:(%edi)
 13e:	64 2d 74 72 65 65    	fs sub $0x65657274,%eax
 144:	2f                   	das    
 145:	69 33 38 36 2d 6c    	imul   $0x6c2d3638,(%ebx),%esi
 14b:	69 62 63 2f 63 73 75 	imul   $0x7573632f,0x63(%edx),%esp
 152:	2f                   	das    
 153:	63 72 74             	arpl   %si,0x74(%edx)
 156:	69 2e 53 00 2f 62    	imul   $0x622f0053,(%esi),%ebp
 15c:	75 69                	jne    1c7 <_init-0x8048549>
 15e:	6c                   	insb   (%dx),%es:(%edi)
 15f:	64 2f                	fs das 
 161:	62 75 69             	bound  %esi,0x69(%ebp)
 164:	6c                   	insb   (%dx),%es:(%edi)
 165:	64 64 2f             	fs fs das 
 168:	67 6c                	insb   (%dx),%es:(%di)
 16a:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
 171:	2e 36 2e 64 73 31    	cs ss cs fs jae,pn 1a8 <_init-0x8048568>
 177:	2f                   	das    
 178:	62 75 69             	bound  %esi,0x69(%ebp)
 17b:	6c                   	insb   (%dx),%es:(%edi)
 17c:	64 2d 74 72 65 65    	fs sub $0x65657274,%eax
 182:	2f                   	das    
 183:	67 6c                	insb   (%dx),%es:(%di)
 185:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
 18c:	2e 36 2f             	cs ss das 
 18f:	63 73 75             	arpl   %si,0x75(%ebx)
 192:	00 47 4e             	add    %al,0x4e(%edi)
 195:	55                   	push   %ebp
 196:	20 41 53             	and    %al,0x53(%ecx)
 199:	20 32                	and    %dh,(%edx)
 19b:	2e 31 37             	xor    %esi,%cs:(%edi)
 19e:	00 01                	add    %al,(%ecx)
 1a0:	80 a6 04 00 00 02 00 	andb   $0x0,0x2000004(%esi)
 1a7:	66 00 00             	data16 add %al,(%eax)
 1aa:	00 04 01             	add    %al,(%ecx,%eax,1)
 1ad:	24 01                	and    $0x1,%al
 1af:	00 00                	add    %al,(%eax)
 1b1:	7e 8b                	jle    13e <_init-0x80485d2>
 1b3:	04 08                	add    $0x8,%al
 1b5:	d4 89                	aam    $0x89
 1b7:	04 08                	add    $0x8,%al
 1b9:	47                   	inc    %edi
 1ba:	4e                   	dec    %esi
 1bb:	55                   	push   %ebp
 1bc:	20 43 20             	and    %al,0x20(%ebx)
 1bf:	34 2e                	xor    $0x2e,%al
 1c1:	31 2e                	xor    %ebp,(%esi)
 1c3:	32 20                	xor    (%eax),%ah
 1c5:	32 30                	xor    (%eax),%dh
 1c7:	30 36                	xor    %dh,(%esi)
 1c9:	31 31                	xor    %esi,(%ecx)
 1cb:	31 35 20 28 70 72    	xor    %esi,0x72702820
 1d1:	65 72 65             	gs jb  239 <_init-0x80484d7>
 1d4:	6c                   	insb   (%dx),%es:(%edi)
 1d5:	65 61                	gs popa 
 1d7:	73 65                	jae    23e <_init-0x80484d2>
 1d9:	29 20                	sub    %esp,(%eax)
 1db:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
 1df:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
 1e6:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132
 1ed:	01 62 6f             	add    %esp,0x6f(%edx)
 1f0:	6d                   	insl   (%dx),%es:(%edi)
 1f1:	62 2e                	bound  %ebp,(%esi)
 1f3:	63 00                	arpl   %ax,(%eax)
 1f5:	2f                   	das    
 1f6:	68 6f 6d 65 2f       	push   $0x2f656d6f
 1fb:	73 78                	jae    275 <_init-0x804849b>
 1fd:	66 2f                	data16 das 
 1ff:	63 73 61             	arpl   %si,0x61(%ebx)
 202:	70 70                	jo     274 <_init-0x804849c>
 204:	2f                   	das    
 205:	62 6f 6d             	bound  %ebp,0x6d(%edi)
 208:	62 6c 61 62          	bound  %ebp,0x62(%ecx,%eiz,2)
 20c:	2f                   	das    
 20d:	73 72                	jae    281 <_init-0x804848f>
 20f:	63 00                	arpl   %ax,(%eax)
 211:	02 d3                	add    %bl,%dl
 213:	00 00                	add    %al,(%eax)
 215:	00 04 07             	add    %al,(%edi,%eax,1)
 218:	03 75 6e             	add    0x6e(%ebp),%esi
 21b:	73 69                	jae    286 <_init-0x804848a>
 21d:	67 6e                	outsb  %ds:(%si),(%dx)
 21f:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
 224:	61                   	popa   
 225:	72 00                	jb     227 <_init-0x80484e9>
 227:	01 08                	add    %ecx,(%eax)
 229:	03 73 68             	add    0x68(%ebx),%esi
 22c:	6f                   	outsl  %ds:(%esi),(%dx)
 22d:	72 74                	jb     2a3 <_init-0x804846d>
 22f:	20 75 6e             	and    %dh,0x6e(%ebp)
 232:	73 69                	jae    29d <_init-0x8048473>
 234:	67 6e                	outsb  %ds:(%si),(%dx)
 236:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 23b:	74 00                	je     23d <_init-0x80484d3>
 23d:	02 07                	add    (%edi),%al
 23f:	03 6c 6f 6e          	add    0x6e(%edi,%ebp,2),%ebp
 243:	67 20 75 6e          	and    %dh,0x6e(%di)
 247:	73 69                	jae    2b2 <_init-0x804845e>
 249:	67 6e                	outsb  %ds:(%si),(%dx)
 24b:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 250:	74 00                	je     252 <_init-0x80484be>
 252:	04 07                	add    $0x7,%al
 254:	03 73 69             	add    0x69(%ebx),%esi
 257:	67 6e                	outsb  %ds:(%si),(%dx)
 259:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
 25e:	61                   	popa   
 25f:	72 00                	jb     261 <_init-0x80484af>
 261:	01 06                	add    %eax,(%esi)
 263:	03 73 68             	add    0x68(%ebx),%esi
 266:	6f                   	outsl  %ds:(%esi),(%dx)
 267:	72 74                	jb     2dd <_init-0x8048433>
 269:	20 69 6e             	and    %ch,0x6e(%ecx)
 26c:	74 00                	je     26e <_init-0x80484a2>
 26e:	02 05 03 69 6e 74    	add    0x746e6903,%al
 274:	00 04 05 03 6c 6f 6e 	add    %al,0x6e6f6c03(,%eax,1)
 27b:	67 20 6c 6f          	and    %ch,0x6f(%si)
 27f:	6e                   	outsb  %ds:(%esi),(%dx)
 280:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
 284:	74 00                	je     286 <_init-0x804848a>
 286:	08 05 03 6c 6f 6e    	or     %al,0x6e6f6c03
 28c:	67 20 6c 6f          	and    %ch,0x6f(%si)
 290:	6e                   	outsb  %ds:(%esi),(%dx)
 291:	67 20 75 6e          	and    %dh,0x6e(%di)
 295:	73 69                	jae    300 <_init-0x8048410>
 297:	67 6e                	outsb  %ds:(%si),(%dx)
 299:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 29e:	74 00                	je     2a0 <_init-0x8048470>
 2a0:	08 07                	or     %al,(%edi)
 2a2:	04 5f                	add    $0x5f,%al
 2a4:	5f                   	pop    %edi
 2a5:	71 75                	jno    31c <_init-0x80483f4>
 2a7:	61                   	popa   
 2a8:	64 5f                	fs pop %edi
 2aa:	74 00                	je     2ac <_init-0x8048464>
 2ac:	04 3b                	add    $0x3b,%al
 2ae:	d6                   	(bad)  
 2af:	00 00                	add    %al,(%eax)
 2b1:	00 04 5f             	add    %al,(%edi,%ebx,2)
 2b4:	5f                   	pop    %edi
 2b5:	6f                   	outsl  %ds:(%esi),(%dx)
 2b6:	66 66 5f             	data16 pop %di
 2b9:	74 00                	je     2bb <_init-0x8048455>
 2bb:	04 8f                	add    $0x8f,%al
 2bd:	20 01                	and    %al,(%ecx)
 2bf:	00 00                	add    %al,(%eax)
 2c1:	03 6c 6f 6e          	add    0x6e(%edi,%ebp,2),%ebp
 2c5:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
 2c9:	74 00                	je     2cb <_init-0x8048445>
 2cb:	04 05                	add    $0x5,%al
 2cd:	04 5f                	add    $0x5f,%al
 2cf:	5f                   	pop    %edi
 2d0:	6f                   	outsl  %ds:(%esi),(%dx)
 2d1:	66 66 36 34 5f       	data16 data16 ss xor $0x5f,%al
 2d6:	74 00                	je     2d8 <_init-0x8048438>
 2d8:	04 90                	add    $0x90,%al
 2da:	01 01                	add    %eax,(%ecx)
 2dc:	00 00                	add    %al,(%eax)
 2de:	02 d3                	add    %bl,%dl
 2e0:	00 00                	add    %al,(%eax)
 2e2:	00 04 07             	add    %al,(%edi,%eax,1)
 2e5:	05 04 4a 01 00       	add    $0x14a04,%eax
 2ea:	00 03                	add    %al,(%ebx)
 2ec:	63 68 61             	arpl   %bp,0x61(%eax)
 2ef:	72 00                	jb     2f1 <_init-0x804841f>
 2f1:	01 06                	add    %eax,(%esi)
 2f3:	04 46                	add    $0x46,%al
 2f5:	49                   	dec    %ecx
 2f6:	4c                   	dec    %esp
 2f7:	45                   	inc    %ebp
 2f8:	00 02                	add    %al,(%edx)
 2fa:	2e 5e                	cs pop %esi
 2fc:	01 00                	add    %eax,(%eax)
 2fe:	00 06                	add    %al,(%esi)
 300:	a3 03 00 00 e0       	mov    %eax,0xe0000003
 305:	00 00                	add    %al,(%eax)
 307:	00 94 02 2e 07 5f 66 	add    %dl,0x665f072e(%edx,%eax,1)
 30e:	6c                   	insb   (%dx),%es:(%edi)
 30f:	61                   	popa   
 310:	67 73 00             	addr16 jae 313 <_init-0x80483fd>
 313:	03 0c 01             	add    (%ecx,%eax,1),%ecx
 316:	cf                   	iret   
 317:	00 00                	add    %al,(%eax)
 319:	00 02                	add    %al,(%edx)
 31b:	23 00                	and    (%eax),%eax
 31d:	07                   	pop    %es
 31e:	5f                   	pop    %edi
 31f:	49                   	dec    %ecx
 320:	4f                   	dec    %edi
 321:	5f                   	pop    %edi
 322:	72 65                	jb     389 <_init-0x8048387>
 324:	61                   	popa   
 325:	64 5f                	fs pop %edi
 327:	70 74                	jo     39d <_init-0x8048373>
 329:	72 00                	jb     32b <_init-0x80483e5>
 32b:	03 11                	add    (%ecx),%edx
 32d:	01 44 01 00          	add    %eax,0x0(%ecx,%eax,1)
 331:	00 02                	add    %al,(%edx)
 333:	23 04 07             	and    (%edi,%eax,1),%eax
 336:	5f                   	pop    %edi
 337:	49                   	dec    %ecx
 338:	4f                   	dec    %edi
 339:	5f                   	pop    %edi
 33a:	72 65                	jb     3a1 <_init-0x804836f>
 33c:	61                   	popa   
 33d:	64 5f                	fs pop %edi
 33f:	65 6e                	outsb  %gs:(%esi),(%dx)
 341:	64 00 03             	add    %al,%fs:(%ebx)
 344:	12 01                	adc    (%ecx),%al
 346:	44                   	inc    %esp
 347:	01 00                	add    %eax,(%eax)
 349:	00 02                	add    %al,(%edx)
 34b:	23 08                	and    (%eax),%ecx
 34d:	07                   	pop    %es
 34e:	5f                   	pop    %edi
 34f:	49                   	dec    %ecx
 350:	4f                   	dec    %edi
 351:	5f                   	pop    %edi
 352:	72 65                	jb     3b9 <_init-0x8048357>
 354:	61                   	popa   
 355:	64 5f                	fs pop %edi
 357:	62 61 73             	bound  %esp,0x73(%ecx)
 35a:	65 00 03             	add    %al,%gs:(%ebx)
 35d:	13 01                	adc    (%ecx),%eax
 35f:	44                   	inc    %esp
 360:	01 00                	add    %eax,(%eax)
 362:	00 02                	add    %al,(%edx)
 364:	23 0c 07             	and    (%edi,%eax,1),%ecx
 367:	5f                   	pop    %edi
 368:	49                   	dec    %ecx
 369:	4f                   	dec    %edi
 36a:	5f                   	pop    %edi
 36b:	77 72                	ja     3df <_init-0x8048331>
 36d:	69 74 65 5f 62 61 73 	imul   $0x65736162,0x5f(%ebp,%eiz,2),%esi
 374:	65 
 375:	00 03                	add    %al,(%ebx)
 377:	14 01                	adc    $0x1,%al
 379:	44                   	inc    %esp
 37a:	01 00                	add    %eax,(%eax)
 37c:	00 02                	add    %al,(%edx)
 37e:	23 10                	and    (%eax),%edx
 380:	07                   	pop    %es
 381:	5f                   	pop    %edi
 382:	49                   	dec    %ecx
 383:	4f                   	dec    %edi
 384:	5f                   	pop    %edi
 385:	77 72                	ja     3f9 <_init-0x8048317>
 387:	69 74 65 5f 70 74 72 	imul   $0x727470,0x5f(%ebp,%eiz,2),%esi
 38e:	00 
 38f:	03 15 01 44 01 00    	add    0x14401,%edx
 395:	00 02                	add    %al,(%edx)
 397:	23 14 07             	and    (%edi,%eax,1),%edx
 39a:	5f                   	pop    %edi
 39b:	49                   	dec    %ecx
 39c:	4f                   	dec    %edi
 39d:	5f                   	pop    %edi
 39e:	77 72                	ja     412 <_init-0x80482fe>
 3a0:	69 74 65 5f 65 6e 64 	imul   $0x646e65,0x5f(%ebp,%eiz,2),%esi
 3a7:	00 
 3a8:	03 16                	add    (%esi),%edx
 3aa:	01 44 01 00          	add    %eax,0x0(%ecx,%eax,1)
 3ae:	00 02                	add    %al,(%edx)
 3b0:	23 18                	and    (%eax),%ebx
 3b2:	07                   	pop    %es
 3b3:	5f                   	pop    %edi
 3b4:	49                   	dec    %ecx
 3b5:	4f                   	dec    %edi
 3b6:	5f                   	pop    %edi
 3b7:	62 75 66             	bound  %esi,0x66(%ebp)
 3ba:	5f                   	pop    %edi
 3bb:	62 61 73             	bound  %esp,0x73(%ecx)
 3be:	65 00 03             	add    %al,%gs:(%ebx)
 3c1:	17                   	pop    %ss
 3c2:	01 44 01 00          	add    %eax,0x0(%ecx,%eax,1)
 3c6:	00 02                	add    %al,(%edx)
 3c8:	23 1c 07             	and    (%edi,%eax,1),%ebx
 3cb:	5f                   	pop    %edi
 3cc:	49                   	dec    %ecx
 3cd:	4f                   	dec    %edi
 3ce:	5f                   	pop    %edi
 3cf:	62 75 66             	bound  %esi,0x66(%ebp)
 3d2:	5f                   	pop    %edi
 3d3:	65 6e                	outsb  %gs:(%esi),(%dx)
 3d5:	64 00 03             	add    %al,%fs:(%ebx)
 3d8:	18 01                	sbb    %al,(%ecx)
 3da:	44                   	inc    %esp
 3db:	01 00                	add    %eax,(%eax)
 3dd:	00 02                	add    %al,(%edx)
 3df:	23 20                	and    (%eax),%esp
 3e1:	07                   	pop    %es
 3e2:	5f                   	pop    %edi
 3e3:	49                   	dec    %ecx
 3e4:	4f                   	dec    %edi
 3e5:	5f                   	pop    %edi
 3e6:	73 61                	jae    449 <_init-0x80482c7>
 3e8:	76 65                	jbe    44f <_init-0x80482c1>
 3ea:	5f                   	pop    %edi
 3eb:	62 61 73             	bound  %esp,0x73(%ecx)
 3ee:	65 00 03             	add    %al,%gs:(%ebx)
 3f1:	1a 01                	sbb    (%ecx),%al
 3f3:	44                   	inc    %esp
 3f4:	01 00                	add    %eax,(%eax)
 3f6:	00 02                	add    %al,(%edx)
 3f8:	23 24 07             	and    (%edi,%eax,1),%esp
 3fb:	5f                   	pop    %edi
 3fc:	49                   	dec    %ecx
 3fd:	4f                   	dec    %edi
 3fe:	5f                   	pop    %edi
 3ff:	62 61 63             	bound  %esp,0x63(%ecx)
 402:	6b 75 70 5f          	imul   $0x5f,0x70(%ebp),%esi
 406:	62 61 73             	bound  %esp,0x73(%ecx)
 409:	65 00 03             	add    %al,%gs:(%ebx)
 40c:	1b 01                	sbb    (%ecx),%eax
 40e:	44                   	inc    %esp
 40f:	01 00                	add    %eax,(%eax)
 411:	00 02                	add    %al,(%edx)
 413:	23 28                	and    (%eax),%ebp
 415:	07                   	pop    %es
 416:	5f                   	pop    %edi
 417:	49                   	dec    %ecx
 418:	4f                   	dec    %edi
 419:	5f                   	pop    %edi
 41a:	73 61                	jae    47d <_init-0x8048293>
 41c:	76 65                	jbe    483 <_init-0x804828d>
 41e:	5f                   	pop    %edi
 41f:	65 6e                	outsb  %gs:(%esi),(%dx)
 421:	64 00 03             	add    %al,%fs:(%ebx)
 424:	1c 01                	sbb    $0x1,%al
 426:	44                   	inc    %esp
 427:	01 00                	add    %eax,(%eax)
 429:	00 02                	add    %al,(%edx)
 42b:	23 2c 07             	and    (%edi,%eax,1),%ebp
 42e:	5f                   	pop    %edi
 42f:	6d                   	insl   (%dx),%es:(%edi)
 430:	61                   	popa   
 431:	72 6b                	jb     49e <_init-0x8048272>
 433:	65 72 73             	gs jb  4a9 <_init-0x8048267>
 436:	00 03                	add    %al,(%ebx)
 438:	1e                   	push   %ds
 439:	01 f6                	add    %esi,%esi
 43b:	03 00                	add    (%eax),%eax
 43d:	00 02                	add    %al,(%edx)
 43f:	23 30                	and    (%eax),%esi
 441:	07                   	pop    %es
 442:	5f                   	pop    %edi
 443:	63 68 61             	arpl   %bp,0x61(%eax)
 446:	69 6e 00 03 20 01 fc 	imul   $0xfc012003,0x0(%esi),%ebp
 44d:	03 00                	add    (%eax),%eax
 44f:	00 02                	add    %al,(%edx)
 451:	23 34 07             	and    (%edi,%eax,1),%esi
 454:	5f                   	pop    %edi
 455:	66 69 6c 65 6e 6f 00 	imul   $0x6f,0x6e(%ebp,%eiz,2),%bp
 45c:	03 22                	add    (%edx),%esp
 45e:	01 cf                	add    %ecx,%edi
 460:	00 00                	add    %al,(%eax)
 462:	00 02                	add    %al,(%edx)
 464:	23 38                	and    (%eax),%edi
 466:	07                   	pop    %es
 467:	5f                   	pop    %edi
 468:	66 6c                	data16 insb (%dx),%es:(%edi)
 46a:	61                   	popa   
 46b:	67 73 32             	addr16 jae 4a0 <_init-0x8048270>
 46e:	00 03                	add    %al,(%ebx)
 470:	26 01 cf             	es add %ecx,%edi
 473:	00 00                	add    %al,(%eax)
 475:	00 02                	add    %al,(%edx)
 477:	23 3c 07             	and    (%edi,%eax,1),%edi
 47a:	5f                   	pop    %edi
 47b:	6f                   	outsl  %ds:(%esi),(%dx)
 47c:	6c                   	insb   (%dx),%es:(%edi)
 47d:	64 5f                	fs pop %edi
 47f:	6f                   	outsl  %ds:(%esi),(%dx)
 480:	66 66 73 65          	data16 data16 jae 4e9 <_init-0x8048227>
 484:	74 00                	je     486 <_init-0x804828a>
 486:	03 28                	add    (%eax),%ebp
 488:	01 11                	add    %edx,(%ecx)
 48a:	01 00                	add    %eax,(%eax)
 48c:	00 02                	add    %al,(%edx)
 48e:	23 40 07             	and    0x7(%eax),%eax
 491:	5f                   	pop    %edi
 492:	63 75 72             	arpl   %si,0x72(%ebp)
 495:	5f                   	pop    %edi
 496:	63 6f 6c             	arpl   %bp,0x6c(%edi)
 499:	75 6d                	jne    508 <_init-0x8048208>
 49b:	6e                   	outsb  %ds:(%esi),(%dx)
 49c:	00 03                	add    %al,(%ebx)
 49e:	2c 01                	sub    $0x1,%al
 4a0:	88 00                	mov    %al,(%eax)
 4a2:	00 00                	add    %al,(%eax)
 4a4:	02 23                	add    (%ebx),%ah
 4a6:	44                   	inc    %esp
 4a7:	07                   	pop    %es
 4a8:	5f                   	pop    %edi
 4a9:	76 74                	jbe    51f <_init-0x80481f1>
 4ab:	61                   	popa   
 4ac:	62 6c 65 5f          	bound  %ebp,0x5f(%ebp,%eiz,2)
 4b0:	6f                   	outsl  %ds:(%esi),(%dx)
 4b1:	66 66 73 65          	data16 data16 jae 51a <_init-0x80481f6>
 4b5:	74 00                	je     4b7 <_init-0x8048259>
 4b7:	03 2d 01 b3 00 00    	add    0xb301,%ebp
 4bd:	00 02                	add    %al,(%edx)
 4bf:	23 46 07             	and    0x7(%esi),%eax
 4c2:	5f                   	pop    %edi
 4c3:	73 68                	jae    52d <_init-0x80481e3>
 4c5:	6f                   	outsl  %ds:(%esi),(%dx)
 4c6:	72 74                	jb     53c <_init-0x80481d4>
 4c8:	62 75 66             	bound  %esi,0x66(%ebp)
 4cb:	00 03                	add    %al,(%ebx)
 4cd:	2e 01 02             	add    %eax,%cs:(%edx)
 4d0:	04 00                	add    $0x0,%al
 4d2:	00 02                	add    %al,(%edx)
 4d4:	23 47 07             	and    0x7(%edi),%eax
 4d7:	5f                   	pop    %edi
 4d8:	6c                   	insb   (%dx),%es:(%edi)
 4d9:	6f                   	outsl  %ds:(%esi),(%dx)
 4da:	63 6b 00             	arpl   %bp,0x0(%ebx)
 4dd:	03 32                	add    (%edx),%esi
 4df:	01 12                	add    %edx,(%edx)
 4e1:	04 00                	add    $0x0,%al
 4e3:	00 02                	add    %al,(%edx)
 4e5:	23 48 07             	and    0x7(%eax),%ecx
 4e8:	5f                   	pop    %edi
 4e9:	6f                   	outsl  %ds:(%esi),(%dx)
 4ea:	66 66 73 65          	data16 data16 jae 553 <_init-0x80481bd>
 4ee:	74 00                	je     4f0 <_init-0x8048220>
 4f0:	03 3b                	add    (%ebx),%edi
 4f2:	01 2c 01             	add    %ebp,(%ecx,%eax,1)
 4f5:	00 00                	add    %al,(%eax)
 4f7:	02 23                	add    (%ebx),%ah
 4f9:	4c                   	dec    %esp
 4fa:	07                   	pop    %es
 4fb:	5f                   	pop    %edi
 4fc:	5f                   	pop    %edi
 4fd:	70 61                	jo     560 <_init-0x80481b0>
 4ff:	64 31 00             	xor    %eax,%fs:(%eax)
 502:	03 41 01             	add    0x1(%ecx),%eax
 505:	a3 03 00 00 02       	mov    %eax,0x2000003
 50a:	23 54 07 5f          	and    0x5f(%edi,%eax,1),%edx
 50e:	5f                   	pop    %edi
 50f:	70 61                	jo     572 <_init-0x804819e>
 511:	64 32 00             	xor    %fs:(%eax),%al
 514:	03 42 01             	add    0x1(%edx),%eax
 517:	a3 03 00 00 02       	mov    %eax,0x2000003
 51c:	23 58 07             	and    0x7(%eax),%ebx
 51f:	5f                   	pop    %edi
 520:	6d                   	insl   (%dx),%es:(%edi)
 521:	6f                   	outsl  %ds:(%esi),(%dx)
 522:	64 65 00 03          	fs add %al,%gs:(%ebx)
 526:	44                   	inc    %esp
 527:	01 cf                	add    %ecx,%edi
 529:	00 00                	add    %al,(%eax)
 52b:	00 02                	add    %al,(%edx)
 52d:	23 5c 07 5f          	and    0x5f(%edi,%eax,1),%ebx
 531:	75 6e                	jne    5a1 <_init-0x804816f>
 533:	75 73                	jne    5a8 <_init-0x8048168>
 535:	65 64 32 00          	gs xor %fs:(%eax),%al
 539:	03 46 01             	add    0x1(%esi),%eax
 53c:	18 04 00             	sbb    %al,(%eax,%eax,1)
 53f:	00 02                	add    %al,(%edx)
 541:	23 60 00             	and    0x0(%eax),%esp
 544:	08 04 09             	or     %al,(%ecx,%ecx,1)
 547:	5f                   	pop    %edi
 548:	49                   	dec    %ecx
 549:	4f                   	dec    %edi
 54a:	5f                   	pop    %edi
 54b:	6c                   	insb   (%dx),%es:(%edi)
 54c:	6f                   	outsl  %ds:(%esi),(%dx)
 54d:	63 6b 5f             	arpl   %bp,0x5f(%ebx)
 550:	74 00                	je     552 <_init-0x80481be>
 552:	03 b0 0a f6 03 00    	add    0x3f60a(%eax),%esi
 558:	00 5f 49             	add    %bl,0x49(%edi)
 55b:	4f                   	dec    %edi
 55c:	5f                   	pop    %edi
 55d:	6d                   	insl   (%dx),%es:(%edi)
 55e:	61                   	popa   
 55f:	72 6b                	jb     5cc <_init-0x8048144>
 561:	65 72 00             	gs jb  564 <_init-0x80481ac>
 564:	0c 03                	or     $0x3,%al
 566:	b6 0b                	mov    $0xb,%dh
 568:	5f                   	pop    %edi
 569:	6e                   	outsb  %ds:(%esi),(%dx)
 56a:	65 78 74             	gs js  5e1 <_init-0x804812f>
 56d:	00 03                	add    %al,(%ebx)
 56f:	b7 f6                	mov    $0xf6,%bh
 571:	03 00                	add    (%eax),%eax
 573:	00 02                	add    %al,(%edx)
 575:	23 00                	and    (%eax),%eax
 577:	0b 5f 73             	or     0x73(%edi),%ebx
 57a:	62 75 66             	bound  %esi,0x66(%ebp)
 57d:	00 03                	add    %al,(%ebx)
 57f:	b8 fc 03 00 00       	mov    $0x3fc,%eax
 584:	02 23                	add    (%ebx),%ah
 586:	04 0b                	add    $0xb,%al
 588:	5f                   	pop    %edi
 589:	70 6f                	jo     5fa <_init-0x8048116>
 58b:	73 00                	jae    58d <_init-0x8048183>
 58d:	03 bc cf 00 00 00 02 	add    0x2000000(%edi,%ecx,8),%edi
 594:	23 08                	and    (%eax),%ecx
 596:	00 05 04 b3 03 00    	add    %al,0x3b304
 59c:	00 05 04 5e 01 00    	add    %al,0x15e04
 5a2:	00 0c 12             	add    %cl,(%edx,%edx,1)
 5a5:	04 00                	add    $0x0,%al
 5a7:	00 4a 01             	add    %cl,0x1(%edx)
 5aa:	00 00                	add    %al,(%eax)
 5ac:	0d 3d 01 00 00       	or     $0x13d,%eax
 5b1:	00 00                	add    %al,(%eax)
 5b3:	05 04 a5 03 00       	add    $0x3a504,%eax
 5b8:	00 0c 28             	add    %cl,(%eax,%ebp,1)
 5bb:	04 00                	add    $0x0,%al
 5bd:	00 4a 01             	add    %cl,0x1(%edx)
 5c0:	00 00                	add    %al,(%eax)
 5c2:	0d 3d 01 00 00       	or     $0x13d,%eax
 5c7:	33 00                	xor    (%eax),%eax
 5c9:	0e                   	push   %cs
 5ca:	79 04                	jns    5d0 <_init-0x8048140>
 5cc:	00 00                	add    %al,(%eax)
 5ce:	01 6d 61             	add    %ebp,0x61(%ebp)
 5d1:	69 6e 00 01 24 01 cf 	imul   $0xcf012401,0x0(%esi),%ebp
 5d8:	00 00                	add    %al,(%eax)
 5da:	00 d4                	add    %dl,%ah
 5dc:	89 04 08             	mov    %eax,(%eax,%ecx,1)
 5df:	7e 8b                	jle    56c <_init-0x80481a4>
 5e1:	04 08                	add    $0x8,%al
 5e3:	00 00                	add    %al,(%eax)
 5e5:	00 00                	add    %al,(%eax)
 5e7:	0f 61 72 67          	punpcklwd 0x67(%edx),%mm6
 5eb:	63 00                	arpl   %ax,(%eax)
 5ed:	01 23                	add    %esp,(%ebx)
 5ef:	cf                   	iret   
 5f0:	00 00                	add    %al,(%eax)
 5f2:	00 03                	add    %al,(%ebx)
 5f4:	75 68                	jne    65e <_init-0x80480b2>
 5f6:	06                   	push   %es
 5f7:	0f 61 72 67          	punpcklwd 0x67(%edx),%mm6
 5fb:	76 00                	jbe    5fd <_init-0x8048113>
 5fd:	01 23                	add    %esp,(%ebx)
 5ff:	79 04                	jns    605 <_init-0x804810b>
 601:	00 00                	add    %al,(%eax)
 603:	05 75 68 06 23       	add    $0x23066875,%eax
 608:	04 10                	add    $0x10,%al
 60a:	69 6e 70 75 74 00 01 	imul   $0x1007475,0x70(%esi),%ebp
 611:	25 44 01 00 00       	and    $0x144,%eax
 616:	02 91 70 00 05 04    	add    0x4050070(%ecx),%dl
 61c:	44                   	inc    %esp
 61d:	01 00                	add    %eax,(%eax)
 61f:	00 11                	add    %dl,(%ecx)
 621:	73 74                	jae    697 <_init-0x8048079>
 623:	64 69 6e 00 02 8e fc 	imul   $0x3fc8e02,%fs:0x0(%esi),%ebp
 62a:	03 
 62b:	00 00                	add    %al,(%eax)
 62d:	01 01                	add    %eax,(%ecx)
 62f:	12 69 6e             	adc    0x6e(%ecx),%ch
 632:	66 69 6c 65 00 01 21 	imul   $0x2101,0x0(%ebp,%eiz,2),%bp
 639:	a3 04 00 00 01       	mov    %eax,0x1000004
 63e:	05 03 50 a8 04       	add    $0x4a85003,%eax
 643:	08 05 04 52 01 00    	or     %al,0x15204
 649:	00 00                	add    %al,(%eax)
 64b:	91                   	xchg   %eax,%ecx
 64c:	00 00                	add    %al,(%eax)
 64e:	00 02                	add    %al,(%edx)
 650:	00 5f 01             	add    %bl,0x1(%edi)
 653:	00 00                	add    %al,(%eax)
 655:	04 01                	add    $0x1,%al
 657:	c4 01                	les    (%ecx),%eax
 659:	00 00                	add    %al,(%eax)
 65b:	2f                   	das    
 65c:	62 75 69             	bound  %esi,0x69(%ebp)
 65f:	6c                   	insb   (%dx),%es:(%edi)
 660:	64 2f                	fs das 
 662:	62 75 69             	bound  %esi,0x69(%ebp)
 665:	6c                   	insb   (%dx),%es:(%edi)
 666:	64 64 2f             	fs fs das 
 669:	67 6c                	insb   (%dx),%es:(%di)
 66b:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
 672:	2e 36 2e 64 73 31    	cs ss cs fs jae,pn 6a9 <_init-0x8048067>
 678:	2f                   	das    
 679:	62 75 69             	bound  %esi,0x69(%ebp)
 67c:	6c                   	insb   (%dx),%es:(%edi)
 67d:	64 2d 74 72 65 65    	fs sub $0x65657274,%eax
 683:	2f                   	das    
 684:	69 33 38 36 2d 6c    	imul   $0x6c2d3638,(%ebx),%esi
 68a:	69 62 63 2f 63 73 75 	imul   $0x7573632f,0x63(%edx),%esp
 691:	2f                   	das    
 692:	63 72 74             	arpl   %si,0x74(%edx)
 695:	6e                   	outsb  %ds:(%esi),(%dx)
 696:	2e 53                	cs push %ebx
 698:	00 2f                	add    %ch,(%edi)
 69a:	62 75 69             	bound  %esi,0x69(%ebp)
 69d:	6c                   	insb   (%dx),%es:(%edi)
 69e:	64 2f                	fs das 
 6a0:	62 75 69             	bound  %esi,0x69(%ebp)
 6a3:	6c                   	insb   (%dx),%es:(%edi)
 6a4:	64 64 2f             	fs fs das 
 6a7:	67 6c                	insb   (%dx),%es:(%di)
 6a9:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
 6b0:	2e 36 2e 64 73 31    	cs ss cs fs jae,pn 6e7 <_init-0x8048029>
 6b6:	2f                   	das    
 6b7:	62 75 69             	bound  %esi,0x69(%ebp)
 6ba:	6c                   	insb   (%dx),%es:(%edi)
 6bb:	64 2d 74 72 65 65    	fs sub $0x65657274,%eax
 6c1:	2f                   	das    
 6c2:	67 6c                	insb   (%dx),%es:(%di)
 6c4:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
 6cb:	2e 36 2f             	cs ss das 
 6ce:	63 73 75             	arpl   %si,0x75(%ebx)
 6d1:	00 47 4e             	add    %al,0x4e(%edi)
 6d4:	55                   	push   %ebp
 6d5:	20 41 53             	and    %al,0x53(%ecx)
 6d8:	20 32                	and    %dh,(%edx)
 6da:	2e 31 37             	xor    %esi,%cs:(%edi)
 6dd:	00 01                	add    %al,(%ecx)
 6df:	80                   	.byte 0x80

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%ecx)
   2:	00 10                	add    %dl,(%eax)
   4:	06                   	push   %es
   5:	11 01                	adc    %eax,(%ecx)
   7:	12 01                	adc    (%ecx),%al
   9:	03 08                	add    (%eax),%ecx
   b:	1b 08                	sbb    (%eax),%ecx
   d:	25 08 13 05 00       	and    $0x51308,%eax
  12:	00 00                	add    %al,(%eax)
  14:	01 11                	add    %edx,(%ecx)
  16:	01 10                	add    %edx,(%eax)
  18:	06                   	push   %es
  19:	12 01                	adc    (%ecx),%al
  1b:	11 01                	adc    %eax,(%ecx)
  1d:	25 0e 13 0b 03       	and    $0x30b130e,%eax
  22:	0e                   	push   %cs
  23:	1b 0e                	sbb    (%esi),%ecx
  25:	00 00                	add    %al,(%eax)
  27:	02 24 00             	add    (%eax,%eax,1),%ah
  2a:	03 0e                	add    (%esi),%ecx
  2c:	0b 0b                	or     (%ebx),%ecx
  2e:	3e 0b 00             	or     %ds:(%eax),%eax
  31:	00 03                	add    %al,(%ebx)
  33:	24 00                	and    $0x0,%al
  35:	03 08                	add    (%eax),%ecx
  37:	0b 0b                	or     (%ebx),%ecx
  39:	3e 0b 00             	or     %ds:(%eax),%eax
  3c:	00 04 34             	add    %al,(%esp,%esi,1)
  3f:	00 03                	add    %al,(%ebx)
  41:	0e                   	push   %cs
  42:	3a 0b                	cmp    (%ebx),%cl
  44:	3b 0b                	cmp    (%ebx),%ecx
  46:	49                   	dec    %ecx
  47:	13 3f                	adc    (%edi),%edi
  49:	0c 02                	or     $0x2,%al
  4b:	0a 00                	or     (%eax),%al
  4d:	00 05 26 00 49 13    	add    %al,0x13490026
  53:	00 00                	add    %al,(%eax)
  55:	00 01                	add    %al,(%ecx)
  57:	11 00                	adc    %eax,(%eax)
  59:	10 06                	adc    %al,(%esi)
  5b:	03 08                	add    (%eax),%ecx
  5d:	1b 08                	sbb    (%eax),%ecx
  5f:	25 08 13 05 00       	and    $0x51308,%eax
  64:	00 00                	add    %al,(%eax)
  66:	01 11                	add    %edx,(%ecx)
  68:	01 10                	add    %edx,(%eax)
  6a:	06                   	push   %es
  6b:	12 01                	adc    (%ecx),%al
  6d:	11 01                	adc    %eax,(%ecx)
  6f:	25 08 13 0b 03       	and    $0x30b1308,%eax
  74:	08 1b                	or     %bl,(%ebx)
  76:	08 00                	or     %al,(%eax)
  78:	00 02                	add    %al,(%edx)
  7a:	24 00                	and    $0x0,%al
  7c:	03 0e                	add    (%esi),%ecx
  7e:	0b 0b                	or     (%ebx),%ecx
  80:	3e 0b 00             	or     %ds:(%eax),%eax
  83:	00 03                	add    %al,(%ebx)
  85:	24 00                	and    $0x0,%al
  87:	03 08                	add    (%eax),%ecx
  89:	0b 0b                	or     (%ebx),%ecx
  8b:	3e 0b 00             	or     %ds:(%eax),%eax
  8e:	00 04 16             	add    %al,(%esi,%edx,1)
  91:	00 03                	add    %al,(%ebx)
  93:	08 3a                	or     %bh,(%edx)
  95:	0b 3b                	or     (%ebx),%edi
  97:	0b 49 13             	or     0x13(%ecx),%ecx
  9a:	00 00                	add    %al,(%eax)
  9c:	05 0f 00 0b 0b       	add    $0xb0b000f,%eax
  a1:	49                   	dec    %ecx
  a2:	13 00                	adc    (%eax),%eax
  a4:	00 06                	add    %al,(%esi)
  a6:	13 01                	adc    (%ecx),%eax
  a8:	01 13                	add    %edx,(%ebx)
  aa:	03 0e                	add    (%esi),%ecx
  ac:	0b 0b                	or     (%ebx),%ecx
  ae:	3a 0b                	cmp    (%ebx),%cl
  b0:	3b 0b                	cmp    (%ebx),%ecx
  b2:	00 00                	add    %al,(%eax)
  b4:	07                   	pop    %es
  b5:	0d 00 03 08 3a       	or     $0x3a080300,%eax
  ba:	0b 3b                	or     (%ebx),%edi
  bc:	05 49 13 38 0a       	add    $0xa381349,%eax
  c1:	00 00                	add    %al,(%eax)
  c3:	08 0f                	or     %cl,(%edi)
  c5:	00 0b                	add    %cl,(%ebx)
  c7:	0b 00                	or     (%eax),%eax
  c9:	00 09                	add    %cl,(%ecx)
  cb:	16                   	push   %ss
  cc:	00 03                	add    %al,(%ebx)
  ce:	08 3a                	or     %bh,(%edx)
  d0:	0b 3b                	or     (%ebx),%edi
  d2:	0b 00                	or     (%eax),%eax
  d4:	00 0a                	add    %cl,(%edx)
  d6:	13 01                	adc    (%ecx),%eax
  d8:	01 13                	add    %edx,(%ebx)
  da:	03 08                	add    (%eax),%ecx
  dc:	0b 0b                	or     (%ebx),%ecx
  de:	3a 0b                	cmp    (%ebx),%cl
  e0:	3b 0b                	cmp    (%ebx),%ecx
  e2:	00 00                	add    %al,(%eax)
  e4:	0b 0d 00 03 08 3a    	or     0x3a080300,%ecx
  ea:	0b 3b                	or     (%ebx),%edi
  ec:	0b 49 13             	or     0x13(%ecx),%ecx
  ef:	38 0a                	cmp    %cl,(%edx)
  f1:	00 00                	add    %al,(%eax)
  f3:	0c 01                	or     $0x1,%al
  f5:	01 01                	add    %eax,(%ecx)
  f7:	13 49 13             	adc    0x13(%ecx),%ecx
  fa:	00 00                	add    %al,(%eax)
  fc:	0d 21 00 49 13       	or     $0x13490021,%eax
 101:	2f                   	das    
 102:	0b 00                	or     (%eax),%eax
 104:	00 0e                	add    %cl,(%esi)
 106:	2e 01 01             	add    %eax,%cs:(%ecx)
 109:	13 3f                	adc    (%edi),%edi
 10b:	0c 03                	or     $0x3,%al
 10d:	08 3a                	or     %bh,(%edx)
 10f:	0b 3b                	or     (%ebx),%edi
 111:	0b 27                	or     (%edi),%esp
 113:	0c 49                	or     $0x49,%al
 115:	13 11                	adc    (%ecx),%edx
 117:	01 12                	add    %edx,(%edx)
 119:	01 40 06             	add    %eax,0x6(%eax)
 11c:	00 00                	add    %al,(%eax)
 11e:	0f 05                	syscall 
 120:	00 03                	add    %al,(%ebx)
 122:	08 3a                	or     %bh,(%edx)
 124:	0b 3b                	or     (%ebx),%edi
 126:	0b 49 13             	or     0x13(%ecx),%ecx
 129:	02 0a                	add    (%edx),%cl
 12b:	00 00                	add    %al,(%eax)
 12d:	10 34 00             	adc    %dh,(%eax,%eax,1)
 130:	03 08                	add    (%eax),%ecx
 132:	3a 0b                	cmp    (%ebx),%cl
 134:	3b 0b                	cmp    (%ebx),%ecx
 136:	49                   	dec    %ecx
 137:	13 02                	adc    (%edx),%eax
 139:	0a 00                	or     (%eax),%al
 13b:	00 11                	add    %dl,(%ecx)
 13d:	34 00                	xor    $0x0,%al
 13f:	03 08                	add    (%eax),%ecx
 141:	3a 0b                	cmp    (%ebx),%cl
 143:	3b 0b                	cmp    (%ebx),%ecx
 145:	49                   	dec    %ecx
 146:	13 3f                	adc    (%edi),%edi
 148:	0c 3c                	or     $0x3c,%al
 14a:	0c 00                	or     $0x0,%al
 14c:	00 12                	add    %dl,(%edx)
 14e:	34 00                	xor    $0x0,%al
 150:	03 08                	add    (%eax),%ecx
 152:	3a 0b                	cmp    (%ebx),%cl
 154:	3b 0b                	cmp    (%ebx),%ecx
 156:	49                   	dec    %ecx
 157:	13 3f                	adc    (%edi),%edi
 159:	0c 02                	or     $0x2,%al
 15b:	0a 00                	or     (%eax),%al
 15d:	00 00                	add    %al,(%eax)
 15f:	01 11                	add    %edx,(%ecx)
 161:	00 10                	add    %dl,(%eax)
 163:	06                   	push   %es
 164:	03 08                	add    (%eax),%ecx
 166:	1b 08                	sbb    (%eax),%ecx
 168:	25 08 13 05 00       	and    $0x51308,%eax
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	57                   	push   %edi
   1:	00 00                	add    %al,(%eax)
   3:	00 02                	add    %al,(%edx)
   5:	00 32                	add    %dh,(%edx)
   7:	00 00                	add    %al,(%eax)
   9:	00 01                	add    %al,(%ecx)
   b:	01 fb                	add    %edi,%ebx
   d:	0e                   	push   %cs
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	01 00                	add    %eax,(%eax)
  19:	00 01                	add    %al,(%ecx)
  1b:	2e 2e 2f             	cs cs das 
  1e:	73 79                	jae    99 <_init-0x8048677>
  20:	73 64                	jae    86 <_init-0x804868a>
  22:	65 70 73             	gs jo  98 <_init-0x8048678>
  25:	2f                   	das    
  26:	69 33 38 36 2f 65    	imul   $0x652f3638,(%ebx),%esi
  2c:	6c                   	insb   (%dx),%es:(%edi)
  2d:	66 00 00             	data16 add %al,(%eax)
  30:	73 74                	jae    a6 <_init-0x804866a>
  32:	61                   	popa   
  33:	72 74                	jb     a9 <_init-0x8048667>
  35:	2e 53                	cs push %ebx
  37:	00 01                	add    %al,(%ecx)
  39:	00 00                	add    %al,(%eax)
  3b:	00 00                	add    %al,(%eax)
  3d:	05 02 30 89 04       	add    $0x4893002,%eax
  42:	08 03                	or     %al,(%ebx)
  44:	c0 00 01             	rolb   $0x1,(%eax)
  47:	33 21                	xor    (%ecx),%esp
  49:	34 3d                	xor    $0x3d,%al
  4b:	25 22 03 18 20       	and    $0x20180322,%eax
  50:	59                   	pop    %ecx
  51:	5a                   	pop    %edx
  52:	21 22                	and    %esp,(%edx)
  54:	5c                   	pop    %esp
  55:	5b                   	pop    %ebx
  56:	02 01                	add    (%ecx),%al
  58:	00 01                	add    %al,(%ecx)
  5a:	01 23                	add    %esp,(%ebx)
  5c:	00 00                	add    %al,(%eax)
  5e:	00 02                	add    %al,(%edx)
  60:	00 1d 00 00 00 01    	add    %bl,0x1000000
  66:	01 fb                	add    %edi,%ebx
  68:	0e                   	push   %cs
  69:	0d 00 01 01 01       	or     $0x1010100,%eax
  6e:	01 00                	add    %eax,(%eax)
  70:	00 00                	add    %al,(%eax)
  72:	01 00                	add    %eax,(%eax)
  74:	00 01                	add    %al,(%ecx)
  76:	00 69 6e             	add    %ch,0x6e(%ecx)
  79:	69 74 2e 63 00 00 00 	imul   $0x0,0x63(%esi,%ebp,1),%esi
  80:	00 
  81:	00 9e 00 00 00 02    	add    %bl,0x2000000(%esi)
  87:	00 54 00 00          	add    %dl,0x0(%eax,%eax,1)
  8b:	00 01                	add    %al,(%ecx)
  8d:	01 fb                	add    %edi,%ebx
  8f:	0e                   	push   %cs
  90:	0d 00 01 01 01       	or     $0x1010100,%eax
  95:	01 00                	add    %eax,(%eax)
  97:	00 00                	add    %al,(%eax)
  99:	01 00                	add    %eax,(%eax)
  9b:	00 01                	add    %al,(%ecx)
  9d:	2f                   	das    
  9e:	62 75 69             	bound  %esi,0x69(%ebp)
  a1:	6c                   	insb   (%dx),%es:(%edi)
  a2:	64 2f                	fs das 
  a4:	62 75 69             	bound  %esi,0x69(%ebp)
  a7:	6c                   	insb   (%dx),%es:(%edi)
  a8:	64 64 2f             	fs fs das 
  ab:	67 6c                	insb   (%dx),%es:(%di)
  ad:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
  b4:	2e 36 2e 64 73 31    	cs ss cs fs jae,pn eb <_init-0x8048625>
  ba:	2f                   	das    
  bb:	62 75 69             	bound  %esi,0x69(%ebp)
  be:	6c                   	insb   (%dx),%es:(%edi)
  bf:	64 2d 74 72 65 65    	fs sub $0x65657274,%eax
  c5:	2f                   	das    
  c6:	69 33 38 36 2d 6c    	imul   $0x6c2d3638,(%ebx),%esi
  cc:	69 62 63 2f 63 73 75 	imul   $0x7573632f,0x63(%edx),%esp
  d3:	00 00                	add    %al,(%eax)
  d5:	63 72 74             	arpl   %si,0x74(%edx)
  d8:	69 2e 53 00 01 00    	imul   $0x10053,(%esi),%ebp
  de:	00 00                	add    %al,(%eax)
  e0:	00 05 02 54 89 04    	add    %al,0x4895402
  e6:	08 03                	or     %al,(%ebx)
  e8:	0b 01                	or     (%ecx),%eax
  ea:	21 2f                	and    %ebp,(%edi)
  ec:	21 3d 5a 21 67 67    	and    %edi,0x6767215a
  f2:	2f                   	das    
  f3:	2f                   	das    
  f4:	5a                   	pop    %edx
  f5:	21 21                	and    %esp,(%ecx)
  f7:	21 02                	and    %eax,(%edx)
  f9:	01 00                	add    %eax,(%eax)
  fb:	01 01                	add    %eax,(%ecx)
  fd:	00 05 02 10 87 04    	add    %al,0x4871002
 103:	08 03                	or     %al,(%ebx)
 105:	23 01                	and    (%ecx),%eax
 107:	21 2f                	and    %ebp,(%edi)
 109:	3d 02 05 00 01       	cmp    $0x1000502,%eax
 10e:	01 00                	add    %eax,(%eax)
 110:	05 02 74 98 04       	add    $0x4987402,%eax
 115:	08 03                	or     %al,(%ebx)
 117:	33 01                	xor    (%ecx),%eax
 119:	21 2f                	and    %ebp,(%edi)
 11b:	21 3d 5a 21 02 06    	and    %edi,0x602215a
 121:	00 01                	add    %al,(%ecx)
 123:	01 9c 00 00 00 02 00 	add    %ebx,0x20000(%eax,%eax,1)
 12a:	5d                   	pop    %ebp
 12b:	00 00                	add    %al,(%eax)
 12d:	00 01                	add    %al,(%ecx)
 12f:	01 fb                	add    %edi,%ebx
 131:	0e                   	push   %cs
 132:	0d 00 01 01 01       	or     $0x1010100,%eax
 137:	01 00                	add    %eax,(%eax)
 139:	00 00                	add    %al,(%eax)
 13b:	01 00                	add    %eax,(%eax)
 13d:	00 01                	add    %al,(%ecx)
 13f:	2f                   	das    
 140:	75 73                	jne    1b5 <_init-0x804855b>
 142:	72 2f                	jb     173 <_init-0x804859d>
 144:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
 14b:	00 2f                	add    %ch,(%edi)
 14d:	75 73                	jne    1c2 <_init-0x804854e>
 14f:	72 2f                	jb     180 <_init-0x8048590>
 151:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
 158:	2f                   	das    
 159:	62 69 74             	bound  %ebp,0x74(%ecx)
 15c:	73 00                	jae    15e <_init-0x80485b2>
 15e:	00 62 6f             	add    %ah,0x6f(%edx)
 161:	6d                   	insl   (%dx),%es:(%edi)
 162:	62 2e                	bound  %ebp,(%esi)
 164:	63 00                	arpl   %ax,(%eax)
 166:	00 00                	add    %al,(%eax)
 168:	00 73 74             	add    %dh,0x74(%ebx)
 16b:	64 69 6f 2e 68 00 01 	imul   $0x10068,%fs:0x2e(%edi),%ebp
 172:	00 
 173:	00 6c 69 62          	add    %ch,0x62(%ecx,%ebp,2)
 177:	69 6f 2e 68 00 01 00 	imul   $0x10068,0x2e(%edi),%ebp
 17e:	00 74 79 70          	add    %dh,0x70(%ecx,%edi,2)
 182:	65 73 2e             	gs jae 1b3 <_init-0x804855d>
 185:	68 00 02 00 00       	push   $0x200
 18a:	00 00                	add    %al,(%eax)
 18c:	05 02 d4 89 04       	add    $0x489d402,%eax
 191:	08 03                	or     %al,(%ebx)
 193:	23 01                	and    (%ecx),%eax
 195:	08 44 83 eb          	or     %al,-0x15(%ebx,%eax,4)
 199:	83 02 29             	addl   $0x29,(%edx)
 19c:	13 02                	adc    (%edx),%eax
 19e:	27                   	daa    
 19f:	13 c0                	adc    %eax,%eax
 1a1:	08 75 be             	or     %dh,-0x42(%ebp)
 1a4:	5a                   	pop    %edx
 1a5:	bb bd 83 ad 5a       	mov    $0x5aad83bd,%ebx
 1aa:	be 83 ad 59 be       	mov    $0xbe59ad83,%esi
 1af:	83 ad 59 bd 83 ad 59 	subl   $0x59,-0x527c42a7(%ebp)
 1b6:	bd 83 ad 59 be       	mov    $0xbe59ad83,%ebp
 1bb:	83 ad 5d 59 02 09 00 	subl   $0x0,0x902595d(%ebp)
 1c2:	01 01                	add    %eax,(%ecx)
 1c4:	7c 00                	jl     1c6 <_init-0x804854a>
 1c6:	00 00                	add    %al,(%eax)
 1c8:	02 00                	add    (%eax),%al
 1ca:	54                   	push   %esp
 1cb:	00 00                	add    %al,(%eax)
 1cd:	00 01                	add    %al,(%ecx)
 1cf:	01 fb                	add    %edi,%ebx
 1d1:	0e                   	push   %cs
 1d2:	0d 00 01 01 01       	or     $0x1010100,%eax
 1d7:	01 00                	add    %eax,(%eax)
 1d9:	00 00                	add    %al,(%eax)
 1db:	01 00                	add    %eax,(%eax)
 1dd:	00 01                	add    %al,(%ecx)
 1df:	2f                   	das    
 1e0:	62 75 69             	bound  %esi,0x69(%ebp)
 1e3:	6c                   	insb   (%dx),%es:(%edi)
 1e4:	64 2f                	fs das 
 1e6:	62 75 69             	bound  %esi,0x69(%ebp)
 1e9:	6c                   	insb   (%dx),%es:(%edi)
 1ea:	64 64 2f             	fs fs das 
 1ed:	67 6c                	insb   (%dx),%es:(%di)
 1ef:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
 1f6:	2e 36 2e 64 73 31    	cs ss cs fs jae,pn 22d <_init-0x80484e3>
 1fc:	2f                   	das    
 1fd:	62 75 69             	bound  %esi,0x69(%ebp)
 200:	6c                   	insb   (%dx),%es:(%edi)
 201:	64 2d 74 72 65 65    	fs sub $0x65657274,%eax
 207:	2f                   	das    
 208:	69 33 38 36 2d 6c    	imul   $0x6c2d3638,(%ebx),%esi
 20e:	69 62 63 2f 63 73 75 	imul   $0x7573632f,0x63(%edx),%esp
 215:	00 00                	add    %al,(%eax)
 217:	63 72 74             	arpl   %si,0x74(%edx)
 21a:	6e                   	outsb  %ds:(%esi),(%dx)
 21b:	2e 53                	cs push %ebx
 21d:	00 01                	add    %al,(%ecx)
 21f:	00 00                	add    %al,(%eax)
 221:	00 00                	add    %al,(%eax)
 223:	05 02 25 87 04       	add    $0x4872502,%eax
 228:	08 03                	or     %al,(%ebx)
 22a:	09 01                	or     %eax,(%ecx)
 22c:	21 02                	and    %eax,(%edx)
 22e:	01 00                	add    %eax,(%eax)
 230:	01 01                	add    %eax,(%ecx)
 232:	00 05 02 8c 98 04    	add    %al,0x4988c02
 238:	08 03                	or     %al,(%ebx)
 23a:	12 01                	adc    (%ecx),%al
 23c:	21 21                	and    %esp,(%ecx)
 23e:	21 02                	and    %eax,(%edx)
 240:	01 00                	add    %eax,(%eax)
 242:	01 01                	add    %eax,(%ecx)

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	10 00                	adc    %al,(%eax)
   2:	00 00                	add    %al,(%eax)
   4:	ff                   	(bad)  
   5:	ff                   	(bad)  
   6:	ff                   	(bad)  
   7:	ff 01                	incl   (%ecx)
   9:	00 01                	add    %al,(%ecx)
   b:	7c 08                	jl     15 <_init-0x80486fb>
   d:	0c 04                	or     $0x4,%al
   f:	04 88                	add    $0x88,%al
  11:	01 00                	add    %eax,(%eax)
  13:	00 24 00             	add    %ah,(%eax,%eax,1)
  16:	00 00                	add    %al,(%eax)
  18:	00 00                	add    %al,(%eax)
  1a:	00 00                	add    %al,(%eax)
  1c:	d4 89                	aam    $0x89
  1e:	04 08                	add    $0x8,%al
  20:	aa                   	stos   %al,%es:(%edi)
  21:	01 00                	add    %eax,(%eax)
  23:	00 44 0c 01          	add    %al,0x1(%esp,%ecx,1)
  27:	00 09                	add    %cl,(%ecx)
  29:	04 01                	add    $0x1,%al
  2b:	46                   	inc    %esi
  2c:	0c 04                	or     $0x4,%al
  2e:	04 41                	add    $0x41,%al
  30:	0e                   	push   %cs
  31:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  37:	41                   	inc    %ecx
  38:	84 03                	test   %al,(%ebx)
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	47                   	inc    %edi
   1:	4e                   	dec    %esi
   2:	55                   	push   %ebp
   3:	20 43 20             	and    %al,0x20(%ebx)
   6:	34 2e                	xor    $0x2e,%al
   8:	31 2e                	xor    %ebp,(%esi)
   a:	32 20                	xor    (%eax),%ah
   c:	32 30                	xor    (%eax),%dh
   e:	30 36                	xor    %dh,(%esi)
  10:	31 31                	xor    %esi,(%ecx)
  12:	31 35 20 28 70 72    	xor    %esi,0x72702820
  18:	65 72 65             	gs jb  80 <_init-0x8048690>
  1b:	6c                   	insb   (%dx),%es:(%edi)
  1c:	65 61                	gs popa 
  1e:	73 65                	jae    85 <_init-0x804868b>
  20:	29 20                	sub    %esp,(%eax)
  22:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
  26:	69 61 6e 20 34 2e 31 	imul   $0x312e3420,0x6e(%ecx),%esp
  2d:	2e 31 2d 32 31 29 00 	xor    %ebp,%cs:0x293132
  34:	69 6e 69 74 2e 63 00 	imul   $0x632e74,0x69(%esi),%ebp
  3b:	73 68                	jae    a5 <_init-0x804866b>
  3d:	6f                   	outsl  %ds:(%esi),(%dx)
  3e:	72 74                	jb     b4 <_init-0x804865c>
  40:	20 69 6e             	and    %ch,0x6e(%ecx)
  43:	74 00                	je     45 <_init-0x80486cb>
  45:	2f                   	das    
  46:	62 75 69             	bound  %esi,0x69(%ebp)
  49:	6c                   	insb   (%dx),%es:(%edi)
  4a:	64 2f                	fs das 
  4c:	62 75 69             	bound  %esi,0x69(%ebp)
  4f:	6c                   	insb   (%dx),%es:(%edi)
  50:	64 64 2f             	fs fs das 
  53:	67 6c                	insb   (%dx),%es:(%di)
  55:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
  5c:	2e 36 2e 64 73 31    	cs ss cs fs jae,pn 93 <_init-0x804867d>
  62:	2f                   	das    
  63:	62 75 69             	bound  %esi,0x69(%ebp)
  66:	6c                   	insb   (%dx),%es:(%edi)
  67:	64 2d 74 72 65 65    	fs sub $0x65657274,%eax
  6d:	2f                   	das    
  6e:	67 6c                	insb   (%dx),%es:(%di)
  70:	69 62 63 2d 32 2e 33 	imul   $0x332e322d,0x63(%edx),%esp
  77:	2e 36 2f             	cs ss das 
  7a:	63 73 75             	arpl   %si,0x75(%ebx)
  7d:	00 6c 6f 6e          	add    %ch,0x6e(%edi,%ebp,2)
  81:	67 20 6c 6f          	and    %ch,0x6f(%si)
  85:	6e                   	outsb  %ds:(%esi),(%dx)
  86:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
  8a:	74 00                	je     8c <_init-0x8048684>
  8c:	75 6e                	jne    fc <_init-0x8048614>
  8e:	73 69                	jae    f9 <_init-0x8048617>
  90:	67 6e                	outsb  %ds:(%si),(%dx)
  92:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
  97:	61                   	popa   
  98:	72 00                	jb     9a <_init-0x8048676>
  9a:	6c                   	insb   (%dx),%es:(%edi)
  9b:	6f                   	outsl  %ds:(%esi),(%dx)
  9c:	6e                   	outsb  %ds:(%esi),(%dx)
  9d:	67 20 6c 6f          	and    %ch,0x6f(%si)
  a1:	6e                   	outsb  %ds:(%esi),(%dx)
  a2:	67 20 75 6e          	and    %dh,0x6e(%di)
  a6:	73 69                	jae    111 <_init-0x80485ff>
  a8:	67 6e                	outsb  %ds:(%si),(%dx)
  aa:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
  af:	74 00                	je     b1 <_init-0x804865f>
  b1:	73 68                	jae    11b <_init-0x80485f5>
  b3:	6f                   	outsl  %ds:(%esi),(%dx)
  b4:	72 74                	jb     12a <_init-0x80485e6>
  b6:	20 75 6e             	and    %dh,0x6e(%ebp)
  b9:	73 69                	jae    124 <_init-0x80485ec>
  bb:	67 6e                	outsb  %ds:(%si),(%dx)
  bd:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
  c2:	74 00                	je     c4 <_init-0x804864c>
  c4:	5f                   	pop    %edi
  c5:	49                   	dec    %ecx
  c6:	4f                   	dec    %edi
  c7:	5f                   	pop    %edi
  c8:	73 74                	jae    13e <_init-0x80485d2>
  ca:	64 69 6e 5f 75 73 65 	imul   $0x64657375,%fs:0x5f(%esi),%ebp
  d1:	64 
  d2:	00 75 6e             	add    %dh,0x6e(%ebp)
  d5:	73 69                	jae    140 <_init-0x80485d0>
  d7:	67 6e                	outsb  %ds:(%si),(%dx)
  d9:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
  de:	74 00                	je     e0 <_init-0x8048630>
  e0:	5f                   	pop    %edi
  e1:	49                   	dec    %ecx
  e2:	4f                   	dec    %edi
  e3:	5f                   	pop    %edi
  e4:	46                   	inc    %esi
  e5:	49                   	dec    %ecx
  e6:	4c                   	dec    %esp
  e7:	45                   	inc    %ebp
	...

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00 00                	add    %al,(%eax)
   2:	00 00                	add    %al,(%eax)
   4:	04 00                	add    $0x0,%al
   6:	00 00                	add    %al,(%eax)
   8:	02 00                	add    (%eax),%al
   a:	74 04                	je     10 <_init-0x8048700>
   c:	04 00                	add    $0x0,%al
   e:	00 00                	add    %al,(%eax)
  10:	0a 00                	or     (%eax),%al
  12:	00 00                	add    %al,(%eax)
  14:	01 00                	add    %eax,(%eax)
  16:	51                   	push   %ecx
  17:	0a 00                	or     (%eax),%al
  19:	00 00                	add    %al,(%eax)
  1b:	0b 00                	or     (%eax),%eax
  1d:	00 00                	add    %al,(%eax)
  1f:	02 00                	add    (%eax),%al
  21:	74 04                	je     27 <_init-0x80486e9>
  23:	0b 00                	or     (%eax),%eax
  25:	00 00                	add    %al,(%eax)
  27:	0d 00 00 00 02       	or     $0x2000000,%eax
  2c:	00 74 08 0d          	add    %dh,0xd(%eax,%ecx,1)
  30:	00 00                	add    %al,(%eax)
  32:	00 aa 01 00 00 02    	add    %ch,0x2000001(%edx)
  38:	00 75 08             	add    %dh,0x8(%ebp)
	...
