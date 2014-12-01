	.section	__TEXT,__text,regular,pure_instructions
	.globl	_tstgemv
	.align	4, 0x90
_tstgemv:                               ## @tstgemv
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$68, %esp
	movl	44(%ebp), %eax
	movsd	36(%ebp), %xmm0
	movl	32(%ebp), %ecx
	movl	28(%ebp), %edx
	movl	24(%ebp), %esi
	movsd	16(%ebp), %xmm1
	movl	12(%ebp), %edi
	movl	8(%ebp), %ebx
	movl	%ebx, -16(%ebp)
	movl	%edi, -20(%ebp)
	movsd	%xmm1, -32(%ebp)
	movl	%esi, -36(%ebp)
	movl	%edx, -40(%ebp)
	movl	%ecx, -44(%ebp)
	movsd	%xmm0, -56(%ebp)
	movl	%eax, -60(%ebp)
	movl	$0, -64(%ebp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	movl	-64(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	LBB0_8
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -80(%ebp)
	movl	$0, -68(%ebp)
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-68(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jge	LBB0_6
## BB#4:                                ##   in Loop: Header=BB0_3 Depth=2
	movl	-68(%ebp), %eax
	movl	-36(%ebp), %ecx
	movsd	(%ecx,%eax,8), %xmm0
	movl	-68(%ebp), %eax
	movl	-44(%ebp), %ecx
	mulsd	(%ecx,%eax,8), %xmm0
	movsd	-80(%ebp), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, -80(%ebp)
## BB#5:                                ##   in Loop: Header=BB0_3 Depth=2
	movl	-68(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -68(%ebp)
	jmp	LBB0_3
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	movsd	-32(%ebp), %xmm0
	mulsd	-80(%ebp), %xmm0
	movsd	-56(%ebp), %xmm1
	movl	-64(%ebp), %eax
	movl	-60(%ebp), %ecx
	mulsd	(%ecx,%eax,8), %xmm1
	addsd	%xmm1, %xmm0
	movl	-64(%ebp), %eax
	movl	-60(%ebp), %ecx
	movsd	%xmm0, (%ecx,%eax,8)
## BB#7:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-64(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -64(%ebp)
	movl	-40(%ebp), %eax
	movl	-36(%ebp), %ecx
	shll	$3, %eax
	addl	%eax, %ecx
	movl	%ecx, -36(%ebp)
	jmp	LBB0_1
LBB0_8:
	addl	$68, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret

	.globl	_PrintUsage
	.align	4, 0x90
_PrintUsage:                            ## @PrintUsage
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$80, %esp
	calll	L1$pb
L1$pb:
	popl	%eax
	movl	16(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	L___stderrp$non_lazy_ptr-L1$pb(%eax), %edi
	movl	%esi, -12(%ebp)
	movl	%edx, -16(%ebp)
	movl	%ecx, -20(%ebp)
	movl	(%edi), %ecx
	movl	-16(%ebp), %edx
	cmpl	$0, -20(%ebp)
	movl	%eax, -24(%ebp)         ## 4-byte Spill
	movl	%ecx, -28(%ebp)         ## 4-byte Spill
	movl	%edx, -32(%ebp)         ## 4-byte Spill
	je	LBB1_2
## BB#1:
	movl	-20(%ebp), %eax
	movl	%eax, -36(%ebp)         ## 4-byte Spill
	jmp	LBB1_3
LBB1_2:
	movl	-24(%ebp), %eax         ## 4-byte Reload
	leal	L_.str1-L1$pb(%eax), %ecx
	movl	%ecx, -36(%ebp)         ## 4-byte Spill
	jmp	LBB1_3
LBB1_3:
	movl	-36(%ebp), %eax         ## 4-byte Reload
	movl	-24(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str-L1$pb(%ecx), %edx
	movl	-28(%ebp), %esi         ## 4-byte Reload
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	-32(%ebp), %edx         ## 4-byte Reload
	movl	%edx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_fprintf
	movl	-24(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str2-L1$pb(%ecx), %edx
	movl	L___stderrp$non_lazy_ptr-L1$pb(%ecx), %esi
	movl	(%esi), %esi
	movl	-12(%ebp), %edi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, -40(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	-24(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str3-L1$pb(%ecx), %edx
	movl	L___stderrp$non_lazy_ptr-L1$pb(%ecx), %esi
	movl	(%esi), %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%eax, -44(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	-24(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str4-L1$pb(%ecx), %edx
	movl	L___stderrp$non_lazy_ptr-L1$pb(%ecx), %esi
	movl	(%esi), %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%eax, -48(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	-24(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str5-L1$pb(%ecx), %edx
	movl	L___stderrp$non_lazy_ptr-L1$pb(%ecx), %esi
	movl	(%esi), %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%eax, -52(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	-24(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str6-L1$pb(%ecx), %edx
	movl	L___stderrp$non_lazy_ptr-L1$pb(%ecx), %esi
	movl	(%esi), %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%eax, -56(%ebp)         ## 4-byte Spill
	calll	_fprintf
	movl	-24(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str7-L1$pb(%ecx), %edx
	movl	L___stderrp$non_lazy_ptr-L1$pb(%ecx), %esi
	movl	(%esi), %esi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%eax, -60(%ebp)         ## 4-byte Spill
	calll	_fprintf
	cmpl	$0, -16(%ebp)
	movl	%eax, -64(%ebp)         ## 4-byte Spill
	je	LBB1_5
## BB#4:
	movl	-16(%ebp), %eax
	movl	%eax, -68(%ebp)         ## 4-byte Spill
	jmp	LBB1_6
LBB1_5:
	movl	$4294967295, %eax       ## imm = 0xFFFFFFFF
	movl	%eax, -68(%ebp)         ## 4-byte Spill
	jmp	LBB1_6
LBB1_6:
	movl	-68(%ebp), %eax         ## 4-byte Reload
	movl	%eax, (%esp)
	calll	_exit

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI2_0:
	.long	2576980378              ## double 1.1000000000000001
	.long	1072798105
LCPI2_1:
	.long	0                       ## double 0.25
	.long	1070596096
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_GetFlags
	.align	4, 0x90
_GetFlags:                              ## @GetFlags
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$108, %esp
	calll	L2$pb
L2$pb:
	popl	%eax
	movl	32(%ebp), %ecx
	movl	28(%ebp), %edx
	movl	24(%ebp), %esi
	movl	20(%ebp), %edi
	movl	16(%ebp), %ebx
	movl	%eax, -68(%ebp)         ## 4-byte Spill
	movl	12(%ebp), %eax
	movl	%eax, -72(%ebp)         ## 4-byte Spill
	movl	8(%ebp), %eax
	movl	%eax, -76(%ebp)         ## 4-byte Spill
	movl	-68(%ebp), %eax         ## 4-byte Reload
	movsd	LCPI2_0-L2$pb(%eax), %xmm0
	movsd	LCPI2_1-L2$pb(%eax), %xmm1
	movl	-76(%ebp), %eax         ## 4-byte Reload
	movl	%eax, -16(%ebp)
	movl	-72(%ebp), %eax         ## 4-byte Reload
	movl	%eax, -20(%ebp)
	movl	%ebx, -24(%ebp)
	movl	%edi, -28(%ebp)
	movl	%esi, -32(%ebp)
	movl	%edx, -36(%ebp)
	movl	%ecx, -40(%ebp)
	movl	-24(%ebp), %ecx
	movl	$211, (%ecx)
	movl	-28(%ebp), %ecx
	movl	$117, (%ecx)
	movl	-32(%ebp), %ecx
	movl	$0, (%ecx)
	movl	-36(%ebp), %ecx
	movsd	%xmm1, (%ecx)
	movl	-40(%ebp), %ecx
	movsd	%xmm0, (%ecx)
	movl	$1, -44(%ebp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-44(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	LBB2_23
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	(%ecx,%eax,4), %eax
	movsbl	(%eax), %eax
	cmpl	$45, %eax
	je	LBB2_4
## BB#3:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	movl	-44(%ebp), %ecx
	movl	-44(%ebp), %edx
	movl	-20(%ebp), %esi
	movl	(%esi,%edx,4), %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	_PrintUsage
LBB2_4:                                 ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	(%ecx,%eax,4), %eax
	movsbl	1(%eax), %eax
	movl	%eax, %ecx
	subl	$107, %ecx
	movl	%eax, -80(%ebp)         ## 4-byte Spill
	movl	%ecx, -84(%ebp)         ## 4-byte Spill
	jg	LBB2_27
	jmp	LBB2_26
LBB2_26:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-80(%ebp), %eax         ## 4-byte Reload
	subl	$97, %eax
	movl	%eax, -88(%ebp)         ## 4-byte Spill
	je	LBB2_14
	jmp	LBB2_30
LBB2_30:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-80(%ebp), %eax         ## 4-byte Reload
	subl	$98, %eax
	movl	%eax, -92(%ebp)         ## 4-byte Spill
	je	LBB2_17
	jmp	LBB2_20
LBB2_27:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-80(%ebp), %eax         ## 4-byte Reload
	subl	$108, %eax
	movl	%eax, -96(%ebp)         ## 4-byte Spill
	je	LBB2_11
	jmp	LBB2_28
LBB2_28:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-80(%ebp), %eax         ## 4-byte Reload
	subl	$110, %eax
	movl	%eax, -100(%ebp)        ## 4-byte Spill
	je	LBB2_8
	jmp	LBB2_29
LBB2_29:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-80(%ebp), %eax         ## 4-byte Reload
	subl	$109, %eax
	movl	%eax, -104(%ebp)        ## 4-byte Spill
	jne	LBB2_20
	jmp	LBB2_5
LBB2_5:                                 ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -44(%ebp)
	cmpl	-16(%ebp), %eax
	jl	LBB2_7
## BB#6:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-68(%ebp), %eax         ## 4-byte Reload
	leal	L_.str8-L2$pb(%eax), %ecx
	movl	-20(%ebp), %edx
	movl	(%edx), %edx
	movl	-44(%ebp), %esi
	movl	%edx, (%esp)
	movl	%esi, 4(%esp)
	movl	%ecx, 8(%esp)
	calll	_PrintUsage
LBB2_7:                                 ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	(%ecx,%eax,4), %eax
	movl	%eax, (%esp)
	calll	_atoi
	movl	-24(%ebp), %ecx
	movl	%eax, (%ecx)
	jmp	LBB2_21
LBB2_8:                                 ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -44(%ebp)
	cmpl	-16(%ebp), %eax
	jl	LBB2_10
## BB#9:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-68(%ebp), %eax         ## 4-byte Reload
	leal	L_.str8-L2$pb(%eax), %ecx
	movl	-20(%ebp), %edx
	movl	(%edx), %edx
	movl	-44(%ebp), %esi
	movl	%edx, (%esp)
	movl	%esi, 4(%esp)
	movl	%ecx, 8(%esp)
	calll	_PrintUsage
LBB2_10:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	(%ecx,%eax,4), %eax
	movl	%eax, (%esp)
	calll	_atoi
	movl	-28(%ebp), %ecx
	movl	%eax, (%ecx)
	jmp	LBB2_21
LBB2_11:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -44(%ebp)
	cmpl	-16(%ebp), %eax
	jl	LBB2_13
## BB#12:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	-68(%ebp), %eax         ## 4-byte Reload
	leal	L_.str8-L2$pb(%eax), %ecx
	movl	-20(%ebp), %edx
	movl	(%edx), %edx
	movl	-44(%ebp), %esi
	movl	%edx, (%esp)
	movl	%esi, 4(%esp)
	movl	%ecx, 8(%esp)
	calll	_PrintUsage
LBB2_13:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	(%ecx,%eax,4), %eax
	movl	%eax, (%esp)
	calll	_atoi
	movl	-32(%ebp), %ecx
	movl	%eax, (%ecx)
	jmp	LBB2_21
LBB2_14:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -44(%ebp)
	cmpl	-16(%ebp), %eax
	jl	LBB2_16
## BB#15:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	-68(%ebp), %eax         ## 4-byte Reload
	leal	L_.str8-L2$pb(%eax), %ecx
	movl	-20(%ebp), %edx
	movl	(%edx), %edx
	movl	-44(%ebp), %esi
	movl	%edx, (%esp)
	movl	%esi, 4(%esp)
	movl	%ecx, 8(%esp)
	calll	_PrintUsage
LBB2_16:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	(%ecx,%eax,4), %eax
	movl	%eax, (%esp)
	calll	_atof
	fstpl	-64(%ebp)
	movsd	-64(%ebp), %xmm0
	movl	-36(%ebp), %eax
	movsd	%xmm0, (%eax)
	jmp	LBB2_21
LBB2_17:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -44(%ebp)
	cmpl	-16(%ebp), %eax
	jl	LBB2_19
## BB#18:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	-68(%ebp), %eax         ## 4-byte Reload
	leal	L_.str8-L2$pb(%eax), %ecx
	movl	-20(%ebp), %edx
	movl	(%edx), %edx
	movl	-44(%ebp), %esi
	movl	%edx, (%esp)
	movl	%esi, 4(%esp)
	movl	%ecx, 8(%esp)
	calll	_PrintUsage
LBB2_19:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	(%ecx,%eax,4), %eax
	movl	%eax, (%esp)
	calll	_atof
	fstpl	-56(%ebp)
	movsd	-56(%ebp), %xmm0
	movl	-40(%ebp), %eax
	movsd	%xmm0, (%eax)
	jmp	LBB2_21
LBB2_20:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	movl	-44(%ebp), %ecx
	movl	-44(%ebp), %edx
	movl	-20(%ebp), %esi
	movl	(%esi,%edx,4), %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	_PrintUsage
LBB2_21:                                ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_22
LBB2_22:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-44(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -44(%ebp)
	jmp	LBB2_1
LBB2_23:
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	movl	-28(%ebp), %ecx
	cmpl	(%ecx), %eax
	jge	LBB2_25
## BB#24:
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	addl	$8, %eax
	movl	-32(%ebp), %ecx
	movl	%eax, (%ecx)
LBB2_25:
	addl	$108, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI3_0:
	.long	2547550652              ## double 9.9999999999999997E-17
	.long	1016910514
LCPI3_2:
	.long	0                       ## double 0.5
	.long	1071644672
LCPI3_3:
	.long	0                       ## double 2147483648
	.long	1105199104
	.section	__TEXT,__literal16,16byte_literals
	.align	4
LCPI3_1:
	.long	4294967295              ## double nan
	.long	2147483647
	.long	4294967295              ## double nan
	.long	2147483647
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$156, %esp
	calll	L3$pb
L3$pb:
	popl	%eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	leal	-32(%ebp), %esi
	leal	-28(%ebp), %edi
	leal	-36(%ebp), %ebx
	movl	%eax, -100(%ebp)        ## 4-byte Spill
	leal	-56(%ebp), %eax
	movl	%eax, -104(%ebp)        ## 4-byte Spill
	leal	-64(%ebp), %eax
	movl	$0, -16(%ebp)
	movl	%edx, -20(%ebp)
	movl	%ecx, -24(%ebp)
	movl	$0, -48(%ebp)
	movl	-20(%ebp), %ecx
	movl	-24(%ebp), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%ebx, 16(%esp)
	movl	-104(%ebp), %ecx        ## 4-byte Reload
	movl	%ecx, 20(%esp)
	movl	%eax, 24(%esp)
	calll	_GetFlags
	movl	-32(%ebp), %eax
	imull	-36(%ebp), %eax
	addl	-32(%ebp), %eax
	addl	-32(%ebp), %eax
	addl	-28(%ebp), %eax
	shll	$3, %eax
	movl	%eax, (%esp)
	calll	_malloc
	movl	%eax, -68(%ebp)
	cmpl	$0, -68(%ebp)
	setne	%al
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	cmpl	$0, %ecx
	je	LBB3_2
## BB#1:
	movl	-100(%ebp), %eax        ## 4-byte Reload
	leal	L___func__.main-L3$pb(%eax), %ecx
	leal	L_.str9-L3$pb(%eax), %edx
	movl	$116, %esi
	leal	L_.str10-L3$pb(%eax), %edi
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	$116, 8(%esp)
	movl	%edi, 12(%esp)
	movl	%esi, -108(%ebp)        ## 4-byte Spill
	calll	___assert_rtn
LBB3_2:
	jmp	LBB3_3
LBB3_3:
	movl	-68(%ebp), %eax
	movl	-32(%ebp), %ecx
	shll	$3, %ecx
	addl	%ecx, %eax
	movl	%eax, -72(%ebp)
	movl	-72(%ebp), %eax
	movl	-32(%ebp), %ecx
	shll	$3, %ecx
	addl	%ecx, %eax
	movl	%eax, -76(%ebp)
	movl	-76(%ebp), %eax
	movl	-28(%ebp), %ecx
	shll	$3, %ecx
	addl	%ecx, %eax
	movl	%eax, -80(%ebp)
	movl	%eax, -84(%ebp)
	movl	-32(%ebp), %eax
	imull	-36(%ebp), %eax
	addl	-28(%ebp), %eax
	movl	%eax, (%esp)
	calll	_srand
	movl	$0, -40(%ebp)
LBB3_4:                                 ## =>This Inner Loop Header: Depth=1
	movl	-40(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jge	LBB3_7
## BB#5:                                ##   in Loop: Header=BB3_4 Depth=1
	calll	_rand
	movl	-100(%ebp), %ecx        ## 4-byte Reload
	movsd	LCPI3_2-L3$pb(%ecx), %xmm0
	movsd	LCPI3_3-L3$pb(%ecx), %xmm1
	cvtsi2sdl	%eax, %xmm2
	divsd	%xmm1, %xmm2
	subsd	%xmm2, %xmm0
	movl	-40(%ebp), %eax
	movl	-68(%ebp), %edx
	movsd	%xmm0, (%edx,%eax,8)
	movl	-40(%ebp), %eax
	movl	-72(%ebp), %edx
	movsd	%xmm0, (%edx,%eax,8)
## BB#6:                                ##   in Loop: Header=BB3_4 Depth=1
	movl	-40(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -40(%ebp)
	jmp	LBB3_4
LBB3_7:
	movl	$0, -40(%ebp)
LBB3_8:                                 ## =>This Inner Loop Header: Depth=1
	movl	-40(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jge	LBB3_11
## BB#9:                                ##   in Loop: Header=BB3_8 Depth=1
	calll	_rand
	movl	-100(%ebp), %ecx        ## 4-byte Reload
	movsd	LCPI3_2-L3$pb(%ecx), %xmm0
	movsd	LCPI3_3-L3$pb(%ecx), %xmm1
	cvtsi2sdl	%eax, %xmm2
	divsd	%xmm1, %xmm2
	subsd	%xmm2, %xmm0
	movl	-40(%ebp), %eax
	movl	-76(%ebp), %edx
	movsd	%xmm0, (%edx,%eax,8)
## BB#10:                               ##   in Loop: Header=BB3_8 Depth=1
	movl	-40(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -40(%ebp)
	jmp	LBB3_8
LBB3_11:
	movl	$0, -40(%ebp)
LBB3_12:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_14 Depth 2
	movl	-40(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jge	LBB3_19
## BB#13:                               ##   in Loop: Header=BB3_12 Depth=1
	movl	$0, -44(%ebp)
LBB3_14:                                ##   Parent Loop BB3_12 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-44(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jge	LBB3_17
## BB#15:                               ##   in Loop: Header=BB3_14 Depth=2
	calll	_rand
	movl	-100(%ebp), %ecx        ## 4-byte Reload
	movsd	LCPI3_2-L3$pb(%ecx), %xmm0
	movsd	LCPI3_3-L3$pb(%ecx), %xmm1
	cvtsi2sdl	%eax, %xmm2
	divsd	%xmm1, %xmm2
	subsd	%xmm2, %xmm0
	movl	-44(%ebp), %eax
	movl	-84(%ebp), %edx
	movsd	%xmm0, (%edx,%eax,8)
## BB#16:                               ##   in Loop: Header=BB3_14 Depth=2
	movl	-44(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -44(%ebp)
	jmp	LBB3_14
LBB3_17:                                ##   in Loop: Header=BB3_12 Depth=1
	jmp	LBB3_18
LBB3_18:                                ##   in Loop: Header=BB3_12 Depth=1
	movl	-40(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -40(%ebp)
	movl	-36(%ebp), %eax
	movl	-84(%ebp), %ecx
	shll	$3, %eax
	addl	%eax, %ecx
	movl	%ecx, -84(%ebp)
	jmp	LBB3_12
LBB3_19:
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %ecx
	movsd	-56(%ebp), %xmm0
	movl	-80(%ebp), %edx
	movl	-36(%ebp), %esi
	movl	-76(%ebp), %edi
	movsd	-64(%ebp), %xmm1
	movl	-68(%ebp), %ebx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movsd	%xmm0, 8(%esp)
	movl	%edx, 16(%esp)
	movl	%esi, 20(%esp)
	movl	%edi, 24(%esp)
	movsd	%xmm1, 28(%esp)
	movl	%ebx, 36(%esp)
	calll	_tstgemv
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %ecx
	movsd	-56(%ebp), %xmm0
	movl	-80(%ebp), %edx
	movl	-36(%ebp), %esi
	movl	-76(%ebp), %edi
	movsd	-64(%ebp), %xmm1
	movl	-72(%ebp), %ebx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movsd	%xmm0, 8(%esp)
	movl	%edx, 16(%esp)
	movl	%esi, 20(%esp)
	movl	%edi, 24(%esp)
	movsd	%xmm1, 28(%esp)
	movl	%ebx, 36(%esp)
	calll	_dgemv
	movl	$0, -40(%ebp)
LBB3_20:                                ## =>This Inner Loop Header: Depth=1
	movl	-40(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jge	LBB3_25
## BB#21:                               ##   in Loop: Header=BB3_20 Depth=1
	movl	-100(%ebp), %eax        ## 4-byte Reload
	movsd	LCPI3_0-L3$pb(%eax), %xmm0
	movl	$4, %ecx
	cvtsi2sdl	%ecx, %xmm1
	movl	-40(%ebp), %ecx
	movl	-68(%ebp), %edx
	movsd	(%edx,%ecx,8), %xmm2
	movl	-40(%ebp), %ecx
	movl	-72(%ebp), %edx
	subsd	(%edx,%ecx,8), %xmm2
	movsd	LCPI3_1-L3$pb(%eax), %xmm3
	andpd	%xmm3, %xmm2
	movsd	%xmm2, -96(%ebp)
	movsd	-96(%ebp), %xmm2
	cvtsi2sdl	-28(%ebp), %xmm3
	mulsd	%xmm3, %xmm1
	mulsd	%xmm0, %xmm1
	ucomisd	%xmm1, %xmm2
	jb	LBB3_23
## BB#22:                               ##   in Loop: Header=BB3_20 Depth=1
	movl	-100(%ebp), %eax        ## 4-byte Reload
	leal	L_.str11-L3$pb(%eax), %ecx
	movl	-40(%ebp), %edx
	movl	-40(%ebp), %esi
	movl	-68(%ebp), %edi
	movsd	(%edi,%esi,8), %xmm0
	movl	-40(%ebp), %esi
	movl	-72(%ebp), %edi
	movsd	(%edi,%esi,8), %xmm1
	movsd	-96(%ebp), %xmm2
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movsd	%xmm0, 8(%esp)
	movsd	%xmm1, 16(%esp)
	movsd	%xmm2, 24(%esp)
	calll	_printf
	movl	-48(%ebp), %ecx
	addl	$1, %ecx
	movl	%ecx, -48(%ebp)
	movl	%eax, -112(%ebp)        ## 4-byte Spill
LBB3_23:                                ##   in Loop: Header=BB3_20 Depth=1
	jmp	LBB3_24
LBB3_24:                                ##   in Loop: Header=BB3_20 Depth=1
	movl	-40(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -40(%ebp)
	jmp	LBB3_20
LBB3_25:
	movl	-68(%ebp), %eax
	movl	%eax, (%esp)
	calll	_free
	movl	-100(%ebp), %eax        ## 4-byte Reload
	leal	L_.str12-L3$pb(%eax), %ecx
	movl	-32(%ebp), %edx
	movl	-28(%ebp), %esi
	movl	-36(%ebp), %edi
	movsd	-56(%ebp), %xmm0
	movsd	-64(%ebp), %xmm1
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movsd	%xmm0, 16(%esp)
	movsd	%xmm1, 24(%esp)
	calll	_printf
	cmpl	$0, -48(%ebp)
	movl	%eax, -116(%ebp)        ## 4-byte Spill
	jne	LBB3_27
## BB#26:
	movl	-100(%ebp), %eax        ## 4-byte Reload
	leal	L_.str13-L3$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -120(%ebp)        ## 4-byte Spill
	jmp	LBB3_28
LBB3_27:
	movl	-100(%ebp), %eax        ## 4-byte Reload
	leal	L_.str14-L3$pb(%eax), %ecx
	movl	-48(%ebp), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	calll	_printf
	movl	%eax, -124(%ebp)        ## 4-byte Spill
LBB3_28:
	movl	-48(%ebp), %eax
	addl	$156, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"\nERROR around arg %d (%s).\n"

L_.str1:                                ## @.str1
	.asciz	"unknown"

L_.str2:                                ## @.str2
	.asciz	"USAGE: %s [flags], where flags are:\n"

L_.str3:                                ## @.str3
	.asciz	"   -m <#> : set M to #\n"

L_.str4:                                ## @.str4
	.asciz	"   -n <#> : set N to #\n"

L_.str5:                                ## @.str5
	.asciz	"   -l <#> : set lda to #\n"

L_.str6:                                ## @.str6
	.asciz	"   -a <#> : set alpha to #\n"

L_.str7:                                ## @.str7
	.asciz	"   -b <#> : set beta to #\n"

L_.str8:                                ## @.str8
	.asciz	"out of arguments"

L___func__.main:                        ## @__func__.main
	.asciz	"main"

L_.str9:                                ## @.str9
	.asciz	"mvtst.c"

L_.str10:                               ## @.str10
	.asciz	"Y"

L_.str11:                               ## @.str11
	.asciz	"Y[%d], exp=%e, got=%e, diff=%e\n"

L_.str12:                               ## @.str12
	.asciz	"M=%d, N=%d, lda=%d, alpha=%e, beta=%e: "

L_.str13:                               ## @.str13
	.asciz	"PASSED!\n"

L_.str14:                               ## @.str14
	.asciz	"FAILED for %d Y elements!\n"


	.section	__IMPORT,__pointers,non_lazy_symbol_pointers
L___stderrp$non_lazy_ptr:
	.indirect_symbol	___stderrp
	.long	0

.subsections_via_symbols
