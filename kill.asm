
_kill:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	57                   	push   %edi
    1004:	56                   	push   %esi
    1005:	53                   	push   %ebx
  int i;

  if(argc < 2){
    1006:	bb 01 00 00 00       	mov    $0x1,%ebx
{
    100b:	83 e4 f0             	and    $0xfffffff0,%esp
    100e:	83 ec 10             	sub    $0x10,%esp
    1011:	8b 75 08             	mov    0x8(%ebp),%esi
    1014:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(argc < 2){
    1017:	83 fe 01             	cmp    $0x1,%esi
    101a:	7e 23                	jle    103f <main+0x3f>
    101c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
    1020:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
  for(i=1; i<argc; i++)
    1023:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
    1026:	89 04 24             	mov    %eax,(%esp)
    1029:	e8 f2 01 00 00       	call   1220 <atoi>
    102e:	89 04 24             	mov    %eax,(%esp)
    1031:	e8 7c 02 00 00       	call   12b2 <kill>
  for(i=1; i<argc; i++)
    1036:	39 f3                	cmp    %esi,%ebx
    1038:	75 e6                	jne    1020 <main+0x20>
  exit();
    103a:	e8 43 02 00 00       	call   1282 <exit>
    printf(2, "usage: kill pid...\n");
    103f:	c7 44 24 04 81 17 00 	movl   $0x1781,0x4(%esp)
    1046:	00 
    1047:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    104e:	e8 8d 03 00 00       	call   13e0 <printf>
    exit();
    1053:	e8 2a 02 00 00       	call   1282 <exit>
    1058:	66 90                	xchg   %ax,%ax
    105a:	66 90                	xchg   %ax,%ax
    105c:	66 90                	xchg   %ax,%ax
    105e:	66 90                	xchg   %ax,%ax

00001060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	8b 45 08             	mov    0x8(%ebp),%eax
    1066:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1069:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    106a:	89 c2                	mov    %eax,%edx
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1070:	83 c1 01             	add    $0x1,%ecx
    1073:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1077:	83 c2 01             	add    $0x1,%edx
    107a:	84 db                	test   %bl,%bl
    107c:	88 5a ff             	mov    %bl,-0x1(%edx)
    107f:	75 ef                	jne    1070 <strcpy+0x10>
    ;
  return os;
}
    1081:	5b                   	pop    %ebx
    1082:	5d                   	pop    %ebp
    1083:	c3                   	ret    
    1084:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    108a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	8b 55 08             	mov    0x8(%ebp),%edx
    1096:	53                   	push   %ebx
    1097:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    109a:	0f b6 02             	movzbl (%edx),%eax
    109d:	84 c0                	test   %al,%al
    109f:	74 2d                	je     10ce <strcmp+0x3e>
    10a1:	0f b6 19             	movzbl (%ecx),%ebx
    10a4:	38 d8                	cmp    %bl,%al
    10a6:	74 0e                	je     10b6 <strcmp+0x26>
    10a8:	eb 2b                	jmp    10d5 <strcmp+0x45>
    10aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10b0:	38 c8                	cmp    %cl,%al
    10b2:	75 15                	jne    10c9 <strcmp+0x39>
    p++, q++;
    10b4:	89 d9                	mov    %ebx,%ecx
    10b6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10b9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10bc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10bf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    10c3:	84 c0                	test   %al,%al
    10c5:	75 e9                	jne    10b0 <strcmp+0x20>
    10c7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10c9:	29 c8                	sub    %ecx,%eax
}
    10cb:	5b                   	pop    %ebx
    10cc:	5d                   	pop    %ebp
    10cd:	c3                   	ret    
    10ce:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    10d1:	31 c0                	xor    %eax,%eax
    10d3:	eb f4                	jmp    10c9 <strcmp+0x39>
    10d5:	0f b6 cb             	movzbl %bl,%ecx
    10d8:	eb ef                	jmp    10c9 <strcmp+0x39>
    10da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000010e0 <strlen>:

uint
strlen(char *s)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10e6:	80 39 00             	cmpb   $0x0,(%ecx)
    10e9:	74 12                	je     10fd <strlen+0x1d>
    10eb:	31 d2                	xor    %edx,%edx
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
    10f0:	83 c2 01             	add    $0x1,%edx
    10f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10f7:	89 d0                	mov    %edx,%eax
    10f9:	75 f5                	jne    10f0 <strlen+0x10>
    ;
  return n;
}
    10fb:	5d                   	pop    %ebp
    10fc:	c3                   	ret    
  for(n = 0; s[n]; n++)
    10fd:	31 c0                	xor    %eax,%eax
}
    10ff:	5d                   	pop    %ebp
    1100:	c3                   	ret    
    1101:	eb 0d                	jmp    1110 <memset>
    1103:	90                   	nop
    1104:	90                   	nop
    1105:	90                   	nop
    1106:	90                   	nop
    1107:	90                   	nop
    1108:	90                   	nop
    1109:	90                   	nop
    110a:	90                   	nop
    110b:	90                   	nop
    110c:	90                   	nop
    110d:	90                   	nop
    110e:	90                   	nop
    110f:	90                   	nop

00001110 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	8b 55 08             	mov    0x8(%ebp),%edx
    1116:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1117:	8b 4d 10             	mov    0x10(%ebp),%ecx
    111a:	8b 45 0c             	mov    0xc(%ebp),%eax
    111d:	89 d7                	mov    %edx,%edi
    111f:	fc                   	cld    
    1120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1122:	89 d0                	mov    %edx,%eax
    1124:	5f                   	pop    %edi
    1125:	5d                   	pop    %ebp
    1126:	c3                   	ret    
    1127:	89 f6                	mov    %esi,%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <strchr>:

char*
strchr(const char *s, char c)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	8b 45 08             	mov    0x8(%ebp),%eax
    1136:	53                   	push   %ebx
    1137:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    113a:	0f b6 18             	movzbl (%eax),%ebx
    113d:	84 db                	test   %bl,%bl
    113f:	74 1d                	je     115e <strchr+0x2e>
    if(*s == c)
    1141:	38 d3                	cmp    %dl,%bl
    1143:	89 d1                	mov    %edx,%ecx
    1145:	75 0d                	jne    1154 <strchr+0x24>
    1147:	eb 17                	jmp    1160 <strchr+0x30>
    1149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1150:	38 ca                	cmp    %cl,%dl
    1152:	74 0c                	je     1160 <strchr+0x30>
  for(; *s; s++)
    1154:	83 c0 01             	add    $0x1,%eax
    1157:	0f b6 10             	movzbl (%eax),%edx
    115a:	84 d2                	test   %dl,%dl
    115c:	75 f2                	jne    1150 <strchr+0x20>
      return (char*)s;
  return 0;
    115e:	31 c0                	xor    %eax,%eax
}
    1160:	5b                   	pop    %ebx
    1161:	5d                   	pop    %ebp
    1162:	c3                   	ret    
    1163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <gets>:

char*
gets(char *buf, int max)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	57                   	push   %edi
    1174:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1175:	31 f6                	xor    %esi,%esi
{
    1177:	53                   	push   %ebx
    1178:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    117b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    117e:	eb 31                	jmp    11b1 <gets+0x41>
    cc = read(0, &c, 1);
    1180:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1187:	00 
    1188:	89 7c 24 04          	mov    %edi,0x4(%esp)
    118c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1193:	e8 02 01 00 00       	call   129a <read>
    if(cc < 1)
    1198:	85 c0                	test   %eax,%eax
    119a:	7e 1d                	jle    11b9 <gets+0x49>
      break;
    buf[i++] = c;
    119c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    11a0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    11a2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    11a5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    11a7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11ab:	74 0c                	je     11b9 <gets+0x49>
    11ad:	3c 0a                	cmp    $0xa,%al
    11af:	74 08                	je     11b9 <gets+0x49>
  for(i=0; i+1 < max; ){
    11b1:	8d 5e 01             	lea    0x1(%esi),%ebx
    11b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11b7:	7c c7                	jl     1180 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11b9:	8b 45 08             	mov    0x8(%ebp),%eax
    11bc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11c0:	83 c4 2c             	add    $0x2c,%esp
    11c3:	5b                   	pop    %ebx
    11c4:	5e                   	pop    %esi
    11c5:	5f                   	pop    %edi
    11c6:	5d                   	pop    %ebp
    11c7:	c3                   	ret    
    11c8:	90                   	nop
    11c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011d0 <stat>:

int
stat(char *n, struct stat *st)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	56                   	push   %esi
    11d4:	53                   	push   %ebx
    11d5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11d8:	8b 45 08             	mov    0x8(%ebp),%eax
    11db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11e2:	00 
    11e3:	89 04 24             	mov    %eax,(%esp)
    11e6:	e8 d7 00 00 00       	call   12c2 <open>
  if(fd < 0)
    11eb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    11ed:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    11ef:	78 27                	js     1218 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    11f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    11f4:	89 1c 24             	mov    %ebx,(%esp)
    11f7:	89 44 24 04          	mov    %eax,0x4(%esp)
    11fb:	e8 da 00 00 00       	call   12da <fstat>
  close(fd);
    1200:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1203:	89 c6                	mov    %eax,%esi
  close(fd);
    1205:	e8 a0 00 00 00       	call   12aa <close>
  return r;
    120a:	89 f0                	mov    %esi,%eax
}
    120c:	83 c4 10             	add    $0x10,%esp
    120f:	5b                   	pop    %ebx
    1210:	5e                   	pop    %esi
    1211:	5d                   	pop    %ebp
    1212:	c3                   	ret    
    1213:	90                   	nop
    1214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1218:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    121d:	eb ed                	jmp    120c <stat+0x3c>
    121f:	90                   	nop

00001220 <atoi>:

int
atoi(const char *s)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1226:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1227:	0f be 11             	movsbl (%ecx),%edx
    122a:	8d 42 d0             	lea    -0x30(%edx),%eax
    122d:	3c 09                	cmp    $0x9,%al
  n = 0;
    122f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1234:	77 17                	ja     124d <atoi+0x2d>
    1236:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1238:	83 c1 01             	add    $0x1,%ecx
    123b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    123e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1242:	0f be 11             	movsbl (%ecx),%edx
    1245:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1248:	80 fb 09             	cmp    $0x9,%bl
    124b:	76 eb                	jbe    1238 <atoi+0x18>
  return n;
}
    124d:	5b                   	pop    %ebx
    124e:	5d                   	pop    %ebp
    124f:	c3                   	ret    

00001250 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1250:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1251:	31 d2                	xor    %edx,%edx
{
    1253:	89 e5                	mov    %esp,%ebp
    1255:	56                   	push   %esi
    1256:	8b 45 08             	mov    0x8(%ebp),%eax
    1259:	53                   	push   %ebx
    125a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    125d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1260:	85 db                	test   %ebx,%ebx
    1262:	7e 12                	jle    1276 <memmove+0x26>
    1264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1268:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    126c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    126f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1272:	39 da                	cmp    %ebx,%edx
    1274:	75 f2                	jne    1268 <memmove+0x18>
  return vdst;
}
    1276:	5b                   	pop    %ebx
    1277:	5e                   	pop    %esi
    1278:	5d                   	pop    %ebp
    1279:	c3                   	ret    

0000127a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    127a:	b8 01 00 00 00       	mov    $0x1,%eax
    127f:	cd 40                	int    $0x40
    1281:	c3                   	ret    

00001282 <exit>:
SYSCALL(exit)
    1282:	b8 02 00 00 00       	mov    $0x2,%eax
    1287:	cd 40                	int    $0x40
    1289:	c3                   	ret    

0000128a <wait>:
SYSCALL(wait)
    128a:	b8 03 00 00 00       	mov    $0x3,%eax
    128f:	cd 40                	int    $0x40
    1291:	c3                   	ret    

00001292 <pipe>:
SYSCALL(pipe)
    1292:	b8 04 00 00 00       	mov    $0x4,%eax
    1297:	cd 40                	int    $0x40
    1299:	c3                   	ret    

0000129a <read>:
SYSCALL(read)
    129a:	b8 05 00 00 00       	mov    $0x5,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <write>:
SYSCALL(write)
    12a2:	b8 10 00 00 00       	mov    $0x10,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <close>:
SYSCALL(close)
    12aa:	b8 15 00 00 00       	mov    $0x15,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <kill>:
SYSCALL(kill)
    12b2:	b8 06 00 00 00       	mov    $0x6,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <exec>:
SYSCALL(exec)
    12ba:	b8 07 00 00 00       	mov    $0x7,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <open>:
SYSCALL(open)
    12c2:	b8 0f 00 00 00       	mov    $0xf,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <mknod>:
SYSCALL(mknod)
    12ca:	b8 11 00 00 00       	mov    $0x11,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <unlink>:
SYSCALL(unlink)
    12d2:	b8 12 00 00 00       	mov    $0x12,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <fstat>:
SYSCALL(fstat)
    12da:	b8 08 00 00 00       	mov    $0x8,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <link>:
SYSCALL(link)
    12e2:	b8 13 00 00 00       	mov    $0x13,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <mkdir>:
SYSCALL(mkdir)
    12ea:	b8 14 00 00 00       	mov    $0x14,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <chdir>:
SYSCALL(chdir)
    12f2:	b8 09 00 00 00       	mov    $0x9,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <dup>:
SYSCALL(dup)
    12fa:	b8 0a 00 00 00       	mov    $0xa,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <getpid>:
SYSCALL(getpid)
    1302:	b8 0b 00 00 00       	mov    $0xb,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <sbrk>:
SYSCALL(sbrk)
    130a:	b8 0c 00 00 00       	mov    $0xc,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <sleep>:
SYSCALL(sleep)
    1312:	b8 0d 00 00 00       	mov    $0xd,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <uptime>:
SYSCALL(uptime)
    131a:	b8 0e 00 00 00       	mov    $0xe,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <shm_open>:
SYSCALL(shm_open)
    1322:	b8 16 00 00 00       	mov    $0x16,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <shm_close>:
SYSCALL(shm_close)	
    132a:	b8 17 00 00 00       	mov    $0x17,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    
    1332:	66 90                	xchg   %ax,%ax
    1334:	66 90                	xchg   %ax,%ax
    1336:	66 90                	xchg   %ax,%ax
    1338:	66 90                	xchg   %ax,%ax
    133a:	66 90                	xchg   %ax,%ax
    133c:	66 90                	xchg   %ax,%ax
    133e:	66 90                	xchg   %ax,%ax

00001340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	57                   	push   %edi
    1344:	56                   	push   %esi
    1345:	89 c6                	mov    %eax,%esi
    1347:	53                   	push   %ebx
    1348:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    134b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    134e:	85 db                	test   %ebx,%ebx
    1350:	74 09                	je     135b <printint+0x1b>
    1352:	89 d0                	mov    %edx,%eax
    1354:	c1 e8 1f             	shr    $0x1f,%eax
    1357:	84 c0                	test   %al,%al
    1359:	75 75                	jne    13d0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    135b:	89 d0                	mov    %edx,%eax
  neg = 0;
    135d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1364:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1367:	31 ff                	xor    %edi,%edi
    1369:	89 ce                	mov    %ecx,%esi
    136b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    136e:	eb 02                	jmp    1372 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1370:	89 cf                	mov    %ecx,%edi
    1372:	31 d2                	xor    %edx,%edx
    1374:	f7 f6                	div    %esi
    1376:	8d 4f 01             	lea    0x1(%edi),%ecx
    1379:	0f b6 92 9c 17 00 00 	movzbl 0x179c(%edx),%edx
  }while((x /= base) != 0);
    1380:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1382:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1385:	75 e9                	jne    1370 <printint+0x30>
  if(neg)
    1387:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    138a:	89 c8                	mov    %ecx,%eax
    138c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    138f:	85 d2                	test   %edx,%edx
    1391:	74 08                	je     139b <printint+0x5b>
    buf[i++] = '-';
    1393:	8d 4f 02             	lea    0x2(%edi),%ecx
    1396:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    139b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    139e:	66 90                	xchg   %ax,%ax
    13a0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    13a5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    13a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13af:	00 
    13b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    13b4:	89 34 24             	mov    %esi,(%esp)
    13b7:	88 45 d7             	mov    %al,-0x29(%ebp)
    13ba:	e8 e3 fe ff ff       	call   12a2 <write>
  while(--i >= 0)
    13bf:	83 ff ff             	cmp    $0xffffffff,%edi
    13c2:	75 dc                	jne    13a0 <printint+0x60>
    putc(fd, buf[i]);
}
    13c4:	83 c4 4c             	add    $0x4c,%esp
    13c7:	5b                   	pop    %ebx
    13c8:	5e                   	pop    %esi
    13c9:	5f                   	pop    %edi
    13ca:	5d                   	pop    %ebp
    13cb:	c3                   	ret    
    13cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    13d0:	89 d0                	mov    %edx,%eax
    13d2:	f7 d8                	neg    %eax
    neg = 1;
    13d4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    13db:	eb 87                	jmp    1364 <printint+0x24>
    13dd:	8d 76 00             	lea    0x0(%esi),%esi

000013e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    13e4:	31 ff                	xor    %edi,%edi
{
    13e6:	56                   	push   %esi
    13e7:	53                   	push   %ebx
    13e8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    13ee:	8d 45 10             	lea    0x10(%ebp),%eax
{
    13f1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    13f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    13f7:	0f b6 13             	movzbl (%ebx),%edx
    13fa:	83 c3 01             	add    $0x1,%ebx
    13fd:	84 d2                	test   %dl,%dl
    13ff:	75 39                	jne    143a <printf+0x5a>
    1401:	e9 c2 00 00 00       	jmp    14c8 <printf+0xe8>
    1406:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1408:	83 fa 25             	cmp    $0x25,%edx
    140b:	0f 84 bf 00 00 00    	je     14d0 <printf+0xf0>
  write(fd, &c, 1);
    1411:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1414:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    141b:	00 
    141c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1420:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    1423:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    1426:	e8 77 fe ff ff       	call   12a2 <write>
    142b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    142e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1432:	84 d2                	test   %dl,%dl
    1434:	0f 84 8e 00 00 00    	je     14c8 <printf+0xe8>
    if(state == 0){
    143a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    143c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    143f:	74 c7                	je     1408 <printf+0x28>
      }
    } else if(state == '%'){
    1441:	83 ff 25             	cmp    $0x25,%edi
    1444:	75 e5                	jne    142b <printf+0x4b>
      if(c == 'd'){
    1446:	83 fa 64             	cmp    $0x64,%edx
    1449:	0f 84 31 01 00 00    	je     1580 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    144f:	25 f7 00 00 00       	and    $0xf7,%eax
    1454:	83 f8 70             	cmp    $0x70,%eax
    1457:	0f 84 83 00 00 00    	je     14e0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    145d:	83 fa 73             	cmp    $0x73,%edx
    1460:	0f 84 a2 00 00 00    	je     1508 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1466:	83 fa 63             	cmp    $0x63,%edx
    1469:	0f 84 35 01 00 00    	je     15a4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    146f:	83 fa 25             	cmp    $0x25,%edx
    1472:	0f 84 e0 00 00 00    	je     1558 <printf+0x178>
  write(fd, &c, 1);
    1478:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    147b:	83 c3 01             	add    $0x1,%ebx
    147e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1485:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1486:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1488:	89 44 24 04          	mov    %eax,0x4(%esp)
    148c:	89 34 24             	mov    %esi,(%esp)
    148f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1492:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1496:	e8 07 fe ff ff       	call   12a2 <write>
        putc(fd, c);
    149b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    149e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14a8:	00 
    14a9:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ad:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    14b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    14b3:	e8 ea fd ff ff       	call   12a2 <write>
  for(i = 0; fmt[i]; i++){
    14b8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    14bc:	84 d2                	test   %dl,%dl
    14be:	0f 85 76 ff ff ff    	jne    143a <printf+0x5a>
    14c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    14c8:	83 c4 3c             	add    $0x3c,%esp
    14cb:	5b                   	pop    %ebx
    14cc:	5e                   	pop    %esi
    14cd:	5f                   	pop    %edi
    14ce:	5d                   	pop    %ebp
    14cf:	c3                   	ret    
        state = '%';
    14d0:	bf 25 00 00 00       	mov    $0x25,%edi
    14d5:	e9 51 ff ff ff       	jmp    142b <printf+0x4b>
    14da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    14e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    14e3:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    14e8:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    14ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    14f1:	8b 10                	mov    (%eax),%edx
    14f3:	89 f0                	mov    %esi,%eax
    14f5:	e8 46 fe ff ff       	call   1340 <printint>
        ap++;
    14fa:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    14fe:	e9 28 ff ff ff       	jmp    142b <printf+0x4b>
    1503:	90                   	nop
    1504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1508:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    150b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    150f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    1511:	b8 95 17 00 00       	mov    $0x1795,%eax
    1516:	85 ff                	test   %edi,%edi
    1518:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    151b:	0f b6 07             	movzbl (%edi),%eax
    151e:	84 c0                	test   %al,%al
    1520:	74 2a                	je     154c <printf+0x16c>
    1522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1528:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    152b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    152e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    1531:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1538:	00 
    1539:	89 44 24 04          	mov    %eax,0x4(%esp)
    153d:	89 34 24             	mov    %esi,(%esp)
    1540:	e8 5d fd ff ff       	call   12a2 <write>
        while(*s != 0){
    1545:	0f b6 07             	movzbl (%edi),%eax
    1548:	84 c0                	test   %al,%al
    154a:	75 dc                	jne    1528 <printf+0x148>
      state = 0;
    154c:	31 ff                	xor    %edi,%edi
    154e:	e9 d8 fe ff ff       	jmp    142b <printf+0x4b>
    1553:	90                   	nop
    1554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1558:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    155b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    155d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1564:	00 
    1565:	89 44 24 04          	mov    %eax,0x4(%esp)
    1569:	89 34 24             	mov    %esi,(%esp)
    156c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1570:	e8 2d fd ff ff       	call   12a2 <write>
    1575:	e9 b1 fe ff ff       	jmp    142b <printf+0x4b>
    157a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1580:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1583:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    1588:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    158b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1592:	8b 10                	mov    (%eax),%edx
    1594:	89 f0                	mov    %esi,%eax
    1596:	e8 a5 fd ff ff       	call   1340 <printint>
        ap++;
    159b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    159f:	e9 87 fe ff ff       	jmp    142b <printf+0x4b>
        putc(fd, *ap);
    15a4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    15a7:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    15a9:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    15ab:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15b2:	00 
    15b3:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    15b6:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    15b9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    15bc:	89 44 24 04          	mov    %eax,0x4(%esp)
    15c0:	e8 dd fc ff ff       	call   12a2 <write>
        ap++;
    15c5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15c9:	e9 5d fe ff ff       	jmp    142b <printf+0x4b>
    15ce:	66 90                	xchg   %ax,%ax

000015d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15d1:	a1 58 1a 00 00       	mov    0x1a58,%eax
{
    15d6:	89 e5                	mov    %esp,%ebp
    15d8:	57                   	push   %edi
    15d9:	56                   	push   %esi
    15da:	53                   	push   %ebx
    15db:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15de:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    15e0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15e3:	39 d0                	cmp    %edx,%eax
    15e5:	72 11                	jb     15f8 <free+0x28>
    15e7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15e8:	39 c8                	cmp    %ecx,%eax
    15ea:	72 04                	jb     15f0 <free+0x20>
    15ec:	39 ca                	cmp    %ecx,%edx
    15ee:	72 10                	jb     1600 <free+0x30>
    15f0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15f2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15f4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15f6:	73 f0                	jae    15e8 <free+0x18>
    15f8:	39 ca                	cmp    %ecx,%edx
    15fa:	72 04                	jb     1600 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15fc:	39 c8                	cmp    %ecx,%eax
    15fe:	72 f0                	jb     15f0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1600:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1603:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1606:	39 cf                	cmp    %ecx,%edi
    1608:	74 1e                	je     1628 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    160a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    160d:	8b 48 04             	mov    0x4(%eax),%ecx
    1610:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1613:	39 f2                	cmp    %esi,%edx
    1615:	74 28                	je     163f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1617:	89 10                	mov    %edx,(%eax)
  freep = p;
    1619:	a3 58 1a 00 00       	mov    %eax,0x1a58
}
    161e:	5b                   	pop    %ebx
    161f:	5e                   	pop    %esi
    1620:	5f                   	pop    %edi
    1621:	5d                   	pop    %ebp
    1622:	c3                   	ret    
    1623:	90                   	nop
    1624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1628:	03 71 04             	add    0x4(%ecx),%esi
    162b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    162e:	8b 08                	mov    (%eax),%ecx
    1630:	8b 09                	mov    (%ecx),%ecx
    1632:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1635:	8b 48 04             	mov    0x4(%eax),%ecx
    1638:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    163b:	39 f2                	cmp    %esi,%edx
    163d:	75 d8                	jne    1617 <free+0x47>
    p->s.size += bp->s.size;
    163f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    1642:	a3 58 1a 00 00       	mov    %eax,0x1a58
    p->s.size += bp->s.size;
    1647:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    164a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    164d:	89 10                	mov    %edx,(%eax)
}
    164f:	5b                   	pop    %ebx
    1650:	5e                   	pop    %esi
    1651:	5f                   	pop    %edi
    1652:	5d                   	pop    %ebp
    1653:	c3                   	ret    
    1654:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    165a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	57                   	push   %edi
    1664:	56                   	push   %esi
    1665:	53                   	push   %ebx
    1666:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1669:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    166c:	8b 1d 58 1a 00 00    	mov    0x1a58,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1672:	8d 48 07             	lea    0x7(%eax),%ecx
    1675:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1678:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    167a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    167d:	0f 84 9b 00 00 00    	je     171e <malloc+0xbe>
    1683:	8b 13                	mov    (%ebx),%edx
    1685:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1688:	39 fe                	cmp    %edi,%esi
    168a:	76 64                	jbe    16f0 <malloc+0x90>
    168c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    1693:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1698:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    169b:	eb 0e                	jmp    16ab <malloc+0x4b>
    169d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16a0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16a2:	8b 78 04             	mov    0x4(%eax),%edi
    16a5:	39 fe                	cmp    %edi,%esi
    16a7:	76 4f                	jbe    16f8 <malloc+0x98>
    16a9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16ab:	3b 15 58 1a 00 00    	cmp    0x1a58,%edx
    16b1:	75 ed                	jne    16a0 <malloc+0x40>
  if(nu < 4096)
    16b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16b6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    16bc:	bf 00 10 00 00       	mov    $0x1000,%edi
    16c1:	0f 43 fe             	cmovae %esi,%edi
    16c4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    16c7:	89 04 24             	mov    %eax,(%esp)
    16ca:	e8 3b fc ff ff       	call   130a <sbrk>
  if(p == (char*)-1)
    16cf:	83 f8 ff             	cmp    $0xffffffff,%eax
    16d2:	74 18                	je     16ec <malloc+0x8c>
  hp->s.size = nu;
    16d4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    16d7:	83 c0 08             	add    $0x8,%eax
    16da:	89 04 24             	mov    %eax,(%esp)
    16dd:	e8 ee fe ff ff       	call   15d0 <free>
  return freep;
    16e2:	8b 15 58 1a 00 00    	mov    0x1a58,%edx
      if((p = morecore(nunits)) == 0)
    16e8:	85 d2                	test   %edx,%edx
    16ea:	75 b4                	jne    16a0 <malloc+0x40>
        return 0;
    16ec:	31 c0                	xor    %eax,%eax
    16ee:	eb 20                	jmp    1710 <malloc+0xb0>
    if(p->s.size >= nunits){
    16f0:	89 d0                	mov    %edx,%eax
    16f2:	89 da                	mov    %ebx,%edx
    16f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    16f8:	39 fe                	cmp    %edi,%esi
    16fa:	74 1c                	je     1718 <malloc+0xb8>
        p->s.size -= nunits;
    16fc:	29 f7                	sub    %esi,%edi
    16fe:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1701:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1704:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1707:	89 15 58 1a 00 00    	mov    %edx,0x1a58
      return (void*)(p + 1);
    170d:	83 c0 08             	add    $0x8,%eax
  }
}
    1710:	83 c4 1c             	add    $0x1c,%esp
    1713:	5b                   	pop    %ebx
    1714:	5e                   	pop    %esi
    1715:	5f                   	pop    %edi
    1716:	5d                   	pop    %ebp
    1717:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1718:	8b 08                	mov    (%eax),%ecx
    171a:	89 0a                	mov    %ecx,(%edx)
    171c:	eb e9                	jmp    1707 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    171e:	c7 05 58 1a 00 00 5c 	movl   $0x1a5c,0x1a58
    1725:	1a 00 00 
    base.s.size = 0;
    1728:	ba 5c 1a 00 00       	mov    $0x1a5c,%edx
    base.s.ptr = freep = prevp = &base;
    172d:	c7 05 5c 1a 00 00 5c 	movl   $0x1a5c,0x1a5c
    1734:	1a 00 00 
    base.s.size = 0;
    1737:	c7 05 60 1a 00 00 00 	movl   $0x0,0x1a60
    173e:	00 00 00 
    1741:	e9 46 ff ff ff       	jmp    168c <malloc+0x2c>
    1746:	66 90                	xchg   %ax,%ax
    1748:	66 90                	xchg   %ax,%ax
    174a:	66 90                	xchg   %ax,%ax
    174c:	66 90                	xchg   %ax,%ax
    174e:	66 90                	xchg   %ax,%ax

00001750 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1750:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1751:	b9 01 00 00 00       	mov    $0x1,%ecx
    1756:	89 e5                	mov    %esp,%ebp
    1758:	8b 55 08             	mov    0x8(%ebp),%edx
    175b:	90                   	nop
    175c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1760:	89 c8                	mov    %ecx,%eax
    1762:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1765:	85 c0                	test   %eax,%eax
    1767:	75 f7                	jne    1760 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1769:	0f ae f0             	mfence 
}
    176c:	5d                   	pop    %ebp
    176d:	c3                   	ret    
    176e:	66 90                	xchg   %ax,%ax

00001770 <urelease>:

void urelease (struct uspinlock *lk) {
    1770:	55                   	push   %ebp
    1771:	89 e5                	mov    %esp,%ebp
    1773:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1776:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1779:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    177f:	5d                   	pop    %ebp
    1780:	c3                   	ret    
