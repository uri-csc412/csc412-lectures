	.arch armv8-a
	.file	"mutex.c"
	.text
.Ltext0:
	.file 0 "/home/csc412-user/lectures/threads_3atomic" "mutex.c"
	.align	2
	.global	critical
	.type	critical, %function
critical:
.LFB0:
	.file 1 "mutex.c"
	.loc 1 11 33
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	.loc 1 12 16
	ldr	x0, [sp, 24]
	bl	strlen
	str	x0, [sp, 40]
.LBB2:
	.loc 1 13 15
	str	xzr, [sp, 32]
	.loc 1 13 3
	b	.L2
.L3:
	.loc 1 14 21 discriminator 3
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 32]
	add	x0, x1, x0
	ldrb	w0, [x0]
	.loc 1 14 5 discriminator 3
	bl	putchar
	.loc 1 13 31 discriminator 3
	ldr	x0, [sp, 32]
	add	x0, x0, 1
	str	x0, [sp, 32]
.L2:
	.loc 1 13 24 discriminator 1
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 40]
	cmp	x1, x0
	bcc	.L3
.LBE2:
	.loc 1 16 3
	mov	w0, 10
	bl	putchar
	.loc 1 17 1
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	critical, .-critical
	.global	mut
	.bss
	.align	3
	.type	mut, %object
	.size	mut, 1
mut:
	.zero	1
	.global	__aarch64_swp1_acq_rel
	.text
	.align	2
	.global	pingpong
	.type	pingpong, %function
pingpong:
.LFB1:
	.loc 1 27 27
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	.loc 1 28 12
	ldr	x0, [sp, 24]
	str	x0, [sp, 40]
	.loc 1 30 9
	nop
.L5:
	.loc 1 30 9 is_stmt 0 discriminator 1
	adrp	x0, mut
	add	x1, x0, :lo12:mut
	mov	w0, 1
	bl	__aarch64_swp1_acq_rel
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L5
	.loc 1 31 9 is_stmt 1
	ldr	x0, [sp, 40]
	bl	critical
	.loc 1 32 9
	adrp	x0, mut
	add	x0, x0, :lo12:mut
	stlrb	wzr, [x0]
	.loc 1 30 9
	b	.L5
	.cfi_endproc
.LFE1:
	.size	pingpong, .-pingpong
	.section	.rodata
	.align	3
.LC0:
	.string	"ping"
	.align	3
.LC1:
	.string	"pong"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB2:
	.loc 1 36 12
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	.loc 1 36 12
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 40]
	mov	x1, 0
	.loc 1 37 5
	adrp	x0, :got:stdout
	ldr	x0, [x0, #:got_lo12:stdout]
	ldr	x0, [x0]
	mov	x3, 0
	mov	w2, 2
	mov	x1, 0
	bl	setvbuf
	.loc 1 40 5
	add	x4, sp, 24
	adrp	x0, .LC0
	add	x3, x0, :lo12:.LC0
	adrp	x0, pingpong
	add	x2, x0, :lo12:pingpong
	mov	x1, 0
	mov	x0, x4
	bl	pthread_create
	.loc 1 41 5
	add	x4, sp, 32
	adrp	x0, .LC1
	add	x3, x0, :lo12:.LC1
	adrp	x0, pingpong
	add	x2, x0, :lo12:pingpong
	mov	x1, 0
	mov	x0, x4
	bl	pthread_create
.L8:
	.loc 1 42 5 discriminator 1
	b	.L8
	.cfi_endproc
.LFE2:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/include/aarch64-linux-gnu/bits/types.h"
	.file 3 "/usr/lib/gcc/aarch64-linux-gnu/11/include/stddef.h"
	.file 4 "/usr/include/aarch64-linux-gnu/bits/pthreadtypes.h"
	.file 5 "/usr/include/aarch64-linux-gnu/bits/types/struct_FILE.h"
	.file 6 "/usr/include/aarch64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/lib/gcc/aarch64-linux-gnu/11/include/stdatomic.h"
	.file 8 "/usr/include/pthread.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "/usr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4ec
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0x11
	.4byte	.LASF62
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x2
	.4byte	0x2e
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.4byte	0x3a
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.4byte	0x46
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.4byte	0x52
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF6
	.uleb128 0x2
	.4byte	0x5e
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.4byte	0x6a
	.uleb128 0x12
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.4byte	0x76
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.4byte	0x82
	.uleb128 0x6
	.4byte	.LASF9
	.byte	0x2
	.byte	0x98
	.byte	0x19
	.4byte	0x82
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x2
	.byte	0x99
	.byte	0x1b
	.4byte	0x82
	.uleb128 0x13
	.byte	0x8
	.uleb128 0x7
	.4byte	0xa6
	.uleb128 0x4
	.4byte	0xb7
	.uleb128 0x7
	.4byte	0xad
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.uleb128 0xc
	.4byte	0xb7
	.uleb128 0x2
	.4byte	0xb7
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.4byte	0x52
	.uleb128 0x4
	.4byte	0xbe
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x2
	.4byte	0xd9
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x4
	.byte	0x1b
	.byte	0x1b
	.4byte	0x52
	.uleb128 0x14
	.4byte	.LASF17
	.byte	0x40
	.byte	0x4
	.byte	0x38
	.byte	0x7
	.4byte	0x115
	.uleb128 0xd
	.4byte	.LASF15
	.byte	0x3a
	.byte	0x8
	.4byte	0x115
	.uleb128 0xd
	.4byte	.LASF16
	.byte	0x3b
	.byte	0xc
	.4byte	0x82
	.byte	0
	.uleb128 0x8
	.4byte	0xb7
	.4byte	0x125
	.uleb128 0x9
	.4byte	0x52
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x4
	.byte	0x3e
	.byte	0x1e
	.4byte	0xf1
	.uleb128 0xc
	.4byte	0x125
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF18
	.uleb128 0x2
	.4byte	0x136
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0xd8
	.byte	0x5
	.byte	0x31
	.byte	0x8
	.4byte	0x2c9
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0x5
	.byte	0x33
	.byte	0x7
	.4byte	0x76
	.byte	0
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x5
	.byte	0x36
	.byte	0x9
	.4byte	0xad
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x5
	.byte	0x37
	.byte	0x9
	.4byte	0xad
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0x5
	.byte	0x38
	.byte	0x9
	.4byte	0xad
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x5
	.byte	0x39
	.byte	0x9
	.4byte	0xad
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x5
	.byte	0x3a
	.byte	0x9
	.4byte	0xad
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0x5
	.byte	0x3b
	.byte	0x9
	.4byte	0xad
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x5
	.byte	0x3c
	.byte	0x9
	.4byte	0xad
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x5
	.byte	0x3d
	.byte	0x9
	.4byte	0xad
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x5
	.byte	0x40
	.byte	0x9
	.4byte	0xad
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x5
	.byte	0x41
	.byte	0x9
	.4byte	0xad
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x5
	.byte	0x42
	.byte	0x9
	.4byte	0xad
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x5
	.byte	0x44
	.byte	0x16
	.4byte	0x2e2
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x5
	.byte	0x46
	.byte	0x14
	.4byte	0x2e7
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x5
	.byte	0x48
	.byte	0x7
	.4byte	0x76
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x5
	.byte	0x49
	.byte	0x7
	.4byte	0x76
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.4byte	0x8e
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF36
	.byte	0x5
	.byte	0x4d
	.byte	0x12
	.4byte	0x3a
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0x5
	.byte	0x4e
	.byte	0xf
	.4byte	0x5e
	.byte	0x82
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0x5
	.byte	0x4f
	.byte	0x8
	.4byte	0x2ec
	.byte	0x83
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0x5
	.byte	0x51
	.byte	0xf
	.4byte	0x2fc
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0x5
	.byte	0x59
	.byte	0xd
	.4byte	0x9a
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0x5
	.byte	0x5b
	.byte	0x17
	.4byte	0x306
	.byte	0x98
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x5
	.byte	0x5c
	.byte	0x19
	.4byte	0x310
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x5
	.byte	0x5d
	.byte	0x14
	.4byte	0x2e7
	.byte	0xa8
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x5
	.byte	0x5e
	.byte	0x9
	.4byte	0xa6
	.byte	0xb0
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x5
	.byte	0x5f
	.byte	0xa
	.4byte	0xc8
	.byte	0xb8
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x5
	.byte	0x60
	.byte	0x7
	.4byte	0x76
	.byte	0xc0
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x5
	.byte	0x62
	.byte	0x8
	.4byte	0x315
	.byte	0xc4
	.byte	0
	.uleb128 0x6
	.4byte	.LASF48
	.byte	0x6
	.byte	0x7
	.byte	0x19
	.4byte	0x142
	.uleb128 0x16
	.4byte	.LASF64
	.byte	0x5
	.byte	0x2b
	.byte	0xe
	.uleb128 0xa
	.4byte	.LASF49
	.uleb128 0x4
	.4byte	0x2dd
	.uleb128 0x4
	.4byte	0x142
	.uleb128 0x8
	.4byte	0xb7
	.4byte	0x2fc
	.uleb128 0x9
	.4byte	0x52
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	0x2d5
	.uleb128 0xa
	.4byte	.LASF50
	.uleb128 0x4
	.4byte	0x301
	.uleb128 0xa
	.4byte	.LASF51
	.uleb128 0x4
	.4byte	0x30b
	.uleb128 0x8
	.4byte	0xb7
	.4byte	0x325
	.uleb128 0x9
	.4byte	0x52
	.byte	0x13
	.byte	0
	.uleb128 0x4
	.4byte	0x2c9
	.uleb128 0x7
	.4byte	0x325
	.uleb128 0x17
	.4byte	.LASF56
	.byte	0x9
	.byte	0x90
	.byte	0xe
	.4byte	0x325
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.4byte	.LASF52
	.uleb128 0x2
	.4byte	0x33b
	.uleb128 0x18
	.byte	0x1
	.byte	0x7
	.byte	0xda
	.byte	0x11
	.4byte	0x35e
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x7
	.byte	0xdd
	.byte	0x9
	.4byte	0x33b
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	0x347
	.uleb128 0x6
	.4byte	.LASF54
	.byte	0x7
	.byte	0xe1
	.byte	0x3
	.4byte	0x35e
	.uleb128 0x6
	.4byte	.LASF55
	.byte	0x1
	.byte	0x13
	.byte	0x15
	.4byte	0x363
	.uleb128 0x19
	.4byte	0x36f
	.uleb128 0x1a
	.string	"mut"
	.byte	0x1
	.byte	0x14
	.byte	0x10
	.4byte	0x37b
	.uleb128 0x9
	.byte	0x3
	.8byte	mut
	.uleb128 0x1b
	.4byte	.LASF57
	.byte	0x8
	.byte	0xca
	.byte	0xc
	.4byte	0x76
	.4byte	0x3bb
	.uleb128 0x5
	.4byte	0x3c0
	.uleb128 0x5
	.4byte	0x3ca
	.uleb128 0x5
	.4byte	0x3cf
	.uleb128 0x5
	.4byte	0xa8
	.byte	0
	.uleb128 0x4
	.4byte	0xe5
	.uleb128 0x7
	.4byte	0x3bb
	.uleb128 0x4
	.4byte	0x131
	.uleb128 0x7
	.4byte	0x3c5
	.uleb128 0x4
	.4byte	0x3d4
	.uleb128 0x1c
	.4byte	0xa6
	.4byte	0x3e3
	.uleb128 0x5
	.4byte	0xa6
	.byte	0
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x9
	.2byte	0x14c
	.byte	0xc
	.4byte	0x76
	.4byte	0x409
	.uleb128 0x5
	.4byte	0x32a
	.uleb128 0x5
	.4byte	0xb2
	.uleb128 0x5
	.4byte	0x76
	.uleb128 0x5
	.4byte	0xc8
	.byte	0
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0xa
	.2byte	0x197
	.byte	0xf
	.4byte	0xc8
	.4byte	0x420
	.uleb128 0x5
	.4byte	0xd4
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF65
	.byte	0x1
	.byte	0x24
	.byte	0x5
	.4byte	0x76
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x45d
	.uleb128 0xf
	.4byte	.LASF60
	.byte	0x26
	.4byte	0xe5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.4byte	.LASF61
	.byte	0x27
	.4byte	0xe5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF66
	.byte	0x1
	.byte	0x1b
	.byte	0x8
	.4byte	0xa6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x49a
	.uleb128 0x10
	.string	"p"
	.byte	0x1b
	.byte	0x18
	.4byte	0xa6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.string	"msg"
	.byte	0x1c
	.byte	0xc
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF67
	.byte	0x1
	.byte	0xb
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.string	"str"
	.byte	0xb
	.byte	0x1c
	.4byte	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.string	"len"
	.byte	0xc
	.byte	0xa
	.4byte	0xc8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x20
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.uleb128 0xb
	.string	"i"
	.byte	0xd
	.byte	0xf
	.4byte	0xc8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x47
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF9:
	.string	"__off_t"
.LASF20:
	.string	"_IO_read_ptr"
.LASF32:
	.string	"_chain"
.LASF12:
	.string	"size_t"
.LASF16:
	.string	"__align"
.LASF38:
	.string	"_shortbuf"
.LASF15:
	.string	"__size"
.LASF26:
	.string	"_IO_buf_base"
.LASF13:
	.string	"long long unsigned int"
.LASF41:
	.string	"_codecvt"
.LASF17:
	.string	"pthread_attr_t"
.LASF18:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF33:
	.string	"_fileno"
.LASF21:
	.string	"_IO_read_end"
.LASF8:
	.string	"long int"
.LASF19:
	.string	"_flags"
.LASF27:
	.string	"_IO_buf_end"
.LASF36:
	.string	"_cur_column"
.LASF50:
	.string	"_IO_codecvt"
.LASF35:
	.string	"_old_offset"
.LASF40:
	.string	"_offset"
.LASF54:
	.string	"atomic_flag"
.LASF61:
	.string	"pong"
.LASF49:
	.string	"_IO_marker"
.LASF4:
	.string	"unsigned int"
.LASF44:
	.string	"_freeres_buf"
.LASF59:
	.string	"strlen"
.LASF53:
	.string	"__val"
.LASF62:
	.string	"GNU C17 11.4.0 -mlittle-endian -mabi=lp64 -g -O0 -pedantic-errors -std=c17 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection"
.LASF5:
	.string	"long unsigned int"
.LASF24:
	.string	"_IO_write_ptr"
.LASF3:
	.string	"short unsigned int"
.LASF28:
	.string	"_IO_save_base"
.LASF39:
	.string	"_lock"
.LASF67:
	.string	"critical"
.LASF34:
	.string	"_flags2"
.LASF46:
	.string	"_mode"
.LASF56:
	.string	"stdout"
.LASF25:
	.string	"_IO_write_end"
.LASF64:
	.string	"_IO_lock_t"
.LASF63:
	.string	"_IO_FILE"
.LASF31:
	.string	"_markers"
.LASF14:
	.string	"pthread_t"
.LASF52:
	.string	"_Bool"
.LASF2:
	.string	"unsigned char"
.LASF7:
	.string	"short int"
.LASF51:
	.string	"_IO_wide_data"
.LASF37:
	.string	"_vtable_offset"
.LASF48:
	.string	"FILE"
.LASF11:
	.string	"char"
.LASF10:
	.string	"__off64_t"
.LASF22:
	.string	"_IO_read_base"
.LASF30:
	.string	"_IO_save_end"
.LASF55:
	.string	"mut_t"
.LASF60:
	.string	"ping"
.LASF45:
	.string	"__pad5"
.LASF47:
	.string	"_unused2"
.LASF57:
	.string	"pthread_create"
.LASF29:
	.string	"_IO_backup_base"
.LASF58:
	.string	"setvbuf"
.LASF43:
	.string	"_freeres_list"
.LASF42:
	.string	"_wide_data"
.LASF65:
	.string	"main"
.LASF23:
	.string	"_IO_write_base"
.LASF66:
	.string	"pingpong"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/csc412-user/lectures/threads_3atomic"
.LASF0:
	.string	"mutex.c"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
