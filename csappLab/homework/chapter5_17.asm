
chapter5_17.o：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <effective_memset>:
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 ec 30             	sub    $0x30,%esp
   a:	e8 fc ff ff ff       	call   b <effective_memset+0xb>
   f:	05 01 00 00 00       	add    $0x1,%eax
  14:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
  1b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  22:	8b 45 08             	mov    0x8(%ebp),%eax
  25:	89 45 e0             	mov    %eax,-0x20(%ebp)
  28:	eb 23                	jmp    4d <effective_memset+0x4d>
  2a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2d:	ba 00 00 00 00       	mov    $0x0,%edx
  32:	f7 75 f0             	divl   -0x10(%ebp)
  35:	89 d0                	mov    %edx,%eax
  37:	85 c0                	test   %eax,%eax
  39:	74 1c                	je     57 <effective_memset+0x57>
  3b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3e:	8d 50 01             	lea    0x1(%eax),%edx
  41:	89 55 e0             	mov    %edx,-0x20(%ebp)
  44:	8b 55 0c             	mov    0xc(%ebp),%edx
  47:	88 10                	mov    %dl,(%eax)
  49:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
  4d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  50:	3b 45 10             	cmp    0x10(%ebp),%eax
  53:	72 d5                	jb     2a <effective_memset+0x2a>
  55:	eb 01                	jmp    58 <effective_memset+0x58>
  57:	90                   	nop
  58:	8b 45 e0             	mov    -0x20(%ebp),%eax
  5b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  5e:	8b 45 10             	mov    0x10(%ebp),%eax
  61:	2b 45 dc             	sub    -0x24(%ebp),%eax
  64:	89 45 f4             	mov    %eax,-0xc(%ebp)
  67:	8b 45 f4             	mov    -0xc(%ebp),%eax
  6a:	ba 00 00 00 00       	mov    $0x0,%edx
  6f:	f7 75 f0             	divl   -0x10(%ebp)
  72:	89 45 f8             	mov    %eax,-0x8(%ebp)
  75:	8b 45 f4             	mov    -0xc(%ebp),%eax
  78:	ba 00 00 00 00       	mov    $0x0,%edx
  7d:	f7 75 f0             	divl   -0x10(%ebp)
  80:	89 55 fc             	mov    %edx,-0x4(%ebp)
  83:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  8a:	eb 12                	jmp    9e <effective_memset+0x9e>
  8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  8f:	8d 50 04             	lea    0x4(%eax),%edx
  92:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  95:	8b 55 0c             	mov    0xc(%ebp),%edx
  98:	89 10                	mov    %edx,(%eax)
  9a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  9e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  a1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  a4:	72 e6                	jb     8c <effective_memset+0x8c>
  a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  ac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  b3:	eb 12                	jmp    c7 <effective_memset+0xc7>
  b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  b8:	8d 50 01             	lea    0x1(%eax),%edx
  bb:	89 55 e0             	mov    %edx,-0x20(%ebp)
  be:	8b 55 0c             	mov    0xc(%ebp),%edx
  c1:	88 10                	mov    %dl,(%eax)
  c3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  ca:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  cd:	72 e6                	jb     b5 <effective_memset+0xb5>
  cf:	8b 45 08             	mov    0x8(%ebp),%eax
  d2:	c9                   	leave  
  d3:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

00000000 <__x86.get_pc_thunk.ax>:
   0:	8b 04 24             	mov    (%esp),%eax
   3:	c3                   	ret    
