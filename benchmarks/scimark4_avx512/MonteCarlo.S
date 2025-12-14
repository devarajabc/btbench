
MonteCarlo.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <MonteCarlo_num_flops>:
   0:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
   4:	c5 fb 2a cf          	vcvtsi2sd %edi,%xmm0,%xmm1
   8:	c5 f3 59 05 00 00 00 	vmulsd 0x0(%rip),%xmm1,%xmm0        # 10 <MonteCarlo_num_flops+0x10>
   f:	00 
  10:	c3                   	ret
  11:	0f 1f 40 00          	nopl   0x0(%rax)
  15:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  1c:	00 00 00 00 

0000000000000020 <MonteCarlo_integrate>:
  20:	41 55                	push   %r13
  22:	41 54                	push   %r12
  24:	41 89 fc             	mov    %edi,%r12d
  27:	bf 71 00 00 00       	mov    $0x71,%edi
  2c:	55                   	push   %rbp
  2d:	53                   	push   %rbx
  2e:	48 83 ec 18          	sub    $0x18,%rsp
  32:	e8 00 00 00 00       	call   37 <MonteCarlo_integrate+0x17>
  37:	48 89 c3             	mov    %rax,%rbx
  3a:	45 85 e4             	test   %r12d,%r12d
  3d:	0f 8e fd 01 00 00    	jle    240 <MonteCarlo_integrate+0x220>
  43:	44 89 e0             	mov    %r12d,%eax
  46:	45 31 ed             	xor    %r13d,%r13d
  49:	31 ed                	xor    %ebp,%ebp
  4b:	83 e0 03             	and    $0x3,%eax
  4e:	0f 84 d1 00 00 00    	je     125 <MonteCarlo_integrate+0x105>
  54:	83 f8 01             	cmp    $0x1,%eax
  57:	0f 84 81 00 00 00    	je     de <MonteCarlo_integrate+0xbe>
  5d:	83 f8 02             	cmp    $0x2,%eax
  60:	74 40                	je     a2 <MonteCarlo_integrate+0x82>
  62:	48 89 df             	mov    %rbx,%rdi
  65:	31 ed                	xor    %ebp,%ebp
  67:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  6d:	e8 00 00 00 00       	call   72 <MonteCarlo_integrate+0x52>
  72:	48 89 df             	mov    %rbx,%rdi
  75:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
  7b:	e8 00 00 00 00       	call   80 <MonteCarlo_integrate+0x60>
  80:	c5 fb 10 4c 24 08    	vmovsd 0x8(%rsp),%xmm1
  86:	c5 fb 10 3d 00 00 00 	vmovsd 0x0(%rip),%xmm7        # 8e <MonteCarlo_integrate+0x6e>
  8d:	00 
  8e:	c5 fb 59 c0          	vmulsd %xmm0,%xmm0,%xmm0
  92:	c5 f3 59 d1          	vmulsd %xmm1,%xmm1,%xmm2
  96:	c5 eb 58 d8          	vaddsd %xmm0,%xmm2,%xmm3
  9a:	c5 f9 2f fb          	vcomisd %xmm3,%xmm7
  9e:	40 0f 93 c5          	setae  %bpl
  a2:	48 89 df             	mov    %rbx,%rdi
  a5:	e8 00 00 00 00       	call   aa <MonteCarlo_integrate+0x8a>
  aa:	48 89 df             	mov    %rbx,%rdi
  ad:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
  b3:	e8 00 00 00 00       	call   b8 <MonteCarlo_integrate+0x98>
  b8:	c5 fb 10 64 24 08    	vmovsd 0x8(%rsp),%xmm4
  be:	c5 7b 10 0d 00 00 00 	vmovsd 0x0(%rip),%xmm9        # c6 <MonteCarlo_integrate+0xa6>
  c5:	00 
  c6:	c5 fb 59 f0          	vmulsd %xmm0,%xmm0,%xmm6
  ca:	c5 db 59 ec          	vmulsd %xmm4,%xmm4,%xmm5
  ce:	c5 53 58 c6          	vaddsd %xmm6,%xmm5,%xmm8
  d2:	c4 41 79 2f c8       	vcomisd %xmm8,%xmm9
  d7:	83 dd ff             	sbb    $0xffffffff,%ebp
  da:	41 83 c5 01          	add    $0x1,%r13d
  de:	48 89 df             	mov    %rbx,%rdi
  e1:	e8 00 00 00 00       	call   e6 <MonteCarlo_integrate+0xc6>
  e6:	48 89 df             	mov    %rbx,%rdi
  e9:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
  ef:	e8 00 00 00 00       	call   f4 <MonteCarlo_integrate+0xd4>
  f4:	c5 7b 10 54 24 08    	vmovsd 0x8(%rsp),%xmm10
  fa:	c5 7b 10 35 00 00 00 	vmovsd 0x0(%rip),%xmm14        # 102 <MonteCarlo_integrate+0xe2>
 101:	00 
 102:	c5 7b 59 e0          	vmulsd %xmm0,%xmm0,%xmm12
 106:	c4 41 2b 59 da       	vmulsd %xmm10,%xmm10,%xmm11
 10b:	c4 41 23 58 ec       	vaddsd %xmm12,%xmm11,%xmm13
 110:	c4 41 79 2f f5       	vcomisd %xmm13,%xmm14
 115:	83 dd ff             	sbb    $0xffffffff,%ebp
 118:	41 83 c5 01          	add    $0x1,%r13d
 11c:	45 39 ec             	cmp    %r13d,%r12d
 11f:	0f 84 ee 00 00 00    	je     213 <MonteCarlo_integrate+0x1f3>
 125:	48 89 df             	mov    %rbx,%rdi
 128:	e8 00 00 00 00       	call   12d <MonteCarlo_integrate+0x10d>
 12d:	48 89 df             	mov    %rbx,%rdi
 130:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
 136:	e8 00 00 00 00       	call   13b <MonteCarlo_integrate+0x11b>
 13b:	c5 7b 10 7c 24 08    	vmovsd 0x8(%rsp),%xmm15
 141:	48 89 df             	mov    %rbx,%rdi
 144:	c5 fb 10 1d 00 00 00 	vmovsd 0x0(%rip),%xmm3        # 14c <MonteCarlo_integrate+0x12c>
 14b:	00 
 14c:	c5 fb 59 d0          	vmulsd %xmm0,%xmm0,%xmm2
 150:	c4 c1 03 59 cf       	vmulsd %xmm15,%xmm15,%xmm1
 155:	c5 f3 58 c2          	vaddsd %xmm2,%xmm1,%xmm0
 159:	c5 f9 2f d8          	vcomisd %xmm0,%xmm3
 15d:	83 dd ff             	sbb    $0xffffffff,%ebp
 160:	e8 00 00 00 00       	call   165 <MonteCarlo_integrate+0x145>
 165:	48 89 df             	mov    %rbx,%rdi
 168:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
 16e:	e8 00 00 00 00       	call   173 <MonteCarlo_integrate+0x153>
 173:	c5 fb 10 7c 24 08    	vmovsd 0x8(%rsp),%xmm7
 179:	48 89 df             	mov    %rbx,%rdi
 17c:	c5 7b 10 05 00 00 00 	vmovsd 0x0(%rip),%xmm8        # 184 <MonteCarlo_integrate+0x164>
 183:	00 
 184:	c5 fb 59 e8          	vmulsd %xmm0,%xmm0,%xmm5
 188:	c5 c3 59 e7          	vmulsd %xmm7,%xmm7,%xmm4
 18c:	c5 db 58 f5          	vaddsd %xmm5,%xmm4,%xmm6
 190:	c5 79 2f c6          	vcomisd %xmm6,%xmm8
 194:	83 dd ff             	sbb    $0xffffffff,%ebp
 197:	e8 00 00 00 00       	call   19c <MonteCarlo_integrate+0x17c>
 19c:	48 89 df             	mov    %rbx,%rdi
 19f:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
 1a5:	e8 00 00 00 00       	call   1aa <MonteCarlo_integrate+0x18a>
 1aa:	c5 7b 10 4c 24 08    	vmovsd 0x8(%rsp),%xmm9
 1b0:	48 89 df             	mov    %rbx,%rdi
 1b3:	c5 7b 10 2d 00 00 00 	vmovsd 0x0(%rip),%xmm13        # 1bb <MonteCarlo_integrate+0x19b>
 1ba:	00 
 1bb:	c5 7b 59 d8          	vmulsd %xmm0,%xmm0,%xmm11
 1bf:	c4 41 33 59 d1       	vmulsd %xmm9,%xmm9,%xmm10
 1c4:	c4 41 2b 58 e3       	vaddsd %xmm11,%xmm10,%xmm12
 1c9:	c4 41 79 2f ec       	vcomisd %xmm12,%xmm13
 1ce:	83 dd ff             	sbb    $0xffffffff,%ebp
 1d1:	e8 00 00 00 00       	call   1d6 <MonteCarlo_integrate+0x1b6>
 1d6:	48 89 df             	mov    %rbx,%rdi
 1d9:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
 1df:	e8 00 00 00 00       	call   1e4 <MonteCarlo_integrate+0x1c4>
 1e4:	c5 7b 10 74 24 08    	vmovsd 0x8(%rsp),%xmm14
 1ea:	c5 fb 59 c8          	vmulsd %xmm0,%xmm0,%xmm1
 1ee:	c5 fb 10 05 00 00 00 	vmovsd 0x0(%rip),%xmm0        # 1f6 <MonteCarlo_integrate+0x1d6>
 1f5:	00 
 1f6:	c4 41 0b 59 fe       	vmulsd %xmm14,%xmm14,%xmm15
 1fb:	c5 83 58 d1          	vaddsd %xmm1,%xmm15,%xmm2
 1ff:	c5 f9 2f c2          	vcomisd %xmm2,%xmm0
 203:	83 dd ff             	sbb    $0xffffffff,%ebp
 206:	41 83 c5 04          	add    $0x4,%r13d
 20a:	45 39 ec             	cmp    %r13d,%r12d
 20d:	0f 85 12 ff ff ff    	jne    125 <MonteCarlo_integrate+0x105>
 213:	48 89 df             	mov    %rbx,%rdi
 216:	e8 00 00 00 00       	call   21b <MonteCarlo_integrate+0x1fb>
 21b:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 21f:	c5 e3 2a fd          	vcvtsi2sd %ebp,%xmm3,%xmm7
 223:	c4 c1 63 2a e4       	vcvtsi2sd %r12d,%xmm3,%xmm4
 228:	c5 c3 5e ec          	vdivsd %xmm4,%xmm7,%xmm5
 22c:	c5 d3 59 05 00 00 00 	vmulsd 0x0(%rip),%xmm5,%xmm0        # 234 <MonteCarlo_integrate+0x214>
 233:	00 
 234:	48 83 c4 18          	add    $0x18,%rsp
 238:	5b                   	pop    %rbx
 239:	5d                   	pop    %rbp
 23a:	41 5c                	pop    %r12
 23c:	41 5d                	pop    %r13
 23e:	c3                   	ret
 23f:	90                   	nop
 240:	31 ed                	xor    %ebp,%ebp
 242:	eb cf                	jmp    213 <MonteCarlo_integrate+0x1f3>
