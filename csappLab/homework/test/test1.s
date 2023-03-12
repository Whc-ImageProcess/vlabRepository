	.file	"test1.c"
	.text
	.section	.rodata
.LC0:
	.string	"x = %d\n -x = %d\n"
.LC1:
	.string	"ux = %u\n"
.LC4:
	.string	"test1.c"
.LC5:
	.string	"(f + d) - f == d"
	.text
	.globl	test
	.type	test, @function
test:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$-2147483647, -20(%rbp)
	movl	-20(%rbp), %eax
	negl	%eax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -12(%rbp)
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	cvtss2sd	-12(%rbp), %xmm0
	addsd	-8(%rbp), %xmm0
	cvtss2sd	-12(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	ucomisd	-8(%rbp), %xmm0
	jp	.L4
	ucomisd	-8(%rbp), %xmm0
	je	.L5
.L4:
	leaq	__PRETTY_FUNCTION__.2331(%rip), %rcx
	movl	$15, %edx
	leaq	.LC4(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	__assert_fail@PLT
.L5:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	test, .-test
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	test
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.2331, @object
	.size	__PRETTY_FUNCTION__.2331, 5
__PRETTY_FUNCTION__.2331:
	.string	"test"
	.align 4
.LC2:
	.long	1621981420
	.align 8
.LC3:
	.long	0
	.long	1072693248
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
