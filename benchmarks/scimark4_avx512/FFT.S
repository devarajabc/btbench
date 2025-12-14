
FFT.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <FFT_num_flops>:
   0:	83 ff 01             	cmp    $0x1,%edi
   3:	7e 53                	jle    58 <FFT_num_flops+0x58>
   5:	31 c9                	xor    %ecx,%ecx
   7:	ba 01 00 00 00       	mov    $0x1,%edx
   c:	0f 1f 40 00          	nopl   0x0(%rax)
  10:	01 d2                	add    %edx,%edx
  12:	83 c1 01             	add    $0x1,%ecx
  15:	39 d7                	cmp    %edx,%edi
  17:	7f f7                	jg     10 <FFT_num_flops+0x10>
  19:	b8 01 00 00 00       	mov    $0x1,%eax
  1e:	d3 e0                	shl    %cl,%eax
  20:	39 c7                	cmp    %eax,%edi
  22:	75 3d                	jne    61 <FFT_num_flops+0x61>
  24:	c5 e8 57 d2          	vxorps %xmm2,%xmm2,%xmm2
  28:	c5 eb 2a cf          	vcvtsi2sd %edi,%xmm2,%xmm1
  2c:	c5 f3 59 05 00 00 00 	vmulsd 0x0(%rip),%xmm1,%xmm0        # 34 <FFT_num_flops+0x34>
  33:	00 
  34:	c5 f3 58 35 00 00 00 	vaddsd 0x0(%rip),%xmm1,%xmm6        # 3c <FFT_num_flops+0x3c>
  3b:	00 
  3c:	c5 eb 2a e1          	vcvtsi2sd %ecx,%xmm2,%xmm4
  40:	c5 fb 5c 1d 00 00 00 	vsubsd 0x0(%rip),%xmm0,%xmm3        # 48 <FFT_num_flops+0x48>
  47:	00 
  48:	c5 cb 58 fe          	vaddsd %xmm6,%xmm6,%xmm7
  4c:	c5 e3 59 ec          	vmulsd %xmm4,%xmm3,%xmm5
  50:	c5 d3 58 c7          	vaddsd %xmm7,%xmm5,%xmm0
  54:	c3                   	ret
  55:	0f 1f 00             	nopl   (%rax)
  58:	b8 01 00 00 00       	mov    $0x1,%eax
  5d:	31 c9                	xor    %ecx,%ecx
  5f:	eb bf                	jmp    20 <FFT_num_flops+0x20>
  61:	50                   	push   %rax
  62:	89 fe                	mov    %edi,%esi
  64:	31 c0                	xor    %eax,%eax
  66:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 6d <FFT_num_flops+0x6d>
  6d:	e8 00 00 00 00       	call   72 <FFT_num_flops+0x72>
  72:	bf 01 00 00 00       	mov    $0x1,%edi
  77:	e8 00 00 00 00       	call   7c <FFT_num_flops+0x7c>
  7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000080 <FFT_bitreverse>:
  80:	89 f8                	mov    %edi,%eax
  82:	49 89 f2             	mov    %rsi,%r10
  85:	c1 e8 1f             	shr    $0x1f,%eax
  88:	01 c7                	add    %eax,%edi
  8a:	41 89 f9             	mov    %edi,%r9d
  8d:	41 d1 f9             	sar    $1,%r9d
  90:	41 83 e9 01          	sub    $0x1,%r9d
  94:	45 85 c9             	test   %r9d,%r9d
  97:	7e 5f                	jle    f8 <FFT_bitreverse+0x78>
  99:	c1 ff 02             	sar    $0x2,%edi
  9c:	31 d2                	xor    %edx,%edx
  9e:	31 c9                	xor    %ecx,%ecx
  a0:	41 89 f8             	mov    %edi,%r8d
  a3:	39 fa                	cmp    %edi,%edx
  a5:	7c 14                	jl     bb <FFT_bitreverse+0x3b>
  a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  ae:	00 00 
  b0:	44 29 c2             	sub    %r8d,%edx
  b3:	41 d1 f8             	sar    $1,%r8d
  b6:	44 39 c2             	cmp    %r8d,%edx
  b9:	7d f5                	jge    b0 <FFT_bitreverse+0x30>
  bb:	83 c1 01             	add    $0x1,%ecx
  be:	41 39 c9             	cmp    %ecx,%r9d
  c1:	74 35                	je     f8 <FFT_bitreverse+0x78>
  c3:	44 01 c2             	add    %r8d,%edx
  c6:	48 83 c6 10          	add    $0x10,%rsi
  ca:	39 ca                	cmp    %ecx,%edx
  cc:	7e d2                	jle    a0 <FFT_bitreverse+0x20>
  ce:	8d 04 12             	lea    (%rdx,%rdx,1),%eax
  d1:	c5 f9 10 06          	vmovupd (%rsi),%xmm0
  d5:	48 98                	cltq
  d7:	c4 c1 7b 10 0c c2    	vmovsd (%r10,%rax,8),%xmm1
  dd:	c5 fb 11 0e          	vmovsd %xmm1,(%rsi)
  e1:	c4 c1 7b 10 54 c2 08 	vmovsd 0x8(%r10,%rax,8),%xmm2
  e8:	c5 fb 11 56 08       	vmovsd %xmm2,0x8(%rsi)
  ed:	c4 c1 79 11 04 c2    	vmovupd %xmm0,(%r10,%rax,8)
  f3:	eb ab                	jmp    a0 <FFT_bitreverse+0x20>
  f5:	0f 1f 00             	nopl   (%rax)
  f8:	c3                   	ret
  f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000100 <FFT_transform_internal>:
 100:	41 57                	push   %r15
 102:	41 56                	push   %r14
 104:	41 55                	push   %r13
 106:	41 54                	push   %r12
 108:	41 89 fc             	mov    %edi,%r12d
 10b:	55                   	push   %rbp
 10c:	41 c1 ec 1f          	shr    $0x1f,%r12d
 110:	53                   	push   %rbx
 111:	41 01 fc             	add    %edi,%r12d
 114:	41 d1 fc             	sar    $1,%r12d
 117:	48 83 ec 38          	sub    $0x38,%rsp
 11b:	41 83 fc 01          	cmp    $0x1,%r12d
 11f:	0f 84 03 02 00 00    	je     328 <FFT_transform_internal+0x228>
 125:	41 89 d3             	mov    %edx,%r11d
 128:	49 89 f7             	mov    %rsi,%r15
 12b:	83 ff 03             	cmp    $0x3,%edi
 12e:	0f 8e 03 02 00 00    	jle    337 <FFT_transform_internal+0x237>
 134:	45 31 f6             	xor    %r14d,%r14d
 137:	b8 01 00 00 00       	mov    $0x1,%eax
 13c:	0f 1f 40 00          	nopl   0x0(%rax)
 140:	01 c0                	add    %eax,%eax
 142:	41 83 c6 01          	add    $0x1,%r14d
 146:	41 39 c4             	cmp    %eax,%r12d
 149:	7f f5                	jg     140 <FFT_transform_internal+0x40>
 14b:	ba 01 00 00 00       	mov    $0x1,%edx
 150:	44 89 f1             	mov    %r14d,%ecx
 153:	d3 e2                	shl    %cl,%edx
 155:	41 39 d4             	cmp    %edx,%r12d
 158:	0f 85 d9 01 00 00    	jne    337 <FFT_transform_internal+0x237>
 15e:	4c 89 fe             	mov    %r15,%rsi
 161:	c5 c1 57 ff          	vxorpd %xmm7,%xmm7,%xmm7
 165:	41 bd 01 00 00 00    	mov    $0x1,%r13d
 16b:	31 db                	xor    %ebx,%ebx
 16d:	e8 00 00 00 00       	call   172 <FFT_transform_internal+0x72>
 172:	c4 c1 43 2a c3       	vcvtsi2sd %r11d,%xmm7,%xmm0
 177:	c5 fb 58 c8          	vaddsd %xmm0,%xmm0,%xmm1
 17b:	c5 f3 59 15 00 00 00 	vmulsd 0x0(%rip),%xmm1,%xmm2        # 183 <FFT_transform_internal+0x83>
 182:	00 
 183:	c5 fb 11 54 24 28    	vmovsd %xmm2,0x28(%rsp)
 189:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 190:	4d 63 cd             	movslq %r13d,%r9
 193:	4d 89 fa             	mov    %r15,%r10
 196:	45 01 ed             	add    %r13d,%r13d
 199:	31 f6                	xor    %esi,%esi
 19b:	42 8d 2c 8d 00 00 00 	lea    0x0(,%r9,4),%ebp
 1a2:	00 
 1a3:	4c 89 cf             	mov    %r9,%rdi
 1a6:	49 c1 e1 04          	shl    $0x4,%r9
 1aa:	48 63 ed             	movslq %ebp,%rbp
 1ad:	4f 8d 04 0f          	lea    (%r15,%r9,1),%r8
 1b1:	48 c1 e5 03          	shl    $0x3,%rbp
 1b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
 1bc:	00 00 00 00 
 1c0:	c4 c1 79 10 18       	vmovupd (%r8),%xmm3
 1c5:	c4 c1 7b 10 2a       	vmovsd (%r10),%xmm5
 1ca:	44 01 ee             	add    %r13d,%esi
 1cd:	c5 d3 5c f3          	vsubsd %xmm3,%xmm5,%xmm6
 1d1:	c5 61 15 c3          	vunpckhpd %xmm3,%xmm3,%xmm8
 1d5:	c4 c1 7b 11 30       	vmovsd %xmm6,(%r8)
 1da:	c4 41 7b 10 4a 08    	vmovsd 0x8(%r10),%xmm9
 1e0:	c4 41 33 5c d0       	vsubsd %xmm8,%xmm9,%xmm10
 1e5:	c4 41 7b 11 50 08    	vmovsd %xmm10,0x8(%r8)
 1eb:	c4 41 61 58 1a       	vaddpd (%r10),%xmm3,%xmm11
 1f0:	49 01 e8             	add    %rbp,%r8
 1f3:	c4 41 79 11 1a       	vmovupd %xmm11,(%r10)
 1f8:	49 01 ea             	add    %rbp,%r10
 1fb:	41 39 f4             	cmp    %esi,%r12d
 1fe:	7f c0                	jg     1c0 <FFT_transform_internal+0xc0>
 200:	83 ff 01             	cmp    $0x1,%edi
 203:	0f 8e 13 01 00 00    	jle    31c <FFT_transform_internal+0x21c>
 209:	c4 41 19 57 e4       	vxorpd %xmm12,%xmm12,%xmm12
 20e:	c5 7b 10 7c 24 28    	vmovsd 0x28(%rsp),%xmm15
 214:	4c 89 4c 24 20       	mov    %r9,0x20(%rsp)
 219:	c5 1b 2a ef          	vcvtsi2sd %edi,%xmm12,%xmm13
 21d:	c4 41 13 58 f5       	vaddsd %xmm13,%xmm13,%xmm14
 222:	89 7c 24 1c          	mov    %edi,0x1c(%rsp)
 226:	c4 c1 03 5e fe       	vdivsd %xmm14,%xmm15,%xmm7
 22b:	c5 c3 10 c7          	vmovsd %xmm7,%xmm7,%xmm0
 22f:	c5 fb 11 7c 24 10    	vmovsd %xmm7,0x10(%rsp)
 235:	e8 00 00 00 00       	call   23a <FFT_transform_internal+0x13a>
 23a:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
 240:	c5 fb 10 44 24 10    	vmovsd 0x10(%rsp),%xmm0
 246:	c5 fb 59 05 00 00 00 	vmulsd 0x0(%rip),%xmm0,%xmm0        # 24e <FFT_transform_internal+0x14e>
 24d:	00 
 24e:	e8 00 00 00 00       	call   253 <FFT_transform_internal+0x153>
 253:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
 258:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
 25c:	4d 8d 5f 10          	lea    0x10(%r15),%r11
 260:	c5 fb 58 c8          	vaddsd %xmm0,%xmm0,%xmm1
 264:	bf 01 00 00 00       	mov    $0x1,%edi
 269:	c5 7b 10 15 00 00 00 	vmovsd 0x0(%rip),%xmm10        # 271 <FFT_transform_internal+0x171>
 270:	00 
 271:	c5 7b 10 44 24 08    	vmovsd 0x8(%rsp),%xmm8
 277:	c4 41 09 57 f6       	vxorpd %xmm14,%xmm14,%xmm14
 27c:	c5 73 59 c8          	vmulsd %xmm0,%xmm1,%xmm9
 280:	c5 2b 11 d2          	vmovsd %xmm10,%xmm10,%xmm2
 284:	4b 8d 14 19          	lea    (%r9,%r11,1),%rdx
 288:	4c 89 d8             	mov    %r11,%rax
 28b:	45 31 c0             	xor    %r8d,%r8d
 28e:	c4 c1 3b 59 de       	vmulsd %xmm14,%xmm8,%xmm3
 293:	c5 3b 59 e2          	vmulsd %xmm2,%xmm8,%xmm12
 297:	c4 c1 33 59 ea       	vmulsd %xmm10,%xmm9,%xmm5
 29c:	c4 c1 33 59 f6       	vmulsd %xmm14,%xmm9,%xmm6
 2a1:	c5 ab 5c e3          	vsubsd %xmm3,%xmm10,%xmm4
 2a5:	c4 41 1b 58 ee       	vaddsd %xmm14,%xmm12,%xmm13
 2aa:	c5 5b 5c d5          	vsubsd %xmm5,%xmm4,%xmm10
 2ae:	c5 13 5c f6          	vsubsd %xmm6,%xmm13,%xmm14
 2b2:	c4 41 7b 12 da       	vmovddup %xmm10,%xmm11
 2b7:	c4 41 7b 12 fe       	vmovddup %xmm14,%xmm15
 2bc:	0f 1f 40 00          	nopl   0x0(%rax)
 2c0:	c5 f9 10 3a          	vmovupd (%rdx),%xmm7
 2c4:	c5 fb 10 28          	vmovsd (%rax),%xmm5
 2c8:	45 01 e8             	add    %r13d,%r8d
 2cb:	c4 c1 41 59 c3       	vmulpd %xmm11,%xmm7,%xmm0
 2d0:	c4 e3 79 05 cf 01    	vpermilpd $0x1,%xmm7,%xmm1
 2d6:	c4 c1 71 59 d7       	vmulpd %xmm15,%xmm1,%xmm2
 2db:	c5 f9 d0 da          	vaddsubpd %xmm2,%xmm0,%xmm3
 2df:	c5 53 5c e3          	vsubsd %xmm3,%xmm5,%xmm12
 2e3:	c5 61 15 eb          	vunpckhpd %xmm3,%xmm3,%xmm13
 2e7:	c5 7b 11 22          	vmovsd %xmm12,(%rdx)
 2eb:	c5 fb 10 70 08       	vmovsd 0x8(%rax),%xmm6
 2f0:	c4 c1 4b 5c fd       	vsubsd %xmm13,%xmm6,%xmm7
 2f5:	c5 fb 11 7a 08       	vmovsd %xmm7,0x8(%rdx)
 2fa:	c5 e1 58 00          	vaddpd (%rax),%xmm3,%xmm0
 2fe:	48 01 ea             	add    %rbp,%rdx
 301:	c5 f9 11 00          	vmovupd %xmm0,(%rax)
 305:	48 01 e8             	add    %rbp,%rax
 308:	45 39 c4             	cmp    %r8d,%r12d
 30b:	7f b3                	jg     2c0 <FFT_transform_internal+0x1c0>
 30d:	83 c7 01             	add    $0x1,%edi
 310:	49 83 c3 10          	add    $0x10,%r11
 314:	39 cf                	cmp    %ecx,%edi
 316:	0f 85 64 ff ff ff    	jne    280 <FFT_transform_internal+0x180>
 31c:	83 c3 01             	add    $0x1,%ebx
 31f:	44 39 f3             	cmp    %r14d,%ebx
 322:	0f 85 68 fe ff ff    	jne    190 <FFT_transform_internal+0x90>
 328:	48 83 c4 38          	add    $0x38,%rsp
 32c:	5b                   	pop    %rbx
 32d:	5d                   	pop    %rbp
 32e:	41 5c                	pop    %r12
 330:	41 5d                	pop    %r13
 332:	41 5e                	pop    %r14
 334:	41 5f                	pop    %r15
 336:	c3                   	ret
 337:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 33e <FFT_transform_internal+0x23e>
 33e:	44 89 e6             	mov    %r12d,%esi
 341:	31 c0                	xor    %eax,%eax
 343:	e8 00 00 00 00       	call   348 <FFT_transform_internal+0x248>
 348:	bf 01 00 00 00       	mov    $0x1,%edi
 34d:	e8 00 00 00 00       	call   352 <FFT_transform_internal+0x252>
 352:	0f 1f 00             	nopl   (%rax)
 355:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
 35c:	00 00 00 00 

0000000000000360 <FFT_transform>:
 360:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 365:	e9 96 fd ff ff       	jmp    100 <FFT_transform_internal>
 36a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000370 <FFT_inverse>:
 370:	55                   	push   %rbp
 371:	ba 01 00 00 00       	mov    $0x1,%edx
 376:	48 89 e5             	mov    %rsp,%rbp
 379:	41 54                	push   %r12
 37b:	49 89 f4             	mov    %rsi,%r12
 37e:	53                   	push   %rbx
 37f:	89 fb                	mov    %edi,%ebx
 381:	48 83 e4 c0          	and    $0xffffffffffffffc0,%rsp
 385:	e8 76 fd ff ff       	call   100 <FFT_transform_internal>
 38a:	85 db                	test   %ebx,%ebx
 38c:	0f 8e e9 01 00 00    	jle    57b <FFT_inverse+0x20b>
 392:	c5 fb 10 0d 00 00 00 	vmovsd 0x0(%rip),%xmm1        # 39a <FFT_inverse+0x2a>
 399:	00 
 39a:	89 d8                	mov    %ebx,%eax
 39c:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 3a0:	8d 53 ff             	lea    -0x1(%rbx),%edx
 3a3:	d1 f8                	sar    $1,%eax
 3a5:	c5 fb 2a d0          	vcvtsi2sd %eax,%xmm0,%xmm2
 3a9:	c5 f3 5e da          	vdivsd %xmm2,%xmm1,%xmm3
 3ad:	83 fa 06             	cmp    $0x6,%edx
 3b0:	0f 86 ea 01 00 00    	jbe    5a0 <FFT_inverse+0x230>
 3b6:	89 de                	mov    %ebx,%esi
 3b8:	62 f2 fd 48 19 e3    	vbroadcastsd %xmm3,%zmm4
 3be:	4d 89 e1             	mov    %r12,%r9
 3c1:	c1 ee 03             	shr    $0x3,%esi
 3c4:	48 c1 e6 06          	shl    $0x6,%rsi
 3c8:	4d 8d 04 34          	lea    (%r12,%rsi,1),%r8
 3cc:	48 83 ee 40          	sub    $0x40,%rsi
 3d0:	48 c1 ee 06          	shr    $0x6,%rsi
 3d4:	48 83 c6 01          	add    $0x1,%rsi
 3d8:	83 e6 07             	and    $0x7,%esi
 3db:	0f 84 93 00 00 00    	je     474 <FFT_inverse+0x104>
 3e1:	48 83 fe 01          	cmp    $0x1,%rsi
 3e5:	74 77                	je     45e <FFT_inverse+0xee>
 3e7:	48 83 fe 02          	cmp    $0x2,%rsi
 3eb:	74 60                	je     44d <FFT_inverse+0xdd>
 3ed:	48 83 fe 03          	cmp    $0x3,%rsi
 3f1:	74 49                	je     43c <FFT_inverse+0xcc>
 3f3:	48 83 fe 04          	cmp    $0x4,%rsi
 3f7:	74 32                	je     42b <FFT_inverse+0xbb>
 3f9:	48 83 fe 05          	cmp    $0x5,%rsi
 3fd:	74 1b                	je     41a <FFT_inverse+0xaa>
 3ff:	48 83 fe 06          	cmp    $0x6,%rsi
 403:	0f 85 7f 01 00 00    	jne    588 <FFT_inverse+0x218>
 409:	62 d1 dd 48 59 31    	vmulpd (%r9),%zmm4,%zmm6
 40f:	49 83 c1 40          	add    $0x40,%r9
 413:	62 d1 fd 48 11 71 ff 	vmovupd %zmm6,-0x40(%r9)
 41a:	62 d1 dd 48 59 39    	vmulpd (%r9),%zmm4,%zmm7
 420:	49 83 c1 40          	add    $0x40,%r9
 424:	62 d1 fd 48 11 79 ff 	vmovupd %zmm7,-0x40(%r9)
 42b:	62 51 dd 48 59 01    	vmulpd (%r9),%zmm4,%zmm8
 431:	49 83 c1 40          	add    $0x40,%r9
 435:	62 51 fd 48 11 41 ff 	vmovupd %zmm8,-0x40(%r9)
 43c:	62 51 dd 48 59 09    	vmulpd (%r9),%zmm4,%zmm9
 442:	49 83 c1 40          	add    $0x40,%r9
 446:	62 51 fd 48 11 49 ff 	vmovupd %zmm9,-0x40(%r9)
 44d:	62 51 dd 48 59 11    	vmulpd (%r9),%zmm4,%zmm10
 453:	49 83 c1 40          	add    $0x40,%r9
 457:	62 51 fd 48 11 51 ff 	vmovupd %zmm10,-0x40(%r9)
 45e:	62 51 dd 48 59 19    	vmulpd (%r9),%zmm4,%zmm11
 464:	49 83 c1 40          	add    $0x40,%r9
 468:	62 51 fd 48 11 59 ff 	vmovupd %zmm11,-0x40(%r9)
 46f:	4d 39 c8             	cmp    %r9,%r8
 472:	74 7b                	je     4ef <FFT_inverse+0x17f>
 474:	62 51 dd 48 59 21    	vmulpd (%r9),%zmm4,%zmm12
 47a:	49 81 c1 00 02 00 00 	add    $0x200,%r9
 481:	62 51 dd 48 59 69 f9 	vmulpd -0x1c0(%r9),%zmm4,%zmm13
 488:	62 51 dd 48 59 71 fa 	vmulpd -0x180(%r9),%zmm4,%zmm14
 48f:	62 51 dd 48 59 79 fb 	vmulpd -0x140(%r9),%zmm4,%zmm15
 496:	62 d1 dd 48 59 41 fc 	vmulpd -0x100(%r9),%zmm4,%zmm0
 49d:	62 d1 dd 48 59 51 fd 	vmulpd -0xc0(%r9),%zmm4,%zmm2
 4a4:	62 51 fd 48 11 61 f8 	vmovupd %zmm12,-0x200(%r9)
 4ab:	62 d1 dd 48 59 49 fe 	vmulpd -0x80(%r9),%zmm4,%zmm1
 4b2:	62 51 fd 48 11 69 f9 	vmovupd %zmm13,-0x1c0(%r9)
 4b9:	62 d1 dd 48 59 69 ff 	vmulpd -0x40(%r9),%zmm4,%zmm5
 4c0:	62 51 fd 48 11 71 fa 	vmovupd %zmm14,-0x180(%r9)
 4c7:	62 51 fd 48 11 79 fb 	vmovupd %zmm15,-0x140(%r9)
 4ce:	62 d1 fd 48 11 41 fc 	vmovupd %zmm0,-0x100(%r9)
 4d5:	62 d1 fd 48 11 51 fd 	vmovupd %zmm2,-0xc0(%r9)
 4dc:	62 d1 fd 48 11 49 fe 	vmovupd %zmm1,-0x80(%r9)
 4e3:	62 d1 fd 48 11 69 ff 	vmovupd %zmm5,-0x40(%r9)
 4ea:	4d 39 c8             	cmp    %r9,%r8
 4ed:	75 85                	jne    474 <FFT_inverse+0x104>
 4ef:	89 df                	mov    %ebx,%edi
 4f1:	83 e7 f8             	and    $0xfffffff8,%edi
 4f4:	89 f9                	mov    %edi,%ecx
 4f6:	39 fb                	cmp    %edi,%ebx
 4f8:	74 7e                	je     578 <FFT_inverse+0x208>
 4fa:	41 89 da             	mov    %ebx,%r10d
 4fd:	41 29 ca             	sub    %ecx,%r10d
 500:	45 8d 5a ff          	lea    -0x1(%r10),%r11d
 504:	41 83 fb 02          	cmp    $0x2,%r11d
 508:	76 1e                	jbe    528 <FFT_inverse+0x1b8>
 50a:	c4 e2 7d 19 e3       	vbroadcastsd %xmm3,%ymm4
 50f:	c4 c1 5d 59 34 cc    	vmulpd (%r12,%rcx,8),%ymm4,%ymm6
 515:	c4 c1 7d 11 34 cc    	vmovupd %ymm6,(%r12,%rcx,8)
 51b:	41 f6 c2 03          	test   $0x3,%r10b
 51f:	74 57                	je     578 <FFT_inverse+0x208>
 521:	41 83 e2 fc          	and    $0xfffffffc,%r10d
 525:	44 01 d7             	add    %r10d,%edi
 528:	48 63 c7             	movslq %edi,%rax
 52b:	8d 57 01             	lea    0x1(%rdi),%edx
 52e:	48 c1 e0 03          	shl    $0x3,%rax
 532:	c4 c1 63 59 3c 04    	vmulsd (%r12,%rax,1),%xmm3,%xmm7
 538:	c4 c1 7b 11 3c 04    	vmovsd %xmm7,(%r12,%rax,1)
 53e:	39 d3                	cmp    %edx,%ebx
 540:	7e 36                	jle    578 <FFT_inverse+0x208>
 542:	c4 41 63 59 44 04 08 	vmulsd 0x8(%r12,%rax,1),%xmm3,%xmm8
 549:	83 c7 02             	add    $0x2,%edi
 54c:	c4 41 7b 11 44 04 08 	vmovsd %xmm8,0x8(%r12,%rax,1)
 553:	39 fb                	cmp    %edi,%ebx
 555:	7e 21                	jle    578 <FFT_inverse+0x208>
 557:	c4 c1 63 59 5c 04 10 	vmulsd 0x10(%r12,%rax,1),%xmm3,%xmm3
 55e:	c4 c1 7b 11 5c 04 10 	vmovsd %xmm3,0x10(%r12,%rax,1)
 565:	c5 f8 77             	vzeroupper
 568:	48 8d 65 f0          	lea    -0x10(%rbp),%rsp
 56c:	5b                   	pop    %rbx
 56d:	41 5c                	pop    %r12
 56f:	5d                   	pop    %rbp
 570:	c3                   	ret
 571:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 578:	c5 f8 77             	vzeroupper
 57b:	48 8d 65 f0          	lea    -0x10(%rbp),%rsp
 57f:	5b                   	pop    %rbx
 580:	41 5c                	pop    %r12
 582:	5d                   	pop    %rbp
 583:	c3                   	ret
 584:	0f 1f 40 00          	nopl   0x0(%rax)
 588:	62 d1 dd 48 59 2c 24 	vmulpd (%r12),%zmm4,%zmm5
 58f:	4d 8d 4c 24 40       	lea    0x40(%r12),%r9
 594:	62 d1 fd 48 11 2c 24 	vmovupd %zmm5,(%r12)
 59b:	e9 69 fe ff ff       	jmp    409 <FFT_inverse+0x99>
 5a0:	31 c9                	xor    %ecx,%ecx
 5a2:	31 ff                	xor    %edi,%edi
 5a4:	e9 51 ff ff ff       	jmp    4fa <FFT_inverse+0x18a>
