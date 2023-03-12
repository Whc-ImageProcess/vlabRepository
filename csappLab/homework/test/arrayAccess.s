	.file	"arrayAccess.c"
	.text
	.globl	cmu
	.data
	.align 16
	.type	cmu, @object
	.size	cmu, 20
cmu:
	.long	1
	.long	5
	.long	2
	.long	1
	.long	3
	.globl	mit
	.align 16
	.type	mit, @object
	.size	mit, 20
mit:
	.long	0
	.long	2
	.long	1
	.long	3
	.long	9
	.globl	ucb
	.align 16
	.type	ucb, @object
	.size	ucb, 20
ucb:
	.long	9
	.long	4
	.long	7
	.long	2
	.long	0
	.globl	pgh
	.align 32
	.type	pgh, @object
	.size	pgh, 80
pgh:
	.long	1
	.long	5
	.long	2
	.long	0
	.long	6
	.long	1
	.long	5
	.long	2
	.long	1
	.long	3
	.long	1
	.long	5
	.long	2
	.long	1
	.long	7
	.long	1
	.long	5
	.long	2
	.long	2
	.long	1
	.text
	.globl	get_pgh_digit
	.type	get_pgh_digit, @function
get_pgh_digit:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %eax
	movslq	%eax, %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	pgh(%rip), %rax
	movl	(%rdx,%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	get_pgh_digit, .-get_pgh_digit
	.globl	univ
	.section	.data.rel.local,"aw"
	.align 16
	.type	univ, @object
	.size	univ, 24
univ:
	.quad	mit
	.quad	cmu
	.quad	ucb
	.text
	.globl	get_univ_digit
	.type	get_univ_digit, @function
get_univ_digit:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	univ(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	get_univ_digit, .-get_univ_digit
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
