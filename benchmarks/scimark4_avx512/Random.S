
Random.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <new_Random_seed>:
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	41 57                	push   %r15
       6:	41 56                	push   %r14
       8:	41 55                	push   %r13
       a:	41 54                	push   %r12
       c:	53                   	push   %rbx
       d:	89 fb                	mov    %edi,%ebx
       f:	bf 70 00 00 00       	mov    $0x70,%edi
      14:	48 83 e4 c0          	and    $0xffffffffffffffc0,%rsp
      18:	48 83 ec 40          	sub    $0x40,%rsp
      1c:	e8 00 00 00 00       	call   21 <new_Random_seed+0x21>
      21:	49 89 c0             	mov    %rax,%r8
      24:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 2b <new_Random_seed+0x2b>
      2b:	41 89 58 44          	mov    %ebx,0x44(%r8)
      2f:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 36 <new_Random_seed+0x36>
      36:	89 d8                	mov    %ebx,%eax
      38:	f7 d8                	neg    %eax
      3a:	41 c7 40 50 00 00 00 	movl   $0x0,0x50(%r8)
      41:	00 
      42:	0f 48 c3             	cmovs  %ebx,%eax
      45:	89 c2                	mov    %eax,%edx
      47:	83 e2 01             	and    $0x1,%edx
      4a:	83 fa 01             	cmp    $0x1,%edx
      4d:	83 d8 00             	sbb    $0x0,%eax
      50:	99                   	cltd
      51:	8d b8 ff ff 00 00    	lea    0xffff(%rax),%edi
      57:	c1 ea 10             	shr    $0x10,%edx
      5a:	8d 0c 10             	lea    (%rax,%rdx,1),%ecx
      5d:	0f b7 f1             	movzwl %cx,%esi
      60:	29 d6                	sub    %edx,%esi
      62:	85 c0                	test   %eax,%eax
      64:	0f 48 c7             	cmovs  %edi,%eax
      67:	c5 79 6e c6          	vmovd  %esi,%xmm8
      6b:	c1 f8 10             	sar    $0x10,%eax
      6e:	c5 f9 6e d0          	vmovd  %eax,%xmm2
      72:	69 c6 6d 23 00 00    	imul   $0x236d,%esi,%eax
      78:	c4 c1 79 7e d2       	vmovd  %xmm2,%r10d
      7d:	85 c0                	test   %eax,%eax
      7f:	44 8d b0 ff ff 00 00 	lea    0xffff(%rax),%r14d
      86:	44 0f 49 f0          	cmovns %eax,%r14d
      8a:	45 69 da 6d 23 00 00 	imul   $0x236d,%r10d,%r11d
      91:	99                   	cltd
      92:	c1 ea 10             	shr    $0x10,%edx
      95:	01 d0                	add    %edx,%eax
      97:	41 c1 fe 10          	sar    $0x10,%r14d
      9b:	44 0f b7 e0          	movzwl %ax,%r12d
      9f:	45 01 de             	add    %r11d,%r14d
      a2:	41 29 d4             	sub    %edx,%r12d
      a5:	41 81 e6 ff 7f 00 00 	and    $0x7fff,%r14d
      ac:	41 69 c4 6d 23 00 00 	imul   $0x236d,%r12d,%eax
      b3:	44 89 64 24 3c       	mov    %r12d,0x3c(%rsp)
      b8:	c4 63 39 22 44 24 3c 	vpinsrd $0x1,0x3c(%rsp),%xmm8,%xmm8
      bf:	01 
      c0:	c4 c3 69 22 d6 01    	vpinsrd $0x1,%r14d,%xmm2,%xmm2
      c6:	45 69 ee 6d 23 00 00 	imul   $0x236d,%r14d,%r13d
      cd:	44 8d b8 ff ff 00 00 	lea    0xffff(%rax),%r15d
      d4:	85 c0                	test   %eax,%eax
      d6:	44 0f 49 f8          	cmovns %eax,%r15d
      da:	99                   	cltd
      db:	c1 ea 10             	shr    $0x10,%edx
      de:	41 c1 ff 10          	sar    $0x10,%r15d
      e2:	01 d0                	add    %edx,%eax
      e4:	45 01 fd             	add    %r15d,%r13d
      e7:	0f b7 c8             	movzwl %ax,%ecx
      ea:	44 89 eb             	mov    %r13d,%ebx
      ed:	29 d1                	sub    %edx,%ecx
      ef:	c1 fb 1f             	sar    $0x1f,%ebx
      f2:	69 f9 6d 23 00 00    	imul   $0x236d,%ecx,%edi
      f8:	c5 79 6e c9          	vmovd  %ecx,%xmm9
      fc:	c1 eb 11             	shr    $0x11,%ebx
      ff:	41 01 dd             	add    %ebx,%r13d
     102:	41 81 e5 ff 7f 00 00 	and    $0x7fff,%r13d
     109:	44 8d 8f ff ff 00 00 	lea    0xffff(%rdi),%r9d
     110:	89 f8                	mov    %edi,%eax
     112:	41 29 dd             	sub    %ebx,%r13d
     115:	85 ff                	test   %edi,%edi
     117:	44 0f 49 cf          	cmovns %edi,%r9d
     11b:	45 69 dd 6d 23 00 00 	imul   $0x236d,%r13d,%r11d
     122:	c1 f8 1f             	sar    $0x1f,%eax
     125:	c4 41 79 6e d5       	vmovd  %r13d,%xmm10
     12a:	c1 e8 10             	shr    $0x10,%eax
     12d:	41 c1 f9 10          	sar    $0x10,%r9d
     131:	01 c7                	add    %eax,%edi
     133:	45 01 d9             	add    %r11d,%r9d
     136:	45 89 cc             	mov    %r9d,%r12d
     139:	41 c1 fc 1f          	sar    $0x1f,%r12d
     13d:	41 c1 ec 11          	shr    $0x11,%r12d
     141:	43 8d 14 21          	lea    (%r9,%r12,1),%edx
     145:	44 0f b7 cf          	movzwl %di,%r9d
     149:	41 29 c1             	sub    %eax,%r9d
     14c:	81 e2 ff 7f 00 00    	and    $0x7fff,%edx
     152:	45 69 e9 6d 23 00 00 	imul   $0x236d,%r9d,%r13d
     159:	44 29 e2             	sub    %r12d,%edx
     15c:	c4 43 31 22 c9 01    	vpinsrd $0x1,%r9d,%xmm9,%xmm9
     162:	41 b9 6d 23 00 00    	mov    $0x236d,%r9d
     168:	c4 63 29 22 d2 01    	vpinsrd $0x1,%edx,%xmm10,%xmm10
     16e:	45 85 ed             	test   %r13d,%r13d
     171:	41 8d 9d ff ff 00 00 	lea    0xffff(%r13),%ebx
     178:	44 89 ee             	mov    %r13d,%esi
     17b:	41 0f 49 dd          	cmovns %r13d,%ebx
     17f:	44 69 fa 6d 23 00 00 	imul   $0x236d,%edx,%r15d
     186:	c1 fe 1f             	sar    $0x1f,%esi
     189:	c1 ee 10             	shr    $0x10,%esi
     18c:	c1 fb 10             	sar    $0x10,%ebx
     18f:	41 8d 7c 35 00       	lea    0x0(%r13,%rsi,1),%edi
     194:	44 01 fb             	add    %r15d,%ebx
     197:	44 0f b7 d7          	movzwl %di,%r10d
     19b:	89 d9                	mov    %ebx,%ecx
     19d:	41 29 f2             	sub    %esi,%r10d
     1a0:	c1 f9 1f             	sar    $0x1f,%ecx
     1a3:	45 69 da 6d 23 00 00 	imul   $0x236d,%r10d,%r11d
     1aa:	c4 c1 79 6e c2       	vmovd  %r10d,%xmm0
     1af:	c1 e9 11             	shr    $0x11,%ecx
     1b2:	01 cb                	add    %ecx,%ebx
     1b4:	81 e3 ff 7f 00 00    	and    $0x7fff,%ebx
     1ba:	45 8d a3 ff ff 00 00 	lea    0xffff(%r11),%r12d
     1c1:	29 cb                	sub    %ecx,%ebx
     1c3:	45 85 db             	test   %r11d,%r11d
     1c6:	45 0f 49 e3          	cmovns %r11d,%r12d
     1ca:	c5 f9 6e db          	vmovd  %ebx,%xmm3
     1ce:	44 69 eb 6d 23 00 00 	imul   $0x236d,%ebx,%r13d
     1d5:	44 89 db             	mov    %r11d,%ebx
     1d8:	c1 fb 1f             	sar    $0x1f,%ebx
     1db:	41 c1 fc 10          	sar    $0x10,%r12d
     1df:	c1 eb 10             	shr    $0x10,%ebx
     1e2:	45 01 ec             	add    %r13d,%r12d
     1e5:	41 01 db             	add    %ebx,%r11d
     1e8:	45 89 e7             	mov    %r12d,%r15d
     1eb:	45 0f b7 d3          	movzwl %r11w,%r10d
     1ef:	41 29 da             	sub    %ebx,%r10d
     1f2:	41 c1 ff 1f          	sar    $0x1f,%r15d
     1f6:	41 69 fa 6d 23 00 00 	imul   $0x236d,%r10d,%edi
     1fd:	41 c1 ef 11          	shr    $0x11,%r15d
     201:	c4 c3 79 22 c2 01    	vpinsrd $0x1,%r10d,%xmm0,%xmm0
     207:	43 8d 0c 3c          	lea    (%r12,%r15,1),%ecx
     20b:	81 e1 ff 7f 00 00    	and    $0x7fff,%ecx
     211:	44 29 f9             	sub    %r15d,%ecx
     214:	8d b7 ff ff 00 00    	lea    0xffff(%rdi),%esi
     21a:	85 ff                	test   %edi,%edi
     21c:	89 f8                	mov    %edi,%eax
     21e:	0f 49 f7             	cmovns %edi,%esi
     221:	44 69 d9 6d 23 00 00 	imul   $0x236d,%ecx,%r11d
     228:	c1 f8 1f             	sar    $0x1f,%eax
     22b:	c4 e3 61 22 d9 01    	vpinsrd $0x1,%ecx,%xmm3,%xmm3
     231:	c1 e8 10             	shr    $0x10,%eax
     234:	c1 fe 10             	sar    $0x10,%esi
     237:	01 c7                	add    %eax,%edi
     239:	44 01 de             	add    %r11d,%esi
     23c:	44 0f b7 ef          	movzwl %di,%r13d
     240:	41 89 f4             	mov    %esi,%r12d
     243:	41 29 c5             	sub    %eax,%r13d
     246:	41 c1 fc 1f          	sar    $0x1f,%r12d
     24a:	41 69 fd 6d 23 00 00 	imul   $0x236d,%r13d,%edi
     251:	c4 41 79 6e fd       	vmovd  %r13d,%xmm15
     256:	41 c1 ec 11          	shr    $0x11,%r12d
     25a:	44 01 e6             	add    %r12d,%esi
     25d:	81 e6 ff 7f 00 00    	and    $0x7fff,%esi
     263:	44 8d bf ff ff 00 00 	lea    0xffff(%rdi),%r15d
     26a:	44 29 e6             	sub    %r12d,%esi
     26d:	85 ff                	test   %edi,%edi
     26f:	41 89 fc             	mov    %edi,%r12d
     272:	44 0f 49 ff          	cmovns %edi,%r15d
     276:	69 de 6d 23 00 00    	imul   $0x236d,%esi,%ebx
     27c:	41 c1 fc 1f          	sar    $0x1f,%r12d
     280:	c5 79 6e de          	vmovd  %esi,%xmm11
     284:	41 c1 ec 10          	shr    $0x10,%r12d
     288:	41 c1 ff 10          	sar    $0x10,%r15d
     28c:	44 01 e7             	add    %r12d,%edi
     28f:	41 01 df             	add    %ebx,%r15d
     292:	44 0f b7 df          	movzwl %di,%r11d
     296:	44 89 fe             	mov    %r15d,%esi
     299:	45 29 e3             	sub    %r12d,%r11d
     29c:	c1 fe 1f             	sar    $0x1f,%esi
     29f:	45 69 eb 6d 23 00 00 	imul   $0x236d,%r11d,%r13d
     2a6:	c4 43 01 22 fb 01    	vpinsrd $0x1,%r11d,%xmm15,%xmm15
     2ac:	c1 ee 11             	shr    $0x11,%esi
     2af:	41 01 f7             	add    %esi,%r15d
     2b2:	41 81 e7 ff 7f 00 00 	and    $0x7fff,%r15d
     2b9:	41 8d 85 ff ff 00 00 	lea    0xffff(%r13),%eax
     2c0:	41 29 f7             	sub    %esi,%r15d
     2c3:	45 85 ed             	test   %r13d,%r13d
     2c6:	41 0f 49 c5          	cmovns %r13d,%eax
     2ca:	41 69 ff 6d 23 00 00 	imul   $0x236d,%r15d,%edi
     2d1:	44 89 7c 24 38       	mov    %r15d,0x38(%rsp)
     2d6:	c4 63 21 22 5c 24 38 	vpinsrd $0x1,0x38(%rsp),%xmm11,%xmm11
     2dd:	01 
     2de:	c1 f8 10             	sar    $0x10,%eax
     2e1:	8d 1c 38             	lea    (%rax,%rdi,1),%ebx
     2e4:	44 89 e8             	mov    %r13d,%eax
     2e7:	89 de                	mov    %ebx,%esi
     2e9:	c1 f8 1f             	sar    $0x1f,%eax
     2ec:	c1 fe 1f             	sar    $0x1f,%esi
     2ef:	c1 e8 10             	shr    $0x10,%eax
     2f2:	c1 ee 11             	shr    $0x11,%esi
     2f5:	45 8d 64 05 00       	lea    0x0(%r13,%rax,1),%r12d
     2fa:	44 8d 3c 33          	lea    (%rbx,%rsi,1),%r15d
     2fe:	45 0f b7 ec          	movzwl %r12w,%r13d
     302:	41 81 e7 ff 7f 00 00 	and    $0x7fff,%r15d
     309:	41 29 c5             	sub    %eax,%r13d
     30c:	41 29 f7             	sub    %esi,%r15d
     30f:	c4 c1 79 6e cd       	vmovd  %r13d,%xmm1
     314:	c4 c1 79 6e f7       	vmovd  %r15d,%xmm6
     319:	45 69 fd 6d 23 00 00 	imul   $0x236d,%r13d,%r15d
     320:	c5 f9 7e f6          	vmovd  %xmm6,%esi
     324:	45 85 ff             	test   %r15d,%r15d
     327:	41 8d 9f ff ff 00 00 	lea    0xffff(%r15),%ebx
     32e:	44 89 ff             	mov    %r15d,%edi
     331:	41 0f 49 df          	cmovns %r15d,%ebx
     335:	69 c6 6d 23 00 00    	imul   $0x236d,%esi,%eax
     33b:	c1 ff 1f             	sar    $0x1f,%edi
     33e:	c1 ef 10             	shr    $0x10,%edi
     341:	41 89 dd             	mov    %ebx,%r13d
     344:	45 8d 3c 3f          	lea    (%r15,%rdi,1),%r15d
     348:	41 c1 fd 10          	sar    $0x10,%r13d
     34c:	41 0f b7 df          	movzwl %r15w,%ebx
     350:	41 01 c5             	add    %eax,%r13d
     353:	29 fb                	sub    %edi,%ebx
     355:	45 89 ec             	mov    %r13d,%r12d
     358:	69 c3 6d 23 00 00    	imul   $0x236d,%ebx,%eax
     35e:	c4 e3 71 22 cb 01    	vpinsrd $0x1,%ebx,%xmm1,%xmm1
     364:	41 c1 fc 1f          	sar    $0x1f,%r12d
     368:	41 c1 ec 11          	shr    $0x11,%r12d
     36c:	45 01 e5             	add    %r12d,%r13d
     36f:	8d b0 ff ff 00 00    	lea    0xffff(%rax),%esi
     375:	41 89 c7             	mov    %eax,%r15d
     378:	41 81 e5 ff 7f 00 00 	and    $0x7fff,%r13d
     37f:	45 29 e5             	sub    %r12d,%r13d
     382:	85 c0                	test   %eax,%eax
     384:	0f 49 f0             	cmovns %eax,%esi
     387:	45 69 e5 6d 23 00 00 	imul   $0x236d,%r13d,%r12d
     38e:	41 c1 ff 1f          	sar    $0x1f,%r15d
     392:	44 89 6c 24 34       	mov    %r13d,0x34(%rsp)
     397:	41 c1 ef 10          	shr    $0x10,%r15d
     39b:	c4 e3 49 22 74 24 34 	vpinsrd $0x1,0x34(%rsp),%xmm6,%xmm6
     3a2:	01 
     3a3:	c1 fe 10             	sar    $0x10,%esi
     3a6:	44 01 f8             	add    %r15d,%eax
     3a9:	44 01 e6             	add    %r12d,%esi
     3ac:	0f b7 f8             	movzwl %ax,%edi
     3af:	41 89 f5             	mov    %esi,%r13d
     3b2:	44 29 ff             	sub    %r15d,%edi
     3b5:	41 c1 fd 1f          	sar    $0x1f,%r13d
     3b9:	44 69 e7 6d 23 00 00 	imul   $0x236d,%edi,%r12d
     3c0:	c5 f9 6e ff          	vmovd  %edi,%xmm7
     3c4:	41 c1 ed 11          	shr    $0x11,%r13d
     3c8:	44 01 ee             	add    %r13d,%esi
     3cb:	81 e6 ff 7f 00 00    	and    $0x7fff,%esi
     3d1:	41 8d bc 24 ff ff 00 	lea    0xffff(%r12),%edi
     3d8:	00 
     3d9:	44 29 ee             	sub    %r13d,%esi
     3dc:	45 85 e4             	test   %r12d,%r12d
     3df:	41 0f 49 fc          	cmovns %r12d,%edi
     3e3:	44 69 ee 6d 23 00 00 	imul   $0x236d,%esi,%r13d
     3ea:	c5 79 6e ee          	vmovd  %esi,%xmm13
     3ee:	c1 ff 10             	sar    $0x10,%edi
     3f1:	44 01 ef             	add    %r13d,%edi
     3f4:	45 89 e5             	mov    %r12d,%r13d
     3f7:	41 c1 fd 1f          	sar    $0x1f,%r13d
     3fb:	41 89 ff             	mov    %edi,%r15d
     3fe:	41 c1 ed 10          	shr    $0x10,%r13d
     402:	41 c1 ff 1f          	sar    $0x1f,%r15d
     406:	45 01 ec             	add    %r13d,%r12d
     409:	41 c1 ef 11          	shr    $0x11,%r15d
     40d:	45 0f b7 e4          	movzwl %r12w,%r12d
     411:	44 01 ff             	add    %r15d,%edi
     414:	45 29 ec             	sub    %r13d,%r12d
     417:	81 e7 ff 7f 00 00    	and    $0x7fff,%edi
     41d:	41 69 f4 6d 23 00 00 	imul   $0x236d,%r12d,%esi
     424:	44 29 ff             	sub    %r15d,%edi
     427:	c4 c3 41 22 fc 01    	vpinsrd $0x1,%r12d,%xmm7,%xmm7
     42d:	89 7c 24 30          	mov    %edi,0x30(%rsp)
     431:	c4 63 11 22 6c 24 30 	vpinsrd $0x1,0x30(%rsp),%xmm13,%xmm13
     438:	01 
     439:	85 f6                	test   %esi,%esi
     43b:	8d 86 ff ff 00 00    	lea    0xffff(%rsi),%eax
     441:	41 89 f5             	mov    %esi,%r13d
     444:	0f 49 c6             	cmovns %esi,%eax
     447:	44 69 ff 6d 23 00 00 	imul   $0x236d,%edi,%r15d
     44e:	41 c1 fd 1f          	sar    $0x1f,%r13d
     452:	41 c1 ed 10          	shr    $0x10,%r13d
     456:	c1 f8 10             	sar    $0x10,%eax
     459:	44 01 ee             	add    %r13d,%esi
     45c:	44 01 f8             	add    %r15d,%eax
     45f:	0f b7 f6             	movzwl %si,%esi
     462:	89 c7                	mov    %eax,%edi
     464:	44 29 ee             	sub    %r13d,%esi
     467:	c1 ff 1f             	sar    $0x1f,%edi
     46a:	c5 79 6e e6          	vmovd  %esi,%xmm12
     46e:	c1 ef 11             	shr    $0x11,%edi
     471:	01 f8                	add    %edi,%eax
     473:	25 ff 7f 00 00       	and    $0x7fff,%eax
     478:	29 f8                	sub    %edi,%eax
     47a:	c5 f9 6e e8          	vmovd  %eax,%xmm5
     47e:	69 c6 6d 23 00 00    	imul   $0x236d,%esi,%eax
     484:	c4 c1 79 7e ef       	vmovd  %xmm5,%r15d
     489:	85 c0                	test   %eax,%eax
     48b:	8d b8 ff ff 00 00    	lea    0xffff(%rax),%edi
     491:	0f 49 f8             	cmovns %eax,%edi
     494:	45 69 ef 6d 23 00 00 	imul   $0x236d,%r15d,%r13d
     49b:	41 89 c7             	mov    %eax,%r15d
     49e:	41 c1 ff 1f          	sar    $0x1f,%r15d
     4a2:	c1 ff 10             	sar    $0x10,%edi
     4a5:	41 c1 ef 10          	shr    $0x10,%r15d
     4a9:	41 01 fd             	add    %edi,%r13d
     4ac:	44 01 f8             	add    %r15d,%eax
     4af:	44 89 ef             	mov    %r13d,%edi
     4b2:	c1 ff 1f             	sar    $0x1f,%edi
     4b5:	c1 ef 11             	shr    $0x11,%edi
     4b8:	41 8d 74 3d 00       	lea    0x0(%r13,%rdi,1),%esi
     4bd:	44 0f b7 e8          	movzwl %ax,%r13d
     4c1:	45 29 fd             	sub    %r15d,%r13d
     4c4:	81 e6 ff 7f 00 00    	and    $0x7fff,%esi
     4ca:	29 fe                	sub    %edi,%esi
     4cc:	41 69 fd 6d 23 00 00 	imul   $0x236d,%r13d,%edi
     4d3:	c4 43 19 22 e5 01    	vpinsrd $0x1,%r13d,%xmm12,%xmm12
     4d9:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 4e0 <new_Random_seed+0x4e0>
     4e0:	c4 e3 51 22 ee 01    	vpinsrd $0x1,%esi,%xmm5,%xmm5
     4e6:	4d 89 68 48          	mov    %r13,0x48(%r8)
     4ea:	85 ff                	test   %edi,%edi
     4ec:	8d 87 ff ff 00 00    	lea    0xffff(%rdi),%eax
     4f2:	0f 49 c7             	cmovns %edi,%eax
     4f5:	44 69 fe 6d 23 00 00 	imul   $0x236d,%esi,%r15d
     4fc:	c1 f8 10             	sar    $0x10,%eax
     4ff:	44 01 f8             	add    %r15d,%eax
     502:	41 89 c7             	mov    %eax,%r15d
     505:	41 c1 ff 1f          	sar    $0x1f,%r15d
     509:	41 c1 ef 11          	shr    $0x11,%r15d
     50d:	44 01 f8             	add    %r15d,%eax
     510:	25 ff 7f 00 00       	and    $0x7fff,%eax
     515:	44 29 f8             	sub    %r15d,%eax
     518:	41 89 ff             	mov    %edi,%r15d
     51b:	41 c1 ff 1f          	sar    $0x1f,%r15d
     51f:	c5 f9 6e e0          	vmovd  %eax,%xmm4
     523:	41 c1 ef 10          	shr    $0x10,%r15d
     527:	44 01 ff             	add    %r15d,%edi
     52a:	0f b7 ff             	movzwl %di,%edi
     52d:	44 29 ff             	sub    %r15d,%edi
     530:	c5 79 6e f7          	vmovd  %edi,%xmm14
     534:	69 ff 6d 23 00 00    	imul   $0x236d,%edi,%edi
     53a:	85 ff                	test   %edi,%edi
     53c:	44 8d bf ff ff 00 00 	lea    0xffff(%rdi),%r15d
     543:	44 0f 49 ff          	cmovns %edi,%r15d
     547:	69 c0 6d 23 00 00    	imul   $0x236d,%eax,%eax
     54d:	41 c1 ff 10          	sar    $0x10,%r15d
     551:	41 01 c7             	add    %eax,%r15d
     554:	89 f8                	mov    %edi,%eax
     556:	c1 f8 1f             	sar    $0x1f,%eax
     559:	c1 e8 10             	shr    $0x10,%eax
     55c:	01 c7                	add    %eax,%edi
     55e:	0f b7 ff             	movzwl %di,%edi
     561:	29 c7                	sub    %eax,%edi
     563:	4c 89 c0             	mov    %r8,%rax
     566:	c4 63 09 22 f7 01    	vpinsrd $0x1,%edi,%xmm14,%xmm14
     56c:	44 89 ff             	mov    %r15d,%edi
     56f:	c4 41 19 6c f6       	vpunpcklqdq %xmm14,%xmm12,%xmm14
     574:	c5 71 6c e7          	vpunpcklqdq %xmm7,%xmm1,%xmm12
     578:	c1 ff 1f             	sar    $0x1f,%edi
     57b:	c4 c1 79 6c ff       	vpunpcklqdq %xmm15,%xmm0,%xmm7
     580:	c4 c1 39 6c c9       	vpunpcklqdq %xmm9,%xmm8,%xmm1
     585:	62 53 1d 28 38 f6 01 	vinserti32x4 $0x1,%xmm14,%ymm12,%ymm14
     58c:	c1 ef 11             	shr    $0x11,%edi
     58f:	c4 41 39 ef c0       	vpxor  %xmm8,%xmm8,%xmm8
     594:	62 73 75 28 38 e7 01 	vinserti32x4 $0x1,%xmm7,%ymm1,%ymm12
     59b:	c5 c1 ef ff          	vpxor  %xmm7,%xmm7,%xmm7
     59f:	41 01 ff             	add    %edi,%r15d
     5a2:	62 53 9d 48 3a fe 01 	vinserti64x4 $0x1,%ymm14,%zmm12,%zmm15
     5a9:	62 52 7d 48 7c f1    	vpbroadcastd %r9d,%zmm14
     5af:	41 81 e7 ff 7f 00 00 	and    $0x7fff,%r15d
     5b6:	62 d2 05 48 40 c6    	vpmulld %zmm14,%zmm15,%zmm0
     5bc:	62 53 3d 48 25 c0 ff 	vpternlogd $0xff,%zmm8,%zmm8,%zmm8
     5c3:	41 29 ff             	sub    %edi,%r15d
     5c6:	c4 c3 59 22 e7 01    	vpinsrd $0x1,%r15d,%xmm4,%xmm4
     5cc:	62 d1 1d 48 72 d0 10 	vpsrld $0x10,%zmm8,%zmm12
     5d3:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 5da <new_Random_seed+0x5da>
     5da:	4d 89 78 68          	mov    %r15,0x68(%r8)
     5de:	62 f3 7d 48 1f cf 01 	vpcmpltd %zmm7,%zmm0,%k1
     5e5:	c5 d1 6c fc          	vpunpcklqdq %xmm4,%xmm5,%xmm7
     5e9:	c4 c1 61 6c e3       	vpunpcklqdq %xmm11,%xmm3,%xmm4
     5ee:	c4 c1 69 6c ea       	vpunpcklqdq %xmm10,%xmm2,%xmm5
     5f3:	62 d1 35 c9 72 d0 10 	vpsrld $0x10,%zmm8,%zmm9{%k1}{z}
     5fa:	62 d1 3d 48 72 d0 11 	vpsrld $0x11,%zmm8,%zmm8
     601:	62 f1 35 48 fe c8    	vpaddd %zmm0,%zmm9,%zmm1
     607:	c4 41 49 6c cd       	vpunpcklqdq %xmm13,%xmm6,%xmm9
     60c:	62 f1 05 48 72 e1 10 	vpsrad $0x10,%zmm1,%zmm15
     613:	62 f3 35 28 38 cf 01 	vinserti32x4 $0x1,%xmm7,%ymm9,%ymm1
     61a:	62 f3 55 28 38 fc 01 	vinserti32x4 $0x1,%xmm4,%ymm5,%ymm7
     621:	62 73 c5 48 3a e9 01 	vinserti64x4 $0x1,%ymm1,%zmm7,%zmm13
     628:	62 f1 5d 48 72 e0 1f 	vpsrad $0x1f,%zmm0,%zmm4
     62f:	62 52 15 48 40 f6    	vpmulld %zmm14,%zmm13,%zmm14
     635:	62 f1 2d 48 72 d4 10 	vpsrld $0x10,%zmm4,%zmm10
     63c:	62 d1 7d 48 fe c2    	vpaddd %zmm10,%zmm0,%zmm0
     642:	62 51 7d 48 db e4    	vpandd %zmm12,%zmm0,%zmm12
     648:	62 d1 1d 48 fa ea    	vpsubd %zmm10,%zmm12,%zmm5
     64e:	62 73 55 48 03 ed 0f 	valignd $0xf,%zmm5,%zmm5,%zmm13
     655:	62 51 05 48 fe fe    	vpaddd %zmm14,%zmm15,%zmm15
     65b:	62 d1 4d 48 72 e7 1f 	vpsrad $0x1f,%zmm15,%zmm6
     662:	62 f1 35 48 72 d6 11 	vpsrld $0x11,%zmm6,%zmm9
     669:	62 d1 05 48 fe c9    	vpaddd %zmm9,%zmm15,%zmm1
     66f:	c5 79 28 3d 00 00 00 	vmovapd 0x0(%rip),%xmm15        # 677 <new_Random_seed+0x677>
     676:	00 
     677:	62 51 75 48 db d8    	vpandd %zmm8,%zmm1,%zmm11
     67d:	62 d1 25 48 fa d9    	vpsubd %zmm9,%zmm11,%zmm3
     683:	c4 41 79 7e ee       	vmovd  %xmm13,%r14d
     688:	c4 41 79 11 78 58    	vmovupd %xmm15,0x58(%r8)
     68e:	62 73 65 48 03 f3 0f 	valignd $0xf,%zmm3,%zmm3,%zmm14
     695:	45 69 d6 6d 23 00 00 	imul   $0x236d,%r14d,%r10d
     69c:	62 f1 6d 48 72 f3 10 	vpslld $0x10,%zmm3,%zmm2
     6a3:	62 f1 6d 48 fe fd    	vpaddd %zmm5,%zmm2,%zmm7
     6a9:	62 d1 7e 48 7f 38    	vmovdqu32 %zmm7,(%r8)
     6af:	45 85 d2             	test   %r10d,%r10d
     6b2:	41 8d 8a ff ff 00 00 	lea    0xffff(%r10),%ecx
     6b9:	45 89 d4             	mov    %r10d,%r12d
     6bc:	41 0f 49 ca          	cmovns %r10d,%ecx
     6c0:	41 c1 fc 1f          	sar    $0x1f,%r12d
     6c4:	41 c1 ec 10          	shr    $0x10,%r12d
     6c8:	c5 79 7e f2          	vmovd  %xmm14,%edx
     6cc:	c1 f9 10             	sar    $0x10,%ecx
     6cf:	45 01 e2             	add    %r12d,%r10d
     6d2:	44 69 da 6d 23 00 00 	imul   $0x236d,%edx,%r11d
     6d9:	41 0f b7 f2          	movzwl %r10w,%esi
     6dd:	44 29 e6             	sub    %r12d,%esi
     6e0:	41 01 cb             	add    %ecx,%r11d
     6e3:	44 89 db             	mov    %r11d,%ebx
     6e6:	c1 fb 1f             	sar    $0x1f,%ebx
     6e9:	c1 eb 11             	shr    $0x11,%ebx
     6ec:	41 01 db             	add    %ebx,%r11d
     6ef:	41 81 e3 ff 7f 00 00 	and    $0x7fff,%r11d
     6f6:	41 29 db             	sub    %ebx,%r11d
     6f9:	41 c1 e3 10          	shl    $0x10,%r11d
     6fd:	44 01 de             	add    %r11d,%esi
     700:	41 89 70 40          	mov    %esi,0x40(%r8)
     704:	c5 f8 77             	vzeroupper
     707:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
     70b:	5b                   	pop    %rbx
     70c:	41 5c                	pop    %r12
     70e:	41 5d                	pop    %r13
     710:	41 5e                	pop    %r14
     712:	41 5f                	pop    %r15
     714:	5d                   	pop    %rbp
     715:	c3                   	ret
     716:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
     71d:	00 00 00 

0000000000000720 <new_Random>:
     720:	55                   	push   %rbp
     721:	c5 f9 14 e1          	vunpcklpd %xmm1,%xmm0,%xmm4
     725:	48 89 e5             	mov    %rsp,%rbp
     728:	41 57                	push   %r15
     72a:	41 56                	push   %r14
     72c:	41 55                	push   %r13
     72e:	41 54                	push   %r12
     730:	53                   	push   %rbx
     731:	89 fb                	mov    %edi,%ebx
     733:	bf 70 00 00 00       	mov    $0x70,%edi
     738:	48 83 e4 c0          	and    $0xffffffffffffffc0,%rsp
     73c:	48 83 ec 40          	sub    $0x40,%rsp
     740:	c5 fb 11 4c 24 10    	vmovsd %xmm1,0x10(%rsp)
     746:	c5 fb 11 44 24 18    	vmovsd %xmm0,0x18(%rsp)
     74c:	c5 f9 29 64 24 20    	vmovapd %xmm4,0x20(%rsp)
     752:	e8 00 00 00 00       	call   757 <new_Random+0x37>
     757:	62 a1 7d 40 ef c0    	vpxord %zmm16,%zmm16,%zmm16
     75d:	49 89 c1             	mov    %rax,%r9
     760:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 767 <new_Random+0x47>
     767:	62 a3 7d 40 25 c0 ff 	vpternlogd $0xff,%zmm16,%zmm16,%zmm16
     76e:	41 89 59 44          	mov    %ebx,0x44(%r9)
     772:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 779 <new_Random+0x59>
     779:	89 d8                	mov    %ebx,%eax
     77b:	f7 d8                	neg    %eax
     77d:	41 c7 41 50 01 00 00 	movl   $0x1,0x50(%r9)
     784:	00 
     785:	0f 48 c3             	cmovs  %ebx,%eax
     788:	89 c2                	mov    %eax,%edx
     78a:	83 e2 01             	and    $0x1,%edx
     78d:	83 fa 01             	cmp    $0x1,%edx
     790:	83 d8 00             	sbb    $0x0,%eax
     793:	99                   	cltd
     794:	8d b8 ff ff 00 00    	lea    0xffff(%rax),%edi
     79a:	c1 ea 10             	shr    $0x10,%edx
     79d:	8d 0c 10             	lea    (%rax,%rdx,1),%ecx
     7a0:	0f b7 f1             	movzwl %cx,%esi
     7a3:	29 d6                	sub    %edx,%esi
     7a5:	85 c0                	test   %eax,%eax
     7a7:	0f 48 c7             	cmovs  %edi,%eax
     7aa:	c5 f9 6e c6          	vmovd  %esi,%xmm0
     7ae:	c1 f8 10             	sar    $0x10,%eax
     7b1:	c5 79 6e c8          	vmovd  %eax,%xmm9
     7b5:	69 c6 6d 23 00 00    	imul   $0x236d,%esi,%eax
     7bb:	c4 41 79 7e cb       	vmovd  %xmm9,%r11d
     7c0:	85 c0                	test   %eax,%eax
     7c2:	44 8d 90 ff ff 00 00 	lea    0xffff(%rax),%r10d
     7c9:	44 0f 49 d0          	cmovns %eax,%r10d
     7cd:	45 69 e3 6d 23 00 00 	imul   $0x236d,%r11d,%r12d
     7d4:	99                   	cltd
     7d5:	c1 ea 10             	shr    $0x10,%edx
     7d8:	01 d0                	add    %edx,%eax
     7da:	41 c1 fa 10          	sar    $0x10,%r10d
     7de:	44 0f b7 f0          	movzwl %ax,%r14d
     7e2:	47 8d 2c 22          	lea    (%r10,%r12,1),%r13d
     7e6:	41 29 d6             	sub    %edx,%r14d
     7e9:	41 81 e5 ff 7f 00 00 	and    $0x7fff,%r13d
     7f0:	41 69 c6 6d 23 00 00 	imul   $0x236d,%r14d,%eax
     7f7:	44 89 6c 24 3c       	mov    %r13d,0x3c(%rsp)
     7fc:	c4 63 31 22 4c 24 3c 	vpinsrd $0x1,0x3c(%rsp),%xmm9,%xmm9
     803:	01 
     804:	45 69 fd 6d 23 00 00 	imul   $0x236d,%r13d,%r15d
     80b:	44 89 74 24 38       	mov    %r14d,0x38(%rsp)
     810:	c4 e3 79 22 44 24 38 	vpinsrd $0x1,0x38(%rsp),%xmm0,%xmm0
     817:	01 
     818:	85 c0                	test   %eax,%eax
     81a:	8d 98 ff ff 00 00    	lea    0xffff(%rax),%ebx
     820:	0f 49 d8             	cmovns %eax,%ebx
     823:	99                   	cltd
     824:	c1 ea 10             	shr    $0x10,%edx
     827:	c1 fb 10             	sar    $0x10,%ebx
     82a:	01 d0                	add    %edx,%eax
     82c:	41 01 df             	add    %ebx,%r15d
     82f:	0f b7 f0             	movzwl %ax,%esi
     832:	44 89 f9             	mov    %r15d,%ecx
     835:	29 d6                	sub    %edx,%esi
     837:	c1 f9 1f             	sar    $0x1f,%ecx
     83a:	44 69 c6 6d 23 00 00 	imul   $0x236d,%esi,%r8d
     841:	c5 f9 6e d6          	vmovd  %esi,%xmm2
     845:	c1 e9 11             	shr    $0x11,%ecx
     848:	41 01 cf             	add    %ecx,%r15d
     84b:	41 81 e7 ff 7f 00 00 	and    $0x7fff,%r15d
     852:	41 8d 80 ff ff 00 00 	lea    0xffff(%r8),%eax
     859:	41 29 cf             	sub    %ecx,%r15d
     85c:	45 85 c0             	test   %r8d,%r8d
     85f:	41 0f 49 c0          	cmovns %r8d,%eax
     863:	45 69 d7 6d 23 00 00 	imul   $0x236d,%r15d,%r10d
     86a:	c4 41 79 6e ff       	vmovd  %r15d,%xmm15
     86f:	c1 f8 10             	sar    $0x10,%eax
     872:	44 01 d0             	add    %r10d,%eax
     875:	99                   	cltd
     876:	c1 ea 11             	shr    $0x11,%edx
     879:	01 d0                	add    %edx,%eax
     87b:	25 ff 7f 00 00       	and    $0x7fff,%eax
     880:	41 89 c3             	mov    %eax,%r11d
     883:	44 89 c0             	mov    %r8d,%eax
     886:	c1 f8 1f             	sar    $0x1f,%eax
     889:	41 29 d3             	sub    %edx,%r11d
     88c:	c1 e8 10             	shr    $0x10,%eax
     88f:	44 89 5c 24 34       	mov    %r11d,0x34(%rsp)
     894:	c4 63 01 22 7c 24 34 	vpinsrd $0x1,0x34(%rsp),%xmm15,%xmm15
     89b:	01 
     89c:	41 01 c0             	add    %eax,%r8d
     89f:	45 0f b7 d0          	movzwl %r8w,%r10d
     8a3:	41 29 c2             	sub    %eax,%r10d
     8a6:	45 69 e2 6d 23 00 00 	imul   $0x236d,%r10d,%r12d
     8ad:	c4 c3 69 22 d2 01    	vpinsrd $0x1,%r10d,%xmm2,%xmm2
     8b3:	41 ba 6d 23 00 00    	mov    $0x236d,%r10d
     8b9:	62 c2 7d 48 7c da    	vpbroadcastd %r10d,%zmm19
     8bf:	45 85 e4             	test   %r12d,%r12d
     8c2:	41 8d b4 24 ff ff 00 	lea    0xffff(%r12),%esi
     8c9:	00 
     8ca:	44 89 e0             	mov    %r12d,%eax
     8cd:	41 0f 49 f4          	cmovns %r12d,%esi
     8d1:	45 69 eb 6d 23 00 00 	imul   $0x236d,%r11d,%r13d
     8d8:	c1 f8 1f             	sar    $0x1f,%eax
     8db:	c1 e8 10             	shr    $0x10,%eax
     8de:	c1 fe 10             	sar    $0x10,%esi
     8e1:	41 01 c4             	add    %eax,%r12d
     8e4:	44 01 ee             	add    %r13d,%esi
     8e7:	45 0f b7 fc          	movzwl %r12w,%r15d
     8eb:	41 89 f6             	mov    %esi,%r14d
     8ee:	41 29 c7             	sub    %eax,%r15d
     8f1:	41 c1 fe 1f          	sar    $0x1f,%r14d
     8f5:	41 69 cf 6d 23 00 00 	imul   $0x236d,%r15d,%ecx
     8fc:	c4 c1 79 6e df       	vmovd  %r15d,%xmm3
     901:	41 c1 ee 11          	shr    $0x11,%r14d
     905:	44 01 f6             	add    %r14d,%esi
     908:	81 e6 ff 7f 00 00    	and    $0x7fff,%esi
     90e:	44 8d 81 ff ff 00 00 	lea    0xffff(%rcx),%r8d
     915:	44 29 f6             	sub    %r14d,%esi
     918:	85 c9                	test   %ecx,%ecx
     91a:	44 0f 49 c1          	cmovns %ecx,%r8d
     91e:	69 d6 6d 23 00 00    	imul   $0x236d,%esi,%edx
     924:	c5 f9 6e ee          	vmovd  %esi,%xmm5
     928:	41 c1 f8 10          	sar    $0x10,%r8d
     92c:	41 01 d0             	add    %edx,%r8d
     92f:	44 89 c0             	mov    %r8d,%eax
     932:	c1 f8 1f             	sar    $0x1f,%eax
     935:	c1 e8 11             	shr    $0x11,%eax
     938:	41 01 c0             	add    %eax,%r8d
     93b:	41 81 e0 ff 7f 00 00 	and    $0x7fff,%r8d
     942:	41 29 c0             	sub    %eax,%r8d
     945:	89 c8                	mov    %ecx,%eax
     947:	c1 f8 1f             	sar    $0x1f,%eax
     94a:	44 89 44 24 30       	mov    %r8d,0x30(%rsp)
     94f:	c4 e3 51 22 6c 24 30 	vpinsrd $0x1,0x30(%rsp),%xmm5,%xmm5
     956:	01 
     957:	c1 e8 10             	shr    $0x10,%eax
     95a:	44 8d 1c 01          	lea    (%rcx,%rax,1),%r11d
     95e:	45 0f b7 db          	movzwl %r11w,%r11d
     962:	41 29 c3             	sub    %eax,%r11d
     965:	45 69 e3 6d 23 00 00 	imul   $0x236d,%r11d,%r12d
     96c:	c4 c3 61 22 db 01    	vpinsrd $0x1,%r11d,%xmm3,%xmm3
     972:	45 85 e4             	test   %r12d,%r12d
     975:	45 8d b4 24 ff ff 00 	lea    0xffff(%r12),%r14d
     97c:	00 
     97d:	45 89 e7             	mov    %r12d,%r15d
     980:	45 0f 49 f4          	cmovns %r12d,%r14d
     984:	45 69 e8 6d 23 00 00 	imul   $0x236d,%r8d,%r13d
     98b:	41 c1 ff 1f          	sar    $0x1f,%r15d
     98f:	41 c1 ef 10          	shr    $0x10,%r15d
     993:	41 c1 fe 10          	sar    $0x10,%r14d
     997:	43 8d 1c 3c          	lea    (%r12,%r15,1),%ebx
     99b:	45 01 ee             	add    %r13d,%r14d
     99e:	0f b7 cb             	movzwl %bx,%ecx
     9a1:	44 89 f6             	mov    %r14d,%esi
     9a4:	44 29 f9             	sub    %r15d,%ecx
     9a7:	c1 fe 1f             	sar    $0x1f,%esi
     9aa:	44 69 c1 6d 23 00 00 	imul   $0x236d,%ecx,%r8d
     9b1:	c5 79 6e e9          	vmovd  %ecx,%xmm13
     9b5:	c1 ee 11             	shr    $0x11,%esi
     9b8:	41 01 f6             	add    %esi,%r14d
     9bb:	41 81 e6 ff 7f 00 00 	and    $0x7fff,%r14d
     9c2:	41 8d 80 ff ff 00 00 	lea    0xffff(%r8),%eax
     9c9:	45 89 c4             	mov    %r8d,%r12d
     9cc:	41 29 f6             	sub    %esi,%r14d
     9cf:	45 85 c0             	test   %r8d,%r8d
     9d2:	41 0f 49 c0          	cmovns %r8d,%eax
     9d6:	41 69 d6 6d 23 00 00 	imul   $0x236d,%r14d,%edx
     9dd:	41 c1 fc 1f          	sar    $0x1f,%r12d
     9e1:	c4 41 79 6e de       	vmovd  %r14d,%xmm11
     9e6:	41 c1 ec 10          	shr    $0x10,%r12d
     9ea:	c1 f8 10             	sar    $0x10,%eax
     9ed:	47 8d 2c 20          	lea    (%r8,%r12,1),%r13d
     9f1:	01 d0                	add    %edx,%eax
     9f3:	41 0f b7 dd          	movzwl %r13w,%ebx
     9f7:	89 c7                	mov    %eax,%edi
     9f9:	44 29 e3             	sub    %r12d,%ebx
     9fc:	c1 ff 1f             	sar    $0x1f,%edi
     9ff:	44 69 fb 6d 23 00 00 	imul   $0x236d,%ebx,%r15d
     a06:	c4 63 11 22 eb 01    	vpinsrd $0x1,%ebx,%xmm13,%xmm13
     a0c:	c1 ef 11             	shr    $0x11,%edi
     a0f:	01 f8                	add    %edi,%eax
     a11:	25 ff 7f 00 00       	and    $0x7fff,%eax
     a16:	41 8d b7 ff ff 00 00 	lea    0xffff(%r15),%esi
     a1d:	89 c2                	mov    %eax,%edx
     a1f:	29 fa                	sub    %edi,%edx
     a21:	45 85 ff             	test   %r15d,%r15d
     a24:	41 0f 49 f7          	cmovns %r15d,%esi
     a28:	44 69 f2 6d 23 00 00 	imul   $0x236d,%edx,%r14d
     a2f:	c4 63 21 22 da 01    	vpinsrd $0x1,%edx,%xmm11,%xmm11
     a35:	c1 fe 10             	sar    $0x10,%esi
     a38:	42 8d 0c 36          	lea    (%rsi,%r14,1),%ecx
     a3c:	89 ce                	mov    %ecx,%esi
     a3e:	c1 fe 1f             	sar    $0x1f,%esi
     a41:	c1 ee 11             	shr    $0x11,%esi
     a44:	44 8d 34 31          	lea    (%rcx,%rsi,1),%r14d
     a48:	41 81 e6 ff 7f 00 00 	and    $0x7fff,%r14d
     a4f:	41 29 f6             	sub    %esi,%r14d
     a52:	44 89 fe             	mov    %r15d,%esi
     a55:	c1 fe 1f             	sar    $0x1f,%esi
     a58:	c4 41 79 6e c6       	vmovd  %r14d,%xmm8
     a5d:	c1 ee 10             	shr    $0x10,%esi
     a60:	41 01 f7             	add    %esi,%r15d
     a63:	41 0f b7 c7          	movzwl %r15w,%eax
     a67:	29 f0                	sub    %esi,%eax
     a69:	44 69 c0 6d 23 00 00 	imul   $0x236d,%eax,%r8d
     a70:	c5 f9 6e c8          	vmovd  %eax,%xmm1
     a74:	45 85 c0             	test   %r8d,%r8d
     a77:	41 8d b8 ff ff 00 00 	lea    0xffff(%r8),%edi
     a7e:	44 89 c6             	mov    %r8d,%esi
     a81:	41 0f 49 f8          	cmovns %r8d,%edi
     a85:	45 69 ee 6d 23 00 00 	imul   $0x236d,%r14d,%r13d
     a8c:	c1 fe 1f             	sar    $0x1f,%esi
     a8f:	c1 ee 10             	shr    $0x10,%esi
     a92:	c1 ff 10             	sar    $0x10,%edi
     a95:	45 8d 34 30          	lea    (%r8,%rsi,1),%r14d
     a99:	44 01 ef             	add    %r13d,%edi
     a9c:	45 0f b7 e6          	movzwl %r14w,%r12d
     aa0:	41 89 ff             	mov    %edi,%r15d
     aa3:	41 29 f4             	sub    %esi,%r12d
     aa6:	41 c1 ff 1f          	sar    $0x1f,%r15d
     aaa:	45 69 c4 6d 23 00 00 	imul   $0x236d,%r12d,%r8d
     ab1:	c4 c3 71 22 cc 01    	vpinsrd $0x1,%r12d,%xmm1,%xmm1
     ab7:	41 c1 ef 11          	shr    $0x11,%r15d
     abb:	42 8d 0c 3f          	lea    (%rdi,%r15,1),%ecx
     abf:	81 e1 ff 7f 00 00    	and    $0x7fff,%ecx
     ac5:	41 8d 80 ff ff 00 00 	lea    0xffff(%r8),%eax
     acc:	44 29 f9             	sub    %r15d,%ecx
     acf:	45 85 c0             	test   %r8d,%r8d
     ad2:	41 0f 49 c0          	cmovns %r8d,%eax
     ad6:	69 f9 6d 23 00 00    	imul   $0x236d,%ecx,%edi
     adc:	c4 63 39 22 c1 01    	vpinsrd $0x1,%ecx,%xmm8,%xmm8
     ae2:	c1 f8 10             	sar    $0x10,%eax
     ae5:	01 f8                	add    %edi,%eax
     ae7:	89 c7                	mov    %eax,%edi
     ae9:	c1 ff 1f             	sar    $0x1f,%edi
     aec:	c1 ef 11             	shr    $0x11,%edi
     aef:	01 f8                	add    %edi,%eax
     af1:	25 ff 7f 00 00       	and    $0x7fff,%eax
     af6:	41 89 c5             	mov    %eax,%r13d
     af9:	41 29 fd             	sub    %edi,%r13d
     afc:	44 89 c7             	mov    %r8d,%edi
     aff:	c1 ff 1f             	sar    $0x1f,%edi
     b02:	c4 c1 79 6e fd       	vmovd  %r13d,%xmm7
     b07:	c1 ef 10             	shr    $0x10,%edi
     b0a:	41 01 f8             	add    %edi,%r8d
     b0d:	45 0f b7 f8          	movzwl %r8w,%r15d
     b11:	41 29 ff             	sub    %edi,%r15d
     b14:	45 69 c7 6d 23 00 00 	imul   $0x236d,%r15d,%r8d
     b1b:	c4 41 79 6e d7       	vmovd  %r15d,%xmm10
     b20:	45 85 c0             	test   %r8d,%r8d
     b23:	41 8d b0 ff ff 00 00 	lea    0xffff(%r8),%esi
     b2a:	44 89 c7             	mov    %r8d,%edi
     b2d:	41 0f 49 f0          	cmovns %r8d,%esi
     b31:	41 69 c5 6d 23 00 00 	imul   $0x236d,%r13d,%eax
     b38:	c1 ff 1f             	sar    $0x1f,%edi
     b3b:	c1 ef 10             	shr    $0x10,%edi
     b3e:	c1 fe 10             	sar    $0x10,%esi
     b41:	45 8d 3c 38          	lea    (%r8,%rdi,1),%r15d
     b45:	01 c6                	add    %eax,%esi
     b47:	41 89 f5             	mov    %esi,%r13d
     b4a:	41 c1 fd 1f          	sar    $0x1f,%r13d
     b4e:	41 c1 ed 11          	shr    $0x11,%r13d
     b52:	42 8d 34 2e          	lea    (%rsi,%r13,1),%esi
     b56:	81 e6 ff 7f 00 00    	and    $0x7fff,%esi
     b5c:	44 29 ee             	sub    %r13d,%esi
     b5f:	45 0f b7 ef          	movzwl %r15w,%r13d
     b63:	41 29 fd             	sub    %edi,%r13d
     b66:	c4 e3 41 22 fe 01    	vpinsrd $0x1,%esi,%xmm7,%xmm7
     b6c:	41 69 fd 6d 23 00 00 	imul   $0x236d,%r13d,%edi
     b73:	c4 43 29 22 d5 01    	vpinsrd $0x1,%r13d,%xmm10,%xmm10
     b79:	85 ff                	test   %edi,%edi
     b7b:	44 8d b7 ff ff 00 00 	lea    0xffff(%rdi),%r14d
     b82:	44 0f 49 f7          	cmovns %edi,%r14d
     b86:	44 69 c6 6d 23 00 00 	imul   $0x236d,%esi,%r8d
     b8d:	41 c1 fe 10          	sar    $0x10,%r14d
     b91:	45 01 c6             	add    %r8d,%r14d
     b94:	41 89 f8             	mov    %edi,%r8d
     b97:	44 89 f0             	mov    %r14d,%eax
     b9a:	41 c1 f8 1f          	sar    $0x1f,%r8d
     b9e:	41 c1 e8 10          	shr    $0x10,%r8d
     ba2:	c1 f8 1f             	sar    $0x1f,%eax
     ba5:	c1 e8 11             	shr    $0x11,%eax
     ba8:	44 01 c7             	add    %r8d,%edi
     bab:	41 01 c6             	add    %eax,%r14d
     bae:	44 0f b7 ff          	movzwl %di,%r15d
     bb2:	45 29 c7             	sub    %r8d,%r15d
     bb5:	41 81 e6 ff 7f 00 00 	and    $0x7fff,%r14d
     bbc:	41 29 c6             	sub    %eax,%r14d
     bbf:	41 69 c7 6d 23 00 00 	imul   $0x236d,%r15d,%eax
     bc6:	c4 c1 79 6e f7       	vmovd  %r15d,%xmm6
     bcb:	c4 41 79 6e f6       	vmovd  %r14d,%xmm14
     bd0:	c4 41 79 7e f0       	vmovd  %xmm14,%r8d
     bd5:	85 c0                	test   %eax,%eax
     bd7:	44 8d b0 ff ff 00 00 	lea    0xffff(%rax),%r14d
     bde:	44 0f 49 f0          	cmovns %eax,%r14d
     be2:	45 69 f8 6d 23 00 00 	imul   $0x236d,%r8d,%r15d
     be9:	41 89 c0             	mov    %eax,%r8d
     bec:	41 c1 f8 1f          	sar    $0x1f,%r8d
     bf0:	41 c1 fe 10          	sar    $0x10,%r14d
     bf4:	41 c1 e8 10          	shr    $0x10,%r8d
     bf8:	45 01 f7             	add    %r14d,%r15d
     bfb:	44 01 c0             	add    %r8d,%eax
     bfe:	45 89 fe             	mov    %r15d,%r14d
     c01:	41 c1 fe 1f          	sar    $0x1f,%r14d
     c05:	41 c1 ee 11          	shr    $0x11,%r14d
     c09:	43 8d 3c 37          	lea    (%r15,%r14,1),%edi
     c0d:	81 e7 ff 7f 00 00    	and    $0x7fff,%edi
     c13:	44 29 f7             	sub    %r14d,%edi
     c16:	44 0f b7 f0          	movzwl %ax,%r14d
     c1a:	45 29 c6             	sub    %r8d,%r14d
     c1d:	c4 63 09 22 f7 01    	vpinsrd $0x1,%edi,%xmm14,%xmm14
     c23:	45 69 c6 6d 23 00 00 	imul   $0x236d,%r14d,%r8d
     c2a:	c4 c3 49 22 f6 01    	vpinsrd $0x1,%r14d,%xmm6,%xmm6
     c30:	45 85 c0             	test   %r8d,%r8d
     c33:	41 8d 80 ff ff 00 00 	lea    0xffff(%r8),%eax
     c3a:	41 0f 49 c0          	cmovns %r8d,%eax
     c3e:	44 69 ff 6d 23 00 00 	imul   $0x236d,%edi,%r15d
     c45:	c1 f8 10             	sar    $0x10,%eax
     c48:	44 01 f8             	add    %r15d,%eax
     c4b:	41 89 c7             	mov    %eax,%r15d
     c4e:	41 c1 ff 1f          	sar    $0x1f,%r15d
     c52:	41 c1 ef 11          	shr    $0x11,%r15d
     c56:	44 01 f8             	add    %r15d,%eax
     c59:	25 ff 7f 00 00       	and    $0x7fff,%eax
     c5e:	44 29 f8             	sub    %r15d,%eax
     c61:	45 89 c7             	mov    %r8d,%r15d
     c64:	41 c1 ff 1f          	sar    $0x1f,%r15d
     c68:	62 e1 7d 08 6e c8    	vmovd  %eax,%xmm17
     c6e:	41 c1 ef 10          	shr    $0x10,%r15d
     c72:	45 01 f8             	add    %r15d,%r8d
     c75:	45 0f b7 c0          	movzwl %r8w,%r8d
     c79:	45 29 f8             	sub    %r15d,%r8d
     c7c:	c4 41 79 6e e0       	vmovd  %r8d,%xmm12
     c81:	45 69 c0 6d 23 00 00 	imul   $0x236d,%r8d,%r8d
     c88:	45 85 c0             	test   %r8d,%r8d
     c8b:	45 8d b8 ff ff 00 00 	lea    0xffff(%r8),%r15d
     c92:	45 0f 49 f8          	cmovns %r8d,%r15d
     c96:	69 c0 6d 23 00 00    	imul   $0x236d,%eax,%eax
     c9c:	41 c1 ff 10          	sar    $0x10,%r15d
     ca0:	41 01 c7             	add    %eax,%r15d
     ca3:	44 89 c0             	mov    %r8d,%eax
     ca6:	c1 f8 1f             	sar    $0x1f,%eax
     ca9:	45 89 fb             	mov    %r15d,%r11d
     cac:	c1 e8 10             	shr    $0x10,%eax
     caf:	41 c1 fb 1f          	sar    $0x1f,%r11d
     cb3:	41 01 c0             	add    %eax,%r8d
     cb6:	41 c1 eb 11          	shr    $0x11,%r11d
     cba:	45 0f b7 c0          	movzwl %r8w,%r8d
     cbe:	45 01 df             	add    %r11d,%r15d
     cc1:	41 29 c0             	sub    %eax,%r8d
     cc4:	41 81 e7 ff 7f 00 00 	and    $0x7fff,%r15d
     ccb:	4c 89 c8             	mov    %r9,%rax
     cce:	c4 c3 19 22 e0 01    	vpinsrd $0x1,%r8d,%xmm12,%xmm4
     cd4:	c4 41 71 6c e2       	vpunpcklqdq %xmm10,%xmm1,%xmm12
     cd9:	45 29 df             	sub    %r11d,%r15d
     cdc:	c5 79 6c d2          	vpunpcklqdq %xmm2,%xmm0,%xmm10
     ce0:	c5 c9 6c e4          	vpunpcklqdq %xmm4,%xmm6,%xmm4
     ce4:	c4 c1 61 6c f5       	vpunpcklqdq %xmm13,%xmm3,%xmm6
     ce9:	62 f3 2d 28 38 ce 01 	vinserti32x4 $0x1,%xmm6,%ymm10,%ymm1
     cf0:	62 f3 1d 28 38 e4 01 	vinserti32x4 $0x1,%xmm4,%ymm12,%ymm4
     cf7:	c4 41 11 ef ed       	vpxor  %xmm13,%xmm13,%xmm13
     cfc:	62 73 f5 48 3a e4 01 	vinserti64x4 $0x1,%ymm4,%zmm1,%zmm12
     d03:	62 b1 76 00 10 c1    	vmovss %xmm17,%xmm17,%xmm0
     d09:	62 b2 1d 48 40 e3    	vpmulld %zmm19,%zmm12,%zmm4
     d0f:	c4 43 79 22 d7 01    	vpinsrd $0x1,%r15d,%xmm0,%xmm10
     d15:	c4 c1 51 6c c3       	vpunpcklqdq %xmm11,%xmm5,%xmm0
     d1a:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # d21 <new_Random+0x601>
     d21:	c4 41 09 6c e2       	vpunpcklqdq %xmm10,%xmm14,%xmm12
     d26:	62 b1 75 48 72 d0 10 	vpsrld $0x10,%zmm16,%zmm1
     d2d:	4d 89 79 48          	mov    %r15,0x48(%r9)
     d31:	62 d3 5d 48 1f cd 01 	vpcmpltd %zmm13,%zmm4,%k1
     d38:	c5 39 6c ef          	vpunpcklqdq %xmm7,%xmm8,%xmm13
     d3c:	62 b1 65 c9 72 d0 10 	vpsrld $0x10,%zmm16,%zmm3{%k1}{z}
     d43:	62 f1 65 48 fe f4    	vpaddd %zmm4,%zmm3,%zmm6
     d49:	c4 c1 31 6c df       	vpunpcklqdq %xmm15,%xmm9,%xmm3
     d4e:	62 73 65 28 38 d0 01 	vinserti32x4 $0x1,%xmm0,%ymm3,%ymm10
     d55:	62 f1 6d 48 72 e6 10 	vpsrad $0x10,%zmm6,%zmm2
     d5c:	62 d3 15 28 38 f4 01 	vinserti32x4 $0x1,%xmm12,%ymm13,%ymm6
     d63:	62 73 ad 48 3a f6 01 	vinserti64x4 $0x1,%ymm6,%zmm10,%zmm14
     d6a:	62 f1 7d 48 72 e4 1f 	vpsrad $0x1f,%zmm4,%zmm0
     d71:	62 32 0d 48 40 e3    	vpmulld %zmm19,%zmm14,%zmm12
     d77:	62 f1 05 48 72 d0 10 	vpsrld $0x10,%zmm0,%zmm15
     d7e:	62 d1 5d 48 fe e7    	vpaddd %zmm15,%zmm4,%zmm4
     d84:	62 b1 4d 48 72 d0 11 	vpsrld $0x11,%zmm16,%zmm6
     d8b:	62 f1 5d 48 db c9    	vpandd %zmm1,%zmm4,%zmm1
     d91:	62 51 75 48 fa cf    	vpsubd %zmm15,%zmm1,%zmm9
     d97:	62 53 35 48 03 f1 0f 	valignd $0xf,%zmm9,%zmm9,%zmm14
     d9e:	62 d1 6d 48 fe d4    	vpaddd %zmm12,%zmm2,%zmm2
     da4:	62 f1 45 48 72 e2 1f 	vpsrad $0x1f,%zmm2,%zmm7
     dab:	62 f1 3d 48 72 d7 11 	vpsrld $0x11,%zmm7,%zmm8
     db2:	c5 fb 10 7c 24 10    	vmovsd 0x10(%rsp),%xmm7
     db8:	62 51 6d 48 fe e8    	vpaddd %zmm8,%zmm2,%zmm13
     dbe:	c5 f9 28 54 24 20    	vmovapd 0x20(%rsp),%xmm2
     dc4:	62 71 15 48 db de    	vpandd %zmm6,%zmm13,%zmm11
     dca:	62 d1 25 48 fa e8    	vpsubd %zmm8,%zmm11,%zmm5
     dd0:	c5 79 7e f2          	vmovd  %xmm14,%edx
     dd4:	c5 43 5c 44 24 18    	vsubsd 0x18(%rsp),%xmm7,%xmm8
     dda:	c4 c1 79 11 51 58    	vmovupd %xmm2,0x58(%r9)
     de0:	62 73 55 48 03 e5 0f 	valignd $0xf,%zmm5,%zmm5,%zmm12
     de7:	69 da 6d 23 00 00    	imul   $0x236d,%edx,%ebx
     ded:	62 f1 65 48 72 f5 10 	vpslld $0x10,%zmm5,%zmm3
     df4:	62 51 65 48 fe d1    	vpaddd %zmm9,%zmm3,%zmm10
     dfa:	62 51 7e 48 7f 11    	vmovdqu32 %zmm10,(%r9)
     e00:	85 db                	test   %ebx,%ebx
     e02:	44 8d a3 ff ff 00 00 	lea    0xffff(%rbx),%r12d
     e09:	89 df                	mov    %ebx,%edi
     e0b:	c4 41 7b 11 41 68    	vmovsd %xmm8,0x68(%r9)
     e11:	44 0f 49 e3          	cmovns %ebx,%r12d
     e15:	c1 ff 1f             	sar    $0x1f,%edi
     e18:	c1 ef 10             	shr    $0x10,%edi
     e1b:	c5 79 7e e1          	vmovd  %xmm12,%ecx
     e1f:	41 c1 fc 10          	sar    $0x10,%r12d
     e23:	01 fb                	add    %edi,%ebx
     e25:	69 f1 6d 23 00 00    	imul   $0x236d,%ecx,%esi
     e2b:	44 0f b7 f3          	movzwl %bx,%r14d
     e2f:	41 29 fe             	sub    %edi,%r14d
     e32:	41 01 f4             	add    %esi,%r12d
     e35:	45 89 e5             	mov    %r12d,%r13d
     e38:	41 c1 fd 1f          	sar    $0x1f,%r13d
     e3c:	41 c1 ed 11          	shr    $0x11,%r13d
     e40:	45 01 ec             	add    %r13d,%r12d
     e43:	41 81 e4 ff 7f 00 00 	and    $0x7fff,%r12d
     e4a:	45 29 ec             	sub    %r13d,%r12d
     e4d:	41 c1 e4 10          	shl    $0x10,%r12d
     e51:	45 01 e6             	add    %r12d,%r14d
     e54:	45 89 71 40          	mov    %r14d,0x40(%r9)
     e58:	c5 f8 77             	vzeroupper
     e5b:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
     e5f:	5b                   	pop    %rbx
     e60:	41 5c                	pop    %r12
     e62:	41 5d                	pop    %r13
     e64:	41 5e                	pop    %r14
     e66:	41 5f                	pop    %r15
     e68:	5d                   	pop    %rbp
     e69:	c3                   	ret
     e6a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000e70 <Random_delete>:
     e70:	e9 00 00 00 00       	jmp    e75 <Random_delete+0x5>
     e75:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     e7c:	00 00 00 00 

0000000000000e80 <Random_nextDouble>:
     e80:	48 63 4f 48          	movslq 0x48(%rdi),%rcx
     e84:	4c 63 47 4c          	movslq 0x4c(%rdi),%r8
     e88:	41 ba 10 00 00 00    	mov    $0x10,%r10d
     e8e:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
     e92:	44 8b 5f 50          	mov    0x50(%rdi),%r11d
     e96:	44 8b 0c 8f          	mov    (%rdi,%rcx,4),%r9d
     e9a:	46 2b 0c 87          	sub    (%rdi,%r8,4),%r9d
     e9e:	48 89 ca             	mov    %rcx,%rdx
     ea1:	4c 89 c0             	mov    %r8,%rax
     ea4:	41 8d b1 ff ff ff 7f 	lea    0x7fffffff(%r9),%esi
     eab:	44 0f 48 ce          	cmovs  %esi,%r9d
     eaf:	83 ea 01             	sub    $0x1,%edx
     eb2:	41 0f 42 d2          	cmovb  %r10d,%edx
     eb6:	83 e8 01             	sub    $0x1,%eax
     eb9:	41 0f 42 c2          	cmovb  %r10d,%eax
     ebd:	46 89 0c 87          	mov    %r9d,(%rdi,%r8,4)
     ec1:	c4 c1 7b 2a c9       	vcvtsi2sd %r9d,%xmm0,%xmm1
     ec6:	89 57 48             	mov    %edx,0x48(%rdi)
     ec9:	c5 f3 59 05 00 00 00 	vmulsd 0x0(%rip),%xmm1,%xmm0        # ed1 <Random_nextDouble+0x51>
     ed0:	00 
     ed1:	89 47 4c             	mov    %eax,0x4c(%rdi)
     ed4:	45 85 db             	test   %r11d,%r11d
     ed7:	74 0a                	je     ee3 <Random_nextDouble+0x63>
     ed9:	c5 fb 59 57 68       	vmulsd 0x68(%rdi),%xmm0,%xmm2
     ede:	c5 eb 58 47 58       	vaddsd 0x58(%rdi),%xmm2,%xmm0
     ee3:	c3                   	ret
     ee4:	90                   	nop
     ee5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     eec:	00 00 00 00 

0000000000000ef0 <RandomVector>:
     ef0:	41 54                	push   %r12
     ef2:	55                   	push   %rbp
     ef3:	89 fd                	mov    %edi,%ebp
     ef5:	53                   	push   %rbx
     ef6:	49 89 ec             	mov    %rbp,%r12
     ef9:	48 c1 e5 03          	shl    $0x3,%rbp
     efd:	48 89 f3             	mov    %rsi,%rbx
     f00:	48 89 ef             	mov    %rbp,%rdi
     f03:	e8 00 00 00 00       	call   f08 <RandomVector+0x18>
     f08:	48 89 c6             	mov    %rax,%rsi
     f0b:	45 85 e4             	test   %r12d,%r12d
     f0e:	0f 84 05 01 00 00    	je     1019 <RandomVector+0x129>
     f14:	8b 4b 50             	mov    0x50(%rbx),%ecx
     f17:	8b 53 48             	mov    0x48(%rbx),%edx
     f1a:	c5 f0 57 c9          	vxorps %xmm1,%xmm1,%xmm1
     f1e:	c5 fb 10 15 00 00 00 	vmovsd 0x0(%rip),%xmm2        # f26 <RandomVector+0x36>
     f25:	00 
     f26:	8b 43 4c             	mov    0x4c(%rbx),%eax
     f29:	85 c9                	test   %ecx,%ecx
     f2b:	0f 85 f7 00 00 00    	jne    1028 <RandomVector+0x138>
     f31:	4c 8d 14 2e          	lea    (%rsi,%rbp,1),%r10
     f35:	83 e5 08             	and    $0x8,%ebp
     f38:	49 89 f4             	mov    %rsi,%r12
     f3b:	41 b9 10 00 00 00    	mov    $0x10,%r9d
     f41:	74 4d                	je     f90 <RandomVector+0xa0>
     f43:	4c 63 e2             	movslq %edx,%r12
     f46:	4c 63 c0             	movslq %eax,%r8
     f49:	42 8b 2c a3          	mov    (%rbx,%r12,4),%ebp
     f4d:	42 2b 2c 83          	sub    (%rbx,%r8,4),%ebp
     f51:	4c 8d 66 08          	lea    0x8(%rsi),%r12
     f55:	8d bd ff ff ff 7f    	lea    0x7fffffff(%rbp),%edi
     f5b:	0f 48 ef             	cmovs  %edi,%ebp
     f5e:	83 ea 01             	sub    $0x1,%edx
     f61:	41 0f 42 d1          	cmovb  %r9d,%edx
     f65:	83 e8 01             	sub    $0x1,%eax
     f68:	c5 f3 2a e5          	vcvtsi2sd %ebp,%xmm1,%xmm4
     f6c:	41 0f 42 c1          	cmovb  %r9d,%eax
     f70:	42 89 2c 83          	mov    %ebp,(%rbx,%r8,4)
     f74:	89 53 48             	mov    %edx,0x48(%rbx)
     f77:	c5 db 59 da          	vmulsd %xmm2,%xmm4,%xmm3
     f7b:	89 43 4c             	mov    %eax,0x4c(%rbx)
     f7e:	c5 fb 11 1e          	vmovsd %xmm3,(%rsi)
     f82:	4d 39 e2             	cmp    %r12,%r10
     f85:	0f 84 8e 00 00 00    	je     1019 <RandomVector+0x129>
     f8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
     f90:	4c 63 d8             	movslq %eax,%r11
     f93:	48 63 ca             	movslq %edx,%rcx
     f96:	8b 2c 8b             	mov    (%rbx,%rcx,4),%ebp
     f99:	42 2b 2c 9b          	sub    (%rbx,%r11,4),%ebp
     f9d:	44 8d 85 ff ff ff 7f 	lea    0x7fffffff(%rbp),%r8d
     fa4:	41 0f 48 e8          	cmovs  %r8d,%ebp
     fa8:	83 ea 01             	sub    $0x1,%edx
     fab:	41 0f 42 d1          	cmovb  %r9d,%edx
     faf:	83 e8 01             	sub    $0x1,%eax
     fb2:	41 0f 42 c1          	cmovb  %r9d,%eax
     fb6:	42 89 2c 9b          	mov    %ebp,(%rbx,%r11,4)
     fba:	c5 f3 2a c5          	vcvtsi2sd %ebp,%xmm1,%xmm0
     fbe:	48 63 fa             	movslq %edx,%rdi
     fc1:	89 53 48             	mov    %edx,0x48(%rbx)
     fc4:	89 43 4c             	mov    %eax,0x4c(%rbx)
     fc7:	8b 0c bb             	mov    (%rbx,%rdi,4),%ecx
     fca:	c5 fb 59 ea          	vmulsd %xmm2,%xmm0,%xmm5
     fce:	4c 63 d8             	movslq %eax,%r11
     fd1:	42 2b 0c 9b          	sub    (%rbx,%r11,4),%ecx
     fd5:	8d a9 ff ff ff 7f    	lea    0x7fffffff(%rcx),%ebp
     fdb:	0f 48 cd             	cmovs  %ebp,%ecx
     fde:	83 ea 01             	sub    $0x1,%edx
     fe1:	41 0f 42 d1          	cmovb  %r9d,%edx
     fe5:	83 e8 01             	sub    $0x1,%eax
     fe8:	c5 f3 2a f1          	vcvtsi2sd %ecx,%xmm1,%xmm6
     fec:	41 0f 42 c1          	cmovb  %r9d,%eax
     ff0:	49 83 c4 10          	add    $0x10,%r12
     ff4:	42 89 0c 9b          	mov    %ecx,(%rbx,%r11,4)
     ff8:	c4 c1 7b 11 6c 24 f0 	vmovsd %xmm5,-0x10(%r12)
     fff:	c5 cb 59 fa          	vmulsd %xmm2,%xmm6,%xmm7
    1003:	89 53 48             	mov    %edx,0x48(%rbx)
    1006:	89 43 4c             	mov    %eax,0x4c(%rbx)
    1009:	c4 c1 7b 11 7c 24 f8 	vmovsd %xmm7,-0x8(%r12)
    1010:	4d 39 e2             	cmp    %r12,%r10
    1013:	0f 85 77 ff ff ff    	jne    f90 <RandomVector+0xa0>
    1019:	5b                   	pop    %rbx
    101a:	48 89 f0             	mov    %rsi,%rax
    101d:	5d                   	pop    %rbp
    101e:	41 5c                	pop    %r12
    1020:	c3                   	ret
    1021:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1028:	4c 8d 14 2e          	lea    (%rsi,%rbp,1),%r10
    102c:	83 e5 08             	and    $0x8,%ebp
    102f:	c5 fb 10 63 68       	vmovsd 0x68(%rbx),%xmm4
    1034:	49 89 f4             	mov    %rsi,%r12
    1037:	c5 fb 10 5b 58       	vmovsd 0x58(%rbx),%xmm3
    103c:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    1042:	74 5c                	je     10a0 <RandomVector+0x1b0>
    1044:	4c 63 c0             	movslq %eax,%r8
    1047:	48 63 fa             	movslq %edx,%rdi
    104a:	4c 8d 66 08          	lea    0x8(%rsi),%r12
    104e:	44 8b 1c bb          	mov    (%rbx,%rdi,4),%r11d
    1052:	46 2b 1c 83          	sub    (%rbx,%r8,4),%r11d
    1056:	41 8d ab ff ff ff 7f 	lea    0x7fffffff(%r11),%ebp
    105d:	44 0f 48 dd          	cmovs  %ebp,%r11d
    1061:	83 ea 01             	sub    $0x1,%edx
    1064:	41 0f 42 d1          	cmovb  %r9d,%edx
    1068:	83 e8 01             	sub    $0x1,%eax
    106b:	c4 c1 73 2a c3       	vcvtsi2sd %r11d,%xmm1,%xmm0
    1070:	41 0f 42 c1          	cmovb  %r9d,%eax
    1074:	46 89 1c 83          	mov    %r11d,(%rbx,%r8,4)
    1078:	89 53 48             	mov    %edx,0x48(%rbx)
    107b:	c5 fb 59 ea          	vmulsd %xmm2,%xmm0,%xmm5
    107f:	89 43 4c             	mov    %eax,0x4c(%rbx)
    1082:	c5 d3 59 f4          	vmulsd %xmm4,%xmm5,%xmm6
    1086:	c5 cb 58 fb          	vaddsd %xmm3,%xmm6,%xmm7
    108a:	c5 fb 11 3e          	vmovsd %xmm7,(%rsi)
    108e:	4d 39 e2             	cmp    %r12,%r10
    1091:	74 86                	je     1019 <RandomVector+0x129>
    1093:	66 90                	xchg   %ax,%ax
    1095:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    109c:	00 00 00 00 
    10a0:	48 63 f8             	movslq %eax,%rdi
    10a3:	48 63 ca             	movslq %edx,%rcx
    10a6:	44 8b 1c 8b          	mov    (%rbx,%rcx,4),%r11d
    10aa:	44 2b 1c bb          	sub    (%rbx,%rdi,4),%r11d
    10ae:	45 8d 83 ff ff ff 7f 	lea    0x7fffffff(%r11),%r8d
    10b5:	45 0f 48 d8          	cmovs  %r8d,%r11d
    10b9:	83 ea 01             	sub    $0x1,%edx
    10bc:	41 0f 42 d1          	cmovb  %r9d,%edx
    10c0:	83 e8 01             	sub    $0x1,%eax
    10c3:	41 0f 42 c1          	cmovb  %r9d,%eax
    10c7:	44 89 1c bb          	mov    %r11d,(%rbx,%rdi,4)
    10cb:	c4 41 73 2a c3       	vcvtsi2sd %r11d,%xmm1,%xmm8
    10d0:	48 63 ea             	movslq %edx,%rbp
    10d3:	89 53 48             	mov    %edx,0x48(%rbx)
    10d6:	89 43 4c             	mov    %eax,0x4c(%rbx)
    10d9:	8b 0c ab             	mov    (%rbx,%rbp,4),%ecx
    10dc:	c5 3b 59 ca          	vmulsd %xmm2,%xmm8,%xmm9
    10e0:	48 63 f8             	movslq %eax,%rdi
    10e3:	2b 0c bb             	sub    (%rbx,%rdi,4),%ecx
    10e6:	44 8d 99 ff ff ff 7f 	lea    0x7fffffff(%rcx),%r11d
    10ed:	41 0f 48 cb          	cmovs  %r11d,%ecx
    10f1:	83 ea 01             	sub    $0x1,%edx
    10f4:	41 0f 42 d1          	cmovb  %r9d,%edx
    10f8:	83 e8 01             	sub    $0x1,%eax
    10fb:	c5 73 2a e1          	vcvtsi2sd %ecx,%xmm1,%xmm12
    10ff:	41 0f 42 c1          	cmovb  %r9d,%eax
    1103:	49 83 c4 10          	add    $0x10,%r12
    1107:	89 0c bb             	mov    %ecx,(%rbx,%rdi,4)
    110a:	89 53 48             	mov    %edx,0x48(%rbx)
    110d:	c5 1b 59 ea          	vmulsd %xmm2,%xmm12,%xmm13
    1111:	89 43 4c             	mov    %eax,0x4c(%rbx)
    1114:	c5 33 59 d4          	vmulsd %xmm4,%xmm9,%xmm10
    1118:	c5 13 59 f4          	vmulsd %xmm4,%xmm13,%xmm14
    111c:	c5 2b 58 db          	vaddsd %xmm3,%xmm10,%xmm11
    1120:	c4 41 7b 11 5c 24 f0 	vmovsd %xmm11,-0x10(%r12)
    1127:	c5 0b 58 fb          	vaddsd %xmm3,%xmm14,%xmm15
    112b:	c4 41 7b 11 7c 24 f8 	vmovsd %xmm15,-0x8(%r12)
    1132:	4d 39 e2             	cmp    %r12,%r10
    1135:	0f 85 65 ff ff ff    	jne    10a0 <RandomVector+0x1b0>
    113b:	e9 d9 fe ff ff       	jmp    1019 <RandomVector+0x129>

0000000000001140 <RandomMatrix>:
    1140:	41 57                	push   %r15
    1142:	41 56                	push   %r14
    1144:	41 55                	push   %r13
    1146:	41 54                	push   %r12
    1148:	41 89 f4             	mov    %esi,%r12d
    114b:	55                   	push   %rbp
    114c:	89 fd                	mov    %edi,%ebp
    114e:	53                   	push   %rbx
    114f:	49 89 ee             	mov    %rbp,%r14
    1152:	48 c1 e5 03          	shl    $0x3,%rbp
    1156:	48 89 d3             	mov    %rdx,%rbx
    1159:	48 89 ef             	mov    %rbp,%rdi
    115c:	48 83 ec 18          	sub    $0x18,%rsp
    1160:	e8 00 00 00 00       	call   1165 <RandomMatrix+0x25>
    1165:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    116a:	48 85 c0             	test   %rax,%rax
    116d:	0f 84 a2 02 00 00    	je     1415 <RandomMatrix+0x2d5>
    1173:	45 85 f6             	test   %r14d,%r14d
    1176:	0f 84 5a 01 00 00    	je     12d6 <RandomMatrix+0x196>
    117c:	44 89 e7             	mov    %r12d,%edi
    117f:	49 89 c7             	mov    %rax,%r15
    1182:	48 01 c5             	add    %rax,%rbp
    1185:	41 be 10 00 00 00    	mov    $0x10,%r14d
    118b:	4c 8d 2c fd 00 00 00 	lea    0x0(,%rdi,8),%r13
    1192:	00 
    1193:	66 90                	xchg   %ax,%ax
    1195:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    119c:	00 00 00 00 
    11a0:	4c 89 ef             	mov    %r13,%rdi
    11a3:	e8 00 00 00 00       	call   11a8 <RandomMatrix+0x68>
    11a8:	49 89 07             	mov    %rax,(%r15)
    11ab:	48 89 c1             	mov    %rax,%rcx
    11ae:	48 85 c0             	test   %rax,%rax
    11b1:	0f 84 54 02 00 00    	je     140b <RandomMatrix+0x2cb>
    11b7:	45 85 e4             	test   %r12d,%r12d
    11ba:	c5 f0 57 c9          	vxorps %xmm1,%xmm1,%xmm1
    11be:	0f 84 05 01 00 00    	je     12c9 <RandomMatrix+0x189>
    11c4:	8b 73 50             	mov    0x50(%rbx),%esi
    11c7:	8b 53 48             	mov    0x48(%rbx),%edx
    11ca:	c5 fb 10 15 00 00 00 	vmovsd 0x0(%rip),%xmm2        # 11d2 <RandomMatrix+0x92>
    11d1:	00 
    11d2:	8b 43 4c             	mov    0x4c(%rbx),%eax
    11d5:	85 f6                	test   %esi,%esi
    11d7:	0f 85 13 01 00 00    	jne    12f0 <RandomMatrix+0x1b0>
    11dd:	48 89 cf             	mov    %rcx,%rdi
    11e0:	4e 8d 04 29          	lea    (%rcx,%r13,1),%r8
    11e4:	41 f6 c5 08          	test   $0x8,%r13b
    11e8:	74 56                	je     1240 <RandomMatrix+0x100>
    11ea:	4c 63 d8             	movslq %eax,%r11
    11ed:	4c 63 ca             	movslq %edx,%r9
    11f0:	42 8b 34 8b          	mov    (%rbx,%r9,4),%esi
    11f4:	42 2b 34 9b          	sub    (%rbx,%r11,4),%esi
    11f8:	44 8d 96 ff ff ff 7f 	lea    0x7fffffff(%rsi),%r10d
    11ff:	41 0f 48 f2          	cmovs  %r10d,%esi
    1203:	83 ea 01             	sub    $0x1,%edx
    1206:	41 0f 42 d6          	cmovb  %r14d,%edx
    120a:	83 e8 01             	sub    $0x1,%eax
    120d:	c5 f3 2a e6          	vcvtsi2sd %esi,%xmm1,%xmm4
    1211:	41 0f 42 c6          	cmovb  %r14d,%eax
    1215:	48 83 c7 08          	add    $0x8,%rdi
    1219:	42 89 34 9b          	mov    %esi,(%rbx,%r11,4)
    121d:	89 53 48             	mov    %edx,0x48(%rbx)
    1220:	c5 db 59 da          	vmulsd %xmm2,%xmm4,%xmm3
    1224:	89 43 4c             	mov    %eax,0x4c(%rbx)
    1227:	c5 fb 11 19          	vmovsd %xmm3,(%rcx)
    122b:	49 39 f8             	cmp    %rdi,%r8
    122e:	0f 84 95 00 00 00    	je     12c9 <RandomMatrix+0x189>
    1234:	90                   	nop
    1235:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    123c:	00 00 00 00 
    1240:	4c 63 d8             	movslq %eax,%r11
    1243:	48 63 ca             	movslq %edx,%rcx
    1246:	8b 34 8b             	mov    (%rbx,%rcx,4),%esi
    1249:	42 2b 34 9b          	sub    (%rbx,%r11,4),%esi
    124d:	44 8d 8e ff ff ff 7f 	lea    0x7fffffff(%rsi),%r9d
    1254:	41 0f 48 f1          	cmovs  %r9d,%esi
    1258:	83 ea 01             	sub    $0x1,%edx
    125b:	41 0f 42 d6          	cmovb  %r14d,%edx
    125f:	83 e8 01             	sub    $0x1,%eax
    1262:	41 0f 42 c6          	cmovb  %r14d,%eax
    1266:	42 89 34 9b          	mov    %esi,(%rbx,%r11,4)
    126a:	c5 f3 2a c6          	vcvtsi2sd %esi,%xmm1,%xmm0
    126e:	48 63 ca             	movslq %edx,%rcx
    1271:	89 53 48             	mov    %edx,0x48(%rbx)
    1274:	89 43 4c             	mov    %eax,0x4c(%rbx)
    1277:	44 8b 1c 8b          	mov    (%rbx,%rcx,4),%r11d
    127b:	c5 fb 59 ea          	vmulsd %xmm2,%xmm0,%xmm5
    127f:	4c 63 d0             	movslq %eax,%r10
    1282:	46 2b 1c 93          	sub    (%rbx,%r10,4),%r11d
    1286:	41 8d b3 ff ff ff 7f 	lea    0x7fffffff(%r11),%esi
    128d:	44 0f 48 de          	cmovs  %esi,%r11d
    1291:	83 ea 01             	sub    $0x1,%edx
    1294:	41 0f 42 d6          	cmovb  %r14d,%edx
    1298:	83 e8 01             	sub    $0x1,%eax
    129b:	c4 c1 73 2a f3       	vcvtsi2sd %r11d,%xmm1,%xmm6
    12a0:	41 0f 42 c6          	cmovb  %r14d,%eax
    12a4:	48 83 c7 10          	add    $0x10,%rdi
    12a8:	46 89 1c 93          	mov    %r11d,(%rbx,%r10,4)
    12ac:	c5 fb 11 6f f0       	vmovsd %xmm5,-0x10(%rdi)
    12b1:	c5 cb 59 fa          	vmulsd %xmm2,%xmm6,%xmm7
    12b5:	89 53 48             	mov    %edx,0x48(%rbx)
    12b8:	89 43 4c             	mov    %eax,0x4c(%rbx)
    12bb:	c5 fb 11 7f f8       	vmovsd %xmm7,-0x8(%rdi)
    12c0:	49 39 f8             	cmp    %rdi,%r8
    12c3:	0f 85 77 ff ff ff    	jne    1240 <RandomMatrix+0x100>
    12c9:	49 83 c7 08          	add    $0x8,%r15
    12cd:	4c 39 fd             	cmp    %r15,%rbp
    12d0:	0f 85 ca fe ff ff    	jne    11a0 <RandomMatrix+0x60>
    12d6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    12db:	48 83 c4 18          	add    $0x18,%rsp
    12df:	5b                   	pop    %rbx
    12e0:	5d                   	pop    %rbp
    12e1:	41 5c                	pop    %r12
    12e3:	41 5d                	pop    %r13
    12e5:	41 5e                	pop    %r14
    12e7:	41 5f                	pop    %r15
    12e9:	c3                   	ret
    12ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    12f0:	c5 fb 10 63 68       	vmovsd 0x68(%rbx),%xmm4
    12f5:	c5 fb 10 5b 58       	vmovsd 0x58(%rbx),%xmm3
    12fa:	48 89 cf             	mov    %rcx,%rdi
    12fd:	4e 8d 04 29          	lea    (%rcx,%r13,1),%r8
    1301:	41 f6 c5 08          	test   $0x8,%r13b
    1305:	74 59                	je     1360 <RandomMatrix+0x220>
    1307:	4c 63 d8             	movslq %eax,%r11
    130a:	4c 63 ca             	movslq %edx,%r9
    130d:	42 8b 34 8b          	mov    (%rbx,%r9,4),%esi
    1311:	42 2b 34 9b          	sub    (%rbx,%r11,4),%esi
    1315:	44 8d 96 ff ff ff 7f 	lea    0x7fffffff(%rsi),%r10d
    131c:	41 0f 48 f2          	cmovs  %r10d,%esi
    1320:	83 ea 01             	sub    $0x1,%edx
    1323:	41 0f 42 d6          	cmovb  %r14d,%edx
    1327:	83 e8 01             	sub    $0x1,%eax
    132a:	c5 f3 2a c6          	vcvtsi2sd %esi,%xmm1,%xmm0
    132e:	41 0f 42 c6          	cmovb  %r14d,%eax
    1332:	48 83 c7 08          	add    $0x8,%rdi
    1336:	42 89 34 9b          	mov    %esi,(%rbx,%r11,4)
    133a:	89 53 48             	mov    %edx,0x48(%rbx)
    133d:	c5 fb 59 ea          	vmulsd %xmm2,%xmm0,%xmm5
    1341:	89 43 4c             	mov    %eax,0x4c(%rbx)
    1344:	c5 d3 59 f4          	vmulsd %xmm4,%xmm5,%xmm6
    1348:	c5 cb 58 fb          	vaddsd %xmm3,%xmm6,%xmm7
    134c:	c5 fb 11 39          	vmovsd %xmm7,(%rcx)
    1350:	49 39 f8             	cmp    %rdi,%r8
    1353:	0f 84 70 ff ff ff    	je     12c9 <RandomMatrix+0x189>
    1359:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1360:	4c 63 d8             	movslq %eax,%r11
    1363:	48 63 ca             	movslq %edx,%rcx
    1366:	8b 34 8b             	mov    (%rbx,%rcx,4),%esi
    1369:	42 2b 34 9b          	sub    (%rbx,%r11,4),%esi
    136d:	44 8d 8e ff ff ff 7f 	lea    0x7fffffff(%rsi),%r9d
    1374:	41 0f 48 f1          	cmovs  %r9d,%esi
    1378:	83 ea 01             	sub    $0x1,%edx
    137b:	41 0f 42 d6          	cmovb  %r14d,%edx
    137f:	83 e8 01             	sub    $0x1,%eax
    1382:	41 0f 42 c6          	cmovb  %r14d,%eax
    1386:	42 89 34 9b          	mov    %esi,(%rbx,%r11,4)
    138a:	c5 73 2a c6          	vcvtsi2sd %esi,%xmm1,%xmm8
    138e:	48 63 ca             	movslq %edx,%rcx
    1391:	89 53 48             	mov    %edx,0x48(%rbx)
    1394:	89 43 4c             	mov    %eax,0x4c(%rbx)
    1397:	44 8b 1c 8b          	mov    (%rbx,%rcx,4),%r11d
    139b:	c5 3b 59 ca          	vmulsd %xmm2,%xmm8,%xmm9
    139f:	4c 63 d0             	movslq %eax,%r10
    13a2:	46 2b 1c 93          	sub    (%rbx,%r10,4),%r11d
    13a6:	41 8d b3 ff ff ff 7f 	lea    0x7fffffff(%r11),%esi
    13ad:	44 0f 48 de          	cmovs  %esi,%r11d
    13b1:	83 ea 01             	sub    $0x1,%edx
    13b4:	41 0f 42 d6          	cmovb  %r14d,%edx
    13b8:	83 e8 01             	sub    $0x1,%eax
    13bb:	c4 41 73 2a e3       	vcvtsi2sd %r11d,%xmm1,%xmm12
    13c0:	41 0f 42 c6          	cmovb  %r14d,%eax
    13c4:	48 83 c7 10          	add    $0x10,%rdi
    13c8:	46 89 1c 93          	mov    %r11d,(%rbx,%r10,4)
    13cc:	89 53 48             	mov    %edx,0x48(%rbx)
    13cf:	c5 1b 59 ea          	vmulsd %xmm2,%xmm12,%xmm13
    13d3:	89 43 4c             	mov    %eax,0x4c(%rbx)
    13d6:	c5 33 59 d4          	vmulsd %xmm4,%xmm9,%xmm10
    13da:	c5 13 59 f4          	vmulsd %xmm4,%xmm13,%xmm14
    13de:	c5 2b 58 db          	vaddsd %xmm3,%xmm10,%xmm11
    13e2:	c5 7b 11 5f f0       	vmovsd %xmm11,-0x10(%rdi)
    13e7:	c5 0b 58 fb          	vaddsd %xmm3,%xmm14,%xmm15
    13eb:	c5 7b 11 7f f8       	vmovsd %xmm15,-0x8(%rdi)
    13f0:	49 39 f8             	cmp    %rdi,%r8
    13f3:	0f 85 67 ff ff ff    	jne    1360 <RandomMatrix+0x220>
    13f9:	49 83 c7 08          	add    $0x8,%r15
    13fd:	4c 39 fd             	cmp    %r15,%rbp
    1400:	0f 85 9a fd ff ff    	jne    11a0 <RandomMatrix+0x60>
    1406:	e9 cb fe ff ff       	jmp    12d6 <RandomMatrix+0x196>
    140b:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1410:	e8 00 00 00 00       	call   1415 <RandomMatrix+0x2d5>
    1415:	31 ed                	xor    %ebp,%ebp
    1417:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    141c:	e9 b5 fe ff ff       	jmp    12d6 <RandomMatrix+0x196>
