
_zombie:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
    1009:	e8 3c 02 00 00       	call   124a <fork>
    100e:	85 c0                	test   %eax,%eax
    1010:	7e 0c                	jle    101e <main+0x1e>
    sleep(5);  // Let child exit before parent.
    1012:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1019:	e8 c4 02 00 00       	call   12e2 <sleep>
  exit();
    101e:	e8 2f 02 00 00       	call   1252 <exit>
    1023:	66 90                	xchg   %ax,%ax
    1025:	66 90                	xchg   %ax,%ax
    1027:	66 90                	xchg   %ax,%ax
    1029:	66 90                	xchg   %ax,%ax
    102b:	66 90                	xchg   %ax,%ax
    102d:	66 90                	xchg   %ax,%ax
    102f:	90                   	nop

00001030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	8b 45 08             	mov    0x8(%ebp),%eax
    1036:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1039:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    103a:	89 c2                	mov    %eax,%edx
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1040:	83 c1 01             	add    $0x1,%ecx
    1043:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1047:	83 c2 01             	add    $0x1,%edx
    104a:	84 db                	test   %bl,%bl
    104c:	88 5a ff             	mov    %bl,-0x1(%edx)
    104f:	75 ef                	jne    1040 <strcpy+0x10>
    ;
  return os;
}
    1051:	5b                   	pop    %ebx
    1052:	5d                   	pop    %ebp
    1053:	c3                   	ret    
    1054:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    105a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	8b 55 08             	mov    0x8(%ebp),%edx
    1066:	53                   	push   %ebx
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    106a:	0f b6 02             	movzbl (%edx),%eax
    106d:	84 c0                	test   %al,%al
    106f:	74 2d                	je     109e <strcmp+0x3e>
    1071:	0f b6 19             	movzbl (%ecx),%ebx
    1074:	38 d8                	cmp    %bl,%al
    1076:	74 0e                	je     1086 <strcmp+0x26>
    1078:	eb 2b                	jmp    10a5 <strcmp+0x45>
    107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1080:	38 c8                	cmp    %cl,%al
    1082:	75 15                	jne    1099 <strcmp+0x39>
    p++, q++;
    1084:	89 d9                	mov    %ebx,%ecx
    1086:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1089:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    108c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    108f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    1093:	84 c0                	test   %al,%al
    1095:	75 e9                	jne    1080 <strcmp+0x20>
    1097:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1099:	29 c8                	sub    %ecx,%eax
}
    109b:	5b                   	pop    %ebx
    109c:	5d                   	pop    %ebp
    109d:	c3                   	ret    
    109e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    10a1:	31 c0                	xor    %eax,%eax
    10a3:	eb f4                	jmp    1099 <strcmp+0x39>
    10a5:	0f b6 cb             	movzbl %bl,%ecx
    10a8:	eb ef                	jmp    1099 <strcmp+0x39>
    10aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000010b0 <strlen>:

uint
strlen(char *s)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10b6:	80 39 00             	cmpb   $0x0,(%ecx)
    10b9:	74 12                	je     10cd <strlen+0x1d>
    10bb:	31 d2                	xor    %edx,%edx
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
    10c0:	83 c2 01             	add    $0x1,%edx
    10c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10c7:	89 d0                	mov    %edx,%eax
    10c9:	75 f5                	jne    10c0 <strlen+0x10>
    ;
  return n;
}
    10cb:	5d                   	pop    %ebp
    10cc:	c3                   	ret    
  for(n = 0; s[n]; n++)
    10cd:	31 c0                	xor    %eax,%eax
}
    10cf:	5d                   	pop    %ebp
    10d0:	c3                   	ret    
    10d1:	eb 0d                	jmp    10e0 <memset>
    10d3:	90                   	nop
    10d4:	90                   	nop
    10d5:	90                   	nop
    10d6:	90                   	nop
    10d7:	90                   	nop
    10d8:	90                   	nop
    10d9:	90                   	nop
    10da:	90                   	nop
    10db:	90                   	nop
    10dc:	90                   	nop
    10dd:	90                   	nop
    10de:	90                   	nop
    10df:	90                   	nop

000010e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	8b 55 08             	mov    0x8(%ebp),%edx
    10e6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ed:	89 d7                	mov    %edx,%edi
    10ef:	fc                   	cld    
    10f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10f2:	89 d0                	mov    %edx,%eax
    10f4:	5f                   	pop    %edi
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <strchr>:

char*
strchr(const char *s, char c)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	8b 45 08             	mov    0x8(%ebp),%eax
    1106:	53                   	push   %ebx
    1107:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    110a:	0f b6 18             	movzbl (%eax),%ebx
    110d:	84 db                	test   %bl,%bl
    110f:	74 1d                	je     112e <strchr+0x2e>
    if(*s == c)
    1111:	38 d3                	cmp    %dl,%bl
    1113:	89 d1                	mov    %edx,%ecx
    1115:	75 0d                	jne    1124 <strchr+0x24>
    1117:	eb 17                	jmp    1130 <strchr+0x30>
    1119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1120:	38 ca                	cmp    %cl,%dl
    1122:	74 0c                	je     1130 <strchr+0x30>
  for(; *s; s++)
    1124:	83 c0 01             	add    $0x1,%eax
    1127:	0f b6 10             	movzbl (%eax),%edx
    112a:	84 d2                	test   %dl,%dl
    112c:	75 f2                	jne    1120 <strchr+0x20>
      return (char*)s;
  return 0;
    112e:	31 c0                	xor    %eax,%eax
}
    1130:	5b                   	pop    %ebx
    1131:	5d                   	pop    %ebp
    1132:	c3                   	ret    
    1133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <gets>:

char*
gets(char *buf, int max)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1145:	31 f6                	xor    %esi,%esi
{
    1147:	53                   	push   %ebx
    1148:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    114b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    114e:	eb 31                	jmp    1181 <gets+0x41>
    cc = read(0, &c, 1);
    1150:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1157:	00 
    1158:	89 7c 24 04          	mov    %edi,0x4(%esp)
    115c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1163:	e8 02 01 00 00       	call   126a <read>
    if(cc < 1)
    1168:	85 c0                	test   %eax,%eax
    116a:	7e 1d                	jle    1189 <gets+0x49>
      break;
    buf[i++] = c;
    116c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    1170:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    1172:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1175:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    1177:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    117b:	74 0c                	je     1189 <gets+0x49>
    117d:	3c 0a                	cmp    $0xa,%al
    117f:	74 08                	je     1189 <gets+0x49>
  for(i=0; i+1 < max; ){
    1181:	8d 5e 01             	lea    0x1(%esi),%ebx
    1184:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1187:	7c c7                	jl     1150 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1189:	8b 45 08             	mov    0x8(%ebp),%eax
    118c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1190:	83 c4 2c             	add    $0x2c,%esp
    1193:	5b                   	pop    %ebx
    1194:	5e                   	pop    %esi
    1195:	5f                   	pop    %edi
    1196:	5d                   	pop    %ebp
    1197:	c3                   	ret    
    1198:	90                   	nop
    1199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011a0 <stat>:

int
stat(char *n, struct stat *st)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	56                   	push   %esi
    11a4:	53                   	push   %ebx
    11a5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11a8:	8b 45 08             	mov    0x8(%ebp),%eax
    11ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11b2:	00 
    11b3:	89 04 24             	mov    %eax,(%esp)
    11b6:	e8 d7 00 00 00       	call   1292 <open>
  if(fd < 0)
    11bb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    11bd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    11bf:	78 27                	js     11e8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    11c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    11c4:	89 1c 24             	mov    %ebx,(%esp)
    11c7:	89 44 24 04          	mov    %eax,0x4(%esp)
    11cb:	e8 da 00 00 00       	call   12aa <fstat>
  close(fd);
    11d0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11d3:	89 c6                	mov    %eax,%esi
  close(fd);
    11d5:	e8 a0 00 00 00       	call   127a <close>
  return r;
    11da:	89 f0                	mov    %esi,%eax
}
    11dc:	83 c4 10             	add    $0x10,%esp
    11df:	5b                   	pop    %ebx
    11e0:	5e                   	pop    %esi
    11e1:	5d                   	pop    %ebp
    11e2:	c3                   	ret    
    11e3:	90                   	nop
    11e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    11e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11ed:	eb ed                	jmp    11dc <stat+0x3c>
    11ef:	90                   	nop

000011f0 <atoi>:

int
atoi(const char *s)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11f6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    11f7:	0f be 11             	movsbl (%ecx),%edx
    11fa:	8d 42 d0             	lea    -0x30(%edx),%eax
    11fd:	3c 09                	cmp    $0x9,%al
  n = 0;
    11ff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1204:	77 17                	ja     121d <atoi+0x2d>
    1206:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1208:	83 c1 01             	add    $0x1,%ecx
    120b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    120e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1212:	0f be 11             	movsbl (%ecx),%edx
    1215:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1218:	80 fb 09             	cmp    $0x9,%bl
    121b:	76 eb                	jbe    1208 <atoi+0x18>
  return n;
}
    121d:	5b                   	pop    %ebx
    121e:	5d                   	pop    %ebp
    121f:	c3                   	ret    

00001220 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1220:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1221:	31 d2                	xor    %edx,%edx
{
    1223:	89 e5                	mov    %esp,%ebp
    1225:	56                   	push   %esi
    1226:	8b 45 08             	mov    0x8(%ebp),%eax
    1229:	53                   	push   %ebx
    122a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    122d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1230:	85 db                	test   %ebx,%ebx
    1232:	7e 12                	jle    1246 <memmove+0x26>
    1234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1238:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    123c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    123f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1242:	39 da                	cmp    %ebx,%edx
    1244:	75 f2                	jne    1238 <memmove+0x18>
  return vdst;
}
    1246:	5b                   	pop    %ebx
    1247:	5e                   	pop    %esi
    1248:	5d                   	pop    %ebp
    1249:	c3                   	ret    

0000124a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    124a:	b8 01 00 00 00       	mov    $0x1,%eax
    124f:	cd 40                	int    $0x40
    1251:	c3                   	ret    

00001252 <exit>:
SYSCALL(exit)
    1252:	b8 02 00 00 00       	mov    $0x2,%eax
    1257:	cd 40                	int    $0x40
    1259:	c3                   	ret    

0000125a <wait>:
SYSCALL(wait)
    125a:	b8 03 00 00 00       	mov    $0x3,%eax
    125f:	cd 40                	int    $0x40
    1261:	c3                   	ret    

00001262 <pipe>:
SYSCALL(pipe)
    1262:	b8 04 00 00 00       	mov    $0x4,%eax
    1267:	cd 40                	int    $0x40
    1269:	c3                   	ret    

0000126a <read>:
SYSCALL(read)
    126a:	b8 05 00 00 00       	mov    $0x5,%eax
    126f:	cd 40                	int    $0x40
    1271:	c3                   	ret    

00001272 <write>:
SYSCALL(write)
    1272:	b8 10 00 00 00       	mov    $0x10,%eax
    1277:	cd 40                	int    $0x40
    1279:	c3                   	ret    

0000127a <close>:
SYSCALL(close)
    127a:	b8 15 00 00 00       	mov    $0x15,%eax
    127f:	cd 40                	int    $0x40
    1281:	c3                   	ret    

00001282 <kill>:
SYSCALL(kill)
    1282:	b8 06 00 00 00       	mov    $0x6,%eax
    1287:	cd 40                	int    $0x40
    1289:	c3                   	ret    

0000128a <exec>:
SYSCALL(exec)
    128a:	b8 07 00 00 00       	mov    $0x7,%eax
    128f:	cd 40                	int    $0x40
    1291:	c3                   	ret    

00001292 <open>:
SYSCALL(open)
    1292:	b8 0f 00 00 00       	mov    $0xf,%eax
    1297:	cd 40                	int    $0x40
    1299:	c3                   	ret    

0000129a <mknod>:
SYSCALL(mknod)
    129a:	b8 11 00 00 00       	mov    $0x11,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <unlink>:
SYSCALL(unlink)
    12a2:	b8 12 00 00 00       	mov    $0x12,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <fstat>:
SYSCALL(fstat)
    12aa:	b8 08 00 00 00       	mov    $0x8,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <link>:
SYSCALL(link)
    12b2:	b8 13 00 00 00       	mov    $0x13,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <mkdir>:
SYSCALL(mkdir)
    12ba:	b8 14 00 00 00       	mov    $0x14,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <chdir>:
SYSCALL(chdir)
    12c2:	b8 09 00 00 00       	mov    $0x9,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <dup>:
SYSCALL(dup)
    12ca:	b8 0a 00 00 00       	mov    $0xa,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <getpid>:
SYSCALL(getpid)
    12d2:	b8 0b 00 00 00       	mov    $0xb,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <sbrk>:
SYSCALL(sbrk)
    12da:	b8 0c 00 00 00       	mov    $0xc,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <sleep>:
SYSCALL(sleep)
    12e2:	b8 0d 00 00 00       	mov    $0xd,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <uptime>:
SYSCALL(uptime)
    12ea:	b8 0e 00 00 00       	mov    $0xe,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <shm_open>:
SYSCALL(shm_open)
    12f2:	b8 16 00 00 00       	mov    $0x16,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <shm_close>:
SYSCALL(shm_close)	
    12fa:	b8 17 00 00 00       	mov    $0x17,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    
    1302:	66 90                	xchg   %ax,%ax
    1304:	66 90                	xchg   %ax,%ax
    1306:	66 90                	xchg   %ax,%ax
    1308:	66 90                	xchg   %ax,%ax
    130a:	66 90                	xchg   %ax,%ax
    130c:	66 90                	xchg   %ax,%ax
    130e:	66 90                	xchg   %ax,%ax

00001310 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	56                   	push   %esi
    1315:	89 c6                	mov    %eax,%esi
    1317:	53                   	push   %ebx
    1318:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    131b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    131e:	85 db                	test   %ebx,%ebx
    1320:	74 09                	je     132b <printint+0x1b>
    1322:	89 d0                	mov    %edx,%eax
    1324:	c1 e8 1f             	shr    $0x1f,%eax
    1327:	84 c0                	test   %al,%al
    1329:	75 75                	jne    13a0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    132b:	89 d0                	mov    %edx,%eax
  neg = 0;
    132d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1334:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1337:	31 ff                	xor    %edi,%edi
    1339:	89 ce                	mov    %ecx,%esi
    133b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    133e:	eb 02                	jmp    1342 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1340:	89 cf                	mov    %ecx,%edi
    1342:	31 d2                	xor    %edx,%edx
    1344:	f7 f6                	div    %esi
    1346:	8d 4f 01             	lea    0x1(%edi),%ecx
    1349:	0f b6 92 58 17 00 00 	movzbl 0x1758(%edx),%edx
  }while((x /= base) != 0);
    1350:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1352:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1355:	75 e9                	jne    1340 <printint+0x30>
  if(neg)
    1357:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    135a:	89 c8                	mov    %ecx,%eax
    135c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    135f:	85 d2                	test   %edx,%edx
    1361:	74 08                	je     136b <printint+0x5b>
    buf[i++] = '-';
    1363:	8d 4f 02             	lea    0x2(%edi),%ecx
    1366:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    136b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    136e:	66 90                	xchg   %ax,%ax
    1370:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1375:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    1378:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    137f:	00 
    1380:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1384:	89 34 24             	mov    %esi,(%esp)
    1387:	88 45 d7             	mov    %al,-0x29(%ebp)
    138a:	e8 e3 fe ff ff       	call   1272 <write>
  while(--i >= 0)
    138f:	83 ff ff             	cmp    $0xffffffff,%edi
    1392:	75 dc                	jne    1370 <printint+0x60>
    putc(fd, buf[i]);
}
    1394:	83 c4 4c             	add    $0x4c,%esp
    1397:	5b                   	pop    %ebx
    1398:	5e                   	pop    %esi
    1399:	5f                   	pop    %edi
    139a:	5d                   	pop    %ebp
    139b:	c3                   	ret    
    139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    13a0:	89 d0                	mov    %edx,%eax
    13a2:	f7 d8                	neg    %eax
    neg = 1;
    13a4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    13ab:	eb 87                	jmp    1334 <printint+0x24>
    13ad:	8d 76 00             	lea    0x0(%esi),%esi

000013b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13b0:	55                   	push   %ebp
    13b1:	89 e5                	mov    %esp,%ebp
    13b3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    13b4:	31 ff                	xor    %edi,%edi
{
    13b6:	56                   	push   %esi
    13b7:	53                   	push   %ebx
    13b8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    13be:	8d 45 10             	lea    0x10(%ebp),%eax
{
    13c1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    13c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    13c7:	0f b6 13             	movzbl (%ebx),%edx
    13ca:	83 c3 01             	add    $0x1,%ebx
    13cd:	84 d2                	test   %dl,%dl
    13cf:	75 39                	jne    140a <printf+0x5a>
    13d1:	e9 c2 00 00 00       	jmp    1498 <printf+0xe8>
    13d6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    13d8:	83 fa 25             	cmp    $0x25,%edx
    13db:	0f 84 bf 00 00 00    	je     14a0 <printf+0xf0>
  write(fd, &c, 1);
    13e1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    13e4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13eb:	00 
    13ec:	89 44 24 04          	mov    %eax,0x4(%esp)
    13f0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    13f3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    13f6:	e8 77 fe ff ff       	call   1272 <write>
    13fb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    13fe:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1402:	84 d2                	test   %dl,%dl
    1404:	0f 84 8e 00 00 00    	je     1498 <printf+0xe8>
    if(state == 0){
    140a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    140c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    140f:	74 c7                	je     13d8 <printf+0x28>
      }
    } else if(state == '%'){
    1411:	83 ff 25             	cmp    $0x25,%edi
    1414:	75 e5                	jne    13fb <printf+0x4b>
      if(c == 'd'){
    1416:	83 fa 64             	cmp    $0x64,%edx
    1419:	0f 84 31 01 00 00    	je     1550 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    141f:	25 f7 00 00 00       	and    $0xf7,%eax
    1424:	83 f8 70             	cmp    $0x70,%eax
    1427:	0f 84 83 00 00 00    	je     14b0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    142d:	83 fa 73             	cmp    $0x73,%edx
    1430:	0f 84 a2 00 00 00    	je     14d8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1436:	83 fa 63             	cmp    $0x63,%edx
    1439:	0f 84 35 01 00 00    	je     1574 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    143f:	83 fa 25             	cmp    $0x25,%edx
    1442:	0f 84 e0 00 00 00    	je     1528 <printf+0x178>
  write(fd, &c, 1);
    1448:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    144b:	83 c3 01             	add    $0x1,%ebx
    144e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1455:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1456:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1458:	89 44 24 04          	mov    %eax,0x4(%esp)
    145c:	89 34 24             	mov    %esi,(%esp)
    145f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1462:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1466:	e8 07 fe ff ff       	call   1272 <write>
        putc(fd, c);
    146b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    146e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1471:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1478:	00 
    1479:	89 44 24 04          	mov    %eax,0x4(%esp)
    147d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    1480:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    1483:	e8 ea fd ff ff       	call   1272 <write>
  for(i = 0; fmt[i]; i++){
    1488:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    148c:	84 d2                	test   %dl,%dl
    148e:	0f 85 76 ff ff ff    	jne    140a <printf+0x5a>
    1494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    1498:	83 c4 3c             	add    $0x3c,%esp
    149b:	5b                   	pop    %ebx
    149c:	5e                   	pop    %esi
    149d:	5f                   	pop    %edi
    149e:	5d                   	pop    %ebp
    149f:	c3                   	ret    
        state = '%';
    14a0:	bf 25 00 00 00       	mov    $0x25,%edi
    14a5:	e9 51 ff ff ff       	jmp    13fb <printf+0x4b>
    14aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    14b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    14b3:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    14b8:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    14ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    14c1:	8b 10                	mov    (%eax),%edx
    14c3:	89 f0                	mov    %esi,%eax
    14c5:	e8 46 fe ff ff       	call   1310 <printint>
        ap++;
    14ca:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    14ce:	e9 28 ff ff ff       	jmp    13fb <printf+0x4b>
    14d3:	90                   	nop
    14d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    14d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    14db:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    14df:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    14e1:	b8 51 17 00 00       	mov    $0x1751,%eax
    14e6:	85 ff                	test   %edi,%edi
    14e8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    14eb:	0f b6 07             	movzbl (%edi),%eax
    14ee:	84 c0                	test   %al,%al
    14f0:	74 2a                	je     151c <printf+0x16c>
    14f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    14f8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    14fb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    14fe:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    1501:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1508:	00 
    1509:	89 44 24 04          	mov    %eax,0x4(%esp)
    150d:	89 34 24             	mov    %esi,(%esp)
    1510:	e8 5d fd ff ff       	call   1272 <write>
        while(*s != 0){
    1515:	0f b6 07             	movzbl (%edi),%eax
    1518:	84 c0                	test   %al,%al
    151a:	75 dc                	jne    14f8 <printf+0x148>
      state = 0;
    151c:	31 ff                	xor    %edi,%edi
    151e:	e9 d8 fe ff ff       	jmp    13fb <printf+0x4b>
    1523:	90                   	nop
    1524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1528:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    152b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    152d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1534:	00 
    1535:	89 44 24 04          	mov    %eax,0x4(%esp)
    1539:	89 34 24             	mov    %esi,(%esp)
    153c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1540:	e8 2d fd ff ff       	call   1272 <write>
    1545:	e9 b1 fe ff ff       	jmp    13fb <printf+0x4b>
    154a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1550:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1553:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    1558:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    155b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1562:	8b 10                	mov    (%eax),%edx
    1564:	89 f0                	mov    %esi,%eax
    1566:	e8 a5 fd ff ff       	call   1310 <printint>
        ap++;
    156b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    156f:	e9 87 fe ff ff       	jmp    13fb <printf+0x4b>
        putc(fd, *ap);
    1574:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    1577:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    1579:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    157b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1582:	00 
    1583:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    1586:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    1589:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    158c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1590:	e8 dd fc ff ff       	call   1272 <write>
        ap++;
    1595:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1599:	e9 5d fe ff ff       	jmp    13fb <printf+0x4b>
    159e:	66 90                	xchg   %ax,%ax

000015a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15a1:	a1 10 1a 00 00       	mov    0x1a10,%eax
{
    15a6:	89 e5                	mov    %esp,%ebp
    15a8:	57                   	push   %edi
    15a9:	56                   	push   %esi
    15aa:	53                   	push   %ebx
    15ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15ae:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    15b0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15b3:	39 d0                	cmp    %edx,%eax
    15b5:	72 11                	jb     15c8 <free+0x28>
    15b7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15b8:	39 c8                	cmp    %ecx,%eax
    15ba:	72 04                	jb     15c0 <free+0x20>
    15bc:	39 ca                	cmp    %ecx,%edx
    15be:	72 10                	jb     15d0 <free+0x30>
    15c0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15c2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15c4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15c6:	73 f0                	jae    15b8 <free+0x18>
    15c8:	39 ca                	cmp    %ecx,%edx
    15ca:	72 04                	jb     15d0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15cc:	39 c8                	cmp    %ecx,%eax
    15ce:	72 f0                	jb     15c0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15d3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    15d6:	39 cf                	cmp    %ecx,%edi
    15d8:	74 1e                	je     15f8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15da:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    15dd:	8b 48 04             	mov    0x4(%eax),%ecx
    15e0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    15e3:	39 f2                	cmp    %esi,%edx
    15e5:	74 28                	je     160f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15e7:	89 10                	mov    %edx,(%eax)
  freep = p;
    15e9:	a3 10 1a 00 00       	mov    %eax,0x1a10
}
    15ee:	5b                   	pop    %ebx
    15ef:	5e                   	pop    %esi
    15f0:	5f                   	pop    %edi
    15f1:	5d                   	pop    %ebp
    15f2:	c3                   	ret    
    15f3:	90                   	nop
    15f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    15f8:	03 71 04             	add    0x4(%ecx),%esi
    15fb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    15fe:	8b 08                	mov    (%eax),%ecx
    1600:	8b 09                	mov    (%ecx),%ecx
    1602:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1605:	8b 48 04             	mov    0x4(%eax),%ecx
    1608:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    160b:	39 f2                	cmp    %esi,%edx
    160d:	75 d8                	jne    15e7 <free+0x47>
    p->s.size += bp->s.size;
    160f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    1612:	a3 10 1a 00 00       	mov    %eax,0x1a10
    p->s.size += bp->s.size;
    1617:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    161a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    161d:	89 10                	mov    %edx,(%eax)
}
    161f:	5b                   	pop    %ebx
    1620:	5e                   	pop    %esi
    1621:	5f                   	pop    %edi
    1622:	5d                   	pop    %ebp
    1623:	c3                   	ret    
    1624:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    162a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001630 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1630:	55                   	push   %ebp
    1631:	89 e5                	mov    %esp,%ebp
    1633:	57                   	push   %edi
    1634:	56                   	push   %esi
    1635:	53                   	push   %ebx
    1636:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1639:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    163c:	8b 1d 10 1a 00 00    	mov    0x1a10,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1642:	8d 48 07             	lea    0x7(%eax),%ecx
    1645:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1648:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    164a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    164d:	0f 84 9b 00 00 00    	je     16ee <malloc+0xbe>
    1653:	8b 13                	mov    (%ebx),%edx
    1655:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1658:	39 fe                	cmp    %edi,%esi
    165a:	76 64                	jbe    16c0 <malloc+0x90>
    165c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    1663:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1668:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    166b:	eb 0e                	jmp    167b <malloc+0x4b>
    166d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1670:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1672:	8b 78 04             	mov    0x4(%eax),%edi
    1675:	39 fe                	cmp    %edi,%esi
    1677:	76 4f                	jbe    16c8 <malloc+0x98>
    1679:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    167b:	3b 15 10 1a 00 00    	cmp    0x1a10,%edx
    1681:	75 ed                	jne    1670 <malloc+0x40>
  if(nu < 4096)
    1683:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1686:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    168c:	bf 00 10 00 00       	mov    $0x1000,%edi
    1691:	0f 43 fe             	cmovae %esi,%edi
    1694:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    1697:	89 04 24             	mov    %eax,(%esp)
    169a:	e8 3b fc ff ff       	call   12da <sbrk>
  if(p == (char*)-1)
    169f:	83 f8 ff             	cmp    $0xffffffff,%eax
    16a2:	74 18                	je     16bc <malloc+0x8c>
  hp->s.size = nu;
    16a4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    16a7:	83 c0 08             	add    $0x8,%eax
    16aa:	89 04 24             	mov    %eax,(%esp)
    16ad:	e8 ee fe ff ff       	call   15a0 <free>
  return freep;
    16b2:	8b 15 10 1a 00 00    	mov    0x1a10,%edx
      if((p = morecore(nunits)) == 0)
    16b8:	85 d2                	test   %edx,%edx
    16ba:	75 b4                	jne    1670 <malloc+0x40>
        return 0;
    16bc:	31 c0                	xor    %eax,%eax
    16be:	eb 20                	jmp    16e0 <malloc+0xb0>
    if(p->s.size >= nunits){
    16c0:	89 d0                	mov    %edx,%eax
    16c2:	89 da                	mov    %ebx,%edx
    16c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    16c8:	39 fe                	cmp    %edi,%esi
    16ca:	74 1c                	je     16e8 <malloc+0xb8>
        p->s.size -= nunits;
    16cc:	29 f7                	sub    %esi,%edi
    16ce:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    16d1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    16d4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    16d7:	89 15 10 1a 00 00    	mov    %edx,0x1a10
      return (void*)(p + 1);
    16dd:	83 c0 08             	add    $0x8,%eax
  }
}
    16e0:	83 c4 1c             	add    $0x1c,%esp
    16e3:	5b                   	pop    %ebx
    16e4:	5e                   	pop    %esi
    16e5:	5f                   	pop    %edi
    16e6:	5d                   	pop    %ebp
    16e7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    16e8:	8b 08                	mov    (%eax),%ecx
    16ea:	89 0a                	mov    %ecx,(%edx)
    16ec:	eb e9                	jmp    16d7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    16ee:	c7 05 10 1a 00 00 14 	movl   $0x1a14,0x1a10
    16f5:	1a 00 00 
    base.s.size = 0;
    16f8:	ba 14 1a 00 00       	mov    $0x1a14,%edx
    base.s.ptr = freep = prevp = &base;
    16fd:	c7 05 14 1a 00 00 14 	movl   $0x1a14,0x1a14
    1704:	1a 00 00 
    base.s.size = 0;
    1707:	c7 05 18 1a 00 00 00 	movl   $0x0,0x1a18
    170e:	00 00 00 
    1711:	e9 46 ff ff ff       	jmp    165c <malloc+0x2c>
    1716:	66 90                	xchg   %ax,%ax
    1718:	66 90                	xchg   %ax,%ax
    171a:	66 90                	xchg   %ax,%ax
    171c:	66 90                	xchg   %ax,%ax
    171e:	66 90                	xchg   %ax,%ax

00001720 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1720:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1721:	b9 01 00 00 00       	mov    $0x1,%ecx
    1726:	89 e5                	mov    %esp,%ebp
    1728:	8b 55 08             	mov    0x8(%ebp),%edx
    172b:	90                   	nop
    172c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1730:	89 c8                	mov    %ecx,%eax
    1732:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1735:	85 c0                	test   %eax,%eax
    1737:	75 f7                	jne    1730 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1739:	0f ae f0             	mfence 
}
    173c:	5d                   	pop    %ebp
    173d:	c3                   	ret    
    173e:	66 90                	xchg   %ax,%ax

00001740 <urelease>:

void urelease (struct uspinlock *lk) {
    1740:	55                   	push   %ebp
    1741:	89 e5                	mov    %esp,%ebp
    1743:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1746:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1749:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    174f:	5d                   	pop    %ebp
    1750:	c3                   	ret    
