
_stressfs:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
  int fd, i;
  char path[] = "stressfs0";
    1001:	b8 30 00 00 00       	mov    $0x30,%eax
{
    1006:	89 e5                	mov    %esp,%ebp
    1008:	57                   	push   %edi
    1009:	56                   	push   %esi
    100a:	53                   	push   %ebx
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
    100b:	31 db                	xor    %ebx,%ebx
{
    100d:	83 e4 f0             	and    $0xfffffff0,%esp
    1010:	81 ec 20 02 00 00    	sub    $0x220,%esp
  printf(1, "stressfs starting\n");
    1016:	c7 44 24 04 61 18 00 	movl   $0x1861,0x4(%esp)
    101d:	00 
  memset(data, 'a', sizeof(data));
    101e:	8d 74 24 20          	lea    0x20(%esp),%esi
  printf(1, "stressfs starting\n");
    1022:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  char path[] = "stressfs0";
    1029:	66 89 44 24 1e       	mov    %ax,0x1e(%esp)
    102e:	c7 44 24 16 73 74 72 	movl   $0x65727473,0x16(%esp)
    1035:	65 
    1036:	c7 44 24 1a 73 73 66 	movl   $0x73667373,0x1a(%esp)
    103d:	73 
  printf(1, "stressfs starting\n");
    103e:	e8 7d 04 00 00       	call   14c0 <printf>
  memset(data, 'a', sizeof(data));
    1043:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    104a:	00 
    104b:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
    1052:	00 
    1053:	89 34 24             	mov    %esi,(%esp)
    1056:	e8 95 01 00 00       	call   11f0 <memset>
    if(fork() > 0)
    105b:	e8 fa 02 00 00       	call   135a <fork>
    1060:	85 c0                	test   %eax,%eax
    1062:	0f 8f c3 00 00 00    	jg     112b <main+0x12b>
  for(i = 0; i < 4; i++)
    1068:	83 c3 01             	add    $0x1,%ebx
    106b:	83 fb 04             	cmp    $0x4,%ebx
    106e:	75 eb                	jne    105b <main+0x5b>
    1070:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
    1075:	89 5c 24 08          	mov    %ebx,0x8(%esp)

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
    1079:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
    107e:	c7 44 24 04 74 18 00 	movl   $0x1874,0x4(%esp)
    1085:	00 
    1086:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    108d:	e8 2e 04 00 00       	call   14c0 <printf>
  path[8] += i;
    1092:	89 f8                	mov    %edi,%eax
    1094:	00 44 24 1e          	add    %al,0x1e(%esp)
  fd = open(path, O_CREATE | O_RDWR);
    1098:	8d 44 24 16          	lea    0x16(%esp),%eax
    109c:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    10a3:	00 
    10a4:	89 04 24             	mov    %eax,(%esp)
    10a7:	e8 f6 02 00 00       	call   13a2 <open>
    10ac:	89 c7                	mov    %eax,%edi
    10ae:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
    10b0:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    10b7:	00 
    10b8:	89 74 24 04          	mov    %esi,0x4(%esp)
    10bc:	89 3c 24             	mov    %edi,(%esp)
    10bf:	e8 be 02 00 00       	call   1382 <write>
  for(i = 0; i < 20; i++)
    10c4:	83 eb 01             	sub    $0x1,%ebx
    10c7:	75 e7                	jne    10b0 <main+0xb0>
  close(fd);
    10c9:	89 3c 24             	mov    %edi,(%esp)

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
    10cc:	bb 14 00 00 00       	mov    $0x14,%ebx
  close(fd);
    10d1:	e8 b4 02 00 00       	call   138a <close>
  printf(1, "read\n");
    10d6:	c7 44 24 04 7e 18 00 	movl   $0x187e,0x4(%esp)
    10dd:	00 
    10de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10e5:	e8 d6 03 00 00       	call   14c0 <printf>
  fd = open(path, O_RDONLY);
    10ea:	8d 44 24 16          	lea    0x16(%esp),%eax
    10ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10f5:	00 
    10f6:	89 04 24             	mov    %eax,(%esp)
    10f9:	e8 a4 02 00 00       	call   13a2 <open>
    10fe:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
    1100:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1107:	00 
    1108:	89 74 24 04          	mov    %esi,0x4(%esp)
    110c:	89 3c 24             	mov    %edi,(%esp)
    110f:	e8 66 02 00 00       	call   137a <read>
  for (i = 0; i < 20; i++)
    1114:	83 eb 01             	sub    $0x1,%ebx
    1117:	75 e7                	jne    1100 <main+0x100>
  close(fd);
    1119:	89 3c 24             	mov    %edi,(%esp)
    111c:	e8 69 02 00 00       	call   138a <close>

  wait();
    1121:	e8 44 02 00 00       	call   136a <wait>

  exit();
    1126:	e8 37 02 00 00       	call   1362 <exit>
    112b:	89 df                	mov    %ebx,%edi
    112d:	8d 76 00             	lea    0x0(%esi),%esi
    1130:	e9 40 ff ff ff       	jmp    1075 <main+0x75>
    1135:	66 90                	xchg   %ax,%ax
    1137:	66 90                	xchg   %ax,%ax
    1139:	66 90                	xchg   %ax,%ax
    113b:	66 90                	xchg   %ax,%ax
    113d:	66 90                	xchg   %ax,%ax
    113f:	90                   	nop

00001140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	8b 45 08             	mov    0x8(%ebp),%eax
    1146:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1149:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    114a:	89 c2                	mov    %eax,%edx
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1150:	83 c1 01             	add    $0x1,%ecx
    1153:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1157:	83 c2 01             	add    $0x1,%edx
    115a:	84 db                	test   %bl,%bl
    115c:	88 5a ff             	mov    %bl,-0x1(%edx)
    115f:	75 ef                	jne    1150 <strcpy+0x10>
    ;
  return os;
}
    1161:	5b                   	pop    %ebx
    1162:	5d                   	pop    %ebp
    1163:	c3                   	ret    
    1164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    116a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	8b 55 08             	mov    0x8(%ebp),%edx
    1176:	53                   	push   %ebx
    1177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    117a:	0f b6 02             	movzbl (%edx),%eax
    117d:	84 c0                	test   %al,%al
    117f:	74 2d                	je     11ae <strcmp+0x3e>
    1181:	0f b6 19             	movzbl (%ecx),%ebx
    1184:	38 d8                	cmp    %bl,%al
    1186:	74 0e                	je     1196 <strcmp+0x26>
    1188:	eb 2b                	jmp    11b5 <strcmp+0x45>
    118a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1190:	38 c8                	cmp    %cl,%al
    1192:	75 15                	jne    11a9 <strcmp+0x39>
    p++, q++;
    1194:	89 d9                	mov    %ebx,%ecx
    1196:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1199:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    119c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    119f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    11a3:	84 c0                	test   %al,%al
    11a5:	75 e9                	jne    1190 <strcmp+0x20>
    11a7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    11a9:	29 c8                	sub    %ecx,%eax
}
    11ab:	5b                   	pop    %ebx
    11ac:	5d                   	pop    %ebp
    11ad:	c3                   	ret    
    11ae:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    11b1:	31 c0                	xor    %eax,%eax
    11b3:	eb f4                	jmp    11a9 <strcmp+0x39>
    11b5:	0f b6 cb             	movzbl %bl,%ecx
    11b8:	eb ef                	jmp    11a9 <strcmp+0x39>
    11ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000011c0 <strlen>:

uint
strlen(char *s)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    11c6:	80 39 00             	cmpb   $0x0,(%ecx)
    11c9:	74 12                	je     11dd <strlen+0x1d>
    11cb:	31 d2                	xor    %edx,%edx
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
    11d0:	83 c2 01             	add    $0x1,%edx
    11d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11d7:	89 d0                	mov    %edx,%eax
    11d9:	75 f5                	jne    11d0 <strlen+0x10>
    ;
  return n;
}
    11db:	5d                   	pop    %ebp
    11dc:	c3                   	ret    
  for(n = 0; s[n]; n++)
    11dd:	31 c0                	xor    %eax,%eax
}
    11df:	5d                   	pop    %ebp
    11e0:	c3                   	ret    
    11e1:	eb 0d                	jmp    11f0 <memset>
    11e3:	90                   	nop
    11e4:	90                   	nop
    11e5:	90                   	nop
    11e6:	90                   	nop
    11e7:	90                   	nop
    11e8:	90                   	nop
    11e9:	90                   	nop
    11ea:	90                   	nop
    11eb:	90                   	nop
    11ec:	90                   	nop
    11ed:	90                   	nop
    11ee:	90                   	nop
    11ef:	90                   	nop

000011f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	8b 55 08             	mov    0x8(%ebp),%edx
    11f6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    11fd:	89 d7                	mov    %edx,%edi
    11ff:	fc                   	cld    
    1200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1202:	89 d0                	mov    %edx,%eax
    1204:	5f                   	pop    %edi
    1205:	5d                   	pop    %ebp
    1206:	c3                   	ret    
    1207:	89 f6                	mov    %esi,%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <strchr>:

char*
strchr(const char *s, char c)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	8b 45 08             	mov    0x8(%ebp),%eax
    1216:	53                   	push   %ebx
    1217:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    121a:	0f b6 18             	movzbl (%eax),%ebx
    121d:	84 db                	test   %bl,%bl
    121f:	74 1d                	je     123e <strchr+0x2e>
    if(*s == c)
    1221:	38 d3                	cmp    %dl,%bl
    1223:	89 d1                	mov    %edx,%ecx
    1225:	75 0d                	jne    1234 <strchr+0x24>
    1227:	eb 17                	jmp    1240 <strchr+0x30>
    1229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1230:	38 ca                	cmp    %cl,%dl
    1232:	74 0c                	je     1240 <strchr+0x30>
  for(; *s; s++)
    1234:	83 c0 01             	add    $0x1,%eax
    1237:	0f b6 10             	movzbl (%eax),%edx
    123a:	84 d2                	test   %dl,%dl
    123c:	75 f2                	jne    1230 <strchr+0x20>
      return (char*)s;
  return 0;
    123e:	31 c0                	xor    %eax,%eax
}
    1240:	5b                   	pop    %ebx
    1241:	5d                   	pop    %ebp
    1242:	c3                   	ret    
    1243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <gets>:

char*
gets(char *buf, int max)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	57                   	push   %edi
    1254:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1255:	31 f6                	xor    %esi,%esi
{
    1257:	53                   	push   %ebx
    1258:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    125b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    125e:	eb 31                	jmp    1291 <gets+0x41>
    cc = read(0, &c, 1);
    1260:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1267:	00 
    1268:	89 7c 24 04          	mov    %edi,0x4(%esp)
    126c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1273:	e8 02 01 00 00       	call   137a <read>
    if(cc < 1)
    1278:	85 c0                	test   %eax,%eax
    127a:	7e 1d                	jle    1299 <gets+0x49>
      break;
    buf[i++] = c;
    127c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    1280:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    1282:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1285:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    1287:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    128b:	74 0c                	je     1299 <gets+0x49>
    128d:	3c 0a                	cmp    $0xa,%al
    128f:	74 08                	je     1299 <gets+0x49>
  for(i=0; i+1 < max; ){
    1291:	8d 5e 01             	lea    0x1(%esi),%ebx
    1294:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1297:	7c c7                	jl     1260 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1299:	8b 45 08             	mov    0x8(%ebp),%eax
    129c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    12a0:	83 c4 2c             	add    $0x2c,%esp
    12a3:	5b                   	pop    %ebx
    12a4:	5e                   	pop    %esi
    12a5:	5f                   	pop    %edi
    12a6:	5d                   	pop    %ebp
    12a7:	c3                   	ret    
    12a8:	90                   	nop
    12a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012b0 <stat>:

int
stat(char *n, struct stat *st)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	56                   	push   %esi
    12b4:	53                   	push   %ebx
    12b5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12b8:	8b 45 08             	mov    0x8(%ebp),%eax
    12bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12c2:	00 
    12c3:	89 04 24             	mov    %eax,(%esp)
    12c6:	e8 d7 00 00 00       	call   13a2 <open>
  if(fd < 0)
    12cb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    12cd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    12cf:	78 27                	js     12f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    12d1:	8b 45 0c             	mov    0xc(%ebp),%eax
    12d4:	89 1c 24             	mov    %ebx,(%esp)
    12d7:	89 44 24 04          	mov    %eax,0x4(%esp)
    12db:	e8 da 00 00 00       	call   13ba <fstat>
  close(fd);
    12e0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12e3:	89 c6                	mov    %eax,%esi
  close(fd);
    12e5:	e8 a0 00 00 00       	call   138a <close>
  return r;
    12ea:	89 f0                	mov    %esi,%eax
}
    12ec:	83 c4 10             	add    $0x10,%esp
    12ef:	5b                   	pop    %ebx
    12f0:	5e                   	pop    %esi
    12f1:	5d                   	pop    %ebp
    12f2:	c3                   	ret    
    12f3:	90                   	nop
    12f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    12f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12fd:	eb ed                	jmp    12ec <stat+0x3c>
    12ff:	90                   	nop

00001300 <atoi>:

int
atoi(const char *s)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1306:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1307:	0f be 11             	movsbl (%ecx),%edx
    130a:	8d 42 d0             	lea    -0x30(%edx),%eax
    130d:	3c 09                	cmp    $0x9,%al
  n = 0;
    130f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1314:	77 17                	ja     132d <atoi+0x2d>
    1316:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1318:	83 c1 01             	add    $0x1,%ecx
    131b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    131e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1322:	0f be 11             	movsbl (%ecx),%edx
    1325:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1328:	80 fb 09             	cmp    $0x9,%bl
    132b:	76 eb                	jbe    1318 <atoi+0x18>
  return n;
}
    132d:	5b                   	pop    %ebx
    132e:	5d                   	pop    %ebp
    132f:	c3                   	ret    

00001330 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1330:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1331:	31 d2                	xor    %edx,%edx
{
    1333:	89 e5                	mov    %esp,%ebp
    1335:	56                   	push   %esi
    1336:	8b 45 08             	mov    0x8(%ebp),%eax
    1339:	53                   	push   %ebx
    133a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    133d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1340:	85 db                	test   %ebx,%ebx
    1342:	7e 12                	jle    1356 <memmove+0x26>
    1344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1348:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    134c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    134f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1352:	39 da                	cmp    %ebx,%edx
    1354:	75 f2                	jne    1348 <memmove+0x18>
  return vdst;
}
    1356:	5b                   	pop    %ebx
    1357:	5e                   	pop    %esi
    1358:	5d                   	pop    %ebp
    1359:	c3                   	ret    

0000135a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    135a:	b8 01 00 00 00       	mov    $0x1,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <exit>:
SYSCALL(exit)
    1362:	b8 02 00 00 00       	mov    $0x2,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <wait>:
SYSCALL(wait)
    136a:	b8 03 00 00 00       	mov    $0x3,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <pipe>:
SYSCALL(pipe)
    1372:	b8 04 00 00 00       	mov    $0x4,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <read>:
SYSCALL(read)
    137a:	b8 05 00 00 00       	mov    $0x5,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <write>:
SYSCALL(write)
    1382:	b8 10 00 00 00       	mov    $0x10,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <close>:
SYSCALL(close)
    138a:	b8 15 00 00 00       	mov    $0x15,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <kill>:
SYSCALL(kill)
    1392:	b8 06 00 00 00       	mov    $0x6,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <exec>:
SYSCALL(exec)
    139a:	b8 07 00 00 00       	mov    $0x7,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <open>:
SYSCALL(open)
    13a2:	b8 0f 00 00 00       	mov    $0xf,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <mknod>:
SYSCALL(mknod)
    13aa:	b8 11 00 00 00       	mov    $0x11,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <unlink>:
SYSCALL(unlink)
    13b2:	b8 12 00 00 00       	mov    $0x12,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <fstat>:
SYSCALL(fstat)
    13ba:	b8 08 00 00 00       	mov    $0x8,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <link>:
SYSCALL(link)
    13c2:	b8 13 00 00 00       	mov    $0x13,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <mkdir>:
SYSCALL(mkdir)
    13ca:	b8 14 00 00 00       	mov    $0x14,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <chdir>:
SYSCALL(chdir)
    13d2:	b8 09 00 00 00       	mov    $0x9,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <dup>:
SYSCALL(dup)
    13da:	b8 0a 00 00 00       	mov    $0xa,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <getpid>:
SYSCALL(getpid)
    13e2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <sbrk>:
SYSCALL(sbrk)
    13ea:	b8 0c 00 00 00       	mov    $0xc,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <sleep>:
SYSCALL(sleep)
    13f2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <uptime>:
SYSCALL(uptime)
    13fa:	b8 0e 00 00 00       	mov    $0xe,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    

00001402 <shm_open>:
SYSCALL(shm_open)
    1402:	b8 16 00 00 00       	mov    $0x16,%eax
    1407:	cd 40                	int    $0x40
    1409:	c3                   	ret    

0000140a <shm_close>:
SYSCALL(shm_close)	
    140a:	b8 17 00 00 00       	mov    $0x17,%eax
    140f:	cd 40                	int    $0x40
    1411:	c3                   	ret    
    1412:	66 90                	xchg   %ax,%ax
    1414:	66 90                	xchg   %ax,%ax
    1416:	66 90                	xchg   %ax,%ax
    1418:	66 90                	xchg   %ax,%ax
    141a:	66 90                	xchg   %ax,%ax
    141c:	66 90                	xchg   %ax,%ax
    141e:	66 90                	xchg   %ax,%ax

00001420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
    1425:	89 c6                	mov    %eax,%esi
    1427:	53                   	push   %ebx
    1428:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    142b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    142e:	85 db                	test   %ebx,%ebx
    1430:	74 09                	je     143b <printint+0x1b>
    1432:	89 d0                	mov    %edx,%eax
    1434:	c1 e8 1f             	shr    $0x1f,%eax
    1437:	84 c0                	test   %al,%al
    1439:	75 75                	jne    14b0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    143b:	89 d0                	mov    %edx,%eax
  neg = 0;
    143d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1444:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1447:	31 ff                	xor    %edi,%edi
    1449:	89 ce                	mov    %ecx,%esi
    144b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    144e:	eb 02                	jmp    1452 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1450:	89 cf                	mov    %ecx,%edi
    1452:	31 d2                	xor    %edx,%edx
    1454:	f7 f6                	div    %esi
    1456:	8d 4f 01             	lea    0x1(%edi),%ecx
    1459:	0f b6 92 8b 18 00 00 	movzbl 0x188b(%edx),%edx
  }while((x /= base) != 0);
    1460:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1462:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1465:	75 e9                	jne    1450 <printint+0x30>
  if(neg)
    1467:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    146a:	89 c8                	mov    %ecx,%eax
    146c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    146f:	85 d2                	test   %edx,%edx
    1471:	74 08                	je     147b <printint+0x5b>
    buf[i++] = '-';
    1473:	8d 4f 02             	lea    0x2(%edi),%ecx
    1476:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    147b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    147e:	66 90                	xchg   %ax,%ax
    1480:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1485:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    1488:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    148f:	00 
    1490:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1494:	89 34 24             	mov    %esi,(%esp)
    1497:	88 45 d7             	mov    %al,-0x29(%ebp)
    149a:	e8 e3 fe ff ff       	call   1382 <write>
  while(--i >= 0)
    149f:	83 ff ff             	cmp    $0xffffffff,%edi
    14a2:	75 dc                	jne    1480 <printint+0x60>
    putc(fd, buf[i]);
}
    14a4:	83 c4 4c             	add    $0x4c,%esp
    14a7:	5b                   	pop    %ebx
    14a8:	5e                   	pop    %esi
    14a9:	5f                   	pop    %edi
    14aa:	5d                   	pop    %ebp
    14ab:	c3                   	ret    
    14ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    14b0:	89 d0                	mov    %edx,%eax
    14b2:	f7 d8                	neg    %eax
    neg = 1;
    14b4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    14bb:	eb 87                	jmp    1444 <printint+0x24>
    14bd:	8d 76 00             	lea    0x0(%esi),%esi

000014c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14c0:	55                   	push   %ebp
    14c1:	89 e5                	mov    %esp,%ebp
    14c3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    14c4:	31 ff                	xor    %edi,%edi
{
    14c6:	56                   	push   %esi
    14c7:	53                   	push   %ebx
    14c8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14cb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    14ce:	8d 45 10             	lea    0x10(%ebp),%eax
{
    14d1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    14d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    14d7:	0f b6 13             	movzbl (%ebx),%edx
    14da:	83 c3 01             	add    $0x1,%ebx
    14dd:	84 d2                	test   %dl,%dl
    14df:	75 39                	jne    151a <printf+0x5a>
    14e1:	e9 c2 00 00 00       	jmp    15a8 <printf+0xe8>
    14e6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14e8:	83 fa 25             	cmp    $0x25,%edx
    14eb:	0f 84 bf 00 00 00    	je     15b0 <printf+0xf0>
  write(fd, &c, 1);
    14f1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14f4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14fb:	00 
    14fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    1500:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    1503:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    1506:	e8 77 fe ff ff       	call   1382 <write>
    150b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    150e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1512:	84 d2                	test   %dl,%dl
    1514:	0f 84 8e 00 00 00    	je     15a8 <printf+0xe8>
    if(state == 0){
    151a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    151c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    151f:	74 c7                	je     14e8 <printf+0x28>
      }
    } else if(state == '%'){
    1521:	83 ff 25             	cmp    $0x25,%edi
    1524:	75 e5                	jne    150b <printf+0x4b>
      if(c == 'd'){
    1526:	83 fa 64             	cmp    $0x64,%edx
    1529:	0f 84 31 01 00 00    	je     1660 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    152f:	25 f7 00 00 00       	and    $0xf7,%eax
    1534:	83 f8 70             	cmp    $0x70,%eax
    1537:	0f 84 83 00 00 00    	je     15c0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    153d:	83 fa 73             	cmp    $0x73,%edx
    1540:	0f 84 a2 00 00 00    	je     15e8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1546:	83 fa 63             	cmp    $0x63,%edx
    1549:	0f 84 35 01 00 00    	je     1684 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    154f:	83 fa 25             	cmp    $0x25,%edx
    1552:	0f 84 e0 00 00 00    	je     1638 <printf+0x178>
  write(fd, &c, 1);
    1558:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    155b:	83 c3 01             	add    $0x1,%ebx
    155e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1565:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1566:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1568:	89 44 24 04          	mov    %eax,0x4(%esp)
    156c:	89 34 24             	mov    %esi,(%esp)
    156f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1572:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1576:	e8 07 fe ff ff       	call   1382 <write>
        putc(fd, c);
    157b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    157e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1581:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1588:	00 
    1589:	89 44 24 04          	mov    %eax,0x4(%esp)
    158d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    1590:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    1593:	e8 ea fd ff ff       	call   1382 <write>
  for(i = 0; fmt[i]; i++){
    1598:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    159c:	84 d2                	test   %dl,%dl
    159e:	0f 85 76 ff ff ff    	jne    151a <printf+0x5a>
    15a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    15a8:	83 c4 3c             	add    $0x3c,%esp
    15ab:	5b                   	pop    %ebx
    15ac:	5e                   	pop    %esi
    15ad:	5f                   	pop    %edi
    15ae:	5d                   	pop    %ebp
    15af:	c3                   	ret    
        state = '%';
    15b0:	bf 25 00 00 00       	mov    $0x25,%edi
    15b5:	e9 51 ff ff ff       	jmp    150b <printf+0x4b>
    15ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    15c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15c3:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    15c8:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    15ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15d1:	8b 10                	mov    (%eax),%edx
    15d3:	89 f0                	mov    %esi,%eax
    15d5:	e8 46 fe ff ff       	call   1420 <printint>
        ap++;
    15da:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15de:	e9 28 ff ff ff       	jmp    150b <printf+0x4b>
    15e3:	90                   	nop
    15e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    15eb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    15ef:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    15f1:	b8 84 18 00 00       	mov    $0x1884,%eax
    15f6:	85 ff                	test   %edi,%edi
    15f8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    15fb:	0f b6 07             	movzbl (%edi),%eax
    15fe:	84 c0                	test   %al,%al
    1600:	74 2a                	je     162c <printf+0x16c>
    1602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1608:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    160b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    160e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    1611:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1618:	00 
    1619:	89 44 24 04          	mov    %eax,0x4(%esp)
    161d:	89 34 24             	mov    %esi,(%esp)
    1620:	e8 5d fd ff ff       	call   1382 <write>
        while(*s != 0){
    1625:	0f b6 07             	movzbl (%edi),%eax
    1628:	84 c0                	test   %al,%al
    162a:	75 dc                	jne    1608 <printf+0x148>
      state = 0;
    162c:	31 ff                	xor    %edi,%edi
    162e:	e9 d8 fe ff ff       	jmp    150b <printf+0x4b>
    1633:	90                   	nop
    1634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1638:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    163b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    163d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1644:	00 
    1645:	89 44 24 04          	mov    %eax,0x4(%esp)
    1649:	89 34 24             	mov    %esi,(%esp)
    164c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1650:	e8 2d fd ff ff       	call   1382 <write>
    1655:	e9 b1 fe ff ff       	jmp    150b <printf+0x4b>
    165a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1660:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1663:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    1668:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    166b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1672:	8b 10                	mov    (%eax),%edx
    1674:	89 f0                	mov    %esi,%eax
    1676:	e8 a5 fd ff ff       	call   1420 <printint>
        ap++;
    167b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    167f:	e9 87 fe ff ff       	jmp    150b <printf+0x4b>
        putc(fd, *ap);
    1684:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    1687:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    1689:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    168b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1692:	00 
    1693:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    1696:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    1699:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    169c:	89 44 24 04          	mov    %eax,0x4(%esp)
    16a0:	e8 dd fc ff ff       	call   1382 <write>
        ap++;
    16a5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    16a9:	e9 5d fe ff ff       	jmp    150b <printf+0x4b>
    16ae:	66 90                	xchg   %ax,%ax

000016b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b1:	a1 44 1b 00 00       	mov    0x1b44,%eax
{
    16b6:	89 e5                	mov    %esp,%ebp
    16b8:	57                   	push   %edi
    16b9:	56                   	push   %esi
    16ba:	53                   	push   %ebx
    16bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16be:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    16c0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16c3:	39 d0                	cmp    %edx,%eax
    16c5:	72 11                	jb     16d8 <free+0x28>
    16c7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16c8:	39 c8                	cmp    %ecx,%eax
    16ca:	72 04                	jb     16d0 <free+0x20>
    16cc:	39 ca                	cmp    %ecx,%edx
    16ce:	72 10                	jb     16e0 <free+0x30>
    16d0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16d2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16d4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16d6:	73 f0                	jae    16c8 <free+0x18>
    16d8:	39 ca                	cmp    %ecx,%edx
    16da:	72 04                	jb     16e0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16dc:	39 c8                	cmp    %ecx,%eax
    16de:	72 f0                	jb     16d0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16e0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16e3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    16e6:	39 cf                	cmp    %ecx,%edi
    16e8:	74 1e                	je     1708 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16ea:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16ed:	8b 48 04             	mov    0x4(%eax),%ecx
    16f0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    16f3:	39 f2                	cmp    %esi,%edx
    16f5:	74 28                	je     171f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16f7:	89 10                	mov    %edx,(%eax)
  freep = p;
    16f9:	a3 44 1b 00 00       	mov    %eax,0x1b44
}
    16fe:	5b                   	pop    %ebx
    16ff:	5e                   	pop    %esi
    1700:	5f                   	pop    %edi
    1701:	5d                   	pop    %ebp
    1702:	c3                   	ret    
    1703:	90                   	nop
    1704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1708:	03 71 04             	add    0x4(%ecx),%esi
    170b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    170e:	8b 08                	mov    (%eax),%ecx
    1710:	8b 09                	mov    (%ecx),%ecx
    1712:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1715:	8b 48 04             	mov    0x4(%eax),%ecx
    1718:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    171b:	39 f2                	cmp    %esi,%edx
    171d:	75 d8                	jne    16f7 <free+0x47>
    p->s.size += bp->s.size;
    171f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    1722:	a3 44 1b 00 00       	mov    %eax,0x1b44
    p->s.size += bp->s.size;
    1727:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    172a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    172d:	89 10                	mov    %edx,(%eax)
}
    172f:	5b                   	pop    %ebx
    1730:	5e                   	pop    %esi
    1731:	5f                   	pop    %edi
    1732:	5d                   	pop    %ebp
    1733:	c3                   	ret    
    1734:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    173a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1740:	55                   	push   %ebp
    1741:	89 e5                	mov    %esp,%ebp
    1743:	57                   	push   %edi
    1744:	56                   	push   %esi
    1745:	53                   	push   %ebx
    1746:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1749:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    174c:	8b 1d 44 1b 00 00    	mov    0x1b44,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1752:	8d 48 07             	lea    0x7(%eax),%ecx
    1755:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1758:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    175a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    175d:	0f 84 9b 00 00 00    	je     17fe <malloc+0xbe>
    1763:	8b 13                	mov    (%ebx),%edx
    1765:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1768:	39 fe                	cmp    %edi,%esi
    176a:	76 64                	jbe    17d0 <malloc+0x90>
    176c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    1773:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1778:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    177b:	eb 0e                	jmp    178b <malloc+0x4b>
    177d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1780:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1782:	8b 78 04             	mov    0x4(%eax),%edi
    1785:	39 fe                	cmp    %edi,%esi
    1787:	76 4f                	jbe    17d8 <malloc+0x98>
    1789:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    178b:	3b 15 44 1b 00 00    	cmp    0x1b44,%edx
    1791:	75 ed                	jne    1780 <malloc+0x40>
  if(nu < 4096)
    1793:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1796:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    179c:	bf 00 10 00 00       	mov    $0x1000,%edi
    17a1:	0f 43 fe             	cmovae %esi,%edi
    17a4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    17a7:	89 04 24             	mov    %eax,(%esp)
    17aa:	e8 3b fc ff ff       	call   13ea <sbrk>
  if(p == (char*)-1)
    17af:	83 f8 ff             	cmp    $0xffffffff,%eax
    17b2:	74 18                	je     17cc <malloc+0x8c>
  hp->s.size = nu;
    17b4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    17b7:	83 c0 08             	add    $0x8,%eax
    17ba:	89 04 24             	mov    %eax,(%esp)
    17bd:	e8 ee fe ff ff       	call   16b0 <free>
  return freep;
    17c2:	8b 15 44 1b 00 00    	mov    0x1b44,%edx
      if((p = morecore(nunits)) == 0)
    17c8:	85 d2                	test   %edx,%edx
    17ca:	75 b4                	jne    1780 <malloc+0x40>
        return 0;
    17cc:	31 c0                	xor    %eax,%eax
    17ce:	eb 20                	jmp    17f0 <malloc+0xb0>
    if(p->s.size >= nunits){
    17d0:	89 d0                	mov    %edx,%eax
    17d2:	89 da                	mov    %ebx,%edx
    17d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    17d8:	39 fe                	cmp    %edi,%esi
    17da:	74 1c                	je     17f8 <malloc+0xb8>
        p->s.size -= nunits;
    17dc:	29 f7                	sub    %esi,%edi
    17de:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    17e1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    17e4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    17e7:	89 15 44 1b 00 00    	mov    %edx,0x1b44
      return (void*)(p + 1);
    17ed:	83 c0 08             	add    $0x8,%eax
  }
}
    17f0:	83 c4 1c             	add    $0x1c,%esp
    17f3:	5b                   	pop    %ebx
    17f4:	5e                   	pop    %esi
    17f5:	5f                   	pop    %edi
    17f6:	5d                   	pop    %ebp
    17f7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    17f8:	8b 08                	mov    (%eax),%ecx
    17fa:	89 0a                	mov    %ecx,(%edx)
    17fc:	eb e9                	jmp    17e7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    17fe:	c7 05 44 1b 00 00 48 	movl   $0x1b48,0x1b44
    1805:	1b 00 00 
    base.s.size = 0;
    1808:	ba 48 1b 00 00       	mov    $0x1b48,%edx
    base.s.ptr = freep = prevp = &base;
    180d:	c7 05 48 1b 00 00 48 	movl   $0x1b48,0x1b48
    1814:	1b 00 00 
    base.s.size = 0;
    1817:	c7 05 4c 1b 00 00 00 	movl   $0x0,0x1b4c
    181e:	00 00 00 
    1821:	e9 46 ff ff ff       	jmp    176c <malloc+0x2c>
    1826:	66 90                	xchg   %ax,%ax
    1828:	66 90                	xchg   %ax,%ax
    182a:	66 90                	xchg   %ax,%ax
    182c:	66 90                	xchg   %ax,%ax
    182e:	66 90                	xchg   %ax,%ax

00001830 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1830:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1831:	b9 01 00 00 00       	mov    $0x1,%ecx
    1836:	89 e5                	mov    %esp,%ebp
    1838:	8b 55 08             	mov    0x8(%ebp),%edx
    183b:	90                   	nop
    183c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1840:	89 c8                	mov    %ecx,%eax
    1842:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1845:	85 c0                	test   %eax,%eax
    1847:	75 f7                	jne    1840 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1849:	0f ae f0             	mfence 
}
    184c:	5d                   	pop    %ebp
    184d:	c3                   	ret    
    184e:	66 90                	xchg   %ax,%ax

00001850 <urelease>:

void urelease (struct uspinlock *lk) {
    1850:	55                   	push   %ebp
    1851:	89 e5                	mov    %esp,%ebp
    1853:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1856:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1859:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    185f:	5d                   	pop    %ebp
    1860:	c3                   	ret    
