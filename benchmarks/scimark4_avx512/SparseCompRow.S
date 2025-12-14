
SparseCompRow.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <SparseCompRow_num_flops>:
   0:	89 f0                	mov    %esi,%eax
   2:	89 d1                	mov    %edx,%ecx
   4:	c5 f0 57 c9          	vxorps %xmm1,%xmm1,%xmm1
   8:	99                   	cltd
   9:	c5 f3 2a d9          	vcvtsi2sd %ecx,%xmm1,%xmm3
   d:	f7 ff                	idiv   %edi
   f:	29 d6                	sub    %edx,%esi
  11:	c5 f3 2a c6          	vcvtsi2sd %esi,%xmm1,%xmm0
  15:	c5 fb 58 d0          	vaddsd %xmm0,%xmm0,%xmm2
  19:	c5 eb 59 c3          	vmulsd %xmm3,%xmm2,%xmm0
  1d:	c3                   	ret
  1e:	66 90                	xchg   %ax,%ax

0000000000000020 <SparseCompRow_matmult>:
  20:	41 55                	push   %r13
  22:	41 54                	push   %r12
  24:	55                   	push   %rbp
  25:	53                   	push   %rbx
  26:	8b 6c 24 28          	mov    0x28(%rsp),%ebp
  2a:	85 ed                	test   %ebp,%ebp
  2c:	0f 8e 28 02 00 00    	jle    25a <SparseCompRow_matmult+0x23a>
  32:	85 ff                	test   %edi,%edi
  34:	0f 8e 20 02 00 00    	jle    25a <SparseCompRow_matmult+0x23a>
  3a:	48 63 ff             	movslq %edi,%rdi
  3d:	49 89 f4             	mov    %rsi,%r12
  40:	49 89 cd             	mov    %rcx,%r13
  43:	31 db                	xor    %ebx,%ebx
  45:	4c 8d 1c bd 00 00 00 	lea    0x0(,%rdi,4),%r11
  4c:	00 
  4d:	0f 1f 00             	nopl   (%rax)
  50:	31 ff                	xor    %edi,%edi
  52:	0f 1f 00             	nopl   (%rax)
  55:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  5c:	00 00 00 00 
  60:	49 63 74 3d 00       	movslq 0x0(%r13,%rdi,1),%rsi
  65:	45 8b 54 3d 04       	mov    0x4(%r13,%rdi,1),%r10d
  6a:	44 39 d6             	cmp    %r10d,%esi
  6d:	0f 8d f5 01 00 00    	jge    268 <SparseCompRow_matmult+0x248>
  73:	49 63 04 b0          	movslq (%r8,%rsi,4),%rax
  77:	48 89 f1             	mov    %rsi,%rcx
  7a:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
  7e:	48 f7 d1             	not    %rcx
  81:	c4 c1 7b 10 0c c1    	vmovsd (%r9,%rax,8),%xmm1
  87:	c5 f3 59 14 f2       	vmulsd (%rdx,%rsi,8),%xmm1,%xmm2
  8c:	44 01 d1             	add    %r10d,%ecx
  8f:	48 8d 46 01          	lea    0x1(%rsi),%rax
  93:	83 e1 07             	and    $0x7,%ecx
  96:	c5 fb 58 d2          	vaddsd %xmm2,%xmm0,%xmm2
  9a:	41 39 c2             	cmp    %eax,%r10d
  9d:	0f 8e 93 01 00 00    	jle    236 <SparseCompRow_matmult+0x216>
  a3:	85 c9                	test   %ecx,%ecx
  a5:	0f 84 d4 00 00 00    	je     17f <SparseCompRow_matmult+0x15f>
  ab:	83 f9 01             	cmp    $0x1,%ecx
  ae:	0f 84 ab 00 00 00    	je     15f <SparseCompRow_matmult+0x13f>
  b4:	83 f9 02             	cmp    $0x2,%ecx
  b7:	0f 84 8a 00 00 00    	je     147 <SparseCompRow_matmult+0x127>
  bd:	83 f9 03             	cmp    $0x3,%ecx
  c0:	74 6d                	je     12f <SparseCompRow_matmult+0x10f>
  c2:	83 f9 04             	cmp    $0x4,%ecx
  c5:	74 50                	je     117 <SparseCompRow_matmult+0xf7>
  c7:	83 f9 05             	cmp    $0x5,%ecx
  ca:	74 33                	je     ff <SparseCompRow_matmult+0xdf>
  cc:	83 f9 06             	cmp    $0x6,%ecx
  cf:	74 17                	je     e8 <SparseCompRow_matmult+0xc8>
  d1:	49 63 0c 80          	movslq (%r8,%rax,4),%rcx
  d5:	c4 c1 7b 10 1c c9    	vmovsd (%r9,%rcx,8),%xmm3
  db:	c5 e3 59 24 c2       	vmulsd (%rdx,%rax,8),%xmm3,%xmm4
  e0:	48 8d 46 02          	lea    0x2(%rsi),%rax
  e4:	c5 eb 58 d4          	vaddsd %xmm4,%xmm2,%xmm2
  e8:	49 63 34 80          	movslq (%r8,%rax,4),%rsi
  ec:	c4 c1 7b 10 2c f1    	vmovsd (%r9,%rsi,8),%xmm5
  f2:	c5 d3 59 34 c2       	vmulsd (%rdx,%rax,8),%xmm5,%xmm6
  f7:	48 83 c0 01          	add    $0x1,%rax
  fb:	c5 eb 58 d6          	vaddsd %xmm6,%xmm2,%xmm2
  ff:	49 63 0c 80          	movslq (%r8,%rax,4),%rcx
 103:	c4 c1 7b 10 3c c9    	vmovsd (%r9,%rcx,8),%xmm7
 109:	c5 43 59 04 c2       	vmulsd (%rdx,%rax,8),%xmm7,%xmm8
 10e:	48 83 c0 01          	add    $0x1,%rax
 112:	c4 c1 6b 58 d0       	vaddsd %xmm8,%xmm2,%xmm2
 117:	49 63 34 80          	movslq (%r8,%rax,4),%rsi
 11b:	c4 41 7b 10 0c f1    	vmovsd (%r9,%rsi,8),%xmm9
 121:	c5 33 59 14 c2       	vmulsd (%rdx,%rax,8),%xmm9,%xmm10
 126:	48 83 c0 01          	add    $0x1,%rax
 12a:	c4 c1 6b 58 d2       	vaddsd %xmm10,%xmm2,%xmm2
 12f:	49 63 0c 80          	movslq (%r8,%rax,4),%rcx
 133:	c4 41 7b 10 1c c9    	vmovsd (%r9,%rcx,8),%xmm11
 139:	c5 23 59 24 c2       	vmulsd (%rdx,%rax,8),%xmm11,%xmm12
 13e:	48 83 c0 01          	add    $0x1,%rax
 142:	c4 c1 6b 58 d4       	vaddsd %xmm12,%xmm2,%xmm2
 147:	49 63 34 80          	movslq (%r8,%rax,4),%rsi
 14b:	c4 41 7b 10 2c f1    	vmovsd (%r9,%rsi,8),%xmm13
 151:	c5 13 59 34 c2       	vmulsd (%rdx,%rax,8),%xmm13,%xmm14
 156:	48 83 c0 01          	add    $0x1,%rax
 15a:	c4 c1 6b 58 d6       	vaddsd %xmm14,%xmm2,%xmm2
 15f:	49 63 0c 80          	movslq (%r8,%rax,4),%rcx
 163:	c4 41 7b 10 3c c9    	vmovsd (%r9,%rcx,8),%xmm15
 169:	c5 83 59 0c c2       	vmulsd (%rdx,%rax,8),%xmm15,%xmm1
 16e:	48 83 c0 01          	add    $0x1,%rax
 172:	c5 eb 58 d1          	vaddsd %xmm1,%xmm2,%xmm2
 176:	41 39 c2             	cmp    %eax,%r10d
 179:	0f 8e b7 00 00 00    	jle    236 <SparseCompRow_matmult+0x216>
 17f:	49 63 34 80          	movslq (%r8,%rax,4),%rsi
 183:	49 63 4c 80 04       	movslq 0x4(%r8,%rax,4),%rcx
 188:	c4 c1 7b 10 04 f1    	vmovsd (%r9,%rsi,8),%xmm0
 18e:	c5 fb 59 1c c2       	vmulsd (%rdx,%rax,8),%xmm0,%xmm3
 193:	c4 c1 7b 10 2c c9    	vmovsd (%r9,%rcx,8),%xmm5
 199:	c5 d3 59 74 c2 08    	vmulsd 0x8(%rdx,%rax,8),%xmm5,%xmm6
 19f:	49 63 74 80 08       	movslq 0x8(%r8,%rax,4),%rsi
 1a4:	49 63 4c 80 0c       	movslq 0xc(%r8,%rax,4),%rcx
 1a9:	c4 41 7b 10 04 f1    	vmovsd (%r9,%rsi,8),%xmm8
 1af:	c5 3b 59 4c c2 10    	vmulsd 0x10(%rdx,%rax,8),%xmm8,%xmm9
 1b5:	c5 eb 58 e3          	vaddsd %xmm3,%xmm2,%xmm4
 1b9:	c4 41 7b 10 1c c9    	vmovsd (%r9,%rcx,8),%xmm11
 1bf:	49 63 74 80 10       	movslq 0x10(%r8,%rax,4),%rsi
 1c4:	c5 23 59 64 c2 18    	vmulsd 0x18(%rdx,%rax,8),%xmm11,%xmm12
 1ca:	49 63 4c 80 14       	movslq 0x14(%r8,%rax,4),%rcx
 1cf:	c4 41 7b 10 34 f1    	vmovsd (%r9,%rsi,8),%xmm14
 1d5:	c5 0b 59 7c c2 20    	vmulsd 0x20(%rdx,%rax,8),%xmm14,%xmm15
 1db:	c5 db 58 fe          	vaddsd %xmm6,%xmm4,%xmm7
 1df:	c4 c1 7b 10 0c c9    	vmovsd (%r9,%rcx,8),%xmm1
 1e5:	49 63 74 80 18       	movslq 0x18(%r8,%rax,4),%rsi
 1ea:	c5 f3 59 44 c2 28    	vmulsd 0x28(%rdx,%rax,8),%xmm1,%xmm0
 1f0:	49 63 4c 80 1c       	movslq 0x1c(%r8,%rax,4),%rcx
 1f5:	c4 c1 7b 10 24 f1    	vmovsd (%r9,%rsi,8),%xmm4
 1fb:	c5 db 59 6c c2 30    	vmulsd 0x30(%rdx,%rax,8),%xmm4,%xmm5
 201:	c4 41 43 58 d1       	vaddsd %xmm9,%xmm7,%xmm10
 206:	c4 c1 7b 10 3c c9    	vmovsd (%r9,%rcx,8),%xmm7
 20c:	c5 43 59 44 c2 38    	vmulsd 0x38(%rdx,%rax,8),%xmm7,%xmm8
 212:	48 83 c0 08          	add    $0x8,%rax
 216:	c4 41 2b 58 ec       	vaddsd %xmm12,%xmm10,%xmm13
 21b:	c4 c1 13 58 d7       	vaddsd %xmm15,%xmm13,%xmm2
 220:	c5 eb 58 d8          	vaddsd %xmm0,%xmm2,%xmm3
 224:	c5 e3 58 f5          	vaddsd %xmm5,%xmm3,%xmm6
 228:	c4 c1 4b 58 d0       	vaddsd %xmm8,%xmm6,%xmm2
 22d:	41 39 c2             	cmp    %eax,%r10d
 230:	0f 8f 49 ff ff ff    	jg     17f <SparseCompRow_matmult+0x15f>
 236:	c4 41 6b 58 0c 7c    	vaddsd (%r12,%rdi,2),%xmm2,%xmm9
 23c:	c4 41 7b 11 0c 7c    	vmovsd %xmm9,(%r12,%rdi,2)
 242:	48 83 c7 04          	add    $0x4,%rdi
 246:	4c 39 df             	cmp    %r11,%rdi
 249:	0f 85 11 fe ff ff    	jne    60 <SparseCompRow_matmult+0x40>
 24f:	83 c3 01             	add    $0x1,%ebx
 252:	39 dd                	cmp    %ebx,%ebp
 254:	0f 85 f6 fd ff ff    	jne    50 <SparseCompRow_matmult+0x30>
 25a:	5b                   	pop    %rbx
 25b:	5d                   	pop    %rbp
 25c:	41 5c                	pop    %r12
 25e:	41 5d                	pop    %r13
 260:	c3                   	ret
 261:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 268:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
 26c:	eb c8                	jmp    236 <SparseCompRow_matmult+0x216>
