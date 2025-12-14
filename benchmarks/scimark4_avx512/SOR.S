
SOR.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <SOR_num_flops>:
   0:	c5 fb 10 1d 00 00 00 	vmovsd 0x0(%rip),%xmm3        # 8 <SOR_num_flops+0x8>
   7:	00 
   8:	c5 f0 57 c9          	vxorps %xmm1,%xmm1,%xmm1
   c:	c5 f3 2a c7          	vcvtsi2sd %edi,%xmm1,%xmm0
  10:	c5 f3 2a d6          	vcvtsi2sd %esi,%xmm1,%xmm2
  14:	c5 f3 2a fa          	vcvtsi2sd %edx,%xmm1,%xmm7
  18:	c5 fb 5c e3          	vsubsd %xmm3,%xmm0,%xmm4
  1c:	c5 eb 5c eb          	vsubsd %xmm3,%xmm2,%xmm5
  20:	c5 db 59 f5          	vmulsd %xmm5,%xmm4,%xmm6
  24:	c5 4b 59 c7          	vmulsd %xmm7,%xmm6,%xmm8
  28:	c5 bb 59 05 00 00 00 	vmulsd 0x0(%rip),%xmm8,%xmm0        # 30 <SOR_num_flops+0x30>
  2f:	00 
  30:	c3                   	ret
  31:	0f 1f 40 00          	nopl   0x0(%rax)
  35:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  3c:	00 00 00 00 

0000000000000040 <SOR_execute>:
  40:	85 c9                	test   %ecx,%ecx
  42:	0f 8e 83 02 00 00    	jle    2cb <SOR_execute+0x28b>
  48:	83 ff 02             	cmp    $0x2,%edi
  4b:	0f 8e 7a 02 00 00    	jle    2cb <SOR_execute+0x28b>
  51:	44 8d 5e ff          	lea    -0x1(%rsi),%r11d
  55:	41 89 f2             	mov    %esi,%r10d
  58:	41 83 fb 01          	cmp    $0x1,%r11d
  5c:	0f 8e 69 02 00 00    	jle    2cb <SOR_execute+0x28b>
  62:	41 57                	push   %r15
  64:	c5 fb 59 1d 00 00 00 	vmulsd 0x0(%rip),%xmm0,%xmm3        # 6c <SOR_execute+0x2c>
  6b:	00 
  6c:	89 ce                	mov    %ecx,%esi
  6e:	41 8d 4a fb          	lea    -0x5(%r10),%ecx
  72:	41 56                	push   %r14
  74:	8d 47 fd             	lea    -0x3(%rdi),%eax
  77:	d1 e9                	shr    $1,%ecx
  79:	45 31 ff             	xor    %r15d,%r15d
  7c:	c5 fb 10 15 00 00 00 	vmovsd 0x0(%rip),%xmm2        # 84 <SOR_execute+0x44>
  83:	00 
  84:	41 55                	push   %r13
  86:	44 8d 0c 09          	lea    (%rcx,%rcx,1),%r9d
  8a:	41 54                	push   %r12
  8c:	49 83 c1 05          	add    $0x5,%r9
  90:	55                   	push   %rbp
  91:	c5 eb 5c f8          	vsubsd %xmm0,%xmm2,%xmm7
  95:	53                   	push   %rbx
  96:	48 8d 5c c2 08       	lea    0x8(%rdx,%rax,8),%rbx
  9b:	c4 e1 f9 6e f3       	vmovq  %rbx,%xmm6
  a0:	48 89 54 24 f8       	mov    %rdx,-0x8(%rsp)
  a5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  ac:	00 00 00 00 
  b0:	4c 8b 6c 24 f8       	mov    -0x8(%rsp),%r13
  b5:	c4 e1 f9 7e f2       	vmovq  %xmm6,%rdx
  ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  c0:	49 8b 45 08          	mov    0x8(%r13),%rax
  c4:	49 8b 6d 00          	mov    0x0(%r13),%rbp
  c8:	4d 8b 65 10          	mov    0x10(%r13),%r12
  cc:	41 83 fa 04          	cmp    $0x4,%r10d
  d0:	0f 8e eb 01 00 00    	jle    2c1 <SOR_execute+0x281>
  d6:	49 8d 79 fb          	lea    -0x5(%r9),%rdi
  da:	c5 7b 10 60 08       	vmovsd 0x8(%rax),%xmm12
  df:	c5 fb 10 00          	vmovsd (%rax),%xmm0
  e3:	41 b8 03 00 00 00    	mov    $0x3,%r8d
  e9:	83 e7 02             	and    $0x2,%edi
  ec:	75 72                	jne    160 <SOR_execute+0x120>
  ee:	c5 fb 10 4d 08       	vmovsd 0x8(%rbp),%xmm1
  f3:	c4 c1 43 59 e4       	vmulsd %xmm12,%xmm7,%xmm4
  f8:	c4 41 73 58 44 24 08 	vaddsd 0x8(%r12),%xmm1,%xmm8
  ff:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 105:	c5 fb 10 68 10       	vmovsd 0x10(%rax),%xmm5
 10a:	c5 7b 10 60 18       	vmovsd 0x18(%rax),%xmm12
 10f:	bb 03 00 00 00       	mov    $0x3,%ebx
 114:	c5 bb 58 c0          	vaddsd %xmm0,%xmm8,%xmm0
 118:	c5 7b 58 cd          	vaddsd %xmm5,%xmm0,%xmm9
 11c:	c5 d3 59 ef          	vmulsd %xmm7,%xmm5,%xmm5
 120:	c5 33 59 d3          	vmulsd %xmm3,%xmm9,%xmm10
 124:	c5 2b 58 dc          	vaddsd %xmm4,%xmm10,%xmm11
 128:	c5 7b 11 58 08       	vmovsd %xmm11,0x8(%rax)
 12d:	c4 41 7b 10 6c 24 10 	vmovsd 0x10(%r12),%xmm13
 134:	c5 13 58 75 10       	vaddsd 0x10(%rbp),%xmm13,%xmm14
 139:	c4 41 0b 58 fb       	vaddsd %xmm11,%xmm14,%xmm15
 13e:	c4 c1 03 58 d4       	vaddsd %xmm12,%xmm15,%xmm2
 143:	c5 eb 59 cb          	vmulsd %xmm3,%xmm2,%xmm1
 147:	c5 f3 58 c5          	vaddsd %xmm5,%xmm1,%xmm0
 14b:	c5 fb 11 40 10       	vmovsd %xmm0,0x10(%rax)
 150:	4d 39 c8             	cmp    %r9,%r8
 153:	0f 84 dc 00 00 00    	je     235 <SOR_execute+0x1f5>
 159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 160:	c4 21 7b 10 4c c5 f0 	vmovsd -0x10(%rbp,%r8,8),%xmm9
 167:	c4 41 43 59 e4       	vmulsd %xmm12,%xmm7,%xmm12
 16c:	c4 01 33 58 54 c4 f0 	vaddsd -0x10(%r12,%r8,8),%xmm9,%xmm10
 173:	49 8d 58 02          	lea    0x2(%r8),%rbx
 177:	c4 21 7b 10 44 c0 f8 	vmovsd -0x8(%rax,%r8,8),%xmm8
 17e:	c4 21 7b 10 3c c0    	vmovsd (%rax,%r8,8),%xmm15
 184:	c5 ab 58 e0          	vaddsd %xmm0,%xmm10,%xmm4
 188:	c4 41 5b 58 d8       	vaddsd %xmm8,%xmm4,%xmm11
 18d:	c5 3b 59 c7          	vmulsd %xmm7,%xmm8,%xmm8
 191:	c5 23 59 eb          	vmulsd %xmm3,%xmm11,%xmm13
 195:	c4 41 13 58 f4       	vaddsd %xmm12,%xmm13,%xmm14
 19a:	c4 21 7b 11 74 c0 f0 	vmovsd %xmm14,-0x10(%rax,%r8,8)
 1a1:	c4 81 7b 10 54 c4 f8 	vmovsd -0x8(%r12,%r8,8),%xmm2
 1a8:	c4 a1 6b 58 4c c5 f8 	vaddsd -0x8(%rbp,%r8,8),%xmm2,%xmm1
 1af:	c4 c1 73 58 ee       	vaddsd %xmm14,%xmm1,%xmm5
 1b4:	c4 c1 53 58 c7       	vaddsd %xmm15,%xmm5,%xmm0
 1b9:	c4 41 43 59 ff       	vmulsd %xmm15,%xmm7,%xmm15
 1be:	c5 7b 59 cb          	vmulsd %xmm3,%xmm0,%xmm9
 1c2:	c4 41 33 58 d0       	vaddsd %xmm8,%xmm9,%xmm10
 1c7:	c4 21 7b 11 54 c0 f8 	vmovsd %xmm10,-0x8(%rax,%r8,8)
 1ce:	c5 fb 10 64 dd f0    	vmovsd -0x10(%rbp,%rbx,8),%xmm4
 1d4:	49 83 c0 04          	add    $0x4,%r8
 1d8:	c4 41 5b 58 6c dc f0 	vaddsd -0x10(%r12,%rbx,8),%xmm4,%xmm13
 1df:	c5 7b 10 5c d8 f8    	vmovsd -0x8(%rax,%rbx,8),%xmm11
 1e5:	c4 41 13 58 e2       	vaddsd %xmm10,%xmm13,%xmm12
 1ea:	c4 41 1b 58 f3       	vaddsd %xmm11,%xmm12,%xmm14
 1ef:	c5 7b 10 24 d8       	vmovsd (%rax,%rbx,8),%xmm12
 1f4:	c5 23 59 df          	vmulsd %xmm7,%xmm11,%xmm11
 1f8:	c5 8b 59 d3          	vmulsd %xmm3,%xmm14,%xmm2
 1fc:	c4 c1 6b 58 cf       	vaddsd %xmm15,%xmm2,%xmm1
 201:	c5 fb 11 4c d8 f0    	vmovsd %xmm1,-0x10(%rax,%rbx,8)
 207:	c4 c1 7b 10 6c dc f8 	vmovsd -0x8(%r12,%rbx,8),%xmm5
 20e:	c5 d3 58 44 dd f8    	vaddsd -0x8(%rbp,%rbx,8),%xmm5,%xmm0
 214:	c5 7b 58 c9          	vaddsd %xmm1,%xmm0,%xmm9
 218:	c4 41 33 58 c4       	vaddsd %xmm12,%xmm9,%xmm8
 21d:	c5 3b 59 d3          	vmulsd %xmm3,%xmm8,%xmm10
 221:	c4 c1 2b 58 c3       	vaddsd %xmm11,%xmm10,%xmm0
 226:	c5 fb 11 44 d8 f8    	vmovsd %xmm0,-0x8(%rax,%rbx,8)
 22c:	4d 39 c8             	cmp    %r9,%r8
 22f:	0f 85 2b ff ff ff    	jne    160 <SOR_execute+0x120>
 235:	48 63 cb             	movslq %ebx,%rcx
 238:	83 c3 01             	add    $0x1,%ebx
 23b:	4c 8d 71 01          	lea    0x1(%rcx),%r14
 23f:	c4 c1 7b 10 24 cc    	vmovsd (%r12,%rcx,8),%xmm4
 245:	c5 43 59 3c c8       	vmulsd (%rax,%rcx,8),%xmm7,%xmm15
 24a:	c5 5b 58 6c cd 00    	vaddsd 0x0(%rbp,%rcx,8),%xmm4,%xmm13
 250:	c5 13 58 64 c8 f8    	vaddsd -0x8(%rax,%rcx,8),%xmm13,%xmm12
 256:	c4 21 1b 58 34 f0    	vaddsd (%rax,%r14,8),%xmm12,%xmm14
 25c:	c5 8b 59 d3          	vmulsd %xmm3,%xmm14,%xmm2
 260:	c4 c1 6b 58 ef       	vaddsd %xmm15,%xmm2,%xmm5
 265:	c5 fb 11 2c c8       	vmovsd %xmm5,(%rax,%rcx,8)
 26a:	41 39 db             	cmp    %ebx,%r11d
 26d:	7e 2d                	jle    29c <SOR_execute+0x25c>
 26f:	c4 81 7b 10 0c f4    	vmovsd (%r12,%r14,8),%xmm1
 275:	c4 a1 73 58 44 f5 00 	vaddsd 0x0(%rbp,%r14,8),%xmm1,%xmm0
 27c:	c4 21 43 59 1c f0    	vmulsd (%rax,%r14,8),%xmm7,%xmm11
 282:	c5 7b 58 cd          	vaddsd %xmm5,%xmm0,%xmm9
 286:	c4 21 33 58 44 f0 08 	vaddsd 0x8(%rax,%r14,8),%xmm9,%xmm8
 28d:	c5 3b 59 d3          	vmulsd %xmm3,%xmm8,%xmm10
 291:	c4 c1 2b 58 e3       	vaddsd %xmm11,%xmm10,%xmm4
 296:	c4 a1 7b 11 24 f0    	vmovsd %xmm4,(%rax,%r14,8)
 29c:	49 83 c5 08          	add    $0x8,%r13
 2a0:	49 39 d5             	cmp    %rdx,%r13
 2a3:	0f 85 17 fe ff ff    	jne    c0 <SOR_execute+0x80>
 2a9:	41 83 c7 01          	add    $0x1,%r15d
 2ad:	44 39 fe             	cmp    %r15d,%esi
 2b0:	0f 85 fa fd ff ff    	jne    b0 <SOR_execute+0x70>
 2b6:	5b                   	pop    %rbx
 2b7:	5d                   	pop    %rbp
 2b8:	41 5c                	pop    %r12
 2ba:	41 5d                	pop    %r13
 2bc:	41 5e                	pop    %r14
 2be:	41 5f                	pop    %r15
 2c0:	c3                   	ret
 2c1:	bb 01 00 00 00       	mov    $0x1,%ebx
 2c6:	e9 6a ff ff ff       	jmp    235 <SOR_execute+0x1f5>
 2cb:	c3                   	ret
