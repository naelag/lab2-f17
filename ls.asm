
_ls:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
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
    101a:	7e 1b                	jle    1037 <main+0x37>
    101c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
    1020:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
  for(i=1; i<argc; i++)
    1023:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
    1026:	89 04 24             	mov    %eax,(%esp)
    1029:	e8 c2 00 00 00       	call   10f0 <ls>
  for(i=1; i<argc; i++)
    102e:	39 f3                	cmp    %esi,%ebx
    1030:	75 ee                	jne    1020 <main+0x20>
  exit();
    1032:	e8 6b 05 00 00       	call   15a2 <exit>
    ls(".");
    1037:	c7 04 24 e9 1a 00 00 	movl   $0x1ae9,(%esp)
    103e:	e8 ad 00 00 00       	call   10f0 <ls>
    exit();
    1043:	e8 5a 05 00 00       	call   15a2 <exit>
    1048:	66 90                	xchg   %ax,%ax
    104a:	66 90                	xchg   %ax,%ax
    104c:	66 90                	xchg   %ax,%ax
    104e:	66 90                	xchg   %ax,%ax

00001050 <fmtname>:
{
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	56                   	push   %esi
    1054:	53                   	push   %ebx
    1055:	83 ec 10             	sub    $0x10,%esp
    1058:	8b 5d 08             	mov    0x8(%ebp),%ebx
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    105b:	89 1c 24             	mov    %ebx,(%esp)
    105e:	e8 9d 03 00 00       	call   1400 <strlen>
    1063:	01 d8                	add    %ebx,%eax
    1065:	73 10                	jae    1077 <fmtname+0x27>
    1067:	eb 13                	jmp    107c <fmtname+0x2c>
    1069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1070:	83 e8 01             	sub    $0x1,%eax
    1073:	39 c3                	cmp    %eax,%ebx
    1075:	77 05                	ja     107c <fmtname+0x2c>
    1077:	80 38 2f             	cmpb   $0x2f,(%eax)
    107a:	75 f4                	jne    1070 <fmtname+0x20>
  p++;
    107c:	8d 58 01             	lea    0x1(%eax),%ebx
  if(strlen(p) >= DIRSIZ)
    107f:	89 1c 24             	mov    %ebx,(%esp)
    1082:	e8 79 03 00 00       	call   1400 <strlen>
    1087:	83 f8 0d             	cmp    $0xd,%eax
    108a:	77 53                	ja     10df <fmtname+0x8f>
  memmove(buf, p, strlen(p));
    108c:	89 1c 24             	mov    %ebx,(%esp)
    108f:	e8 6c 03 00 00       	call   1400 <strlen>
    1094:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1098:	c7 04 24 14 1e 00 00 	movl   $0x1e14,(%esp)
    109f:	89 44 24 08          	mov    %eax,0x8(%esp)
    10a3:	e8 c8 04 00 00       	call   1570 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    10a8:	89 1c 24             	mov    %ebx,(%esp)
    10ab:	e8 50 03 00 00       	call   1400 <strlen>
    10b0:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
    10b3:	bb 14 1e 00 00       	mov    $0x1e14,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    10b8:	89 c6                	mov    %eax,%esi
    10ba:	e8 41 03 00 00       	call   1400 <strlen>
    10bf:	ba 0e 00 00 00       	mov    $0xe,%edx
    10c4:	29 f2                	sub    %esi,%edx
    10c6:	89 54 24 08          	mov    %edx,0x8(%esp)
    10ca:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    10d1:	00 
    10d2:	05 14 1e 00 00       	add    $0x1e14,%eax
    10d7:	89 04 24             	mov    %eax,(%esp)
    10da:	e8 51 03 00 00       	call   1430 <memset>
}
    10df:	83 c4 10             	add    $0x10,%esp
    10e2:	89 d8                	mov    %ebx,%eax
    10e4:	5b                   	pop    %ebx
    10e5:	5e                   	pop    %esi
    10e6:	5d                   	pop    %ebp
    10e7:	c3                   	ret    
    10e8:	90                   	nop
    10e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000010f0 <ls>:
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	57                   	push   %edi
    10f4:	56                   	push   %esi
    10f5:	53                   	push   %ebx
    10f6:	81 ec 6c 02 00 00    	sub    $0x26c,%esp
    10fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
    10ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1106:	00 
    1107:	89 3c 24             	mov    %edi,(%esp)
    110a:	e8 d3 04 00 00       	call   15e2 <open>
    110f:	85 c0                	test   %eax,%eax
    1111:	89 c3                	mov    %eax,%ebx
    1113:	0f 88 c7 01 00 00    	js     12e0 <ls+0x1f0>
  if(fstat(fd, &st) < 0){
    1119:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
    111f:	89 74 24 04          	mov    %esi,0x4(%esp)
    1123:	89 04 24             	mov    %eax,(%esp)
    1126:	e8 cf 04 00 00       	call   15fa <fstat>
    112b:	85 c0                	test   %eax,%eax
    112d:	0f 88 f5 01 00 00    	js     1328 <ls+0x238>
  switch(st.type){
    1133:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
    113a:	66 83 f8 01          	cmp    $0x1,%ax
    113e:	74 68                	je     11a8 <ls+0xb8>
    1140:	66 83 f8 02          	cmp    $0x2,%ax
    1144:	75 48                	jne    118e <ls+0x9e>
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    1146:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
    114c:	89 3c 24             	mov    %edi,(%esp)
    114f:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
    1155:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
    115b:	e8 f0 fe ff ff       	call   1050 <fmtname>
    1160:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
    1166:	89 74 24 10          	mov    %esi,0x10(%esp)
    116a:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
    1171:	00 
    1172:	c7 44 24 04 c9 1a 00 	movl   $0x1ac9,0x4(%esp)
    1179:	00 
    117a:	89 54 24 14          	mov    %edx,0x14(%esp)
    117e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1185:	89 44 24 08          	mov    %eax,0x8(%esp)
    1189:	e8 72 05 00 00       	call   1700 <printf>
  close(fd);
    118e:	89 1c 24             	mov    %ebx,(%esp)
    1191:	e8 34 04 00 00       	call   15ca <close>
}
    1196:	81 c4 6c 02 00 00    	add    $0x26c,%esp
    119c:	5b                   	pop    %ebx
    119d:	5e                   	pop    %esi
    119e:	5f                   	pop    %edi
    119f:	5d                   	pop    %ebp
    11a0:	c3                   	ret    
    11a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
    11a8:	89 3c 24             	mov    %edi,(%esp)
    11ab:	e8 50 02 00 00       	call   1400 <strlen>
    11b0:	83 c0 10             	add    $0x10,%eax
    11b3:	3d 00 02 00 00       	cmp    $0x200,%eax
    11b8:	0f 87 4a 01 00 00    	ja     1308 <ls+0x218>
    strcpy(buf, path);
    11be:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    11c4:	89 7c 24 04          	mov    %edi,0x4(%esp)
    11c8:	8d bd c4 fd ff ff    	lea    -0x23c(%ebp),%edi
    11ce:	89 04 24             	mov    %eax,(%esp)
    11d1:	e8 aa 01 00 00       	call   1380 <strcpy>
    p = buf+strlen(buf);
    11d6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    11dc:	89 04 24             	mov    %eax,(%esp)
    11df:	e8 1c 02 00 00       	call   1400 <strlen>
    11e4:	8d 8d e8 fd ff ff    	lea    -0x218(%ebp),%ecx
    11ea:	01 c8                	add    %ecx,%eax
    *p++ = '/';
    11ec:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
    11ef:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
    11f5:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
    11fb:	c6 00 2f             	movb   $0x2f,(%eax)
    11fe:	66 90                	xchg   %ax,%ax
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    1200:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1207:	00 
    1208:	89 7c 24 04          	mov    %edi,0x4(%esp)
    120c:	89 1c 24             	mov    %ebx,(%esp)
    120f:	e8 a6 03 00 00       	call   15ba <read>
    1214:	83 f8 10             	cmp    $0x10,%eax
    1217:	0f 85 71 ff ff ff    	jne    118e <ls+0x9e>
      if(de.inum == 0)
    121d:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
    1224:	00 
    1225:	74 d9                	je     1200 <ls+0x110>
      memmove(p, de.name, DIRSIZ);
    1227:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
    122d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1231:	8b 85 a4 fd ff ff    	mov    -0x25c(%ebp),%eax
    1237:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    123e:	00 
    123f:	89 04 24             	mov    %eax,(%esp)
    1242:	e8 29 03 00 00       	call   1570 <memmove>
      p[DIRSIZ] = 0;
    1247:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
    124d:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
    1251:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    1257:	89 74 24 04          	mov    %esi,0x4(%esp)
    125b:	89 04 24             	mov    %eax,(%esp)
    125e:	e8 8d 02 00 00       	call   14f0 <stat>
    1263:	85 c0                	test   %eax,%eax
    1265:	0f 88 e5 00 00 00    	js     1350 <ls+0x260>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    126b:	0f bf 95 d4 fd ff ff 	movswl -0x22c(%ebp),%edx
    1272:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
    1278:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    127e:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
    1284:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    128a:	89 14 24             	mov    %edx,(%esp)
    128d:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
    1293:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    1299:	e8 b2 fd ff ff       	call   1050 <fmtname>
    129e:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
    12a4:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
    12aa:	c7 44 24 04 c9 1a 00 	movl   $0x1ac9,0x4(%esp)
    12b1:	00 
    12b2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12b9:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    12bd:	8b 8d b4 fd ff ff    	mov    -0x24c(%ebp),%ecx
    12c3:	89 54 24 0c          	mov    %edx,0xc(%esp)
    12c7:	89 44 24 08          	mov    %eax,0x8(%esp)
    12cb:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    12cf:	e8 2c 04 00 00       	call   1700 <printf>
    12d4:	e9 27 ff ff ff       	jmp    1200 <ls+0x110>
    12d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "ls: cannot open %s\n", path);
    12e0:	89 7c 24 08          	mov    %edi,0x8(%esp)
    12e4:	c7 44 24 04 a1 1a 00 	movl   $0x1aa1,0x4(%esp)
    12eb:	00 
    12ec:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    12f3:	e8 08 04 00 00       	call   1700 <printf>
}
    12f8:	81 c4 6c 02 00 00    	add    $0x26c,%esp
    12fe:	5b                   	pop    %ebx
    12ff:	5e                   	pop    %esi
    1300:	5f                   	pop    %edi
    1301:	5d                   	pop    %ebp
    1302:	c3                   	ret    
    1303:	90                   	nop
    1304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "ls: path too long\n");
    1308:	c7 44 24 04 d6 1a 00 	movl   $0x1ad6,0x4(%esp)
    130f:	00 
    1310:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1317:	e8 e4 03 00 00       	call   1700 <printf>
      break;
    131c:	e9 6d fe ff ff       	jmp    118e <ls+0x9e>
    1321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "ls: cannot stat %s\n", path);
    1328:	89 7c 24 08          	mov    %edi,0x8(%esp)
    132c:	c7 44 24 04 b5 1a 00 	movl   $0x1ab5,0x4(%esp)
    1333:	00 
    1334:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    133b:	e8 c0 03 00 00       	call   1700 <printf>
    close(fd);
    1340:	89 1c 24             	mov    %ebx,(%esp)
    1343:	e8 82 02 00 00       	call   15ca <close>
    return;
    1348:	e9 49 fe ff ff       	jmp    1196 <ls+0xa6>
    134d:	8d 76 00             	lea    0x0(%esi),%esi
        printf(1, "ls: cannot stat %s\n", buf);
    1350:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    1356:	89 44 24 08          	mov    %eax,0x8(%esp)
    135a:	c7 44 24 04 b5 1a 00 	movl   $0x1ab5,0x4(%esp)
    1361:	00 
    1362:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1369:	e8 92 03 00 00       	call   1700 <printf>
        continue;
    136e:	e9 8d fe ff ff       	jmp    1200 <ls+0x110>
    1373:	66 90                	xchg   %ax,%ax
    1375:	66 90                	xchg   %ax,%ax
    1377:	66 90                	xchg   %ax,%ax
    1379:	66 90                	xchg   %ax,%ax
    137b:	66 90                	xchg   %ax,%ax
    137d:	66 90                	xchg   %ax,%ax
    137f:	90                   	nop

00001380 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	8b 45 08             	mov    0x8(%ebp),%eax
    1386:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1389:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    138a:	89 c2                	mov    %eax,%edx
    138c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1390:	83 c1 01             	add    $0x1,%ecx
    1393:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1397:	83 c2 01             	add    $0x1,%edx
    139a:	84 db                	test   %bl,%bl
    139c:	88 5a ff             	mov    %bl,-0x1(%edx)
    139f:	75 ef                	jne    1390 <strcpy+0x10>
    ;
  return os;
}
    13a1:	5b                   	pop    %ebx
    13a2:	5d                   	pop    %ebp
    13a3:	c3                   	ret    
    13a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000013b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    13b0:	55                   	push   %ebp
    13b1:	89 e5                	mov    %esp,%ebp
    13b3:	8b 55 08             	mov    0x8(%ebp),%edx
    13b6:	53                   	push   %ebx
    13b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    13ba:	0f b6 02             	movzbl (%edx),%eax
    13bd:	84 c0                	test   %al,%al
    13bf:	74 2d                	je     13ee <strcmp+0x3e>
    13c1:	0f b6 19             	movzbl (%ecx),%ebx
    13c4:	38 d8                	cmp    %bl,%al
    13c6:	74 0e                	je     13d6 <strcmp+0x26>
    13c8:	eb 2b                	jmp    13f5 <strcmp+0x45>
    13ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13d0:	38 c8                	cmp    %cl,%al
    13d2:	75 15                	jne    13e9 <strcmp+0x39>
    p++, q++;
    13d4:	89 d9                	mov    %ebx,%ecx
    13d6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    13d9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    13dc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    13df:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    13e3:	84 c0                	test   %al,%al
    13e5:	75 e9                	jne    13d0 <strcmp+0x20>
    13e7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    13e9:	29 c8                	sub    %ecx,%eax
}
    13eb:	5b                   	pop    %ebx
    13ec:	5d                   	pop    %ebp
    13ed:	c3                   	ret    
    13ee:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    13f1:	31 c0                	xor    %eax,%eax
    13f3:	eb f4                	jmp    13e9 <strcmp+0x39>
    13f5:	0f b6 cb             	movzbl %bl,%ecx
    13f8:	eb ef                	jmp    13e9 <strcmp+0x39>
    13fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001400 <strlen>:

uint
strlen(char *s)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1406:	80 39 00             	cmpb   $0x0,(%ecx)
    1409:	74 12                	je     141d <strlen+0x1d>
    140b:	31 d2                	xor    %edx,%edx
    140d:	8d 76 00             	lea    0x0(%esi),%esi
    1410:	83 c2 01             	add    $0x1,%edx
    1413:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1417:	89 d0                	mov    %edx,%eax
    1419:	75 f5                	jne    1410 <strlen+0x10>
    ;
  return n;
}
    141b:	5d                   	pop    %ebp
    141c:	c3                   	ret    
  for(n = 0; s[n]; n++)
    141d:	31 c0                	xor    %eax,%eax
}
    141f:	5d                   	pop    %ebp
    1420:	c3                   	ret    
    1421:	eb 0d                	jmp    1430 <memset>
    1423:	90                   	nop
    1424:	90                   	nop
    1425:	90                   	nop
    1426:	90                   	nop
    1427:	90                   	nop
    1428:	90                   	nop
    1429:	90                   	nop
    142a:	90                   	nop
    142b:	90                   	nop
    142c:	90                   	nop
    142d:	90                   	nop
    142e:	90                   	nop
    142f:	90                   	nop

00001430 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	8b 55 08             	mov    0x8(%ebp),%edx
    1436:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1437:	8b 4d 10             	mov    0x10(%ebp),%ecx
    143a:	8b 45 0c             	mov    0xc(%ebp),%eax
    143d:	89 d7                	mov    %edx,%edi
    143f:	fc                   	cld    
    1440:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1442:	89 d0                	mov    %edx,%eax
    1444:	5f                   	pop    %edi
    1445:	5d                   	pop    %ebp
    1446:	c3                   	ret    
    1447:	89 f6                	mov    %esi,%esi
    1449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001450 <strchr>:

char*
strchr(const char *s, char c)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	8b 45 08             	mov    0x8(%ebp),%eax
    1456:	53                   	push   %ebx
    1457:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    145a:	0f b6 18             	movzbl (%eax),%ebx
    145d:	84 db                	test   %bl,%bl
    145f:	74 1d                	je     147e <strchr+0x2e>
    if(*s == c)
    1461:	38 d3                	cmp    %dl,%bl
    1463:	89 d1                	mov    %edx,%ecx
    1465:	75 0d                	jne    1474 <strchr+0x24>
    1467:	eb 17                	jmp    1480 <strchr+0x30>
    1469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1470:	38 ca                	cmp    %cl,%dl
    1472:	74 0c                	je     1480 <strchr+0x30>
  for(; *s; s++)
    1474:	83 c0 01             	add    $0x1,%eax
    1477:	0f b6 10             	movzbl (%eax),%edx
    147a:	84 d2                	test   %dl,%dl
    147c:	75 f2                	jne    1470 <strchr+0x20>
      return (char*)s;
  return 0;
    147e:	31 c0                	xor    %eax,%eax
}
    1480:	5b                   	pop    %ebx
    1481:	5d                   	pop    %ebp
    1482:	c3                   	ret    
    1483:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001490 <gets>:

char*
gets(char *buf, int max)
{
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	57                   	push   %edi
    1494:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1495:	31 f6                	xor    %esi,%esi
{
    1497:	53                   	push   %ebx
    1498:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    149b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    149e:	eb 31                	jmp    14d1 <gets+0x41>
    cc = read(0, &c, 1);
    14a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14a7:	00 
    14a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
    14ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    14b3:	e8 02 01 00 00       	call   15ba <read>
    if(cc < 1)
    14b8:	85 c0                	test   %eax,%eax
    14ba:	7e 1d                	jle    14d9 <gets+0x49>
      break;
    buf[i++] = c;
    14bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    14c0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    14c2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    14c5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    14c7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    14cb:	74 0c                	je     14d9 <gets+0x49>
    14cd:	3c 0a                	cmp    $0xa,%al
    14cf:	74 08                	je     14d9 <gets+0x49>
  for(i=0; i+1 < max; ){
    14d1:	8d 5e 01             	lea    0x1(%esi),%ebx
    14d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    14d7:	7c c7                	jl     14a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    14d9:	8b 45 08             	mov    0x8(%ebp),%eax
    14dc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    14e0:	83 c4 2c             	add    $0x2c,%esp
    14e3:	5b                   	pop    %ebx
    14e4:	5e                   	pop    %esi
    14e5:	5f                   	pop    %edi
    14e6:	5d                   	pop    %ebp
    14e7:	c3                   	ret    
    14e8:	90                   	nop
    14e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000014f0 <stat>:

int
stat(char *n, struct stat *st)
{
    14f0:	55                   	push   %ebp
    14f1:	89 e5                	mov    %esp,%ebp
    14f3:	56                   	push   %esi
    14f4:	53                   	push   %ebx
    14f5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14f8:	8b 45 08             	mov    0x8(%ebp),%eax
    14fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1502:	00 
    1503:	89 04 24             	mov    %eax,(%esp)
    1506:	e8 d7 00 00 00       	call   15e2 <open>
  if(fd < 0)
    150b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    150d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    150f:	78 27                	js     1538 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    1511:	8b 45 0c             	mov    0xc(%ebp),%eax
    1514:	89 1c 24             	mov    %ebx,(%esp)
    1517:	89 44 24 04          	mov    %eax,0x4(%esp)
    151b:	e8 da 00 00 00       	call   15fa <fstat>
  close(fd);
    1520:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1523:	89 c6                	mov    %eax,%esi
  close(fd);
    1525:	e8 a0 00 00 00       	call   15ca <close>
  return r;
    152a:	89 f0                	mov    %esi,%eax
}
    152c:	83 c4 10             	add    $0x10,%esp
    152f:	5b                   	pop    %ebx
    1530:	5e                   	pop    %esi
    1531:	5d                   	pop    %ebp
    1532:	c3                   	ret    
    1533:	90                   	nop
    1534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1538:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    153d:	eb ed                	jmp    152c <stat+0x3c>
    153f:	90                   	nop

00001540 <atoi>:

int
atoi(const char *s)
{
    1540:	55                   	push   %ebp
    1541:	89 e5                	mov    %esp,%ebp
    1543:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1546:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1547:	0f be 11             	movsbl (%ecx),%edx
    154a:	8d 42 d0             	lea    -0x30(%edx),%eax
    154d:	3c 09                	cmp    $0x9,%al
  n = 0;
    154f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1554:	77 17                	ja     156d <atoi+0x2d>
    1556:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1558:	83 c1 01             	add    $0x1,%ecx
    155b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    155e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1562:	0f be 11             	movsbl (%ecx),%edx
    1565:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1568:	80 fb 09             	cmp    $0x9,%bl
    156b:	76 eb                	jbe    1558 <atoi+0x18>
  return n;
}
    156d:	5b                   	pop    %ebx
    156e:	5d                   	pop    %ebp
    156f:	c3                   	ret    

00001570 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1570:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1571:	31 d2                	xor    %edx,%edx
{
    1573:	89 e5                	mov    %esp,%ebp
    1575:	56                   	push   %esi
    1576:	8b 45 08             	mov    0x8(%ebp),%eax
    1579:	53                   	push   %ebx
    157a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    157d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1580:	85 db                	test   %ebx,%ebx
    1582:	7e 12                	jle    1596 <memmove+0x26>
    1584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1588:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    158c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    158f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1592:	39 da                	cmp    %ebx,%edx
    1594:	75 f2                	jne    1588 <memmove+0x18>
  return vdst;
}
    1596:	5b                   	pop    %ebx
    1597:	5e                   	pop    %esi
    1598:	5d                   	pop    %ebp
    1599:	c3                   	ret    

0000159a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    159a:	b8 01 00 00 00       	mov    $0x1,%eax
    159f:	cd 40                	int    $0x40
    15a1:	c3                   	ret    

000015a2 <exit>:
SYSCALL(exit)
    15a2:	b8 02 00 00 00       	mov    $0x2,%eax
    15a7:	cd 40                	int    $0x40
    15a9:	c3                   	ret    

000015aa <wait>:
SYSCALL(wait)
    15aa:	b8 03 00 00 00       	mov    $0x3,%eax
    15af:	cd 40                	int    $0x40
    15b1:	c3                   	ret    

000015b2 <pipe>:
SYSCALL(pipe)
    15b2:	b8 04 00 00 00       	mov    $0x4,%eax
    15b7:	cd 40                	int    $0x40
    15b9:	c3                   	ret    

000015ba <read>:
SYSCALL(read)
    15ba:	b8 05 00 00 00       	mov    $0x5,%eax
    15bf:	cd 40                	int    $0x40
    15c1:	c3                   	ret    

000015c2 <write>:
SYSCALL(write)
    15c2:	b8 10 00 00 00       	mov    $0x10,%eax
    15c7:	cd 40                	int    $0x40
    15c9:	c3                   	ret    

000015ca <close>:
SYSCALL(close)
    15ca:	b8 15 00 00 00       	mov    $0x15,%eax
    15cf:	cd 40                	int    $0x40
    15d1:	c3                   	ret    

000015d2 <kill>:
SYSCALL(kill)
    15d2:	b8 06 00 00 00       	mov    $0x6,%eax
    15d7:	cd 40                	int    $0x40
    15d9:	c3                   	ret    

000015da <exec>:
SYSCALL(exec)
    15da:	b8 07 00 00 00       	mov    $0x7,%eax
    15df:	cd 40                	int    $0x40
    15e1:	c3                   	ret    

000015e2 <open>:
SYSCALL(open)
    15e2:	b8 0f 00 00 00       	mov    $0xf,%eax
    15e7:	cd 40                	int    $0x40
    15e9:	c3                   	ret    

000015ea <mknod>:
SYSCALL(mknod)
    15ea:	b8 11 00 00 00       	mov    $0x11,%eax
    15ef:	cd 40                	int    $0x40
    15f1:	c3                   	ret    

000015f2 <unlink>:
SYSCALL(unlink)
    15f2:	b8 12 00 00 00       	mov    $0x12,%eax
    15f7:	cd 40                	int    $0x40
    15f9:	c3                   	ret    

000015fa <fstat>:
SYSCALL(fstat)
    15fa:	b8 08 00 00 00       	mov    $0x8,%eax
    15ff:	cd 40                	int    $0x40
    1601:	c3                   	ret    

00001602 <link>:
SYSCALL(link)
    1602:	b8 13 00 00 00       	mov    $0x13,%eax
    1607:	cd 40                	int    $0x40
    1609:	c3                   	ret    

0000160a <mkdir>:
SYSCALL(mkdir)
    160a:	b8 14 00 00 00       	mov    $0x14,%eax
    160f:	cd 40                	int    $0x40
    1611:	c3                   	ret    

00001612 <chdir>:
SYSCALL(chdir)
    1612:	b8 09 00 00 00       	mov    $0x9,%eax
    1617:	cd 40                	int    $0x40
    1619:	c3                   	ret    

0000161a <dup>:
SYSCALL(dup)
    161a:	b8 0a 00 00 00       	mov    $0xa,%eax
    161f:	cd 40                	int    $0x40
    1621:	c3                   	ret    

00001622 <getpid>:
SYSCALL(getpid)
    1622:	b8 0b 00 00 00       	mov    $0xb,%eax
    1627:	cd 40                	int    $0x40
    1629:	c3                   	ret    

0000162a <sbrk>:
SYSCALL(sbrk)
    162a:	b8 0c 00 00 00       	mov    $0xc,%eax
    162f:	cd 40                	int    $0x40
    1631:	c3                   	ret    

00001632 <sleep>:
SYSCALL(sleep)
    1632:	b8 0d 00 00 00       	mov    $0xd,%eax
    1637:	cd 40                	int    $0x40
    1639:	c3                   	ret    

0000163a <uptime>:
SYSCALL(uptime)
    163a:	b8 0e 00 00 00       	mov    $0xe,%eax
    163f:	cd 40                	int    $0x40
    1641:	c3                   	ret    

00001642 <shm_open>:
SYSCALL(shm_open)
    1642:	b8 16 00 00 00       	mov    $0x16,%eax
    1647:	cd 40                	int    $0x40
    1649:	c3                   	ret    

0000164a <shm_close>:
SYSCALL(shm_close)	
    164a:	b8 17 00 00 00       	mov    $0x17,%eax
    164f:	cd 40                	int    $0x40
    1651:	c3                   	ret    
    1652:	66 90                	xchg   %ax,%ax
    1654:	66 90                	xchg   %ax,%ax
    1656:	66 90                	xchg   %ax,%ax
    1658:	66 90                	xchg   %ax,%ax
    165a:	66 90                	xchg   %ax,%ax
    165c:	66 90                	xchg   %ax,%ax
    165e:	66 90                	xchg   %ax,%ax

00001660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	57                   	push   %edi
    1664:	56                   	push   %esi
    1665:	89 c6                	mov    %eax,%esi
    1667:	53                   	push   %ebx
    1668:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    166b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    166e:	85 db                	test   %ebx,%ebx
    1670:	74 09                	je     167b <printint+0x1b>
    1672:	89 d0                	mov    %edx,%eax
    1674:	c1 e8 1f             	shr    $0x1f,%eax
    1677:	84 c0                	test   %al,%al
    1679:	75 75                	jne    16f0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    167b:	89 d0                	mov    %edx,%eax
  neg = 0;
    167d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1684:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1687:	31 ff                	xor    %edi,%edi
    1689:	89 ce                	mov    %ecx,%esi
    168b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    168e:	eb 02                	jmp    1692 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1690:	89 cf                	mov    %ecx,%edi
    1692:	31 d2                	xor    %edx,%edx
    1694:	f7 f6                	div    %esi
    1696:	8d 4f 01             	lea    0x1(%edi),%ecx
    1699:	0f b6 92 f2 1a 00 00 	movzbl 0x1af2(%edx),%edx
  }while((x /= base) != 0);
    16a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    16a2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    16a5:	75 e9                	jne    1690 <printint+0x30>
  if(neg)
    16a7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    16aa:	89 c8                	mov    %ecx,%eax
    16ac:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    16af:	85 d2                	test   %edx,%edx
    16b1:	74 08                	je     16bb <printint+0x5b>
    buf[i++] = '-';
    16b3:	8d 4f 02             	lea    0x2(%edi),%ecx
    16b6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    16bb:	8d 79 ff             	lea    -0x1(%ecx),%edi
    16be:	66 90                	xchg   %ax,%ax
    16c0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    16c5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    16c8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    16cf:	00 
    16d0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    16d4:	89 34 24             	mov    %esi,(%esp)
    16d7:	88 45 d7             	mov    %al,-0x29(%ebp)
    16da:	e8 e3 fe ff ff       	call   15c2 <write>
  while(--i >= 0)
    16df:	83 ff ff             	cmp    $0xffffffff,%edi
    16e2:	75 dc                	jne    16c0 <printint+0x60>
    putc(fd, buf[i]);
}
    16e4:	83 c4 4c             	add    $0x4c,%esp
    16e7:	5b                   	pop    %ebx
    16e8:	5e                   	pop    %esi
    16e9:	5f                   	pop    %edi
    16ea:	5d                   	pop    %ebp
    16eb:	c3                   	ret    
    16ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    16f0:	89 d0                	mov    %edx,%eax
    16f2:	f7 d8                	neg    %eax
    neg = 1;
    16f4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    16fb:	eb 87                	jmp    1684 <printint+0x24>
    16fd:	8d 76 00             	lea    0x0(%esi),%esi

00001700 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1700:	55                   	push   %ebp
    1701:	89 e5                	mov    %esp,%ebp
    1703:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1704:	31 ff                	xor    %edi,%edi
{
    1706:	56                   	push   %esi
    1707:	53                   	push   %ebx
    1708:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    170b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    170e:	8d 45 10             	lea    0x10(%ebp),%eax
{
    1711:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    1714:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    1717:	0f b6 13             	movzbl (%ebx),%edx
    171a:	83 c3 01             	add    $0x1,%ebx
    171d:	84 d2                	test   %dl,%dl
    171f:	75 39                	jne    175a <printf+0x5a>
    1721:	e9 c2 00 00 00       	jmp    17e8 <printf+0xe8>
    1726:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1728:	83 fa 25             	cmp    $0x25,%edx
    172b:	0f 84 bf 00 00 00    	je     17f0 <printf+0xf0>
  write(fd, &c, 1);
    1731:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1734:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    173b:	00 
    173c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1740:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    1743:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    1746:	e8 77 fe ff ff       	call   15c2 <write>
    174b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    174e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1752:	84 d2                	test   %dl,%dl
    1754:	0f 84 8e 00 00 00    	je     17e8 <printf+0xe8>
    if(state == 0){
    175a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    175c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    175f:	74 c7                	je     1728 <printf+0x28>
      }
    } else if(state == '%'){
    1761:	83 ff 25             	cmp    $0x25,%edi
    1764:	75 e5                	jne    174b <printf+0x4b>
      if(c == 'd'){
    1766:	83 fa 64             	cmp    $0x64,%edx
    1769:	0f 84 31 01 00 00    	je     18a0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    176f:	25 f7 00 00 00       	and    $0xf7,%eax
    1774:	83 f8 70             	cmp    $0x70,%eax
    1777:	0f 84 83 00 00 00    	je     1800 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    177d:	83 fa 73             	cmp    $0x73,%edx
    1780:	0f 84 a2 00 00 00    	je     1828 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1786:	83 fa 63             	cmp    $0x63,%edx
    1789:	0f 84 35 01 00 00    	je     18c4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    178f:	83 fa 25             	cmp    $0x25,%edx
    1792:	0f 84 e0 00 00 00    	je     1878 <printf+0x178>
  write(fd, &c, 1);
    1798:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    179b:	83 c3 01             	add    $0x1,%ebx
    179e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    17a5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    17a6:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    17a8:	89 44 24 04          	mov    %eax,0x4(%esp)
    17ac:	89 34 24             	mov    %esi,(%esp)
    17af:	89 55 d0             	mov    %edx,-0x30(%ebp)
    17b2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    17b6:	e8 07 fe ff ff       	call   15c2 <write>
        putc(fd, c);
    17bb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    17be:	8d 45 e7             	lea    -0x19(%ebp),%eax
    17c1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    17c8:	00 
    17c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    17cd:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    17d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    17d3:	e8 ea fd ff ff       	call   15c2 <write>
  for(i = 0; fmt[i]; i++){
    17d8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    17dc:	84 d2                	test   %dl,%dl
    17de:	0f 85 76 ff ff ff    	jne    175a <printf+0x5a>
    17e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    17e8:	83 c4 3c             	add    $0x3c,%esp
    17eb:	5b                   	pop    %ebx
    17ec:	5e                   	pop    %esi
    17ed:	5f                   	pop    %edi
    17ee:	5d                   	pop    %ebp
    17ef:	c3                   	ret    
        state = '%';
    17f0:	bf 25 00 00 00       	mov    $0x25,%edi
    17f5:	e9 51 ff ff ff       	jmp    174b <printf+0x4b>
    17fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1800:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1803:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    1808:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    180a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1811:	8b 10                	mov    (%eax),%edx
    1813:	89 f0                	mov    %esi,%eax
    1815:	e8 46 fe ff ff       	call   1660 <printint>
        ap++;
    181a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    181e:	e9 28 ff ff ff       	jmp    174b <printf+0x4b>
    1823:	90                   	nop
    1824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1828:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    182b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    182f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    1831:	b8 eb 1a 00 00       	mov    $0x1aeb,%eax
    1836:	85 ff                	test   %edi,%edi
    1838:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    183b:	0f b6 07             	movzbl (%edi),%eax
    183e:	84 c0                	test   %al,%al
    1840:	74 2a                	je     186c <printf+0x16c>
    1842:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1848:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    184b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    184e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    1851:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1858:	00 
    1859:	89 44 24 04          	mov    %eax,0x4(%esp)
    185d:	89 34 24             	mov    %esi,(%esp)
    1860:	e8 5d fd ff ff       	call   15c2 <write>
        while(*s != 0){
    1865:	0f b6 07             	movzbl (%edi),%eax
    1868:	84 c0                	test   %al,%al
    186a:	75 dc                	jne    1848 <printf+0x148>
      state = 0;
    186c:	31 ff                	xor    %edi,%edi
    186e:	e9 d8 fe ff ff       	jmp    174b <printf+0x4b>
    1873:	90                   	nop
    1874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1878:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    187b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    187d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1884:	00 
    1885:	89 44 24 04          	mov    %eax,0x4(%esp)
    1889:	89 34 24             	mov    %esi,(%esp)
    188c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1890:	e8 2d fd ff ff       	call   15c2 <write>
    1895:	e9 b1 fe ff ff       	jmp    174b <printf+0x4b>
    189a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    18a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    18a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    18a8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    18ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18b2:	8b 10                	mov    (%eax),%edx
    18b4:	89 f0                	mov    %esi,%eax
    18b6:	e8 a5 fd ff ff       	call   1660 <printint>
        ap++;
    18bb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    18bf:	e9 87 fe ff ff       	jmp    174b <printf+0x4b>
        putc(fd, *ap);
    18c4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    18c7:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    18c9:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    18cb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    18d2:	00 
    18d3:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    18d6:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    18d9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    18dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    18e0:	e8 dd fc ff ff       	call   15c2 <write>
        ap++;
    18e5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    18e9:	e9 5d fe ff ff       	jmp    174b <printf+0x4b>
    18ee:	66 90                	xchg   %ax,%ax

000018f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    18f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18f1:	a1 24 1e 00 00       	mov    0x1e24,%eax
{
    18f6:	89 e5                	mov    %esp,%ebp
    18f8:	57                   	push   %edi
    18f9:	56                   	push   %esi
    18fa:	53                   	push   %ebx
    18fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    18fe:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    1900:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1903:	39 d0                	cmp    %edx,%eax
    1905:	72 11                	jb     1918 <free+0x28>
    1907:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1908:	39 c8                	cmp    %ecx,%eax
    190a:	72 04                	jb     1910 <free+0x20>
    190c:	39 ca                	cmp    %ecx,%edx
    190e:	72 10                	jb     1920 <free+0x30>
    1910:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1912:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1914:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1916:	73 f0                	jae    1908 <free+0x18>
    1918:	39 ca                	cmp    %ecx,%edx
    191a:	72 04                	jb     1920 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    191c:	39 c8                	cmp    %ecx,%eax
    191e:	72 f0                	jb     1910 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1920:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1923:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1926:	39 cf                	cmp    %ecx,%edi
    1928:	74 1e                	je     1948 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    192a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    192d:	8b 48 04             	mov    0x4(%eax),%ecx
    1930:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1933:	39 f2                	cmp    %esi,%edx
    1935:	74 28                	je     195f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1937:	89 10                	mov    %edx,(%eax)
  freep = p;
    1939:	a3 24 1e 00 00       	mov    %eax,0x1e24
}
    193e:	5b                   	pop    %ebx
    193f:	5e                   	pop    %esi
    1940:	5f                   	pop    %edi
    1941:	5d                   	pop    %ebp
    1942:	c3                   	ret    
    1943:	90                   	nop
    1944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1948:	03 71 04             	add    0x4(%ecx),%esi
    194b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    194e:	8b 08                	mov    (%eax),%ecx
    1950:	8b 09                	mov    (%ecx),%ecx
    1952:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1955:	8b 48 04             	mov    0x4(%eax),%ecx
    1958:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    195b:	39 f2                	cmp    %esi,%edx
    195d:	75 d8                	jne    1937 <free+0x47>
    p->s.size += bp->s.size;
    195f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    1962:	a3 24 1e 00 00       	mov    %eax,0x1e24
    p->s.size += bp->s.size;
    1967:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    196a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    196d:	89 10                	mov    %edx,(%eax)
}
    196f:	5b                   	pop    %ebx
    1970:	5e                   	pop    %esi
    1971:	5f                   	pop    %edi
    1972:	5d                   	pop    %ebp
    1973:	c3                   	ret    
    1974:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    197a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001980 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1980:	55                   	push   %ebp
    1981:	89 e5                	mov    %esp,%ebp
    1983:	57                   	push   %edi
    1984:	56                   	push   %esi
    1985:	53                   	push   %ebx
    1986:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1989:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    198c:	8b 1d 24 1e 00 00    	mov    0x1e24,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1992:	8d 48 07             	lea    0x7(%eax),%ecx
    1995:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1998:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    199a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    199d:	0f 84 9b 00 00 00    	je     1a3e <malloc+0xbe>
    19a3:	8b 13                	mov    (%ebx),%edx
    19a5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    19a8:	39 fe                	cmp    %edi,%esi
    19aa:	76 64                	jbe    1a10 <malloc+0x90>
    19ac:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    19b3:	bb 00 80 00 00       	mov    $0x8000,%ebx
    19b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    19bb:	eb 0e                	jmp    19cb <malloc+0x4b>
    19bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    19c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    19c2:	8b 78 04             	mov    0x4(%eax),%edi
    19c5:	39 fe                	cmp    %edi,%esi
    19c7:	76 4f                	jbe    1a18 <malloc+0x98>
    19c9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    19cb:	3b 15 24 1e 00 00    	cmp    0x1e24,%edx
    19d1:	75 ed                	jne    19c0 <malloc+0x40>
  if(nu < 4096)
    19d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    19d6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    19dc:	bf 00 10 00 00       	mov    $0x1000,%edi
    19e1:	0f 43 fe             	cmovae %esi,%edi
    19e4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    19e7:	89 04 24             	mov    %eax,(%esp)
    19ea:	e8 3b fc ff ff       	call   162a <sbrk>
  if(p == (char*)-1)
    19ef:	83 f8 ff             	cmp    $0xffffffff,%eax
    19f2:	74 18                	je     1a0c <malloc+0x8c>
  hp->s.size = nu;
    19f4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    19f7:	83 c0 08             	add    $0x8,%eax
    19fa:	89 04 24             	mov    %eax,(%esp)
    19fd:	e8 ee fe ff ff       	call   18f0 <free>
  return freep;
    1a02:	8b 15 24 1e 00 00    	mov    0x1e24,%edx
      if((p = morecore(nunits)) == 0)
    1a08:	85 d2                	test   %edx,%edx
    1a0a:	75 b4                	jne    19c0 <malloc+0x40>
        return 0;
    1a0c:	31 c0                	xor    %eax,%eax
    1a0e:	eb 20                	jmp    1a30 <malloc+0xb0>
    if(p->s.size >= nunits){
    1a10:	89 d0                	mov    %edx,%eax
    1a12:	89 da                	mov    %ebx,%edx
    1a14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1a18:	39 fe                	cmp    %edi,%esi
    1a1a:	74 1c                	je     1a38 <malloc+0xb8>
        p->s.size -= nunits;
    1a1c:	29 f7                	sub    %esi,%edi
    1a1e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1a21:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1a24:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1a27:	89 15 24 1e 00 00    	mov    %edx,0x1e24
      return (void*)(p + 1);
    1a2d:	83 c0 08             	add    $0x8,%eax
  }
}
    1a30:	83 c4 1c             	add    $0x1c,%esp
    1a33:	5b                   	pop    %ebx
    1a34:	5e                   	pop    %esi
    1a35:	5f                   	pop    %edi
    1a36:	5d                   	pop    %ebp
    1a37:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1a38:	8b 08                	mov    (%eax),%ecx
    1a3a:	89 0a                	mov    %ecx,(%edx)
    1a3c:	eb e9                	jmp    1a27 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    1a3e:	c7 05 24 1e 00 00 28 	movl   $0x1e28,0x1e24
    1a45:	1e 00 00 
    base.s.size = 0;
    1a48:	ba 28 1e 00 00       	mov    $0x1e28,%edx
    base.s.ptr = freep = prevp = &base;
    1a4d:	c7 05 28 1e 00 00 28 	movl   $0x1e28,0x1e28
    1a54:	1e 00 00 
    base.s.size = 0;
    1a57:	c7 05 2c 1e 00 00 00 	movl   $0x0,0x1e2c
    1a5e:	00 00 00 
    1a61:	e9 46 ff ff ff       	jmp    19ac <malloc+0x2c>
    1a66:	66 90                	xchg   %ax,%ax
    1a68:	66 90                	xchg   %ax,%ax
    1a6a:	66 90                	xchg   %ax,%ax
    1a6c:	66 90                	xchg   %ax,%ax
    1a6e:	66 90                	xchg   %ax,%ax

00001a70 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1a70:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1a71:	b9 01 00 00 00       	mov    $0x1,%ecx
    1a76:	89 e5                	mov    %esp,%ebp
    1a78:	8b 55 08             	mov    0x8(%ebp),%edx
    1a7b:	90                   	nop
    1a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1a80:	89 c8                	mov    %ecx,%eax
    1a82:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1a85:	85 c0                	test   %eax,%eax
    1a87:	75 f7                	jne    1a80 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1a89:	0f ae f0             	mfence 
}
    1a8c:	5d                   	pop    %ebp
    1a8d:	c3                   	ret    
    1a8e:	66 90                	xchg   %ax,%ax

00001a90 <urelease>:

void urelease (struct uspinlock *lk) {
    1a90:	55                   	push   %ebp
    1a91:	89 e5                	mov    %esp,%ebp
    1a93:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1a96:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1a99:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1a9f:	5d                   	pop    %ebp
    1aa0:	c3                   	ret    
