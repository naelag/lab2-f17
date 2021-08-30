
_grep:     file format elf32-i386


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
    1005:	53                   	push   %ebx
    1006:	83 e4 f0             	and    $0xfffffff0,%esp
    1009:	83 ec 10             	sub    $0x10,%esp
    100c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
    100f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    1013:	0f 8e 8b 00 00 00    	jle    10a4 <main+0xa4>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
    1019:	8b 43 04             	mov    0x4(%ebx),%eax
    101c:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
    101f:	be 02 00 00 00       	mov    $0x2,%esi
    1024:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  pattern = argv[1];
    1028:	89 44 24 0c          	mov    %eax,0xc(%esp)
  if(argc <= 2){
    102c:	74 61                	je     108f <main+0x8f>
    102e:	66 90                	xchg   %ax,%ax
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1037:	00 
    1038:	8b 03                	mov    (%ebx),%eax
    103a:	89 04 24             	mov    %eax,(%esp)
    103d:	e8 30 05 00 00       	call   1572 <open>
    1042:	85 c0                	test   %eax,%eax
    1044:	89 c7                	mov    %eax,%edi
    1046:	78 28                	js     1070 <main+0x70>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
    1048:	89 44 24 04          	mov    %eax,0x4(%esp)
    104c:	8b 44 24 0c          	mov    0xc(%esp),%eax
  for(i = 2; i < argc; i++){
    1050:	83 c6 01             	add    $0x1,%esi
    1053:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
    1056:	89 04 24             	mov    %eax,(%esp)
    1059:	e8 a2 01 00 00       	call   1200 <grep>
    close(fd);
    105e:	89 3c 24             	mov    %edi,(%esp)
    1061:	e8 f4 04 00 00       	call   155a <close>
  for(i = 2; i < argc; i++){
    1066:	39 75 08             	cmp    %esi,0x8(%ebp)
    1069:	7f c5                	jg     1030 <main+0x30>
  }
  exit();
    106b:	e8 c2 04 00 00       	call   1532 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
    1070:	8b 03                	mov    (%ebx),%eax
    1072:	c7 44 24 04 54 1a 00 	movl   $0x1a54,0x4(%esp)
    1079:	00 
    107a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1081:	89 44 24 08          	mov    %eax,0x8(%esp)
    1085:	e8 06 06 00 00       	call   1690 <printf>
      exit();
    108a:	e8 a3 04 00 00       	call   1532 <exit>
    grep(pattern, 0);
    108f:	89 04 24             	mov    %eax,(%esp)
    1092:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1099:	00 
    109a:	e8 61 01 00 00       	call   1200 <grep>
    exit();
    109f:	e8 8e 04 00 00       	call   1532 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
    10a4:	c7 44 24 04 34 1a 00 	movl   $0x1a34,0x4(%esp)
    10ab:	00 
    10ac:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    10b3:	e8 d8 05 00 00       	call   1690 <printf>
    exit();
    10b8:	e8 75 04 00 00       	call   1532 <exit>
    10bd:	66 90                	xchg   %ax,%ax
    10bf:	90                   	nop

000010c0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	56                   	push   %esi
    10c5:	53                   	push   %ebx
    10c6:	83 ec 1c             	sub    $0x1c,%esp
    10c9:	8b 75 08             	mov    0x8(%ebp),%esi
    10cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
    10cf:	8b 5d 10             	mov    0x10(%ebp),%ebx
    10d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
    10d8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    10dc:	89 3c 24             	mov    %edi,(%esp)
    10df:	e8 3c 00 00 00       	call   1120 <matchhere>
    10e4:	85 c0                	test   %eax,%eax
    10e6:	75 20                	jne    1108 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
    10e8:	0f be 13             	movsbl (%ebx),%edx
    10eb:	84 d2                	test   %dl,%dl
    10ed:	74 0c                	je     10fb <matchstar+0x3b>
    10ef:	83 c3 01             	add    $0x1,%ebx
    10f2:	39 f2                	cmp    %esi,%edx
    10f4:	74 e2                	je     10d8 <matchstar+0x18>
    10f6:	83 fe 2e             	cmp    $0x2e,%esi
    10f9:	74 dd                	je     10d8 <matchstar+0x18>
  return 0;
}
    10fb:	83 c4 1c             	add    $0x1c,%esp
    10fe:	5b                   	pop    %ebx
    10ff:	5e                   	pop    %esi
    1100:	5f                   	pop    %edi
    1101:	5d                   	pop    %ebp
    1102:	c3                   	ret    
    1103:	90                   	nop
    1104:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1108:	83 c4 1c             	add    $0x1c,%esp
      return 1;
    110b:	b8 01 00 00 00       	mov    $0x1,%eax
}
    1110:	5b                   	pop    %ebx
    1111:	5e                   	pop    %esi
    1112:	5f                   	pop    %edi
    1113:	5d                   	pop    %ebp
    1114:	c3                   	ret    
    1115:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001120 <matchhere>:
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	83 ec 14             	sub    $0x14,%esp
    1127:	8b 55 08             	mov    0x8(%ebp),%edx
    112a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  if(re[0] == '\0')
    112d:	0f be 02             	movsbl (%edx),%eax
    1130:	84 c0                	test   %al,%al
    1132:	75 20                	jne    1154 <matchhere+0x34>
    1134:	eb 42                	jmp    1178 <matchhere+0x58>
    1136:	66 90                	xchg   %ax,%ax
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    1138:	0f b6 19             	movzbl (%ecx),%ebx
    113b:	84 db                	test   %bl,%bl
    113d:	74 31                	je     1170 <matchhere+0x50>
    113f:	3c 2e                	cmp    $0x2e,%al
    1141:	74 04                	je     1147 <matchhere+0x27>
    1143:	38 d8                	cmp    %bl,%al
    1145:	75 29                	jne    1170 <matchhere+0x50>
    return matchhere(re+1, text+1);
    1147:	83 c2 01             	add    $0x1,%edx
  if(re[0] == '\0')
    114a:	0f be 02             	movsbl (%edx),%eax
    return matchhere(re+1, text+1);
    114d:	83 c1 01             	add    $0x1,%ecx
  if(re[0] == '\0')
    1150:	84 c0                	test   %al,%al
    1152:	74 24                	je     1178 <matchhere+0x58>
  if(re[1] == '*')
    1154:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
    1158:	80 fb 2a             	cmp    $0x2a,%bl
    115b:	74 2b                	je     1188 <matchhere+0x68>
  if(re[0] == '$' && re[1] == '\0')
    115d:	3c 24                	cmp    $0x24,%al
    115f:	75 d7                	jne    1138 <matchhere+0x18>
    1161:	84 db                	test   %bl,%bl
    1163:	74 3c                	je     11a1 <matchhere+0x81>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    1165:	0f b6 19             	movzbl (%ecx),%ebx
    1168:	84 db                	test   %bl,%bl
    116a:	75 d7                	jne    1143 <matchhere+0x23>
    116c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1170:	31 c0                	xor    %eax,%eax
}
    1172:	83 c4 14             	add    $0x14,%esp
    1175:	5b                   	pop    %ebx
    1176:	5d                   	pop    %ebp
    1177:	c3                   	ret    
    1178:	83 c4 14             	add    $0x14,%esp
    return 1;
    117b:	b8 01 00 00 00       	mov    $0x1,%eax
}
    1180:	5b                   	pop    %ebx
    1181:	5d                   	pop    %ebp
    1182:	c3                   	ret    
    1183:	90                   	nop
    1184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchstar(re[0], re+2, text);
    1188:	83 c2 02             	add    $0x2,%edx
    118b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    118f:	89 54 24 04          	mov    %edx,0x4(%esp)
    1193:	89 04 24             	mov    %eax,(%esp)
    1196:	e8 25 ff ff ff       	call   10c0 <matchstar>
}
    119b:	83 c4 14             	add    $0x14,%esp
    119e:	5b                   	pop    %ebx
    119f:	5d                   	pop    %ebp
    11a0:	c3                   	ret    
    return *text == '\0';
    11a1:	31 c0                	xor    %eax,%eax
    11a3:	80 39 00             	cmpb   $0x0,(%ecx)
    11a6:	0f 94 c0             	sete   %al
    11a9:	eb c7                	jmp    1172 <matchhere+0x52>
    11ab:	90                   	nop
    11ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011b0 <match>:
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	56                   	push   %esi
    11b4:	53                   	push   %ebx
    11b5:	83 ec 10             	sub    $0x10,%esp
    11b8:	8b 75 08             	mov    0x8(%ebp),%esi
    11bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
    11be:	80 3e 5e             	cmpb   $0x5e,(%esi)
    11c1:	75 0e                	jne    11d1 <match+0x21>
    11c3:	eb 28                	jmp    11ed <match+0x3d>
    11c5:	8d 76 00             	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
    11c8:	83 c3 01             	add    $0x1,%ebx
    11cb:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
    11cf:	74 15                	je     11e6 <match+0x36>
    if(matchhere(re, text))
    11d1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    11d5:	89 34 24             	mov    %esi,(%esp)
    11d8:	e8 43 ff ff ff       	call   1120 <matchhere>
    11dd:	85 c0                	test   %eax,%eax
    11df:	74 e7                	je     11c8 <match+0x18>
      return 1;
    11e1:	b8 01 00 00 00       	mov    $0x1,%eax
}
    11e6:	83 c4 10             	add    $0x10,%esp
    11e9:	5b                   	pop    %ebx
    11ea:	5e                   	pop    %esi
    11eb:	5d                   	pop    %ebp
    11ec:	c3                   	ret    
    return matchhere(re+1, text);
    11ed:	83 c6 01             	add    $0x1,%esi
    11f0:	89 75 08             	mov    %esi,0x8(%ebp)
}
    11f3:	83 c4 10             	add    $0x10,%esp
    11f6:	5b                   	pop    %ebx
    11f7:	5e                   	pop    %esi
    11f8:	5d                   	pop    %ebp
    return matchhere(re+1, text);
    11f9:	e9 22 ff ff ff       	jmp    1120 <matchhere>
    11fe:	66 90                	xchg   %ax,%ax

00001200 <grep>:
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	57                   	push   %edi
    1204:	56                   	push   %esi
    1205:	53                   	push   %ebx
    1206:	83 ec 1c             	sub    $0x1c,%esp
    1209:	8b 75 08             	mov    0x8(%ebp),%esi
  m = 0;
    120c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1213:	90                   	nop
    1214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    1218:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    121b:	b8 ff 03 00 00       	mov    $0x3ff,%eax
    1220:	29 d0                	sub    %edx,%eax
    1222:	89 44 24 08          	mov    %eax,0x8(%esp)
    1226:	89 d0                	mov    %edx,%eax
    1228:	05 40 1e 00 00       	add    $0x1e40,%eax
    122d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1231:	8b 45 0c             	mov    0xc(%ebp),%eax
    1234:	89 04 24             	mov    %eax,(%esp)
    1237:	e8 0e 03 00 00       	call   154a <read>
    123c:	85 c0                	test   %eax,%eax
    123e:	0f 8e b8 00 00 00    	jle    12fc <grep+0xfc>
    m += n;
    1244:	01 45 e4             	add    %eax,-0x1c(%ebp)
    p = buf;
    1247:	bb 40 1e 00 00       	mov    $0x1e40,%ebx
    buf[m] = '\0';
    124c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    124f:	c6 80 40 1e 00 00 00 	movb   $0x0,0x1e40(%eax)
    1256:	66 90                	xchg   %ax,%ax
    while((q = strchr(p, '\n')) != 0){
    1258:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    125f:	00 
    1260:	89 1c 24             	mov    %ebx,(%esp)
    1263:	e8 78 01 00 00       	call   13e0 <strchr>
    1268:	85 c0                	test   %eax,%eax
    126a:	89 c7                	mov    %eax,%edi
    126c:	74 42                	je     12b0 <grep+0xb0>
      *q = 0;
    126e:	c6 07 00             	movb   $0x0,(%edi)
      if(match(pattern, p)){
    1271:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1275:	89 34 24             	mov    %esi,(%esp)
    1278:	e8 33 ff ff ff       	call   11b0 <match>
    127d:	85 c0                	test   %eax,%eax
    127f:	75 07                	jne    1288 <grep+0x88>
    1281:	8d 5f 01             	lea    0x1(%edi),%ebx
    1284:	eb d2                	jmp    1258 <grep+0x58>
    1286:	66 90                	xchg   %ax,%ax
        *q = '\n';
    1288:	c6 07 0a             	movb   $0xa,(%edi)
        write(1, p, q+1 - p);
    128b:	83 c7 01             	add    $0x1,%edi
    128e:	89 f8                	mov    %edi,%eax
    1290:	29 d8                	sub    %ebx,%eax
    1292:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1296:	89 fb                	mov    %edi,%ebx
    1298:	89 44 24 08          	mov    %eax,0x8(%esp)
    129c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12a3:	e8 aa 02 00 00       	call   1552 <write>
    12a8:	eb ae                	jmp    1258 <grep+0x58>
    12aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p == buf)
    12b0:	81 fb 40 1e 00 00    	cmp    $0x1e40,%ebx
    12b6:	74 38                	je     12f0 <grep+0xf0>
    if(m > 0){
    12b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12bb:	85 c0                	test   %eax,%eax
    12bd:	0f 8e 55 ff ff ff    	jle    1218 <grep+0x18>
      m -= p - buf;
    12c3:	b8 40 1e 00 00       	mov    $0x1e40,%eax
    12c8:	29 d8                	sub    %ebx,%eax
    12ca:	01 45 e4             	add    %eax,-0x1c(%ebp)
      memmove(buf, p, m);
    12cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12d0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    12d4:	c7 04 24 40 1e 00 00 	movl   $0x1e40,(%esp)
    12db:	89 44 24 08          	mov    %eax,0x8(%esp)
    12df:	e8 1c 02 00 00       	call   1500 <memmove>
    12e4:	e9 2f ff ff ff       	jmp    1218 <grep+0x18>
    12e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      m = 0;
    12f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    12f7:	e9 1c ff ff ff       	jmp    1218 <grep+0x18>
}
    12fc:	83 c4 1c             	add    $0x1c,%esp
    12ff:	5b                   	pop    %ebx
    1300:	5e                   	pop    %esi
    1301:	5f                   	pop    %edi
    1302:	5d                   	pop    %ebp
    1303:	c3                   	ret    
    1304:	66 90                	xchg   %ax,%ax
    1306:	66 90                	xchg   %ax,%ax
    1308:	66 90                	xchg   %ax,%ax
    130a:	66 90                	xchg   %ax,%ax
    130c:	66 90                	xchg   %ax,%ax
    130e:	66 90                	xchg   %ax,%ax

00001310 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	8b 45 08             	mov    0x8(%ebp),%eax
    1316:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1319:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    131a:	89 c2                	mov    %eax,%edx
    131c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1320:	83 c1 01             	add    $0x1,%ecx
    1323:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1327:	83 c2 01             	add    $0x1,%edx
    132a:	84 db                	test   %bl,%bl
    132c:	88 5a ff             	mov    %bl,-0x1(%edx)
    132f:	75 ef                	jne    1320 <strcpy+0x10>
    ;
  return os;
}
    1331:	5b                   	pop    %ebx
    1332:	5d                   	pop    %ebp
    1333:	c3                   	ret    
    1334:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    133a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001340 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	8b 55 08             	mov    0x8(%ebp),%edx
    1346:	53                   	push   %ebx
    1347:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    134a:	0f b6 02             	movzbl (%edx),%eax
    134d:	84 c0                	test   %al,%al
    134f:	74 2d                	je     137e <strcmp+0x3e>
    1351:	0f b6 19             	movzbl (%ecx),%ebx
    1354:	38 d8                	cmp    %bl,%al
    1356:	74 0e                	je     1366 <strcmp+0x26>
    1358:	eb 2b                	jmp    1385 <strcmp+0x45>
    135a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1360:	38 c8                	cmp    %cl,%al
    1362:	75 15                	jne    1379 <strcmp+0x39>
    p++, q++;
    1364:	89 d9                	mov    %ebx,%ecx
    1366:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1369:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    136c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    136f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    1373:	84 c0                	test   %al,%al
    1375:	75 e9                	jne    1360 <strcmp+0x20>
    1377:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1379:	29 c8                	sub    %ecx,%eax
}
    137b:	5b                   	pop    %ebx
    137c:	5d                   	pop    %ebp
    137d:	c3                   	ret    
    137e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    1381:	31 c0                	xor    %eax,%eax
    1383:	eb f4                	jmp    1379 <strcmp+0x39>
    1385:	0f b6 cb             	movzbl %bl,%ecx
    1388:	eb ef                	jmp    1379 <strcmp+0x39>
    138a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001390 <strlen>:

uint
strlen(char *s)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1396:	80 39 00             	cmpb   $0x0,(%ecx)
    1399:	74 12                	je     13ad <strlen+0x1d>
    139b:	31 d2                	xor    %edx,%edx
    139d:	8d 76 00             	lea    0x0(%esi),%esi
    13a0:	83 c2 01             	add    $0x1,%edx
    13a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    13a7:	89 d0                	mov    %edx,%eax
    13a9:	75 f5                	jne    13a0 <strlen+0x10>
    ;
  return n;
}
    13ab:	5d                   	pop    %ebp
    13ac:	c3                   	ret    
  for(n = 0; s[n]; n++)
    13ad:	31 c0                	xor    %eax,%eax
}
    13af:	5d                   	pop    %ebp
    13b0:	c3                   	ret    
    13b1:	eb 0d                	jmp    13c0 <memset>
    13b3:	90                   	nop
    13b4:	90                   	nop
    13b5:	90                   	nop
    13b6:	90                   	nop
    13b7:	90                   	nop
    13b8:	90                   	nop
    13b9:	90                   	nop
    13ba:	90                   	nop
    13bb:	90                   	nop
    13bc:	90                   	nop
    13bd:	90                   	nop
    13be:	90                   	nop
    13bf:	90                   	nop

000013c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	8b 55 08             	mov    0x8(%ebp),%edx
    13c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    13c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    13ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    13cd:	89 d7                	mov    %edx,%edi
    13cf:	fc                   	cld    
    13d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    13d2:	89 d0                	mov    %edx,%eax
    13d4:	5f                   	pop    %edi
    13d5:	5d                   	pop    %ebp
    13d6:	c3                   	ret    
    13d7:	89 f6                	mov    %esi,%esi
    13d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000013e0 <strchr>:

char*
strchr(const char *s, char c)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	8b 45 08             	mov    0x8(%ebp),%eax
    13e6:	53                   	push   %ebx
    13e7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    13ea:	0f b6 18             	movzbl (%eax),%ebx
    13ed:	84 db                	test   %bl,%bl
    13ef:	74 1d                	je     140e <strchr+0x2e>
    if(*s == c)
    13f1:	38 d3                	cmp    %dl,%bl
    13f3:	89 d1                	mov    %edx,%ecx
    13f5:	75 0d                	jne    1404 <strchr+0x24>
    13f7:	eb 17                	jmp    1410 <strchr+0x30>
    13f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1400:	38 ca                	cmp    %cl,%dl
    1402:	74 0c                	je     1410 <strchr+0x30>
  for(; *s; s++)
    1404:	83 c0 01             	add    $0x1,%eax
    1407:	0f b6 10             	movzbl (%eax),%edx
    140a:	84 d2                	test   %dl,%dl
    140c:	75 f2                	jne    1400 <strchr+0x20>
      return (char*)s;
  return 0;
    140e:	31 c0                	xor    %eax,%eax
}
    1410:	5b                   	pop    %ebx
    1411:	5d                   	pop    %ebp
    1412:	c3                   	ret    
    1413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001420 <gets>:

char*
gets(char *buf, int max)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1425:	31 f6                	xor    %esi,%esi
{
    1427:	53                   	push   %ebx
    1428:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    142b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    142e:	eb 31                	jmp    1461 <gets+0x41>
    cc = read(0, &c, 1);
    1430:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1437:	00 
    1438:	89 7c 24 04          	mov    %edi,0x4(%esp)
    143c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1443:	e8 02 01 00 00       	call   154a <read>
    if(cc < 1)
    1448:	85 c0                	test   %eax,%eax
    144a:	7e 1d                	jle    1469 <gets+0x49>
      break;
    buf[i++] = c;
    144c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    1450:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    1452:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1455:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    1457:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    145b:	74 0c                	je     1469 <gets+0x49>
    145d:	3c 0a                	cmp    $0xa,%al
    145f:	74 08                	je     1469 <gets+0x49>
  for(i=0; i+1 < max; ){
    1461:	8d 5e 01             	lea    0x1(%esi),%ebx
    1464:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1467:	7c c7                	jl     1430 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1469:	8b 45 08             	mov    0x8(%ebp),%eax
    146c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1470:	83 c4 2c             	add    $0x2c,%esp
    1473:	5b                   	pop    %ebx
    1474:	5e                   	pop    %esi
    1475:	5f                   	pop    %edi
    1476:	5d                   	pop    %ebp
    1477:	c3                   	ret    
    1478:	90                   	nop
    1479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001480 <stat>:

int
stat(char *n, struct stat *st)
{
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	56                   	push   %esi
    1484:	53                   	push   %ebx
    1485:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1488:	8b 45 08             	mov    0x8(%ebp),%eax
    148b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1492:	00 
    1493:	89 04 24             	mov    %eax,(%esp)
    1496:	e8 d7 00 00 00       	call   1572 <open>
  if(fd < 0)
    149b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    149d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    149f:	78 27                	js     14c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    14a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    14a4:	89 1c 24             	mov    %ebx,(%esp)
    14a7:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ab:	e8 da 00 00 00       	call   158a <fstat>
  close(fd);
    14b0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    14b3:	89 c6                	mov    %eax,%esi
  close(fd);
    14b5:	e8 a0 00 00 00       	call   155a <close>
  return r;
    14ba:	89 f0                	mov    %esi,%eax
}
    14bc:	83 c4 10             	add    $0x10,%esp
    14bf:	5b                   	pop    %ebx
    14c0:	5e                   	pop    %esi
    14c1:	5d                   	pop    %ebp
    14c2:	c3                   	ret    
    14c3:	90                   	nop
    14c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    14c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    14cd:	eb ed                	jmp    14bc <stat+0x3c>
    14cf:	90                   	nop

000014d0 <atoi>:

int
atoi(const char *s)
{
    14d0:	55                   	push   %ebp
    14d1:	89 e5                	mov    %esp,%ebp
    14d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    14d6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    14d7:	0f be 11             	movsbl (%ecx),%edx
    14da:	8d 42 d0             	lea    -0x30(%edx),%eax
    14dd:	3c 09                	cmp    $0x9,%al
  n = 0;
    14df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    14e4:	77 17                	ja     14fd <atoi+0x2d>
    14e6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    14e8:	83 c1 01             	add    $0x1,%ecx
    14eb:	8d 04 80             	lea    (%eax,%eax,4),%eax
    14ee:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    14f2:	0f be 11             	movsbl (%ecx),%edx
    14f5:	8d 5a d0             	lea    -0x30(%edx),%ebx
    14f8:	80 fb 09             	cmp    $0x9,%bl
    14fb:	76 eb                	jbe    14e8 <atoi+0x18>
  return n;
}
    14fd:	5b                   	pop    %ebx
    14fe:	5d                   	pop    %ebp
    14ff:	c3                   	ret    

00001500 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1500:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1501:	31 d2                	xor    %edx,%edx
{
    1503:	89 e5                	mov    %esp,%ebp
    1505:	56                   	push   %esi
    1506:	8b 45 08             	mov    0x8(%ebp),%eax
    1509:	53                   	push   %ebx
    150a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    150d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1510:	85 db                	test   %ebx,%ebx
    1512:	7e 12                	jle    1526 <memmove+0x26>
    1514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1518:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    151c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    151f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1522:	39 da                	cmp    %ebx,%edx
    1524:	75 f2                	jne    1518 <memmove+0x18>
  return vdst;
}
    1526:	5b                   	pop    %ebx
    1527:	5e                   	pop    %esi
    1528:	5d                   	pop    %ebp
    1529:	c3                   	ret    

0000152a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    152a:	b8 01 00 00 00       	mov    $0x1,%eax
    152f:	cd 40                	int    $0x40
    1531:	c3                   	ret    

00001532 <exit>:
SYSCALL(exit)
    1532:	b8 02 00 00 00       	mov    $0x2,%eax
    1537:	cd 40                	int    $0x40
    1539:	c3                   	ret    

0000153a <wait>:
SYSCALL(wait)
    153a:	b8 03 00 00 00       	mov    $0x3,%eax
    153f:	cd 40                	int    $0x40
    1541:	c3                   	ret    

00001542 <pipe>:
SYSCALL(pipe)
    1542:	b8 04 00 00 00       	mov    $0x4,%eax
    1547:	cd 40                	int    $0x40
    1549:	c3                   	ret    

0000154a <read>:
SYSCALL(read)
    154a:	b8 05 00 00 00       	mov    $0x5,%eax
    154f:	cd 40                	int    $0x40
    1551:	c3                   	ret    

00001552 <write>:
SYSCALL(write)
    1552:	b8 10 00 00 00       	mov    $0x10,%eax
    1557:	cd 40                	int    $0x40
    1559:	c3                   	ret    

0000155a <close>:
SYSCALL(close)
    155a:	b8 15 00 00 00       	mov    $0x15,%eax
    155f:	cd 40                	int    $0x40
    1561:	c3                   	ret    

00001562 <kill>:
SYSCALL(kill)
    1562:	b8 06 00 00 00       	mov    $0x6,%eax
    1567:	cd 40                	int    $0x40
    1569:	c3                   	ret    

0000156a <exec>:
SYSCALL(exec)
    156a:	b8 07 00 00 00       	mov    $0x7,%eax
    156f:	cd 40                	int    $0x40
    1571:	c3                   	ret    

00001572 <open>:
SYSCALL(open)
    1572:	b8 0f 00 00 00       	mov    $0xf,%eax
    1577:	cd 40                	int    $0x40
    1579:	c3                   	ret    

0000157a <mknod>:
SYSCALL(mknod)
    157a:	b8 11 00 00 00       	mov    $0x11,%eax
    157f:	cd 40                	int    $0x40
    1581:	c3                   	ret    

00001582 <unlink>:
SYSCALL(unlink)
    1582:	b8 12 00 00 00       	mov    $0x12,%eax
    1587:	cd 40                	int    $0x40
    1589:	c3                   	ret    

0000158a <fstat>:
SYSCALL(fstat)
    158a:	b8 08 00 00 00       	mov    $0x8,%eax
    158f:	cd 40                	int    $0x40
    1591:	c3                   	ret    

00001592 <link>:
SYSCALL(link)
    1592:	b8 13 00 00 00       	mov    $0x13,%eax
    1597:	cd 40                	int    $0x40
    1599:	c3                   	ret    

0000159a <mkdir>:
SYSCALL(mkdir)
    159a:	b8 14 00 00 00       	mov    $0x14,%eax
    159f:	cd 40                	int    $0x40
    15a1:	c3                   	ret    

000015a2 <chdir>:
SYSCALL(chdir)
    15a2:	b8 09 00 00 00       	mov    $0x9,%eax
    15a7:	cd 40                	int    $0x40
    15a9:	c3                   	ret    

000015aa <dup>:
SYSCALL(dup)
    15aa:	b8 0a 00 00 00       	mov    $0xa,%eax
    15af:	cd 40                	int    $0x40
    15b1:	c3                   	ret    

000015b2 <getpid>:
SYSCALL(getpid)
    15b2:	b8 0b 00 00 00       	mov    $0xb,%eax
    15b7:	cd 40                	int    $0x40
    15b9:	c3                   	ret    

000015ba <sbrk>:
SYSCALL(sbrk)
    15ba:	b8 0c 00 00 00       	mov    $0xc,%eax
    15bf:	cd 40                	int    $0x40
    15c1:	c3                   	ret    

000015c2 <sleep>:
SYSCALL(sleep)
    15c2:	b8 0d 00 00 00       	mov    $0xd,%eax
    15c7:	cd 40                	int    $0x40
    15c9:	c3                   	ret    

000015ca <uptime>:
SYSCALL(uptime)
    15ca:	b8 0e 00 00 00       	mov    $0xe,%eax
    15cf:	cd 40                	int    $0x40
    15d1:	c3                   	ret    

000015d2 <shm_open>:
SYSCALL(shm_open)
    15d2:	b8 16 00 00 00       	mov    $0x16,%eax
    15d7:	cd 40                	int    $0x40
    15d9:	c3                   	ret    

000015da <shm_close>:
SYSCALL(shm_close)	
    15da:	b8 17 00 00 00       	mov    $0x17,%eax
    15df:	cd 40                	int    $0x40
    15e1:	c3                   	ret    
    15e2:	66 90                	xchg   %ax,%ax
    15e4:	66 90                	xchg   %ax,%ax
    15e6:	66 90                	xchg   %ax,%ax
    15e8:	66 90                	xchg   %ax,%ax
    15ea:	66 90                	xchg   %ax,%ax
    15ec:	66 90                	xchg   %ax,%ax
    15ee:	66 90                	xchg   %ax,%ax

000015f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    15f0:	55                   	push   %ebp
    15f1:	89 e5                	mov    %esp,%ebp
    15f3:	57                   	push   %edi
    15f4:	56                   	push   %esi
    15f5:	89 c6                	mov    %eax,%esi
    15f7:	53                   	push   %ebx
    15f8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    15fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15fe:	85 db                	test   %ebx,%ebx
    1600:	74 09                	je     160b <printint+0x1b>
    1602:	89 d0                	mov    %edx,%eax
    1604:	c1 e8 1f             	shr    $0x1f,%eax
    1607:	84 c0                	test   %al,%al
    1609:	75 75                	jne    1680 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    160b:	89 d0                	mov    %edx,%eax
  neg = 0;
    160d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1614:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1617:	31 ff                	xor    %edi,%edi
    1619:	89 ce                	mov    %ecx,%esi
    161b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    161e:	eb 02                	jmp    1622 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1620:	89 cf                	mov    %ecx,%edi
    1622:	31 d2                	xor    %edx,%edx
    1624:	f7 f6                	div    %esi
    1626:	8d 4f 01             	lea    0x1(%edi),%ecx
    1629:	0f b6 92 71 1a 00 00 	movzbl 0x1a71(%edx),%edx
  }while((x /= base) != 0);
    1630:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1632:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1635:	75 e9                	jne    1620 <printint+0x30>
  if(neg)
    1637:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    163a:	89 c8                	mov    %ecx,%eax
    163c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    163f:	85 d2                	test   %edx,%edx
    1641:	74 08                	je     164b <printint+0x5b>
    buf[i++] = '-';
    1643:	8d 4f 02             	lea    0x2(%edi),%ecx
    1646:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    164b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    164e:	66 90                	xchg   %ax,%ax
    1650:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1655:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    1658:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    165f:	00 
    1660:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1664:	89 34 24             	mov    %esi,(%esp)
    1667:	88 45 d7             	mov    %al,-0x29(%ebp)
    166a:	e8 e3 fe ff ff       	call   1552 <write>
  while(--i >= 0)
    166f:	83 ff ff             	cmp    $0xffffffff,%edi
    1672:	75 dc                	jne    1650 <printint+0x60>
    putc(fd, buf[i]);
}
    1674:	83 c4 4c             	add    $0x4c,%esp
    1677:	5b                   	pop    %ebx
    1678:	5e                   	pop    %esi
    1679:	5f                   	pop    %edi
    167a:	5d                   	pop    %ebp
    167b:	c3                   	ret    
    167c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    1680:	89 d0                	mov    %edx,%eax
    1682:	f7 d8                	neg    %eax
    neg = 1;
    1684:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    168b:	eb 87                	jmp    1614 <printint+0x24>
    168d:	8d 76 00             	lea    0x0(%esi),%esi

00001690 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1690:	55                   	push   %ebp
    1691:	89 e5                	mov    %esp,%ebp
    1693:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1694:	31 ff                	xor    %edi,%edi
{
    1696:	56                   	push   %esi
    1697:	53                   	push   %ebx
    1698:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    169b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    169e:	8d 45 10             	lea    0x10(%ebp),%eax
{
    16a1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    16a4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    16a7:	0f b6 13             	movzbl (%ebx),%edx
    16aa:	83 c3 01             	add    $0x1,%ebx
    16ad:	84 d2                	test   %dl,%dl
    16af:	75 39                	jne    16ea <printf+0x5a>
    16b1:	e9 c2 00 00 00       	jmp    1778 <printf+0xe8>
    16b6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    16b8:	83 fa 25             	cmp    $0x25,%edx
    16bb:	0f 84 bf 00 00 00    	je     1780 <printf+0xf0>
  write(fd, &c, 1);
    16c1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    16c4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    16cb:	00 
    16cc:	89 44 24 04          	mov    %eax,0x4(%esp)
    16d0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    16d3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    16d6:	e8 77 fe ff ff       	call   1552 <write>
    16db:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    16de:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    16e2:	84 d2                	test   %dl,%dl
    16e4:	0f 84 8e 00 00 00    	je     1778 <printf+0xe8>
    if(state == 0){
    16ea:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    16ec:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    16ef:	74 c7                	je     16b8 <printf+0x28>
      }
    } else if(state == '%'){
    16f1:	83 ff 25             	cmp    $0x25,%edi
    16f4:	75 e5                	jne    16db <printf+0x4b>
      if(c == 'd'){
    16f6:	83 fa 64             	cmp    $0x64,%edx
    16f9:	0f 84 31 01 00 00    	je     1830 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    16ff:	25 f7 00 00 00       	and    $0xf7,%eax
    1704:	83 f8 70             	cmp    $0x70,%eax
    1707:	0f 84 83 00 00 00    	je     1790 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    170d:	83 fa 73             	cmp    $0x73,%edx
    1710:	0f 84 a2 00 00 00    	je     17b8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1716:	83 fa 63             	cmp    $0x63,%edx
    1719:	0f 84 35 01 00 00    	je     1854 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    171f:	83 fa 25             	cmp    $0x25,%edx
    1722:	0f 84 e0 00 00 00    	je     1808 <printf+0x178>
  write(fd, &c, 1);
    1728:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    172b:	83 c3 01             	add    $0x1,%ebx
    172e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1735:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1736:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1738:	89 44 24 04          	mov    %eax,0x4(%esp)
    173c:	89 34 24             	mov    %esi,(%esp)
    173f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1742:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1746:	e8 07 fe ff ff       	call   1552 <write>
        putc(fd, c);
    174b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    174e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1751:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1758:	00 
    1759:	89 44 24 04          	mov    %eax,0x4(%esp)
    175d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    1760:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    1763:	e8 ea fd ff ff       	call   1552 <write>
  for(i = 0; fmt[i]; i++){
    1768:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    176c:	84 d2                	test   %dl,%dl
    176e:	0f 85 76 ff ff ff    	jne    16ea <printf+0x5a>
    1774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    1778:	83 c4 3c             	add    $0x3c,%esp
    177b:	5b                   	pop    %ebx
    177c:	5e                   	pop    %esi
    177d:	5f                   	pop    %edi
    177e:	5d                   	pop    %ebp
    177f:	c3                   	ret    
        state = '%';
    1780:	bf 25 00 00 00       	mov    $0x25,%edi
    1785:	e9 51 ff ff ff       	jmp    16db <printf+0x4b>
    178a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1790:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1793:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    1798:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    179a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17a1:	8b 10                	mov    (%eax),%edx
    17a3:	89 f0                	mov    %esi,%eax
    17a5:	e8 46 fe ff ff       	call   15f0 <printint>
        ap++;
    17aa:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    17ae:	e9 28 ff ff ff       	jmp    16db <printf+0x4b>
    17b3:	90                   	nop
    17b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    17b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    17bb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    17bf:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    17c1:	b8 6a 1a 00 00       	mov    $0x1a6a,%eax
    17c6:	85 ff                	test   %edi,%edi
    17c8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    17cb:	0f b6 07             	movzbl (%edi),%eax
    17ce:	84 c0                	test   %al,%al
    17d0:	74 2a                	je     17fc <printf+0x16c>
    17d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    17d8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    17db:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    17de:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    17e1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    17e8:	00 
    17e9:	89 44 24 04          	mov    %eax,0x4(%esp)
    17ed:	89 34 24             	mov    %esi,(%esp)
    17f0:	e8 5d fd ff ff       	call   1552 <write>
        while(*s != 0){
    17f5:	0f b6 07             	movzbl (%edi),%eax
    17f8:	84 c0                	test   %al,%al
    17fa:	75 dc                	jne    17d8 <printf+0x148>
      state = 0;
    17fc:	31 ff                	xor    %edi,%edi
    17fe:	e9 d8 fe ff ff       	jmp    16db <printf+0x4b>
    1803:	90                   	nop
    1804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1808:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    180b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    180d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1814:	00 
    1815:	89 44 24 04          	mov    %eax,0x4(%esp)
    1819:	89 34 24             	mov    %esi,(%esp)
    181c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1820:	e8 2d fd ff ff       	call   1552 <write>
    1825:	e9 b1 fe ff ff       	jmp    16db <printf+0x4b>
    182a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1830:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1833:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    1838:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    183b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1842:	8b 10                	mov    (%eax),%edx
    1844:	89 f0                	mov    %esi,%eax
    1846:	e8 a5 fd ff ff       	call   15f0 <printint>
        ap++;
    184b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    184f:	e9 87 fe ff ff       	jmp    16db <printf+0x4b>
        putc(fd, *ap);
    1854:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    1857:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    1859:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    185b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1862:	00 
    1863:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    1866:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    1869:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    186c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1870:	e8 dd fc ff ff       	call   1552 <write>
        ap++;
    1875:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1879:	e9 5d fe ff ff       	jmp    16db <printf+0x4b>
    187e:	66 90                	xchg   %ax,%ax

00001880 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1880:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1881:	a1 20 1e 00 00       	mov    0x1e20,%eax
{
    1886:	89 e5                	mov    %esp,%ebp
    1888:	57                   	push   %edi
    1889:	56                   	push   %esi
    188a:	53                   	push   %ebx
    188b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    188e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    1890:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1893:	39 d0                	cmp    %edx,%eax
    1895:	72 11                	jb     18a8 <free+0x28>
    1897:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1898:	39 c8                	cmp    %ecx,%eax
    189a:	72 04                	jb     18a0 <free+0x20>
    189c:	39 ca                	cmp    %ecx,%edx
    189e:	72 10                	jb     18b0 <free+0x30>
    18a0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18a2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    18a4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18a6:	73 f0                	jae    1898 <free+0x18>
    18a8:	39 ca                	cmp    %ecx,%edx
    18aa:	72 04                	jb     18b0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    18ac:	39 c8                	cmp    %ecx,%eax
    18ae:	72 f0                	jb     18a0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    18b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    18b3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    18b6:	39 cf                	cmp    %ecx,%edi
    18b8:	74 1e                	je     18d8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    18ba:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    18bd:	8b 48 04             	mov    0x4(%eax),%ecx
    18c0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    18c3:	39 f2                	cmp    %esi,%edx
    18c5:	74 28                	je     18ef <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    18c7:	89 10                	mov    %edx,(%eax)
  freep = p;
    18c9:	a3 20 1e 00 00       	mov    %eax,0x1e20
}
    18ce:	5b                   	pop    %ebx
    18cf:	5e                   	pop    %esi
    18d0:	5f                   	pop    %edi
    18d1:	5d                   	pop    %ebp
    18d2:	c3                   	ret    
    18d3:	90                   	nop
    18d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    18d8:	03 71 04             	add    0x4(%ecx),%esi
    18db:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    18de:	8b 08                	mov    (%eax),%ecx
    18e0:	8b 09                	mov    (%ecx),%ecx
    18e2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    18e5:	8b 48 04             	mov    0x4(%eax),%ecx
    18e8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    18eb:	39 f2                	cmp    %esi,%edx
    18ed:	75 d8                	jne    18c7 <free+0x47>
    p->s.size += bp->s.size;
    18ef:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    18f2:	a3 20 1e 00 00       	mov    %eax,0x1e20
    p->s.size += bp->s.size;
    18f7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    18fa:	8b 53 f8             	mov    -0x8(%ebx),%edx
    18fd:	89 10                	mov    %edx,(%eax)
}
    18ff:	5b                   	pop    %ebx
    1900:	5e                   	pop    %esi
    1901:	5f                   	pop    %edi
    1902:	5d                   	pop    %ebp
    1903:	c3                   	ret    
    1904:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    190a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001910 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1910:	55                   	push   %ebp
    1911:	89 e5                	mov    %esp,%ebp
    1913:	57                   	push   %edi
    1914:	56                   	push   %esi
    1915:	53                   	push   %ebx
    1916:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1919:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    191c:	8b 1d 20 1e 00 00    	mov    0x1e20,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1922:	8d 48 07             	lea    0x7(%eax),%ecx
    1925:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1928:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    192a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    192d:	0f 84 9b 00 00 00    	je     19ce <malloc+0xbe>
    1933:	8b 13                	mov    (%ebx),%edx
    1935:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1938:	39 fe                	cmp    %edi,%esi
    193a:	76 64                	jbe    19a0 <malloc+0x90>
    193c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    1943:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1948:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    194b:	eb 0e                	jmp    195b <malloc+0x4b>
    194d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1950:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1952:	8b 78 04             	mov    0x4(%eax),%edi
    1955:	39 fe                	cmp    %edi,%esi
    1957:	76 4f                	jbe    19a8 <malloc+0x98>
    1959:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    195b:	3b 15 20 1e 00 00    	cmp    0x1e20,%edx
    1961:	75 ed                	jne    1950 <malloc+0x40>
  if(nu < 4096)
    1963:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1966:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    196c:	bf 00 10 00 00       	mov    $0x1000,%edi
    1971:	0f 43 fe             	cmovae %esi,%edi
    1974:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    1977:	89 04 24             	mov    %eax,(%esp)
    197a:	e8 3b fc ff ff       	call   15ba <sbrk>
  if(p == (char*)-1)
    197f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1982:	74 18                	je     199c <malloc+0x8c>
  hp->s.size = nu;
    1984:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1987:	83 c0 08             	add    $0x8,%eax
    198a:	89 04 24             	mov    %eax,(%esp)
    198d:	e8 ee fe ff ff       	call   1880 <free>
  return freep;
    1992:	8b 15 20 1e 00 00    	mov    0x1e20,%edx
      if((p = morecore(nunits)) == 0)
    1998:	85 d2                	test   %edx,%edx
    199a:	75 b4                	jne    1950 <malloc+0x40>
        return 0;
    199c:	31 c0                	xor    %eax,%eax
    199e:	eb 20                	jmp    19c0 <malloc+0xb0>
    if(p->s.size >= nunits){
    19a0:	89 d0                	mov    %edx,%eax
    19a2:	89 da                	mov    %ebx,%edx
    19a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    19a8:	39 fe                	cmp    %edi,%esi
    19aa:	74 1c                	je     19c8 <malloc+0xb8>
        p->s.size -= nunits;
    19ac:	29 f7                	sub    %esi,%edi
    19ae:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    19b1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    19b4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    19b7:	89 15 20 1e 00 00    	mov    %edx,0x1e20
      return (void*)(p + 1);
    19bd:	83 c0 08             	add    $0x8,%eax
  }
}
    19c0:	83 c4 1c             	add    $0x1c,%esp
    19c3:	5b                   	pop    %ebx
    19c4:	5e                   	pop    %esi
    19c5:	5f                   	pop    %edi
    19c6:	5d                   	pop    %ebp
    19c7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    19c8:	8b 08                	mov    (%eax),%ecx
    19ca:	89 0a                	mov    %ecx,(%edx)
    19cc:	eb e9                	jmp    19b7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    19ce:	c7 05 20 1e 00 00 24 	movl   $0x1e24,0x1e20
    19d5:	1e 00 00 
    base.s.size = 0;
    19d8:	ba 24 1e 00 00       	mov    $0x1e24,%edx
    base.s.ptr = freep = prevp = &base;
    19dd:	c7 05 24 1e 00 00 24 	movl   $0x1e24,0x1e24
    19e4:	1e 00 00 
    base.s.size = 0;
    19e7:	c7 05 28 1e 00 00 00 	movl   $0x0,0x1e28
    19ee:	00 00 00 
    19f1:	e9 46 ff ff ff       	jmp    193c <malloc+0x2c>
    19f6:	66 90                	xchg   %ax,%ax
    19f8:	66 90                	xchg   %ax,%ax
    19fa:	66 90                	xchg   %ax,%ax
    19fc:	66 90                	xchg   %ax,%ax
    19fe:	66 90                	xchg   %ax,%ax

00001a00 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1a00:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1a01:	b9 01 00 00 00       	mov    $0x1,%ecx
    1a06:	89 e5                	mov    %esp,%ebp
    1a08:	8b 55 08             	mov    0x8(%ebp),%edx
    1a0b:	90                   	nop
    1a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1a10:	89 c8                	mov    %ecx,%eax
    1a12:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1a15:	85 c0                	test   %eax,%eax
    1a17:	75 f7                	jne    1a10 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1a19:	0f ae f0             	mfence 
}
    1a1c:	5d                   	pop    %ebp
    1a1d:	c3                   	ret    
    1a1e:	66 90                	xchg   %ax,%ax

00001a20 <urelease>:

void urelease (struct uspinlock *lk) {
    1a20:	55                   	push   %ebp
    1a21:	89 e5                	mov    %esp,%ebp
    1a23:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1a26:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1a29:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1a2f:	5d                   	pop    %ebp
    1a30:	c3                   	ret    
