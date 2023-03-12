
CsappChapter5_test.o：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <poly>:
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 ec 28             	sub    $0x28,%esp
   a:	e8 fc ff ff ff       	call   b <poly+0xb>
   f:	05 01 00 00 00       	add    $0x1,%eax
  14:	8b 45 0c             	mov    0xc(%ebp),%eax
  17:	89 45 d8             	mov    %eax,-0x28(%ebp)
  1a:	8b 45 10             	mov    0x10(%ebp),%eax
  1d:	89 45 dc             	mov    %eax,-0x24(%ebp)
  20:	8b 45 08             	mov    0x8(%ebp),%eax
  23:	dd 00                	fldl   (%eax)
  25:	dd 5d f0             	fstpl  -0x10(%ebp)
  28:	dd 45 d8             	fldl   -0x28(%ebp)
  2b:	dd 5d f8             	fstpl  -0x8(%ebp)
  2e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  35:	eb 29                	jmp    60 <poly+0x60>
  37:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  41:	8b 45 08             	mov    0x8(%ebp),%eax
  44:	01 d0                	add    %edx,%eax
  46:	dd 00                	fldl   (%eax)
  48:	dc 4d f8             	fmull  -0x8(%ebp)
  4b:	dd 45 f0             	fldl   -0x10(%ebp)
  4e:	de c1                	faddp  %st,%st(1)
  50:	dd 5d f0             	fstpl  -0x10(%ebp)
  53:	dd 45 f8             	fldl   -0x8(%ebp)
  56:	dc 4d d8             	fmull  -0x28(%ebp)
  59:	dd 5d f8             	fstpl  -0x8(%ebp)
  5c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  60:	8b 45 ec             	mov    -0x14(%ebp),%eax
  63:	3b 45 14             	cmp    0x14(%ebp),%eax
  66:	7c cf                	jl     37 <poly+0x37>
  68:	dd 45 f0             	fldl   -0x10(%ebp)
  6b:	c9                   	leave  
  6c:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

00000000 <__x86.get_pc_thunk.ax>:
   0:	8b 04 24             	mov    (%esp),%eax
   3:	c3                   	ret    
