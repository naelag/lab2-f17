
_cat:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  }
}

int
main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	57                   	push   %edi
    1004:	56                   	push   %esi
  int fd, i;

  if(argc <= 1){
    1005:	be 01 00 00 00       	mov    $0x1,%esi
{
    100a:	53                   	push   %ebx
    100b:	83 e4 f0             	and    $0xfffffff0,%esp
    100e:	83 ec 10             	sub    $0x10,%esp
    1011:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(argc <= 1){
    1014:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    1018:	8d 58 04             	lea    0x4(%eax),%ebx
    101b:	7e 5a                	jle    1077 <main+0x77>
    101d:	8d 76 00             	lea    0x0(%esi),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1020:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1027:	00 
    1028:	8b 03                	mov    (%ebx),%eax
    102a:	89 04 24             	mov    %eax,(%esp)
    102d:	e8 50 03 00 00       	call   1382 <open>
    1032:	85 c0                	test   %eax,%eax
    1034:	89 c7                	mov    %eax,%edi
    1036:	78 20                	js     1058 <main+0x58>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    1038:	89 04 24             	mov    %eax,(%esp)
  for(i = 1; i < argc; i++){
    103b:	83 c6 01             	add    $0x1,%esi
    103e:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
    1041:	e8 4a 00 00 00       	call   1090 <cat>
    close(fd);
    1046:	89 3c 24             	mov    %edi,(%esp)
    1049:	e8 1c 03 00 00       	call   136a <close>
  for(i = 1; i < argc; i++){
    104e:	3b 75 08             	cmp    0x8(%ebp),%esi
    1051:	75 cd                	jne    1020 <main+0x20>
  }
  exit();
    1053:	e8 ea 02 00 00       	call   1342 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
    1058:	8b 03                	mov    (%ebx),%eax
    105a:	c7 44 24 04 64 18 00 	movl   $0x1864,0x4(%esp)
    1061:	00 
    1062:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1069:	89 44 24 08          	mov    %eax,0x8(%esp)
    106d:	e8 2e 04 00 00       	call   14a0 <printf>
      exit();
    1072:	e8 cb 02 00 00       	call   1342 <exit>
    cat(0);
    1077:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    107e:	e8 0d 00 00 00       	call   1090 <cat>
    exit();
    1083:	e8 ba 02 00 00       	call   1342 <exit>
    1088:	66 90                	xchg   %ax,%ax
    108a:	66 90                	xchg   %ax,%ax
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <cat>:
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	56                   	push   %esi
    1094:	53                   	push   %ebx
    1095:	83 ec 10             	sub    $0x10,%esp
    1098:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    109b:	eb 1f                	jmp    10bc <cat+0x2c>
    109d:	8d 76 00             	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
    10a0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    10a4:	c7 44 24 04 a0 1b 00 	movl   $0x1ba0,0x4(%esp)
    10ab:	00 
    10ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10b3:	e8 aa 02 00 00       	call   1362 <write>
    10b8:	39 d8                	cmp    %ebx,%eax
    10ba:	75 28                	jne    10e4 <cat+0x54>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    10bc:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    10c3:	00 
    10c4:	c7 44 24 04 a0 1b 00 	movl   $0x1ba0,0x4(%esp)
    10cb:	00 
    10cc:	89 34 24             	mov    %esi,(%esp)
    10cf:	e8 86 02 00 00       	call   135a <read>
    10d4:	83 f8 00             	cmp    $0x0,%eax
    10d7:	89 c3                	mov    %eax,%ebx
    10d9:	7f c5                	jg     10a0 <cat+0x10>
  if(n < 0){
    10db:	75 20                	jne    10fd <cat+0x6d>
}
    10dd:	83 c4 10             	add    $0x10,%esp
    10e0:	5b                   	pop    %ebx
    10e1:	5e                   	pop    %esi
    10e2:	5d                   	pop    %ebp
    10e3:	c3                   	ret    
      printf(1, "cat: write error\n");
    10e4:	c7 44 24 04 41 18 00 	movl   $0x1841,0x4(%esp)
    10eb:	00 
    10ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10f3:	e8 a8 03 00 00       	call   14a0 <printf>
      exit();
    10f8:	e8 45 02 00 00       	call   1342 <exit>
    printf(1, "cat: read error\n");
    10fd:	c7 44 24 04 53 18 00 	movl   $0x1853,0x4(%esp)
    1104:	00 
    1105:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    110c:	e8 8f 03 00 00       	call   14a0 <printf>
    exit();
    1111:	e8 2c 02 00 00       	call   1342 <exit>
    1116:	66 90                	xchg   %ax,%ax
    1118:	66 90                	xchg   %ax,%ax
    111a:	66 90                	xchg   %ax,%ax
    111c:	66 90                	xchg   %ax,%ax
    111e:	66 90                	xchg   %ax,%ax

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
    13f2:	66 90                	xchg   %ax,%ax
    13f4:	66 90                	xchg   %ax,%ax
    13f6:	66 90                	xchg   %ax,%ax
    13f8:	66 90                	xchg   %ax,%ax
    13fa:	66 90                	xchg   %ax,%ax
    13fc:	66 90                	xchg   %ax,%ax
    13fe:	66 90                	xchg   %ax,%ax

00001400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
    1404:	56                   	push   %esi
    1405:	89 c6                	mov    %eax,%esi
    1407:	53                   	push   %ebx
    1408:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    140b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    140e:	85 db                	test   %ebx,%ebx
    1410:	74 09                	je     141b <printint+0x1b>
    1412:	89 d0                	mov    %edx,%eax
    1414:	c1 e8 1f             	shr    $0x1f,%eax
    1417:	84 c0                	test   %al,%al
    1419:	75 75                	jne    1490 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    141b:	89 d0                	mov    %edx,%eax
  neg = 0;
    141d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1424:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1427:	31 ff                	xor    %edi,%edi
    1429:	89 ce                	mov    %ecx,%esi
    142b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    142e:	eb 02                	jmp    1432 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1430:	89 cf                	mov    %ecx,%edi
    1432:	31 d2                	xor    %edx,%edx
    1434:	f7 f6                	div    %esi
    1436:	8d 4f 01             	lea    0x1(%edi),%ecx
    1439:	0f b6 92 80 18 00 00 	movzbl 0x1880(%edx),%edx
  }while((x /= base) != 0);
    1440:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1442:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1445:	75 e9                	jne    1430 <printint+0x30>
  if(neg)
    1447:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    144a:	89 c8                	mov    %ecx,%eax
    144c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    144f:	85 d2                	test   %edx,%edx
    1451:	74 08                	je     145b <printint+0x5b>
    buf[i++] = '-';
    1453:	8d 4f 02             	lea    0x2(%edi),%ecx
    1456:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    145b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    145e:	66 90                	xchg   %ax,%ax
    1460:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1465:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    1468:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    146f:	00 
    1470:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1474:	89 34 24             	mov    %esi,(%esp)
    1477:	88 45 d7             	mov    %al,-0x29(%ebp)
    147a:	e8 e3 fe ff ff       	call   1362 <write>
  while(--i >= 0)
    147f:	83 ff ff             	cmp    $0xffffffff,%edi
    1482:	75 dc                	jne    1460 <printint+0x60>
    putc(fd, buf[i]);
}
    1484:	83 c4 4c             	add    $0x4c,%esp
    1487:	5b                   	pop    %ebx
    1488:	5e                   	pop    %esi
    1489:	5f                   	pop    %edi
    148a:	5d                   	pop    %ebp
    148b:	c3                   	ret    
    148c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    1490:	89 d0                	mov    %edx,%eax
    1492:	f7 d8                	neg    %eax
    neg = 1;
    1494:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    149b:	eb 87                	jmp    1424 <printint+0x24>
    149d:	8d 76 00             	lea    0x0(%esi),%esi

000014a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    14a4:	31 ff                	xor    %edi,%edi
{
    14a6:	56                   	push   %esi
    14a7:	53                   	push   %ebx
    14a8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    14ae:	8d 45 10             	lea    0x10(%ebp),%eax
{
    14b1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    14b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    14b7:	0f b6 13             	movzbl (%ebx),%edx
    14ba:	83 c3 01             	add    $0x1,%ebx
    14bd:	84 d2                	test   %dl,%dl
    14bf:	75 39                	jne    14fa <printf+0x5a>
    14c1:	e9 c2 00 00 00       	jmp    1588 <printf+0xe8>
    14c6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14c8:	83 fa 25             	cmp    $0x25,%edx
    14cb:	0f 84 bf 00 00 00    	je     1590 <printf+0xf0>
  write(fd, &c, 1);
    14d1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14d4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14db:	00 
    14dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    14e0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    14e3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    14e6:	e8 77 fe ff ff       	call   1362 <write>
    14eb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    14ee:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    14f2:	84 d2                	test   %dl,%dl
    14f4:	0f 84 8e 00 00 00    	je     1588 <printf+0xe8>
    if(state == 0){
    14fa:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    14fc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    14ff:	74 c7                	je     14c8 <printf+0x28>
      }
    } else if(state == '%'){
    1501:	83 ff 25             	cmp    $0x25,%edi
    1504:	75 e5                	jne    14eb <printf+0x4b>
      if(c == 'd'){
    1506:	83 fa 64             	cmp    $0x64,%edx
    1509:	0f 84 31 01 00 00    	je     1640 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    150f:	25 f7 00 00 00       	and    $0xf7,%eax
    1514:	83 f8 70             	cmp    $0x70,%eax
    1517:	0f 84 83 00 00 00    	je     15a0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    151d:	83 fa 73             	cmp    $0x73,%edx
    1520:	0f 84 a2 00 00 00    	je     15c8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1526:	83 fa 63             	cmp    $0x63,%edx
    1529:	0f 84 35 01 00 00    	je     1664 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    152f:	83 fa 25             	cmp    $0x25,%edx
    1532:	0f 84 e0 00 00 00    	je     1618 <printf+0x178>
  write(fd, &c, 1);
    1538:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    153b:	83 c3 01             	add    $0x1,%ebx
    153e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1545:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1546:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1548:	89 44 24 04          	mov    %eax,0x4(%esp)
    154c:	89 34 24             	mov    %esi,(%esp)
    154f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1552:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1556:	e8 07 fe ff ff       	call   1362 <write>
        putc(fd, c);
    155b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    155e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1561:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1568:	00 
    1569:	89 44 24 04          	mov    %eax,0x4(%esp)
    156d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    1570:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    1573:	e8 ea fd ff ff       	call   1362 <write>
  for(i = 0; fmt[i]; i++){
    1578:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    157c:	84 d2                	test   %dl,%dl
    157e:	0f 85 76 ff ff ff    	jne    14fa <printf+0x5a>
    1584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    1588:	83 c4 3c             	add    $0x3c,%esp
    158b:	5b                   	pop    %ebx
    158c:	5e                   	pop    %esi
    158d:	5f                   	pop    %edi
    158e:	5d                   	pop    %ebp
    158f:	c3                   	ret    
        state = '%';
    1590:	bf 25 00 00 00       	mov    $0x25,%edi
    1595:	e9 51 ff ff ff       	jmp    14eb <printf+0x4b>
    159a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    15a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15a3:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    15a8:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    15aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15b1:	8b 10                	mov    (%eax),%edx
    15b3:	89 f0                	mov    %esi,%eax
    15b5:	e8 46 fe ff ff       	call   1400 <printint>
        ap++;
    15ba:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15be:	e9 28 ff ff ff       	jmp    14eb <printf+0x4b>
    15c3:	90                   	nop
    15c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    15c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    15cb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    15cf:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    15d1:	b8 79 18 00 00       	mov    $0x1879,%eax
    15d6:	85 ff                	test   %edi,%edi
    15d8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    15db:	0f b6 07             	movzbl (%edi),%eax
    15de:	84 c0                	test   %al,%al
    15e0:	74 2a                	je     160c <printf+0x16c>
    15e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    15e8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    15eb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    15ee:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    15f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15f8:	00 
    15f9:	89 44 24 04          	mov    %eax,0x4(%esp)
    15fd:	89 34 24             	mov    %esi,(%esp)
    1600:	e8 5d fd ff ff       	call   1362 <write>
        while(*s != 0){
    1605:	0f b6 07             	movzbl (%edi),%eax
    1608:	84 c0                	test   %al,%al
    160a:	75 dc                	jne    15e8 <printf+0x148>
      state = 0;
    160c:	31 ff                	xor    %edi,%edi
    160e:	e9 d8 fe ff ff       	jmp    14eb <printf+0x4b>
    1613:	90                   	nop
    1614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1618:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    161b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    161d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1624:	00 
    1625:	89 44 24 04          	mov    %eax,0x4(%esp)
    1629:	89 34 24             	mov    %esi,(%esp)
    162c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1630:	e8 2d fd ff ff       	call   1362 <write>
    1635:	e9 b1 fe ff ff       	jmp    14eb <printf+0x4b>
    163a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1640:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1643:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    1648:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    164b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1652:	8b 10                	mov    (%eax),%edx
    1654:	89 f0                	mov    %esi,%eax
    1656:	e8 a5 fd ff ff       	call   1400 <printint>
        ap++;
    165b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    165f:	e9 87 fe ff ff       	jmp    14eb <printf+0x4b>
        putc(fd, *ap);
    1664:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    1667:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    1669:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    166b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1672:	00 
    1673:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    1676:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    1679:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    167c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1680:	e8 dd fc ff ff       	call   1362 <write>
        ap++;
    1685:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1689:	e9 5d fe ff ff       	jmp    14eb <printf+0x4b>
    168e:	66 90                	xchg   %ax,%ax

00001690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1691:	a1 80 1b 00 00       	mov    0x1b80,%eax
{
    1696:	89 e5                	mov    %esp,%ebp
    1698:	57                   	push   %edi
    1699:	56                   	push   %esi
    169a:	53                   	push   %ebx
    169b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    169e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    16a0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a3:	39 d0                	cmp    %edx,%eax
    16a5:	72 11                	jb     16b8 <free+0x28>
    16a7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16a8:	39 c8                	cmp    %ecx,%eax
    16aa:	72 04                	jb     16b0 <free+0x20>
    16ac:	39 ca                	cmp    %ecx,%edx
    16ae:	72 10                	jb     16c0 <free+0x30>
    16b0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16b4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b6:	73 f0                	jae    16a8 <free+0x18>
    16b8:	39 ca                	cmp    %ecx,%edx
    16ba:	72 04                	jb     16c0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16bc:	39 c8                	cmp    %ecx,%eax
    16be:	72 f0                	jb     16b0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16c3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    16c6:	39 cf                	cmp    %ecx,%edi
    16c8:	74 1e                	je     16e8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16ca:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16cd:	8b 48 04             	mov    0x4(%eax),%ecx
    16d0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    16d3:	39 f2                	cmp    %esi,%edx
    16d5:	74 28                	je     16ff <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16d7:	89 10                	mov    %edx,(%eax)
  freep = p;
    16d9:	a3 80 1b 00 00       	mov    %eax,0x1b80
}
    16de:	5b                   	pop    %ebx
    16df:	5e                   	pop    %esi
    16e0:	5f                   	pop    %edi
    16e1:	5d                   	pop    %ebp
    16e2:	c3                   	ret    
    16e3:	90                   	nop
    16e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    16e8:	03 71 04             	add    0x4(%ecx),%esi
    16eb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16ee:	8b 08                	mov    (%eax),%ecx
    16f0:	8b 09                	mov    (%ecx),%ecx
    16f2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16f5:	8b 48 04             	mov    0x4(%eax),%ecx
    16f8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    16fb:	39 f2                	cmp    %esi,%edx
    16fd:	75 d8                	jne    16d7 <free+0x47>
    p->s.size += bp->s.size;
    16ff:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    1702:	a3 80 1b 00 00       	mov    %eax,0x1b80
    p->s.size += bp->s.size;
    1707:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    170a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    170d:	89 10                	mov    %edx,(%eax)
}
    170f:	5b                   	pop    %ebx
    1710:	5e                   	pop    %esi
    1711:	5f                   	pop    %edi
    1712:	5d                   	pop    %ebp
    1713:	c3                   	ret    
    1714:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    171a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1720:	55                   	push   %ebp
    1721:	89 e5                	mov    %esp,%ebp
    1723:	57                   	push   %edi
    1724:	56                   	push   %esi
    1725:	53                   	push   %ebx
    1726:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    172c:	8b 1d 80 1b 00 00    	mov    0x1b80,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1732:	8d 48 07             	lea    0x7(%eax),%ecx
    1735:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1738:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    173a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    173d:	0f 84 9b 00 00 00    	je     17de <malloc+0xbe>
    1743:	8b 13                	mov    (%ebx),%edx
    1745:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1748:	39 fe                	cmp    %edi,%esi
    174a:	76 64                	jbe    17b0 <malloc+0x90>
    174c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    1753:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1758:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    175b:	eb 0e                	jmp    176b <malloc+0x4b>
    175d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1760:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1762:	8b 78 04             	mov    0x4(%eax),%edi
    1765:	39 fe                	cmp    %edi,%esi
    1767:	76 4f                	jbe    17b8 <malloc+0x98>
    1769:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    176b:	3b 15 80 1b 00 00    	cmp    0x1b80,%edx
    1771:	75 ed                	jne    1760 <malloc+0x40>
  if(nu < 4096)
    1773:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1776:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    177c:	bf 00 10 00 00       	mov    $0x1000,%edi
    1781:	0f 43 fe             	cmovae %esi,%edi
    1784:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    1787:	89 04 24             	mov    %eax,(%esp)
    178a:	e8 3b fc ff ff       	call   13ca <sbrk>
  if(p == (char*)-1)
    178f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1792:	74 18                	je     17ac <malloc+0x8c>
  hp->s.size = nu;
    1794:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1797:	83 c0 08             	add    $0x8,%eax
    179a:	89 04 24             	mov    %eax,(%esp)
    179d:	e8 ee fe ff ff       	call   1690 <free>
  return freep;
    17a2:	8b 15 80 1b 00 00    	mov    0x1b80,%edx
      if((p = morecore(nunits)) == 0)
    17a8:	85 d2                	test   %edx,%edx
    17aa:	75 b4                	jne    1760 <malloc+0x40>
        return 0;
    17ac:	31 c0                	xor    %eax,%eax
    17ae:	eb 20                	jmp    17d0 <malloc+0xb0>
    if(p->s.size >= nunits){
    17b0:	89 d0                	mov    %edx,%eax
    17b2:	89 da                	mov    %ebx,%edx
    17b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    17b8:	39 fe                	cmp    %edi,%esi
    17ba:	74 1c                	je     17d8 <malloc+0xb8>
        p->s.size -= nunits;
    17bc:	29 f7                	sub    %esi,%edi
    17be:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    17c1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    17c4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    17c7:	89 15 80 1b 00 00    	mov    %edx,0x1b80
      return (void*)(p + 1);
    17cd:	83 c0 08             	add    $0x8,%eax
  }
}
    17d0:	83 c4 1c             	add    $0x1c,%esp
    17d3:	5b                   	pop    %ebx
    17d4:	5e                   	pop    %esi
    17d5:	5f                   	pop    %edi
    17d6:	5d                   	pop    %ebp
    17d7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    17d8:	8b 08                	mov    (%eax),%ecx
    17da:	89 0a                	mov    %ecx,(%edx)
    17dc:	eb e9                	jmp    17c7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    17de:	c7 05 80 1b 00 00 84 	movl   $0x1b84,0x1b80
    17e5:	1b 00 00 
    base.s.size = 0;
    17e8:	ba 84 1b 00 00       	mov    $0x1b84,%edx
    base.s.ptr = freep = prevp = &base;
    17ed:	c7 05 84 1b 00 00 84 	movl   $0x1b84,0x1b84
    17f4:	1b 00 00 
    base.s.size = 0;
    17f7:	c7 05 88 1b 00 00 00 	movl   $0x0,0x1b88
    17fe:	00 00 00 
    1801:	e9 46 ff ff ff       	jmp    174c <malloc+0x2c>
    1806:	66 90                	xchg   %ax,%ax
    1808:	66 90                	xchg   %ax,%ax
    180a:	66 90                	xchg   %ax,%ax
    180c:	66 90                	xchg   %ax,%ax
    180e:	66 90                	xchg   %ax,%ax

00001810 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1810:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1811:	b9 01 00 00 00       	mov    $0x1,%ecx
    1816:	89 e5                	mov    %esp,%ebp
    1818:	8b 55 08             	mov    0x8(%ebp),%edx
    181b:	90                   	nop
    181c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1820:	89 c8                	mov    %ecx,%eax
    1822:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1825:	85 c0                	test   %eax,%eax
    1827:	75 f7                	jne    1820 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1829:	0f ae f0             	mfence 
}
    182c:	5d                   	pop    %ebp
    182d:	c3                   	ret    
    182e:	66 90                	xchg   %ax,%ax

00001830 <urelease>:

void urelease (struct uspinlock *lk) {
    1830:	55                   	push   %ebp
    1831:	89 e5                	mov    %esp,%ebp
    1833:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1836:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1839:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    183f:	5d                   	pop    %ebp
    1840:	c3                   	ret    
