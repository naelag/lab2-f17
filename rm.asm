
_rm:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	57                   	push   %edi
    1004:	56                   	push   %esi
  int i;

  if(argc < 2){
    1005:	be 01 00 00 00       	mov    $0x1,%esi
{
    100a:	53                   	push   %ebx
    100b:	83 e4 f0             	and    $0xfffffff0,%esp
    100e:	83 ec 10             	sub    $0x10,%esp
    1011:	8b 7d 08             	mov    0x8(%ebp),%edi
    1014:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(argc < 2){
    1017:	83 ff 01             	cmp    $0x1,%edi
    101a:	8d 58 04             	lea    0x4(%eax),%ebx
    101d:	7e 3a                	jle    1059 <main+0x59>
    101f:	90                   	nop
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
    1020:	8b 03                	mov    (%ebx),%eax
    1022:	89 04 24             	mov    %eax,(%esp)
    1025:	e8 c8 02 00 00       	call   12f2 <unlink>
    102a:	85 c0                	test   %eax,%eax
    102c:	78 0f                	js     103d <main+0x3d>
  for(i = 1; i < argc; i++){
    102e:	83 c6 01             	add    $0x1,%esi
    1031:	83 c3 04             	add    $0x4,%ebx
    1034:	39 fe                	cmp    %edi,%esi
    1036:	75 e8                	jne    1020 <main+0x20>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
    1038:	e8 65 02 00 00       	call   12a2 <exit>
      printf(2, "rm: %s failed to delete\n", argv[i]);
    103d:	8b 03                	mov    (%ebx),%eax
    103f:	c7 44 24 04 b5 17 00 	movl   $0x17b5,0x4(%esp)
    1046:	00 
    1047:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    104e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1052:	e8 a9 03 00 00       	call   1400 <printf>
      break;
    1057:	eb df                	jmp    1038 <main+0x38>
    printf(2, "Usage: rm files...\n");
    1059:	c7 44 24 04 a1 17 00 	movl   $0x17a1,0x4(%esp)
    1060:	00 
    1061:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1068:	e8 93 03 00 00       	call   1400 <printf>
    exit();
    106d:	e8 30 02 00 00       	call   12a2 <exit>
    1072:	66 90                	xchg   %ax,%ax
    1074:	66 90                	xchg   %ax,%ax
    1076:	66 90                	xchg   %ax,%ax
    1078:	66 90                	xchg   %ax,%ax
    107a:	66 90                	xchg   %ax,%ax
    107c:	66 90                	xchg   %ax,%ax
    107e:	66 90                	xchg   %ax,%ax

00001080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	8b 45 08             	mov    0x8(%ebp),%eax
    1086:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1089:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    108a:	89 c2                	mov    %eax,%edx
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1090:	83 c1 01             	add    $0x1,%ecx
    1093:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1097:	83 c2 01             	add    $0x1,%edx
    109a:	84 db                	test   %bl,%bl
    109c:	88 5a ff             	mov    %bl,-0x1(%edx)
    109f:	75 ef                	jne    1090 <strcpy+0x10>
    ;
  return os;
}
    10a1:	5b                   	pop    %ebx
    10a2:	5d                   	pop    %ebp
    10a3:	c3                   	ret    
    10a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	8b 55 08             	mov    0x8(%ebp),%edx
    10b6:	53                   	push   %ebx
    10b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10ba:	0f b6 02             	movzbl (%edx),%eax
    10bd:	84 c0                	test   %al,%al
    10bf:	74 2d                	je     10ee <strcmp+0x3e>
    10c1:	0f b6 19             	movzbl (%ecx),%ebx
    10c4:	38 d8                	cmp    %bl,%al
    10c6:	74 0e                	je     10d6 <strcmp+0x26>
    10c8:	eb 2b                	jmp    10f5 <strcmp+0x45>
    10ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10d0:	38 c8                	cmp    %cl,%al
    10d2:	75 15                	jne    10e9 <strcmp+0x39>
    p++, q++;
    10d4:	89 d9                	mov    %ebx,%ecx
    10d6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10d9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10dc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    10df:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    10e3:	84 c0                	test   %al,%al
    10e5:	75 e9                	jne    10d0 <strcmp+0x20>
    10e7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10e9:	29 c8                	sub    %ecx,%eax
}
    10eb:	5b                   	pop    %ebx
    10ec:	5d                   	pop    %ebp
    10ed:	c3                   	ret    
    10ee:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    10f1:	31 c0                	xor    %eax,%eax
    10f3:	eb f4                	jmp    10e9 <strcmp+0x39>
    10f5:	0f b6 cb             	movzbl %bl,%ecx
    10f8:	eb ef                	jmp    10e9 <strcmp+0x39>
    10fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001100 <strlen>:

uint
strlen(char *s)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1106:	80 39 00             	cmpb   $0x0,(%ecx)
    1109:	74 12                	je     111d <strlen+0x1d>
    110b:	31 d2                	xor    %edx,%edx
    110d:	8d 76 00             	lea    0x0(%esi),%esi
    1110:	83 c2 01             	add    $0x1,%edx
    1113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1117:	89 d0                	mov    %edx,%eax
    1119:	75 f5                	jne    1110 <strlen+0x10>
    ;
  return n;
}
    111b:	5d                   	pop    %ebp
    111c:	c3                   	ret    
  for(n = 0; s[n]; n++)
    111d:	31 c0                	xor    %eax,%eax
}
    111f:	5d                   	pop    %ebp
    1120:	c3                   	ret    
    1121:	eb 0d                	jmp    1130 <memset>
    1123:	90                   	nop
    1124:	90                   	nop
    1125:	90                   	nop
    1126:	90                   	nop
    1127:	90                   	nop
    1128:	90                   	nop
    1129:	90                   	nop
    112a:	90                   	nop
    112b:	90                   	nop
    112c:	90                   	nop
    112d:	90                   	nop
    112e:	90                   	nop
    112f:	90                   	nop

00001130 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	8b 55 08             	mov    0x8(%ebp),%edx
    1136:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1137:	8b 4d 10             	mov    0x10(%ebp),%ecx
    113a:	8b 45 0c             	mov    0xc(%ebp),%eax
    113d:	89 d7                	mov    %edx,%edi
    113f:	fc                   	cld    
    1140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1142:	89 d0                	mov    %edx,%eax
    1144:	5f                   	pop    %edi
    1145:	5d                   	pop    %ebp
    1146:	c3                   	ret    
    1147:	89 f6                	mov    %esi,%esi
    1149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001150 <strchr>:

char*
strchr(const char *s, char c)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	8b 45 08             	mov    0x8(%ebp),%eax
    1156:	53                   	push   %ebx
    1157:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    115a:	0f b6 18             	movzbl (%eax),%ebx
    115d:	84 db                	test   %bl,%bl
    115f:	74 1d                	je     117e <strchr+0x2e>
    if(*s == c)
    1161:	38 d3                	cmp    %dl,%bl
    1163:	89 d1                	mov    %edx,%ecx
    1165:	75 0d                	jne    1174 <strchr+0x24>
    1167:	eb 17                	jmp    1180 <strchr+0x30>
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1170:	38 ca                	cmp    %cl,%dl
    1172:	74 0c                	je     1180 <strchr+0x30>
  for(; *s; s++)
    1174:	83 c0 01             	add    $0x1,%eax
    1177:	0f b6 10             	movzbl (%eax),%edx
    117a:	84 d2                	test   %dl,%dl
    117c:	75 f2                	jne    1170 <strchr+0x20>
      return (char*)s;
  return 0;
    117e:	31 c0                	xor    %eax,%eax
}
    1180:	5b                   	pop    %ebx
    1181:	5d                   	pop    %ebp
    1182:	c3                   	ret    
    1183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001190 <gets>:

char*
gets(char *buf, int max)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	57                   	push   %edi
    1194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1195:	31 f6                	xor    %esi,%esi
{
    1197:	53                   	push   %ebx
    1198:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    119b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    119e:	eb 31                	jmp    11d1 <gets+0x41>
    cc = read(0, &c, 1);
    11a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11a7:	00 
    11a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
    11ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11b3:	e8 02 01 00 00       	call   12ba <read>
    if(cc < 1)
    11b8:	85 c0                	test   %eax,%eax
    11ba:	7e 1d                	jle    11d9 <gets+0x49>
      break;
    buf[i++] = c;
    11bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    11c0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    11c2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    11c5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    11c7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11cb:	74 0c                	je     11d9 <gets+0x49>
    11cd:	3c 0a                	cmp    $0xa,%al
    11cf:	74 08                	je     11d9 <gets+0x49>
  for(i=0; i+1 < max; ){
    11d1:	8d 5e 01             	lea    0x1(%esi),%ebx
    11d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11d7:	7c c7                	jl     11a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    11d9:	8b 45 08             	mov    0x8(%ebp),%eax
    11dc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11e0:	83 c4 2c             	add    $0x2c,%esp
    11e3:	5b                   	pop    %ebx
    11e4:	5e                   	pop    %esi
    11e5:	5f                   	pop    %edi
    11e6:	5d                   	pop    %ebp
    11e7:	c3                   	ret    
    11e8:	90                   	nop
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011f0 <stat>:

int
stat(char *n, struct stat *st)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	56                   	push   %esi
    11f4:	53                   	push   %ebx
    11f5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11f8:	8b 45 08             	mov    0x8(%ebp),%eax
    11fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1202:	00 
    1203:	89 04 24             	mov    %eax,(%esp)
    1206:	e8 d7 00 00 00       	call   12e2 <open>
  if(fd < 0)
    120b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    120d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    120f:	78 27                	js     1238 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    1211:	8b 45 0c             	mov    0xc(%ebp),%eax
    1214:	89 1c 24             	mov    %ebx,(%esp)
    1217:	89 44 24 04          	mov    %eax,0x4(%esp)
    121b:	e8 da 00 00 00       	call   12fa <fstat>
  close(fd);
    1220:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1223:	89 c6                	mov    %eax,%esi
  close(fd);
    1225:	e8 a0 00 00 00       	call   12ca <close>
  return r;
    122a:	89 f0                	mov    %esi,%eax
}
    122c:	83 c4 10             	add    $0x10,%esp
    122f:	5b                   	pop    %ebx
    1230:	5e                   	pop    %esi
    1231:	5d                   	pop    %ebp
    1232:	c3                   	ret    
    1233:	90                   	nop
    1234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1238:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    123d:	eb ed                	jmp    122c <stat+0x3c>
    123f:	90                   	nop

00001240 <atoi>:

int
atoi(const char *s)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1246:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1247:	0f be 11             	movsbl (%ecx),%edx
    124a:	8d 42 d0             	lea    -0x30(%edx),%eax
    124d:	3c 09                	cmp    $0x9,%al
  n = 0;
    124f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1254:	77 17                	ja     126d <atoi+0x2d>
    1256:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1258:	83 c1 01             	add    $0x1,%ecx
    125b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    125e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1262:	0f be 11             	movsbl (%ecx),%edx
    1265:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1268:	80 fb 09             	cmp    $0x9,%bl
    126b:	76 eb                	jbe    1258 <atoi+0x18>
  return n;
}
    126d:	5b                   	pop    %ebx
    126e:	5d                   	pop    %ebp
    126f:	c3                   	ret    

00001270 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1270:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1271:	31 d2                	xor    %edx,%edx
{
    1273:	89 e5                	mov    %esp,%ebp
    1275:	56                   	push   %esi
    1276:	8b 45 08             	mov    0x8(%ebp),%eax
    1279:	53                   	push   %ebx
    127a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    127d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1280:	85 db                	test   %ebx,%ebx
    1282:	7e 12                	jle    1296 <memmove+0x26>
    1284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    128c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    128f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1292:	39 da                	cmp    %ebx,%edx
    1294:	75 f2                	jne    1288 <memmove+0x18>
  return vdst;
}
    1296:	5b                   	pop    %ebx
    1297:	5e                   	pop    %esi
    1298:	5d                   	pop    %ebp
    1299:	c3                   	ret    

0000129a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    129a:	b8 01 00 00 00       	mov    $0x1,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <exit>:
SYSCALL(exit)
    12a2:	b8 02 00 00 00       	mov    $0x2,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <wait>:
SYSCALL(wait)
    12aa:	b8 03 00 00 00       	mov    $0x3,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <pipe>:
SYSCALL(pipe)
    12b2:	b8 04 00 00 00       	mov    $0x4,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <read>:
SYSCALL(read)
    12ba:	b8 05 00 00 00       	mov    $0x5,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <write>:
SYSCALL(write)
    12c2:	b8 10 00 00 00       	mov    $0x10,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <close>:
SYSCALL(close)
    12ca:	b8 15 00 00 00       	mov    $0x15,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <kill>:
SYSCALL(kill)
    12d2:	b8 06 00 00 00       	mov    $0x6,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <exec>:
SYSCALL(exec)
    12da:	b8 07 00 00 00       	mov    $0x7,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <open>:
SYSCALL(open)
    12e2:	b8 0f 00 00 00       	mov    $0xf,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <mknod>:
SYSCALL(mknod)
    12ea:	b8 11 00 00 00       	mov    $0x11,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <unlink>:
SYSCALL(unlink)
    12f2:	b8 12 00 00 00       	mov    $0x12,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <fstat>:
SYSCALL(fstat)
    12fa:	b8 08 00 00 00       	mov    $0x8,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <link>:
SYSCALL(link)
    1302:	b8 13 00 00 00       	mov    $0x13,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <mkdir>:
SYSCALL(mkdir)
    130a:	b8 14 00 00 00       	mov    $0x14,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <chdir>:
SYSCALL(chdir)
    1312:	b8 09 00 00 00       	mov    $0x9,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <dup>:
SYSCALL(dup)
    131a:	b8 0a 00 00 00       	mov    $0xa,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <getpid>:
SYSCALL(getpid)
    1322:	b8 0b 00 00 00       	mov    $0xb,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <sbrk>:
SYSCALL(sbrk)
    132a:	b8 0c 00 00 00       	mov    $0xc,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <sleep>:
SYSCALL(sleep)
    1332:	b8 0d 00 00 00       	mov    $0xd,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <uptime>:
SYSCALL(uptime)
    133a:	b8 0e 00 00 00       	mov    $0xe,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <shm_open>:
SYSCALL(shm_open)
    1342:	b8 16 00 00 00       	mov    $0x16,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <shm_close>:
SYSCALL(shm_close)	
    134a:	b8 17 00 00 00       	mov    $0x17,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    
    1352:	66 90                	xchg   %ax,%ax
    1354:	66 90                	xchg   %ax,%ax
    1356:	66 90                	xchg   %ax,%ax
    1358:	66 90                	xchg   %ax,%ax
    135a:	66 90                	xchg   %ax,%ax
    135c:	66 90                	xchg   %ax,%ax
    135e:	66 90                	xchg   %ax,%ax

00001360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	57                   	push   %edi
    1364:	56                   	push   %esi
    1365:	89 c6                	mov    %eax,%esi
    1367:	53                   	push   %ebx
    1368:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    136b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    136e:	85 db                	test   %ebx,%ebx
    1370:	74 09                	je     137b <printint+0x1b>
    1372:	89 d0                	mov    %edx,%eax
    1374:	c1 e8 1f             	shr    $0x1f,%eax
    1377:	84 c0                	test   %al,%al
    1379:	75 75                	jne    13f0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    137b:	89 d0                	mov    %edx,%eax
  neg = 0;
    137d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1384:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1387:	31 ff                	xor    %edi,%edi
    1389:	89 ce                	mov    %ecx,%esi
    138b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    138e:	eb 02                	jmp    1392 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1390:	89 cf                	mov    %ecx,%edi
    1392:	31 d2                	xor    %edx,%edx
    1394:	f7 f6                	div    %esi
    1396:	8d 4f 01             	lea    0x1(%edi),%ecx
    1399:	0f b6 92 d5 17 00 00 	movzbl 0x17d5(%edx),%edx
  }while((x /= base) != 0);
    13a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    13a2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    13a5:	75 e9                	jne    1390 <printint+0x30>
  if(neg)
    13a7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    13aa:	89 c8                	mov    %ecx,%eax
    13ac:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    13af:	85 d2                	test   %edx,%edx
    13b1:	74 08                	je     13bb <printint+0x5b>
    buf[i++] = '-';
    13b3:	8d 4f 02             	lea    0x2(%edi),%ecx
    13b6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    13bb:	8d 79 ff             	lea    -0x1(%ecx),%edi
    13be:	66 90                	xchg   %ax,%ax
    13c0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    13c5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    13c8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13cf:	00 
    13d0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    13d4:	89 34 24             	mov    %esi,(%esp)
    13d7:	88 45 d7             	mov    %al,-0x29(%ebp)
    13da:	e8 e3 fe ff ff       	call   12c2 <write>
  while(--i >= 0)
    13df:	83 ff ff             	cmp    $0xffffffff,%edi
    13e2:	75 dc                	jne    13c0 <printint+0x60>
    putc(fd, buf[i]);
}
    13e4:	83 c4 4c             	add    $0x4c,%esp
    13e7:	5b                   	pop    %ebx
    13e8:	5e                   	pop    %esi
    13e9:	5f                   	pop    %edi
    13ea:	5d                   	pop    %ebp
    13eb:	c3                   	ret    
    13ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    13f0:	89 d0                	mov    %edx,%eax
    13f2:	f7 d8                	neg    %eax
    neg = 1;
    13f4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    13fb:	eb 87                	jmp    1384 <printint+0x24>
    13fd:	8d 76 00             	lea    0x0(%esi),%esi

00001400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1404:	31 ff                	xor    %edi,%edi
{
    1406:	56                   	push   %esi
    1407:	53                   	push   %ebx
    1408:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    140b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    140e:	8d 45 10             	lea    0x10(%ebp),%eax
{
    1411:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    1414:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    1417:	0f b6 13             	movzbl (%ebx),%edx
    141a:	83 c3 01             	add    $0x1,%ebx
    141d:	84 d2                	test   %dl,%dl
    141f:	75 39                	jne    145a <printf+0x5a>
    1421:	e9 c2 00 00 00       	jmp    14e8 <printf+0xe8>
    1426:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1428:	83 fa 25             	cmp    $0x25,%edx
    142b:	0f 84 bf 00 00 00    	je     14f0 <printf+0xf0>
  write(fd, &c, 1);
    1431:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1434:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    143b:	00 
    143c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1440:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    1443:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    1446:	e8 77 fe ff ff       	call   12c2 <write>
    144b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    144e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1452:	84 d2                	test   %dl,%dl
    1454:	0f 84 8e 00 00 00    	je     14e8 <printf+0xe8>
    if(state == 0){
    145a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    145c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    145f:	74 c7                	je     1428 <printf+0x28>
      }
    } else if(state == '%'){
    1461:	83 ff 25             	cmp    $0x25,%edi
    1464:	75 e5                	jne    144b <printf+0x4b>
      if(c == 'd'){
    1466:	83 fa 64             	cmp    $0x64,%edx
    1469:	0f 84 31 01 00 00    	je     15a0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    146f:	25 f7 00 00 00       	and    $0xf7,%eax
    1474:	83 f8 70             	cmp    $0x70,%eax
    1477:	0f 84 83 00 00 00    	je     1500 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    147d:	83 fa 73             	cmp    $0x73,%edx
    1480:	0f 84 a2 00 00 00    	je     1528 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1486:	83 fa 63             	cmp    $0x63,%edx
    1489:	0f 84 35 01 00 00    	je     15c4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    148f:	83 fa 25             	cmp    $0x25,%edx
    1492:	0f 84 e0 00 00 00    	je     1578 <printf+0x178>
  write(fd, &c, 1);
    1498:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    149b:	83 c3 01             	add    $0x1,%ebx
    149e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14a5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14a6:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    14a8:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ac:	89 34 24             	mov    %esi,(%esp)
    14af:	89 55 d0             	mov    %edx,-0x30(%ebp)
    14b2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    14b6:	e8 07 fe ff ff       	call   12c2 <write>
        putc(fd, c);
    14bb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    14be:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14c1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14c8:	00 
    14c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    14cd:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    14d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    14d3:	e8 ea fd ff ff       	call   12c2 <write>
  for(i = 0; fmt[i]; i++){
    14d8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    14dc:	84 d2                	test   %dl,%dl
    14de:	0f 85 76 ff ff ff    	jne    145a <printf+0x5a>
    14e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    14e8:	83 c4 3c             	add    $0x3c,%esp
    14eb:	5b                   	pop    %ebx
    14ec:	5e                   	pop    %esi
    14ed:	5f                   	pop    %edi
    14ee:	5d                   	pop    %ebp
    14ef:	c3                   	ret    
        state = '%';
    14f0:	bf 25 00 00 00       	mov    $0x25,%edi
    14f5:	e9 51 ff ff ff       	jmp    144b <printf+0x4b>
    14fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1500:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1503:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    1508:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    150a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1511:	8b 10                	mov    (%eax),%edx
    1513:	89 f0                	mov    %esi,%eax
    1515:	e8 46 fe ff ff       	call   1360 <printint>
        ap++;
    151a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    151e:	e9 28 ff ff ff       	jmp    144b <printf+0x4b>
    1523:	90                   	nop
    1524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1528:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    152b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    152f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    1531:	b8 ce 17 00 00       	mov    $0x17ce,%eax
    1536:	85 ff                	test   %edi,%edi
    1538:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    153b:	0f b6 07             	movzbl (%edi),%eax
    153e:	84 c0                	test   %al,%al
    1540:	74 2a                	je     156c <printf+0x16c>
    1542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1548:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    154b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    154e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    1551:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1558:	00 
    1559:	89 44 24 04          	mov    %eax,0x4(%esp)
    155d:	89 34 24             	mov    %esi,(%esp)
    1560:	e8 5d fd ff ff       	call   12c2 <write>
        while(*s != 0){
    1565:	0f b6 07             	movzbl (%edi),%eax
    1568:	84 c0                	test   %al,%al
    156a:	75 dc                	jne    1548 <printf+0x148>
      state = 0;
    156c:	31 ff                	xor    %edi,%edi
    156e:	e9 d8 fe ff ff       	jmp    144b <printf+0x4b>
    1573:	90                   	nop
    1574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1578:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    157b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    157d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1584:	00 
    1585:	89 44 24 04          	mov    %eax,0x4(%esp)
    1589:	89 34 24             	mov    %esi,(%esp)
    158c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1590:	e8 2d fd ff ff       	call   12c2 <write>
    1595:	e9 b1 fe ff ff       	jmp    144b <printf+0x4b>
    159a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    15a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    15a8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    15ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15b2:	8b 10                	mov    (%eax),%edx
    15b4:	89 f0                	mov    %esi,%eax
    15b6:	e8 a5 fd ff ff       	call   1360 <printint>
        ap++;
    15bb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15bf:	e9 87 fe ff ff       	jmp    144b <printf+0x4b>
        putc(fd, *ap);
    15c4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    15c7:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    15c9:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    15cb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15d2:	00 
    15d3:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    15d6:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    15d9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    15dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    15e0:	e8 dd fc ff ff       	call   12c2 <write>
        ap++;
    15e5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15e9:	e9 5d fe ff ff       	jmp    144b <printf+0x4b>
    15ee:	66 90                	xchg   %ax,%ax

000015f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15f1:	a1 94 1a 00 00       	mov    0x1a94,%eax
{
    15f6:	89 e5                	mov    %esp,%ebp
    15f8:	57                   	push   %edi
    15f9:	56                   	push   %esi
    15fa:	53                   	push   %ebx
    15fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15fe:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    1600:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1603:	39 d0                	cmp    %edx,%eax
    1605:	72 11                	jb     1618 <free+0x28>
    1607:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1608:	39 c8                	cmp    %ecx,%eax
    160a:	72 04                	jb     1610 <free+0x20>
    160c:	39 ca                	cmp    %ecx,%edx
    160e:	72 10                	jb     1620 <free+0x30>
    1610:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1612:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1614:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1616:	73 f0                	jae    1608 <free+0x18>
    1618:	39 ca                	cmp    %ecx,%edx
    161a:	72 04                	jb     1620 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    161c:	39 c8                	cmp    %ecx,%eax
    161e:	72 f0                	jb     1610 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1620:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1623:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1626:	39 cf                	cmp    %ecx,%edi
    1628:	74 1e                	je     1648 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    162a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    162d:	8b 48 04             	mov    0x4(%eax),%ecx
    1630:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1633:	39 f2                	cmp    %esi,%edx
    1635:	74 28                	je     165f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1637:	89 10                	mov    %edx,(%eax)
  freep = p;
    1639:	a3 94 1a 00 00       	mov    %eax,0x1a94
}
    163e:	5b                   	pop    %ebx
    163f:	5e                   	pop    %esi
    1640:	5f                   	pop    %edi
    1641:	5d                   	pop    %ebp
    1642:	c3                   	ret    
    1643:	90                   	nop
    1644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1648:	03 71 04             	add    0x4(%ecx),%esi
    164b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    164e:	8b 08                	mov    (%eax),%ecx
    1650:	8b 09                	mov    (%ecx),%ecx
    1652:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1655:	8b 48 04             	mov    0x4(%eax),%ecx
    1658:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    165b:	39 f2                	cmp    %esi,%edx
    165d:	75 d8                	jne    1637 <free+0x47>
    p->s.size += bp->s.size;
    165f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    1662:	a3 94 1a 00 00       	mov    %eax,0x1a94
    p->s.size += bp->s.size;
    1667:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    166a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    166d:	89 10                	mov    %edx,(%eax)
}
    166f:	5b                   	pop    %ebx
    1670:	5e                   	pop    %esi
    1671:	5f                   	pop    %edi
    1672:	5d                   	pop    %ebp
    1673:	c3                   	ret    
    1674:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    167a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001680 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1680:	55                   	push   %ebp
    1681:	89 e5                	mov    %esp,%ebp
    1683:	57                   	push   %edi
    1684:	56                   	push   %esi
    1685:	53                   	push   %ebx
    1686:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1689:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    168c:	8b 1d 94 1a 00 00    	mov    0x1a94,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1692:	8d 48 07             	lea    0x7(%eax),%ecx
    1695:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1698:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    169a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    169d:	0f 84 9b 00 00 00    	je     173e <malloc+0xbe>
    16a3:	8b 13                	mov    (%ebx),%edx
    16a5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    16a8:	39 fe                	cmp    %edi,%esi
    16aa:	76 64                	jbe    1710 <malloc+0x90>
    16ac:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    16b3:	bb 00 80 00 00       	mov    $0x8000,%ebx
    16b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    16bb:	eb 0e                	jmp    16cb <malloc+0x4b>
    16bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16c2:	8b 78 04             	mov    0x4(%eax),%edi
    16c5:	39 fe                	cmp    %edi,%esi
    16c7:	76 4f                	jbe    1718 <malloc+0x98>
    16c9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16cb:	3b 15 94 1a 00 00    	cmp    0x1a94,%edx
    16d1:	75 ed                	jne    16c0 <malloc+0x40>
  if(nu < 4096)
    16d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16d6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    16dc:	bf 00 10 00 00       	mov    $0x1000,%edi
    16e1:	0f 43 fe             	cmovae %esi,%edi
    16e4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    16e7:	89 04 24             	mov    %eax,(%esp)
    16ea:	e8 3b fc ff ff       	call   132a <sbrk>
  if(p == (char*)-1)
    16ef:	83 f8 ff             	cmp    $0xffffffff,%eax
    16f2:	74 18                	je     170c <malloc+0x8c>
  hp->s.size = nu;
    16f4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    16f7:	83 c0 08             	add    $0x8,%eax
    16fa:	89 04 24             	mov    %eax,(%esp)
    16fd:	e8 ee fe ff ff       	call   15f0 <free>
  return freep;
    1702:	8b 15 94 1a 00 00    	mov    0x1a94,%edx
      if((p = morecore(nunits)) == 0)
    1708:	85 d2                	test   %edx,%edx
    170a:	75 b4                	jne    16c0 <malloc+0x40>
        return 0;
    170c:	31 c0                	xor    %eax,%eax
    170e:	eb 20                	jmp    1730 <malloc+0xb0>
    if(p->s.size >= nunits){
    1710:	89 d0                	mov    %edx,%eax
    1712:	89 da                	mov    %ebx,%edx
    1714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1718:	39 fe                	cmp    %edi,%esi
    171a:	74 1c                	je     1738 <malloc+0xb8>
        p->s.size -= nunits;
    171c:	29 f7                	sub    %esi,%edi
    171e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1721:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1724:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1727:	89 15 94 1a 00 00    	mov    %edx,0x1a94
      return (void*)(p + 1);
    172d:	83 c0 08             	add    $0x8,%eax
  }
}
    1730:	83 c4 1c             	add    $0x1c,%esp
    1733:	5b                   	pop    %ebx
    1734:	5e                   	pop    %esi
    1735:	5f                   	pop    %edi
    1736:	5d                   	pop    %ebp
    1737:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1738:	8b 08                	mov    (%eax),%ecx
    173a:	89 0a                	mov    %ecx,(%edx)
    173c:	eb e9                	jmp    1727 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    173e:	c7 05 94 1a 00 00 98 	movl   $0x1a98,0x1a94
    1745:	1a 00 00 
    base.s.size = 0;
    1748:	ba 98 1a 00 00       	mov    $0x1a98,%edx
    base.s.ptr = freep = prevp = &base;
    174d:	c7 05 98 1a 00 00 98 	movl   $0x1a98,0x1a98
    1754:	1a 00 00 
    base.s.size = 0;
    1757:	c7 05 9c 1a 00 00 00 	movl   $0x0,0x1a9c
    175e:	00 00 00 
    1761:	e9 46 ff ff ff       	jmp    16ac <malloc+0x2c>
    1766:	66 90                	xchg   %ax,%ax
    1768:	66 90                	xchg   %ax,%ax
    176a:	66 90                	xchg   %ax,%ax
    176c:	66 90                	xchg   %ax,%ax
    176e:	66 90                	xchg   %ax,%ax

00001770 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1770:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1771:	b9 01 00 00 00       	mov    $0x1,%ecx
    1776:	89 e5                	mov    %esp,%ebp
    1778:	8b 55 08             	mov    0x8(%ebp),%edx
    177b:	90                   	nop
    177c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1780:	89 c8                	mov    %ecx,%eax
    1782:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1785:	85 c0                	test   %eax,%eax
    1787:	75 f7                	jne    1780 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1789:	0f ae f0             	mfence 
}
    178c:	5d                   	pop    %ebp
    178d:	c3                   	ret    
    178e:	66 90                	xchg   %ax,%ax

00001790 <urelease>:

void urelease (struct uspinlock *lk) {
    1790:	55                   	push   %ebp
    1791:	89 e5                	mov    %esp,%ebp
    1793:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1796:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1799:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    179f:	5d                   	pop    %ebp
    17a0:	c3                   	ret    
