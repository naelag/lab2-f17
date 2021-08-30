
_init:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	53                   	push   %ebx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	83 ec 10             	sub    $0x10,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    100a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1011:	00 
    1012:	c7 04 24 31 18 00 00 	movl   $0x1831,(%esp)
    1019:	e8 54 03 00 00       	call   1372 <open>
    101e:	85 c0                	test   %eax,%eax
    1020:	0f 88 ac 00 00 00    	js     10d2 <main+0xd2>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
    1026:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    102d:	e8 78 03 00 00       	call   13aa <dup>
  dup(0);  // stderr
    1032:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1039:	e8 6c 03 00 00       	call   13aa <dup>
    103e:	66 90                	xchg   %ax,%ax

  for(;;){
    printf(1, "init: starting sh\n");
    1040:	c7 44 24 04 39 18 00 	movl   $0x1839,0x4(%esp)
    1047:	00 
    1048:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    104f:	e8 3c 04 00 00       	call   1490 <printf>
    pid = fork();
    1054:	e8 d1 02 00 00       	call   132a <fork>
    if(pid < 0){
    1059:	85 c0                	test   %eax,%eax
    pid = fork();
    105b:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    105d:	78 2d                	js     108c <main+0x8c>
    105f:	90                   	nop
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
    1060:	74 43                	je     10a5 <main+0xa5>
    1062:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    1068:	e8 cd 02 00 00       	call   133a <wait>
    106d:	85 c0                	test   %eax,%eax
    106f:	90                   	nop
    1070:	78 ce                	js     1040 <main+0x40>
    1072:	39 d8                	cmp    %ebx,%eax
    1074:	74 ca                	je     1040 <main+0x40>
      printf(1, "zombie!\n");
    1076:	c7 44 24 04 78 18 00 	movl   $0x1878,0x4(%esp)
    107d:	00 
    107e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1085:	e8 06 04 00 00       	call   1490 <printf>
    108a:	eb dc                	jmp    1068 <main+0x68>
      printf(1, "init: fork failed\n");
    108c:	c7 44 24 04 4c 18 00 	movl   $0x184c,0x4(%esp)
    1093:	00 
    1094:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    109b:	e8 f0 03 00 00       	call   1490 <printf>
      exit();
    10a0:	e8 8d 02 00 00       	call   1332 <exit>
      exec("sh", argv);
    10a5:	c7 44 24 04 40 1b 00 	movl   $0x1b40,0x4(%esp)
    10ac:	00 
    10ad:	c7 04 24 5f 18 00 00 	movl   $0x185f,(%esp)
    10b4:	e8 b1 02 00 00       	call   136a <exec>
      printf(1, "init: exec sh failed\n");
    10b9:	c7 44 24 04 62 18 00 	movl   $0x1862,0x4(%esp)
    10c0:	00 
    10c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10c8:	e8 c3 03 00 00       	call   1490 <printf>
      exit();
    10cd:	e8 60 02 00 00       	call   1332 <exit>
    mknod("console", 1, 1);
    10d2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    10d9:	00 
    10da:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    10e1:	00 
    10e2:	c7 04 24 31 18 00 00 	movl   $0x1831,(%esp)
    10e9:	e8 8c 02 00 00       	call   137a <mknod>
    open("console", O_RDWR);
    10ee:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    10f5:	00 
    10f6:	c7 04 24 31 18 00 00 	movl   $0x1831,(%esp)
    10fd:	e8 70 02 00 00       	call   1372 <open>
    1102:	e9 1f ff ff ff       	jmp    1026 <main+0x26>
    1107:	66 90                	xchg   %ax,%ax
    1109:	66 90                	xchg   %ax,%ax
    110b:	66 90                	xchg   %ax,%ax
    110d:	66 90                	xchg   %ax,%ax
    110f:	90                   	nop

00001110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	8b 45 08             	mov    0x8(%ebp),%eax
    1116:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1119:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    111a:	89 c2                	mov    %eax,%edx
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1120:	83 c1 01             	add    $0x1,%ecx
    1123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1127:	83 c2 01             	add    $0x1,%edx
    112a:	84 db                	test   %bl,%bl
    112c:	88 5a ff             	mov    %bl,-0x1(%edx)
    112f:	75 ef                	jne    1120 <strcpy+0x10>
    ;
  return os;
}
    1131:	5b                   	pop    %ebx
    1132:	5d                   	pop    %ebp
    1133:	c3                   	ret    
    1134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    113a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	8b 55 08             	mov    0x8(%ebp),%edx
    1146:	53                   	push   %ebx
    1147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    114a:	0f b6 02             	movzbl (%edx),%eax
    114d:	84 c0                	test   %al,%al
    114f:	74 2d                	je     117e <strcmp+0x3e>
    1151:	0f b6 19             	movzbl (%ecx),%ebx
    1154:	38 d8                	cmp    %bl,%al
    1156:	74 0e                	je     1166 <strcmp+0x26>
    1158:	eb 2b                	jmp    1185 <strcmp+0x45>
    115a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1160:	38 c8                	cmp    %cl,%al
    1162:	75 15                	jne    1179 <strcmp+0x39>
    p++, q++;
    1164:	89 d9                	mov    %ebx,%ecx
    1166:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1169:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    116c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    116f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    1173:	84 c0                	test   %al,%al
    1175:	75 e9                	jne    1160 <strcmp+0x20>
    1177:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1179:	29 c8                	sub    %ecx,%eax
}
    117b:	5b                   	pop    %ebx
    117c:	5d                   	pop    %ebp
    117d:	c3                   	ret    
    117e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    1181:	31 c0                	xor    %eax,%eax
    1183:	eb f4                	jmp    1179 <strcmp+0x39>
    1185:	0f b6 cb             	movzbl %bl,%ecx
    1188:	eb ef                	jmp    1179 <strcmp+0x39>
    118a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001190 <strlen>:

uint
strlen(char *s)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1196:	80 39 00             	cmpb   $0x0,(%ecx)
    1199:	74 12                	je     11ad <strlen+0x1d>
    119b:	31 d2                	xor    %edx,%edx
    119d:	8d 76 00             	lea    0x0(%esi),%esi
    11a0:	83 c2 01             	add    $0x1,%edx
    11a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11a7:	89 d0                	mov    %edx,%eax
    11a9:	75 f5                	jne    11a0 <strlen+0x10>
    ;
  return n;
}
    11ab:	5d                   	pop    %ebp
    11ac:	c3                   	ret    
  for(n = 0; s[n]; n++)
    11ad:	31 c0                	xor    %eax,%eax
}
    11af:	5d                   	pop    %ebp
    11b0:	c3                   	ret    
    11b1:	eb 0d                	jmp    11c0 <memset>
    11b3:	90                   	nop
    11b4:	90                   	nop
    11b5:	90                   	nop
    11b6:	90                   	nop
    11b7:	90                   	nop
    11b8:	90                   	nop
    11b9:	90                   	nop
    11ba:	90                   	nop
    11bb:	90                   	nop
    11bc:	90                   	nop
    11bd:	90                   	nop
    11be:	90                   	nop
    11bf:	90                   	nop

000011c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	8b 55 08             	mov    0x8(%ebp),%edx
    11c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    11cd:	89 d7                	mov    %edx,%edi
    11cf:	fc                   	cld    
    11d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11d2:	89 d0                	mov    %edx,%eax
    11d4:	5f                   	pop    %edi
    11d5:	5d                   	pop    %ebp
    11d6:	c3                   	ret    
    11d7:	89 f6                	mov    %esi,%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <strchr>:

char*
strchr(const char *s, char c)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	8b 45 08             	mov    0x8(%ebp),%eax
    11e6:	53                   	push   %ebx
    11e7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    11ea:	0f b6 18             	movzbl (%eax),%ebx
    11ed:	84 db                	test   %bl,%bl
    11ef:	74 1d                	je     120e <strchr+0x2e>
    if(*s == c)
    11f1:	38 d3                	cmp    %dl,%bl
    11f3:	89 d1                	mov    %edx,%ecx
    11f5:	75 0d                	jne    1204 <strchr+0x24>
    11f7:	eb 17                	jmp    1210 <strchr+0x30>
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1200:	38 ca                	cmp    %cl,%dl
    1202:	74 0c                	je     1210 <strchr+0x30>
  for(; *s; s++)
    1204:	83 c0 01             	add    $0x1,%eax
    1207:	0f b6 10             	movzbl (%eax),%edx
    120a:	84 d2                	test   %dl,%dl
    120c:	75 f2                	jne    1200 <strchr+0x20>
      return (char*)s;
  return 0;
    120e:	31 c0                	xor    %eax,%eax
}
    1210:	5b                   	pop    %ebx
    1211:	5d                   	pop    %ebp
    1212:	c3                   	ret    
    1213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001220 <gets>:

char*
gets(char *buf, int max)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	57                   	push   %edi
    1224:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1225:	31 f6                	xor    %esi,%esi
{
    1227:	53                   	push   %ebx
    1228:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    122b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    122e:	eb 31                	jmp    1261 <gets+0x41>
    cc = read(0, &c, 1);
    1230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1237:	00 
    1238:	89 7c 24 04          	mov    %edi,0x4(%esp)
    123c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1243:	e8 02 01 00 00       	call   134a <read>
    if(cc < 1)
    1248:	85 c0                	test   %eax,%eax
    124a:	7e 1d                	jle    1269 <gets+0x49>
      break;
    buf[i++] = c;
    124c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    1250:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    1252:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1255:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    1257:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    125b:	74 0c                	je     1269 <gets+0x49>
    125d:	3c 0a                	cmp    $0xa,%al
    125f:	74 08                	je     1269 <gets+0x49>
  for(i=0; i+1 < max; ){
    1261:	8d 5e 01             	lea    0x1(%esi),%ebx
    1264:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1267:	7c c7                	jl     1230 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1269:	8b 45 08             	mov    0x8(%ebp),%eax
    126c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1270:	83 c4 2c             	add    $0x2c,%esp
    1273:	5b                   	pop    %ebx
    1274:	5e                   	pop    %esi
    1275:	5f                   	pop    %edi
    1276:	5d                   	pop    %ebp
    1277:	c3                   	ret    
    1278:	90                   	nop
    1279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001280 <stat>:

int
stat(char *n, struct stat *st)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
    1285:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1288:	8b 45 08             	mov    0x8(%ebp),%eax
    128b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1292:	00 
    1293:	89 04 24             	mov    %eax,(%esp)
    1296:	e8 d7 00 00 00       	call   1372 <open>
  if(fd < 0)
    129b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    129d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    129f:	78 27                	js     12c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    12a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    12a4:	89 1c 24             	mov    %ebx,(%esp)
    12a7:	89 44 24 04          	mov    %eax,0x4(%esp)
    12ab:	e8 da 00 00 00       	call   138a <fstat>
  close(fd);
    12b0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12b3:	89 c6                	mov    %eax,%esi
  close(fd);
    12b5:	e8 a0 00 00 00       	call   135a <close>
  return r;
    12ba:	89 f0                	mov    %esi,%eax
}
    12bc:	83 c4 10             	add    $0x10,%esp
    12bf:	5b                   	pop    %ebx
    12c0:	5e                   	pop    %esi
    12c1:	5d                   	pop    %ebp
    12c2:	c3                   	ret    
    12c3:	90                   	nop
    12c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    12c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12cd:	eb ed                	jmp    12bc <stat+0x3c>
    12cf:	90                   	nop

000012d0 <atoi>:

int
atoi(const char *s)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    12d6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12d7:	0f be 11             	movsbl (%ecx),%edx
    12da:	8d 42 d0             	lea    -0x30(%edx),%eax
    12dd:	3c 09                	cmp    $0x9,%al
  n = 0;
    12df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    12e4:	77 17                	ja     12fd <atoi+0x2d>
    12e6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    12e8:	83 c1 01             	add    $0x1,%ecx
    12eb:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12ee:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    12f2:	0f be 11             	movsbl (%ecx),%edx
    12f5:	8d 5a d0             	lea    -0x30(%edx),%ebx
    12f8:	80 fb 09             	cmp    $0x9,%bl
    12fb:	76 eb                	jbe    12e8 <atoi+0x18>
  return n;
}
    12fd:	5b                   	pop    %ebx
    12fe:	5d                   	pop    %ebp
    12ff:	c3                   	ret    

00001300 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1300:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1301:	31 d2                	xor    %edx,%edx
{
    1303:	89 e5                	mov    %esp,%ebp
    1305:	56                   	push   %esi
    1306:	8b 45 08             	mov    0x8(%ebp),%eax
    1309:	53                   	push   %ebx
    130a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    130d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1310:	85 db                	test   %ebx,%ebx
    1312:	7e 12                	jle    1326 <memmove+0x26>
    1314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1318:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    131c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    131f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1322:	39 da                	cmp    %ebx,%edx
    1324:	75 f2                	jne    1318 <memmove+0x18>
  return vdst;
}
    1326:	5b                   	pop    %ebx
    1327:	5e                   	pop    %esi
    1328:	5d                   	pop    %ebp
    1329:	c3                   	ret    

0000132a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    132a:	b8 01 00 00 00       	mov    $0x1,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <exit>:
SYSCALL(exit)
    1332:	b8 02 00 00 00       	mov    $0x2,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <wait>:
SYSCALL(wait)
    133a:	b8 03 00 00 00       	mov    $0x3,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <pipe>:
SYSCALL(pipe)
    1342:	b8 04 00 00 00       	mov    $0x4,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <read>:
SYSCALL(read)
    134a:	b8 05 00 00 00       	mov    $0x5,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <write>:
SYSCALL(write)
    1352:	b8 10 00 00 00       	mov    $0x10,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <close>:
SYSCALL(close)
    135a:	b8 15 00 00 00       	mov    $0x15,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <kill>:
SYSCALL(kill)
    1362:	b8 06 00 00 00       	mov    $0x6,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <exec>:
SYSCALL(exec)
    136a:	b8 07 00 00 00       	mov    $0x7,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <open>:
SYSCALL(open)
    1372:	b8 0f 00 00 00       	mov    $0xf,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <mknod>:
SYSCALL(mknod)
    137a:	b8 11 00 00 00       	mov    $0x11,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <unlink>:
SYSCALL(unlink)
    1382:	b8 12 00 00 00       	mov    $0x12,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <fstat>:
SYSCALL(fstat)
    138a:	b8 08 00 00 00       	mov    $0x8,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <link>:
SYSCALL(link)
    1392:	b8 13 00 00 00       	mov    $0x13,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <mkdir>:
SYSCALL(mkdir)
    139a:	b8 14 00 00 00       	mov    $0x14,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <chdir>:
SYSCALL(chdir)
    13a2:	b8 09 00 00 00       	mov    $0x9,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <dup>:
SYSCALL(dup)
    13aa:	b8 0a 00 00 00       	mov    $0xa,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <getpid>:
SYSCALL(getpid)
    13b2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <sbrk>:
SYSCALL(sbrk)
    13ba:	b8 0c 00 00 00       	mov    $0xc,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <sleep>:
SYSCALL(sleep)
    13c2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <uptime>:
SYSCALL(uptime)
    13ca:	b8 0e 00 00 00       	mov    $0xe,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <shm_open>:
SYSCALL(shm_open)
    13d2:	b8 16 00 00 00       	mov    $0x16,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <shm_close>:
SYSCALL(shm_close)	
    13da:	b8 17 00 00 00       	mov    $0x17,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    
    13e2:	66 90                	xchg   %ax,%ax
    13e4:	66 90                	xchg   %ax,%ax
    13e6:	66 90                	xchg   %ax,%ax
    13e8:	66 90                	xchg   %ax,%ax
    13ea:	66 90                	xchg   %ax,%ax
    13ec:	66 90                	xchg   %ax,%ax
    13ee:	66 90                	xchg   %ax,%ax

000013f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	57                   	push   %edi
    13f4:	56                   	push   %esi
    13f5:	89 c6                	mov    %eax,%esi
    13f7:	53                   	push   %ebx
    13f8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    13fe:	85 db                	test   %ebx,%ebx
    1400:	74 09                	je     140b <printint+0x1b>
    1402:	89 d0                	mov    %edx,%eax
    1404:	c1 e8 1f             	shr    $0x1f,%eax
    1407:	84 c0                	test   %al,%al
    1409:	75 75                	jne    1480 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    140b:	89 d0                	mov    %edx,%eax
  neg = 0;
    140d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1414:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1417:	31 ff                	xor    %edi,%edi
    1419:	89 ce                	mov    %ecx,%esi
    141b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    141e:	eb 02                	jmp    1422 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1420:	89 cf                	mov    %ecx,%edi
    1422:	31 d2                	xor    %edx,%edx
    1424:	f7 f6                	div    %esi
    1426:	8d 4f 01             	lea    0x1(%edi),%ecx
    1429:	0f b6 92 88 18 00 00 	movzbl 0x1888(%edx),%edx
  }while((x /= base) != 0);
    1430:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1432:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1435:	75 e9                	jne    1420 <printint+0x30>
  if(neg)
    1437:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    143a:	89 c8                	mov    %ecx,%eax
    143c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    143f:	85 d2                	test   %edx,%edx
    1441:	74 08                	je     144b <printint+0x5b>
    buf[i++] = '-';
    1443:	8d 4f 02             	lea    0x2(%edi),%ecx
    1446:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    144b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    144e:	66 90                	xchg   %ax,%ax
    1450:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1455:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    1458:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    145f:	00 
    1460:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1464:	89 34 24             	mov    %esi,(%esp)
    1467:	88 45 d7             	mov    %al,-0x29(%ebp)
    146a:	e8 e3 fe ff ff       	call   1352 <write>
  while(--i >= 0)
    146f:	83 ff ff             	cmp    $0xffffffff,%edi
    1472:	75 dc                	jne    1450 <printint+0x60>
    putc(fd, buf[i]);
}
    1474:	83 c4 4c             	add    $0x4c,%esp
    1477:	5b                   	pop    %ebx
    1478:	5e                   	pop    %esi
    1479:	5f                   	pop    %edi
    147a:	5d                   	pop    %ebp
    147b:	c3                   	ret    
    147c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    1480:	89 d0                	mov    %edx,%eax
    1482:	f7 d8                	neg    %eax
    neg = 1;
    1484:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    148b:	eb 87                	jmp    1414 <printint+0x24>
    148d:	8d 76 00             	lea    0x0(%esi),%esi

00001490 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1494:	31 ff                	xor    %edi,%edi
{
    1496:	56                   	push   %esi
    1497:	53                   	push   %ebx
    1498:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    149b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    149e:	8d 45 10             	lea    0x10(%ebp),%eax
{
    14a1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    14a4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    14a7:	0f b6 13             	movzbl (%ebx),%edx
    14aa:	83 c3 01             	add    $0x1,%ebx
    14ad:	84 d2                	test   %dl,%dl
    14af:	75 39                	jne    14ea <printf+0x5a>
    14b1:	e9 c2 00 00 00       	jmp    1578 <printf+0xe8>
    14b6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14b8:	83 fa 25             	cmp    $0x25,%edx
    14bb:	0f 84 bf 00 00 00    	je     1580 <printf+0xf0>
  write(fd, &c, 1);
    14c1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14c4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14cb:	00 
    14cc:	89 44 24 04          	mov    %eax,0x4(%esp)
    14d0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    14d3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    14d6:	e8 77 fe ff ff       	call   1352 <write>
    14db:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    14de:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    14e2:	84 d2                	test   %dl,%dl
    14e4:	0f 84 8e 00 00 00    	je     1578 <printf+0xe8>
    if(state == 0){
    14ea:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    14ec:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    14ef:	74 c7                	je     14b8 <printf+0x28>
      }
    } else if(state == '%'){
    14f1:	83 ff 25             	cmp    $0x25,%edi
    14f4:	75 e5                	jne    14db <printf+0x4b>
      if(c == 'd'){
    14f6:	83 fa 64             	cmp    $0x64,%edx
    14f9:	0f 84 31 01 00 00    	je     1630 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14ff:	25 f7 00 00 00       	and    $0xf7,%eax
    1504:	83 f8 70             	cmp    $0x70,%eax
    1507:	0f 84 83 00 00 00    	je     1590 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    150d:	83 fa 73             	cmp    $0x73,%edx
    1510:	0f 84 a2 00 00 00    	je     15b8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1516:	83 fa 63             	cmp    $0x63,%edx
    1519:	0f 84 35 01 00 00    	je     1654 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    151f:	83 fa 25             	cmp    $0x25,%edx
    1522:	0f 84 e0 00 00 00    	je     1608 <printf+0x178>
  write(fd, &c, 1);
    1528:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    152b:	83 c3 01             	add    $0x1,%ebx
    152e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1535:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1536:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1538:	89 44 24 04          	mov    %eax,0x4(%esp)
    153c:	89 34 24             	mov    %esi,(%esp)
    153f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1542:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1546:	e8 07 fe ff ff       	call   1352 <write>
        putc(fd, c);
    154b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    154e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1551:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1558:	00 
    1559:	89 44 24 04          	mov    %eax,0x4(%esp)
    155d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    1560:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    1563:	e8 ea fd ff ff       	call   1352 <write>
  for(i = 0; fmt[i]; i++){
    1568:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    156c:	84 d2                	test   %dl,%dl
    156e:	0f 85 76 ff ff ff    	jne    14ea <printf+0x5a>
    1574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    1578:	83 c4 3c             	add    $0x3c,%esp
    157b:	5b                   	pop    %ebx
    157c:	5e                   	pop    %esi
    157d:	5f                   	pop    %edi
    157e:	5d                   	pop    %ebp
    157f:	c3                   	ret    
        state = '%';
    1580:	bf 25 00 00 00       	mov    $0x25,%edi
    1585:	e9 51 ff ff ff       	jmp    14db <printf+0x4b>
    158a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1590:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1593:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    1598:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    159a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15a1:	8b 10                	mov    (%eax),%edx
    15a3:	89 f0                	mov    %esi,%eax
    15a5:	e8 46 fe ff ff       	call   13f0 <printint>
        ap++;
    15aa:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15ae:	e9 28 ff ff ff       	jmp    14db <printf+0x4b>
    15b3:	90                   	nop
    15b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    15bb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    15bf:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    15c1:	b8 81 18 00 00       	mov    $0x1881,%eax
    15c6:	85 ff                	test   %edi,%edi
    15c8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    15cb:	0f b6 07             	movzbl (%edi),%eax
    15ce:	84 c0                	test   %al,%al
    15d0:	74 2a                	je     15fc <printf+0x16c>
    15d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    15d8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    15db:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    15de:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    15e1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15e8:	00 
    15e9:	89 44 24 04          	mov    %eax,0x4(%esp)
    15ed:	89 34 24             	mov    %esi,(%esp)
    15f0:	e8 5d fd ff ff       	call   1352 <write>
        while(*s != 0){
    15f5:	0f b6 07             	movzbl (%edi),%eax
    15f8:	84 c0                	test   %al,%al
    15fa:	75 dc                	jne    15d8 <printf+0x148>
      state = 0;
    15fc:	31 ff                	xor    %edi,%edi
    15fe:	e9 d8 fe ff ff       	jmp    14db <printf+0x4b>
    1603:	90                   	nop
    1604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1608:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    160b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    160d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1614:	00 
    1615:	89 44 24 04          	mov    %eax,0x4(%esp)
    1619:	89 34 24             	mov    %esi,(%esp)
    161c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1620:	e8 2d fd ff ff       	call   1352 <write>
    1625:	e9 b1 fe ff ff       	jmp    14db <printf+0x4b>
    162a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1630:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1633:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    1638:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    163b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1642:	8b 10                	mov    (%eax),%edx
    1644:	89 f0                	mov    %esi,%eax
    1646:	e8 a5 fd ff ff       	call   13f0 <printint>
        ap++;
    164b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    164f:	e9 87 fe ff ff       	jmp    14db <printf+0x4b>
        putc(fd, *ap);
    1654:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    1657:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    1659:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    165b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1662:	00 
    1663:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    1666:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    1669:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    166c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1670:	e8 dd fc ff ff       	call   1352 <write>
        ap++;
    1675:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1679:	e9 5d fe ff ff       	jmp    14db <printf+0x4b>
    167e:	66 90                	xchg   %ax,%ax

00001680 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1680:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1681:	a1 48 1b 00 00       	mov    0x1b48,%eax
{
    1686:	89 e5                	mov    %esp,%ebp
    1688:	57                   	push   %edi
    1689:	56                   	push   %esi
    168a:	53                   	push   %ebx
    168b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    168e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    1690:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1693:	39 d0                	cmp    %edx,%eax
    1695:	72 11                	jb     16a8 <free+0x28>
    1697:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1698:	39 c8                	cmp    %ecx,%eax
    169a:	72 04                	jb     16a0 <free+0x20>
    169c:	39 ca                	cmp    %ecx,%edx
    169e:	72 10                	jb     16b0 <free+0x30>
    16a0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16a4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a6:	73 f0                	jae    1698 <free+0x18>
    16a8:	39 ca                	cmp    %ecx,%edx
    16aa:	72 04                	jb     16b0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16ac:	39 c8                	cmp    %ecx,%eax
    16ae:	72 f0                	jb     16a0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16b3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    16b6:	39 cf                	cmp    %ecx,%edi
    16b8:	74 1e                	je     16d8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16ba:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16bd:	8b 48 04             	mov    0x4(%eax),%ecx
    16c0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    16c3:	39 f2                	cmp    %esi,%edx
    16c5:	74 28                	je     16ef <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16c7:	89 10                	mov    %edx,(%eax)
  freep = p;
    16c9:	a3 48 1b 00 00       	mov    %eax,0x1b48
}
    16ce:	5b                   	pop    %ebx
    16cf:	5e                   	pop    %esi
    16d0:	5f                   	pop    %edi
    16d1:	5d                   	pop    %ebp
    16d2:	c3                   	ret    
    16d3:	90                   	nop
    16d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    16d8:	03 71 04             	add    0x4(%ecx),%esi
    16db:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16de:	8b 08                	mov    (%eax),%ecx
    16e0:	8b 09                	mov    (%ecx),%ecx
    16e2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16e5:	8b 48 04             	mov    0x4(%eax),%ecx
    16e8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    16eb:	39 f2                	cmp    %esi,%edx
    16ed:	75 d8                	jne    16c7 <free+0x47>
    p->s.size += bp->s.size;
    16ef:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    16f2:	a3 48 1b 00 00       	mov    %eax,0x1b48
    p->s.size += bp->s.size;
    16f7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16fa:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16fd:	89 10                	mov    %edx,(%eax)
}
    16ff:	5b                   	pop    %ebx
    1700:	5e                   	pop    %esi
    1701:	5f                   	pop    %edi
    1702:	5d                   	pop    %ebp
    1703:	c3                   	ret    
    1704:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    170a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001710 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1710:	55                   	push   %ebp
    1711:	89 e5                	mov    %esp,%ebp
    1713:	57                   	push   %edi
    1714:	56                   	push   %esi
    1715:	53                   	push   %ebx
    1716:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1719:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    171c:	8b 1d 48 1b 00 00    	mov    0x1b48,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1722:	8d 48 07             	lea    0x7(%eax),%ecx
    1725:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1728:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    172a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    172d:	0f 84 9b 00 00 00    	je     17ce <malloc+0xbe>
    1733:	8b 13                	mov    (%ebx),%edx
    1735:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1738:	39 fe                	cmp    %edi,%esi
    173a:	76 64                	jbe    17a0 <malloc+0x90>
    173c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    1743:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1748:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    174b:	eb 0e                	jmp    175b <malloc+0x4b>
    174d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1750:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1752:	8b 78 04             	mov    0x4(%eax),%edi
    1755:	39 fe                	cmp    %edi,%esi
    1757:	76 4f                	jbe    17a8 <malloc+0x98>
    1759:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    175b:	3b 15 48 1b 00 00    	cmp    0x1b48,%edx
    1761:	75 ed                	jne    1750 <malloc+0x40>
  if(nu < 4096)
    1763:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1766:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    176c:	bf 00 10 00 00       	mov    $0x1000,%edi
    1771:	0f 43 fe             	cmovae %esi,%edi
    1774:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    1777:	89 04 24             	mov    %eax,(%esp)
    177a:	e8 3b fc ff ff       	call   13ba <sbrk>
  if(p == (char*)-1)
    177f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1782:	74 18                	je     179c <malloc+0x8c>
  hp->s.size = nu;
    1784:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1787:	83 c0 08             	add    $0x8,%eax
    178a:	89 04 24             	mov    %eax,(%esp)
    178d:	e8 ee fe ff ff       	call   1680 <free>
  return freep;
    1792:	8b 15 48 1b 00 00    	mov    0x1b48,%edx
      if((p = morecore(nunits)) == 0)
    1798:	85 d2                	test   %edx,%edx
    179a:	75 b4                	jne    1750 <malloc+0x40>
        return 0;
    179c:	31 c0                	xor    %eax,%eax
    179e:	eb 20                	jmp    17c0 <malloc+0xb0>
    if(p->s.size >= nunits){
    17a0:	89 d0                	mov    %edx,%eax
    17a2:	89 da                	mov    %ebx,%edx
    17a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    17a8:	39 fe                	cmp    %edi,%esi
    17aa:	74 1c                	je     17c8 <malloc+0xb8>
        p->s.size -= nunits;
    17ac:	29 f7                	sub    %esi,%edi
    17ae:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    17b1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    17b4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    17b7:	89 15 48 1b 00 00    	mov    %edx,0x1b48
      return (void*)(p + 1);
    17bd:	83 c0 08             	add    $0x8,%eax
  }
}
    17c0:	83 c4 1c             	add    $0x1c,%esp
    17c3:	5b                   	pop    %ebx
    17c4:	5e                   	pop    %esi
    17c5:	5f                   	pop    %edi
    17c6:	5d                   	pop    %ebp
    17c7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    17c8:	8b 08                	mov    (%eax),%ecx
    17ca:	89 0a                	mov    %ecx,(%edx)
    17cc:	eb e9                	jmp    17b7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    17ce:	c7 05 48 1b 00 00 4c 	movl   $0x1b4c,0x1b48
    17d5:	1b 00 00 
    base.s.size = 0;
    17d8:	ba 4c 1b 00 00       	mov    $0x1b4c,%edx
    base.s.ptr = freep = prevp = &base;
    17dd:	c7 05 4c 1b 00 00 4c 	movl   $0x1b4c,0x1b4c
    17e4:	1b 00 00 
    base.s.size = 0;
    17e7:	c7 05 50 1b 00 00 00 	movl   $0x0,0x1b50
    17ee:	00 00 00 
    17f1:	e9 46 ff ff ff       	jmp    173c <malloc+0x2c>
    17f6:	66 90                	xchg   %ax,%ax
    17f8:	66 90                	xchg   %ax,%ax
    17fa:	66 90                	xchg   %ax,%ax
    17fc:	66 90                	xchg   %ax,%ax
    17fe:	66 90                	xchg   %ax,%ax

00001800 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1800:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1801:	b9 01 00 00 00       	mov    $0x1,%ecx
    1806:	89 e5                	mov    %esp,%ebp
    1808:	8b 55 08             	mov    0x8(%ebp),%edx
    180b:	90                   	nop
    180c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1810:	89 c8                	mov    %ecx,%eax
    1812:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1815:	85 c0                	test   %eax,%eax
    1817:	75 f7                	jne    1810 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1819:	0f ae f0             	mfence 
}
    181c:	5d                   	pop    %ebp
    181d:	c3                   	ret    
    181e:	66 90                	xchg   %ax,%ax

00001820 <urelease>:

void urelease (struct uspinlock *lk) {
    1820:	55                   	push   %ebp
    1821:	89 e5                	mov    %esp,%ebp
    1823:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1826:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1829:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    182f:	5d                   	pop    %ebp
    1830:	c3                   	ret    
