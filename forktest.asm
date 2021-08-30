
_forktest:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
    1006:	e8 35 00 00 00       	call   1040 <forktest>
  exit();
    100b:	e8 32 03 00 00       	call   1342 <exit>

00001010 <printf>:
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	53                   	push   %ebx
    1014:	83 ec 14             	sub    $0x14,%esp
    1017:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
    101a:	89 1c 24             	mov    %ebx,(%esp)
    101d:	e8 7e 01 00 00       	call   11a0 <strlen>
    1022:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1026:	89 44 24 08          	mov    %eax,0x8(%esp)
    102a:	8b 45 08             	mov    0x8(%ebp),%eax
    102d:	89 04 24             	mov    %eax,(%esp)
    1030:	e8 2d 03 00 00       	call   1362 <write>
}
    1035:	83 c4 14             	add    $0x14,%esp
    1038:	5b                   	pop    %ebx
    1039:	5d                   	pop    %ebp
    103a:	c3                   	ret    
    103b:	90                   	nop
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001040 <forktest>:
{
    1040:	55                   	push   %ebp
    1041:	89 e5                	mov    %esp,%ebp
    1043:	53                   	push   %ebx
  for(n=0; n<N; n++){
    1044:	31 db                	xor    %ebx,%ebx
{
    1046:	83 ec 14             	sub    $0x14,%esp
  printf(1, "fork test\n");
    1049:	c7 44 24 04 f4 13 00 	movl   $0x13f4,0x4(%esp)
    1050:	00 
    1051:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1058:	e8 b3 ff ff ff       	call   1010 <printf>
    105d:	eb 13                	jmp    1072 <forktest+0x32>
    105f:	90                   	nop
    if(pid == 0)
    1060:	0f 84 97 00 00 00    	je     10fd <forktest+0xbd>
  for(n=0; n<N; n++){
    1066:	83 c3 01             	add    $0x1,%ebx
    1069:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    106f:	90                   	nop
    1070:	74 4e                	je     10c0 <forktest+0x80>
    pid = fork();
    1072:	e8 c3 02 00 00       	call   133a <fork>
    if(pid < 0)
    1077:	85 c0                	test   %eax,%eax
    1079:	79 e5                	jns    1060 <forktest+0x20>
  for(; n > 0; n--){
    107b:	85 db                	test   %ebx,%ebx
    107d:	8d 76 00             	lea    0x0(%esi),%esi
    1080:	74 15                	je     1097 <forktest+0x57>
    1082:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    1088:	e8 bd 02 00 00       	call   134a <wait>
    108d:	85 c0                	test   %eax,%eax
    108f:	90                   	nop
    1090:	78 57                	js     10e9 <forktest+0xa9>
  for(; n > 0; n--){
    1092:	83 eb 01             	sub    $0x1,%ebx
    1095:	75 f1                	jne    1088 <forktest+0x48>
  if(wait() != -1){
    1097:	e8 ae 02 00 00       	call   134a <wait>
    109c:	83 f8 ff             	cmp    $0xffffffff,%eax
    109f:	90                   	nop
    10a0:	75 60                	jne    1102 <forktest+0xc2>
  printf(1, "fork test OK\n");
    10a2:	c7 44 24 04 26 14 00 	movl   $0x1426,0x4(%esp)
    10a9:	00 
    10aa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10b1:	e8 5a ff ff ff       	call   1010 <printf>
}
    10b6:	83 c4 14             	add    $0x14,%esp
    10b9:	5b                   	pop    %ebx
    10ba:	5d                   	pop    %ebp
    10bb:	c3                   	ret    
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, s, strlen(s));
    10c0:	c7 04 24 34 14 00 00 	movl   $0x1434,(%esp)
    10c7:	e8 d4 00 00 00       	call   11a0 <strlen>
    10cc:	c7 44 24 04 34 14 00 	movl   $0x1434,0x4(%esp)
    10d3:	00 
    10d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10db:	89 44 24 08          	mov    %eax,0x8(%esp)
    10df:	e8 7e 02 00 00       	call   1362 <write>
    exit();
    10e4:	e8 59 02 00 00       	call   1342 <exit>
      printf(1, "wait stopped early\n");
    10e9:	c7 44 24 04 ff 13 00 	movl   $0x13ff,0x4(%esp)
    10f0:	00 
    10f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10f8:	e8 13 ff ff ff       	call   1010 <printf>
      exit();
    10fd:	e8 40 02 00 00       	call   1342 <exit>
    printf(1, "wait got too many\n");
    1102:	c7 44 24 04 13 14 00 	movl   $0x1413,0x4(%esp)
    1109:	00 
    110a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1111:	e8 fa fe ff ff       	call   1010 <printf>
    exit();
    1116:	e8 27 02 00 00       	call   1342 <exit>
    111b:	66 90                	xchg   %ax,%ax
    111d:	66 90                	xchg   %ax,%ax
    111f:	90                   	nop

00001120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	8b 45 08             	mov    0x8(%ebp),%eax
    1126:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1129:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    112a:	89 c2                	mov    %eax,%edx
    112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1130:	83 c1 01             	add    $0x1,%ecx
    1133:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1137:	83 c2 01             	add    $0x1,%edx
    113a:	84 db                	test   %bl,%bl
    113c:	88 5a ff             	mov    %bl,-0x1(%edx)
    113f:	75 ef                	jne    1130 <strcpy+0x10>
    ;
  return os;
}
    1141:	5b                   	pop    %ebx
    1142:	5d                   	pop    %ebp
    1143:	c3                   	ret    
    1144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    114a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	8b 55 08             	mov    0x8(%ebp),%edx
    1156:	53                   	push   %ebx
    1157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    115a:	0f b6 02             	movzbl (%edx),%eax
    115d:	84 c0                	test   %al,%al
    115f:	74 2d                	je     118e <strcmp+0x3e>
    1161:	0f b6 19             	movzbl (%ecx),%ebx
    1164:	38 d8                	cmp    %bl,%al
    1166:	74 0e                	je     1176 <strcmp+0x26>
    1168:	eb 2b                	jmp    1195 <strcmp+0x45>
    116a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1170:	38 c8                	cmp    %cl,%al
    1172:	75 15                	jne    1189 <strcmp+0x39>
    p++, q++;
    1174:	89 d9                	mov    %ebx,%ecx
    1176:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1179:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    117c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    117f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    1183:	84 c0                	test   %al,%al
    1185:	75 e9                	jne    1170 <strcmp+0x20>
    1187:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1189:	29 c8                	sub    %ecx,%eax
}
    118b:	5b                   	pop    %ebx
    118c:	5d                   	pop    %ebp
    118d:	c3                   	ret    
    118e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    1191:	31 c0                	xor    %eax,%eax
    1193:	eb f4                	jmp    1189 <strcmp+0x39>
    1195:	0f b6 cb             	movzbl %bl,%ecx
    1198:	eb ef                	jmp    1189 <strcmp+0x39>
    119a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000011a0 <strlen>:

uint
strlen(char *s)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    11a6:	80 39 00             	cmpb   $0x0,(%ecx)
    11a9:	74 12                	je     11bd <strlen+0x1d>
    11ab:	31 d2                	xor    %edx,%edx
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
    11b0:	83 c2 01             	add    $0x1,%edx
    11b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11b7:	89 d0                	mov    %edx,%eax
    11b9:	75 f5                	jne    11b0 <strlen+0x10>
    ;
  return n;
}
    11bb:	5d                   	pop    %ebp
    11bc:	c3                   	ret    
  for(n = 0; s[n]; n++)
    11bd:	31 c0                	xor    %eax,%eax
}
    11bf:	5d                   	pop    %ebp
    11c0:	c3                   	ret    
    11c1:	eb 0d                	jmp    11d0 <memset>
    11c3:	90                   	nop
    11c4:	90                   	nop
    11c5:	90                   	nop
    11c6:	90                   	nop
    11c7:	90                   	nop
    11c8:	90                   	nop
    11c9:	90                   	nop
    11ca:	90                   	nop
    11cb:	90                   	nop
    11cc:	90                   	nop
    11cd:	90                   	nop
    11ce:	90                   	nop
    11cf:	90                   	nop

000011d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	8b 55 08             	mov    0x8(%ebp),%edx
    11d6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11da:	8b 45 0c             	mov    0xc(%ebp),%eax
    11dd:	89 d7                	mov    %edx,%edi
    11df:	fc                   	cld    
    11e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11e2:	89 d0                	mov    %edx,%eax
    11e4:	5f                   	pop    %edi
    11e5:	5d                   	pop    %ebp
    11e6:	c3                   	ret    
    11e7:	89 f6                	mov    %esi,%esi
    11e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011f0 <strchr>:

char*
strchr(const char *s, char c)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	8b 45 08             	mov    0x8(%ebp),%eax
    11f6:	53                   	push   %ebx
    11f7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    11fa:	0f b6 18             	movzbl (%eax),%ebx
    11fd:	84 db                	test   %bl,%bl
    11ff:	74 1d                	je     121e <strchr+0x2e>
    if(*s == c)
    1201:	38 d3                	cmp    %dl,%bl
    1203:	89 d1                	mov    %edx,%ecx
    1205:	75 0d                	jne    1214 <strchr+0x24>
    1207:	eb 17                	jmp    1220 <strchr+0x30>
    1209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1210:	38 ca                	cmp    %cl,%dl
    1212:	74 0c                	je     1220 <strchr+0x30>
  for(; *s; s++)
    1214:	83 c0 01             	add    $0x1,%eax
    1217:	0f b6 10             	movzbl (%eax),%edx
    121a:	84 d2                	test   %dl,%dl
    121c:	75 f2                	jne    1210 <strchr+0x20>
      return (char*)s;
  return 0;
    121e:	31 c0                	xor    %eax,%eax
}
    1220:	5b                   	pop    %ebx
    1221:	5d                   	pop    %ebp
    1222:	c3                   	ret    
    1223:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001230 <gets>:

char*
gets(char *buf, int max)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1235:	31 f6                	xor    %esi,%esi
{
    1237:	53                   	push   %ebx
    1238:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    123b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    123e:	eb 31                	jmp    1271 <gets+0x41>
    cc = read(0, &c, 1);
    1240:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1247:	00 
    1248:	89 7c 24 04          	mov    %edi,0x4(%esp)
    124c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1253:	e8 02 01 00 00       	call   135a <read>
    if(cc < 1)
    1258:	85 c0                	test   %eax,%eax
    125a:	7e 1d                	jle    1279 <gets+0x49>
      break;
    buf[i++] = c;
    125c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    1260:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    1262:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1265:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    1267:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    126b:	74 0c                	je     1279 <gets+0x49>
    126d:	3c 0a                	cmp    $0xa,%al
    126f:	74 08                	je     1279 <gets+0x49>
  for(i=0; i+1 < max; ){
    1271:	8d 5e 01             	lea    0x1(%esi),%ebx
    1274:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1277:	7c c7                	jl     1240 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1279:	8b 45 08             	mov    0x8(%ebp),%eax
    127c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1280:	83 c4 2c             	add    $0x2c,%esp
    1283:	5b                   	pop    %ebx
    1284:	5e                   	pop    %esi
    1285:	5f                   	pop    %edi
    1286:	5d                   	pop    %ebp
    1287:	c3                   	ret    
    1288:	90                   	nop
    1289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001290 <stat>:

int
stat(char *n, struct stat *st)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	56                   	push   %esi
    1294:	53                   	push   %ebx
    1295:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1298:	8b 45 08             	mov    0x8(%ebp),%eax
    129b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12a2:	00 
    12a3:	89 04 24             	mov    %eax,(%esp)
    12a6:	e8 d7 00 00 00       	call   1382 <open>
  if(fd < 0)
    12ab:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    12ad:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    12af:	78 27                	js     12d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    12b1:	8b 45 0c             	mov    0xc(%ebp),%eax
    12b4:	89 1c 24             	mov    %ebx,(%esp)
    12b7:	89 44 24 04          	mov    %eax,0x4(%esp)
    12bb:	e8 da 00 00 00       	call   139a <fstat>
  close(fd);
    12c0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12c3:	89 c6                	mov    %eax,%esi
  close(fd);
    12c5:	e8 a0 00 00 00       	call   136a <close>
  return r;
    12ca:	89 f0                	mov    %esi,%eax
}
    12cc:	83 c4 10             	add    $0x10,%esp
    12cf:	5b                   	pop    %ebx
    12d0:	5e                   	pop    %esi
    12d1:	5d                   	pop    %ebp
    12d2:	c3                   	ret    
    12d3:	90                   	nop
    12d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    12d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12dd:	eb ed                	jmp    12cc <stat+0x3c>
    12df:	90                   	nop

000012e0 <atoi>:

int
atoi(const char *s)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    12e6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12e7:	0f be 11             	movsbl (%ecx),%edx
    12ea:	8d 42 d0             	lea    -0x30(%edx),%eax
    12ed:	3c 09                	cmp    $0x9,%al
  n = 0;
    12ef:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    12f4:	77 17                	ja     130d <atoi+0x2d>
    12f6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    12f8:	83 c1 01             	add    $0x1,%ecx
    12fb:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12fe:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1302:	0f be 11             	movsbl (%ecx),%edx
    1305:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1308:	80 fb 09             	cmp    $0x9,%bl
    130b:	76 eb                	jbe    12f8 <atoi+0x18>
  return n;
}
    130d:	5b                   	pop    %ebx
    130e:	5d                   	pop    %ebp
    130f:	c3                   	ret    

00001310 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1310:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1311:	31 d2                	xor    %edx,%edx
{
    1313:	89 e5                	mov    %esp,%ebp
    1315:	56                   	push   %esi
    1316:	8b 45 08             	mov    0x8(%ebp),%eax
    1319:	53                   	push   %ebx
    131a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    131d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1320:	85 db                	test   %ebx,%ebx
    1322:	7e 12                	jle    1336 <memmove+0x26>
    1324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1328:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    132c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    132f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1332:	39 da                	cmp    %ebx,%edx
    1334:	75 f2                	jne    1328 <memmove+0x18>
  return vdst;
}
    1336:	5b                   	pop    %ebx
    1337:	5e                   	pop    %esi
    1338:	5d                   	pop    %ebp
    1339:	c3                   	ret    

0000133a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    133a:	b8 01 00 00 00       	mov    $0x1,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <exit>:
SYSCALL(exit)
    1342:	b8 02 00 00 00       	mov    $0x2,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <wait>:
SYSCALL(wait)
    134a:	b8 03 00 00 00       	mov    $0x3,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <pipe>:
SYSCALL(pipe)
    1352:	b8 04 00 00 00       	mov    $0x4,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <read>:
SYSCALL(read)
    135a:	b8 05 00 00 00       	mov    $0x5,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <write>:
SYSCALL(write)
    1362:	b8 10 00 00 00       	mov    $0x10,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <close>:
SYSCALL(close)
    136a:	b8 15 00 00 00       	mov    $0x15,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <kill>:
SYSCALL(kill)
    1372:	b8 06 00 00 00       	mov    $0x6,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <exec>:
SYSCALL(exec)
    137a:	b8 07 00 00 00       	mov    $0x7,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <open>:
SYSCALL(open)
    1382:	b8 0f 00 00 00       	mov    $0xf,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <mknod>:
SYSCALL(mknod)
    138a:	b8 11 00 00 00       	mov    $0x11,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <unlink>:
SYSCALL(unlink)
    1392:	b8 12 00 00 00       	mov    $0x12,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <fstat>:
SYSCALL(fstat)
    139a:	b8 08 00 00 00       	mov    $0x8,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <link>:
SYSCALL(link)
    13a2:	b8 13 00 00 00       	mov    $0x13,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <mkdir>:
SYSCALL(mkdir)
    13aa:	b8 14 00 00 00       	mov    $0x14,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <chdir>:
SYSCALL(chdir)
    13b2:	b8 09 00 00 00       	mov    $0x9,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <dup>:
SYSCALL(dup)
    13ba:	b8 0a 00 00 00       	mov    $0xa,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <getpid>:
SYSCALL(getpid)
    13c2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <sbrk>:
SYSCALL(sbrk)
    13ca:	b8 0c 00 00 00       	mov    $0xc,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <sleep>:
SYSCALL(sleep)
    13d2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <uptime>:
SYSCALL(uptime)
    13da:	b8 0e 00 00 00       	mov    $0xe,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <shm_open>:
SYSCALL(shm_open)
    13e2:	b8 16 00 00 00       	mov    $0x16,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <shm_close>:
SYSCALL(shm_close)	
    13ea:	b8 17 00 00 00       	mov    $0x17,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    
