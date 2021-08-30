
_wc:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
    101b:	7e 60                	jle    107d <main+0x7d>
    101d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1020:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1027:	00 
    1028:	8b 03                	mov    (%ebx),%eax
    102a:	89 04 24             	mov    %eax,(%esp)
    102d:	e8 c0 03 00 00       	call   13f2 <open>
    1032:	85 c0                	test   %eax,%eax
    1034:	89 c7                	mov    %eax,%edi
    1036:	78 26                	js     105e <main+0x5e>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
    1038:	8b 13                	mov    (%ebx),%edx
  for(i = 1; i < argc; i++){
    103a:	83 c6 01             	add    $0x1,%esi
    103d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
    1040:	89 04 24             	mov    %eax,(%esp)
    1043:	89 54 24 04          	mov    %edx,0x4(%esp)
    1047:	e8 54 00 00 00       	call   10a0 <wc>
    close(fd);
    104c:	89 3c 24             	mov    %edi,(%esp)
    104f:	e8 86 03 00 00       	call   13da <close>
  for(i = 1; i < argc; i++){
    1054:	3b 75 08             	cmp    0x8(%ebp),%esi
    1057:	75 c7                	jne    1020 <main+0x20>
  }
  exit();
    1059:	e8 54 03 00 00       	call   13b2 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
    105e:	8b 03                	mov    (%ebx),%eax
    1060:	c7 44 24 04 d4 18 00 	movl   $0x18d4,0x4(%esp)
    1067:	00 
    1068:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    106f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1073:	e8 98 04 00 00       	call   1510 <printf>
      exit();
    1078:	e8 35 03 00 00       	call   13b2 <exit>
    wc(0, "");
    107d:	c7 44 24 04 c6 18 00 	movl   $0x18c6,0x4(%esp)
    1084:	00 
    1085:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    108c:	e8 0f 00 00 00       	call   10a0 <wc>
    exit();
    1091:	e8 1c 03 00 00       	call   13b2 <exit>
    1096:	66 90                	xchg   %ax,%ax
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <wc>:
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	57                   	push   %edi
    10a4:	56                   	push   %esi
  inword = 0;
    10a5:	31 f6                	xor    %esi,%esi
{
    10a7:	53                   	push   %ebx
  l = w = c = 0;
    10a8:	31 db                	xor    %ebx,%ebx
{
    10aa:	83 ec 3c             	sub    $0x3c,%esp
  l = w = c = 0;
    10ad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    10b4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    10bb:	90                   	nop
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
    10c0:	8b 45 08             	mov    0x8(%ebp),%eax
    10c3:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    10ca:	00 
    10cb:	c7 44 24 04 00 1c 00 	movl   $0x1c00,0x4(%esp)
    10d2:	00 
    10d3:	89 04 24             	mov    %eax,(%esp)
    10d6:	e8 ef 02 00 00       	call   13ca <read>
    10db:	83 f8 00             	cmp    $0x0,%eax
    10de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    10e1:	7e 54                	jle    1137 <wc+0x97>
    10e3:	31 ff                	xor    %edi,%edi
    10e5:	eb 0b                	jmp    10f2 <wc+0x52>
    10e7:	90                   	nop
        inword = 0;
    10e8:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
    10ea:	83 c7 01             	add    $0x1,%edi
    10ed:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
    10f0:	74 38                	je     112a <wc+0x8a>
      if(buf[i] == '\n')
    10f2:	0f be 87 00 1c 00 00 	movsbl 0x1c00(%edi),%eax
        l++;
    10f9:	31 c9                	xor    %ecx,%ecx
      if(strchr(" \r\t\n\v", buf[i]))
    10fb:	c7 04 24 b1 18 00 00 	movl   $0x18b1,(%esp)
        l++;
    1102:	3c 0a                	cmp    $0xa,%al
    1104:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
    1107:	89 44 24 04          	mov    %eax,0x4(%esp)
        l++;
    110b:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
    110d:	e8 4e 01 00 00       	call   1260 <strchr>
    1112:	85 c0                	test   %eax,%eax
    1114:	75 d2                	jne    10e8 <wc+0x48>
      else if(!inword){
    1116:	85 f6                	test   %esi,%esi
    1118:	75 16                	jne    1130 <wc+0x90>
        w++;
    111a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    for(i=0; i<n; i++){
    111e:	83 c7 01             	add    $0x1,%edi
    1121:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
        inword = 1;
    1124:	66 be 01 00          	mov    $0x1,%si
    for(i=0; i<n; i++){
    1128:	75 c8                	jne    10f2 <wc+0x52>
    112a:	01 7d dc             	add    %edi,-0x24(%ebp)
    112d:	eb 91                	jmp    10c0 <wc+0x20>
    112f:	90                   	nop
    1130:	be 01 00 00 00       	mov    $0x1,%esi
    1135:	eb b3                	jmp    10ea <wc+0x4a>
  if(n < 0){
    1137:	75 35                	jne    116e <wc+0xce>
  printf(1, "%d %d %d %s\n", l, w, c, name);
    1139:	8b 45 0c             	mov    0xc(%ebp),%eax
    113c:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    1140:	c7 44 24 04 c7 18 00 	movl   $0x18c7,0x4(%esp)
    1147:	00 
    1148:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    114f:	89 44 24 14          	mov    %eax,0x14(%esp)
    1153:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1156:	89 44 24 10          	mov    %eax,0x10(%esp)
    115a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    115d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1161:	e8 aa 03 00 00       	call   1510 <printf>
}
    1166:	83 c4 3c             	add    $0x3c,%esp
    1169:	5b                   	pop    %ebx
    116a:	5e                   	pop    %esi
    116b:	5f                   	pop    %edi
    116c:	5d                   	pop    %ebp
    116d:	c3                   	ret    
    printf(1, "wc: read error\n");
    116e:	c7 44 24 04 b7 18 00 	movl   $0x18b7,0x4(%esp)
    1175:	00 
    1176:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    117d:	e8 8e 03 00 00       	call   1510 <printf>
    exit();
    1182:	e8 2b 02 00 00       	call   13b2 <exit>
    1187:	66 90                	xchg   %ax,%ax
    1189:	66 90                	xchg   %ax,%ax
    118b:	66 90                	xchg   %ax,%ax
    118d:	66 90                	xchg   %ax,%ax
    118f:	90                   	nop

00001190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	8b 45 08             	mov    0x8(%ebp),%eax
    1196:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1199:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    119a:	89 c2                	mov    %eax,%edx
    119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11a0:	83 c1 01             	add    $0x1,%ecx
    11a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    11a7:	83 c2 01             	add    $0x1,%edx
    11aa:	84 db                	test   %bl,%bl
    11ac:	88 5a ff             	mov    %bl,-0x1(%edx)
    11af:	75 ef                	jne    11a0 <strcpy+0x10>
    ;
  return os;
}
    11b1:	5b                   	pop    %ebx
    11b2:	5d                   	pop    %ebp
    11b3:	c3                   	ret    
    11b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	8b 55 08             	mov    0x8(%ebp),%edx
    11c6:	53                   	push   %ebx
    11c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    11ca:	0f b6 02             	movzbl (%edx),%eax
    11cd:	84 c0                	test   %al,%al
    11cf:	74 2d                	je     11fe <strcmp+0x3e>
    11d1:	0f b6 19             	movzbl (%ecx),%ebx
    11d4:	38 d8                	cmp    %bl,%al
    11d6:	74 0e                	je     11e6 <strcmp+0x26>
    11d8:	eb 2b                	jmp    1205 <strcmp+0x45>
    11da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11e0:	38 c8                	cmp    %cl,%al
    11e2:	75 15                	jne    11f9 <strcmp+0x39>
    p++, q++;
    11e4:	89 d9                	mov    %ebx,%ecx
    11e6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    11e9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    11ec:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    11ef:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    11f3:	84 c0                	test   %al,%al
    11f5:	75 e9                	jne    11e0 <strcmp+0x20>
    11f7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    11f9:	29 c8                	sub    %ecx,%eax
}
    11fb:	5b                   	pop    %ebx
    11fc:	5d                   	pop    %ebp
    11fd:	c3                   	ret    
    11fe:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    1201:	31 c0                	xor    %eax,%eax
    1203:	eb f4                	jmp    11f9 <strcmp+0x39>
    1205:	0f b6 cb             	movzbl %bl,%ecx
    1208:	eb ef                	jmp    11f9 <strcmp+0x39>
    120a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001210 <strlen>:

uint
strlen(char *s)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1216:	80 39 00             	cmpb   $0x0,(%ecx)
    1219:	74 12                	je     122d <strlen+0x1d>
    121b:	31 d2                	xor    %edx,%edx
    121d:	8d 76 00             	lea    0x0(%esi),%esi
    1220:	83 c2 01             	add    $0x1,%edx
    1223:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1227:	89 d0                	mov    %edx,%eax
    1229:	75 f5                	jne    1220 <strlen+0x10>
    ;
  return n;
}
    122b:	5d                   	pop    %ebp
    122c:	c3                   	ret    
  for(n = 0; s[n]; n++)
    122d:	31 c0                	xor    %eax,%eax
}
    122f:	5d                   	pop    %ebp
    1230:	c3                   	ret    
    1231:	eb 0d                	jmp    1240 <memset>
    1233:	90                   	nop
    1234:	90                   	nop
    1235:	90                   	nop
    1236:	90                   	nop
    1237:	90                   	nop
    1238:	90                   	nop
    1239:	90                   	nop
    123a:	90                   	nop
    123b:	90                   	nop
    123c:	90                   	nop
    123d:	90                   	nop
    123e:	90                   	nop
    123f:	90                   	nop

00001240 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	8b 55 08             	mov    0x8(%ebp),%edx
    1246:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1247:	8b 4d 10             	mov    0x10(%ebp),%ecx
    124a:	8b 45 0c             	mov    0xc(%ebp),%eax
    124d:	89 d7                	mov    %edx,%edi
    124f:	fc                   	cld    
    1250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1252:	89 d0                	mov    %edx,%eax
    1254:	5f                   	pop    %edi
    1255:	5d                   	pop    %ebp
    1256:	c3                   	ret    
    1257:	89 f6                	mov    %esi,%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001260 <strchr>:

char*
strchr(const char *s, char c)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	8b 45 08             	mov    0x8(%ebp),%eax
    1266:	53                   	push   %ebx
    1267:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    126a:	0f b6 18             	movzbl (%eax),%ebx
    126d:	84 db                	test   %bl,%bl
    126f:	74 1d                	je     128e <strchr+0x2e>
    if(*s == c)
    1271:	38 d3                	cmp    %dl,%bl
    1273:	89 d1                	mov    %edx,%ecx
    1275:	75 0d                	jne    1284 <strchr+0x24>
    1277:	eb 17                	jmp    1290 <strchr+0x30>
    1279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1280:	38 ca                	cmp    %cl,%dl
    1282:	74 0c                	je     1290 <strchr+0x30>
  for(; *s; s++)
    1284:	83 c0 01             	add    $0x1,%eax
    1287:	0f b6 10             	movzbl (%eax),%edx
    128a:	84 d2                	test   %dl,%dl
    128c:	75 f2                	jne    1280 <strchr+0x20>
      return (char*)s;
  return 0;
    128e:	31 c0                	xor    %eax,%eax
}
    1290:	5b                   	pop    %ebx
    1291:	5d                   	pop    %ebp
    1292:	c3                   	ret    
    1293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012a0 <gets>:

char*
gets(char *buf, int max)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12a5:	31 f6                	xor    %esi,%esi
{
    12a7:	53                   	push   %ebx
    12a8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    12ab:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    12ae:	eb 31                	jmp    12e1 <gets+0x41>
    cc = read(0, &c, 1);
    12b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    12b7:	00 
    12b8:	89 7c 24 04          	mov    %edi,0x4(%esp)
    12bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12c3:	e8 02 01 00 00       	call   13ca <read>
    if(cc < 1)
    12c8:	85 c0                	test   %eax,%eax
    12ca:	7e 1d                	jle    12e9 <gets+0x49>
      break;
    buf[i++] = c;
    12cc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    12d0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    12d2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    12d5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    12d7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    12db:	74 0c                	je     12e9 <gets+0x49>
    12dd:	3c 0a                	cmp    $0xa,%al
    12df:	74 08                	je     12e9 <gets+0x49>
  for(i=0; i+1 < max; ){
    12e1:	8d 5e 01             	lea    0x1(%esi),%ebx
    12e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    12e7:	7c c7                	jl     12b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    12e9:	8b 45 08             	mov    0x8(%ebp),%eax
    12ec:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    12f0:	83 c4 2c             	add    $0x2c,%esp
    12f3:	5b                   	pop    %ebx
    12f4:	5e                   	pop    %esi
    12f5:	5f                   	pop    %edi
    12f6:	5d                   	pop    %ebp
    12f7:	c3                   	ret    
    12f8:	90                   	nop
    12f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001300 <stat>:

int
stat(char *n, struct stat *st)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	56                   	push   %esi
    1304:	53                   	push   %ebx
    1305:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1308:	8b 45 08             	mov    0x8(%ebp),%eax
    130b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1312:	00 
    1313:	89 04 24             	mov    %eax,(%esp)
    1316:	e8 d7 00 00 00       	call   13f2 <open>
  if(fd < 0)
    131b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    131d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    131f:	78 27                	js     1348 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    1321:	8b 45 0c             	mov    0xc(%ebp),%eax
    1324:	89 1c 24             	mov    %ebx,(%esp)
    1327:	89 44 24 04          	mov    %eax,0x4(%esp)
    132b:	e8 da 00 00 00       	call   140a <fstat>
  close(fd);
    1330:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1333:	89 c6                	mov    %eax,%esi
  close(fd);
    1335:	e8 a0 00 00 00       	call   13da <close>
  return r;
    133a:	89 f0                	mov    %esi,%eax
}
    133c:	83 c4 10             	add    $0x10,%esp
    133f:	5b                   	pop    %ebx
    1340:	5e                   	pop    %esi
    1341:	5d                   	pop    %ebp
    1342:	c3                   	ret    
    1343:	90                   	nop
    1344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1348:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    134d:	eb ed                	jmp    133c <stat+0x3c>
    134f:	90                   	nop

00001350 <atoi>:

int
atoi(const char *s)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1356:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1357:	0f be 11             	movsbl (%ecx),%edx
    135a:	8d 42 d0             	lea    -0x30(%edx),%eax
    135d:	3c 09                	cmp    $0x9,%al
  n = 0;
    135f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1364:	77 17                	ja     137d <atoi+0x2d>
    1366:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1368:	83 c1 01             	add    $0x1,%ecx
    136b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    136e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1372:	0f be 11             	movsbl (%ecx),%edx
    1375:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1378:	80 fb 09             	cmp    $0x9,%bl
    137b:	76 eb                	jbe    1368 <atoi+0x18>
  return n;
}
    137d:	5b                   	pop    %ebx
    137e:	5d                   	pop    %ebp
    137f:	c3                   	ret    

00001380 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1380:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1381:	31 d2                	xor    %edx,%edx
{
    1383:	89 e5                	mov    %esp,%ebp
    1385:	56                   	push   %esi
    1386:	8b 45 08             	mov    0x8(%ebp),%eax
    1389:	53                   	push   %ebx
    138a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    138d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1390:	85 db                	test   %ebx,%ebx
    1392:	7e 12                	jle    13a6 <memmove+0x26>
    1394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1398:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    139c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    139f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    13a2:	39 da                	cmp    %ebx,%edx
    13a4:	75 f2                	jne    1398 <memmove+0x18>
  return vdst;
}
    13a6:	5b                   	pop    %ebx
    13a7:	5e                   	pop    %esi
    13a8:	5d                   	pop    %ebp
    13a9:	c3                   	ret    

000013aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13aa:	b8 01 00 00 00       	mov    $0x1,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <exit>:
SYSCALL(exit)
    13b2:	b8 02 00 00 00       	mov    $0x2,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <wait>:
SYSCALL(wait)
    13ba:	b8 03 00 00 00       	mov    $0x3,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <pipe>:
SYSCALL(pipe)
    13c2:	b8 04 00 00 00       	mov    $0x4,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <read>:
SYSCALL(read)
    13ca:	b8 05 00 00 00       	mov    $0x5,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <write>:
SYSCALL(write)
    13d2:	b8 10 00 00 00       	mov    $0x10,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <close>:
SYSCALL(close)
    13da:	b8 15 00 00 00       	mov    $0x15,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <kill>:
SYSCALL(kill)
    13e2:	b8 06 00 00 00       	mov    $0x6,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <exec>:
SYSCALL(exec)
    13ea:	b8 07 00 00 00       	mov    $0x7,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    

000013f2 <open>:
SYSCALL(open)
    13f2:	b8 0f 00 00 00       	mov    $0xf,%eax
    13f7:	cd 40                	int    $0x40
    13f9:	c3                   	ret    

000013fa <mknod>:
SYSCALL(mknod)
    13fa:	b8 11 00 00 00       	mov    $0x11,%eax
    13ff:	cd 40                	int    $0x40
    1401:	c3                   	ret    

00001402 <unlink>:
SYSCALL(unlink)
    1402:	b8 12 00 00 00       	mov    $0x12,%eax
    1407:	cd 40                	int    $0x40
    1409:	c3                   	ret    

0000140a <fstat>:
SYSCALL(fstat)
    140a:	b8 08 00 00 00       	mov    $0x8,%eax
    140f:	cd 40                	int    $0x40
    1411:	c3                   	ret    

00001412 <link>:
SYSCALL(link)
    1412:	b8 13 00 00 00       	mov    $0x13,%eax
    1417:	cd 40                	int    $0x40
    1419:	c3                   	ret    

0000141a <mkdir>:
SYSCALL(mkdir)
    141a:	b8 14 00 00 00       	mov    $0x14,%eax
    141f:	cd 40                	int    $0x40
    1421:	c3                   	ret    

00001422 <chdir>:
SYSCALL(chdir)
    1422:	b8 09 00 00 00       	mov    $0x9,%eax
    1427:	cd 40                	int    $0x40
    1429:	c3                   	ret    

0000142a <dup>:
SYSCALL(dup)
    142a:	b8 0a 00 00 00       	mov    $0xa,%eax
    142f:	cd 40                	int    $0x40
    1431:	c3                   	ret    

00001432 <getpid>:
SYSCALL(getpid)
    1432:	b8 0b 00 00 00       	mov    $0xb,%eax
    1437:	cd 40                	int    $0x40
    1439:	c3                   	ret    

0000143a <sbrk>:
SYSCALL(sbrk)
    143a:	b8 0c 00 00 00       	mov    $0xc,%eax
    143f:	cd 40                	int    $0x40
    1441:	c3                   	ret    

00001442 <sleep>:
SYSCALL(sleep)
    1442:	b8 0d 00 00 00       	mov    $0xd,%eax
    1447:	cd 40                	int    $0x40
    1449:	c3                   	ret    

0000144a <uptime>:
SYSCALL(uptime)
    144a:	b8 0e 00 00 00       	mov    $0xe,%eax
    144f:	cd 40                	int    $0x40
    1451:	c3                   	ret    

00001452 <shm_open>:
SYSCALL(shm_open)
    1452:	b8 16 00 00 00       	mov    $0x16,%eax
    1457:	cd 40                	int    $0x40
    1459:	c3                   	ret    

0000145a <shm_close>:
SYSCALL(shm_close)	
    145a:	b8 17 00 00 00       	mov    $0x17,%eax
    145f:	cd 40                	int    $0x40
    1461:	c3                   	ret    
    1462:	66 90                	xchg   %ax,%ax
    1464:	66 90                	xchg   %ax,%ax
    1466:	66 90                	xchg   %ax,%ax
    1468:	66 90                	xchg   %ax,%ax
    146a:	66 90                	xchg   %ax,%ax
    146c:	66 90                	xchg   %ax,%ax
    146e:	66 90                	xchg   %ax,%ax

00001470 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	57                   	push   %edi
    1474:	56                   	push   %esi
    1475:	89 c6                	mov    %eax,%esi
    1477:	53                   	push   %ebx
    1478:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    147b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    147e:	85 db                	test   %ebx,%ebx
    1480:	74 09                	je     148b <printint+0x1b>
    1482:	89 d0                	mov    %edx,%eax
    1484:	c1 e8 1f             	shr    $0x1f,%eax
    1487:	84 c0                	test   %al,%al
    1489:	75 75                	jne    1500 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    148b:	89 d0                	mov    %edx,%eax
  neg = 0;
    148d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1494:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1497:	31 ff                	xor    %edi,%edi
    1499:	89 ce                	mov    %ecx,%esi
    149b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    149e:	eb 02                	jmp    14a2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    14a0:	89 cf                	mov    %ecx,%edi
    14a2:	31 d2                	xor    %edx,%edx
    14a4:	f7 f6                	div    %esi
    14a6:	8d 4f 01             	lea    0x1(%edi),%ecx
    14a9:	0f b6 92 ef 18 00 00 	movzbl 0x18ef(%edx),%edx
  }while((x /= base) != 0);
    14b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    14b2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    14b5:	75 e9                	jne    14a0 <printint+0x30>
  if(neg)
    14b7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    14ba:	89 c8                	mov    %ecx,%eax
    14bc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    14bf:	85 d2                	test   %edx,%edx
    14c1:	74 08                	je     14cb <printint+0x5b>
    buf[i++] = '-';
    14c3:	8d 4f 02             	lea    0x2(%edi),%ecx
    14c6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    14cb:	8d 79 ff             	lea    -0x1(%ecx),%edi
    14ce:	66 90                	xchg   %ax,%ax
    14d0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    14d5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    14d8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14df:	00 
    14e0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    14e4:	89 34 24             	mov    %esi,(%esp)
    14e7:	88 45 d7             	mov    %al,-0x29(%ebp)
    14ea:	e8 e3 fe ff ff       	call   13d2 <write>
  while(--i >= 0)
    14ef:	83 ff ff             	cmp    $0xffffffff,%edi
    14f2:	75 dc                	jne    14d0 <printint+0x60>
    putc(fd, buf[i]);
}
    14f4:	83 c4 4c             	add    $0x4c,%esp
    14f7:	5b                   	pop    %ebx
    14f8:	5e                   	pop    %esi
    14f9:	5f                   	pop    %edi
    14fa:	5d                   	pop    %ebp
    14fb:	c3                   	ret    
    14fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    1500:	89 d0                	mov    %edx,%eax
    1502:	f7 d8                	neg    %eax
    neg = 1;
    1504:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    150b:	eb 87                	jmp    1494 <printint+0x24>
    150d:	8d 76 00             	lea    0x0(%esi),%esi

00001510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1510:	55                   	push   %ebp
    1511:	89 e5                	mov    %esp,%ebp
    1513:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1514:	31 ff                	xor    %edi,%edi
{
    1516:	56                   	push   %esi
    1517:	53                   	push   %ebx
    1518:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    151b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    151e:	8d 45 10             	lea    0x10(%ebp),%eax
{
    1521:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    1524:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    1527:	0f b6 13             	movzbl (%ebx),%edx
    152a:	83 c3 01             	add    $0x1,%ebx
    152d:	84 d2                	test   %dl,%dl
    152f:	75 39                	jne    156a <printf+0x5a>
    1531:	e9 c2 00 00 00       	jmp    15f8 <printf+0xe8>
    1536:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1538:	83 fa 25             	cmp    $0x25,%edx
    153b:	0f 84 bf 00 00 00    	je     1600 <printf+0xf0>
  write(fd, &c, 1);
    1541:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1544:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    154b:	00 
    154c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1550:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    1553:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    1556:	e8 77 fe ff ff       	call   13d2 <write>
    155b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    155e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1562:	84 d2                	test   %dl,%dl
    1564:	0f 84 8e 00 00 00    	je     15f8 <printf+0xe8>
    if(state == 0){
    156a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    156c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    156f:	74 c7                	je     1538 <printf+0x28>
      }
    } else if(state == '%'){
    1571:	83 ff 25             	cmp    $0x25,%edi
    1574:	75 e5                	jne    155b <printf+0x4b>
      if(c == 'd'){
    1576:	83 fa 64             	cmp    $0x64,%edx
    1579:	0f 84 31 01 00 00    	je     16b0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    157f:	25 f7 00 00 00       	and    $0xf7,%eax
    1584:	83 f8 70             	cmp    $0x70,%eax
    1587:	0f 84 83 00 00 00    	je     1610 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    158d:	83 fa 73             	cmp    $0x73,%edx
    1590:	0f 84 a2 00 00 00    	je     1638 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1596:	83 fa 63             	cmp    $0x63,%edx
    1599:	0f 84 35 01 00 00    	je     16d4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    159f:	83 fa 25             	cmp    $0x25,%edx
    15a2:	0f 84 e0 00 00 00    	je     1688 <printf+0x178>
  write(fd, &c, 1);
    15a8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    15ab:	83 c3 01             	add    $0x1,%ebx
    15ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15b5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15b6:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    15b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    15bc:	89 34 24             	mov    %esi,(%esp)
    15bf:	89 55 d0             	mov    %edx,-0x30(%ebp)
    15c2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    15c6:	e8 07 fe ff ff       	call   13d2 <write>
        putc(fd, c);
    15cb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    15ce:	8d 45 e7             	lea    -0x19(%ebp),%eax
    15d1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15d8:	00 
    15d9:	89 44 24 04          	mov    %eax,0x4(%esp)
    15dd:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    15e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    15e3:	e8 ea fd ff ff       	call   13d2 <write>
  for(i = 0; fmt[i]; i++){
    15e8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    15ec:	84 d2                	test   %dl,%dl
    15ee:	0f 85 76 ff ff ff    	jne    156a <printf+0x5a>
    15f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    15f8:	83 c4 3c             	add    $0x3c,%esp
    15fb:	5b                   	pop    %ebx
    15fc:	5e                   	pop    %esi
    15fd:	5f                   	pop    %edi
    15fe:	5d                   	pop    %ebp
    15ff:	c3                   	ret    
        state = '%';
    1600:	bf 25 00 00 00       	mov    $0x25,%edi
    1605:	e9 51 ff ff ff       	jmp    155b <printf+0x4b>
    160a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1610:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1613:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    1618:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    161a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1621:	8b 10                	mov    (%eax),%edx
    1623:	89 f0                	mov    %esi,%eax
    1625:	e8 46 fe ff ff       	call   1470 <printint>
        ap++;
    162a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    162e:	e9 28 ff ff ff       	jmp    155b <printf+0x4b>
    1633:	90                   	nop
    1634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1638:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    163b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    163f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    1641:	b8 e8 18 00 00       	mov    $0x18e8,%eax
    1646:	85 ff                	test   %edi,%edi
    1648:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    164b:	0f b6 07             	movzbl (%edi),%eax
    164e:	84 c0                	test   %al,%al
    1650:	74 2a                	je     167c <printf+0x16c>
    1652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1658:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    165b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    165e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    1661:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1668:	00 
    1669:	89 44 24 04          	mov    %eax,0x4(%esp)
    166d:	89 34 24             	mov    %esi,(%esp)
    1670:	e8 5d fd ff ff       	call   13d2 <write>
        while(*s != 0){
    1675:	0f b6 07             	movzbl (%edi),%eax
    1678:	84 c0                	test   %al,%al
    167a:	75 dc                	jne    1658 <printf+0x148>
      state = 0;
    167c:	31 ff                	xor    %edi,%edi
    167e:	e9 d8 fe ff ff       	jmp    155b <printf+0x4b>
    1683:	90                   	nop
    1684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1688:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    168b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    168d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1694:	00 
    1695:	89 44 24 04          	mov    %eax,0x4(%esp)
    1699:	89 34 24             	mov    %esi,(%esp)
    169c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    16a0:	e8 2d fd ff ff       	call   13d2 <write>
    16a5:	e9 b1 fe ff ff       	jmp    155b <printf+0x4b>
    16aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    16b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    16b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    16b8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    16bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16c2:	8b 10                	mov    (%eax),%edx
    16c4:	89 f0                	mov    %esi,%eax
    16c6:	e8 a5 fd ff ff       	call   1470 <printint>
        ap++;
    16cb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    16cf:	e9 87 fe ff ff       	jmp    155b <printf+0x4b>
        putc(fd, *ap);
    16d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    16d7:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    16d9:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    16db:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    16e2:	00 
    16e3:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    16e6:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    16e9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    16ec:	89 44 24 04          	mov    %eax,0x4(%esp)
    16f0:	e8 dd fc ff ff       	call   13d2 <write>
        ap++;
    16f5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    16f9:	e9 5d fe ff ff       	jmp    155b <printf+0x4b>
    16fe:	66 90                	xchg   %ax,%ax

00001700 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1700:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1701:	a1 e0 1b 00 00       	mov    0x1be0,%eax
{
    1706:	89 e5                	mov    %esp,%ebp
    1708:	57                   	push   %edi
    1709:	56                   	push   %esi
    170a:	53                   	push   %ebx
    170b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    170e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    1710:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1713:	39 d0                	cmp    %edx,%eax
    1715:	72 11                	jb     1728 <free+0x28>
    1717:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1718:	39 c8                	cmp    %ecx,%eax
    171a:	72 04                	jb     1720 <free+0x20>
    171c:	39 ca                	cmp    %ecx,%edx
    171e:	72 10                	jb     1730 <free+0x30>
    1720:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1722:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1724:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1726:	73 f0                	jae    1718 <free+0x18>
    1728:	39 ca                	cmp    %ecx,%edx
    172a:	72 04                	jb     1730 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    172c:	39 c8                	cmp    %ecx,%eax
    172e:	72 f0                	jb     1720 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1730:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1733:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1736:	39 cf                	cmp    %ecx,%edi
    1738:	74 1e                	je     1758 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    173a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    173d:	8b 48 04             	mov    0x4(%eax),%ecx
    1740:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1743:	39 f2                	cmp    %esi,%edx
    1745:	74 28                	je     176f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1747:	89 10                	mov    %edx,(%eax)
  freep = p;
    1749:	a3 e0 1b 00 00       	mov    %eax,0x1be0
}
    174e:	5b                   	pop    %ebx
    174f:	5e                   	pop    %esi
    1750:	5f                   	pop    %edi
    1751:	5d                   	pop    %ebp
    1752:	c3                   	ret    
    1753:	90                   	nop
    1754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1758:	03 71 04             	add    0x4(%ecx),%esi
    175b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    175e:	8b 08                	mov    (%eax),%ecx
    1760:	8b 09                	mov    (%ecx),%ecx
    1762:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1765:	8b 48 04             	mov    0x4(%eax),%ecx
    1768:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    176b:	39 f2                	cmp    %esi,%edx
    176d:	75 d8                	jne    1747 <free+0x47>
    p->s.size += bp->s.size;
    176f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    1772:	a3 e0 1b 00 00       	mov    %eax,0x1be0
    p->s.size += bp->s.size;
    1777:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    177a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    177d:	89 10                	mov    %edx,(%eax)
}
    177f:	5b                   	pop    %ebx
    1780:	5e                   	pop    %esi
    1781:	5f                   	pop    %edi
    1782:	5d                   	pop    %ebp
    1783:	c3                   	ret    
    1784:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    178a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001790 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1790:	55                   	push   %ebp
    1791:	89 e5                	mov    %esp,%ebp
    1793:	57                   	push   %edi
    1794:	56                   	push   %esi
    1795:	53                   	push   %ebx
    1796:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1799:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    179c:	8b 1d e0 1b 00 00    	mov    0x1be0,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17a2:	8d 48 07             	lea    0x7(%eax),%ecx
    17a5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    17a8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17aa:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    17ad:	0f 84 9b 00 00 00    	je     184e <malloc+0xbe>
    17b3:	8b 13                	mov    (%ebx),%edx
    17b5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    17b8:	39 fe                	cmp    %edi,%esi
    17ba:	76 64                	jbe    1820 <malloc+0x90>
    17bc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    17c3:	bb 00 80 00 00       	mov    $0x8000,%ebx
    17c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    17cb:	eb 0e                	jmp    17db <malloc+0x4b>
    17cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17d0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    17d2:	8b 78 04             	mov    0x4(%eax),%edi
    17d5:	39 fe                	cmp    %edi,%esi
    17d7:	76 4f                	jbe    1828 <malloc+0x98>
    17d9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    17db:	3b 15 e0 1b 00 00    	cmp    0x1be0,%edx
    17e1:	75 ed                	jne    17d0 <malloc+0x40>
  if(nu < 4096)
    17e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    17e6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    17ec:	bf 00 10 00 00       	mov    $0x1000,%edi
    17f1:	0f 43 fe             	cmovae %esi,%edi
    17f4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    17f7:	89 04 24             	mov    %eax,(%esp)
    17fa:	e8 3b fc ff ff       	call   143a <sbrk>
  if(p == (char*)-1)
    17ff:	83 f8 ff             	cmp    $0xffffffff,%eax
    1802:	74 18                	je     181c <malloc+0x8c>
  hp->s.size = nu;
    1804:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1807:	83 c0 08             	add    $0x8,%eax
    180a:	89 04 24             	mov    %eax,(%esp)
    180d:	e8 ee fe ff ff       	call   1700 <free>
  return freep;
    1812:	8b 15 e0 1b 00 00    	mov    0x1be0,%edx
      if((p = morecore(nunits)) == 0)
    1818:	85 d2                	test   %edx,%edx
    181a:	75 b4                	jne    17d0 <malloc+0x40>
        return 0;
    181c:	31 c0                	xor    %eax,%eax
    181e:	eb 20                	jmp    1840 <malloc+0xb0>
    if(p->s.size >= nunits){
    1820:	89 d0                	mov    %edx,%eax
    1822:	89 da                	mov    %ebx,%edx
    1824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1828:	39 fe                	cmp    %edi,%esi
    182a:	74 1c                	je     1848 <malloc+0xb8>
        p->s.size -= nunits;
    182c:	29 f7                	sub    %esi,%edi
    182e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1831:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1834:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1837:	89 15 e0 1b 00 00    	mov    %edx,0x1be0
      return (void*)(p + 1);
    183d:	83 c0 08             	add    $0x8,%eax
  }
}
    1840:	83 c4 1c             	add    $0x1c,%esp
    1843:	5b                   	pop    %ebx
    1844:	5e                   	pop    %esi
    1845:	5f                   	pop    %edi
    1846:	5d                   	pop    %ebp
    1847:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1848:	8b 08                	mov    (%eax),%ecx
    184a:	89 0a                	mov    %ecx,(%edx)
    184c:	eb e9                	jmp    1837 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    184e:	c7 05 e0 1b 00 00 e4 	movl   $0x1be4,0x1be0
    1855:	1b 00 00 
    base.s.size = 0;
    1858:	ba e4 1b 00 00       	mov    $0x1be4,%edx
    base.s.ptr = freep = prevp = &base;
    185d:	c7 05 e4 1b 00 00 e4 	movl   $0x1be4,0x1be4
    1864:	1b 00 00 
    base.s.size = 0;
    1867:	c7 05 e8 1b 00 00 00 	movl   $0x0,0x1be8
    186e:	00 00 00 
    1871:	e9 46 ff ff ff       	jmp    17bc <malloc+0x2c>
    1876:	66 90                	xchg   %ax,%ax
    1878:	66 90                	xchg   %ax,%ax
    187a:	66 90                	xchg   %ax,%ax
    187c:	66 90                	xchg   %ax,%ax
    187e:	66 90                	xchg   %ax,%ax

00001880 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1880:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1881:	b9 01 00 00 00       	mov    $0x1,%ecx
    1886:	89 e5                	mov    %esp,%ebp
    1888:	8b 55 08             	mov    0x8(%ebp),%edx
    188b:	90                   	nop
    188c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1890:	89 c8                	mov    %ecx,%eax
    1892:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1895:	85 c0                	test   %eax,%eax
    1897:	75 f7                	jne    1890 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1899:	0f ae f0             	mfence 
}
    189c:	5d                   	pop    %ebp
    189d:	c3                   	ret    
    189e:	66 90                	xchg   %ax,%ax

000018a0 <urelease>:

void urelease (struct uspinlock *lk) {
    18a0:	55                   	push   %ebp
    18a1:	89 e5                	mov    %esp,%ebp
    18a3:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    18a6:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    18a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    18af:	5d                   	pop    %ebp
    18b0:	c3                   	ret    
