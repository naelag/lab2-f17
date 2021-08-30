
_ln:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	53                   	push   %ebx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	83 ec 10             	sub    $0x10,%esp
    100a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(argc != 3){
    100d:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    1011:	74 19                	je     102c <main+0x2c>
    printf(2, "Usage: ln old new\n");
    1013:	c7 44 24 04 91 17 00 	movl   $0x1791,0x4(%esp)
    101a:	00 
    101b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1022:	e8 c9 03 00 00       	call   13f0 <printf>
    exit();
    1027:	e8 66 02 00 00       	call   1292 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
    102c:	8b 43 08             	mov    0x8(%ebx),%eax
    102f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1033:	8b 43 04             	mov    0x4(%ebx),%eax
    1036:	89 04 24             	mov    %eax,(%esp)
    1039:	e8 b4 02 00 00       	call   12f2 <link>
    103e:	85 c0                	test   %eax,%eax
    1040:	78 05                	js     1047 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
    1042:	e8 4b 02 00 00       	call   1292 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
    1047:	8b 43 08             	mov    0x8(%ebx),%eax
    104a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    104e:	8b 43 04             	mov    0x4(%ebx),%eax
    1051:	c7 44 24 04 a4 17 00 	movl   $0x17a4,0x4(%esp)
    1058:	00 
    1059:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1060:	89 44 24 08          	mov    %eax,0x8(%esp)
    1064:	e8 87 03 00 00       	call   13f0 <printf>
    1069:	eb d7                	jmp    1042 <main+0x42>
    106b:	66 90                	xchg   %ax,%ax
    106d:	66 90                	xchg   %ax,%ax
    106f:	90                   	nop

00001070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	8b 45 08             	mov    0x8(%ebp),%eax
    1076:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1079:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    107a:	89 c2                	mov    %eax,%edx
    107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1080:	83 c1 01             	add    $0x1,%ecx
    1083:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1087:	83 c2 01             	add    $0x1,%edx
    108a:	84 db                	test   %bl,%bl
    108c:	88 5a ff             	mov    %bl,-0x1(%edx)
    108f:	75 ef                	jne    1080 <strcpy+0x10>
    ;
  return os;
}
    1091:	5b                   	pop    %ebx
    1092:	5d                   	pop    %ebp
    1093:	c3                   	ret    
    1094:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    109a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	8b 55 08             	mov    0x8(%ebp),%edx
    10a6:	53                   	push   %ebx
    10a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10aa:	0f b6 02             	movzbl (%edx),%eax
    10ad:	84 c0                	test   %al,%al
    10af:	74 2d                	je     10de <strcmp+0x3e>
    10b1:	0f b6 19             	movzbl (%ecx),%ebx
    10b4:	38 d8                	cmp    %bl,%al
    10b6:	74 0e                	je     10c6 <strcmp+0x26>
    10b8:	eb 2b                	jmp    10e5 <strcmp+0x45>
    10ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10c0:	38 c8                	cmp    %cl,%al
    10c2:	75 15                	jne    10d9 <strcmp+0x39>
    p++, q++;
    10c4:	89 d9                	mov    %ebx,%ecx
    10c6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10c9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10cc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10cf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    10d3:	84 c0                	test   %al,%al
    10d5:	75 e9                	jne    10c0 <strcmp+0x20>
    10d7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10d9:	29 c8                	sub    %ecx,%eax
}
    10db:	5b                   	pop    %ebx
    10dc:	5d                   	pop    %ebp
    10dd:	c3                   	ret    
    10de:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    10e1:	31 c0                	xor    %eax,%eax
    10e3:	eb f4                	jmp    10d9 <strcmp+0x39>
    10e5:	0f b6 cb             	movzbl %bl,%ecx
    10e8:	eb ef                	jmp    10d9 <strcmp+0x39>
    10ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000010f0 <strlen>:

uint
strlen(char *s)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10f6:	80 39 00             	cmpb   $0x0,(%ecx)
    10f9:	74 12                	je     110d <strlen+0x1d>
    10fb:	31 d2                	xor    %edx,%edx
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
    1100:	83 c2 01             	add    $0x1,%edx
    1103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1107:	89 d0                	mov    %edx,%eax
    1109:	75 f5                	jne    1100 <strlen+0x10>
    ;
  return n;
}
    110b:	5d                   	pop    %ebp
    110c:	c3                   	ret    
  for(n = 0; s[n]; n++)
    110d:	31 c0                	xor    %eax,%eax
}
    110f:	5d                   	pop    %ebp
    1110:	c3                   	ret    
    1111:	eb 0d                	jmp    1120 <memset>
    1113:	90                   	nop
    1114:	90                   	nop
    1115:	90                   	nop
    1116:	90                   	nop
    1117:	90                   	nop
    1118:	90                   	nop
    1119:	90                   	nop
    111a:	90                   	nop
    111b:	90                   	nop
    111c:	90                   	nop
    111d:	90                   	nop
    111e:	90                   	nop
    111f:	90                   	nop

00001120 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	8b 55 08             	mov    0x8(%ebp),%edx
    1126:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1127:	8b 4d 10             	mov    0x10(%ebp),%ecx
    112a:	8b 45 0c             	mov    0xc(%ebp),%eax
    112d:	89 d7                	mov    %edx,%edi
    112f:	fc                   	cld    
    1130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1132:	89 d0                	mov    %edx,%eax
    1134:	5f                   	pop    %edi
    1135:	5d                   	pop    %ebp
    1136:	c3                   	ret    
    1137:	89 f6                	mov    %esi,%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <strchr>:

char*
strchr(const char *s, char c)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	8b 45 08             	mov    0x8(%ebp),%eax
    1146:	53                   	push   %ebx
    1147:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    114a:	0f b6 18             	movzbl (%eax),%ebx
    114d:	84 db                	test   %bl,%bl
    114f:	74 1d                	je     116e <strchr+0x2e>
    if(*s == c)
    1151:	38 d3                	cmp    %dl,%bl
    1153:	89 d1                	mov    %edx,%ecx
    1155:	75 0d                	jne    1164 <strchr+0x24>
    1157:	eb 17                	jmp    1170 <strchr+0x30>
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1160:	38 ca                	cmp    %cl,%dl
    1162:	74 0c                	je     1170 <strchr+0x30>
  for(; *s; s++)
    1164:	83 c0 01             	add    $0x1,%eax
    1167:	0f b6 10             	movzbl (%eax),%edx
    116a:	84 d2                	test   %dl,%dl
    116c:	75 f2                	jne    1160 <strchr+0x20>
      return (char*)s;
  return 0;
    116e:	31 c0                	xor    %eax,%eax
}
    1170:	5b                   	pop    %ebx
    1171:	5d                   	pop    %ebp
    1172:	c3                   	ret    
    1173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001180 <gets>:

char*
gets(char *buf, int max)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1185:	31 f6                	xor    %esi,%esi
{
    1187:	53                   	push   %ebx
    1188:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    118b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    118e:	eb 31                	jmp    11c1 <gets+0x41>
    cc = read(0, &c, 1);
    1190:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1197:	00 
    1198:	89 7c 24 04          	mov    %edi,0x4(%esp)
    119c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11a3:	e8 02 01 00 00       	call   12aa <read>
    if(cc < 1)
    11a8:	85 c0                	test   %eax,%eax
    11aa:	7e 1d                	jle    11c9 <gets+0x49>
      break;
    buf[i++] = c;
    11ac:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    11b0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    11b2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    11b5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    11b7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11bb:	74 0c                	je     11c9 <gets+0x49>
    11bd:	3c 0a                	cmp    $0xa,%al
    11bf:	74 08                	je     11c9 <gets+0x49>
  for(i=0; i+1 < max; ){
    11c1:	8d 5e 01             	lea    0x1(%esi),%ebx
    11c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11c7:	7c c7                	jl     1190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11c9:	8b 45 08             	mov    0x8(%ebp),%eax
    11cc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11d0:	83 c4 2c             	add    $0x2c,%esp
    11d3:	5b                   	pop    %ebx
    11d4:	5e                   	pop    %esi
    11d5:	5f                   	pop    %edi
    11d6:	5d                   	pop    %ebp
    11d7:	c3                   	ret    
    11d8:	90                   	nop
    11d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011e0 <stat>:

int
stat(char *n, struct stat *st)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	56                   	push   %esi
    11e4:	53                   	push   %ebx
    11e5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11e8:	8b 45 08             	mov    0x8(%ebp),%eax
    11eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11f2:	00 
    11f3:	89 04 24             	mov    %eax,(%esp)
    11f6:	e8 d7 00 00 00       	call   12d2 <open>
  if(fd < 0)
    11fb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    11fd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    11ff:	78 27                	js     1228 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    1201:	8b 45 0c             	mov    0xc(%ebp),%eax
    1204:	89 1c 24             	mov    %ebx,(%esp)
    1207:	89 44 24 04          	mov    %eax,0x4(%esp)
    120b:	e8 da 00 00 00       	call   12ea <fstat>
  close(fd);
    1210:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1213:	89 c6                	mov    %eax,%esi
  close(fd);
    1215:	e8 a0 00 00 00       	call   12ba <close>
  return r;
    121a:	89 f0                	mov    %esi,%eax
}
    121c:	83 c4 10             	add    $0x10,%esp
    121f:	5b                   	pop    %ebx
    1220:	5e                   	pop    %esi
    1221:	5d                   	pop    %ebp
    1222:	c3                   	ret    
    1223:	90                   	nop
    1224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1228:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    122d:	eb ed                	jmp    121c <stat+0x3c>
    122f:	90                   	nop

00001230 <atoi>:

int
atoi(const char *s)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1236:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1237:	0f be 11             	movsbl (%ecx),%edx
    123a:	8d 42 d0             	lea    -0x30(%edx),%eax
    123d:	3c 09                	cmp    $0x9,%al
  n = 0;
    123f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1244:	77 17                	ja     125d <atoi+0x2d>
    1246:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1248:	83 c1 01             	add    $0x1,%ecx
    124b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    124e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1252:	0f be 11             	movsbl (%ecx),%edx
    1255:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1258:	80 fb 09             	cmp    $0x9,%bl
    125b:	76 eb                	jbe    1248 <atoi+0x18>
  return n;
}
    125d:	5b                   	pop    %ebx
    125e:	5d                   	pop    %ebp
    125f:	c3                   	ret    

00001260 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1260:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1261:	31 d2                	xor    %edx,%edx
{
    1263:	89 e5                	mov    %esp,%ebp
    1265:	56                   	push   %esi
    1266:	8b 45 08             	mov    0x8(%ebp),%eax
    1269:	53                   	push   %ebx
    126a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    126d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1270:	85 db                	test   %ebx,%ebx
    1272:	7e 12                	jle    1286 <memmove+0x26>
    1274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1278:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    127c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    127f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1282:	39 da                	cmp    %ebx,%edx
    1284:	75 f2                	jne    1278 <memmove+0x18>
  return vdst;
}
    1286:	5b                   	pop    %ebx
    1287:	5e                   	pop    %esi
    1288:	5d                   	pop    %ebp
    1289:	c3                   	ret    

0000128a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    128a:	b8 01 00 00 00       	mov    $0x1,%eax
    128f:	cd 40                	int    $0x40
    1291:	c3                   	ret    

00001292 <exit>:
SYSCALL(exit)
    1292:	b8 02 00 00 00       	mov    $0x2,%eax
    1297:	cd 40                	int    $0x40
    1299:	c3                   	ret    

0000129a <wait>:
SYSCALL(wait)
    129a:	b8 03 00 00 00       	mov    $0x3,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <pipe>:
SYSCALL(pipe)
    12a2:	b8 04 00 00 00       	mov    $0x4,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <read>:
SYSCALL(read)
    12aa:	b8 05 00 00 00       	mov    $0x5,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <write>:
SYSCALL(write)
    12b2:	b8 10 00 00 00       	mov    $0x10,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <close>:
SYSCALL(close)
    12ba:	b8 15 00 00 00       	mov    $0x15,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <kill>:
SYSCALL(kill)
    12c2:	b8 06 00 00 00       	mov    $0x6,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <exec>:
SYSCALL(exec)
    12ca:	b8 07 00 00 00       	mov    $0x7,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <open>:
SYSCALL(open)
    12d2:	b8 0f 00 00 00       	mov    $0xf,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <mknod>:
SYSCALL(mknod)
    12da:	b8 11 00 00 00       	mov    $0x11,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <unlink>:
SYSCALL(unlink)
    12e2:	b8 12 00 00 00       	mov    $0x12,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <fstat>:
SYSCALL(fstat)
    12ea:	b8 08 00 00 00       	mov    $0x8,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <link>:
SYSCALL(link)
    12f2:	b8 13 00 00 00       	mov    $0x13,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <mkdir>:
SYSCALL(mkdir)
    12fa:	b8 14 00 00 00       	mov    $0x14,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <chdir>:
SYSCALL(chdir)
    1302:	b8 09 00 00 00       	mov    $0x9,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <dup>:
SYSCALL(dup)
    130a:	b8 0a 00 00 00       	mov    $0xa,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <getpid>:
SYSCALL(getpid)
    1312:	b8 0b 00 00 00       	mov    $0xb,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <sbrk>:
SYSCALL(sbrk)
    131a:	b8 0c 00 00 00       	mov    $0xc,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <sleep>:
SYSCALL(sleep)
    1322:	b8 0d 00 00 00       	mov    $0xd,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <uptime>:
SYSCALL(uptime)
    132a:	b8 0e 00 00 00       	mov    $0xe,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <shm_open>:
SYSCALL(shm_open)
    1332:	b8 16 00 00 00       	mov    $0x16,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <shm_close>:
SYSCALL(shm_close)	
    133a:	b8 17 00 00 00       	mov    $0x17,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    
    1342:	66 90                	xchg   %ax,%ax
    1344:	66 90                	xchg   %ax,%ax
    1346:	66 90                	xchg   %ax,%ax
    1348:	66 90                	xchg   %ax,%ax
    134a:	66 90                	xchg   %ax,%ax
    134c:	66 90                	xchg   %ax,%ax
    134e:	66 90                	xchg   %ax,%ax

00001350 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	57                   	push   %edi
    1354:	56                   	push   %esi
    1355:	89 c6                	mov    %eax,%esi
    1357:	53                   	push   %ebx
    1358:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    135b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    135e:	85 db                	test   %ebx,%ebx
    1360:	74 09                	je     136b <printint+0x1b>
    1362:	89 d0                	mov    %edx,%eax
    1364:	c1 e8 1f             	shr    $0x1f,%eax
    1367:	84 c0                	test   %al,%al
    1369:	75 75                	jne    13e0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    136b:	89 d0                	mov    %edx,%eax
  neg = 0;
    136d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1374:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1377:	31 ff                	xor    %edi,%edi
    1379:	89 ce                	mov    %ecx,%esi
    137b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    137e:	eb 02                	jmp    1382 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1380:	89 cf                	mov    %ecx,%edi
    1382:	31 d2                	xor    %edx,%edx
    1384:	f7 f6                	div    %esi
    1386:	8d 4f 01             	lea    0x1(%edi),%ecx
    1389:	0f b6 92 bf 17 00 00 	movzbl 0x17bf(%edx),%edx
  }while((x /= base) != 0);
    1390:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1392:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1395:	75 e9                	jne    1380 <printint+0x30>
  if(neg)
    1397:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    139a:	89 c8                	mov    %ecx,%eax
    139c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    139f:	85 d2                	test   %edx,%edx
    13a1:	74 08                	je     13ab <printint+0x5b>
    buf[i++] = '-';
    13a3:	8d 4f 02             	lea    0x2(%edi),%ecx
    13a6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    13ab:	8d 79 ff             	lea    -0x1(%ecx),%edi
    13ae:	66 90                	xchg   %ax,%ax
    13b0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    13b5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    13b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13bf:	00 
    13c0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    13c4:	89 34 24             	mov    %esi,(%esp)
    13c7:	88 45 d7             	mov    %al,-0x29(%ebp)
    13ca:	e8 e3 fe ff ff       	call   12b2 <write>
  while(--i >= 0)
    13cf:	83 ff ff             	cmp    $0xffffffff,%edi
    13d2:	75 dc                	jne    13b0 <printint+0x60>
    putc(fd, buf[i]);
}
    13d4:	83 c4 4c             	add    $0x4c,%esp
    13d7:	5b                   	pop    %ebx
    13d8:	5e                   	pop    %esi
    13d9:	5f                   	pop    %edi
    13da:	5d                   	pop    %ebp
    13db:	c3                   	ret    
    13dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    13e0:	89 d0                	mov    %edx,%eax
    13e2:	f7 d8                	neg    %eax
    neg = 1;
    13e4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    13eb:	eb 87                	jmp    1374 <printint+0x24>
    13ed:	8d 76 00             	lea    0x0(%esi),%esi

000013f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    13f4:	31 ff                	xor    %edi,%edi
{
    13f6:	56                   	push   %esi
    13f7:	53                   	push   %ebx
    13f8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    13fe:	8d 45 10             	lea    0x10(%ebp),%eax
{
    1401:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    1404:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    1407:	0f b6 13             	movzbl (%ebx),%edx
    140a:	83 c3 01             	add    $0x1,%ebx
    140d:	84 d2                	test   %dl,%dl
    140f:	75 39                	jne    144a <printf+0x5a>
    1411:	e9 c2 00 00 00       	jmp    14d8 <printf+0xe8>
    1416:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1418:	83 fa 25             	cmp    $0x25,%edx
    141b:	0f 84 bf 00 00 00    	je     14e0 <printf+0xf0>
  write(fd, &c, 1);
    1421:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1424:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    142b:	00 
    142c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1430:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    1433:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    1436:	e8 77 fe ff ff       	call   12b2 <write>
    143b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    143e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1442:	84 d2                	test   %dl,%dl
    1444:	0f 84 8e 00 00 00    	je     14d8 <printf+0xe8>
    if(state == 0){
    144a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    144c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    144f:	74 c7                	je     1418 <printf+0x28>
      }
    } else if(state == '%'){
    1451:	83 ff 25             	cmp    $0x25,%edi
    1454:	75 e5                	jne    143b <printf+0x4b>
      if(c == 'd'){
    1456:	83 fa 64             	cmp    $0x64,%edx
    1459:	0f 84 31 01 00 00    	je     1590 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    145f:	25 f7 00 00 00       	and    $0xf7,%eax
    1464:	83 f8 70             	cmp    $0x70,%eax
    1467:	0f 84 83 00 00 00    	je     14f0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    146d:	83 fa 73             	cmp    $0x73,%edx
    1470:	0f 84 a2 00 00 00    	je     1518 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1476:	83 fa 63             	cmp    $0x63,%edx
    1479:	0f 84 35 01 00 00    	je     15b4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    147f:	83 fa 25             	cmp    $0x25,%edx
    1482:	0f 84 e0 00 00 00    	je     1568 <printf+0x178>
  write(fd, &c, 1);
    1488:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    148b:	83 c3 01             	add    $0x1,%ebx
    148e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1495:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1496:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1498:	89 44 24 04          	mov    %eax,0x4(%esp)
    149c:	89 34 24             	mov    %esi,(%esp)
    149f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    14a2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    14a6:	e8 07 fe ff ff       	call   12b2 <write>
        putc(fd, c);
    14ab:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    14ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14b8:	00 
    14b9:	89 44 24 04          	mov    %eax,0x4(%esp)
    14bd:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    14c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    14c3:	e8 ea fd ff ff       	call   12b2 <write>
  for(i = 0; fmt[i]; i++){
    14c8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    14cc:	84 d2                	test   %dl,%dl
    14ce:	0f 85 76 ff ff ff    	jne    144a <printf+0x5a>
    14d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    14d8:	83 c4 3c             	add    $0x3c,%esp
    14db:	5b                   	pop    %ebx
    14dc:	5e                   	pop    %esi
    14dd:	5f                   	pop    %edi
    14de:	5d                   	pop    %ebp
    14df:	c3                   	ret    
        state = '%';
    14e0:	bf 25 00 00 00       	mov    $0x25,%edi
    14e5:	e9 51 ff ff ff       	jmp    143b <printf+0x4b>
    14ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    14f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    14f3:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    14f8:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    14fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1501:	8b 10                	mov    (%eax),%edx
    1503:	89 f0                	mov    %esi,%eax
    1505:	e8 46 fe ff ff       	call   1350 <printint>
        ap++;
    150a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    150e:	e9 28 ff ff ff       	jmp    143b <printf+0x4b>
    1513:	90                   	nop
    1514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1518:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    151b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    151f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    1521:	b8 b8 17 00 00       	mov    $0x17b8,%eax
    1526:	85 ff                	test   %edi,%edi
    1528:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    152b:	0f b6 07             	movzbl (%edi),%eax
    152e:	84 c0                	test   %al,%al
    1530:	74 2a                	je     155c <printf+0x16c>
    1532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1538:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    153b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    153e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    1541:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1548:	00 
    1549:	89 44 24 04          	mov    %eax,0x4(%esp)
    154d:	89 34 24             	mov    %esi,(%esp)
    1550:	e8 5d fd ff ff       	call   12b2 <write>
        while(*s != 0){
    1555:	0f b6 07             	movzbl (%edi),%eax
    1558:	84 c0                	test   %al,%al
    155a:	75 dc                	jne    1538 <printf+0x148>
      state = 0;
    155c:	31 ff                	xor    %edi,%edi
    155e:	e9 d8 fe ff ff       	jmp    143b <printf+0x4b>
    1563:	90                   	nop
    1564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1568:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    156b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    156d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1574:	00 
    1575:	89 44 24 04          	mov    %eax,0x4(%esp)
    1579:	89 34 24             	mov    %esi,(%esp)
    157c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1580:	e8 2d fd ff ff       	call   12b2 <write>
    1585:	e9 b1 fe ff ff       	jmp    143b <printf+0x4b>
    158a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1590:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1593:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    1598:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    159b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15a2:	8b 10                	mov    (%eax),%edx
    15a4:	89 f0                	mov    %esi,%eax
    15a6:	e8 a5 fd ff ff       	call   1350 <printint>
        ap++;
    15ab:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15af:	e9 87 fe ff ff       	jmp    143b <printf+0x4b>
        putc(fd, *ap);
    15b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    15b7:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    15b9:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    15bb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15c2:	00 
    15c3:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    15c6:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    15c9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    15cc:	89 44 24 04          	mov    %eax,0x4(%esp)
    15d0:	e8 dd fc ff ff       	call   12b2 <write>
        ap++;
    15d5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15d9:	e9 5d fe ff ff       	jmp    143b <printf+0x4b>
    15de:	66 90                	xchg   %ax,%ax

000015e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15e1:	a1 74 1a 00 00       	mov    0x1a74,%eax
{
    15e6:	89 e5                	mov    %esp,%ebp
    15e8:	57                   	push   %edi
    15e9:	56                   	push   %esi
    15ea:	53                   	push   %ebx
    15eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15ee:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    15f0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15f3:	39 d0                	cmp    %edx,%eax
    15f5:	72 11                	jb     1608 <free+0x28>
    15f7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15f8:	39 c8                	cmp    %ecx,%eax
    15fa:	72 04                	jb     1600 <free+0x20>
    15fc:	39 ca                	cmp    %ecx,%edx
    15fe:	72 10                	jb     1610 <free+0x30>
    1600:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1602:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1604:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1606:	73 f0                	jae    15f8 <free+0x18>
    1608:	39 ca                	cmp    %ecx,%edx
    160a:	72 04                	jb     1610 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    160c:	39 c8                	cmp    %ecx,%eax
    160e:	72 f0                	jb     1600 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1610:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1613:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1616:	39 cf                	cmp    %ecx,%edi
    1618:	74 1e                	je     1638 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    161a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    161d:	8b 48 04             	mov    0x4(%eax),%ecx
    1620:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1623:	39 f2                	cmp    %esi,%edx
    1625:	74 28                	je     164f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1627:	89 10                	mov    %edx,(%eax)
  freep = p;
    1629:	a3 74 1a 00 00       	mov    %eax,0x1a74
}
    162e:	5b                   	pop    %ebx
    162f:	5e                   	pop    %esi
    1630:	5f                   	pop    %edi
    1631:	5d                   	pop    %ebp
    1632:	c3                   	ret    
    1633:	90                   	nop
    1634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1638:	03 71 04             	add    0x4(%ecx),%esi
    163b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    163e:	8b 08                	mov    (%eax),%ecx
    1640:	8b 09                	mov    (%ecx),%ecx
    1642:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1645:	8b 48 04             	mov    0x4(%eax),%ecx
    1648:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    164b:	39 f2                	cmp    %esi,%edx
    164d:	75 d8                	jne    1627 <free+0x47>
    p->s.size += bp->s.size;
    164f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    1652:	a3 74 1a 00 00       	mov    %eax,0x1a74
    p->s.size += bp->s.size;
    1657:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    165a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    165d:	89 10                	mov    %edx,(%eax)
}
    165f:	5b                   	pop    %ebx
    1660:	5e                   	pop    %esi
    1661:	5f                   	pop    %edi
    1662:	5d                   	pop    %ebp
    1663:	c3                   	ret    
    1664:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    166a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001670 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1670:	55                   	push   %ebp
    1671:	89 e5                	mov    %esp,%ebp
    1673:	57                   	push   %edi
    1674:	56                   	push   %esi
    1675:	53                   	push   %ebx
    1676:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1679:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    167c:	8b 1d 74 1a 00 00    	mov    0x1a74,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1682:	8d 48 07             	lea    0x7(%eax),%ecx
    1685:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1688:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    168a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    168d:	0f 84 9b 00 00 00    	je     172e <malloc+0xbe>
    1693:	8b 13                	mov    (%ebx),%edx
    1695:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1698:	39 fe                	cmp    %edi,%esi
    169a:	76 64                	jbe    1700 <malloc+0x90>
    169c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    16a3:	bb 00 80 00 00       	mov    $0x8000,%ebx
    16a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    16ab:	eb 0e                	jmp    16bb <malloc+0x4b>
    16ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16b0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16b2:	8b 78 04             	mov    0x4(%eax),%edi
    16b5:	39 fe                	cmp    %edi,%esi
    16b7:	76 4f                	jbe    1708 <malloc+0x98>
    16b9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16bb:	3b 15 74 1a 00 00    	cmp    0x1a74,%edx
    16c1:	75 ed                	jne    16b0 <malloc+0x40>
  if(nu < 4096)
    16c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16c6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    16cc:	bf 00 10 00 00       	mov    $0x1000,%edi
    16d1:	0f 43 fe             	cmovae %esi,%edi
    16d4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    16d7:	89 04 24             	mov    %eax,(%esp)
    16da:	e8 3b fc ff ff       	call   131a <sbrk>
  if(p == (char*)-1)
    16df:	83 f8 ff             	cmp    $0xffffffff,%eax
    16e2:	74 18                	je     16fc <malloc+0x8c>
  hp->s.size = nu;
    16e4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    16e7:	83 c0 08             	add    $0x8,%eax
    16ea:	89 04 24             	mov    %eax,(%esp)
    16ed:	e8 ee fe ff ff       	call   15e0 <free>
  return freep;
    16f2:	8b 15 74 1a 00 00    	mov    0x1a74,%edx
      if((p = morecore(nunits)) == 0)
    16f8:	85 d2                	test   %edx,%edx
    16fa:	75 b4                	jne    16b0 <malloc+0x40>
        return 0;
    16fc:	31 c0                	xor    %eax,%eax
    16fe:	eb 20                	jmp    1720 <malloc+0xb0>
    if(p->s.size >= nunits){
    1700:	89 d0                	mov    %edx,%eax
    1702:	89 da                	mov    %ebx,%edx
    1704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1708:	39 fe                	cmp    %edi,%esi
    170a:	74 1c                	je     1728 <malloc+0xb8>
        p->s.size -= nunits;
    170c:	29 f7                	sub    %esi,%edi
    170e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1711:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1714:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1717:	89 15 74 1a 00 00    	mov    %edx,0x1a74
      return (void*)(p + 1);
    171d:	83 c0 08             	add    $0x8,%eax
  }
}
    1720:	83 c4 1c             	add    $0x1c,%esp
    1723:	5b                   	pop    %ebx
    1724:	5e                   	pop    %esi
    1725:	5f                   	pop    %edi
    1726:	5d                   	pop    %ebp
    1727:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1728:	8b 08                	mov    (%eax),%ecx
    172a:	89 0a                	mov    %ecx,(%edx)
    172c:	eb e9                	jmp    1717 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    172e:	c7 05 74 1a 00 00 78 	movl   $0x1a78,0x1a74
    1735:	1a 00 00 
    base.s.size = 0;
    1738:	ba 78 1a 00 00       	mov    $0x1a78,%edx
    base.s.ptr = freep = prevp = &base;
    173d:	c7 05 78 1a 00 00 78 	movl   $0x1a78,0x1a78
    1744:	1a 00 00 
    base.s.size = 0;
    1747:	c7 05 7c 1a 00 00 00 	movl   $0x0,0x1a7c
    174e:	00 00 00 
    1751:	e9 46 ff ff ff       	jmp    169c <malloc+0x2c>
    1756:	66 90                	xchg   %ax,%ax
    1758:	66 90                	xchg   %ax,%ax
    175a:	66 90                	xchg   %ax,%ax
    175c:	66 90                	xchg   %ax,%ax
    175e:	66 90                	xchg   %ax,%ax

00001760 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1760:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1761:	b9 01 00 00 00       	mov    $0x1,%ecx
    1766:	89 e5                	mov    %esp,%ebp
    1768:	8b 55 08             	mov    0x8(%ebp),%edx
    176b:	90                   	nop
    176c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1770:	89 c8                	mov    %ecx,%eax
    1772:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1775:	85 c0                	test   %eax,%eax
    1777:	75 f7                	jne    1770 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1779:	0f ae f0             	mfence 
}
    177c:	5d                   	pop    %ebp
    177d:	c3                   	ret    
    177e:	66 90                	xchg   %ax,%ax

00001780 <urelease>:

void urelease (struct uspinlock *lk) {
    1780:	55                   	push   %ebp
    1781:	89 e5                	mov    %esp,%ebp
    1783:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1786:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1789:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    178f:	5d                   	pop    %ebp
    1790:	c3                   	ret    
