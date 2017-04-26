
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400a98 <_init>:
  400a98:	48 83 ec 08          	sub    $0x8,%rsp
  400a9c:	48 8b 05 55 25 20 00 	mov    0x202555(%rip),%rax        # 602ff8 <_DYNAMIC+0x1d0>
  400aa3:	48 85 c0             	test   %rax,%rax
  400aa6:	74 05                	je     400aad <_init+0x15>
  400aa8:	e8 23 01 00 00       	callq  400bd0 <__gmon_start__@plt>
  400aad:	48 83 c4 08          	add    $0x8,%rsp
  400ab1:	c3                   	retq   

Disassembly of section .plt:

0000000000400ac0 <getenv@plt-0x10>:
  400ac0:	ff 35 42 25 20 00    	pushq  0x202542(%rip)        # 603008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400ac6:	ff 25 44 25 20 00    	jmpq   *0x202544(%rip)        # 603010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400acc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400ad0 <getenv@plt>:
  400ad0:	ff 25 42 25 20 00    	jmpq   *0x202542(%rip)        # 603018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400ad6:	68 00 00 00 00       	pushq  $0x0
  400adb:	e9 e0 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400ae0 <strcpy@plt>:
  400ae0:	ff 25 3a 25 20 00    	jmpq   *0x20253a(%rip)        # 603020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400ae6:	68 01 00 00 00       	pushq  $0x1
  400aeb:	e9 d0 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400af0 <puts@plt>:
  400af0:	ff 25 32 25 20 00    	jmpq   *0x202532(%rip)        # 603028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400af6:	68 02 00 00 00       	pushq  $0x2
  400afb:	e9 c0 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400b00 <fclose@plt>:
  400b00:	ff 25 2a 25 20 00    	jmpq   *0x20252a(%rip)        # 603030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400b06:	68 03 00 00 00       	pushq  $0x3
  400b0b:	e9 b0 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400b10 <system@plt>:
  400b10:	ff 25 22 25 20 00    	jmpq   *0x202522(%rip)        # 603038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400b16:	68 04 00 00 00       	pushq  $0x4
  400b1b:	e9 a0 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400b20 <printf@plt>:
  400b20:	ff 25 1a 25 20 00    	jmpq   *0x20251a(%rip)        # 603040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400b26:	68 05 00 00 00       	pushq  $0x5
  400b2b:	e9 90 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400b30 <rewind@plt>:
  400b30:	ff 25 12 25 20 00    	jmpq   *0x202512(%rip)        # 603048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400b36:	68 06 00 00 00       	pushq  $0x6
  400b3b:	e9 80 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400b40 <dup@plt>:
  400b40:	ff 25 0a 25 20 00    	jmpq   *0x20250a(%rip)        # 603050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400b46:	68 07 00 00 00       	pushq  $0x7
  400b4b:	e9 70 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400b50 <close@plt>:
  400b50:	ff 25 02 25 20 00    	jmpq   *0x202502(%rip)        # 603058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400b56:	68 08 00 00 00       	pushq  $0x8
  400b5b:	e9 60 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400b60 <fputc@plt>:
  400b60:	ff 25 fa 24 20 00    	jmpq   *0x2024fa(%rip)        # 603060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400b66:	68 09 00 00 00       	pushq  $0x9
  400b6b:	e9 50 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400b70 <__libc_start_main@plt>:
  400b70:	ff 25 f2 24 20 00    	jmpq   *0x2024f2(%rip)        # 603068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400b76:	68 0a 00 00 00       	pushq  $0xa
  400b7b:	e9 40 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400b80 <fgets@plt>:
  400b80:	ff 25 ea 24 20 00    	jmpq   *0x2024ea(%rip)        # 603070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400b86:	68 0b 00 00 00       	pushq  $0xb
  400b8b:	e9 30 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400b90 <tmpfile@plt>:
  400b90:	ff 25 e2 24 20 00    	jmpq   *0x2024e2(%rip)        # 603078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400b96:	68 0c 00 00 00       	pushq  $0xc
  400b9b:	e9 20 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400ba0 <signal@plt>:
  400ba0:	ff 25 da 24 20 00    	jmpq   *0x2024da(%rip)        # 603080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400ba6:	68 0d 00 00 00       	pushq  $0xd
  400bab:	e9 10 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400bb0 <gethostbyname@plt>:
  400bb0:	ff 25 d2 24 20 00    	jmpq   *0x2024d2(%rip)        # 603088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400bb6:	68 0e 00 00 00       	pushq  $0xe
  400bbb:	e9 00 ff ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400bc0 <fprintf@plt>:
  400bc0:	ff 25 ca 24 20 00    	jmpq   *0x2024ca(%rip)        # 603090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400bc6:	68 0f 00 00 00       	pushq  $0xf
  400bcb:	e9 f0 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400bd0 <__gmon_start__@plt>:
  400bd0:	ff 25 c2 24 20 00    	jmpq   *0x2024c2(%rip)        # 603098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400bd6:	68 10 00 00 00       	pushq  $0x10
  400bdb:	e9 e0 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400be0 <strtol@plt>:
  400be0:	ff 25 ba 24 20 00    	jmpq   *0x2024ba(%rip)        # 6030a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400be6:	68 11 00 00 00       	pushq  $0x11
  400beb:	e9 d0 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400bf0 <fflush@plt>:
  400bf0:	ff 25 b2 24 20 00    	jmpq   *0x2024b2(%rip)        # 6030a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400bf6:	68 12 00 00 00       	pushq  $0x12
  400bfb:	e9 c0 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400c00 <__isoc99_sscanf@plt>:
  400c00:	ff 25 aa 24 20 00    	jmpq   *0x2024aa(%rip)        # 6030b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400c06:	68 13 00 00 00       	pushq  $0x13
  400c0b:	e9 b0 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400c10 <bcopy@plt>:
  400c10:	ff 25 a2 24 20 00    	jmpq   *0x2024a2(%rip)        # 6030b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400c16:	68 14 00 00 00       	pushq  $0x14
  400c1b:	e9 a0 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400c20 <cuserid@plt>:
  400c20:	ff 25 9a 24 20 00    	jmpq   *0x20249a(%rip)        # 6030c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400c26:	68 15 00 00 00       	pushq  $0x15
  400c2b:	e9 90 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400c30 <fopen@plt>:
  400c30:	ff 25 92 24 20 00    	jmpq   *0x202492(%rip)        # 6030c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400c36:	68 16 00 00 00       	pushq  $0x16
  400c3b:	e9 80 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400c40 <sprintf@plt>:
  400c40:	ff 25 8a 24 20 00    	jmpq   *0x20248a(%rip)        # 6030d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400c46:	68 17 00 00 00       	pushq  $0x17
  400c4b:	e9 70 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400c50 <exit@plt>:
  400c50:	ff 25 82 24 20 00    	jmpq   *0x202482(%rip)        # 6030d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400c56:	68 18 00 00 00       	pushq  $0x18
  400c5b:	e9 60 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400c60 <connect@plt>:
  400c60:	ff 25 7a 24 20 00    	jmpq   *0x20247a(%rip)        # 6030e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400c66:	68 19 00 00 00       	pushq  $0x19
  400c6b:	e9 50 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400c70 <fwrite@plt>:
  400c70:	ff 25 72 24 20 00    	jmpq   *0x202472(%rip)        # 6030e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400c76:	68 1a 00 00 00       	pushq  $0x1a
  400c7b:	e9 40 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400c80 <sleep@plt>:
  400c80:	ff 25 6a 24 20 00    	jmpq   *0x20246a(%rip)        # 6030f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400c86:	68 1b 00 00 00       	pushq  $0x1b
  400c8b:	e9 30 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400c90 <__ctype_b_loc@plt>:
  400c90:	ff 25 62 24 20 00    	jmpq   *0x202462(%rip)        # 6030f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400c96:	68 1c 00 00 00       	pushq  $0x1c
  400c9b:	e9 20 fe ff ff       	jmpq   400ac0 <_init+0x28>

0000000000400ca0 <socket@plt>:
  400ca0:	ff 25 5a 24 20 00    	jmpq   *0x20245a(%rip)        # 603100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400ca6:	68 1d 00 00 00       	pushq  $0x1d
  400cab:	e9 10 fe ff ff       	jmpq   400ac0 <_init+0x28>

Disassembly of section .text:

0000000000400cb0 <_start>:
  400cb0:	31 ed                	xor    %ebp,%ebp
  400cb2:	49 89 d1             	mov    %rdx,%r9
  400cb5:	5e                   	pop    %rsi
  400cb6:	48 89 e2             	mov    %rsp,%rdx
  400cb9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400cbd:	50                   	push   %rax
  400cbe:	54                   	push   %rsp
  400cbf:	49 c7 c0 b0 18 40 00 	mov    $0x4018b0,%r8
  400cc6:	48 c7 c1 40 18 40 00 	mov    $0x401840,%rcx
  400ccd:	48 c7 c7 a6 0d 40 00 	mov    $0x400da6,%rdi
  400cd4:	e8 97 fe ff ff       	callq  400b70 <__libc_start_main@plt>
  400cd9:	f4                   	hlt    
  400cda:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400ce0 <deregister_tm_clones>:
  400ce0:	b8 27 3a 60 00       	mov    $0x603a27,%eax
  400ce5:	55                   	push   %rbp
  400ce6:	48 2d 20 3a 60 00    	sub    $0x603a20,%rax
  400cec:	48 83 f8 0e          	cmp    $0xe,%rax
  400cf0:	48 89 e5             	mov    %rsp,%rbp
  400cf3:	76 1b                	jbe    400d10 <deregister_tm_clones+0x30>
  400cf5:	b8 00 00 00 00       	mov    $0x0,%eax
  400cfa:	48 85 c0             	test   %rax,%rax
  400cfd:	74 11                	je     400d10 <deregister_tm_clones+0x30>
  400cff:	5d                   	pop    %rbp
  400d00:	bf 20 3a 60 00       	mov    $0x603a20,%edi
  400d05:	ff e0                	jmpq   *%rax
  400d07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400d0e:	00 00 
  400d10:	5d                   	pop    %rbp
  400d11:	c3                   	retq   
  400d12:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
  400d19:	1f 84 00 00 00 00 00 

0000000000400d20 <register_tm_clones>:
  400d20:	be 20 3a 60 00       	mov    $0x603a20,%esi
  400d25:	55                   	push   %rbp
  400d26:	48 81 ee 20 3a 60 00 	sub    $0x603a20,%rsi
  400d2d:	48 c1 fe 03          	sar    $0x3,%rsi
  400d31:	48 89 e5             	mov    %rsp,%rbp
  400d34:	48 89 f0             	mov    %rsi,%rax
  400d37:	48 c1 e8 3f          	shr    $0x3f,%rax
  400d3b:	48 01 c6             	add    %rax,%rsi
  400d3e:	48 d1 fe             	sar    %rsi
  400d41:	74 15                	je     400d58 <register_tm_clones+0x38>
  400d43:	b8 00 00 00 00       	mov    $0x0,%eax
  400d48:	48 85 c0             	test   %rax,%rax
  400d4b:	74 0b                	je     400d58 <register_tm_clones+0x38>
  400d4d:	5d                   	pop    %rbp
  400d4e:	bf 20 3a 60 00       	mov    $0x603a20,%edi
  400d53:	ff e0                	jmpq   *%rax
  400d55:	0f 1f 00             	nopl   (%rax)
  400d58:	5d                   	pop    %rbp
  400d59:	c3                   	retq   
  400d5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400d60 <__do_global_dtors_aux>:
  400d60:	80 3d c9 2c 20 00 00 	cmpb   $0x0,0x202cc9(%rip)        # 603a30 <completed.6904>
  400d67:	75 11                	jne    400d7a <__do_global_dtors_aux+0x1a>
  400d69:	55                   	push   %rbp
  400d6a:	48 89 e5             	mov    %rsp,%rbp
  400d6d:	e8 6e ff ff ff       	callq  400ce0 <deregister_tm_clones>
  400d72:	5d                   	pop    %rbp
  400d73:	c6 05 b6 2c 20 00 01 	movb   $0x1,0x202cb6(%rip)        # 603a30 <completed.6904>
  400d7a:	f3 c3                	repz retq 
  400d7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400d80 <frame_dummy>:
  400d80:	bf 20 2e 60 00       	mov    $0x602e20,%edi
  400d85:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400d89:	75 05                	jne    400d90 <frame_dummy+0x10>
  400d8b:	eb 93                	jmp    400d20 <register_tm_clones>
  400d8d:	0f 1f 00             	nopl   (%rax)
  400d90:	b8 00 00 00 00       	mov    $0x0,%eax
  400d95:	48 85 c0             	test   %rax,%rax
  400d98:	74 f1                	je     400d8b <frame_dummy+0xb>
  400d9a:	55                   	push   %rbp
  400d9b:	48 89 e5             	mov    %rsp,%rbp
  400d9e:	ff d0                	callq  *%rax
  400da0:	5d                   	pop    %rbp
  400da1:	e9 7a ff ff ff       	jmpq   400d20 <register_tm_clones>

0000000000400da6 <main>:
  400da6:	53                   	push   %rbx
  400da7:	83 ff 01             	cmp    $0x1,%edi
  400daa:	75 10                	jne    400dbc <main+0x16>
  400dac:	48 8b 05 75 2c 20 00 	mov    0x202c75(%rip),%rax        # 603a28 <stdin@@GLIBC_2.2.5>
  400db3:	48 89 05 7e 2c 20 00 	mov    %rax,0x202c7e(%rip)        # 603a38 <infile>
  400dba:	eb 59                	jmp    400e15 <main+0x6f>
  400dbc:	48 89 f3             	mov    %rsi,%rbx
  400dbf:	83 ff 02             	cmp    $0x2,%edi
  400dc2:	75 35                	jne    400df9 <main+0x53>
  400dc4:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  400dc8:	be d6 1c 40 00       	mov    $0x401cd6,%esi
  400dcd:	e8 5e fe ff ff       	callq  400c30 <fopen@plt>
  400dd2:	48 89 05 5f 2c 20 00 	mov    %rax,0x202c5f(%rip)        # 603a38 <infile>
  400dd9:	48 85 c0             	test   %rax,%rax
  400ddc:	75 37                	jne    400e15 <main+0x6f>
  400dde:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400de2:	48 8b 33             	mov    (%rbx),%rsi
  400de5:	bf d0 18 40 00       	mov    $0x4018d0,%edi
  400dea:	e8 31 fd ff ff       	callq  400b20 <printf@plt>
  400def:	bf 08 00 00 00       	mov    $0x8,%edi
  400df4:	e8 57 fe ff ff       	callq  400c50 <exit@plt>
  400df9:	48 8b 36             	mov    (%rsi),%rsi
  400dfc:	bf ed 18 40 00       	mov    $0x4018ed,%edi
  400e01:	b8 00 00 00 00       	mov    $0x0,%eax
  400e06:	e8 15 fd ff ff       	callq  400b20 <printf@plt>
  400e0b:	bf 08 00 00 00       	mov    $0x8,%edi
  400e10:	e8 3b fe ff ff       	callq  400c50 <exit@plt>
  400e15:	e8 c1 05 00 00       	callq  4013db <initialize_bomb>
  400e1a:	bf 38 19 40 00       	mov    $0x401938,%edi
  400e1f:	e8 cc fc ff ff       	callq  400af0 <puts@plt>
  400e24:	bf 78 19 40 00       	mov    $0x401978,%edi
  400e29:	e8 c2 fc ff ff       	callq  400af0 <puts@plt>
  400e2e:	e8 b7 08 00 00       	callq  4016ea <read_line>
  400e33:	48 89 c7             	mov    %rax,%rdi
  400e36:	e8 ac 00 00 00       	callq  400ee7 <phase_1>
  400e3b:	e8 8f 09 00 00       	callq  4017cf <phase_defused>
  400e40:	bf a8 19 40 00       	mov    $0x4019a8,%edi
  400e45:	e8 a6 fc ff ff       	callq  400af0 <puts@plt>
  400e4a:	e8 9b 08 00 00       	callq  4016ea <read_line>
  400e4f:	48 89 c7             	mov    %rax,%rdi
  400e52:	e8 ac 00 00 00       	callq  400f03 <phase_2>
  400e57:	e8 73 09 00 00       	callq  4017cf <phase_defused>
  400e5c:	bf 07 19 40 00       	mov    $0x401907,%edi
  400e61:	e8 8a fc ff ff       	callq  400af0 <puts@plt>
  400e66:	e8 7f 08 00 00       	callq  4016ea <read_line>
  400e6b:	48 89 c7             	mov    %rax,%rdi
  400e6e:	e8 c5 00 00 00       	callq  400f38 <phase_3>
  400e73:	e8 57 09 00 00       	callq  4017cf <phase_defused>
  400e78:	bf 25 19 40 00       	mov    $0x401925,%edi
  400e7d:	e8 6e fc ff ff       	callq  400af0 <puts@plt>
  400e82:	e8 63 08 00 00       	callq  4016ea <read_line>
  400e87:	48 89 c7             	mov    %rax,%rdi
  400e8a:	e8 82 01 00 00       	callq  401011 <phase_4>
  400e8f:	e8 3b 09 00 00       	callq  4017cf <phase_defused>
  400e94:	bf d8 19 40 00       	mov    $0x4019d8,%edi
  400e99:	e8 52 fc ff ff       	callq  400af0 <puts@plt>
  400e9e:	e8 47 08 00 00       	callq  4016ea <read_line>
  400ea3:	48 89 c7             	mov    %rax,%rdi
  400ea6:	e8 a7 01 00 00       	callq  401052 <phase_5>
  400eab:	e8 1f 09 00 00       	callq  4017cf <phase_defused>
  400eb0:	bf 00 1a 40 00       	mov    $0x401a00,%edi
  400eb5:	e8 36 fc ff ff       	callq  400af0 <puts@plt>
  400eba:	bf 38 1a 40 00       	mov    $0x401a38,%edi
  400ebf:	e8 2c fc ff ff       	callq  400af0 <puts@plt>
  400ec4:	bf 78 1a 40 00       	mov    $0x401a78,%edi
  400ec9:	e8 22 fc ff ff       	callq  400af0 <puts@plt>
  400ece:	e8 17 08 00 00       	callq  4016ea <read_line>
  400ed3:	48 89 c7             	mov    %rax,%rdi
  400ed6:	e8 cf 01 00 00       	callq  4010aa <phase_6>
  400edb:	e8 ef 08 00 00       	callq  4017cf <phase_defused>
  400ee0:	b8 00 00 00 00       	mov    $0x0,%eax
  400ee5:	5b                   	pop    %rbx
  400ee6:	c3                   	retq   

0000000000400ee7 <phase_1>:
  400ee7:	48 83 ec 08          	sub    $0x8,%rsp
  400eeb:	be b8 1a 40 00       	mov    $0x401ab8,%esi
  400ef0:	e8 ba 03 00 00       	callq  4012af <strings_not_equal>
  400ef5:	85 c0                	test   %eax,%eax
  400ef7:	74 05                	je     400efe <phase_1+0x17>
  400ef9:	e8 8b 07 00 00       	callq  401689 <explode_bomb>
  400efe:	48 83 c4 08          	add    $0x8,%rsp
  400f02:	c3                   	retq   

0000000000400f03 <phase_2>:
  400f03:	55                   	push   %rbp
  400f04:	53                   	push   %rbx
  400f05:	48 83 ec 28          	sub    $0x28,%rsp
  400f09:	48 89 e6             	mov    %rsp,%rsi
  400f0c:	e8 9a 07 00 00       	callq  4016ab <read_six_numbers>
  400f11:	48 89 e3             	mov    %rsp,%rbx
  400f14:	48 8d 6c 24 14       	lea    0x14(%rsp),%rbp
  400f19:	8b 03                	mov    (%rbx),%eax
  400f1b:	83 c0 05             	add    $0x5,%eax
  400f1e:	39 43 04             	cmp    %eax,0x4(%rbx)
  400f21:	74 05                	je     400f28 <phase_2+0x25>
  400f23:	e8 61 07 00 00       	callq  401689 <explode_bomb>
  400f28:	48 83 c3 04          	add    $0x4,%rbx
  400f2c:	48 39 eb             	cmp    %rbp,%rbx
  400f2f:	75 e8                	jne    400f19 <phase_2+0x16>
  400f31:	48 83 c4 28          	add    $0x28,%rsp
  400f35:	5b                   	pop    %rbx
  400f36:	5d                   	pop    %rbp
  400f37:	c3                   	retq   

0000000000400f38 <phase_3>:
  400f38:	48 83 ec 18          	sub    $0x18,%rsp
  400f3c:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  400f41:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  400f46:	be 0a 1e 40 00       	mov    $0x401e0a,%esi
  400f4b:	b8 00 00 00 00       	mov    $0x0,%eax
  400f50:	e8 ab fc ff ff       	callq  400c00 <__isoc99_sscanf@plt>
  400f55:	83 f8 01             	cmp    $0x1,%eax
  400f58:	7f 05                	jg     400f5f <phase_3+0x27>
  400f5a:	e8 2a 07 00 00       	callq  401689 <explode_bomb>
  400f5f:	83 7c 24 0c 07       	cmpl   $0x7,0xc(%rsp)
  400f64:	77 64                	ja     400fca <phase_3+0x92>
  400f66:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  400f6a:	ff 24 c5 20 1b 40 00 	jmpq   *0x401b20(,%rax,8)
  400f71:	b8 aa 01 00 00       	mov    $0x1aa,%eax
  400f76:	eb 05                	jmp    400f7d <phase_3+0x45>
  400f78:	b8 00 00 00 00       	mov    $0x0,%eax
  400f7d:	2d 87 03 00 00       	sub    $0x387,%eax
  400f82:	eb 05                	jmp    400f89 <phase_3+0x51>
  400f84:	b8 00 0 00 00       	mov    $0x0,%eax
  400f89:	83 c0 5f             	add    $0x5f,%eax
  400f8c:	eb 05                	jmp    400f93 <phase_3+0x5b>
  400f8e:	b8 00 00 00 00       	mov    $0x0,%eax
  400f93:	2d e1 03 00 00       	sub    $0x3e1,%eax
  400f98:	eb 05                	jmp    400f9f <phase_3+0x67>
  400f9a:	b8 00 00 00 00       	mov    $0x0,%eax
  400f9f:	05 e4 02 00 00       	add    $0x2e4,%eax
  400fa4:	eb 05                	jmp    400fab <phase_3+0x73>
  400fa6:	b8 00 00 00 00       	mov    $0x0,%eax
  400fab:	2d a6 02 00 00       	sub    $0x2a6,%eax
  400fb0:	eb 05                	jmp    400fb7 <phase_3+0x7f>
  400fb2:	b8 00 00 00 00       	mov    $0x0,%eax
  400fb7:	05 a6 02 00 00       	add    $0x2a6,%eax
  400fbc:	eb 05                	jmp    400fc3 <phase_3+0x8b>
  400fbe:	b8 00 00 00 00       	mov    $0x0,%eax
  400fc3:	2d ea 02 00 00       	sub    $0x2ea,%eax
  400fc8:	eb 0a                	jmp    400fd4 <phase_3+0x9c>
  400fca:	e8 ba 06 00 00       	callq  401689 <explode_bomb>
  400fcf:	b8 00 00 00 00       	mov    $0x0,%eax
  400fd4:	83 7c 24 0c 05       	cmpl   $0x5,0xc(%rsp)
  400fd9:	7f 06                	jg     400fe1 <phase_3+0xa9>
  400fdb:	3b 44 24 08          	cmp    0x8(%rsp),%eax
  400fdf:	74 05                	je     400fe6 <phase_3+0xae>
  400fe1:	e8 a3 06 00 00       	callq  401689 <explode_bomb>
  400fe6:	48 83 c4 18          	add    $0x18,%rsp
  400fea:	c3                   	retq   

0000000000400feb <func4>:
  400feb:	b8 01 00 00 00       	mov    $0x1,%eax
  400ff0:	85 ff                	test   %edi,%edi
  400ff2:	7e 1b                	jle    40100f <func4+0x24>
  400ff4:	48 83 ec 08          	sub    $0x8,%rsp
  400ff8:	83 ef 01             	sub    $0x1,%edi
  400ffb:	e8 eb ff ff ff       	callq  400feb <func4>
  401000:	8d 14 c5 00 00 00 00 	lea    0x0(,%rax,8),%edx
  401007:	29 c2                	sub    %eax,%edx

  40100f:	f3 c3                	repz retq 

0000000000401011 <phase_4>:
  401011:	48 83 ec 18          	sub    $0x18,%rsp
  401015:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  40101a:	be 0d 1e 40 00       	mov    $0x401e0d,%esi
  40101f:	b8 00 00 00 00       	mov    $0x0,%eax
  401024:	e8 d7 fb ff ff       	callq  400c00 <__isoc99_sscanf@plt>
  401029:	83 f8 01             	cmp    $0x1,%eax
  40102c:	75 07                	jne    401035 <phase_4+0x24>
  40102e:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%rsp)
  401033:	7f 05                	jg     40103a <phase_4+0x29>
  401035:	e8 4f 06 00 00       	callq  401689 <explode_bomb>
  40103a:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  40103e:	e8 a8 ff ff ff       	callq  400feb <func4>
  401043:	83 f8 31             	cmp    $0x31,%eax
  401046:	74 05                	je     40104d <phase_4+0x3c>
  401048:	e8 3c 06 00 00       	callq  401689 <explode_bomb>
  40104d:	48 83 c4 18          	add    $0x18,%rsp
  401051:	c3                   	retq   

0000000000401052 <phase_5>:
  401052:	53                   	push   %rbx
  401053:	48 83 ec 10          	sub    $0x10,%rsp
  401057:	48 89 fb             	mov    %rdi,%rbx
  40105a:	e8 32 02 00 00       	callq  401291 <string_length>
  40105f:	83 f8 06             	cmp    $0x6,%eax
  401062:	74 05                	je     401069 <phase_5+0x17>
  401064:	e8 20 06 00 00       	callq  401689 <explode_bomb>
  401069:	b8 00 00 00 00       	mov    $0x0,%eax
  40106e:	0f b6 14 03          	movzbl (%rbx,%rax,1),%edx
  401072:	83 e2 0f             	and    $0xf,%edx
  401075:	0f b6 92 60 1b 40 00 	movzbl 0x401b60(%rdx),%edx
  40107c:	88 14 04             	mov    %dl,(%rsp,%rax,1)
  40107f:	48 83 c0 01          	add    $0x1,%rax
  401083:	48 83 f8 06          	cmp    $0x6,%rax
  401087:	75 e5                	jne    40106e <phase_5+0x1c>
  401089:	c6 44 24 06 00       	movb   $0x0,0x6(%rsp)
  40108e:	be 0e 1b 40 00       	mov    $0x401b0e,%esi
  401093:	48 89 e7             	mov    %rsp,%rdi
  401096:	e8 14 02 00 00       	callq  4012af <strings_not_equal>
  40109b:	85 c0                	test   %eax,%eax
  40109d:	74 05                	je     4010a4 <phase_5+0x52>
  40109f:	e8 e5 05 00 00       	callq  401689 <explode_bomb>
  4010a4:	48 83 c4 10          	add    $0x10,%rsp
  4010a8:	5b                   	pop    %rbx
  4010a9:	c3                   	retq   

00000000004010aa <phase_6>:
  4010aa:	41 55                	push   %r13
  4010ac:	41 54                	push   %r12
  4010ae:	55                   	push   %rbp
  4010af:	53                   	push   %rbx
  4010b0:	48 83 ec 58          	sub    $0x58,%rsp
  4010b4:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  4010b9:	e8 ed 05 00 00       	callq  4016ab <read_six_numbers>
  4010be:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
  4010c3:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  4010c9:	4c 89 e5             	mov    %r12,%rbp
  4010cc:	41 8b 04 24          	mov    (%r12),%eax
  4010d0:	83 e8 01             	sub    $0x1,%eax
  4010d3:	83 f8 05             	cmp    $0x5,%eax
  4010d6:	76 05                	jbe    4010dd <phase_6+0x33>
  4010d8:	e8 ac 05 00 00       	callq  401689 <explode_bomb>
  4010dd:	41 83 c5 01          	add    $0x1,%r13d
  4010e1:	41 83 fd 06          	cmp    $0x6,%r13d
  4010e5:	74 3d                	je     401124 <phase_6+0x7a>
  4010e7:	44 89 eb             	mov    %r13d,%ebx
  4010ea:	48 63 c3             	movslq %ebx,%rax
  4010ed:	8b 44 84 30          	mov    0x30(%rsp,%rax,4),%eax
  4010f1:	39 45 00             	cmp    %eax,0x0(%rbp)
  4010f4:	75 05                	jne    4010fb <phase_6+0x51>
  4010f6:	e8 8e 05 00 00       	callq  401689 <explode_bomb>
  4010fb:	83 c3 01             	add    $0x1,%ebx
  4010fe:	83 fb 05             	cmp    $0x5,%ebx
  401101:	7e e7                	jle    4010ea <phase_6+0x40>
  401103:	49 83 c4 04          	add    $0x4,%r12
  401107:	eb c0                	jmp    4010c9 <phase_6+0x1f>
  401109:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  40110d:	83 c0 01             	add    $0x1,%eax
  401110:	39 c8                	cmp    %ecx,%eax
  401112:	75 f5                	jne    401109 <phase_6+0x5f>
  401114:	48 89 14 74          	mov    %rdx,(%rsp,%rsi,2)
  401118:	48 83 c6 04          	add    $0x4,%rsi
  40111c:	48 83 fe 18          	cmp    $0x18,%rsi
  401120:	75 07                	jne    401129 <phase_6+0x7f>
  401122:	eb 1a                	jmp    40113e <phase_6+0x94>
  401124:	be 00 00 00 00       	mov    $0x0,%esi
  401129:	8b 4c 34 30          	mov    0x30(%rsp,%rsi,1),%ecx
  40112d:	b8 01 00 00 00       	mov    $0x1,%eax
  401132:	ba 20 33 60 00       	mov    $0x603320,%edx
  401137:	83 f9 01             	cmp    $0x1,%ecx
  40113a:	7f cd                	jg     401109 <phase_6+0x5f>
  40113c:	eb d6                	jmp    401114 <phase_6+0x6a>
  40113e:	48 8b 1c 24          	mov    (%rsp),%rbx
  401142:	48 89 e0             	mov    %rsp,%rax
  401145:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
  40114a:	48 89 d9             	mov    %rbx,%rcx
  40114d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  401151:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  401155:	48 83 c0 08          	add    $0x8,%rax
  401159:	48 89 d1             	mov    %rdx,%rcx
  40115c:	48 39 f0             	cmp    %rsi,%rax
  40115f:	75 ec                	jne    40114d <phase_6+0xa3>
  401161:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
  401168:	00 
  401169:	bd 05 00 00 00       	mov    $0x5,%ebp
  40116e:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401172:	8b 00                	mov    (%rax),%eax
  401174:	39 03                	cmp    %eax,(%rbx)
  401176:	7d 05                	jge    40117d <phase_6+0xd3>
  401178:	e8 0c 05 00 00       	callq  401689 <explode_bomb>
  40117d:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  401181:	83 ed 01             	sub    $0x1,%ebp
  401184:	75 e8                	jne    40116e <phase_6+0xc4>
  401186:	48 83 c4 58          	add    $0x58,%rsp
  40118a:	5b                   	pop    %rbx
  40118b:	5d                   	pop    %rbp
  40118c:	41 5c                	pop    %r12
  40118e:	41 5d                	pop    %r13
  401190:	c3                   	retq   

0000000000401191 <fun7>:
  401191:	48 83 ec 08          	sub    $0x8,%rsp
  401195:	48 85 ff             	test   %rdi,%rdi
  401198:	74 2b                	je     4011c5 <fun7+0x34>
  40119a:	8b 17                	mov    (%rdi),%edx
  40119c:	39 f2                	cmp    %esi,%edx
  40119e:	7e 0d                	jle    4011ad <fun7+0x1c>
  4011a0:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  4011a4:	e8 e8 ff ff ff       	callq  401191 <fun7>
  4011a9:	01 c0                	add    %eax,%eax
  4011ab:	eb 1d                	jmp    4011ca <fun7+0x39>
  4011ad:	b8 00 00 00 00       	mov    $0x0,%eax
  4011b2:	39 f2                	cmp    %esi,%edx
  4011b4:	74 14                	je     4011ca <fun7+0x39>
  4011b6:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  4011ba:	e8 d2 ff ff ff       	callq  401191 <fun7>
  4011bf:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  4011c3:	eb 05                	jmp    4011ca <fun7+0x39>
  4011c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4011ca:	48 83 c4 08          	add    $0x8,%rsp
  4011ce:	c3                   	retq   

00000000004011cf <secret_phase>:
  4011cf:	53                   	push   %rbx
  4011d0:	e8 15 05 00 00       	callq  4016ea <read_line>
  4011d5:	ba 0a 00 00 00       	mov    $0xa,%edx
  4011da:	be 00 00 00 00       	mov    $0x0,%esi
  4011df:	48 89 c7             	mov    %rax,%rdi
  4011e2:	e8 f9 f9 ff ff       	callq  400be0 <strtol@plt>
  4011e7:	48 89 c3             	mov    %rax,%rbx
  4011ea:	8d 40 ff             	lea    -0x1(%rax),%eax
  4011ed:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  4011f2:	76 05                	jbe    4011f9 <secret_phase+0x2a>
  4011f4:	e8 90 04 00 00       	callq  401689 <explode_bomb>
  4011f9:	89 de                	mov    %ebx,%esi
  4011fb:	bf 40 31 60 00       	mov    $0x603140,%edi
  401200:	e8 8c ff ff ff       	callq  401191 <fun7>
  401205:	83 f8 07             	cmp    $0x7,%eax
  401208:	74 05                	je     40120f <secret_phase+0x40>
  40120a:	e8 7a 04 00 00       	callq  401689 <explode_bomb>
  40120f:	bf e8 1a 40 00       	mov    $0x401ae8,%edi
  401214:	e8 d7 f8 ff ff       	callq  400af0 <puts@plt>
  401219:	e8 b1 05 00 00       	callq  4017cf <phase_defused>
  40121e:	5b                   	pop    %rbx
  40121f:	c3                   	retq   

0000000000401220 <sig_handler>:
  401220:	48 83 ec 08          	sub    $0x8,%rsp
  401224:	bf 70 1b 40 00       	mov    $0x401b70,%edi
  401229:	e8 c2 f8 ff ff       	callq  400af0 <puts@plt>
  40122e:	bf 03 00 00 00       	mov    $0x3,%edi
  401233:	e8 48 fa ff ff       	callq  400c80 <sleep@plt>
  401238:	bf 68 1c 40 00       	mov    $0x401c68,%edi
  40123d:	b8 00 00 00 00       	mov    $0x0,%eax
  401242:	e8 d9 f8 ff ff       	callq  400b20 <printf@plt>
  401247:	48 8b 3d d2 27 20 00 	mov    0x2027d2(%rip),%rdi        # 603a20 <__TMC_END__>
  40124e:	e8 9d f9 ff ff       	callq  400bf0 <fflush@plt>
  401253:	bf 01 00 00 00       	mov    $0x1,%edi
  401258:	e8 23 fa ff ff       	callq  400c80 <sleep@plt>
  40125d:	bf 70 1c 40 00       	mov    $0x401c70,%edi
  401262:	e8 89 f8 ff ff       	callq  400af0 <puts@plt>
  401267:	bf 10 00 00 00       	mov    $0x10,%edi
  40126c:	e8 df f9 ff ff       	callq  400c50 <exit@plt>

0000000000401271 <invalid_phase>:
  401271:	48 83 ec 08          	sub    $0x8,%rsp
  401275:	48 89 fe             	mov    %rdi,%rsi
  401278:	bf 78 1c 40 00       	mov    $0x401c78,%edi
  40127d:	b8 00 00 00 00       	mov    $0x0,%eax
  401282:	e8 99 f8 ff ff       	callq  400b20 <printf@plt>
  401287:	bf 08 00 00 00       	mov    $0x8,%edi
  40128c:	e8 bf f9 ff ff       	callq  400c50 <exit@plt>

0000000000401291 <string_length>:
  401291:	80 3f 00             	cmpb   $0x0,(%rdi)
  401294:	74 13                	je     4012a9 <string_length+0x18>
  401296:	b8 00 00 00 00       	mov    $0x0,%eax
  40129b:	48 83 c7 01          	add    $0x1,%rdi
  40129f:	83 c0 01             	add    $0x1,%eax
  4012a2:	80 3f 00             	cmpb   $0x0,(%rdi)
  4012a5:	75 f4                	jne    40129b <string_length+0xa>
  4012a7:	f3 c3                	repz retq 
  4012a9:	b8 00 00 00 00       	mov    $0x0,%eax
  4012ae:	c3                   	retq   

00000000004012af <strings_not_equal>:
  4012af:	41 54                	push   %r12
  4012b1:	55                   	push   %rbp
  4012b2:	53                   	push   %rbx
  4012b3:	48 89 fb             	mov    %rdi,%rbx
  4012b6:	48 89 f5             	mov    %rsi,%rbp
  4012b9:	e8 d3 ff ff ff       	callq  401291 <string_length>
  4012be:	41 89 c4             	mov    %eax,%r12d
  4012c1:	48 89 ef             	mov    %rbp,%rdi
  4012c4:	e8 c8 ff ff ff       	callq  401291 <string_length>
  4012c9:	ba 01 00 00 00       	mov    $0x1,%edx
  4012ce:	41 39 c4             	cmp    %eax,%r12d
  4012d1:	75 3c                	jne    40130f <strings_not_equal+0x60>
  4012d3:	0f b6 03             	movzbl (%rbx),%eax
  4012d6:	84 c0                	test   %al,%al
  4012d8:	74 22                	je     4012fc <strings_not_equal+0x4d>
  4012da:	3a 45 00             	cmp    0x0(%rbp),%al
  4012dd:	74 07                	je     4012e6 <strings_not_equal+0x37>
  4012df:	eb 22                	jmp    401303 <strings_not_equal+0x54>
  4012e1:	3a 45 00             	cmp    0x0(%rbp),%al
  4012e4:	75 24                	jne    40130a <strings_not_equal+0x5b>
  4012e6:	48 83 c3 01          	add    $0x1,%rbx
  4012ea:	48 83 c5 01          	add    $0x1,%rbp
  4012ee:	0f b6 03             	movzbl (%rbx),%eax
  4012f1:	84 c0                	test   %al,%al
  4012f3:	75 ec                	jne    4012e1 <strings_not_equal+0x32>
  4012f5:	ba 00 00 00 00       	mov    $0x0,%edx
  4012fa:	eb 13                	jmp    40130f <strings_not_equal+0x60>
  4012fc:	ba 00 00 00 00       	mov    $0x0,%edx
  401301:	eb 0c                	jmp    40130f <strings_not_equal+0x60>
  401303:	ba 01 00 00 00       	mov    $0x1,%edx
  401308:	eb 05                	jmp    40130f <strings_not_equal+0x60>
  40130a:	ba 01 00 00 00       	mov    $0x1,%edx
  40130f:	89 d0                	mov    %edx,%eax
  401311:	5b                   	pop    %rbx
  401312:	5d                   	pop    %rbp
  401313:	41 5c                	pop    %r12
  401315:	c3                   	retq   

0000000000401316 <open_clientfd>:
  401316:	41 54                	push   %r12
  401318:	55                   	push   %rbp
  401319:	53                   	push   %rbx
  40131a:	48 83 ec 10          	sub    $0x10,%rsp
  40131e:	49 89 fc             	mov    %rdi,%r12
  401321:	89 f3                	mov    %esi,%ebx
  401323:	ba 00 00 00 00       	mov    $0x0,%edx
  401328:	be 01 00 00 00       	mov    $0x1,%esi
  40132d:	bf 02 00 00 00       	mov    $0x2,%edi
  401332:	e8 69 f9 ff ff       	callq  400ca0 <socket@plt>
  401337:	85 c0                	test   %eax,%eax
  401339:	79 14                	jns    40134f <open_clientfd+0x39>
  40133b:	bf 89 1c 40 00       	mov    $0x401c89,%edi
  401340:	e8 ab f7 ff ff       	callq  400af0 <puts@plt>
  401345:	bf 08 00 00 00       	mov    $0x8,%edi
  40134a:	e8 01 f9 ff ff       	callq  400c50 <exit@plt>
  40134f:	89 c5                	mov    %eax,%ebp
  401351:	4c 89 e7             	mov    %r12,%rdi
  401354:	e8 57 f8 ff ff       	callq  400bb0 <gethostbyname@plt>
  401359:	48 85 c0             	test   %rax,%rax
  40135c:	75 14                	jne    401372 <open_clientfd+0x5c>
  40135e:	bf 97 1c 40 00       	mov    $0x401c97,%edi
  401363:	e8 88 f7 ff ff       	callq  400af0 <puts@plt>
  401368:	bf 08 00 00 00       	mov    $0x8,%edi
  40136d:	e8 de f8 ff ff       	callq  400c50 <exit@plt>
  401372:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  401379:	00 
  40137a:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  401381:	00 00 
  401383:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  401389:	48 63 50 14          	movslq 0x14(%rax),%rdx
  40138d:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  401392:	48 8b 40 18          	mov    0x18(%rax),%rax
  401396:	48 8b 38             	mov    (%rax),%rdi
  401399:	e8 72 f8 ff ff       	callq  400c10 <bcopy@plt>
  40139e:	89 de                	mov    %ebx,%esi
  4013a0:	66 c1 ce 08          	ror    $0x8,%si
  4013a4:	66 89 74 24 02       	mov    %si,0x2(%rsp)
  4013a9:	ba 10 00 00 00       	mov    $0x10,%edx
  4013ae:	48 89 e6             	mov    %rsp,%rsi
  4013b1:	89 ef                	mov    %ebp,%edi
  4013b3:	e8 a8 f8 ff ff       	callq  400c60 <connect@plt>
  4013b8:	85 c0                	test   %eax,%eax
  4013ba:	79 14                	jns    4013d0 <open_clientfd+0xba>
  4013bc:	bf a5 1c 40 00       	mov    $0x401ca5,%edi
  4013c1:	e8 2a f7 ff ff       	callq  400af0 <puts@plt>
  4013c6:	bf 08 00 00 00       	mov    $0x8,%edi
  4013cb:	e8 80 f8 ff ff       	callq  400c50 <exit@plt>
  4013d0:	89 e8                	mov    %ebp,%eax
  4013d2:	48 83 c4 10          	add    $0x10,%rsp
  4013d6:	5b                   	pop    %rbx
  4013d7:	5d                   	pop    %rbp
  4013d8:	41 5c                	pop    %r12
  4013da:	c3                   	retq   

00000000004013db <initialize_bomb>:
  4013db:	48 83 ec 08          	sub    $0x8,%rsp
  4013df:	be 20 12 40 00       	mov    $0x401220,%esi
  4013e4:	bf 02 00 00 00       	mov    $0x2,%edi
  4013e9:	e8 b2 f7 ff ff       	callq  400ba0 <signal@plt>
  4013ee:	48 83 c4 08          	add    $0x8,%rsp
  4013f2:	c3                   	retq   

00000000004013f3 <blank_line>:
  4013f3:	55                   	push   %rbp
  4013f4:	53                   	push   %rbx
  4013f5:	48 83 ec 08          	sub    $0x8,%rsp
  4013f9:	48 89 fd             	mov    %rdi,%rbp
  4013fc:	eb 17                	jmp    401415 <blank_line+0x22>
  4013fe:	e8 8d f8 ff ff       	callq  400c90 <__ctype_b_loc@plt>
  401403:	48 83 c5 01          	add    $0x1,%rbp
  401407:	48 0f be db          	movsbq %bl,%rbx
  40140b:	48 8b 00             	mov    (%rax),%rax
  40140e:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
  401413:	74 0f                	je     401424 <blank_line+0x31>
  401415:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  401419:	84 db                	test   %bl,%bl
  40141b:	75 e1                	jne    4013fe <blank_line+0xb>
  40141d:	b8 01 00 00 00       	mov    $0x1,%eax
  401422:	eb 05                	jmp    401429 <blank_line+0x36>
  401424:	b8 00 00 00 00       	mov    $0x0,%eax
  401429:	48 83 c4 08          	add    $0x8,%rsp
  40142d:	5b                   	pop    %rbx
  40142e:	5d                   	pop    %rbp
  40142f:	c3                   	retq   

0000000000401430 <skip>:
  401430:	53                   	push   %rbx
  401431:	48 63 05 fc 25 20 00 	movslq 0x2025fc(%rip),%rax        # 603a34 <num_input_strings>
  401438:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  40143c:	48 c1 e7 04          	shl    $0x4,%rdi
  401440:	48 81 c7 40 3a 60 00 	add    $0x603a40,%rdi
  401447:	48 8b 15 ea 25 20 00 	mov    0x2025ea(%rip),%rdx        # 603a38 <infile>
  40144e:	be 50 00 00 00       	mov    $0x50,%esi
  401453:	e8 28 f7 ff ff       	callq  400b80 <fgets@plt>
  401458:	48 89 c3             	mov    %rax,%rbx
  40145b:	48 85 c0             	test   %rax,%rax
  40145e:	74 0c                	je     40146c <skip+0x3c>
  401460:	48 89 c7             	mov    %rax,%rdi
  401463:	e8 8b ff ff ff       	callq  4013f3 <blank_line>
  401468:	85 c0                	test   %eax,%eax
  40146a:	75 c5                	jne    401431 <skip+0x1>
  40146c:	48 89 d8             	mov    %rbx,%rax
  40146f:	5b                   	pop    %rbx
  401470:	c3                   	retq   

0000000000401471 <send_msg>:
  401471:	41 54                	push   %r12
  401473:	55                   	push   %rbp
  401474:	53                   	push   %rbx
  401475:	48 83 ec 50          	sub    $0x50,%rsp
  401479:	89 fb                	mov    %edi,%ebx
  40147b:	bf 00 00 00 00       	mov    $0x0,%edi
  401480:	e8 bb f6 ff ff       	callq  400b40 <dup@plt>
  401485:	83 f8 ff             	cmp    $0xffffffff,%eax
  401488:	75 14                	jne    40149e <send_msg+0x2d>
  40148a:	bf c4 1c 40 00       	mov    $0x401cc4,%edi
  40148f:	e8 5c f6 ff ff       	callq  400af0 <puts@plt>
  401494:	bf 08 00 00 00       	mov    $0x8,%edi
  401499:	e8 b2 f7 ff ff       	callq  400c50 <exit@plt>
  40149e:	41 89 c4             	mov    %eax,%r12d
  4014a1:	bf 00 00 00 00       	mov    $0x0,%edi
  4014a6:	e8 a5 f6 ff ff       	callq  400b50 <close@plt>
  4014ab:	83 f8 ff             	cmp    $0xffffffff,%eax
  4014ae:	75 14                	jne    4014c4 <send_msg+0x53>
  4014b0:	bf d8 1c 40 00       	mov    $0x401cd8,%edi
  4014b5:	e8 36 f6 ff ff       	callq  400af0 <puts@plt>
  4014ba:	bf 08 00 00 00       	mov    $0x8,%edi
  4014bf:	e8 8c f7 ff ff       	callq  400c50 <exit@plt>
  4014c4:	e8 c7 f6 ff ff       	callq  400b90 <tmpfile@plt>
  4014c9:	48 89 c5             	mov    %rax,%rbp
  4014cc:	48 85 c0             	test   %rax,%rax
  4014cf:	75 14                	jne    4014e5 <send_msg+0x74>
  4014d1:	bf eb 1c 40 00       	mov    $0x401ceb,%edi
  4014d6:	e8 15 f6 ff ff       	callq  400af0 <puts@plt>
  4014db:	bf 08 00 00 00       	mov    $0x8,%edi
  4014e0:	e8 6b f7 ff ff       	callq  400c50 <exit@plt>
  4014e5:	48 89 c1             	mov    %rax,%rcx
  4014e8:	ba 1b 00 00 00       	mov    $0x1b,%edx
  4014ed:	be 01 00 00 00       	mov    $0x1,%esi
  4014f2:	bf 00 1d 40 00       	mov    $0x401d00,%edi
  4014f7:	e8 74 f7 ff ff       	callq  400c70 <fwrite@plt>
  4014fc:	48 89 ee             	mov    %rbp,%rsi
  4014ff:	bf 0a 00 00 00       	mov    $0xa,%edi
  401504:	e8 57 f6 ff ff       	callq  400b60 <fputc@plt>
  401509:	bf 00 00 00 00       	mov    $0x0,%edi
  40150e:	e8 0d f7 ff ff       	callq  400c20 <cuserid@plt>
  401513:	48 85 c0             	test   %rax,%rax
  401516:	75 15                	jne    40152d <send_msg+0xbc>
  401518:	c7 04 24 6e 6f 62 6f 	movl   $0x6f626f6e,(%rsp)
  40151f:	66 c7 44 24 04 64 79 	movw   $0x7964,0x4(%rsp)
  401526:	c6 44 24 06 00       	movb   $0x0,0x6(%rsp)
  40152b:	eb 0b                	jmp    401538 <send_msg+0xc7>
  40152d:	48 89 c6             	mov    %rax,%rsi
  401530:	48 89 e7             	mov    %rsp,%rdi
  401533:	e8 a8 f5 ff ff       	callq  400ae0 <strcpy@plt>
  401538:	85 db                	test   %ebx,%ebx
  40153a:	41 b9 bb 1c 40 00    	mov    $0x401cbb,%r9d
  401540:	b8 b3 1c 40 00       	mov    $0x401cb3,%eax
  401545:	4c 0f 45 c8          	cmovne %rax,%r9
  401549:	48 83 ec 08          	sub    $0x8,%rsp
  40154d:	8b 05 e1 24 20 00    	mov    0x2024e1(%rip),%eax        # 603a34 <num_input_strings>
  401553:	50                   	push   %rax
  401554:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  401559:	8b 0d 21 22 20 00    	mov    0x202221(%rip),%ecx        # 603780 <bomb_id>
  40155f:	ba 80 33 60 00       	mov    $0x603380,%edx
  401564:	be 1c 1d 40 00       	mov    $0x401d1c,%esi
  401569:	48 89 ef             	mov    %rbp,%rdi
  40156c:	b8 00 00 00 00       	mov    $0x0,%eax
  401571:	e8 4a f6 ff ff       	callq  400bc0 <fprintf@plt>
  401576:	48 83 c4 10          	add    $0x10,%rsp
  40157a:	83 3d b3 24 20 00 00 	cmpl   $0x0,0x2024b3(%rip)        # 603a34 <num_input_strings>
  401581:	7e 4f                	jle    4015d2 <send_msg+0x161>
  401583:	bb 00 00 00 00       	mov    $0x0,%ebx
  401588:	48 63 c3             	movslq %ebx,%rax
  40158b:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  40158f:	48 c1 e0 04          	shl    $0x4,%rax
  401593:	48 05 40 3a 60 00    	add    $0x603a40,%rax
  401599:	83 c3 01             	add    $0x1,%ebx
  40159c:	48 83 ec 08          	sub    $0x8,%rsp
  4015a0:	50                   	push   %rax
  4015a1:	41 89 d9             	mov    %ebx,%r9d
  4015a4:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  4015a9:	8b 0d d1 21 20 00    	mov    0x2021d1(%rip),%ecx        # 603780 <bomb_id>
  4015af:	ba 80 33 60 00       	mov    $0x603380,%edx
  4015b4:	be 38 1d 40 00       	mov    $0x401d38,%esi
  4015b9:	48 89 ef             	mov    %rbp,%rdi
  4015bc:	b8 00 00 00 00       	mov    $0x0,%eax
  4015c1:	e8 fa f5 ff ff       	callq  400bc0 <fprintf@plt>
  4015c6:	48 83 c4 10          	add    $0x10,%rsp
  4015ca:	39 1d 64 24 20 00    	cmp    %ebx,0x202464(%rip)        # 603a34 <num_input_strings>
  4015d0:	7f b6                	jg     401588 <send_msg+0x117>
  4015d2:	48 89 ef             	mov    %rbp,%rdi
  4015d5:	e8 56 f5 ff ff       	callq  400b30 <rewind@plt>
  4015da:	41 b8 a8 1b 40 00    	mov    $0x401ba8,%r8d
  4015e0:	b9 54 1d 40 00       	mov    $0x401d54,%ecx
  4015e5:	ba 59 1d 40 00       	mov    $0x401d59,%edx
  4015ea:	be 70 1d 40 00       	mov    $0x401d70,%esi
  4015ef:	bf 80 40 60 00       	mov    $0x604080,%edi
  4015f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4015f9:	e8 42 f6 ff ff       	callq  400c40 <sprintf@plt>
  4015fe:	bf 80 40 60 00       	mov    $0x604080,%edi
  401603:	e8 08 f5 ff ff       	callq  400b10 <system@plt>
  401608:	85 c0                	test   %eax,%eax
  40160a:	74 14                	je     401620 <send_msg+0x1af>
  40160c:	bf 79 1d 40 00       	mov    $0x401d79,%edi
  401611:	e8 da f4 ff ff       	callq  400af0 <puts@plt>
  401616:	bf 08 00 00 00       	mov    $0x8,%edi
  40161b:	e8 30 f6 ff ff       	callq  400c50 <exit@plt>
  401620:	48 89 ef             	mov    %rbp,%rdi
  401623:	e8 d8 f4 ff ff       	callq  400b00 <fclose@plt>
  401628:	85 c0                	test   %eax,%eax
  40162a:	74 14                	je     401640 <send_msg+0x1cf>
  40162c:	bf 93 1d 40 00       	mov    $0x401d93,%edi
  401631:	e8 ba f4 ff ff       	callq  400af0 <puts@plt>
  401636:	bf 08 00 00 00       	mov    $0x8,%edi
  40163b:	e8 10 f6 ff ff       	callq  400c50 <exit@plt>
  401640:	44 89 e7             	mov    %r12d,%edi
  401643:	e8 f8 f4 ff ff       	callq  400b40 <dup@plt>
  401648:	85 c0                	test   %eax,%eax
  40164a:	74 14                	je     401660 <send_msg+0x1ef>
  40164c:	bf ac 1d 40 00       	mov    $0x401dac,%edi
  401651:	e8 9a f4 ff ff       	callq  400af0 <puts@plt>
  401656:	bf 08 00 00 00       	mov    $0x8,%edi
  40165b:	e8 f0 f5 ff ff       	callq  400c50 <exit@plt>
  401660:	44 89 e7             	mov    %r12d,%edi
  401663:	e8 e8 f4 ff ff       	callq  400b50 <close@plt>
  401668:	85 c0                	test   %eax,%eax
  40166a:	74 14                	je     401680 <send_msg+0x20f>
  40166c:	bf c7 1d 40 00       	mov    $0x401dc7,%edi
  401671:	e8 7a f4 ff ff       	callq  400af0 <puts@plt>
  401676:	bf 08 00 00 00       	mov    $0x8,%edi
  40167b:e8 d0 f5 ff ff       	callq  400c50 <exit@plt>
  401680:	48 83 c4 50          	add    $0x50,%rsp
  401684:	5b                   	pop    %rbx
  401685:	5d                   	pop    %rbp
  401686:	41 5c                	pop    %r12
  401688:	c3                   	retq   

0000000000401689 <explode_bomb>:
  401689:	48 83 ec 08          	sub    $0x8,%rsp
  40168d:	bf de 1d 40 00       	mov    $0x401dde,%edi
  401692:	e8 59 f4 ff ff       	callq  400af0 <puts@plt>
  401697:	bf e7 1d 40 00       	mov    $0x401de7,%edi
  40169c:	e8 4f f4 ff ff       	callq  400af0 <puts@plt>
  4016a1:	bf 08 00 00 00       	mov    $0x8,%edi
  4016a6:	e8 a5 f5 ff ff       	callq  400c50 <exit@plt>

00000000004016ab <read_six_numbers>:
  4016ab:	48 83 ec 08          	sub    $0x8,%rsp
  4016af:	48 89 f2             	mov    %rsi,%rdx
  4016b2:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  4016b6:	48 8d 46 14          	lea    0x14(%rsi),%rax
  4016ba:	50                   	push   %rax
  4016bb:	48 8d 46 10          	lea    0x10(%rsi),%rax
  4016bf:	50                   	push   %rax
  4016c0:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  4016c4:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  4016c8:	be fe 1d 40 00       	mov    $0x401dfe,%esi
  4016cd:	b8 00 00 00 00       	mov    $0x0,%eax
  4016d2:	e8 29 f5 ff ff       	callq  400c00 <__isoc99_sscanf@plt>
  4016d7:	48 83 c4 10          	add    $0x10,%rsp
  4016db:	83 f8 05             	cmp    $0x5,%eax
  4016de:	7f 05                	jg     4016e5 <read_six_numbers+0x3a>
  4016e0:	e8 a4 ff ff ff       	callq  401689 <explode_bomb>
  4016e5:	48 83 c4 08          	add    $0x8,%rsp
  4016e9:	c3                   	retq   

00000000004016ea <read_line>:
  4016ea:	48 83 ec 08          	sub    $0x8,%rsp
  4016ee:	b8 00 00 00 00       	mov    $0x0,%eax
  4016f3:	e8 38 fd ff ff       	callq  401430 <skip>
  4016f8:	48 85 c0             	test   %rax,%rax
  4016fb:	75 64                	jne    401761 <read_line+0x77>
  4016fd:	48 8b 05 24 23 20 00 	mov    0x202324(%rip),%rax        # 603a28 <stdin@@GLIBC_2.2.5>
  401704:	48 39 05 2d 23 20 00 	cmp    %rax,0x20232d(%rip)        # 603a38 <infile>
  40170b:	75 0f                	jne    40171c <read_line+0x32>
  40170d:	bf 10 1e 40 00       	mov    $0x401e10,%edi
  401712:	e8 d9 f3 ff ff       	callq  400af0 <puts@plt>
  401717:	e8 6d ff ff ff       	callq  401689 <explode_bomb>
  40171c:	bf 2e 1e 40 00       	mov    $0x401e2e,%edi
  401721:	e8 aa f3 ff ff       	callq  400ad0 <getenv@plt>
  401726:	48 85 c0             	test   %rax,%rax
  401729:	74 0a                	je     401735 <read_line+0x4b>
  40172b:	bf 00 00 00 00       	mov    $0x0,%edi
  401730:	e8 1b f5 ff ff       	callq  400c50 <exit@plt>
  401735:	48 8b 05 ec 22 20 00 	mov    0x2022ec(%rip),%rax        # 603a28 <stdin@@GLIBC_2.2.5>
  40173c:	48 89 05 f5 22 20 00 	mov    %rax,0x2022f5(%rip)        # 603a38 <infile>
  401743:	b8 00 00 00 00       	mov    $0x0,%eax
  401748:	e8 e3 fc ff ff       	callq  401430 <skip>
  40174d:	48 85 c0             	test   %rax,%rax
  401750:	75 0f                	jne    401761 <read_line+0x77>
  401752:	bf 10 1e 40 00       	mov    $0x401e10,%edi
  401757:	e8 94 f3 ff ff       	callq  400af0 <puts@plt>
  40175c:	e8 28 ff ff ff       	callq  401689 <explode_bomb>
  401761:	8b 35 cd 22 20 00    	mov    0x2022cd(%rip),%esi        # 603a34 <num_input_strings>
  401767:	48 63 c6             	movslq %esi,%rax
  40176a:48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  40176e:	48 c1 e2 04          	shl    $0x4,%rdx
  401772:	48 81 c2 40 3a 60 00 	add    $0x603a40,%rdx
  401779:	b8 00 00 00 00       	mov    $0x0,%eax
  40177e:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401785:	48 89 d7             	mov    %rdx,%rdi
  401788:	f2 ae                	repnz scas %es:(%rdi),%al
  40178a:	48 f7 d1             	not    %rcx
  40178d:	48 83 e9 01          	sub    $0x1,%rcx
  401791:	83 f9 4f             	cmp    $0x4f,%ecx
  401794:	75 0f                	jne    4017a5 <read_line+0xbb>
  401796:	bf 39 1e 40 00       	mov    $0x401e39,%edi
  40179b:	e8 50 f3 ff ff       	callq  400af0 <puts@plt>
  4017a0:	e8 e4 fe ff ff       	callq  401689 <explode_bomb>
  4017a5:	83 e9 01             	sub    $0x1,%ecx
  4017a8:	48 63 c9             	movslq %ecx,%rcx
  4017ab:	48 63 c6             	movslq %esi,%rax
  4017ae:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4017b2:	48 c1 e0 04          	shl    $0x4,%rax
  4017b6:	c6 84 01 40 3a 60 00 	movb   $0x0,0x603a40(%rcx,%rax,1)
  4017bd:	00 
  4017be:	8d 46 01             	lea    0x1(%rsi),%eax
  4017c1:	89 05 6d 22 20 00    	mov    %eax,0x20226d(%rip)        # 603a34 <num_input_strings>
  4017c7:	48 89 d0             	mov    %rdx,%rax
  4017ca:	48 83 c4 08          	add    $0x8,%rsp
  4017ce:	c3                   	retq   

00000000004017cf <phase_defused>:
  4017cf:	83 3d 5e 22 20 00 06 	cmpl   $0x6,0x20225e(%rip)        # 603a34 <num_input_strings>
  4017d6:	75 66                	jne    40183e <phase_defused+0x6f>
  4017d8:	48 83 ec 68          	sub    $0x68,%rsp
  4017dc:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  4017e1:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  4017e6:	be 54 1e 40 00       	mov    $0x401e54,%esi
  4017eb:	bf 30 3b 60 00       	mov    $0x603b30,%edi
  4017f0:	b8 00 00 00 00       	mov    $0x0,%eax
  4017f5:	e8 06 f4 ff ff       	callq  400c00 <__isoc99_sscanf@plt>
  4017fa:	83 f8 02             	cmp    $0x2,%eax
  4017fd:	75 31                	jne    401830 <phase_defused+0x61>
  4017ff:	be 5a 1e 40 00       	mov    $0x401e5a,%esi
  401804:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  401809:	e8 a1 fa ff ff       	callq  4012af <strings_not_equal>
  40180e:	85 c0                	test   %eax,%eax
  401810:	75 1e                	jne    401830 <phase_defused+0x61>
  401812:	bf d0 1b 40 00       	mov    $0x401bd0,%edi
  401817:	e8 d4 f2 ff ff       	callq  400af0 <puts@plt>
  40181c:	bf f8 1b 40 00       	mov    $0x401bf8,%edi
  401821:	e8 ca f2 ff ff       	callq  400af0 <puts@plt>
  401826:	b8 00 00 00 00       	mov    $0x0,%eax
  40182b:	e8 9f f9 ff ff       	callq  4011cf <secret_phase>
  401830:	bf 30 1c 40 00       	mov    $0x401c30,%edi
  401835:	e8 b6 f2 ff ff       	callq  400af0 <puts@plt>
  40183a:	48 83 c4 68          	add    $0x68,%rsp
  40183e:	f3 c3                	repz retq 

0000000000401840 <__libc_csu_init>:
  401840:	41 57                	push   %r15
  401842:	41 89 ff             	mov    %edi,%r15d
  401845:	41 56                	push   %r14
  401847:	49 89 f6             	mov    %rsi,%r14
  40184a:	41 55                	push   %r13
  40184c:	49 89 d5             	mov    %rdx,%r13
  40184f:	41 54                	push   %r12
  401851:	4c 8d 25 b8 15 20 00 	lea    0x2015b8(%rip),%r12        # 602e10 <__frame_dummy_init_array_entry>
  401858:	55                   	push   %rbp
  401859:	48 8d 2d b8 15 20 00 	lea    0x2015b8(%rip),%rbp        # 602e18 <__init_array_end>
  401860:	53                   	push   %rbx
  401861:	4c 29 e5             	sub    %r12,%rbp
  401864:	31 db                	xor    %ebx,%ebx
  401866:	48 c1 fd 03          	sar    $0x3,%rbp
  40186a:	48 83 ec 08          	sub    $0x8,%rsp
  40186e:	e8 25 f2 ff ff       	callq  400a98 <_init>
  401873:	48 85 ed             	test   %rbp,%rbp
  401876:	74 1e                	je     401896 <__libc_csu_init+0x56>
  401878:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40187f:	00 
  401880:	4c 89 ea             	mov    %r13,%rdx
  401883:	4c 89 f6             	mov    %r14,%rsi
  401886:	44 89 ff             	mov    %r15d,%edi
  401889:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40188d:	48 83 c3 01          	add    $0x1,%rbx
  401891:	48 39 eb             	cmp    %rbp,%rbx
  401894:	75 ea                	jne    401880 <__libc_csu_init+0x40>
  401896:	48 83 c4 08          	add    $0x8,%rsp
  40189a:	5b                   	pop    %rbx
  40189b:	5d                   	pop    %rbp
  40189c:	41 5c                	pop    %r12
  40189e:	41 5d                	pop    %r13
  4018a0:	41 5e                	pop    %r14
  4018a2:	41 5f                	pop    %r15
  4018a4:	c3                   	retq   
  4018a5:	90                   	nop
  4018a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4018ad:	00 00 00 

00000000004018b0 <__libc_csu_fini>:
  4018b0:	f3 c3                	repz retq 
  4018b2:	66 90                	xchg   %ax,%ax

Disassembly of section .fini:

00000000004018b4 <_fini>:
  4018b4:	48 83 ec 08          	sub    $0x8,%rsp
  4018b8:	48 83 c4 08          	add    $0x8,%rsp
  4018bc:	c3                   	retq   
