
bomb：     文件格式 elf32-i386


Disassembly of section .init:

08048710 <_init>:
 8048710:	55                   	push   %ebp
 8048711:	89 e5                	mov    %esp,%ebp
 8048713:	83 ec 08             	sub    $0x8,%esp
 8048716:	e8 39 02 00 00       	call   8048954 <call_gmon_start>
 804871b:	e8 90 02 00 00       	call   80489b0 <frame_dummy>
 8048720:	e8 8b 10 00 00       	call   80497b0 <__do_global_ctors_aux>
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
 804893b:	68 00 97 04 08       	push   $0x8049700
 8048940:	68 50 97 04 08       	push   $0x8049750
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
 8048a12:	c7 44 24 04 08 98 04 	movl   $0x8049808,0x4(%esp)
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
 8048a4b:	c7 04 24 0a 98 04 08 	movl   $0x804980a,(%esp)
 8048a52:	e8 c1 fd ff ff       	call   8048818 <printf@plt>
 8048a57:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048a5e:	e8 e5 fd ff ff       	call   8048848 <exit@plt>
 8048a63:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048a66:	8b 42 04             	mov    0x4(%edx),%eax
 8048a69:	8b 00                	mov    (%eax),%eax
 8048a6b:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048a6f:	c7 04 24 27 98 04 08 	movl   $0x8049827,(%esp)
 8048a76:	e8 9d fd ff ff       	call   8048818 <printf@plt>
 8048a7b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048a82:	e8 c1 fd ff ff       	call   8048848 <exit@plt>
 8048a87:	e8 7b 07 00 00       	call   8049207 <initialize_bomb>
 8048a8c:	c7 04 24 44 98 04 08 	movl   $0x8049844,(%esp)
 8048a93:	e8 30 fd ff ff       	call   80487c8 <puts@plt>
 8048a98:	c7 04 24 80 98 04 08 	movl   $0x8049880,(%esp)
 8048a9f:	e8 24 fd ff ff       	call   80487c8 <puts@plt>
 8048aa4:	e8 1d 08 00 00       	call   80492c6 <read_line>
 8048aa9:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048aac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048aaf:	89 04 24             	mov    %eax,(%esp)
 8048ab2:	e8 c9 00 00 00       	call   8048b80 <phase_1>
 8048ab7:	e8 c0 0b 00 00       	call   804967c <phase_defused>
 8048abc:	c7 04 24 ac 98 04 08 	movl   $0x80498ac,(%esp)
 8048ac3:	e8 00 fd ff ff       	call   80487c8 <puts@plt>
 8048ac8:	e8 f9 07 00 00       	call   80492c6 <read_line>
 8048acd:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048ad0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048ad3:	89 04 24             	mov    %eax,(%esp)
 8048ad6:	e8 c9 00 00 00       	call   8048ba4 <phase_2>
 8048adb:	e8 9c 0b 00 00       	call   804967c <phase_defused>
 8048ae0:	c7 04 24 d5 98 04 08 	movl   $0x80498d5,(%esp)
 8048ae7:	e8 dc fc ff ff       	call   80487c8 <puts@plt>
 8048aec:	e8 d5 07 00 00       	call   80492c6 <read_line>
 8048af1:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048af4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048af7:	89 04 24             	mov    %eax,(%esp)
 8048afa:	e8 07 01 00 00       	call   8048c06 <phase_3>
 8048aff:	e8 78 0b 00 00       	call   804967c <phase_defused>
 8048b04:	c7 04 24 f3 98 04 08 	movl   $0x80498f3,(%esp)
 8048b0b:	e8 b8 fc ff ff       	call   80487c8 <puts@plt>
 8048b10:	e8 b1 07 00 00       	call   80492c6 <read_line>
 8048b15:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048b18:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048b1b:	89 04 24             	mov    %eax,(%esp)
 8048b1e:	e8 ce 01 00 00       	call   8048cf1 <phase_4>
 8048b23:	e8 54 0b 00 00       	call   804967c <phase_defused>
 8048b28:	c7 04 24 04 99 04 08 	movl   $0x8049904,(%esp)
 8048b2f:	e8 94 fc ff ff       	call   80487c8 <puts@plt>
 8048b34:	e8 8d 07 00 00       	call   80492c6 <read_line>
 8048b39:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048b3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048b3f:	89 04 24             	mov    %eax,(%esp)
 8048b42:	e8 fd 01 00 00       	call   8048d44 <phase_5>
 8048b47:	e8 30 0b 00 00       	call   804967c <phase_defused>
 8048b4c:	c7 04 24 28 99 04 08 	movl   $0x8049928,(%esp)
 8048b53:	e8 70 fc ff ff       	call   80487c8 <puts@plt>
 8048b58:	e8 69 07 00 00       	call   80492c6 <read_line>
 8048b5d:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048b60:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048b63:	89 04 24             	mov    %eax,(%esp)
 8048b66:	e8 dd 02 00 00       	call   8048e48 <phase_6>
 8048b6b:	e8 0c 0b 00 00       	call   804967c <phase_defused>
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
 8048b86:	c7 44 24 04 48 99 04 	movl   $0x8049948,0x4(%esp)		# nnd,这个怎么没放在esi里面反而放在栈上了啊
 8048b8d:	08 
 8048b8e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b91:	89 04 24             	mov    %eax,(%esp)
 8048b94:	e8 f2 04 00 00       	call   804908b <strings_not_equal>	# %rax这个函数的返回值
 8048b99:	85 c0                	test   %eax,%eax	# 判断eax是否等于0
 8048b9b:	74 05                	je     8048ba2 <phase_1+0x22>	# 如果为0则跳过explode_bomb
 8048b9d:	e8 b0 0a 00 00       	call   8049652 <explode_bomb>
 8048ba2:	c9                   	leave  
 8048ba3:	c3                   	ret    

08048ba4 <phase_2>:
 8048ba4:	55                   	push   %ebp
 8048ba5:	89 e5                	mov    %esp,%ebp
 8048ba7:	83 ec 28             	sub    $0x28,%esp
 8048baa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)		# 表明-0x8(%ebp)里的值一开始是0
 # lea（load effective address）
 8048bb1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 8048bb4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048bb8:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bbb:	89 04 24             	mov    %eax,(%esp)
# ebp中的内容："\370\322\377\377ۊ\004\b\260\250\004\b\b\230\004\b\350\322\377\377%\207\004\b\020\323\377\377"
# esp中内容： "\260\250\004\b\250\322\377\377@\250\004\b("
 8048bbe:	e8 35 04 00 00       	call   8048ff8 <read_six_numbers>
 8048bc3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8048bca:	eb 27                	jmp    8048bf3 <phase_2+0x4f>
 8048bcc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048bcf:	8b 54 85 e0          	mov    -0x20(%ebp,%eax,4),%edx
 8048bd3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048bd6:	83 c0 03             	add    $0x3,%eax
 8048bd9:	8b 44 85 e0          	mov    -0x20(%ebp,%eax,4),%eax
 8048bdd:	39 c2                	cmp    %eax,%edx
 8048bdf:	74 05                	je     8048be6 <phase_2+0x42>
 8048be1:	e8 6c 0a 00 00       	call   8049652 <explode_bomb>
 8048be6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048be9:	8b 44 85 e0          	mov    -0x20(%ebp,%eax,4),%eax
 8048bed:	01 45 fc             	add    %eax,-0x4(%ebp)
 8048bf0:	ff 45 f8             	incl   -0x8(%ebp)
 8048bf3:	83 7d f8 02          	cmpl   $0x2,-0x8(%ebp)		# 循环三次
 8048bf7:	7e d3                	jle    8048bcc <phase_2+0x28>
 8048bf9:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 8048bfd:	75 05                	jne    8048c04 <phase_2+0x60>
 8048bff:	e8 4e 0a 00 00       	call   8049652 <explode_bomb>
 8048c04:	c9                   	leave  
 8048c05:	c3                   	ret    

08048c06 <phase_3>:
 8048c06:	55                   	push   %ebp
 8048c07:	89 e5                	mov    %esp,%ebp
 8048c09:	83 ec 28             	sub    $0x28,%esp
 8048c0c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)		# $ebp-8 = 0
 8048c13:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)		# $ebp-4 = 0
 8048c1a:	8d 45 f0             	lea    -0x10(%ebp),%eax		# $eax = $ebp-0x10
 8048c1d:	89 44 24 0c          	mov    %eax,0xc(%esp)		# $esp+0xc = $ebp-0x1c = $eax
 8048c21:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8048c24:	89 44 24 08          	mov    %eax,0x8(%esp)
 # (gdb) x/s 0x8049986
 # 0x8049986:	"%d %d"
 8048c28:	c7 44 24 04 86 99 04 	movl   $0x8049986,0x4(%esp)
 8048c2f:	08 
 8048c30:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c33:	89 04 24             	mov    %eax,(%esp)
 8048c36:	e8 2d fc ff ff       	call   8048868 <sscanf@plt>
 8048c3b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 # 说明第一个数要大于1
 8048c3e:	83 7d fc 01          	cmpl   $0x1,-0x4(%ebp)
 8048c42:	7f 05                	jg     8048c49 <phase_3+0x43>
 8048c44:	e8 09 0a 00 00       	call   8049652 <explode_bomb>
 # 第五个数字覆盖在第三个数字上，且要比7小或者等于七（这个地方好像不需要判断）
 8048c49:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c4c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 # 判断-0x14(%ebp)是否大于7
 8048c4f:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
 8048c53:	77 54                	ja     8048ca9 <phase_3+0xa3>
 8048c55:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048c58:	8b 04 95 8c 99 04 08 	mov    0x804998c(,%edx,4),%eax
 8048c5f:	ff e0                	jmp    *%eax
 8048c61:	c7 45 f8 b2 00 00 00 	movl   $0xb2,-0x8(%ebp)
 8048c68:	eb 44                	jmp    8048cae <phase_3+0xa8>
 8048c6a:	c7 45 f8 5b 02 00 00 	movl   $0x25b,-0x8(%ebp)
 8048c71:	eb 3b                	jmp    8048cae <phase_3+0xa8>
 8048c73:	c7 45 f8 59 00 00 00 	movl   $0x59,-0x8(%ebp)
 8048c7a:	eb 32                	jmp    8048cae <phase_3+0xa8>
 8048c7c:	c7 45 f8 b0 02 00 00 	movl   $0x2b0,-0x8(%ebp)
 8048c83:	eb 29                	jmp    8048cae <phase_3+0xa8>
 8048c85:	c7 45 f8 78 01 00 00 	movl   $0x178,-0x8(%ebp)
 8048c8c:	eb 20                	jmp    8048cae <phase_3+0xa8>
 8048c8e:	c7 45 f8 e6 00 00 00 	movl   $0xe6,-0x8(%ebp)
 8048c95:	eb 17                	jmp    8048cae <phase_3+0xa8>
 8048c97:	c7 45 f8 07 02 00 00 	movl   $0x207,-0x8(%ebp)
 8048c9e:	eb 0e                	jmp    8048cae <phase_3+0xa8>
 8048ca0:	c7 45 f8 f0 01 00 00 	movl   $0x1f0,-0x8(%ebp)
 8048ca7:	eb 05                	jmp    8048cae <phase_3+0xa8>
 8048ca9:	e8 a4 09 00 00       	call   8049652 <explode_bomb>
 8048cae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 # 我想偷懒字节看这个数字是否符合要求，暂时没有找到
 # (gdb) p $ebp-8
 # $46 = (void *) 0xffffd2c0
 # (gdb) x $ebp-0x8
 # 0xffffd2c0:	"\262"
 # (gdb) x/4wd $ebp-8
 # 0xffffd2c0:	178	2	-11528	134515455
 # 命令 x ：查看内存地址中的值
 # 格式：x/<n/f/u>  <addr>
 # n:是正整数，表示需要显示的内存单元的个数，即从当前地址向后显示n个内存单元的内容，一个内存单元的大小由第三个参数u定义。
 # f:表示addr指向的内存内容的输出格式，s对应输出字符串，此处需特别注意输出整型数据的格式：
 # x 按十六进制格式显示变量。
 # d 按十进制格式显示变量
 8048cb1:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 8048cb4:	74 05                	je     8048cbb <phase_3+0xb5>
 8048cb6:	e8 97 09 00 00       	call   8049652 <explode_bomb>
 8048cbb:	c9                   	leave  
 8048cbc:	c3                   	ret    

# 通过遍历的方法：设为1,2,3,4...看出规律，这个是算7^x次幂
08048cbd <func4>:
 8048cbd:	55                   	push   %ebp
 8048cbe:	89 e5                	mov    %esp,%ebp
 8048cc0:	83 ec 08             	sub    $0x8,%esp
 8048cc3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048cc7:	7f 09                	jg     8048cd2 <func4+0x15>
 8048cc9:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
 8048cd0:	eb 1a                	jmp    8048cec <func4+0x2f>
 8048cd2:	8b 45 08             	mov    0x8(%ebp),%eax
 8048cd5:	48                   	dec    %eax
 8048cd6:	89 04 24             	mov    %eax,(%esp)
 # 递归
 8048cd9:	e8 df ff ff ff       	call   8048cbd <func4>
 8048cde:	89 c2                	mov    %eax,%edx
 8048ce0:	89 d0                	mov    %edx,%eax
 8048ce2:	c1 e0 03             	shl    $0x3,%eax
 8048ce5:	89 c1                	mov    %eax,%ecx
 8048ce7:	29 d1                	sub    %edx,%ecx
 8048ce9:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 8048cec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048cef:	c9                   	leave  
 8048cf0:	c3                   	ret    

08048cf1 <phase_4>:
 8048cf1:	55                   	push   %ebp
 8048cf2:	89 e5                	mov    %esp,%ebp
 8048cf4:	83 ec 28             	sub    $0x28,%esp
 8048cf7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8048cfa:	89 44 24 08          	mov    %eax,0x8(%esp)
 # 这个0x80499ac地址指向的是“%d”字符串
 8048cfe:	c7 44 24 04 ac 99 04 	movl   $0x80499ac,0x4(%esp)
 8048d05:	08 
 8048d06:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d09:	89 04 24             	mov    %eax,(%esp)
 8048d0c:	e8 57 fb ff ff       	call   8048868 <sscanf@plt>
 8048d11:	89 45 fc             	mov    %eax,-0x4(%ebp)
 # 这里-0x4(%ebp)里面放的是输入元素的个数，所以为1
 8048d14:	83 7d fc 01          	cmpl   $0x1,-0x4(%ebp)
 8048d18:	75 07                	jne    8048d21 <phase_4+0x30>
 # -0xc(%ebp)里面放的输入的数，应该是不能小于等于0
 8048d1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d1d:	85 c0                	test   %eax,%eax
 8048d1f:	7f 05                	jg     8048d26 <phase_4+0x35>
 8048d21:	e8 2c 09 00 00       	call   8049652 <explode_bomb>
 8048d26:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d29:	89 04 24             	mov    %eax,(%esp)
 # 重点应该是在func4
 8048d2c:	e8 8c ff ff ff       	call   8048cbd <func4>
 8048d31:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048d34:	81 7d f8 a7 41 00 00 	cmpl   $0x41a7,-0x8(%ebp)
 # 可以算一算0x41a7即16807是7的几次幂，好像是5次幂
 8048d3b:	74 05                	je     8048d42 <phase_4+0x51>
 8048d3d:	e8 10 09 00 00       	call   8049652 <explode_bomb>
 8048d42:	c9                   	leave  
 8048d43:	c3                   	ret    

08048d44 <phase_5>:
 8048d44:	55                   	push   %ebp
 8048d45:	89 e5                	mov    %esp,%ebp
 8048d47:	83 ec 18             	sub    $0x18,%esp
 8048d4a:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d4d:	89 04 24             	mov    %eax,(%esp)
 8048d50:	e8 0c 03 00 00       	call   8049061 <string_length>
 8048d55:	89 45 fc             	mov    %eax,-0x4(%ebp)
 # 这里是在说你的字符串长度要为6
 8048d58:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
 8048d5c:	74 05                	je     8048d63 <phase_5+0x1f>
 8048d5e:	e8 ef 08 00 00       	call   8049652 <explode_bomb>
 8048d63:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8048d6a:	eb 20                	jmp    8048d8c <phase_5+0x48>
 8048d6c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048d6f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048d72:	03 45 08             	add    0x8(%ebp),%eax
 8048d75:	0f b6 00             	movzbl (%eax),%eax

 8048d78:	0f be c0             	movsbl %al,%eax
 # 我注意到这个and    $0xf，我猜测昂，只是猜测。。。
 # 它是你用你输入字符串的低四位作为下标，然后在<array.2484>寻找对应的字符
 8048d7b:	83 e0 0f             	and    $0xf,%eax
 # (gdb) x/s 0x804a5c0
 # 0x804a5c0 <array.2484>: "isrveawhobpnutfg\314\002"
 8048d7e:	0f b6 80 c0 a5 04 08 	movzbl 0x804a5c0(%eax),%eax
 8048d85:	88 44 15 f1          	mov    %al,-0xf(%ebp,%edx,1)
 8048d89:	ff 45 f8             	incl   -0x8(%ebp)
 8048d8c:	83 7d f8 05          	cmpl   $0x5,-0x8(%ebp)
 8048d90:	7e da                	jle    8048d6c <phase_5+0x28>
 8048d92:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
 # (gdb) x/s 0x80499af
 # 0x80499af:      "saints"
 8048d96:	c7 44 24 04 af 99 04 	movl   $0x80499af,0x4(%esp)
 8048d9d:	08 
 8048d9e:	8d 45 f1             	lea    -0xf(%ebp),%eax
 8048da1:	89 04 24             	mov    %eax,(%esp)
 8048da4:	e8 e2 02 00 00       	call   804908b <strings_not_equal>
 8048da9:	85 c0                	test   %eax,%eax
 8048dab:	74 05                	je     8048db2 <phase_5+0x6e>
 8048dad:	e8 a0 08 00 00       	call   8049652 <explode_bomb>
 8048db2:	c9                   	leave  
 8048db3:	c3                   	ret    

08048db4 <fun6>:
 8048db4:	55                   	push   %ebp
 8048db5:	89 e5                	mov    %esp,%ebp
 8048db7:	83 ec 10             	sub    $0x10,%esp
 # 抱歉用了一个笨办法，我就是给这个函数输入一个字符串，例如从1~20左右，猜测这个函数是干什么的
 # 然后就很遗憾发现这个函数好像只是将atoi转成整形的结果只是简单地除了一下10
 8048dba:	8b 45 08             	mov    0x8(%ebp),%eax
 8048dbd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048dc0:	8b 45 08             	mov    0x8(%ebp),%eax
 8048dc3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048dc6:	8b 45 08             	mov    0x8(%ebp),%eax
 8048dc9:	8b 40 08             	mov    0x8(%eax),%eax
 8048dcc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048dcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048dd2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 8048dd9:	eb 62                	jmp    8048e3d <fun6+0x89>
 8048ddb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048dde:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048de1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048de4:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048de7:	eb 0f                	jmp    8048df8 <fun6+0x44>
 8048de9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048dec:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048def:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048df2:	8b 40 08             	mov    0x8(%eax),%eax
 8048df5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048df8:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 8048dfc:	74 0e                	je     8048e0c <fun6+0x58>
 8048dfe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e01:	8b 10                	mov    (%eax),%edx
 8048e03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e06:	8b 00                	mov    (%eax),%eax
 8048e08:	39 c2                	cmp    %eax,%edx
 8048e0a:	7f dd                	jg     8048de9 <fun6+0x35>
 8048e0c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048e0f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8048e12:	74 0b                	je     8048e1f <fun6+0x6b>
 8048e14:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048e17:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e1a:	89 42 08             	mov    %eax,0x8(%edx)
 8048e1d:	eb 06                	jmp    8048e25 <fun6+0x71>
 8048e1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e22:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048e25:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e28:	8b 40 08             	mov    0x8(%eax),%eax
 8048e2b:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048e2e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048e31:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e34:	89 42 08             	mov    %eax,0x8(%edx)
 8048e37:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048e3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048e3d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048e41:	75 98                	jne    8048ddb <fun6+0x27>
 8048e43:	8b 45 f0             	mov    -0x10(%ebp),%eax

 8048e46:	c9                   	leave  
 8048e47:	c3                   	ret    

08048e48 <phase_6>:
 8048e48:	55                   	push   %ebp
 8048e49:	89 e5                	mov    %esp,%ebp
 8048e4b:	83 ec 18             	sub    $0x18,%esp
 8048e4e:	c7 45 f8 30 a6 04 08 	movl   $0x804a630,-0x8(%ebp)
 8048e55:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e58:	89 04 24             	mov    %eax,(%esp)
 8048e5b:	e8 f8 f9 ff ff       	call   8048858 <atoi@plt>
 8048e60:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048e63:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048e66:	89 04 24             	mov    %eax,(%esp)
 8048e69:	e8 46 ff ff ff       	call   8048db4 <fun6>
 8048e6e:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048e71:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048e74:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048e77:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 8048e7e:	eb 0c                	jmp    8048e8c <phase_6+0x44>
 8048e80:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e83:	8b 40 08             	mov    0x8(%eax),%eax
 8048e86:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048e89:	ff 45 f0             	incl   -0x10(%ebp)
 8048e8c:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
 8048e90:	75 ee                	jne    8048e80 <phase_6+0x38>
 8048e92:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048e95:	8b 00                	mov    (%eax),%eax
 # 比较-0xc(%ebp)和$eax的值，发现$eax是固定的716，所以输入的字符串是7160
 8048e97:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8048e9a:	74 05                	je     8048ea1 <phase_6+0x59>
 8048e9c:	e8 b1 07 00 00       	call   8049652 <explode_bomb>
 8048ea1:	c9                   	leave  
 8048ea2:	c3                   	ret    

08048ea3 <fun7>:
 8048ea3:	55                   	push   %ebp
 8048ea4:	89 e5                	mov    %esp,%ebp
 8048ea6:	83 ec 0c             	sub    $0xc,%esp
 8048ea9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048ead:	75 09                	jne    8048eb8 <fun7+0x15>
 8048eaf:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%ebp)
 8048eb6:	eb 54                	jmp    8048f0c <fun7+0x69>
 8048eb8:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ebb:	8b 00                	mov    (%eax),%eax
 8048ebd:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048ec0:	7e 1c                	jle    8048ede <fun7+0x3b>
 8048ec2:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ec5:	8b 50 04             	mov    0x4(%eax),%edx
 8048ec8:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048ecb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048ecf:	89 14 24             	mov    %edx,(%esp)
 8048ed2:	e8 cc ff ff ff       	call   8048ea3 <fun7>
 8048ed7:	01 c0                	add    %eax,%eax
 8048ed9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048edc:	eb 2e                	jmp    8048f0c <fun7+0x69>
 8048ede:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ee1:	8b 00                	mov    (%eax),%eax
 8048ee3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048ee6:	75 09                	jne    8048ef1 <fun7+0x4e>
 8048ee8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048eef:	eb 1b                	jmp    8048f0c <fun7+0x69>
 8048ef1:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ef4:	8b 50 08             	mov    0x8(%eax),%edx
 8048ef7:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048efa:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048efe:	89 14 24             	mov    %edx,(%esp)
 8048f01:	e8 9d ff ff ff       	call   8048ea3 <fun7>
 8048f06:	01 c0                	add    %eax,%eax
 8048f08:	40                   	inc    %eax
 8048f09:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048f0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048f0f:	c9                   	leave  
 8048f10:	c3                   	ret    

08048f11 <secret_phase>:
 8048f11:	55                   	push   %ebp
 8048f12:	89 e5                	mov    %esp,%ebp
 8048f14:	83 ec 18             	sub    $0x18,%esp
 8048f17:	e8 aa 03 00 00       	call   80492c6 <read_line>
 8048f1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048f1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f22:	89 04 24             	mov    %eax,(%esp)
 8048f25:	e8 2e f9 ff ff       	call   8048858 <atoi@plt>
 8048f2a:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048f2d:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 8048f31:	7e 09                	jle    8048f3c <secret_phase+0x2b>
 8048f33:	81 7d f8 e9 03 00 00 	cmpl   $0x3e9,-0x8(%ebp)
 8048f3a:	7e 05                	jle    8048f41 <secret_phase+0x30>
 8048f3c:	e8 11 07 00 00       	call   8049652 <explode_bomb>
 8048f41:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8048f44:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f48:	c7 04 24 e4 a6 04 08 	movl   $0x804a6e4,(%esp)
 8048f4f:	e8 4f ff ff ff       	call   8048ea3 <fun7>
 8048f54:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048f57:	83 7d fc 06          	cmpl   $0x6,-0x4(%ebp)
 8048f5b:	74 05                	je     8048f62 <secret_phase+0x51>
 8048f5d:	e8 f0 06 00 00       	call   8049652 <explode_bomb>
 8048f62:	c7 04 24 b8 99 04 08 	movl   $0x80499b8,(%esp)
 8048f69:	e8 5a f8 ff ff       	call   80487c8 <puts@plt>
 8048f6e:	e8 09 07 00 00       	call   804967c <phase_defused>
 8048f73:	c9                   	leave  
 8048f74:	c3                   	ret    
 8048f75:	90                   	nop
 8048f76:	90                   	nop
 8048f77:	90                   	nop

08048f78 <sig_handler>:
 8048f78:	55                   	push   %ebp
 8048f79:	89 e5                	mov    %esp,%ebp
 8048f7b:	83 ec 08             	sub    $0x8,%esp
 # (gdb) x/wd 0x804a630
 # 0x804a630 <node1>:      423
 # 这个文件里面我没有找到node1变量
 8048f7e:	c7 04 24 30 9c 04 08 	movl   $0x8049c30,(%esp)
 8048f85:	e8 3e f8 ff ff       	call   80487c8 <puts@plt>
 8048f8a:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8048f91:	e8 52 f8 ff ff       	call   80487e8 <sleep@plt>
 8048f96:	c7 04 24 68 9c 04 08 	movl   $0x8049c68,(%esp)
 8048f9d:	e8 76 f8 ff ff       	call   8048818 <printf@plt>
 8048fa2:	a1 40 a8 04 08       	mov    0x804a840,%eax
 8048fa7:	89 04 24             	mov    %eax,(%esp)
 8048faa:	e8 d9 f7 ff ff       	call   8048788 <fflush@plt>
 8048faf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048fb6:	e8 2d f8 ff ff       	call   80487e8 <sleep@plt>
 8048fbb:	c7 04 24 70 9c 04 08 	movl   $0x8049c70,(%esp)
 8048fc2:	e8 01 f8 ff ff       	call   80487c8 <puts@plt>
 8048fc7:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
 8048fce:	e8 75 f8 ff ff       	call   8048848 <exit@plt>

08048fd3 <invalid_phase>:
 8048fd3:	55                   	push   %ebp
 8048fd4:	89 e5                	mov    %esp,%ebp
 8048fd6:	83 ec 08             	sub    $0x8,%esp
 8048fd9:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fdc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048fe0:	c7 04 24 78 9c 04 08 	movl   $0x8049c78,(%esp)
 8048fe7:	e8 2c f8 ff ff       	call   8048818 <printf@plt>
 8048fec:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048ff3:	e8 50 f8 ff ff       	call   8048848 <exit@plt>

08048ff8 <read_six_numbers>:
 8048ff8:	55                   	push   %ebp
 8048ff9:	89 e5                	mov    %esp,%ebp
 8048ffb:	56                   	push   %esi
 8048ffc:	53                   	push   %ebx
 8048ffd:	83 ec 30             	sub    $0x30,%esp
 8049000:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049003:	83 c0 14             	add    $0x14,%eax
 8049006:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049009:	83 c2 10             	add    $0x10,%edx
 804900c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804900f:	83 c1 0c             	add    $0xc,%ecx
 8049012:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8049015:	83 c3 08             	add    $0x8,%ebx
 8049018:	8b 75 0c             	mov    0xc(%ebp),%esi
 804901b:	83 c6 04             	add    $0x4,%esi
 804901e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 8049022:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049026:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 804902a:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 804902e:	89 74 24 0c          	mov    %esi,0xc(%esp)
 8049032:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049035:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049039:	c7 44 24 04 89 9c 04 	movl   $0x8049c89,0x4(%esp)
 8049040:	08 
 8049041:	8b 45 08             	mov    0x8(%ebp),%eax
 8049044:	89 04 24             	mov    %eax,(%esp)
 8049047:	e8 1c f8 ff ff       	call   8048868 <sscanf@plt>
 804904c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804904f:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
 8049053:	7f 05                	jg     804905a <read_six_numbers+0x62>
 8049055:	e8 f8 05 00 00       	call   8049652 <explode_bomb>
 804905a:	83 c4 30             	add    $0x30,%esp
 804905d:	5b                   	pop    %ebx
 804905e:	5e                   	pop    %esi
 804905f:	5d                   	pop    %ebp
 8049060:	c3                   	ret    

08049061 <string_length>:
 8049061:	55                   	push   %ebp
 8049062:	89 e5                	mov    %esp,%ebp
 8049064:	83 ec 10             	sub    $0x10,%esp
 8049067:	8b 45 08             	mov    0x8(%ebp),%eax
 804906a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804906d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8049074:	eb 06                	jmp    804907c <string_length+0x1b>
 8049076:	ff 45 fc             	incl   -0x4(%ebp)
 8049079:	ff 45 f8             	incl   -0x8(%ebp)
 804907c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804907f:	0f b6 00             	movzbl (%eax),%eax
 8049082:	84 c0                	test   %al,%al
 8049084:	75 f0                	jne    8049076 <string_length+0x15>
 8049086:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049089:	c9                   	leave  
 804908a:	c3                   	ret    

0804908b <strings_not_equal>:
 804908b:	55                   	push   %ebp
 804908c:	89 e5                	mov    %esp,%ebp
 804908e:	53                   	push   %ebx
 804908f:	83 ec 18             	sub    $0x18,%esp
 8049092:	8b 45 08             	mov    0x8(%ebp),%eax
 8049095:	89 04 24             	mov    %eax,(%esp)
 8049098:	e8 c4 ff ff ff       	call   8049061 <string_length>
 804909d:	89 c3                	mov    %eax,%ebx
 804909f:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490a2:	89 04 24             	mov    %eax,(%esp)
 80490a5:	e8 b7 ff ff ff       	call   8049061 <string_length>
 80490aa:	39 c3                	cmp    %eax,%ebx
 80490ac:	74 09                	je     80490b7 <strings_not_equal+0x2c>
 80490ae:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
 80490b5:	eb 3e                	jmp    80490f5 <strings_not_equal+0x6a>
 80490b7:	8b 45 08             	mov    0x8(%ebp),%eax
 80490ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80490bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490c0:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80490c3:	eb 1f                	jmp    80490e4 <strings_not_equal+0x59>
 80490c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490c8:	0f b6 10             	movzbl (%eax),%edx
 80490cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80490ce:	0f b6 00             	movzbl (%eax),%eax
 80490d1:	38 c2                	cmp    %al,%dl
 80490d3:	74 09                	je     80490de <strings_not_equal+0x53>
 80490d5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
 80490dc:	eb 17                	jmp    80490f5 <strings_not_equal+0x6a>
 80490de:	ff 45 f4             	incl   -0xc(%ebp)
 80490e1:	ff 45 f8             	incl   -0x8(%ebp)
 80490e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490e7:	0f b6 00             	movzbl (%eax),%eax
 80490ea:	84 c0                	test   %al,%al
 80490ec:	75 d7                	jne    80490c5 <strings_not_equal+0x3a>
 80490ee:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 80490f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80490f8:	83 c4 18             	add    $0x18,%esp
 80490fb:	5b                   	pop    %ebx
 80490fc:	5d                   	pop    %ebp
 80490fd:	c3                   	ret    

080490fe <open_clientfd>:
 80490fe:	55                   	push   %ebp
 80490ff:	89 e5                	mov    %esp,%ebp
 8049101:	83 ec 38             	sub    $0x38,%esp
 8049104:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804910b:	00 
 804910c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049113:	00 
 8049114:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 804911b:	e8 b8 f7 ff ff       	call   80488d8 <socket@plt>
 8049120:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049123:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 8049127:	79 18                	jns    8049141 <open_clientfd+0x43>
 8049129:	c7 04 24 9b 9c 04 08 	movl   $0x8049c9b,(%esp)
 8049130:	e8 93 f6 ff ff       	call   80487c8 <puts@plt>
 8049135:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 804913c:	e8 07 f7 ff ff       	call   8048848 <exit@plt>
 8049141:	8b 45 08             	mov    0x8(%ebp),%eax
 8049144:	89 04 24             	mov    %eax,(%esp)
 8049147:	e8 ec f6 ff ff       	call   8048838 <gethostbyname@plt>
 804914c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804914f:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 8049153:	75 18                	jne    804916d <open_clientfd+0x6f>
 8049155:	c7 04 24 a9 9c 04 08 	movl   $0x8049ca9,(%esp)
 804915c:	e8 67 f6 ff ff       	call   80487c8 <puts@plt>
 8049161:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049168:	e8 db f6 ff ff       	call   8048848 <exit@plt>
 804916d:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8049170:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 8049176:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 804917d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 8049184:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
 804918b:	66 c7 45 e8 02 00    	movw   $0x2,-0x18(%ebp)
 8049191:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049194:	8b 40 0c             	mov    0xc(%eax),%eax
 8049197:	89 c1                	mov    %eax,%ecx
 8049199:	8d 45 e8             	lea    -0x18(%ebp),%eax
 804919c:	8d 50 04             	lea    0x4(%eax),%edx
 804919f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80491a2:	8b 40 10             	mov    0x10(%eax),%eax
 80491a5:	8b 00                	mov    (%eax),%eax
 80491a7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80491ab:	89 54 24 04          	mov    %edx,0x4(%esp)
 80491af:	89 04 24             	mov    %eax,(%esp)
 80491b2:	e8 e1 f5 ff ff       	call   8048798 <bcopy@plt>
 80491b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491ba:	0f b7 c0             	movzwl %ax,%eax
 80491bd:	89 04 24             	mov    %eax,(%esp)
 80491c0:	e8 b3 f6 ff ff       	call   8048878 <htons@plt>
 80491c5:	0f b7 c0             	movzwl %ax,%eax
 80491c8:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
 80491cc:	8d 45 e8             	lea    -0x18(%ebp),%eax
 80491cf:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 80491d6:	00 
 80491d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80491db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80491de:	89 04 24             	mov    %eax,(%esp)
 80491e1:	e8 a2 f6 ff ff       	call   8048888 <connect@plt>
 80491e6:	85 c0                	test   %eax,%eax
 80491e8:	79 18                	jns    8049202 <open_clientfd+0x104>
 80491ea:	c7 04 24 b7 9c 04 08 	movl   $0x8049cb7,(%esp)
 80491f1:	e8 d2 f5 ff ff       	call   80487c8 <puts@plt>
 80491f6:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80491fd:	e8 46 f6 ff ff       	call   8048848 <exit@plt>
 8049202:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049205:	c9                   	leave  
 8049206:	c3                   	ret    

08049207 <initialize_bomb>:
 8049207:	55                   	push   %ebp
 8049208:	89 e5                	mov    %esp,%ebp
 804920a:	83 ec 08             	sub    $0x8,%esp
 804920d:	c7 44 24 04 78 8f 04 	movl   $0x8048f78,0x4(%esp)
 8049214:	08 
 8049215:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 804921c:	e8 57 f5 ff ff       	call   8048778 <signal@plt>
 8049221:	c9                   	leave  
 8049222:	c3                   	ret    

08049223 <blank_line>:
 8049223:	55                   	push   %ebp
 8049224:	89 e5                	mov    %esp,%ebp
 8049226:	83 ec 08             	sub    $0x8,%esp
 8049229:	eb 32                	jmp    804925d <blank_line+0x3a>
 804922b:	e8 b8 f6 ff ff       	call   80488e8 <__ctype_b_loc@plt>
 8049230:	8b 10                	mov    (%eax),%edx
 8049232:	8b 45 08             	mov    0x8(%ebp),%eax
 8049235:	0f b6 00             	movzbl (%eax),%eax
 8049238:	0f be c0             	movsbl %al,%eax
 804923b:	01 c0                	add    %eax,%eax
 804923d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 8049240:	0f b7 00             	movzwl (%eax),%eax
 8049243:	25 00 20 00 00       	and    $0x2000,%eax
 8049248:	85 c0                	test   %eax,%eax
 804924a:	0f 94 c0             	sete   %al
 804924d:	ff 45 08             	incl   0x8(%ebp)
 8049250:	84 c0                	test   %al,%al
 8049252:	74 09                	je     804925d <blank_line+0x3a>
 8049254:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804925b:	eb 11                	jmp    804926e <blank_line+0x4b>
 804925d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049260:	0f b6 00             	movzbl (%eax),%eax
 8049263:	84 c0                	test   %al,%al
 8049265:	75 c4                	jne    804922b <blank_line+0x8>
 8049267:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
 804926e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049271:	c9                   	leave  
 8049272:	c3                   	ret    

08049273 <skip>:
 8049273:	55                   	push   %ebp
 8049274:	89 e5                	mov    %esp,%ebp
 8049276:	83 ec 28             	sub    $0x28,%esp
 8049279:	8b 0d 50 a8 04 08    	mov    0x804a850,%ecx
 804927f:	a1 4c a8 04 08       	mov    0x804a84c,%eax
 8049284:	89 c2                	mov    %eax,%edx
 8049286:	89 d0                	mov    %edx,%eax
 8049288:	c1 e0 02             	shl    $0x2,%eax
 804928b:	01 d0                	add    %edx,%eax
 804928d:	c1 e0 04             	shl    $0x4,%eax
 8049290:	05 60 a8 04 08       	add    $0x804a860,%eax
 8049295:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049299:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
 80492a0:	00 
 80492a1:	89 04 24             	mov    %eax,(%esp)
 80492a4:	e8 2f f5 ff ff       	call   80487d8 <fgets@plt>
 80492a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80492ac:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 80492b0:	74 0f                	je     80492c1 <skip+0x4e>
 80492b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492b5:	89 04 24             	mov    %eax,(%esp)
 80492b8:	e8 66 ff ff ff       	call   8049223 <blank_line>
 80492bd:	85 c0                	test   %eax,%eax
 80492bf:	75 b8                	jne    8049279 <skip+0x6>
 80492c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80492c4:	c9                   	leave  
 80492c5:	c3                   	ret    

080492c6 <read_line>:
 80492c6:	55                   	push   %ebp
 80492c7:	89 e5                	mov    %esp,%ebp
 80492c9:	57                   	push   %edi
 80492ca:	83 ec 24             	sub    $0x24,%esp
 80492cd:	e8 a1 ff ff ff       	call   8049273 <skip>
 80492d2:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80492d5:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 80492d9:	75 67                	jne    8049342 <read_line+0x7c>
 80492db:	8b 15 50 a8 04 08    	mov    0x804a850,%edx
 80492e1:	a1 44 a8 04 08       	mov    0x804a844,%eax
 80492e6:	39 c2                	cmp    %eax,%edx
 80492e8:	75 13                	jne    80492fd <read_line+0x37>
 80492ea:	c7 04 24 c5 9c 04 08 	movl   $0x8049cc5,(%esp)
 80492f1:	e8 d2 f4 ff ff       	call   80487c8 <puts@plt>
 80492f6:	e8 57 03 00 00       	call   8049652 <explode_bomb>
 80492fb:	eb 45                	jmp    8049342 <read_line+0x7c>
 80492fd:	c7 04 24 e3 9c 04 08 	movl   $0x8049ce3,(%esp)
 8049304:	e8 5f f4 ff ff       	call   8048768 <getenv@plt>
 8049309:	85 c0                	test   %eax,%eax
 804930b:	74 0c                	je     8049319 <read_line+0x53>
 804930d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049314:	e8 2f f5 ff ff       	call   8048848 <exit@plt>
 8049319:	a1 44 a8 04 08       	mov    0x804a844,%eax
 804931e:	a3 50 a8 04 08       	mov    %eax,0x804a850
 8049323:	e8 4b ff ff ff       	call   8049273 <skip>
 8049328:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804932b:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 804932f:	75 11                	jne    8049342 <read_line+0x7c>
 8049331:	c7 04 24 c5 9c 04 08 	movl   $0x8049cc5,(%esp)
 8049338:	e8 8b f4 ff ff       	call   80487c8 <puts@plt>
 804933d:	e8 10 03 00 00       	call   8049652 <explode_bomb>
 8049342:	a1 4c a8 04 08       	mov    0x804a84c,%eax
 8049347:	89 c2                	mov    %eax,%edx
 8049349:	89 d0                	mov    %edx,%eax
 804934b:	c1 e0 02             	shl    $0x2,%eax
 804934e:	01 d0                	add    %edx,%eax
 8049350:	c1 e0 04             	shl    $0x4,%eax
 8049353:	05 60 a8 04 08       	add    $0x804a860,%eax
 8049358:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 804935d:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049360:	b0 00                	mov    $0x0,%al
 8049362:	fc                   	cld    
 8049363:	8b 7d e8             	mov    -0x18(%ebp),%edi
 8049366:	f2 ae                	repnz scas %es:(%edi),%al
 8049368:	89 c8                	mov    %ecx,%eax
 804936a:	f7 d0                	not    %eax
 804936c:	48                   	dec    %eax
 804936d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049370:	83 7d f4 4f          	cmpl   $0x4f,-0xc(%ebp)
 8049374:	75 11                	jne    8049387 <read_line+0xc1>
 8049376:	c7 04 24 ee 9c 04 08 	movl   $0x8049cee,(%esp)
 804937d:	e8 46 f4 ff ff       	call   80487c8 <puts@plt>
 8049382:	e8 cb 02 00 00       	call   8049652 <explode_bomb>
 8049387:	8b 15 4c a8 04 08    	mov    0x804a84c,%edx
 804938d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8049390:	49                   	dec    %ecx
 8049391:	89 d0                	mov    %edx,%eax
 8049393:	c1 e0 02             	shl    $0x2,%eax
 8049396:	01 d0                	add    %edx,%eax
 8049398:	c1 e0 04             	shl    $0x4,%eax
 804939b:	01 c8                	add    %ecx,%eax
 804939d:	05 60 a8 04 08       	add    $0x804a860,%eax
 80493a2:	c6 00 00             	movb   $0x0,(%eax)
 80493a5:	8b 0d 4c a8 04 08    	mov    0x804a84c,%ecx
 80493ab:	89 ca                	mov    %ecx,%edx
 80493ad:	89 d0                	mov    %edx,%eax
 80493af:	c1 e0 02             	shl    $0x2,%eax
 80493b2:	01 d0                	add    %edx,%eax
 80493b4:	c1 e0 04             	shl    $0x4,%eax
 80493b7:	05 60 a8 04 08       	add    $0x804a860,%eax
 80493bc:	89 c2                	mov    %eax,%edx
 80493be:	8d 41 01             	lea    0x1(%ecx),%eax
 80493c1:	a3 4c a8 04 08       	mov    %eax,0x804a84c
 80493c6:	89 d0                	mov    %edx,%eax
 80493c8:	83 c4 24             	add    $0x24,%esp
 80493cb:	5f                   	pop    %edi
 80493cc:	5d                   	pop    %ebp
 80493cd:	c3                   	ret    

080493ce <send_msg>:
 80493ce:	55                   	push   %ebp
 80493cf:	89 e5                	mov    %esp,%ebp
 80493d1:	81 ec 88 00 00 00    	sub    $0x88,%esp
 80493d7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80493de:	e8 c5 f4 ff ff       	call   80488a8 <dup@plt>
 80493e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80493e6:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
 80493ea:	75 18                	jne    8049404 <send_msg+0x36>
 80493ec:	c7 04 24 09 9d 04 08 	movl   $0x8049d09,(%esp)
 80493f3:	e8 d0 f3 ff ff       	call   80487c8 <puts@plt>
 80493f8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80493ff:	e8 44 f4 ff ff       	call   8048848 <exit@plt>
 8049404:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804940b:	e8 28 f3 ff ff       	call   8048738 <close@plt>
 8049410:	83 f8 ff             	cmp    $0xffffffff,%eax
 8049413:	75 18                	jne    804942d <send_msg+0x5f>
 8049415:	c7 04 24 1d 9d 04 08 	movl   $0x8049d1d,(%esp)
 804941c:	e8 a7 f3 ff ff       	call   80487c8 <puts@plt>
 8049421:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049428:	e8 1b f4 ff ff       	call   8048848 <exit@plt>
 804942d:	e8 26 f3 ff ff       	call   8048758 <tmpfile@plt>
 8049432:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049435:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049439:	75 18                	jne    8049453 <send_msg+0x85>
 804943b:	c7 04 24 30 9d 04 08 	movl   $0x8049d30,(%esp)
 8049442:	e8 81 f3 ff ff       	call   80487c8 <puts@plt>
 8049447:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 804944e:	e8 f5 f3 ff ff       	call   8048848 <exit@plt>
 8049453:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049456:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804945a:	c7 44 24 08 1b 00 00 	movl   $0x1b,0x8(%esp)
 8049461:	00 
 8049462:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049469:	00 
 804946a:	c7 04 24 45 9d 04 08 	movl   $0x8049d45,(%esp)
 8049471:	e8 52 f4 ff ff       	call   80488c8 <fwrite@plt>
 8049476:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049479:	89 44 24 04          	mov    %eax,0x4(%esp)
 804947d:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 8049484:	e8 6f f3 ff ff       	call   80487f8 <fputc@plt>
 8049489:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049490:	e8 63 f4 ff ff       	call   80488f8 <cuserid@plt>
 8049495:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049498:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 804949c:	75 15                	jne    80494b3 <send_msg+0xe5>
 804949e:	8d 45 a0             	lea    -0x60(%ebp),%eax
 80494a1:	c7 00 6e 6f 62 6f    	movl   $0x6f626f6e,(%eax)
 80494a7:	66 c7 40 04 64 79    	movw   $0x7964,0x4(%eax)
 80494ad:	c6 40 06 00          	movb   $0x0,0x6(%eax)
 80494b1:	eb 12                	jmp    80494c5 <send_msg+0xf7>
 80494b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80494b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80494ba:	8d 45 a0             	lea    -0x60(%ebp),%eax
 80494bd:	89 04 24             	mov    %eax,(%esp)
 80494c0:	e8 53 f4 ff ff       	call   8048918 <strcpy@plt>
 80494c5:	a1 4c a8 04 08       	mov    0x804a84c,%eax
 80494ca:	89 45 98             	mov    %eax,-0x68(%ebp)
 80494cd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80494d1:	74 09                	je     80494dc <send_msg+0x10e>
 80494d3:	c7 45 9c 61 9d 04 08 	movl   $0x8049d61,-0x64(%ebp)
 80494da:	eb 07                	jmp    80494e3 <send_msg+0x115>
 80494dc:	c7 45 9c 69 9d 04 08 	movl   $0x8049d69,-0x64(%ebp)
 80494e3:	a1 a0 a1 04 08       	mov    0x804a1a0,%eax
 80494e8:	8b 55 98             	mov    -0x68(%ebp),%edx
 80494eb:	89 54 24 18          	mov    %edx,0x18(%esp)
 80494ef:	8b 55 9c             	mov    -0x64(%ebp),%edx
 80494f2:	89 54 24 14          	mov    %edx,0x14(%esp)
 80494f6:	8d 55 a0             	lea    -0x60(%ebp),%edx
 80494f9:	89 54 24 10          	mov    %edx,0x10(%esp)
 80494fd:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049501:	c7 44 24 08 c0 a1 04 	movl   $0x804a1c0,0x8(%esp)
 8049508:	08 
 8049509:	c7 44 24 04 72 9d 04 	movl   $0x8049d72,0x4(%esp)
 8049510:	08 
 8049511:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049514:	89 04 24             	mov    %eax,(%esp)
 8049517:	e8 2c f2 ff ff       	call   8048748 <fprintf@plt>
 804951c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049523:	eb 4d                	jmp    8049572 <send_msg+0x1a4>
 8049525:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049528:	89 d0                	mov    %edx,%eax
 804952a:	c1 e0 02             	shl    $0x2,%eax
 804952d:	01 d0                	add    %edx,%eax
 804952f:	c1 e0 04             	shl    $0x4,%eax
 8049532:	05 60 a8 04 08       	add    $0x804a860,%eax
 8049537:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804953a:	42                   	inc    %edx
 804953b:	8b 0d a0 a1 04 08    	mov    0x804a1a0,%ecx
 8049541:	89 44 24 18          	mov    %eax,0x18(%esp)
 8049545:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049549:	8d 45 a0             	lea    -0x60(%ebp),%eax
 804954c:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049550:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8049554:	c7 44 24 08 c0 a1 04 	movl   $0x804a1c0,0x8(%esp)
 804955b:	08 
 804955c:	c7 44 24 04 8e 9d 04 	movl   $0x8049d8e,0x4(%esp)
 8049563:	08 
 8049564:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049567:	89 04 24             	mov    %eax,(%esp)
 804956a:	e8 d9 f1 ff ff       	call   8048748 <fprintf@plt>
 804956f:	ff 45 f4             	incl   -0xc(%ebp)
 8049572:	a1 4c a8 04 08       	mov    0x804a84c,%eax
 8049577:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 804957a:	7c a9                	jl     8049525 <send_msg+0x157>
 804957c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804957f:	89 04 24             	mov    %eax,(%esp)
 8049582:	e8 21 f2 ff ff       	call   80487a8 <rewind@plt>
 8049587:	c7 44 24 10 f5 99 04 	movl   $0x80499f5,0x10(%esp)
 804958e:	08 
 804958f:	c7 44 24 0c aa 9d 04 	movl   $0x8049daa,0xc(%esp)
 8049596:	08 
 8049597:	c7 44 24 08 af 9d 04 	movl   $0x8049daf,0x8(%esp)
 804959e:	08 
 804959f:	c7 44 24 04 c6 9d 04 	movl   $0x8049dc6,0x4(%esp)
 80495a6:	08 
 80495a7:	c7 04 24 a0 ae 04 08 	movl   $0x804aea0,(%esp)
 80495ae:	e8 05 f3 ff ff       	call   80488b8 <sprintf@plt>
 80495b3:	c7 04 24 a0 ae 04 08 	movl   $0x804aea0,(%esp)
 80495ba:	e8 f9 f1 ff ff       	call   80487b8 <system@plt>
 80495bf:	85 c0                	test   %eax,%eax
 80495c1:	74 18                	je     80495db <send_msg+0x20d>
 80495c3:	c7 04 24 cf 9d 04 08 	movl   $0x8049dcf,(%esp)
 80495ca:	e8 f9 f1 ff ff       	call   80487c8 <puts@plt>
 80495cf:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80495d6:	e8 6d f2 ff ff       	call   8048848 <exit@plt>
 80495db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80495de:	89 04 24             	mov    %eax,(%esp)
 80495e1:	e8 42 f2 ff ff       	call   8048828 <fclose@plt>
 80495e6:	85 c0                	test   %eax,%eax
 80495e8:	74 18                	je     8049602 <send_msg+0x234>
 80495ea:	c7 04 24 e9 9d 04 08 	movl   $0x8049de9,(%esp)
 80495f1:	e8 d2 f1 ff ff       	call   80487c8 <puts@plt>
 80495f6:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80495fd:	e8 46 f2 ff ff       	call   8048848 <exit@plt>
 8049602:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049605:	89 04 24             	mov    %eax,(%esp)
 8049608:	e8 9b f2 ff ff       	call   80488a8 <dup@plt>
 804960d:	85 c0                	test   %eax,%eax
 804960f:	74 18                	je     8049629 <send_msg+0x25b>
 8049611:	c7 04 24 02 9e 04 08 	movl   $0x8049e02,(%esp)
 8049618:	e8 ab f1 ff ff       	call   80487c8 <puts@plt>
 804961d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049624:	e8 1f f2 ff ff       	call   8048848 <exit@plt>
 8049629:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804962c:	89 04 24             	mov    %eax,(%esp)
 804962f:	e8 04 f1 ff ff       	call   8048738 <close@plt>
 8049634:	85 c0                	test   %eax,%eax
 8049636:	74 18                	je     8049650 <send_msg+0x282>
 8049638:	c7 04 24 1d 9e 04 08 	movl   $0x8049e1d,(%esp)
 804963f:	e8 84 f1 ff ff       	call   80487c8 <puts@plt>
 8049644:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 804964b:	e8 f8 f1 ff ff       	call   8048848 <exit@plt>
 8049650:	c9                   	leave  
 8049651:	c3                   	ret    

08049652 <explode_bomb>:
 8049652:	55                   	push   %ebp
 8049653:	89 e5                	mov    %esp,%ebp
 8049655:	83 ec 08             	sub    $0x8,%esp
 8049658:	c7 04 24 34 9e 04 08 	movl   $0x8049e34,(%esp)
 804965f:	e8 64 f1 ff ff       	call   80487c8 <puts@plt>
 8049664:	c7 04 24 3d 9e 04 08 	movl   $0x8049e3d,(%esp)
 804966b:	e8 58 f1 ff ff       	call   80487c8 <puts@plt>
 8049670:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049677:	e8 cc f1 ff ff       	call   8048848 <exit@plt>

0804967c <phase_defused>:
 804967c:	55                   	push   %ebp
 804967d:	89 e5                	mov    %esp,%ebp
 804967f:	83 ec 78             	sub    $0x78,%esp
 8049682:	a1 4c a8 04 08       	mov    0x804a84c,%eax
 8049687:	83 f8 06             	cmp    $0x6,%eax
 804968a:	75 6e                	jne    80496fa <phase_defused+0x7e>
 804968c:	b8 50 a9 04 08       	mov    $0x804a950,%eax
 8049691:	89 c2                	mov    %eax,%edx
 8049693:	8d 45 ac             	lea    -0x54(%ebp),%eax
 8049696:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804969a:	8d 45 a8             	lea    -0x58(%ebp),%eax
 804969d:	89 44 24 08          	mov    %eax,0x8(%esp)
 80496a1:	c7 44 24 04 54 9e 04 	movl   $0x8049e54,0x4(%esp)
 80496a8:	08 
 80496a9:	89 14 24             	mov    %edx,(%esp)
 80496ac:	e8 b7 f1 ff ff       	call   8048868 <sscanf@plt>
 80496b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80496b4:	83 7d fc 02          	cmpl   $0x2,-0x4(%ebp)
 80496b8:	75 34                	jne    80496ee <phase_defused+0x72>
 80496ba:	c7 44 24 04 5a 9e 04 	movl   $0x8049e5a,0x4(%esp)
 80496c1:	08 
 80496c2:	8d 45 ac             	lea    -0x54(%ebp),%eax
 80496c5:	89 04 24             	mov    %eax,(%esp)
 80496c8:	e8 be f9 ff ff       	call   804908b <strings_not_equal>
 80496cd:	85 c0                	test   %eax,%eax
 80496cf:	75 1d                	jne    80496ee <phase_defused+0x72>
 80496d1:	c7 04 24 68 9e 04 08 	movl   $0x8049e68,(%esp)
 80496d8:	e8 eb f0 ff ff       	call   80487c8 <puts@plt>
 80496dd:	c7 04 24 90 9e 04 08 	movl   $0x8049e90,(%esp)
 80496e4:	e8 df f0 ff ff       	call   80487c8 <puts@plt>
 80496e9:	e8 23 f8 ff ff       	call   8048f11 <secret_phase>
 80496ee:	c7 04 24 c8 9e 04 08 	movl   $0x8049ec8,(%esp)
 80496f5:	e8 ce f0 ff ff       	call   80487c8 <puts@plt>
 80496fa:	c9                   	leave  
 80496fb:	c3                   	ret    
 80496fc:	90                   	nop
 80496fd:	90                   	nop
 80496fe:	90                   	nop
 80496ff:	90                   	nop

08049700 <__libc_csu_fini>:
 8049700:	55                   	push   %ebp
 8049701:	89 e5                	mov    %esp,%ebp
 8049703:	57                   	push   %edi
 8049704:	56                   	push   %esi
 8049705:	53                   	push   %ebx
 8049706:	e8 98 00 00 00       	call   80497a3 <__i686.get_pc_thunk.bx>
 804970b:	81 c3 d5 09 00 00    	add    $0x9d5,%ebx
 8049711:	83 ec 0c             	sub    $0xc,%esp
 8049714:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 804971a:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 8049720:	29 f8                	sub    %edi,%eax
 8049722:	c1 f8 02             	sar    $0x2,%eax
 8049725:	8d 70 ff             	lea    -0x1(%eax),%esi
 8049728:	83 fe ff             	cmp    $0xffffffff,%esi
 804972b:	74 0c                	je     8049739 <__libc_csu_fini+0x39>
 804972d:	8d 76 00             	lea    0x0(%esi),%esi
 8049730:	ff 14 b7             	call   *(%edi,%esi,4)
 8049733:	4e                   	dec    %esi
 8049734:	83 fe ff             	cmp    $0xffffffff,%esi
 8049737:	75 f7                	jne    8049730 <__libc_csu_fini+0x30>
 8049739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049740:	e8 9f 00 00 00       	call   80497e4 <_fini>
 8049745:	83 c4 0c             	add    $0xc,%esp
 8049748:	5b                   	pop    %ebx
 8049749:	5e                   	pop    %esi
 804974a:	5f                   	pop    %edi
 804974b:	5d                   	pop    %ebp
 804974c:	c3                   	ret    
 804974d:	8d 76 00             	lea    0x0(%esi),%esi

08049750 <__libc_csu_init>:
 8049750:	55                   	push   %ebp
 8049751:	89 e5                	mov    %esp,%ebp
 8049753:	57                   	push   %edi
 8049754:	56                   	push   %esi
 8049755:	53                   	push   %ebx
 8049756:	e8 48 00 00 00       	call   80497a3 <__i686.get_pc_thunk.bx>
 804975b:	81 c3 85 09 00 00    	add    $0x985,%ebx
 8049761:	83 ec 0c             	sub    $0xc,%esp
 8049764:	e8 a7 ef ff ff       	call   8048710 <_init>
 8049769:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 804976f:	8d 93 20 ff ff ff    	lea    -0xe0(%ebx),%edx
 8049775:	29 d0                	sub    %edx,%eax
 8049777:	c1 f8 02             	sar    $0x2,%eax
 804977a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804977d:	74 1c                	je     804979b <__libc_csu_init+0x4b>
 804977f:	31 ff                	xor    %edi,%edi
 8049781:	89 d6                	mov    %edx,%esi
 8049783:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8049790:	47                   	inc    %edi
 8049791:	ff 16                	call   *(%esi)
 8049793:	83 c6 04             	add    $0x4,%esi
 8049796:	39 7d f0             	cmp    %edi,-0x10(%ebp)
 8049799:	75 f5                	jne    8049790 <__libc_csu_init+0x40>
 804979b:	83 c4 0c             	add    $0xc,%esp
 804979e:	5b                   	pop    %ebx
 804979f:	5e                   	pop    %esi
 80497a0:	5f                   	pop    %edi
 80497a1:	5d                   	pop    %ebp
 80497a2:	c3                   	ret    

080497a3 <__i686.get_pc_thunk.bx>:
 80497a3:	8b 1c 24             	mov    (%esp),%ebx
 80497a6:	c3                   	ret    
 80497a7:	90                   	nop
 80497a8:	90                   	nop
 80497a9:	90                   	nop
 80497aa:	90                   	nop
 80497ab:	90                   	nop
 80497ac:	90                   	nop
 80497ad:	90                   	nop
 80497ae:	90                   	nop
 80497af:	90                   	nop

080497b0 <__do_global_ctors_aux>:
 80497b0:	55                   	push   %ebp
 80497b1:	89 e5                	mov    %esp,%ebp
 80497b3:	53                   	push   %ebx
 80497b4:	bb 00 a0 04 08       	mov    $0x804a000,%ebx
 80497b9:	83 ec 04             	sub    $0x4,%esp
 80497bc:	a1 00 a0 04 08       	mov    0x804a000,%eax
 80497c1:	83 f8 ff             	cmp    $0xffffffff,%eax
 80497c4:	74 16                	je     80497dc <__do_global_ctors_aux+0x2c>
 80497c6:	8d 76 00             	lea    0x0(%esi),%esi
 80497c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 80497d0:	83 eb 04             	sub    $0x4,%ebx
 80497d3:	ff d0                	call   *%eax
 80497d5:	8b 03                	mov    (%ebx),%eax
 80497d7:	83 f8 ff             	cmp    $0xffffffff,%eax
 80497da:	75 f4                	jne    80497d0 <__do_global_ctors_aux+0x20>
 80497dc:	58                   	pop    %eax
 80497dd:	5b                   	pop    %ebx
 80497de:	5d                   	pop    %ebp
 80497df:	90                   	nop
 80497e0:	c3                   	ret    
 80497e1:	90                   	nop
 80497e2:	90                   	nop
 80497e3:	90                   	nop

Disassembly of section .fini:

080497e4 <_fini>:
 80497e4:	55                   	push   %ebp
 80497e5:	89 e5                	mov    %esp,%ebp
 80497e7:	53                   	push   %ebx
 80497e8:	83 ec 04             	sub    $0x4,%esp
 80497eb:	e8 00 00 00 00       	call   80497f0 <_fini+0xc>
 80497f0:	5b                   	pop    %ebx
 80497f1:	81 c3 f0 08 00 00    	add    $0x8f0,%ebx
 80497f7:	e8 84 f1 ff ff       	call   8048980 <__do_global_dtors_aux>
 80497fc:	59                   	pop    %ecx
 80497fd:	5b                   	pop    %ebx
 80497fe:	c9                   	leave  
 80497ff:	c3                   	ret    
