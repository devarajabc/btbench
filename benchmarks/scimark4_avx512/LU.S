
LU.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <LU_num_flops>:
   0:	c5 f0 57 c9          	vxorps %xmm1,%xmm1,%xmm1
   4:	c5 f3 2a d7          	vcvtsi2sd %edi,%xmm1,%xmm2
   8:	c5 eb 58 c2          	vaddsd %xmm2,%xmm2,%xmm0
   c:	c5 fb 59 da          	vmulsd %xmm2,%xmm0,%xmm3
  10:	c5 e3 59 e2          	vmulsd %xmm2,%xmm3,%xmm4
  14:	c5 db 5e 05 00 00 00 	vdivsd 0x0(%rip),%xmm4,%xmm0        # 1c <LU_num_flops+0x1c>
  1b:	00 
  1c:	c3                   	ret
  1d:	0f 1f 00             	nopl   (%rax)

0000000000000020 <LU_copy_matrix>:
  20:	85 ff                	test   %edi,%edi
  22:	0f 8e 83 03 00 00    	jle    3ab <LU_copy_matrix+0x38b>
  28:	41 89 f0             	mov    %esi,%r8d
  2b:	85 f6                	test   %esi,%esi
  2d:	0f 8e 78 03 00 00    	jle    3ab <LU_copy_matrix+0x38b>
  33:	55                   	push   %rbp
  34:	41 89 f1             	mov    %esi,%r9d
  37:	48 63 ff             	movslq %edi,%rdi
  3a:	44 8d 5e ff          	lea    -0x1(%rsi),%r11d
  3e:	41 c1 e9 03          	shr    $0x3,%r9d
  42:	4c 8d 14 fd 00 00 00 	lea    0x0(,%rdi,8),%r10
  49:	00 
  4a:	31 ff                	xor    %edi,%edi
  4c:	49 c1 e1 06          	shl    $0x6,%r9
  50:	48 89 e5             	mov    %rsp,%rbp
  53:	41 57                	push   %r15
  55:	49 89 cf             	mov    %rcx,%r15
  58:	41 56                	push   %r14
  5a:	49 89 d6             	mov    %rdx,%r14
  5d:	41 55                	push   %r13
  5f:	41 54                	push   %r12
  61:	53                   	push   %rbx
  62:	48 63 de             	movslq %esi,%rbx
  65:	48 c1 e3 03          	shl    $0x3,%rbx
  69:	49 8b 0c 3f          	mov    (%r15,%rdi,1),%rcx
  6d:	49 8b 14 3e          	mov    (%r14,%rdi,1),%rdx
  71:	41 83 fb 02          	cmp    $0x2,%r11d
  75:	0f 86 ff 01 00 00    	jbe    27a <LU_copy_matrix+0x25a>
  7b:	48 8d 42 f8          	lea    -0x8(%rdx),%rax
  7f:	48 29 c8             	sub    %rcx,%rax
  82:	48 83 f8 30          	cmp    $0x30,%rax
  86:	0f 86 ee 01 00 00    	jbe    27a <LU_copy_matrix+0x25a>
  8c:	41 83 fb 06          	cmp    $0x6,%r11d
  90:	0f 86 08 03 00 00    	jbe    39e <LU_copy_matrix+0x37e>
  96:	4d 8d 69 c0          	lea    -0x40(%r9),%r13
  9a:	31 f6                	xor    %esi,%esi
  9c:	49 c1 ed 06          	shr    $0x6,%r13
  a0:	49 83 c5 01          	add    $0x1,%r13
  a4:	41 83 e5 07          	and    $0x7,%r13d
  a8:	0f 84 ae 00 00 00    	je     15c <LU_copy_matrix+0x13c>
  ae:	49 83 fd 01          	cmp    $0x1,%r13
  b2:	0f 84 89 00 00 00    	je     141 <LU_copy_matrix+0x121>
  b8:	49 83 fd 02          	cmp    $0x2,%r13
  bc:	74 71                	je     12f <LU_copy_matrix+0x10f>
  be:	49 83 fd 03          	cmp    $0x3,%r13
  c2:	74 59                	je     11d <LU_copy_matrix+0xfd>
  c4:	49 83 fd 04          	cmp    $0x4,%r13
  c8:	74 41                	je     10b <LU_copy_matrix+0xeb>
  ca:	49 83 fd 05          	cmp    $0x5,%r13
  ce:	74 29                	je     f9 <LU_copy_matrix+0xd9>
  d0:	49 83 fd 06          	cmp    $0x6,%r13
  d4:	74 11                	je     e7 <LU_copy_matrix+0xc7>
  d6:	62 f1 fd 48 10 01    	vmovupd (%rcx),%zmm0
  dc:	be 40 00 00 00       	mov    $0x40,%esi
  e1:	62 f1 fd 48 11 02    	vmovupd %zmm0,(%rdx)
  e7:	62 f1 fd 48 10 0c 31 	vmovupd (%rcx,%rsi,1),%zmm1
  ee:	62 f1 fd 48 11 0c 32 	vmovupd %zmm1,(%rdx,%rsi,1)
  f5:	48 83 c6 40          	add    $0x40,%rsi
  f9:	62 f1 fd 48 10 14 31 	vmovupd (%rcx,%rsi,1),%zmm2
 100:	62 f1 fd 48 11 14 32 	vmovupd %zmm2,(%rdx,%rsi,1)
 107:	48 83 c6 40          	add    $0x40,%rsi
 10b:	62 f1 fd 48 10 1c 31 	vmovupd (%rcx,%rsi,1),%zmm3
 112:	62 f1 fd 48 11 1c 32 	vmovupd %zmm3,(%rdx,%rsi,1)
 119:	48 83 c6 40          	add    $0x40,%rsi
 11d:	62 f1 fd 48 10 24 31 	vmovupd (%rcx,%rsi,1),%zmm4
 124:	62 f1 fd 48 11 24 32 	vmovupd %zmm4,(%rdx,%rsi,1)
 12b:	48 83 c6 40          	add    $0x40,%rsi
 12f:	62 f1 fd 48 10 2c 31 	vmovupd (%rcx,%rsi,1),%zmm5
 136:	62 f1 fd 48 11 2c 32 	vmovupd %zmm5,(%rdx,%rsi,1)
 13d:	48 83 c6 40          	add    $0x40,%rsi
 141:	62 f1 fd 48 10 34 31 	vmovupd (%rcx,%rsi,1),%zmm6
 148:	62 f1 fd 48 11 34 32 	vmovupd %zmm6,(%rdx,%rsi,1)
 14f:	48 83 c6 40          	add    $0x40,%rsi
 153:	49 39 f1             	cmp    %rsi,%r9
 156:	0f 84 8e 00 00 00    	je     1ea <LU_copy_matrix+0x1ca>
 15c:	62 f1 fd 48 10 3c 31 	vmovupd (%rcx,%rsi,1),%zmm7
 163:	62 f1 fd 48 11 3c 32 	vmovupd %zmm7,(%rdx,%rsi,1)
 16a:	62 71 fd 48 10 44 31 	vmovupd 0x40(%rcx,%rsi,1),%zmm8
 171:	01 
 172:	62 71 fd 48 11 44 32 	vmovupd %zmm8,0x40(%rdx,%rsi,1)
 179:	01 
 17a:	62 71 fd 48 10 4c 31 	vmovupd 0x80(%rcx,%rsi,1),%zmm9
 181:	02 
 182:	62 71 fd 48 11 4c 32 	vmovupd %zmm9,0x80(%rdx,%rsi,1)
 189:	02 
 18a:	62 71 fd 48 10 54 31 	vmovupd 0xc0(%rcx,%rsi,1),%zmm10
 191:	03 
 192:	62 71 fd 48 11 54 32 	vmovupd %zmm10,0xc0(%rdx,%rsi,1)
 199:	03 
 19a:	62 71 fd 48 10 5c 31 	vmovupd 0x100(%rcx,%rsi,1),%zmm11
 1a1:	04 
 1a2:	62 71 fd 48 11 5c 32 	vmovupd %zmm11,0x100(%rdx,%rsi,1)
 1a9:	04 
 1aa:	62 71 fd 48 10 64 31 	vmovupd 0x140(%rcx,%rsi,1),%zmm12
 1b1:	05 
 1b2:	62 71 fd 48 11 64 32 	vmovupd %zmm12,0x140(%rdx,%rsi,1)
 1b9:	05 
 1ba:	62 71 fd 48 10 6c 31 	vmovupd 0x180(%rcx,%rsi,1),%zmm13
 1c1:	06 
 1c2:	62 71 fd 48 11 6c 32 	vmovupd %zmm13,0x180(%rdx,%rsi,1)
 1c9:	06 
 1ca:	62 71 fd 48 10 74 31 	vmovupd 0x1c0(%rcx,%rsi,1),%zmm14
 1d1:	07 
 1d2:	62 71 fd 48 11 74 32 	vmovupd %zmm14,0x1c0(%rdx,%rsi,1)
 1d9:	07 
 1da:	48 81 c6 00 02 00 00 	add    $0x200,%rsi
 1e1:	49 39 f1             	cmp    %rsi,%r9
 1e4:	0f 85 72 ff ff ff    	jne    15c <LU_copy_matrix+0x13c>
 1ea:	44 89 c0             	mov    %r8d,%eax
 1ed:	83 e0 f8             	and    $0xfffffff8,%eax
 1f0:	41 89 c4             	mov    %eax,%r12d
 1f3:	41 39 c0             	cmp    %eax,%r8d
 1f6:	74 5c                	je     254 <LU_copy_matrix+0x234>
 1f8:	44 89 c6             	mov    %r8d,%esi
 1fb:	29 c6                	sub    %eax,%esi
 1fd:	44 8d 6e ff          	lea    -0x1(%rsi),%r13d
 201:	41 83 fd 02          	cmp    $0x2,%r13d
 205:	76 17                	jbe    21e <LU_copy_matrix+0x1fe>
 207:	c4 21 7d 10 3c e1    	vmovupd (%rcx,%r12,8),%ymm15
 20d:	c4 21 7d 11 3c e2    	vmovupd %ymm15,(%rdx,%r12,8)
 213:	40 f6 c6 03          	test   $0x3,%sil
 217:	74 3b                	je     254 <LU_copy_matrix+0x234>
 219:	83 e6 fc             	and    $0xfffffffc,%esi
 21c:	01 f0                	add    %esi,%eax
 21e:	48 63 f0             	movslq %eax,%rsi
 221:	44 8d 60 01          	lea    0x1(%rax),%r12d
 225:	c5 fb 10 04 f1       	vmovsd (%rcx,%rsi,8),%xmm0
 22a:	c5 fb 11 04 f2       	vmovsd %xmm0,(%rdx,%rsi,8)
 22f:	45 39 e0             	cmp    %r12d,%r8d
 232:	7e 20                	jle    254 <LU_copy_matrix+0x234>
 234:	c5 fb 10 4c f1 08    	vmovsd 0x8(%rcx,%rsi,8),%xmm1
 23a:	83 c0 02             	add    $0x2,%eax
 23d:	c5 fb 11 4c f2 08    	vmovsd %xmm1,0x8(%rdx,%rsi,8)
 243:	41 39 c0             	cmp    %eax,%r8d
 246:	7e 0c                	jle    254 <LU_copy_matrix+0x234>
 248:	c5 fb 10 54 f1 10    	vmovsd 0x10(%rcx,%rsi,8),%xmm2
 24e:	c5 fb 11 54 f2 10    	vmovsd %xmm2,0x10(%rdx,%rsi,8)
 254:	48 83 c7 08          	add    $0x8,%rdi
 258:	4c 39 d7             	cmp    %r10,%rdi
 25b:	0f 84 2f 01 00 00    	je     390 <LU_copy_matrix+0x370>
 261:	49 8b 14 3e          	mov    (%r14,%rdi,1),%rdx
 265:	49 8b 0c 3f          	mov    (%r15,%rdi,1),%rcx
 269:	48 8d 42 f8          	lea    -0x8(%rdx),%rax
 26d:	48 29 c8             	sub    %rcx,%rax
 270:	48 83 f8 30          	cmp    $0x30,%rax
 274:	0f 87 12 fe ff ff    	ja     8c <LU_copy_matrix+0x6c>
 27a:	4c 8d 6b f8          	lea    -0x8(%rbx),%r13
 27e:	31 c0                	xor    %eax,%eax
 280:	49 c1 ed 03          	shr    $0x3,%r13
 284:	49 83 c5 01          	add    $0x1,%r13
 288:	41 83 e5 07          	and    $0x7,%r13d
 28c:	0f 84 8a 00 00 00    	je     31c <LU_copy_matrix+0x2fc>
 292:	49 83 fd 01          	cmp    $0x1,%r13
 296:	74 71                	je     309 <LU_copy_matrix+0x2e9>
 298:	49 83 fd 02          	cmp    $0x2,%r13
 29c:	74 5d                	je     2fb <LU_copy_matrix+0x2db>
 29e:	49 83 fd 03          	cmp    $0x3,%r13
 2a2:	74 49                	je     2ed <LU_copy_matrix+0x2cd>
 2a4:	49 83 fd 04          	cmp    $0x4,%r13
 2a8:	74 35                	je     2df <LU_copy_matrix+0x2bf>
 2aa:	49 83 fd 05          	cmp    $0x5,%r13
 2ae:	74 21                	je     2d1 <LU_copy_matrix+0x2b1>
 2b0:	49 83 fd 06          	cmp    $0x6,%r13
 2b4:	74 0d                	je     2c3 <LU_copy_matrix+0x2a3>
 2b6:	c5 fb 10 19          	vmovsd (%rcx),%xmm3
 2ba:	b8 08 00 00 00       	mov    $0x8,%eax
 2bf:	c5 fb 11 1a          	vmovsd %xmm3,(%rdx)
 2c3:	c5 fb 10 24 01       	vmovsd (%rcx,%rax,1),%xmm4
 2c8:	c5 fb 11 24 02       	vmovsd %xmm4,(%rdx,%rax,1)
 2cd:	48 83 c0 08          	add    $0x8,%rax
 2d1:	c5 fb 10 2c 01       	vmovsd (%rcx,%rax,1),%xmm5
 2d6:	c5 fb 11 2c 02       	vmovsd %xmm5,(%rdx,%rax,1)
 2db:	48 83 c0 08          	add    $0x8,%rax
 2df:	c5 fb 10 34 01       	vmovsd (%rcx,%rax,1),%xmm6
 2e4:	c5 fb 11 34 02       	vmovsd %xmm6,(%rdx,%rax,1)
 2e9:	48 83 c0 08          	add    $0x8,%rax
 2ed:	c5 fb 10 3c 01       	vmovsd (%rcx,%rax,1),%xmm7
 2f2:	c5 fb 11 3c 02       	vmovsd %xmm7,(%rdx,%rax,1)
 2f7:	48 83 c0 08          	add    $0x8,%rax
 2fb:	c5 7b 10 04 01       	vmovsd (%rcx,%rax,1),%xmm8
 300:	c5 7b 11 04 02       	vmovsd %xmm8,(%rdx,%rax,1)
 305:	48 83 c0 08          	add    $0x8,%rax
 309:	c5 7b 10 0c 01       	vmovsd (%rcx,%rax,1),%xmm9
 30e:	c5 7b 11 0c 02       	vmovsd %xmm9,(%rdx,%rax,1)
 313:	48 83 c0 08          	add    $0x8,%rax
 317:	48 39 c3             	cmp    %rax,%rbx
 31a:	74 67                	je     383 <LU_copy_matrix+0x363>
 31c:	c5 7b 10 14 01       	vmovsd (%rcx,%rax,1),%xmm10
 321:	c5 7b 11 14 02       	vmovsd %xmm10,(%rdx,%rax,1)
 326:	c5 7b 10 5c 01 08    	vmovsd 0x8(%rcx,%rax,1),%xmm11
 32c:	c5 7b 11 5c 02 08    	vmovsd %xmm11,0x8(%rdx,%rax,1)
 332:	c5 7b 10 64 01 10    	vmovsd 0x10(%rcx,%rax,1),%xmm12
 338:	c5 7b 11 64 02 10    	vmovsd %xmm12,0x10(%rdx,%rax,1)
 33e:	c5 7b 10 6c 01 18    	vmovsd 0x18(%rcx,%rax,1),%xmm13
 344:	c5 7b 11 6c 02 18    	vmovsd %xmm13,0x18(%rdx,%rax,1)
 34a:	c5 7b 10 74 01 20    	vmovsd 0x20(%rcx,%rax,1),%xmm14
 350:	c5 7b 11 74 02 20    	vmovsd %xmm14,0x20(%rdx,%rax,1)
 356:	c5 7b 10 7c 01 28    	vmovsd 0x28(%rcx,%rax,1),%xmm15
 35c:	c5 7b 11 7c 02 28    	vmovsd %xmm15,0x28(%rdx,%rax,1)
 362:	c5 fb 10 44 01 30    	vmovsd 0x30(%rcx,%rax,1),%xmm0
 368:	c5 fb 11 44 02 30    	vmovsd %xmm0,0x30(%rdx,%rax,1)
 36e:	c5 fb 10 4c 01 38    	vmovsd 0x38(%rcx,%rax,1),%xmm1
 374:	c5 fb 11 4c 02 38    	vmovsd %xmm1,0x38(%rdx,%rax,1)
 37a:	48 83 c0 40          	add    $0x40,%rax
 37e:	48 39 c3             	cmp    %rax,%rbx
 381:	75 99                	jne    31c <LU_copy_matrix+0x2fc>
 383:	48 83 c7 08          	add    $0x8,%rdi
 387:	49 39 fa             	cmp    %rdi,%r10
 38a:	0f 85 d9 fc ff ff    	jne    69 <LU_copy_matrix+0x49>
 390:	c5 f8 77             	vzeroupper
 393:	5b                   	pop    %rbx
 394:	41 5c                	pop    %r12
 396:	41 5d                	pop    %r13
 398:	41 5e                	pop    %r14
 39a:	41 5f                	pop    %r15
 39c:	5d                   	pop    %rbp
 39d:	c3                   	ret
 39e:	44 89 c6             	mov    %r8d,%esi
 3a1:	45 31 e4             	xor    %r12d,%r12d
 3a4:	31 c0                	xor    %eax,%eax
 3a6:	e9 5c fe ff ff       	jmp    207 <LU_copy_matrix+0x1e7>
 3ab:	c3                   	ret
 3ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000003b0 <LU_factor>:
 3b0:	55                   	push   %rbp
 3b1:	c4 e1 f9 6e d2       	vmovq  %rdx,%xmm2
 3b6:	89 f2                	mov    %esi,%edx
 3b8:	48 89 e5             	mov    %rsp,%rbp
 3bb:	41 57                	push   %r15
 3bd:	41 56                	push   %r14
 3bf:	41 55                	push   %r13
 3c1:	41 54                	push   %r12
 3c3:	53                   	push   %rbx
 3c4:	48 83 e4 c0          	and    $0xffffffffffffffc0,%rsp
 3c8:	39 fe                	cmp    %edi,%esi
 3ca:	0f 4f d7             	cmovg  %edi,%edx
 3cd:	89 74 24 f0          	mov    %esi,-0x10(%rsp)
 3d1:	85 d2                	test   %edx,%edx
 3d3:	0f 8e a3 03 00 00    	jle    77c <LU_factor+0x3cc>
 3d9:	44 8d 46 fe          	lea    -0x2(%rsi),%r8d
 3dd:	8d 72 ff             	lea    -0x1(%rdx),%esi
 3e0:	c4 e1 f9 7e d3       	vmovq  %xmm2,%rbx
 3e5:	41 89 fb             	mov    %edi,%r11d
 3e8:	89 74 24 e0          	mov    %esi,-0x20(%rsp)
 3ec:	48 83 c3 08          	add    $0x8,%rbx
 3f0:	c5 eb 10 ea          	vmovsd %xmm2,%xmm2,%xmm5
 3f4:	31 ff                	xor    %edi,%edi
 3f6:	45 31 c9             	xor    %r9d,%r9d
 3f9:	c5 c1 57 ff          	vxorpd %xmm7,%xmm7,%xmm7
 3fd:	41 89 d7             	mov    %edx,%r15d
 400:	45 31 f6             	xor    %r14d,%r14d
 403:	c4 61 f9 6e c3       	vmovq  %rbx,%xmm8
 408:	41 8d 43 fe          	lea    -0x2(%r11),%eax
 40c:	45 8d 6b ff          	lea    -0x1(%r11),%r13d
 410:	48 c7 44 24 d8 f8 ff 	movq   $0xfffffffffffffff8,-0x28(%rsp)
 417:	ff ff 
 419:	c5 7b 10 0d 00 00 00 	vmovsd 0x0(%rip),%xmm9        # 421 <LU_factor+0x71>
 420:	00 
 421:	c4 e1 f9 6e d1       	vmovq  %rcx,%xmm2
 426:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
 42d:	00 00 00 
 430:	c4 e1 f9 7e e9       	vmovq  %xmm5,%rcx
 435:	4a 8b 34 31          	mov    (%rcx,%r14,1),%rsi
 439:	89 f9                	mov    %edi,%ecx
 43b:	83 c7 01             	add    $0x1,%edi
 43e:	c4 a1 7b 10 0c 36    	vmovsd (%rsi,%r14,1),%xmm1
 444:	41 39 fb             	cmp    %edi,%r11d
 447:	0f 8e dc 0a 00 00    	jle    f29 <LU_factor+0xb79>
 44d:	48 8b 5c 24 d8       	mov    -0x28(%rsp),%rbx
 452:	c4 e1 f9 7e ea       	vmovq  %xmm5,%rdx
 457:	4d 8d 51 01          	lea    0x1(%r9),%r10
 45b:	c5 f1 54 1d 00 00 00 	vandpd 0x0(%rip),%xmm1,%xmm3        # 463 <LU_factor+0xb3>
 462:	00 
 463:	4d 89 d4             	mov    %r10,%r12
 466:	4c 01 f3             	add    %r14,%rbx
 469:	49 f7 d4             	not    %r12
 46c:	48 01 d3             	add    %rdx,%rbx
 46f:	45 01 dc             	add    %r11d,%r12d
 472:	4a 8b 54 d3 08       	mov    0x8(%rbx,%r10,8),%rdx
 477:	41 83 e4 07          	and    $0x7,%r12d
 47b:	c4 a1 7b 10 04 32    	vmovsd (%rdx,%r14,1),%xmm0
 481:	49 8d 51 02          	lea    0x2(%r9),%rdx
 485:	c5 f9 54 25 00 00 00 	vandpd 0x0(%rip),%xmm0,%xmm4        # 48d <LU_factor+0xdd>
 48c:	00 
 48d:	c5 f9 2f e3          	vcomisd %xmm3,%xmm4
 491:	c5 db 5f c3          	vmaxsd %xmm3,%xmm4,%xmm0
 495:	41 0f 47 ca          	cmova  %r10d,%ecx
 499:	41 39 d3             	cmp    %edx,%r11d
 49c:	0f 8e 63 02 00 00    	jle    705 <LU_factor+0x355>
 4a2:	45 85 e4             	test   %r12d,%r12d
 4a5:	0f 84 27 01 00 00    	je     5d2 <LU_factor+0x222>
 4ab:	41 83 fc 01          	cmp    $0x1,%r12d
 4af:	0f 84 f2 00 00 00    	je     5a7 <LU_factor+0x1f7>
 4b5:	41 83 fc 02          	cmp    $0x2,%r12d
 4b9:	0f 84 c6 00 00 00    	je     585 <LU_factor+0x1d5>
 4bf:	41 83 fc 03          	cmp    $0x3,%r12d
 4c3:	0f 84 9a 00 00 00    	je     563 <LU_factor+0x1b3>
 4c9:	41 83 fc 04          	cmp    $0x4,%r12d
 4cd:	74 72                	je     541 <LU_factor+0x191>
 4cf:	41 83 fc 05          	cmp    $0x5,%r12d
 4d3:	74 4a                	je     51f <LU_factor+0x16f>
 4d5:	41 83 fc 06          	cmp    $0x6,%r12d
 4d9:	74 22                	je     4fd <LU_factor+0x14d>
 4db:	4c 8b 64 d3 08       	mov    0x8(%rbx,%rdx,8),%r12
 4e0:	c4 81 7b 10 34 34    	vmovsd (%r12,%r14,1),%xmm6
 4e6:	c5 49 54 15 00 00 00 	vandpd 0x0(%rip),%xmm6,%xmm10        # 4ee <LU_factor+0x13e>
 4ed:	00 
 4ee:	c5 79 2f d0          	vcomisd %xmm0,%xmm10
 4f2:	c5 ab 5f c0          	vmaxsd %xmm0,%xmm10,%xmm0
 4f6:	0f 47 ca             	cmova  %edx,%ecx
 4f9:	49 8d 51 03          	lea    0x3(%r9),%rdx
 4fd:	4c 8b 64 d3 08       	mov    0x8(%rbx,%rdx,8),%r12
 502:	c4 01 7b 10 1c 34    	vmovsd (%r12,%r14,1),%xmm11
 508:	c5 21 54 25 00 00 00 	vandpd 0x0(%rip),%xmm11,%xmm12        # 510 <LU_factor+0x160>
 50f:	00 
 510:	c5 79 2f e0          	vcomisd %xmm0,%xmm12
 514:	c5 9b 5f c0          	vmaxsd %xmm0,%xmm12,%xmm0
 518:	0f 47 ca             	cmova  %edx,%ecx
 51b:	48 83 c2 01          	add    $0x1,%rdx
 51f:	4c 8b 64 d3 08       	mov    0x8(%rbx,%rdx,8),%r12
 524:	c4 01 7b 10 2c 34    	vmovsd (%r12,%r14,1),%xmm13
 52a:	c5 11 54 35 00 00 00 	vandpd 0x0(%rip),%xmm13,%xmm14        # 532 <LU_factor+0x182>
 531:	00 
 532:	c5 79 2f f0          	vcomisd %xmm0,%xmm14
 536:	c5 8b 5f c0          	vmaxsd %xmm0,%xmm14,%xmm0
 53a:	0f 47 ca             	cmova  %edx,%ecx
 53d:	48 83 c2 01          	add    $0x1,%rdx
 541:	4c 8b 64 d3 08       	mov    0x8(%rbx,%rdx,8),%r12
 546:	c4 01 7b 10 3c 34    	vmovsd (%r12,%r14,1),%xmm15
 54c:	c5 81 54 0d 00 00 00 	vandpd 0x0(%rip),%xmm15,%xmm1        # 554 <LU_factor+0x1a4>
 553:	00 
 554:	c5 f9 2f c8          	vcomisd %xmm0,%xmm1
 558:	c5 f3 5f c0          	vmaxsd %xmm0,%xmm1,%xmm0
 55c:	0f 47 ca             	cmova  %edx,%ecx
 55f:	48 83 c2 01          	add    $0x1,%rdx
 563:	4c 8b 64 d3 08       	mov    0x8(%rbx,%rdx,8),%r12
 568:	c4 81 7b 10 1c 34    	vmovsd (%r12,%r14,1),%xmm3
 56e:	c5 e1 54 25 00 00 00 	vandpd 0x0(%rip),%xmm3,%xmm4        # 576 <LU_factor+0x1c6>
 575:	00 
 576:	c5 f9 2f e0          	vcomisd %xmm0,%xmm4
 57a:	c5 db 5f c0          	vmaxsd %xmm0,%xmm4,%xmm0
 57e:	0f 47 ca             	cmova  %edx,%ecx
 581:	48 83 c2 01          	add    $0x1,%rdx
 585:	4c 8b 64 d3 08       	mov    0x8(%rbx,%rdx,8),%r12
 58a:	c4 81 7b 10 34 34    	vmovsd (%r12,%r14,1),%xmm6
 590:	c5 49 54 15 00 00 00 	vandpd 0x0(%rip),%xmm6,%xmm10        # 598 <LU_factor+0x1e8>
 597:	00 
 598:	c5 79 2f d0          	vcomisd %xmm0,%xmm10
 59c:	c5 ab 5f c0          	vmaxsd %xmm0,%xmm10,%xmm0
 5a0:	0f 47 ca             	cmova  %edx,%ecx
 5a3:	48 83 c2 01          	add    $0x1,%rdx
 5a7:	4c 8b 64 d3 08       	mov    0x8(%rbx,%rdx,8),%r12
 5ac:	c4 01 7b 10 1c 34    	vmovsd (%r12,%r14,1),%xmm11
 5b2:	c5 21 54 25 00 00 00 	vandpd 0x0(%rip),%xmm11,%xmm12        # 5ba <LU_factor+0x20a>
 5b9:	00 
 5ba:	c5 79 2f e0          	vcomisd %xmm0,%xmm12
 5be:	c5 9b 5f c0          	vmaxsd %xmm0,%xmm12,%xmm0
 5c2:	0f 47 ca             	cmova  %edx,%ecx
 5c5:	48 83 c2 01          	add    $0x1,%rdx
 5c9:	41 39 d3             	cmp    %edx,%r11d
 5cc:	0f 8e 33 01 00 00    	jle    705 <LU_factor+0x355>
 5d2:	89 44 24 f8          	mov    %eax,-0x8(%rsp)
 5d6:	48 8b 44 d3 08       	mov    0x8(%rbx,%rdx,8),%rax
 5db:	c4 21 7b 10 2c 30    	vmovsd (%rax,%r14,1),%xmm13
 5e1:	c5 11 54 35 00 00 00 	vandpd 0x0(%rip),%xmm13,%xmm14        # 5e9 <LU_factor+0x239>
 5e8:	00 
 5e9:	c5 79 2f f0          	vcomisd %xmm0,%xmm14
 5ed:	c5 0b 5f f8          	vmaxsd %xmm0,%xmm14,%xmm15
 5f1:	0f 47 ca             	cmova  %edx,%ecx
 5f4:	41 89 cc             	mov    %ecx,%r12d
 5f7:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
 5fb:	48 8b 44 cb 08       	mov    0x8(%rbx,%rcx,8),%rax
 600:	c4 a1 7b 10 0c 30    	vmovsd (%rax,%r14,1),%xmm1
 606:	c5 f1 54 1d 00 00 00 	vandpd 0x0(%rip),%xmm1,%xmm3        # 60e <LU_factor+0x25e>
 60d:	00 
 60e:	c4 c1 79 2f df       	vcomisd %xmm15,%xmm3
 613:	c4 c1 63 5f e7       	vmaxsd %xmm15,%xmm3,%xmm4
 618:	41 0f 46 cc          	cmovbe %r12d,%ecx
 61c:	4c 8d 62 02          	lea    0x2(%rdx),%r12
 620:	4a 8b 44 e3 08       	mov    0x8(%rbx,%r12,8),%rax
 625:	c4 a1 7b 10 34 30    	vmovsd (%rax,%r14,1),%xmm6
 62b:	c5 49 54 15 00 00 00 	vandpd 0x0(%rip),%xmm6,%xmm10        # 633 <LU_factor+0x283>
 632:	00 
 633:	c5 79 2f d4          	vcomisd %xmm4,%xmm10
 637:	c5 2b 5f dc          	vmaxsd %xmm4,%xmm10,%xmm11
 63b:	44 0f 46 e1          	cmovbe %ecx,%r12d
 63f:	48 8d 4a 03          	lea    0x3(%rdx),%rcx
 643:	48 8b 44 cb 08       	mov    0x8(%rbx,%rcx,8),%rax
 648:	c4 21 7b 10 24 30    	vmovsd (%rax,%r14,1),%xmm12
 64e:	c5 99 54 05 00 00 00 	vandpd 0x0(%rip),%xmm12,%xmm0        # 656 <LU_factor+0x2a6>
 655:	00 
 656:	c4 c1 79 2f c3       	vcomisd %xmm11,%xmm0
 65b:	c4 41 7b 5f eb       	vmaxsd %xmm11,%xmm0,%xmm13
 660:	41 0f 46 cc          	cmovbe %r12d,%ecx
 664:	4c 8d 62 04          	lea    0x4(%rdx),%r12
 668:	4a 8b 44 e3 08       	mov    0x8(%rbx,%r12,8),%rax
 66d:	c4 21 7b 10 34 30    	vmovsd (%rax,%r14,1),%xmm14
 673:	c5 09 54 3d 00 00 00 	vandpd 0x0(%rip),%xmm14,%xmm15        # 67b <LU_factor+0x2cb>
 67a:	00 
 67b:	c4 41 79 2f fd       	vcomisd %xmm13,%xmm15
 680:	c4 c1 03 5f cd       	vmaxsd %xmm13,%xmm15,%xmm1
 685:	44 0f 46 e1          	cmovbe %ecx,%r12d
 689:	48 8d 4a 05          	lea    0x5(%rdx),%rcx
 68d:	48 8b 44 cb 08       	mov    0x8(%rbx,%rcx,8),%rax
 692:	c4 a1 7b 10 1c 30    	vmovsd (%rax,%r14,1),%xmm3
 698:	c5 e1 54 25 00 00 00 	vandpd 0x0(%rip),%xmm3,%xmm4        # 6a0 <LU_factor+0x2f0>
 69f:	00 
 6a0:	c5 f9 2f e1          	vcomisd %xmm1,%xmm4
 6a4:	c5 db 5f f1          	vmaxsd %xmm1,%xmm4,%xmm6
 6a8:	41 0f 46 cc          	cmovbe %r12d,%ecx
 6ac:	4c 8d 62 06          	lea    0x6(%rdx),%r12
 6b0:	4a 8b 44 e3 08       	mov    0x8(%rbx,%r12,8),%rax
 6b5:	c4 21 7b 10 14 30    	vmovsd (%rax,%r14,1),%xmm10
 6bb:	c5 29 54 1d 00 00 00 	vandpd 0x0(%rip),%xmm10,%xmm11        # 6c3 <LU_factor+0x313>
 6c2:	00 
 6c3:	c5 79 2f de          	vcomisd %xmm6,%xmm11
 6c7:	c5 23 5f e6          	vmaxsd %xmm6,%xmm11,%xmm12
 6cb:	44 0f 46 e1          	cmovbe %ecx,%r12d
 6cf:	48 8d 4a 07          	lea    0x7(%rdx),%rcx
 6d3:	48 8b 44 cb 08       	mov    0x8(%rbx,%rcx,8),%rax
 6d8:	c4 a1 7b 10 04 30    	vmovsd (%rax,%r14,1),%xmm0
 6de:	c5 79 54 2d 00 00 00 	vandpd 0x0(%rip),%xmm0,%xmm13        # 6e6 <LU_factor+0x336>
 6e5:	00 
 6e6:	c4 41 79 2f ec       	vcomisd %xmm12,%xmm13
 6eb:	c4 c1 13 5f c4       	vmaxsd %xmm12,%xmm13,%xmm0
 6f0:	41 0f 46 cc          	cmovbe %r12d,%ecx
 6f4:	48 83 c2 08          	add    $0x8,%rdx
 6f8:	41 39 d3             	cmp    %edx,%r11d
 6fb:	0f 8f d5 fe ff ff    	jg     5d6 <LU_factor+0x226>
 701:	8b 44 24 f8          	mov    -0x8(%rsp),%eax
 705:	48 63 d1             	movslq %ecx,%rdx
 708:	c4 c1 f9 7e ec       	vmovq  %xmm5,%r12
 70d:	c4 e1 f9 7e d3       	vmovq  %xmm2,%rbx
 712:	49 8d 14 d4          	lea    (%r12,%rdx,8),%rdx
 716:	42 89 0c 8b          	mov    %ecx,(%rbx,%r9,4)
 71a:	48 8b 1a             	mov    (%rdx),%rbx
 71d:	c4 a1 79 2e 3c 33    	vucomisd (%rbx,%r14,1),%xmm7
 723:	7a 06                	jp     72b <LU_factor+0x37b>
 725:	0f 84 40 08 00 00    	je     f6b <LU_factor+0xbbb>
 72b:	44 39 c9             	cmp    %r9d,%ecx
 72e:	0f 84 64 06 00 00    	je     d98 <LU_factor+0x9e8>
 734:	c4 e1 f9 7e e9       	vmovq  %xmm5,%rcx
 739:	4a 89 1c 31          	mov    %rbx,(%rcx,%r14,1)
 73d:	44 89 c9             	mov    %r9d,%ecx
 740:	48 89 32             	mov    %rsi,(%rdx)
 743:	45 39 e9             	cmp    %r13d,%r9d
 746:	0f 8c cf 07 00 00    	jl     f1b <LU_factor+0xb6b>
 74c:	39 4c 24 e0          	cmp    %ecx,-0x20(%rsp)
 750:	7f 3b                	jg     78d <LU_factor+0x3dd>
 752:	4d 8d 4e 08          	lea    0x8(%r14),%r9
 756:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
 75b:	48 83 6c 24 d8 08    	subq   $0x8,-0x28(%rsp)
 761:	4d 89 d1             	mov    %r10,%r9
 764:	41 83 e8 01          	sub    $0x1,%r8d
 768:	83 e8 01             	sub    $0x1,%eax
 76b:	4c 8b 74 24 f8       	mov    -0x8(%rsp),%r14
 770:	41 39 ff             	cmp    %edi,%r15d
 773:	0f 85 b7 fc ff ff    	jne    430 <LU_factor+0x80>
 779:	c5 f8 77             	vzeroupper
 77c:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
 780:	31 c0                	xor    %eax,%eax
 782:	5b                   	pop    %rbx
 783:	41 5c                	pop    %r12
 785:	41 5d                	pop    %r13
 787:	41 5e                	pop    %r14
 789:	41 5f                	pop    %r15
 78b:	5d                   	pop    %rbp
 78c:	c3                   	ret
 78d:	41 39 fb             	cmp    %edi,%r11d
 790:	7e c0                	jle    752 <LU_factor+0x3a2>
 792:	39 7c 24 f0          	cmp    %edi,-0x10(%rsp)
 796:	7e ba                	jle    752 <LU_factor+0x3a2>
 798:	c4 e1 f9 7e e9       	vmovq  %xmm5,%rcx
 79d:	89 c2                	mov    %eax,%edx
 79f:	c4 61 f9 7e c3       	vmovq  %xmm8,%rbx
 7a4:	44 89 7c 24 d4       	mov    %r15d,-0x2c(%rsp)
 7a9:	4e 8b 24 31          	mov    (%rcx,%r14,1),%r12
 7ad:	4c 01 ca             	add    %r9,%rdx
 7b0:	89 7c 24 f4          	mov    %edi,-0xc(%rsp)
 7b4:	4a 8d 0c 31          	lea    (%rcx,%r14,1),%rcx
 7b8:	48 8d 34 d3          	lea    (%rbx,%rdx,8),%rsi
 7bc:	44 89 c2             	mov    %r8d,%edx
 7bf:	44 89 6c 24 cc       	mov    %r13d,-0x34(%rsp)
 7c4:	48 8d 1c d5 08 00 00 	lea    0x8(,%rdx,8),%rbx
 7cb:	00 
 7cc:	4b 8d 54 34 10       	lea    0x10(%r12,%r14,1),%rdx
 7d1:	c4 61 f9 6e f6       	vmovq  %rsi,%xmm14
 7d6:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
 7da:	c4 61 f9 6e d2       	vmovq  %rdx,%xmm10
 7df:	8b 54 24 f0          	mov    -0x10(%rsp),%edx
 7e3:	49 8d 76 08          	lea    0x8(%r14),%rsi
 7e7:	c4 e1 f9 6e cb       	vmovq  %rbx,%xmm1
 7ec:	48 89 74 24 f8       	mov    %rsi,-0x8(%rsp)
 7f1:	4b 8d 1c 34          	lea    (%r12,%r14,1),%rbx
 7f5:	89 d6                	mov    %edx,%esi
 7f7:	29 fa                	sub    %edi,%edx
 7f9:	4c 89 54 24 e8       	mov    %r10,-0x18(%rsp)
 7fe:	44 29 ce             	sub    %r9d,%esi
 801:	41 89 d1             	mov    %edx,%r9d
 804:	44 89 5c 24 c8       	mov    %r11d,-0x38(%rsp)
 809:	41 89 d2             	mov    %edx,%r10d
 80c:	41 c1 e9 03          	shr    $0x3,%r9d
 810:	89 74 24 e4          	mov    %esi,-0x1c(%rsp)
 814:	4d 89 f3             	mov    %r14,%r11
 817:	48 89 de             	mov    %rbx,%rsi
 81a:	49 c1 e1 06          	shl    $0x6,%r9
 81e:	4f 8d 74 34 08       	lea    0x8(%r12,%r14,1),%r14
 823:	4c 89 e3             	mov    %r12,%rbx
 826:	4c 89 c8             	mov    %r9,%rax
 829:	c4 41 f9 7e f4       	vmovq  %xmm14,%r12
 82e:	66 90                	xchg   %ax,%ax
 830:	4c 8b 69 08          	mov    0x8(%rcx),%r13
 834:	4f 8d 4c 1d 00       	lea    0x0(%r13,%r11,1),%r9
 839:	c4 41 7b 10 19       	vmovsd (%r9),%xmm11
 83e:	41 83 f8 02          	cmp    $0x2,%r8d
 842:	0f 86 50 03 00 00    	jbe    b98 <LU_factor+0x7e8>
 848:	48 8b 7c 24 f8       	mov    -0x8(%rsp),%rdi
 84d:	c4 41 f9 7e d7       	vmovq  %xmm10,%r15
 852:	4c 01 ef             	add    %r13,%rdi
 855:	48 89 fa             	mov    %rdi,%rdx
 858:	4c 29 fa             	sub    %r15,%rdx
 85b:	48 83 fa 30          	cmp    $0x30,%rdx
 85f:	0f 86 33 03 00 00    	jbe    b98 <LU_factor+0x7e8>
 865:	41 83 f8 06          	cmp    $0x6,%r8d
 869:	0f 86 a0 06 00 00    	jbe    f0f <LU_factor+0xb5f>
 86f:	4c 8d 78 c0          	lea    -0x40(%rax),%r15
 873:	62 52 fd 48 19 e3    	vbroadcastsd %xmm11,%zmm12
 879:	45 31 c9             	xor    %r9d,%r9d
 87c:	49 c1 ef 06          	shr    $0x6,%r15
 880:	49 83 c7 01          	add    $0x1,%r15
 884:	41 83 e7 07          	and    $0x7,%r15d
 888:	0f 84 11 01 00 00    	je     99f <LU_factor+0x5ef>
 88e:	49 83 ff 01          	cmp    $0x1,%r15
 892:	0f 84 df 00 00 00    	je     977 <LU_factor+0x5c7>
 898:	49 83 ff 02          	cmp    $0x2,%r15
 89c:	0f 84 b6 00 00 00    	je     958 <LU_factor+0x5a8>
 8a2:	49 83 ff 03          	cmp    $0x3,%r15
 8a6:	0f 84 8d 00 00 00    	je     939 <LU_factor+0x589>
 8ac:	49 83 ff 04          	cmp    $0x4,%r15
 8b0:	74 68                	je     91a <LU_factor+0x56a>
 8b2:	49 83 ff 05          	cmp    $0x5,%r15
 8b6:	74 43                	je     8fb <LU_factor+0x54b>
 8b8:	49 83 ff 06          	cmp    $0x6,%r15
 8bc:	74 1e                	je     8dc <LU_factor+0x52c>
 8be:	62 51 9d 48 59 2e    	vmulpd (%r14),%zmm12,%zmm13
 8c4:	62 f1 fd 48 10 07    	vmovupd (%rdi),%zmm0
 8ca:	41 b9 40 00 00 00    	mov    $0x40,%r9d
 8d0:	62 51 fd 48 5c fd    	vsubpd %zmm13,%zmm0,%zmm15
 8d6:	62 71 fd 48 11 3f    	vmovupd %zmm15,(%rdi)
 8dc:	62 91 9d 48 59 24 0e 	vmulpd (%r14,%r9,1),%zmm12,%zmm4
 8e3:	62 b1 fd 48 10 1c 0f 	vmovupd (%rdi,%r9,1),%zmm3
 8ea:	62 f1 e5 48 5c f4    	vsubpd %zmm4,%zmm3,%zmm6
 8f0:	62 b1 fd 48 11 34 0f 	vmovupd %zmm6,(%rdi,%r9,1)
 8f7:	49 83 c1 40          	add    $0x40,%r9
 8fb:	62 91 9d 48 59 04 0e 	vmulpd (%r14,%r9,1),%zmm12,%zmm0
 902:	62 31 fd 48 10 34 0f 	vmovupd (%rdi,%r9,1),%zmm14
 909:	62 71 8d 48 5c e8    	vsubpd %zmm0,%zmm14,%zmm13
 90f:	62 31 fd 48 11 2c 0f 	vmovupd %zmm13,(%rdi,%r9,1)
 916:	49 83 c1 40          	add    $0x40,%r9
 91a:	62 11 9d 48 59 3c 0e 	vmulpd (%r14,%r9,1),%zmm12,%zmm15
 921:	62 b1 fd 48 10 1c 0f 	vmovupd (%rdi,%r9,1),%zmm3
 928:	62 d1 e5 48 5c e7    	vsubpd %zmm15,%zmm3,%zmm4
 92e:	62 b1 fd 48 11 24 0f 	vmovupd %zmm4,(%rdi,%r9,1)
 935:	49 83 c1 40          	add    $0x40,%r9
 939:	62 11 9d 48 59 34 0e 	vmulpd (%r14,%r9,1),%zmm12,%zmm14
 940:	62 b1 fd 48 10 34 0f 	vmovupd (%rdi,%r9,1),%zmm6
 947:	62 d1 cd 48 5c c6    	vsubpd %zmm14,%zmm6,%zmm0
 94d:	62 b1 fd 48 11 04 0f 	vmovupd %zmm0,(%rdi,%r9,1)
 954:	49 83 c1 40          	add    $0x40,%r9
 958:	62 91 9d 48 59 1c 0e 	vmulpd (%r14,%r9,1),%zmm12,%zmm3
 95f:	62 31 fd 48 10 2c 0f 	vmovupd (%rdi,%r9,1),%zmm13
 966:	62 71 95 48 5c fb    	vsubpd %zmm3,%zmm13,%zmm15
 96c:	62 31 fd 48 11 3c 0f 	vmovupd %zmm15,(%rdi,%r9,1)
 973:	49 83 c1 40          	add    $0x40,%r9
 977:	62 91 9d 48 59 34 0e 	vmulpd (%r14,%r9,1),%zmm12,%zmm6
 97e:	62 b1 fd 48 10 24 0f 	vmovupd (%rdi,%r9,1),%zmm4
 985:	62 71 dd 48 5c f6    	vsubpd %zmm6,%zmm4,%zmm14
 98b:	62 31 fd 48 11 34 0f 	vmovupd %zmm14,(%rdi,%r9,1)
 992:	49 83 c1 40          	add    $0x40,%r9
 996:	4c 39 c8             	cmp    %r9,%rax
 999:	0f 84 fd 00 00 00    	je     a9c <LU_factor+0x6ec>
 99f:	62 11 9d 48 59 2c 0e 	vmulpd (%r14,%r9,1),%zmm12,%zmm13
 9a6:	62 b1 fd 48 10 04 0f 	vmovupd (%rdi,%r9,1),%zmm0
 9ad:	62 b1 fd 48 10 64 0f 	vmovupd 0x40(%rdi,%r9,1),%zmm4
 9b4:	01 
 9b5:	62 31 fd 48 10 74 0f 	vmovupd 0x80(%rdi,%r9,1),%zmm14
 9bc:	02 
 9bd:	62 d1 fd 48 5c dd    	vsubpd %zmm13,%zmm0,%zmm3
 9c3:	62 b1 fd 48 11 1c 0f 	vmovupd %zmm3,(%rdi,%r9,1)
 9ca:	62 11 9d 48 59 7c 0e 	vmulpd 0x40(%r14,%r9,1),%zmm12,%zmm15
 9d1:	01 
 9d2:	62 b1 fd 48 10 5c 0f 	vmovupd 0xc0(%rdi,%r9,1),%zmm3
 9d9:	03 
 9da:	62 d1 dd 48 5c f7    	vsubpd %zmm15,%zmm4,%zmm6
 9e0:	62 b1 fd 48 11 74 0f 	vmovupd %zmm6,0x40(%rdi,%r9,1)
 9e7:	01 
 9e8:	62 91 9d 48 59 44 0e 	vmulpd 0x80(%r14,%r9,1),%zmm12,%zmm0
 9ef:	02 
 9f0:	62 b1 fd 48 10 74 0f 	vmovupd 0x100(%rdi,%r9,1),%zmm6
 9f7:	04 
 9f8:	62 71 8d 48 5c e8    	vsubpd %zmm0,%zmm14,%zmm13
 9fe:	62 31 fd 48 11 6c 0f 	vmovupd %zmm13,0x80(%rdi,%r9,1)
 a05:	02 
 a06:	62 91 9d 48 59 64 0e 	vmulpd 0xc0(%r14,%r9,1),%zmm12,%zmm4
 a0d:	03 
 a0e:	62 31 fd 48 10 6c 0f 	vmovupd 0x140(%rdi,%r9,1),%zmm13
 a15:	05 
 a16:	62 71 e5 48 5c fc    	vsubpd %zmm4,%zmm3,%zmm15
 a1c:	62 31 fd 48 11 7c 0f 	vmovupd %zmm15,0xc0(%rdi,%r9,1)
 a23:	03 
 a24:	62 11 9d 48 59 74 0e 	vmulpd 0x100(%r14,%r9,1),%zmm12,%zmm14
 a2b:	04 
 a2c:	62 d1 cd 48 5c c6    	vsubpd %zmm14,%zmm6,%zmm0
 a32:	62 b1 fd 48 10 74 0f 	vmovupd 0x180(%rdi,%r9,1),%zmm6
 a39:	06 
 a3a:	62 b1 fd 48 11 44 0f 	vmovupd %zmm0,0x100(%rdi,%r9,1)
 a41:	04 
 a42:	62 91 9d 48 59 5c 0e 	vmulpd 0x140(%r14,%r9,1),%zmm12,%zmm3
 a49:	05 
 a4a:	62 b1 fd 48 10 44 0f 	vmovupd 0x1c0(%rdi,%r9,1),%zmm0
 a51:	07 
 a52:	62 f1 95 48 5c e3    	vsubpd %zmm3,%zmm13,%zmm4
 a58:	62 b1 fd 48 11 64 0f 	vmovupd %zmm4,0x140(%rdi,%r9,1)
 a5f:	05 
 a60:	62 11 9d 48 59 7c 0e 	vmulpd 0x180(%r14,%r9,1),%zmm12,%zmm15
 a67:	06 
 a68:	62 51 cd 48 5c f7    	vsubpd %zmm15,%zmm6,%zmm14
 a6e:	62 31 fd 48 11 74 0f 	vmovupd %zmm14,0x180(%rdi,%r9,1)
 a75:	06 
 a76:	62 11 9d 48 59 6c 0e 	vmulpd 0x1c0(%r14,%r9,1),%zmm12,%zmm13
 a7d:	07 
 a7e:	62 d1 fd 48 5c dd    	vsubpd %zmm13,%zmm0,%zmm3
 a84:	62 b1 fd 48 11 5c 0f 	vmovupd %zmm3,0x1c0(%rdi,%r9,1)
 a8b:	07 
 a8c:	49 81 c1 00 02 00 00 	add    $0x200,%r9
 a93:	4c 39 c8             	cmp    %r9,%rax
 a96:	0f 85 03 ff ff ff    	jne    99f <LU_factor+0x5ef>
 a9c:	41 f6 c2 07          	test   $0x7,%r10b
 aa0:	0f 84 bd 00 00 00    	je     b63 <LU_factor+0x7b3>
 aa6:	8b 7c 24 f4          	mov    -0xc(%rsp),%edi
 aaa:	44 89 d2             	mov    %r10d,%edx
 aad:	83 e2 f8             	and    $0xfffffff8,%edx
 ab0:	44 8d 0c 3a          	lea    (%rdx,%rdi,1),%r9d
 ab4:	44 8b 7c 24 e4       	mov    -0x1c(%rsp),%r15d
 ab9:	41 29 d7             	sub    %edx,%r15d
 abc:	41 8d 7f fe          	lea    -0x2(%r15),%edi
 ac0:	83 ff 02             	cmp    $0x2,%edi
 ac3:	76 32                	jbe    af7 <LU_factor+0x747>
 ac5:	48 03 54 24 e8       	add    -0x18(%rsp),%rdx
 aca:	c4 c2 7d 19 e3       	vbroadcastsd %xmm11,%ymm4
 acf:	41 83 ef 01          	sub    $0x1,%r15d
 ad3:	c5 dd 59 34 d3       	vmulpd (%rbx,%rdx,8),%ymm4,%ymm6
 ad8:	c4 41 7d 10 64 d5 00 	vmovupd 0x0(%r13,%rdx,8),%ymm12
 adf:	c5 1d 5c fe          	vsubpd %ymm6,%ymm12,%ymm15
 ae3:	c4 41 7d 11 7c d5 00 	vmovupd %ymm15,0x0(%r13,%rdx,8)
 aea:	41 f6 c7 03          	test   $0x3,%r15b
 aee:	74 73                	je     b63 <LU_factor+0x7b3>
 af0:	41 83 e7 fc          	and    $0xfffffffc,%r15d
 af4:	45 01 f9             	add    %r15d,%r9d
 af7:	4d 63 f9             	movslq %r9d,%r15
 afa:	41 8d 79 01          	lea    0x1(%r9),%edi
 afe:	c4 21 23 59 34 fb    	vmulsd (%rbx,%r15,8),%xmm11,%xmm14
 b04:	4a 8d 14 fd 00 00 00 	lea    0x0(,%r15,8),%rdx
 b0b:	00 
 b0c:	44 8b 7c 24 f0       	mov    -0x10(%rsp),%r15d
 b11:	c4 c1 7b 10 44 15 00 	vmovsd 0x0(%r13,%rdx,1),%xmm0
 b18:	c4 41 7b 5c ee       	vsubsd %xmm14,%xmm0,%xmm13
 b1d:	c4 41 7b 11 6c 15 00 	vmovsd %xmm13,0x0(%r13,%rdx,1)
 b24:	41 39 ff             	cmp    %edi,%r15d
 b27:	7e 3a                	jle    b63 <LU_factor+0x7b3>
 b29:	c5 a3 59 5c 13 08    	vmulsd 0x8(%rbx,%rdx,1),%xmm11,%xmm3
 b2f:	c4 41 7b 10 64 15 08 	vmovsd 0x8(%r13,%rdx,1),%xmm12
 b36:	41 83 c1 02          	add    $0x2,%r9d
 b3a:	c5 9b 5c e3          	vsubsd %xmm3,%xmm12,%xmm4
 b3e:	c4 c1 7b 11 64 15 08 	vmovsd %xmm4,0x8(%r13,%rdx,1)
 b45:	45 39 cf             	cmp    %r9d,%r15d
 b48:	7e 19                	jle    b63 <LU_factor+0x7b3>
 b4a:	c5 23 59 5c 13 10    	vmulsd 0x10(%rbx,%rdx,1),%xmm11,%xmm11
 b50:	c4 c1 7b 10 74 15 10 	vmovsd 0x10(%r13,%rdx,1),%xmm6
 b57:	c4 41 4b 5c fb       	vsubsd %xmm11,%xmm6,%xmm15
 b5c:	c4 41 7b 11 7c 15 10 	vmovsd %xmm15,0x10(%r13,%rdx,1)
 b63:	48 83 c1 08          	add    $0x8,%rcx
 b67:	4c 39 e1             	cmp    %r12,%rcx
 b6a:	0f 85 c0 fc ff ff    	jne    830 <LU_factor+0x480>
 b70:	44 8b 7c 24 d4       	mov    -0x2c(%rsp),%r15d
 b75:	8b 7c 24 f4          	mov    -0xc(%rsp),%edi
 b79:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
 b7d:	4c 8b 54 24 e8       	mov    -0x18(%rsp),%r10
 b82:	44 8b 6c 24 cc       	mov    -0x34(%rsp),%r13d
 b87:	44 8b 5c 24 c8       	mov    -0x38(%rsp),%r11d
 b8c:	e9 ca fb ff ff       	jmp    75b <LU_factor+0x3ab>
 b91:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 b98:	c4 c1 f9 7e cd       	vmovq  %xmm1,%r13
 b9d:	31 d2                	xor    %edx,%edx
 b9f:	49 83 ed 08          	sub    $0x8,%r13
 ba3:	49 c1 ed 03          	shr    $0x3,%r13
 ba7:	49 83 c5 01          	add    $0x1,%r13
 bab:	41 83 e5 07          	and    $0x7,%r13d
 baf:	0f 84 04 01 00 00    	je     cb9 <LU_factor+0x909>
 bb5:	49 83 fd 01          	cmp    $0x1,%r13
 bb9:	0f 84 d0 00 00 00    	je     c8f <LU_factor+0x8df>
 bbf:	49 83 fd 02          	cmp    $0x2,%r13
 bc3:	0f 84 a9 00 00 00    	je     c72 <LU_factor+0x8c2>
 bc9:	49 83 fd 03          	cmp    $0x3,%r13
 bcd:	0f 84 82 00 00 00    	je     c55 <LU_factor+0x8a5>
 bd3:	49 83 fd 04          	cmp    $0x4,%r13
 bd7:	74 5f                	je     c38 <LU_factor+0x888>
 bd9:	49 83 fd 05          	cmp    $0x5,%r13
 bdd:	74 3d                	je     c1c <LU_factor+0x86c>
 bdf:	49 83 fd 06          	cmp    $0x6,%r13
 be3:	74 1b                	je     c00 <LU_factor+0x850>
 be5:	c5 23 59 76 08       	vmulsd 0x8(%rsi),%xmm11,%xmm14
 bea:	c4 c1 7b 10 41 08    	vmovsd 0x8(%r9),%xmm0
 bf0:	ba 08 00 00 00       	mov    $0x8,%edx
 bf5:	c4 41 7b 5c ee       	vsubsd %xmm14,%xmm0,%xmm13
 bfa:	c4 41 7b 11 69 08    	vmovsd %xmm13,0x8(%r9)
 c00:	c5 a3 59 5c 16 08    	vmulsd 0x8(%rsi,%rdx,1),%xmm11,%xmm3
 c06:	c4 41 7b 10 64 11 08 	vmovsd 0x8(%r9,%rdx,1),%xmm12
 c0d:	c5 9b 5c e3          	vsubsd %xmm3,%xmm12,%xmm4
 c11:	c4 c1 7b 11 64 11 08 	vmovsd %xmm4,0x8(%r9,%rdx,1)
 c18:	48 83 c2 08          	add    $0x8,%rdx
 c1c:	c5 a3 59 74 16 08    	vmulsd 0x8(%rsi,%rdx,1),%xmm11,%xmm6
 c22:	c4 41 7b 10 7c 11 08 	vmovsd 0x8(%r9,%rdx,1),%xmm15
 c29:	c5 03 5c f6          	vsubsd %xmm6,%xmm15,%xmm14
 c2d:	c4 41 7b 11 74 11 08 	vmovsd %xmm14,0x8(%r9,%rdx,1)
 c34:	48 83 c2 08          	add    $0x8,%rdx
 c38:	c5 23 59 6c 16 08    	vmulsd 0x8(%rsi,%rdx,1),%xmm11,%xmm13
 c3e:	c4 c1 7b 10 44 11 08 	vmovsd 0x8(%r9,%rdx,1),%xmm0
 c45:	c4 c1 7b 5c dd       	vsubsd %xmm13,%xmm0,%xmm3
 c4a:	c4 c1 7b 11 5c 11 08 	vmovsd %xmm3,0x8(%r9,%rdx,1)
 c51:	48 83 c2 08          	add    $0x8,%rdx
 c55:	c5 23 59 64 16 08    	vmulsd 0x8(%rsi,%rdx,1),%xmm11,%xmm12
 c5b:	c4 c1 7b 10 64 11 08 	vmovsd 0x8(%r9,%rdx,1),%xmm4
 c62:	c4 c1 5b 5c f4       	vsubsd %xmm12,%xmm4,%xmm6
 c67:	c4 c1 7b 11 74 11 08 	vmovsd %xmm6,0x8(%r9,%rdx,1)
 c6e:	48 83 c2 08          	add    $0x8,%rdx
 c72:	c5 23 59 7c 16 08    	vmulsd 0x8(%rsi,%rdx,1),%xmm11,%xmm15
 c78:	c4 41 7b 10 74 11 08 	vmovsd 0x8(%r9,%rdx,1),%xmm14
 c7f:	c4 41 0b 5c ef       	vsubsd %xmm15,%xmm14,%xmm13
 c84:	c4 41 7b 11 6c 11 08 	vmovsd %xmm13,0x8(%r9,%rdx,1)
 c8b:	48 83 c2 08          	add    $0x8,%rdx
 c8f:	c5 a3 59 5c 16 08    	vmulsd 0x8(%rsi,%rdx,1),%xmm11,%xmm3
 c95:	c4 c1 7b 10 44 11 08 	vmovsd 0x8(%r9,%rdx,1),%xmm0
 c9c:	c4 e1 f9 7e cf       	vmovq  %xmm1,%rdi
 ca1:	c5 7b 5c e3          	vsubsd %xmm3,%xmm0,%xmm12
 ca5:	c4 41 7b 11 64 11 08 	vmovsd %xmm12,0x8(%r9,%rdx,1)
 cac:	48 83 c2 08          	add    $0x8,%rdx
 cb0:	48 39 fa             	cmp    %rdi,%rdx
 cb3:	0f 84 aa fe ff ff    	je     b63 <LU_factor+0x7b3>
 cb9:	c4 c1 f9 7e cf       	vmovq  %xmm1,%r15
 cbe:	c5 a3 59 4c 16 08    	vmulsd 0x8(%rsi,%rdx,1),%xmm11,%xmm1
 cc4:	c4 c1 7b 10 64 11 08 	vmovsd 0x8(%r9,%rdx,1),%xmm4
 ccb:	c4 41 7b 10 74 11 10 	vmovsd 0x10(%r9,%rdx,1),%xmm14
 cd2:	c4 c1 7b 10 44 11 18 	vmovsd 0x18(%r9,%rdx,1),%xmm0
 cd9:	c5 db 5c f1          	vsubsd %xmm1,%xmm4,%xmm6
 cdd:	c4 c1 7b 10 64 11 20 	vmovsd 0x20(%r9,%rdx,1),%xmm4
 ce4:	c4 c1 7b 11 74 11 08 	vmovsd %xmm6,0x8(%r9,%rdx,1)
 ceb:	c5 23 59 7c 32 10    	vmulsd 0x10(%rdx,%rsi,1),%xmm11,%xmm15
 cf1:	c4 41 0b 5c ef       	vsubsd %xmm15,%xmm14,%xmm13
 cf6:	c4 41 7b 10 74 11 28 	vmovsd 0x28(%r9,%rdx,1),%xmm14
 cfd:	c4 41 7b 11 6c 11 10 	vmovsd %xmm13,0x10(%r9,%rdx,1)
 d04:	c5 a3 59 5c 32 18    	vmulsd 0x18(%rdx,%rsi,1),%xmm11,%xmm3
 d0a:	c5 7b 5c e3          	vsubsd %xmm3,%xmm0,%xmm12
 d0e:	c4 c1 7b 10 44 11 30 	vmovsd 0x30(%r9,%rdx,1),%xmm0
 d15:	c4 41 7b 11 64 11 18 	vmovsd %xmm12,0x18(%r9,%rdx,1)
 d1c:	c5 a3 59 4c 32 20    	vmulsd 0x20(%rdx,%rsi,1),%xmm11,%xmm1
 d22:	c5 db 5c f1          	vsubsd %xmm1,%xmm4,%xmm6
 d26:	c4 c1 7b 10 64 11 38 	vmovsd 0x38(%r9,%rdx,1),%xmm4
 d2d:	c4 c1 7b 11 74 11 20 	vmovsd %xmm6,0x20(%r9,%rdx,1)
 d34:	c5 23 59 7c 32 28    	vmulsd 0x28(%rdx,%rsi,1),%xmm11,%xmm15
 d3a:	c4 41 0b 5c ef       	vsubsd %xmm15,%xmm14,%xmm13
 d3f:	c4 41 7b 10 74 11 40 	vmovsd 0x40(%r9,%rdx,1),%xmm14
 d46:	c4 41 7b 11 6c 11 28 	vmovsd %xmm13,0x28(%r9,%rdx,1)
 d4d:	c5 a3 59 5c 32 30    	vmulsd 0x30(%rdx,%rsi,1),%xmm11,%xmm3
 d53:	c5 7b 5c e3          	vsubsd %xmm3,%xmm0,%xmm12
 d57:	c4 41 7b 11 64 11 30 	vmovsd %xmm12,0x30(%r9,%rdx,1)
 d5e:	c5 a3 59 4c 32 38    	vmulsd 0x38(%rdx,%rsi,1),%xmm11,%xmm1
 d64:	c5 db 5c f1          	vsubsd %xmm1,%xmm4,%xmm6
 d68:	c4 c1 7b 11 74 11 38 	vmovsd %xmm6,0x38(%r9,%rdx,1)
 d6f:	c5 23 59 7c 32 40    	vmulsd 0x40(%rdx,%rsi,1),%xmm11,%xmm15
 d75:	c4 41 0b 5c ef       	vsubsd %xmm15,%xmm14,%xmm13
 d7a:	c4 41 7b 11 6c 11 40 	vmovsd %xmm13,0x40(%r9,%rdx,1)
 d81:	48 83 c2 40          	add    $0x40,%rdx
 d85:	4c 39 fa             	cmp    %r15,%rdx
 d88:	0f 85 30 ff ff ff    	jne    cbe <LU_factor+0x90e>
 d8e:	c4 c1 f9 6e cf       	vmovq  %r15,%xmm1
 d93:	e9 cb fd ff ff       	jmp    b63 <LU_factor+0x7b3>
 d98:	41 39 cd             	cmp    %ecx,%r13d
 d9b:	0f 8e ab f9 ff ff    	jle    74c <LU_factor+0x39c>
 da1:	89 c3                	mov    %eax,%ebx
 da3:	c4 c1 f9 7e ec       	vmovq  %xmm5,%r12
 da8:	c4 21 33 5e 34 36    	vdivsd (%rsi,%r14,1),%xmm9,%xmm14
 dae:	c4 61 f9 7e c6       	vmovq  %xmm8,%rsi
 db3:	4c 01 cb             	add    %r9,%rbx
 db6:	4b 8d 14 34          	lea    (%r12,%r14,1),%rdx
 dba:	4c 8d 24 de          	lea    (%rsi,%rbx,8),%r12
 dbe:	4c 89 e3             	mov    %r12,%rbx
 dc1:	48 29 d3             	sub    %rdx,%rbx
 dc4:	48 83 eb 08          	sub    $0x8,%rbx
 dc8:	48 c1 eb 03          	shr    $0x3,%rbx
 dcc:	48 83 c3 01          	add    $0x1,%rbx
 dd0:	83 e3 07             	and    $0x7,%ebx
 dd3:	0f 84 a7 00 00 00    	je     e80 <LU_factor+0xad0>
 dd9:	48 83 fb 01          	cmp    $0x1,%rbx
 ddd:	0f 84 81 00 00 00    	je     e64 <LU_factor+0xab4>
 de3:	48 83 fb 02          	cmp    $0x2,%rbx
 de7:	74 68                	je     e51 <LU_factor+0xaa1>
 de9:	48 83 fb 03          	cmp    $0x3,%rbx
 ded:	74 4f                	je     e3e <LU_factor+0xa8e>
 def:	48 83 fb 04          	cmp    $0x4,%rbx
 df3:	74 36                	je     e2b <LU_factor+0xa7b>
 df5:	48 83 fb 05          	cmp    $0x5,%rbx
 df9:	74 1d                	je     e18 <LU_factor+0xa68>
 dfb:	48 83 fb 06          	cmp    $0x6,%rbx
 dff:	0f 85 4e 01 00 00    	jne    f53 <LU_factor+0xba3>
 e05:	48 8b 5a 08          	mov    0x8(%rdx),%rbx
 e09:	48 83 c2 08          	add    $0x8,%rdx
 e0d:	4c 01 f3             	add    %r14,%rbx
 e10:	c5 8b 59 0b          	vmulsd (%rbx),%xmm14,%xmm1
 e14:	c5 fb 11 0b          	vmovsd %xmm1,(%rbx)
 e18:	48 8b 72 08          	mov    0x8(%rdx),%rsi
 e1c:	48 83 c2 08          	add    $0x8,%rdx
 e20:	4c 01 f6             	add    %r14,%rsi
 e23:	c5 8b 59 1e          	vmulsd (%rsi),%xmm14,%xmm3
 e27:	c5 fb 11 1e          	vmovsd %xmm3,(%rsi)
 e2b:	48 8b 5a 08          	mov    0x8(%rdx),%rbx
 e2f:	48 83 c2 08          	add    $0x8,%rdx
 e33:	4c 01 f3             	add    %r14,%rbx
 e36:	c5 8b 59 23          	vmulsd (%rbx),%xmm14,%xmm4
 e3a:	c5 fb 11 23          	vmovsd %xmm4,(%rbx)
 e3e:	48 8b 72 08          	mov    0x8(%rdx),%rsi
 e42:	48 83 c2 08          	add    $0x8,%rdx
 e46:	4c 01 f6             	add    %r14,%rsi
 e49:	c5 8b 59 36          	vmulsd (%rsi),%xmm14,%xmm6
 e4d:	c5 fb 11 36          	vmovsd %xmm6,(%rsi)
 e51:	48 8b 5a 08          	mov    0x8(%rdx),%rbx
 e55:	48 83 c2 08          	add    $0x8,%rdx
 e59:	4c 01 f3             	add    %r14,%rbx
 e5c:	c5 0b 59 13          	vmulsd (%rbx),%xmm14,%xmm10
 e60:	c5 7b 11 13          	vmovsd %xmm10,(%rbx)
 e64:	48 8b 72 08          	mov    0x8(%rdx),%rsi
 e68:	48 83 c2 08          	add    $0x8,%rdx
 e6c:	4c 01 f6             	add    %r14,%rsi
 e6f:	c5 0b 59 1e          	vmulsd (%rsi),%xmm14,%xmm11
 e73:	c5 7b 11 1e          	vmovsd %xmm11,(%rsi)
 e77:	4c 39 e2             	cmp    %r12,%rdx
 e7a:	0f 84 80 00 00 00    	je     f00 <LU_factor+0xb50>
 e80:	48 8b 5a 08          	mov    0x8(%rdx),%rbx
 e84:	48 8b 72 10          	mov    0x10(%rdx),%rsi
 e88:	48 83 c2 40          	add    $0x40,%rdx
 e8c:	4c 01 f3             	add    %r14,%rbx
 e8f:	4c 01 f6             	add    %r14,%rsi
 e92:	c5 0b 59 23          	vmulsd (%rbx),%xmm14,%xmm12
 e96:	c5 7b 11 23          	vmovsd %xmm12,(%rbx)
 e9a:	c5 8b 59 06          	vmulsd (%rsi),%xmm14,%xmm0
 e9e:	48 8b 5a d8          	mov    -0x28(%rdx),%rbx
 ea2:	4c 01 f3             	add    %r14,%rbx
 ea5:	c5 fb 11 06          	vmovsd %xmm0,(%rsi)
 ea9:	c5 0b 59 2b          	vmulsd (%rbx),%xmm14,%xmm13
 ead:	48 8b 72 e0          	mov    -0x20(%rdx),%rsi
 eb1:	4c 01 f6             	add    %r14,%rsi
 eb4:	c5 7b 11 2b          	vmovsd %xmm13,(%rbx)
 eb8:	c5 0b 59 3e          	vmulsd (%rsi),%xmm14,%xmm15
 ebc:	48 8b 5a e8          	mov    -0x18(%rdx),%rbx
 ec0:	4c 01 f3             	add    %r14,%rbx
 ec3:	c5 7b 11 3e          	vmovsd %xmm15,(%rsi)
 ec7:	c5 8b 59 0b          	vmulsd (%rbx),%xmm14,%xmm1
 ecb:	48 8b 72 f0          	mov    -0x10(%rdx),%rsi
 ecf:	4c 01 f6             	add    %r14,%rsi
 ed2:	c5 fb 11 0b          	vmovsd %xmm1,(%rbx)
 ed6:	c5 8b 59 1e          	vmulsd (%rsi),%xmm14,%xmm3
 eda:	48 8b 5a f8          	mov    -0x8(%rdx),%rbx
 ede:	4c 01 f3             	add    %r14,%rbx
 ee1:	c5 fb 11 1e          	vmovsd %xmm3,(%rsi)
 ee5:	c5 8b 59 23          	vmulsd (%rbx),%xmm14,%xmm4
 ee9:	48 8b 32             	mov    (%rdx),%rsi
 eec:	4c 01 f6             	add    %r14,%rsi
 eef:	c5 fb 11 23          	vmovsd %xmm4,(%rbx)
 ef3:	c5 8b 59 36          	vmulsd (%rsi),%xmm14,%xmm6
 ef7:	c5 fb 11 36          	vmovsd %xmm6,(%rsi)
 efb:	4c 39 e2             	cmp    %r12,%rdx
 efe:	75 80                	jne    e80 <LU_factor+0xad0>
 f00:	39 4c 24 e0          	cmp    %ecx,-0x20(%rsp)
 f04:	0f 8e 48 f8 ff ff    	jle    752 <LU_factor+0x3a2>
 f0a:	e9 83 f8 ff ff       	jmp    792 <LU_factor+0x3e2>
 f0f:	44 8b 4c 24 f4       	mov    -0xc(%rsp),%r9d
 f14:	31 d2                	xor    %edx,%edx
 f16:	e9 99 fb ff ff       	jmp    ab4 <LU_factor+0x704>
 f1b:	c4 e1 f9 7e ee       	vmovq  %xmm5,%rsi
 f20:	4a 8b 34 36          	mov    (%rsi,%r14,1),%rsi
 f24:	e9 78 fe ff ff       	jmp    da1 <LU_factor+0x9f1>
 f29:	c5 f9 2e cf          	vucomisd %xmm7,%xmm1
 f2d:	c4 c1 f9 7e d2       	vmovq  %xmm2,%r10
 f32:	43 89 0c 8a          	mov    %ecx,(%r10,%r9,4)
 f36:	7a 02                	jp     f3a <LU_factor+0xb8a>
 f38:	74 31                	je     f6b <LU_factor+0xbbb>
 f3a:	45 8d 63 ff          	lea    -0x1(%r11),%r12d
 f3e:	44 89 c9             	mov    %r9d,%ecx
 f41:	4d 8d 51 01          	lea    0x1(%r9),%r10
 f45:	45 39 e1             	cmp    %r12d,%r9d
 f48:	0f 8d fe f7 ff ff    	jge    74c <LU_factor+0x39c>
 f4e:	e9 ff f7 ff ff       	jmp    752 <LU_factor+0x3a2>
 f53:	48 8b 72 08          	mov    0x8(%rdx),%rsi
 f57:	48 83 c2 08          	add    $0x8,%rdx
 f5b:	4c 01 f6             	add    %r14,%rsi
 f5e:	c5 0b 59 3e          	vmulsd (%rsi),%xmm14,%xmm15
 f62:	c5 7b 11 3e          	vmovsd %xmm15,(%rsi)
 f66:	e9 9a fe ff ff       	jmp    e05 <LU_factor+0xa55>
 f6b:	c5 f8 77             	vzeroupper
 f6e:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
 f72:	b8 01 00 00 00       	mov    $0x1,%eax
 f77:	5b                   	pop    %rbx
 f78:	41 5c                	pop    %r12
 f7a:	41 5d                	pop    %r13
 f7c:	41 5e                	pop    %r14
 f7e:	41 5f                	pop    %r15
 f80:	5d                   	pop    %rbp
 f81:	c3                   	ret
