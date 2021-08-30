
_usertests:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 10             	sub    $0x10,%esp
  printf(1, "usertests starting\n");
    1009:	c7 44 24 04 92 61 00 	movl   $0x6192,0x4(%esp)
    1010:	00 
    1011:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1018:	e8 e3 3d 00 00       	call   4e00 <printf>

  if(open("usertests.ran", 0) >= 0){
    101d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1024:	00 
    1025:	c7 04 24 a6 61 00 00 	movl   $0x61a6,(%esp)
    102c:	e8 b1 3c 00 00       	call   4ce2 <open>
    1031:	85 c0                	test   %eax,%eax
    1033:	78 19                	js     104e <main+0x4e>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    1035:	c7 44 24 04 10 69 00 	movl   $0x6910,0x4(%esp)
    103c:	00 
    103d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1044:	e8 b7 3d 00 00       	call   4e00 <printf>
    exit();
    1049:	e8 54 3c 00 00       	call   4ca2 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    104e:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1055:	00 
    1056:	c7 04 24 a6 61 00 00 	movl   $0x61a6,(%esp)
    105d:	e8 80 3c 00 00       	call   4ce2 <open>
    1062:	89 04 24             	mov    %eax,(%esp)
    1065:	e8 60 3c 00 00       	call   4cca <close>

  argptest();
    106a:	e8 71 39 00 00       	call   49e0 <argptest>
  createdelete();
    106f:	e8 9c 12 00 00       	call   2310 <createdelete>
  linkunlink();
    1074:	e8 27 1c 00 00       	call   2ca0 <linkunlink>
  concreate();
    1079:	e8 02 19 00 00       	call   2980 <concreate>
    107e:	66 90                	xchg   %ax,%ax
  fourfiles();
    1080:	e8 7b 10 00 00       	call   2100 <fourfiles>
  sharedfd();
    1085:	e8 96 0e 00 00       	call   1f20 <sharedfd>

  bigargtest();
    108a:	e8 c1 35 00 00       	call   4650 <bigargtest>
    108f:	90                   	nop
  bigwrite();
    1090:	e8 fb 25 00 00       	call   3690 <bigwrite>
  bigargtest();
    1095:	e8 b6 35 00 00       	call   4650 <bigargtest>
  bsstest();
    109a:	e8 31 35 00 00       	call   45d0 <bsstest>
    109f:	90                   	nop
  sbrktest();
    10a0:	e8 0b 30 00 00       	call   40b0 <sbrktest>
  validatetest();
    10a5:	e8 76 34 00 00       	call   4520 <validatetest>

  opentest();
    10aa:	e8 61 03 00 00       	call   1410 <opentest>
    10af:	90                   	nop
  writetest();
    10b0:	e8 fb 03 00 00       	call   14b0 <writetest>
  writetest1();
    10b5:	e8 06 06 00 00       	call   16c0 <writetest1>
  createtest();
    10ba:	e8 f1 07 00 00       	call   18b0 <createtest>
    10bf:	90                   	nop

  openiputtest();
    10c0:	e8 3b 02 00 00       	call   1300 <openiputtest>
  exitiputtest();
    10c5:	e8 46 01 00 00       	call   1210 <exitiputtest>
  iputtest();
    10ca:	e8 61 00 00 00       	call   1130 <iputtest>
    10cf:	90                   	nop

  mem();
    10d0:	e8 6b 0d 00 00       	call   1e40 <mem>
  pipe1();
    10d5:	e8 b6 09 00 00       	call   1a90 <pipe1>
  preempt();
    10da:	e8 71 0b 00 00       	call   1c50 <preempt>
    10df:	90                   	nop
  exitwait();
    10e0:	e8 cb 0c 00 00       	call   1db0 <exitwait>

  rmdot();
    10e5:	e8 06 2a 00 00       	call   3af0 <rmdot>
  fourteen();
    10ea:	e8 a1 28 00 00       	call   3990 <fourteen>
    10ef:	90                   	nop
  bigfile();
    10f0:	e8 9b 26 00 00       	call   3790 <bigfile>
  subdir();
    10f5:	e8 06 1e 00 00       	call   2f00 <subdir>
  linktest();
    10fa:	e8 21 16 00 00       	call   2720 <linktest>
    10ff:	90                   	nop
  unlinkread();
    1100:	e8 4b 14 00 00       	call   2550 <unlinkread>
  dirfile();
    1105:	e8 76 2b 00 00       	call   3c80 <dirfile>
  iref();
    110a:	e8 b1 2d 00 00       	call   3ec0 <iref>
    110f:	90                   	nop
  forktest();
    1110:	e8 cb 2e 00 00       	call   3fe0 <forktest>
  bigdir(); // slow
    1115:	e8 96 1c 00 00       	call   2db0 <bigdir>

  uio();
    111a:	e8 41 38 00 00       	call   4960 <uio>
    111f:	90                   	nop

  exectest();
    1120:	e8 1b 09 00 00       	call   1a40 <exectest>

  exit();
    1125:	e8 78 3b 00 00       	call   4ca2 <exit>
    112a:	66 90                	xchg   %ax,%ax
    112c:	66 90                	xchg   %ax,%ax
    112e:	66 90                	xchg   %ax,%ax

00001130 <iputtest>:
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "iput test\n");
    1136:	a1 60 72 00 00       	mov    0x7260,%eax
    113b:	c7 44 24 04 38 52 00 	movl   $0x5238,0x4(%esp)
    1142:	00 
    1143:	89 04 24             	mov    %eax,(%esp)
    1146:	e8 b5 3c 00 00       	call   4e00 <printf>
  if(mkdir("iputdir") < 0){
    114b:	c7 04 24 cb 51 00 00 	movl   $0x51cb,(%esp)
    1152:	e8 b3 3b 00 00       	call   4d0a <mkdir>
    1157:	85 c0                	test   %eax,%eax
    1159:	78 4b                	js     11a6 <iputtest+0x76>
  if(chdir("iputdir") < 0){
    115b:	c7 04 24 cb 51 00 00 	movl   $0x51cb,(%esp)
    1162:	e8 ab 3b 00 00       	call   4d12 <chdir>
    1167:	85 c0                	test   %eax,%eax
    1169:	0f 88 85 00 00 00    	js     11f4 <iputtest+0xc4>
  if(unlink("../iputdir") < 0){
    116f:	c7 04 24 c8 51 00 00 	movl   $0x51c8,(%esp)
    1176:	e8 77 3b 00 00       	call   4cf2 <unlink>
    117b:	85 c0                	test   %eax,%eax
    117d:	78 5b                	js     11da <iputtest+0xaa>
  if(chdir("/") < 0){
    117f:	c7 04 24 ed 51 00 00 	movl   $0x51ed,(%esp)
    1186:	e8 87 3b 00 00       	call   4d12 <chdir>
    118b:	85 c0                	test   %eax,%eax
    118d:	78 31                	js     11c0 <iputtest+0x90>
  printf(stdout, "iput test ok\n");
    118f:	a1 60 72 00 00       	mov    0x7260,%eax
    1194:	c7 44 24 04 70 52 00 	movl   $0x5270,0x4(%esp)
    119b:	00 
    119c:	89 04 24             	mov    %eax,(%esp)
    119f:	e8 5c 3c 00 00       	call   4e00 <printf>
}
    11a4:	c9                   	leave  
    11a5:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
    11a6:	a1 60 72 00 00       	mov    0x7260,%eax
    11ab:	c7 44 24 04 a4 51 00 	movl   $0x51a4,0x4(%esp)
    11b2:	00 
    11b3:	89 04 24             	mov    %eax,(%esp)
    11b6:	e8 45 3c 00 00       	call   4e00 <printf>
    exit();
    11bb:	e8 e2 3a 00 00       	call   4ca2 <exit>
    printf(stdout, "chdir / failed\n");
    11c0:	a1 60 72 00 00       	mov    0x7260,%eax
    11c5:	c7 44 24 04 ef 51 00 	movl   $0x51ef,0x4(%esp)
    11cc:	00 
    11cd:	89 04 24             	mov    %eax,(%esp)
    11d0:	e8 2b 3c 00 00       	call   4e00 <printf>
    exit();
    11d5:	e8 c8 3a 00 00       	call   4ca2 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
    11da:	a1 60 72 00 00       	mov    0x7260,%eax
    11df:	c7 44 24 04 d3 51 00 	movl   $0x51d3,0x4(%esp)
    11e6:	00 
    11e7:	89 04 24             	mov    %eax,(%esp)
    11ea:	e8 11 3c 00 00       	call   4e00 <printf>
    exit();
    11ef:	e8 ae 3a 00 00       	call   4ca2 <exit>
    printf(stdout, "chdir iputdir failed\n");
    11f4:	a1 60 72 00 00       	mov    0x7260,%eax
    11f9:	c7 44 24 04 b2 51 00 	movl   $0x51b2,0x4(%esp)
    1200:	00 
    1201:	89 04 24             	mov    %eax,(%esp)
    1204:	e8 f7 3b 00 00       	call   4e00 <printf>
    exit();
    1209:	e8 94 3a 00 00       	call   4ca2 <exit>
    120e:	66 90                	xchg   %ax,%ax

00001210 <exitiputtest>:
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exitiput test\n");
    1216:	a1 60 72 00 00       	mov    0x7260,%eax
    121b:	c7 44 24 04 ff 51 00 	movl   $0x51ff,0x4(%esp)
    1222:	00 
    1223:	89 04 24             	mov    %eax,(%esp)
    1226:	e8 d5 3b 00 00       	call   4e00 <printf>
  pid = fork();
    122b:	e8 6a 3a 00 00       	call   4c9a <fork>
  if(pid < 0){
    1230:	85 c0                	test   %eax,%eax
    1232:	78 76                	js     12aa <exitiputtest+0x9a>
  if(pid == 0){
    1234:	75 3a                	jne    1270 <exitiputtest+0x60>
    if(mkdir("iputdir") < 0){
    1236:	c7 04 24 cb 51 00 00 	movl   $0x51cb,(%esp)
    123d:	e8 c8 3a 00 00       	call   4d0a <mkdir>
    1242:	85 c0                	test   %eax,%eax
    1244:	0f 88 94 00 00 00    	js     12de <exitiputtest+0xce>
    if(chdir("iputdir") < 0){
    124a:	c7 04 24 cb 51 00 00 	movl   $0x51cb,(%esp)
    1251:	e8 bc 3a 00 00       	call   4d12 <chdir>
    1256:	85 c0                	test   %eax,%eax
    1258:	78 6a                	js     12c4 <exitiputtest+0xb4>
    if(unlink("../iputdir") < 0){
    125a:	c7 04 24 c8 51 00 00 	movl   $0x51c8,(%esp)
    1261:	e8 8c 3a 00 00       	call   4cf2 <unlink>
    1266:	85 c0                	test   %eax,%eax
    1268:	78 26                	js     1290 <exitiputtest+0x80>
    exit();
    126a:	e8 33 3a 00 00       	call   4ca2 <exit>
    126f:	90                   	nop
  wait();
    1270:	e8 35 3a 00 00       	call   4caa <wait>
  printf(stdout, "exitiput test ok\n");
    1275:	a1 60 72 00 00       	mov    0x7260,%eax
    127a:	c7 44 24 04 22 52 00 	movl   $0x5222,0x4(%esp)
    1281:	00 
    1282:	89 04 24             	mov    %eax,(%esp)
    1285:	e8 76 3b 00 00       	call   4e00 <printf>
}
    128a:	c9                   	leave  
    128b:	c3                   	ret    
    128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(stdout, "unlink ../iputdir failed\n");
    1290:	a1 60 72 00 00       	mov    0x7260,%eax
    1295:	c7 44 24 04 d3 51 00 	movl   $0x51d3,0x4(%esp)
    129c:	00 
    129d:	89 04 24             	mov    %eax,(%esp)
    12a0:	e8 5b 3b 00 00       	call   4e00 <printf>
      exit();
    12a5:	e8 f8 39 00 00       	call   4ca2 <exit>
    printf(stdout, "fork failed\n");
    12aa:	a1 60 72 00 00       	mov    0x7260,%eax
    12af:	c7 44 24 04 e5 60 00 	movl   $0x60e5,0x4(%esp)
    12b6:	00 
    12b7:	89 04 24             	mov    %eax,(%esp)
    12ba:	e8 41 3b 00 00       	call   4e00 <printf>
    exit();
    12bf:	e8 de 39 00 00       	call   4ca2 <exit>
      printf(stdout, "child chdir failed\n");
    12c4:	a1 60 72 00 00       	mov    0x7260,%eax
    12c9:	c7 44 24 04 0e 52 00 	movl   $0x520e,0x4(%esp)
    12d0:	00 
    12d1:	89 04 24             	mov    %eax,(%esp)
    12d4:	e8 27 3b 00 00       	call   4e00 <printf>
      exit();
    12d9:	e8 c4 39 00 00       	call   4ca2 <exit>
      printf(stdout, "mkdir failed\n");
    12de:	a1 60 72 00 00       	mov    0x7260,%eax
    12e3:	c7 44 24 04 a4 51 00 	movl   $0x51a4,0x4(%esp)
    12ea:	00 
    12eb:	89 04 24             	mov    %eax,(%esp)
    12ee:	e8 0d 3b 00 00       	call   4e00 <printf>
      exit();
    12f3:	e8 aa 39 00 00       	call   4ca2 <exit>
    12f8:	90                   	nop
    12f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001300 <openiputtest>:
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "openiput test\n");
    1306:	a1 60 72 00 00       	mov    0x7260,%eax
    130b:	c7 44 24 04 34 52 00 	movl   $0x5234,0x4(%esp)
    1312:	00 
    1313:	89 04 24             	mov    %eax,(%esp)
    1316:	e8 e5 3a 00 00       	call   4e00 <printf>
  if(mkdir("oidir") < 0){
    131b:	c7 04 24 43 52 00 00 	movl   $0x5243,(%esp)
    1322:	e8 e3 39 00 00       	call   4d0a <mkdir>
    1327:	85 c0                	test   %eax,%eax
    1329:	0f 88 9e 00 00 00    	js     13cd <openiputtest+0xcd>
  pid = fork();
    132f:	e8 66 39 00 00       	call   4c9a <fork>
  if(pid < 0){
    1334:	85 c0                	test   %eax,%eax
    1336:	0f 88 ab 00 00 00    	js     13e7 <openiputtest+0xe7>
    133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(pid == 0){
    1340:	75 36                	jne    1378 <openiputtest+0x78>
    int fd = open("oidir", O_RDWR);
    1342:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1349:	00 
    134a:	c7 04 24 43 52 00 00 	movl   $0x5243,(%esp)
    1351:	e8 8c 39 00 00       	call   4ce2 <open>
    if(fd >= 0){
    1356:	85 c0                	test   %eax,%eax
    1358:	78 6e                	js     13c8 <openiputtest+0xc8>
      printf(stdout, "open directory for write succeeded\n");
    135a:	a1 60 72 00 00       	mov    0x7260,%eax
    135f:	c7 44 24 04 c8 61 00 	movl   $0x61c8,0x4(%esp)
    1366:	00 
    1367:	89 04 24             	mov    %eax,(%esp)
    136a:	e8 91 3a 00 00       	call   4e00 <printf>
      exit();
    136f:	e8 2e 39 00 00       	call   4ca2 <exit>
    1374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  sleep(1);
    1378:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    137f:	e8 ae 39 00 00       	call   4d32 <sleep>
  if(unlink("oidir") != 0){
    1384:	c7 04 24 43 52 00 00 	movl   $0x5243,(%esp)
    138b:	e8 62 39 00 00       	call   4cf2 <unlink>
    1390:	85 c0                	test   %eax,%eax
    1392:	75 1c                	jne    13b0 <openiputtest+0xb0>
  wait();
    1394:	e8 11 39 00 00       	call   4caa <wait>
  printf(stdout, "openiput test ok\n");
    1399:	a1 60 72 00 00       	mov    0x7260,%eax
    139e:	c7 44 24 04 6c 52 00 	movl   $0x526c,0x4(%esp)
    13a5:	00 
    13a6:	89 04 24             	mov    %eax,(%esp)
    13a9:	e8 52 3a 00 00       	call   4e00 <printf>
}
    13ae:	c9                   	leave  
    13af:	c3                   	ret    
    printf(stdout, "unlink failed\n");
    13b0:	a1 60 72 00 00       	mov    0x7260,%eax
    13b5:	c7 44 24 04 5d 52 00 	movl   $0x525d,0x4(%esp)
    13bc:	00 
    13bd:	89 04 24             	mov    %eax,(%esp)
    13c0:	e8 3b 3a 00 00       	call   4e00 <printf>
    13c5:	8d 76 00             	lea    0x0(%esi),%esi
    exit();
    13c8:	e8 d5 38 00 00       	call   4ca2 <exit>
    printf(stdout, "mkdir oidir failed\n");
    13cd:	a1 60 72 00 00       	mov    0x7260,%eax
    13d2:	c7 44 24 04 49 52 00 	movl   $0x5249,0x4(%esp)
    13d9:	00 
    13da:	89 04 24             	mov    %eax,(%esp)
    13dd:	e8 1e 3a 00 00       	call   4e00 <printf>
    exit();
    13e2:	e8 bb 38 00 00       	call   4ca2 <exit>
    printf(stdout, "fork failed\n");
    13e7:	a1 60 72 00 00       	mov    0x7260,%eax
    13ec:	c7 44 24 04 e5 60 00 	movl   $0x60e5,0x4(%esp)
    13f3:	00 
    13f4:	89 04 24             	mov    %eax,(%esp)
    13f7:	e8 04 3a 00 00       	call   4e00 <printf>
    exit();
    13fc:	e8 a1 38 00 00       	call   4ca2 <exit>
    1401:	eb 0d                	jmp    1410 <opentest>
    1403:	90                   	nop
    1404:	90                   	nop
    1405:	90                   	nop
    1406:	90                   	nop
    1407:	90                   	nop
    1408:	90                   	nop
    1409:	90                   	nop
    140a:	90                   	nop
    140b:	90                   	nop
    140c:	90                   	nop
    140d:	90                   	nop
    140e:	90                   	nop
    140f:	90                   	nop

00001410 <opentest>:
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "open test\n");
    1416:	a1 60 72 00 00       	mov    0x7260,%eax
    141b:	c7 44 24 04 7e 52 00 	movl   $0x527e,0x4(%esp)
    1422:	00 
    1423:	89 04 24             	mov    %eax,(%esp)
    1426:	e8 d5 39 00 00       	call   4e00 <printf>
  fd = open("echo", 0);
    142b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1432:	00 
    1433:	c7 04 24 89 52 00 00 	movl   $0x5289,(%esp)
    143a:	e8 a3 38 00 00       	call   4ce2 <open>
  if(fd < 0){
    143f:	85 c0                	test   %eax,%eax
    1441:	78 37                	js     147a <opentest+0x6a>
  close(fd);
    1443:	89 04 24             	mov    %eax,(%esp)
    1446:	e8 7f 38 00 00       	call   4cca <close>
  fd = open("doesnotexist", 0);
    144b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1452:	00 
    1453:	c7 04 24 a1 52 00 00 	movl   $0x52a1,(%esp)
    145a:	e8 83 38 00 00       	call   4ce2 <open>
  if(fd >= 0){
    145f:	85 c0                	test   %eax,%eax
    1461:	79 31                	jns    1494 <opentest+0x84>
  printf(stdout, "open test ok\n");
    1463:	a1 60 72 00 00       	mov    0x7260,%eax
    1468:	c7 44 24 04 cc 52 00 	movl   $0x52cc,0x4(%esp)
    146f:	00 
    1470:	89 04 24             	mov    %eax,(%esp)
    1473:	e8 88 39 00 00       	call   4e00 <printf>
}
    1478:	c9                   	leave  
    1479:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
    147a:	a1 60 72 00 00       	mov    0x7260,%eax
    147f:	c7 44 24 04 8e 52 00 	movl   $0x528e,0x4(%esp)
    1486:	00 
    1487:	89 04 24             	mov    %eax,(%esp)
    148a:	e8 71 39 00 00       	call   4e00 <printf>
    exit();
    148f:	e8 0e 38 00 00       	call   4ca2 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
    1494:	a1 60 72 00 00       	mov    0x7260,%eax
    1499:	c7 44 24 04 ae 52 00 	movl   $0x52ae,0x4(%esp)
    14a0:	00 
    14a1:	89 04 24             	mov    %eax,(%esp)
    14a4:	e8 57 39 00 00       	call   4e00 <printf>
    exit();
    14a9:	e8 f4 37 00 00       	call   4ca2 <exit>
    14ae:	66 90                	xchg   %ax,%ax

000014b0 <writetest>:
{
    14b0:	55                   	push   %ebp
    14b1:	89 e5                	mov    %esp,%ebp
    14b3:	56                   	push   %esi
    14b4:	53                   	push   %ebx
    14b5:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "small file test\n");
    14b8:	a1 60 72 00 00       	mov    0x7260,%eax
    14bd:	c7 44 24 04 da 52 00 	movl   $0x52da,0x4(%esp)
    14c4:	00 
    14c5:	89 04 24             	mov    %eax,(%esp)
    14c8:	e8 33 39 00 00       	call   4e00 <printf>
  fd = open("small", O_CREATE|O_RDWR);
    14cd:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    14d4:	00 
    14d5:	c7 04 24 eb 52 00 00 	movl   $0x52eb,(%esp)
    14dc:	e8 01 38 00 00       	call   4ce2 <open>
  if(fd >= 0){
    14e1:	85 c0                	test   %eax,%eax
  fd = open("small", O_CREATE|O_RDWR);
    14e3:	89 c6                	mov    %eax,%esi
  if(fd >= 0){
    14e5:	0f 88 b1 01 00 00    	js     169c <writetest+0x1ec>
    printf(stdout, "creat small succeeded; ok\n");
    14eb:	a1 60 72 00 00       	mov    0x7260,%eax
  for(i = 0; i < 100; i++){
    14f0:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
    14f2:	c7 44 24 04 f1 52 00 	movl   $0x52f1,0x4(%esp)
    14f9:	00 
    14fa:	89 04 24             	mov    %eax,(%esp)
    14fd:	e8 fe 38 00 00       	call   4e00 <printf>
    1502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(write(fd, "aaaaaaaaaa", 10) != 10){
    1508:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    150f:	00 
    1510:	c7 44 24 04 28 53 00 	movl   $0x5328,0x4(%esp)
    1517:	00 
    1518:	89 34 24             	mov    %esi,(%esp)
    151b:	e8 a2 37 00 00       	call   4cc2 <write>
    1520:	83 f8 0a             	cmp    $0xa,%eax
    1523:	0f 85 e9 00 00 00    	jne    1612 <writetest+0x162>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
    1529:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1530:	00 
    1531:	c7 44 24 04 33 53 00 	movl   $0x5333,0x4(%esp)
    1538:	00 
    1539:	89 34 24             	mov    %esi,(%esp)
    153c:	e8 81 37 00 00       	call   4cc2 <write>
    1541:	83 f8 0a             	cmp    $0xa,%eax
    1544:	0f 85 e6 00 00 00    	jne    1630 <writetest+0x180>
  for(i = 0; i < 100; i++){
    154a:	83 c3 01             	add    $0x1,%ebx
    154d:	83 fb 64             	cmp    $0x64,%ebx
    1550:	75 b6                	jne    1508 <writetest+0x58>
  printf(stdout, "writes ok\n");
    1552:	a1 60 72 00 00       	mov    0x7260,%eax
    1557:	c7 44 24 04 3e 53 00 	movl   $0x533e,0x4(%esp)
    155e:	00 
    155f:	89 04 24             	mov    %eax,(%esp)
    1562:	e8 99 38 00 00       	call   4e00 <printf>
  close(fd);
    1567:	89 34 24             	mov    %esi,(%esp)
    156a:	e8 5b 37 00 00       	call   4cca <close>
  fd = open("small", O_RDONLY);
    156f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1576:	00 
    1577:	c7 04 24 eb 52 00 00 	movl   $0x52eb,(%esp)
    157e:	e8 5f 37 00 00       	call   4ce2 <open>
  if(fd >= 0){
    1583:	85 c0                	test   %eax,%eax
  fd = open("small", O_RDONLY);
    1585:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
    1587:	0f 88 c1 00 00 00    	js     164e <writetest+0x19e>
    printf(stdout, "open small succeeded ok\n");
    158d:	a1 60 72 00 00       	mov    0x7260,%eax
    1592:	c7 44 24 04 49 53 00 	movl   $0x5349,0x4(%esp)
    1599:	00 
    159a:	89 04 24             	mov    %eax,(%esp)
    159d:	e8 5e 38 00 00       	call   4e00 <printf>
  i = read(fd, buf, 2000);
    15a2:	c7 44 24 08 d0 07 00 	movl   $0x7d0,0x8(%esp)
    15a9:	00 
    15aa:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    15b1:	00 
    15b2:	89 1c 24             	mov    %ebx,(%esp)
    15b5:	e8 00 37 00 00       	call   4cba <read>
  if(i == 2000){
    15ba:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    15bf:	0f 85 a3 00 00 00    	jne    1668 <writetest+0x1b8>
    printf(stdout, "read succeeded ok\n");
    15c5:	a1 60 72 00 00       	mov    0x7260,%eax
    15ca:	c7 44 24 04 7d 53 00 	movl   $0x537d,0x4(%esp)
    15d1:	00 
    15d2:	89 04 24             	mov    %eax,(%esp)
    15d5:	e8 26 38 00 00       	call   4e00 <printf>
  close(fd);
    15da:	89 1c 24             	mov    %ebx,(%esp)
    15dd:	e8 e8 36 00 00       	call   4cca <close>
  if(unlink("small") < 0){
    15e2:	c7 04 24 eb 52 00 00 	movl   $0x52eb,(%esp)
    15e9:	e8 04 37 00 00       	call   4cf2 <unlink>
    15ee:	85 c0                	test   %eax,%eax
    15f0:	0f 88 8c 00 00 00    	js     1682 <writetest+0x1d2>
  printf(stdout, "small file test ok\n");
    15f6:	a1 60 72 00 00       	mov    0x7260,%eax
    15fb:	c7 44 24 04 a5 53 00 	movl   $0x53a5,0x4(%esp)
    1602:	00 
    1603:	89 04 24             	mov    %eax,(%esp)
    1606:	e8 f5 37 00 00       	call   4e00 <printf>
}
    160b:	83 c4 10             	add    $0x10,%esp
    160e:	5b                   	pop    %ebx
    160f:	5e                   	pop    %esi
    1610:	5d                   	pop    %ebp
    1611:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
    1612:	a1 60 72 00 00       	mov    0x7260,%eax
    1617:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    161b:	c7 44 24 04 ec 61 00 	movl   $0x61ec,0x4(%esp)
    1622:	00 
    1623:	89 04 24             	mov    %eax,(%esp)
    1626:	e8 d5 37 00 00       	call   4e00 <printf>
      exit();
    162b:	e8 72 36 00 00       	call   4ca2 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
    1630:	a1 60 72 00 00       	mov    0x7260,%eax
    1635:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    1639:	c7 44 24 04 10 62 00 	movl   $0x6210,0x4(%esp)
    1640:	00 
    1641:	89 04 24             	mov    %eax,(%esp)
    1644:	e8 b7 37 00 00       	call   4e00 <printf>
      exit();
    1649:	e8 54 36 00 00       	call   4ca2 <exit>
    printf(stdout, "error: open small failed!\n");
    164e:	a1 60 72 00 00       	mov    0x7260,%eax
    1653:	c7 44 24 04 62 53 00 	movl   $0x5362,0x4(%esp)
    165a:	00 
    165b:	89 04 24             	mov    %eax,(%esp)
    165e:	e8 9d 37 00 00       	call   4e00 <printf>
    exit();
    1663:	e8 3a 36 00 00       	call   4ca2 <exit>
    printf(stdout, "read failed\n");
    1668:	a1 60 72 00 00       	mov    0x7260,%eax
    166d:	c7 44 24 04 a9 56 00 	movl   $0x56a9,0x4(%esp)
    1674:	00 
    1675:	89 04 24             	mov    %eax,(%esp)
    1678:	e8 83 37 00 00       	call   4e00 <printf>
    exit();
    167d:	e8 20 36 00 00       	call   4ca2 <exit>
    printf(stdout, "unlink small failed\n");
    1682:	a1 60 72 00 00       	mov    0x7260,%eax
    1687:	c7 44 24 04 90 53 00 	movl   $0x5390,0x4(%esp)
    168e:	00 
    168f:	89 04 24             	mov    %eax,(%esp)
    1692:	e8 69 37 00 00       	call   4e00 <printf>
    exit();
    1697:	e8 06 36 00 00       	call   4ca2 <exit>
    printf(stdout, "error: creat small failed!\n");
    169c:	a1 60 72 00 00       	mov    0x7260,%eax
    16a1:	c7 44 24 04 0c 53 00 	movl   $0x530c,0x4(%esp)
    16a8:	00 
    16a9:	89 04 24             	mov    %eax,(%esp)
    16ac:	e8 4f 37 00 00       	call   4e00 <printf>
    exit();
    16b1:	e8 ec 35 00 00       	call   4ca2 <exit>
    16b6:	8d 76 00             	lea    0x0(%esi),%esi
    16b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000016c0 <writetest1>:
{
    16c0:	55                   	push   %ebp
    16c1:	89 e5                	mov    %esp,%ebp
    16c3:	56                   	push   %esi
    16c4:	53                   	push   %ebx
    16c5:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "big files test\n");
    16c8:	a1 60 72 00 00       	mov    0x7260,%eax
    16cd:	c7 44 24 04 b9 53 00 	movl   $0x53b9,0x4(%esp)
    16d4:	00 
    16d5:	89 04 24             	mov    %eax,(%esp)
    16d8:	e8 23 37 00 00       	call   4e00 <printf>
  fd = open("big", O_CREATE|O_RDWR);
    16dd:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    16e4:	00 
    16e5:	c7 04 24 33 54 00 00 	movl   $0x5433,(%esp)
    16ec:	e8 f1 35 00 00       	call   4ce2 <open>
  if(fd < 0){
    16f1:	85 c0                	test   %eax,%eax
  fd = open("big", O_CREATE|O_RDWR);
    16f3:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    16f5:	0f 88 7a 01 00 00    	js     1875 <writetest1+0x1b5>
    16fb:	31 db                	xor    %ebx,%ebx
    16fd:	8d 76 00             	lea    0x0(%esi),%esi
    if(write(fd, buf, 512) != 512){
    1700:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1707:	00 
    1708:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    170f:	00 
    1710:	89 34 24             	mov    %esi,(%esp)
    ((int*)buf)[0] = i;
    1713:	89 1d 40 9a 00 00    	mov    %ebx,0x9a40
    if(write(fd, buf, 512) != 512){
    1719:	e8 a4 35 00 00       	call   4cc2 <write>
    171e:	3d 00 02 00 00       	cmp    $0x200,%eax
    1723:	0f 85 b2 00 00 00    	jne    17db <writetest1+0x11b>
  for(i = 0; i < MAXFILE; i++){
    1729:	83 c3 01             	add    $0x1,%ebx
    172c:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
    1732:	75 cc                	jne    1700 <writetest1+0x40>
  close(fd);
    1734:	89 34 24             	mov    %esi,(%esp)
    1737:	e8 8e 35 00 00       	call   4cca <close>
  fd = open("big", O_RDONLY);
    173c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1743:	00 
    1744:	c7 04 24 33 54 00 00 	movl   $0x5433,(%esp)
    174b:	e8 92 35 00 00       	call   4ce2 <open>
  if(fd < 0){
    1750:	85 c0                	test   %eax,%eax
  fd = open("big", O_RDONLY);
    1752:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    1754:	0f 88 01 01 00 00    	js     185b <writetest1+0x19b>
    175a:	31 db                	xor    %ebx,%ebx
    175c:	eb 1d                	jmp    177b <writetest1+0xbb>
    175e:	66 90                	xchg   %ax,%ax
    } else if(i != 512){
    1760:	3d 00 02 00 00       	cmp    $0x200,%eax
    1765:	0f 85 b0 00 00 00    	jne    181b <writetest1+0x15b>
    if(((int*)buf)[0] != n){
    176b:	a1 40 9a 00 00       	mov    0x9a40,%eax
    1770:	39 d8                	cmp    %ebx,%eax
    1772:	0f 85 81 00 00 00    	jne    17f9 <writetest1+0x139>
    n++;
    1778:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
    177b:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1782:	00 
    1783:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    178a:	00 
    178b:	89 34 24             	mov    %esi,(%esp)
    178e:	e8 27 35 00 00       	call   4cba <read>
    if(i == 0){
    1793:	85 c0                	test   %eax,%eax
    1795:	75 c9                	jne    1760 <writetest1+0xa0>
      if(n == MAXFILE - 1){
    1797:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
    179d:	0f 84 96 00 00 00    	je     1839 <writetest1+0x179>
  close(fd);
    17a3:	89 34 24             	mov    %esi,(%esp)
    17a6:	e8 1f 35 00 00       	call   4cca <close>
  if(unlink("big") < 0){
    17ab:	c7 04 24 33 54 00 00 	movl   $0x5433,(%esp)
    17b2:	e8 3b 35 00 00       	call   4cf2 <unlink>
    17b7:	85 c0                	test   %eax,%eax
    17b9:	0f 88 d0 00 00 00    	js     188f <writetest1+0x1cf>
  printf(stdout, "big files ok\n");
    17bf:	a1 60 72 00 00       	mov    0x7260,%eax
    17c4:	c7 44 24 04 5a 54 00 	movl   $0x545a,0x4(%esp)
    17cb:	00 
    17cc:	89 04 24             	mov    %eax,(%esp)
    17cf:	e8 2c 36 00 00       	call   4e00 <printf>
}
    17d4:	83 c4 10             	add    $0x10,%esp
    17d7:	5b                   	pop    %ebx
    17d8:	5e                   	pop    %esi
    17d9:	5d                   	pop    %ebp
    17da:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
    17db:	a1 60 72 00 00       	mov    0x7260,%eax
    17e0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    17e4:	c7 44 24 04 e3 53 00 	movl   $0x53e3,0x4(%esp)
    17eb:	00 
    17ec:	89 04 24             	mov    %eax,(%esp)
    17ef:	e8 0c 36 00 00       	call   4e00 <printf>
      exit();
    17f4:	e8 a9 34 00 00       	call   4ca2 <exit>
      printf(stdout, "read content of block %d is %d\n",
    17f9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    17fd:	a1 60 72 00 00       	mov    0x7260,%eax
    1802:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    1806:	c7 44 24 04 34 62 00 	movl   $0x6234,0x4(%esp)
    180d:	00 
    180e:	89 04 24             	mov    %eax,(%esp)
    1811:	e8 ea 35 00 00       	call   4e00 <printf>
      exit();
    1816:	e8 87 34 00 00       	call   4ca2 <exit>
      printf(stdout, "read failed %d\n", i);
    181b:	89 44 24 08          	mov    %eax,0x8(%esp)
    181f:	a1 60 72 00 00       	mov    0x7260,%eax
    1824:	c7 44 24 04 37 54 00 	movl   $0x5437,0x4(%esp)
    182b:	00 
    182c:	89 04 24             	mov    %eax,(%esp)
    182f:	e8 cc 35 00 00       	call   4e00 <printf>
      exit();
    1834:	e8 69 34 00 00       	call   4ca2 <exit>
        printf(stdout, "read only %d blocks from big", n);
    1839:	a1 60 72 00 00       	mov    0x7260,%eax
    183e:	c7 44 24 08 8b 00 00 	movl   $0x8b,0x8(%esp)
    1845:	00 
    1846:	c7 44 24 04 1a 54 00 	movl   $0x541a,0x4(%esp)
    184d:	00 
    184e:	89 04 24             	mov    %eax,(%esp)
    1851:	e8 aa 35 00 00       	call   4e00 <printf>
        exit();
    1856:	e8 47 34 00 00       	call   4ca2 <exit>
    printf(stdout, "error: open big failed!\n");
    185b:	a1 60 72 00 00       	mov    0x7260,%eax
    1860:	c7 44 24 04 01 54 00 	movl   $0x5401,0x4(%esp)
    1867:	00 
    1868:	89 04 24             	mov    %eax,(%esp)
    186b:	e8 90 35 00 00       	call   4e00 <printf>
    exit();
    1870:	e8 2d 34 00 00       	call   4ca2 <exit>
    printf(stdout, "error: creat big failed!\n");
    1875:	a1 60 72 00 00       	mov    0x7260,%eax
    187a:	c7 44 24 04 c9 53 00 	movl   $0x53c9,0x4(%esp)
    1881:	00 
    1882:	89 04 24             	mov    %eax,(%esp)
    1885:	e8 76 35 00 00       	call   4e00 <printf>
    exit();
    188a:	e8 13 34 00 00       	call   4ca2 <exit>
    printf(stdout, "unlink big failed\n");
    188f:	a1 60 72 00 00       	mov    0x7260,%eax
    1894:	c7 44 24 04 47 54 00 	movl   $0x5447,0x4(%esp)
    189b:	00 
    189c:	89 04 24             	mov    %eax,(%esp)
    189f:	e8 5c 35 00 00       	call   4e00 <printf>
    exit();
    18a4:	e8 f9 33 00 00       	call   4ca2 <exit>
    18a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000018b0 <createtest>:
{
    18b0:	55                   	push   %ebp
    18b1:	89 e5                	mov    %esp,%ebp
    18b3:	53                   	push   %ebx
  name[2] = '\0';
    18b4:	bb 30 00 00 00       	mov    $0x30,%ebx
{
    18b9:	83 ec 14             	sub    $0x14,%esp
  printf(stdout, "many creates, followed by unlink test\n");
    18bc:	a1 60 72 00 00       	mov    0x7260,%eax
    18c1:	c7 44 24 04 54 62 00 	movl   $0x6254,0x4(%esp)
    18c8:	00 
    18c9:	89 04 24             	mov    %eax,(%esp)
    18cc:	e8 2f 35 00 00       	call   4e00 <printf>
  name[0] = 'a';
    18d1:	c6 05 40 ba 00 00 61 	movb   $0x61,0xba40
  name[2] = '\0';
    18d8:	c6 05 42 ba 00 00 00 	movb   $0x0,0xba42
    18df:	90                   	nop
    fd = open(name, O_CREATE|O_RDWR);
    18e0:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    18e7:	00 
    18e8:	c7 04 24 40 ba 00 00 	movl   $0xba40,(%esp)
    name[1] = '0' + i;
    18ef:	88 1d 41 ba 00 00    	mov    %bl,0xba41
    18f5:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
    18f8:	e8 e5 33 00 00       	call   4ce2 <open>
    close(fd);
    18fd:	89 04 24             	mov    %eax,(%esp)
    1900:	e8 c5 33 00 00       	call   4cca <close>
  for(i = 0; i < 52; i++){
    1905:	80 fb 64             	cmp    $0x64,%bl
    1908:	75 d6                	jne    18e0 <createtest+0x30>
  name[0] = 'a';
    190a:	c6 05 40 ba 00 00 61 	movb   $0x61,0xba40
  name[2] = '\0';
    1911:	bb 30 00 00 00       	mov    $0x30,%ebx
    1916:	c6 05 42 ba 00 00 00 	movb   $0x0,0xba42
    191d:	8d 76 00             	lea    0x0(%esi),%esi
    name[1] = '0' + i;
    1920:	88 1d 41 ba 00 00    	mov    %bl,0xba41
    1926:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
    1929:	c7 04 24 40 ba 00 00 	movl   $0xba40,(%esp)
    1930:	e8 bd 33 00 00       	call   4cf2 <unlink>
  for(i = 0; i < 52; i++){
    1935:	80 fb 64             	cmp    $0x64,%bl
    1938:	75 e6                	jne    1920 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
    193a:	a1 60 72 00 00       	mov    0x7260,%eax
    193f:	c7 44 24 04 7c 62 00 	movl   $0x627c,0x4(%esp)
    1946:	00 
    1947:	89 04 24             	mov    %eax,(%esp)
    194a:	e8 b1 34 00 00       	call   4e00 <printf>
}
    194f:	83 c4 14             	add    $0x14,%esp
    1952:	5b                   	pop    %ebx
    1953:	5d                   	pop    %ebp
    1954:	c3                   	ret    
    1955:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001960 <dirtest>:
{
    1960:	55                   	push   %ebp
    1961:	89 e5                	mov    %esp,%ebp
    1963:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "mkdir test\n");
    1966:	a1 60 72 00 00       	mov    0x7260,%eax
    196b:	c7 44 24 04 68 54 00 	movl   $0x5468,0x4(%esp)
    1972:	00 
    1973:	89 04 24             	mov    %eax,(%esp)
    1976:	e8 85 34 00 00       	call   4e00 <printf>
  if(mkdir("dir0") < 0){
    197b:	c7 04 24 74 54 00 00 	movl   $0x5474,(%esp)
    1982:	e8 83 33 00 00       	call   4d0a <mkdir>
    1987:	85 c0                	test   %eax,%eax
    1989:	78 4b                	js     19d6 <dirtest+0x76>
  if(chdir("dir0") < 0){
    198b:	c7 04 24 74 54 00 00 	movl   $0x5474,(%esp)
    1992:	e8 7b 33 00 00       	call   4d12 <chdir>
    1997:	85 c0                	test   %eax,%eax
    1999:	0f 88 85 00 00 00    	js     1a24 <dirtest+0xc4>
  if(chdir("..") < 0){
    199f:	c7 04 24 19 5a 00 00 	movl   $0x5a19,(%esp)
    19a6:	e8 67 33 00 00       	call   4d12 <chdir>
    19ab:	85 c0                	test   %eax,%eax
    19ad:	78 5b                	js     1a0a <dirtest+0xaa>
  if(unlink("dir0") < 0){
    19af:	c7 04 24 74 54 00 00 	movl   $0x5474,(%esp)
    19b6:	e8 37 33 00 00       	call   4cf2 <unlink>
    19bb:	85 c0                	test   %eax,%eax
    19bd:	78 31                	js     19f0 <dirtest+0x90>
  printf(stdout, "mkdir test ok\n");
    19bf:	a1 60 72 00 00       	mov    0x7260,%eax
    19c4:	c7 44 24 04 b1 54 00 	movl   $0x54b1,0x4(%esp)
    19cb:	00 
    19cc:	89 04 24             	mov    %eax,(%esp)
    19cf:	e8 2c 34 00 00       	call   4e00 <printf>
}
    19d4:	c9                   	leave  
    19d5:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
    19d6:	a1 60 72 00 00       	mov    0x7260,%eax
    19db:	c7 44 24 04 a4 51 00 	movl   $0x51a4,0x4(%esp)
    19e2:	00 
    19e3:	89 04 24             	mov    %eax,(%esp)
    19e6:	e8 15 34 00 00       	call   4e00 <printf>
    exit();
    19eb:	e8 b2 32 00 00       	call   4ca2 <exit>
    printf(stdout, "unlink dir0 failed\n");
    19f0:	a1 60 72 00 00       	mov    0x7260,%eax
    19f5:	c7 44 24 04 9d 54 00 	movl   $0x549d,0x4(%esp)
    19fc:	00 
    19fd:	89 04 24             	mov    %eax,(%esp)
    1a00:	e8 fb 33 00 00       	call   4e00 <printf>
    exit();
    1a05:	e8 98 32 00 00       	call   4ca2 <exit>
    printf(stdout, "chdir .. failed\n");
    1a0a:	a1 60 72 00 00       	mov    0x7260,%eax
    1a0f:	c7 44 24 04 8c 54 00 	movl   $0x548c,0x4(%esp)
    1a16:	00 
    1a17:	89 04 24             	mov    %eax,(%esp)
    1a1a:	e8 e1 33 00 00       	call   4e00 <printf>
    exit();
    1a1f:	e8 7e 32 00 00       	call   4ca2 <exit>
    printf(stdout, "chdir dir0 failed\n");
    1a24:	a1 60 72 00 00       	mov    0x7260,%eax
    1a29:	c7 44 24 04 79 54 00 	movl   $0x5479,0x4(%esp)
    1a30:	00 
    1a31:	89 04 24             	mov    %eax,(%esp)
    1a34:	e8 c7 33 00 00       	call   4e00 <printf>
    exit();
    1a39:	e8 64 32 00 00       	call   4ca2 <exit>
    1a3e:	66 90                	xchg   %ax,%ax

00001a40 <exectest>:
{
    1a40:	55                   	push   %ebp
    1a41:	89 e5                	mov    %esp,%ebp
    1a43:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exec test\n");
    1a46:	a1 60 72 00 00       	mov    0x7260,%eax
    1a4b:	c7 44 24 04 c0 54 00 	movl   $0x54c0,0x4(%esp)
    1a52:	00 
    1a53:	89 04 24             	mov    %eax,(%esp)
    1a56:	e8 a5 33 00 00       	call   4e00 <printf>
  if(exec("echo", echoargv) < 0){
    1a5b:	c7 44 24 04 64 72 00 	movl   $0x7264,0x4(%esp)
    1a62:	00 
    1a63:	c7 04 24 89 52 00 00 	movl   $0x5289,(%esp)
    1a6a:	e8 6b 32 00 00       	call   4cda <exec>
    1a6f:	85 c0                	test   %eax,%eax
    1a71:	78 02                	js     1a75 <exectest+0x35>
}
    1a73:	c9                   	leave  
    1a74:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
    1a75:	a1 60 72 00 00       	mov    0x7260,%eax
    1a7a:	c7 44 24 04 cb 54 00 	movl   $0x54cb,0x4(%esp)
    1a81:	00 
    1a82:	89 04 24             	mov    %eax,(%esp)
    1a85:	e8 76 33 00 00       	call   4e00 <printf>
    exit();
    1a8a:	e8 13 32 00 00       	call   4ca2 <exit>
    1a8f:	90                   	nop

00001a90 <pipe1>:
{
    1a90:	55                   	push   %ebp
    1a91:	89 e5                	mov    %esp,%ebp
    1a93:	57                   	push   %edi
    1a94:	56                   	push   %esi
    1a95:	53                   	push   %ebx
    1a96:	83 ec 2c             	sub    $0x2c,%esp
  if(pipe(fds) != 0){
    1a99:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1a9c:	89 04 24             	mov    %eax,(%esp)
    1a9f:	e8 0e 32 00 00       	call   4cb2 <pipe>
    1aa4:	85 c0                	test   %eax,%eax
    1aa6:	0f 85 4e 01 00 00    	jne    1bfa <pipe1+0x16a>
  pid = fork();
    1aac:	e8 e9 31 00 00       	call   4c9a <fork>
  if(pid == 0){
    1ab1:	83 f8 00             	cmp    $0x0,%eax
    1ab4:	0f 84 93 00 00 00    	je     1b4d <pipe1+0xbd>
  } else if(pid > 0){
    1aba:	0f 8e 53 01 00 00    	jle    1c13 <pipe1+0x183>
    close(fds[1]);
    1ac0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    cc = 1;
    1ac3:	bf 01 00 00 00       	mov    $0x1,%edi
  seq = 0;
    1ac8:	31 db                	xor    %ebx,%ebx
    close(fds[1]);
    1aca:	89 04 24             	mov    %eax,(%esp)
    1acd:	e8 f8 31 00 00       	call   4cca <close>
    total = 0;
    1ad2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
    1ad9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1adc:	89 7c 24 08          	mov    %edi,0x8(%esp)
    1ae0:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    1ae7:	00 
    1ae8:	89 04 24             	mov    %eax,(%esp)
    1aeb:	e8 ca 31 00 00       	call   4cba <read>
    1af0:	85 c0                	test   %eax,%eax
    1af2:	0f 8e b3 00 00 00    	jle    1bab <pipe1+0x11b>
    1af8:	89 d9                	mov    %ebx,%ecx
    1afa:	8d 34 03             	lea    (%ebx,%eax,1),%esi
    1afd:	f7 d9                	neg    %ecx
    1aff:	eb 09                	jmp    1b0a <pipe1+0x7a>
    1b01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1b08:	89 d3                	mov    %edx,%ebx
    1b0a:	38 9c 0b 40 9a 00 00 	cmp    %bl,0x9a40(%ebx,%ecx,1)
    1b11:	8d 53 01             	lea    0x1(%ebx),%edx
    1b14:	75 1b                	jne    1b31 <pipe1+0xa1>
      for(i = 0; i < n; i++){
    1b16:	39 f2                	cmp    %esi,%edx
    1b18:	75 ee                	jne    1b08 <pipe1+0x78>
      cc = cc * 2;
    1b1a:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1b1c:	89 f3                	mov    %esi,%ebx
      total += n;
    1b1e:	01 45 d4             	add    %eax,-0x2c(%ebp)
        cc = sizeof(buf);
    1b21:	81 ff 01 20 00 00    	cmp    $0x2001,%edi
    1b27:	b8 00 20 00 00       	mov    $0x2000,%eax
    1b2c:	0f 43 f8             	cmovae %eax,%edi
    1b2f:	eb a8                	jmp    1ad9 <pipe1+0x49>
          printf(1, "pipe1 oops 2\n");
    1b31:	c7 44 24 04 fa 54 00 	movl   $0x54fa,0x4(%esp)
    1b38:	00 
    1b39:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b40:	e8 bb 32 00 00       	call   4e00 <printf>
}
    1b45:	83 c4 2c             	add    $0x2c,%esp
    1b48:	5b                   	pop    %ebx
    1b49:	5e                   	pop    %esi
    1b4a:	5f                   	pop    %edi
    1b4b:	5d                   	pop    %ebp
    1b4c:	c3                   	ret    
    close(fds[0]);
    1b4d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  seq = 0;
    1b50:	31 f6                	xor    %esi,%esi
    close(fds[0]);
    1b52:	89 04 24             	mov    %eax,(%esp)
    1b55:	e8 70 31 00 00       	call   4cca <close>
    1b5a:	89 f0                	mov    %esi,%eax
{
    1b5c:	89 f3                	mov    %esi,%ebx
    1b5e:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx
    1b64:	f7 d8                	neg    %eax
    1b66:	66 90                	xchg   %ax,%ax
        buf[i] = seq++;
    1b68:	88 9c 18 40 9a 00 00 	mov    %bl,0x9a40(%eax,%ebx,1)
    1b6f:	83 c3 01             	add    $0x1,%ebx
      for(i = 0; i < 1033; i++)
    1b72:	39 d3                	cmp    %edx,%ebx
    1b74:	75 f2                	jne    1b68 <pipe1+0xd8>
      if(write(fds[1], buf, 1033) != 1033){
    1b76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b79:	89 de                	mov    %ebx,%esi
    1b7b:	c7 44 24 08 09 04 00 	movl   $0x409,0x8(%esp)
    1b82:	00 
    1b83:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    1b8a:	00 
    1b8b:	89 04 24             	mov    %eax,(%esp)
    1b8e:	e8 2f 31 00 00       	call   4cc2 <write>
    1b93:	3d 09 04 00 00       	cmp    $0x409,%eax
    1b98:	0f 85 8e 00 00 00    	jne    1c2c <pipe1+0x19c>
    for(n = 0; n < 5; n++){
    1b9e:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
    1ba4:	75 b4                	jne    1b5a <pipe1+0xca>
      exit();
    1ba6:	e8 f7 30 00 00       	call   4ca2 <exit>
    if(total != 5 * 1033){
    1bab:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
    1bb2:	75 29                	jne    1bdd <pipe1+0x14d>
    close(fds[0]);
    1bb4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1bb7:	89 04 24             	mov    %eax,(%esp)
    1bba:	e8 0b 31 00 00       	call   4cca <close>
    wait();
    1bbf:	e8 e6 30 00 00       	call   4caa <wait>
  printf(1, "pipe1 ok\n");
    1bc4:	c7 44 24 04 1f 55 00 	movl   $0x551f,0x4(%esp)
    1bcb:	00 
    1bcc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bd3:	e8 28 32 00 00       	call   4e00 <printf>
    1bd8:	e9 68 ff ff ff       	jmp    1b45 <pipe1+0xb5>
      printf(1, "pipe1 oops 3 total %d\n", total);
    1bdd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1be0:	c7 44 24 04 08 55 00 	movl   $0x5508,0x4(%esp)
    1be7:	00 
    1be8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bef:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bf3:	e8 08 32 00 00       	call   4e00 <printf>
    1bf8:	eb ac                	jmp    1ba6 <pipe1+0x116>
    printf(1, "pipe() failed\n");
    1bfa:	c7 44 24 04 dd 54 00 	movl   $0x54dd,0x4(%esp)
    1c01:	00 
    1c02:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c09:	e8 f2 31 00 00       	call   4e00 <printf>
    exit();
    1c0e:	e8 8f 30 00 00       	call   4ca2 <exit>
    printf(1, "fork() failed\n");
    1c13:	c7 44 24 04 29 55 00 	movl   $0x5529,0x4(%esp)
    1c1a:	00 
    1c1b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c22:	e8 d9 31 00 00       	call   4e00 <printf>
    exit();
    1c27:	e8 76 30 00 00       	call   4ca2 <exit>
        printf(1, "pipe1 oops 1\n");
    1c2c:	c7 44 24 04 ec 54 00 	movl   $0x54ec,0x4(%esp)
    1c33:	00 
    1c34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c3b:	e8 c0 31 00 00       	call   4e00 <printf>
        exit();
    1c40:	e8 5d 30 00 00       	call   4ca2 <exit>
    1c45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c50 <preempt>:
{
    1c50:	55                   	push   %ebp
    1c51:	89 e5                	mov    %esp,%ebp
    1c53:	57                   	push   %edi
    1c54:	56                   	push   %esi
    1c55:	53                   	push   %ebx
    1c56:	83 ec 2c             	sub    $0x2c,%esp
  printf(1, "preempt: ");
    1c59:	c7 44 24 04 38 55 00 	movl   $0x5538,0x4(%esp)
    1c60:	00 
    1c61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c68:	e8 93 31 00 00       	call   4e00 <printf>
  pid1 = fork();
    1c6d:	e8 28 30 00 00       	call   4c9a <fork>
  if(pid1 == 0)
    1c72:	85 c0                	test   %eax,%eax
  pid1 = fork();
    1c74:	89 c7                	mov    %eax,%edi
  if(pid1 == 0)
    1c76:	75 02                	jne    1c7a <preempt+0x2a>
    1c78:	eb fe                	jmp    1c78 <preempt+0x28>
    1c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  pid2 = fork();
    1c80:	e8 15 30 00 00       	call   4c9a <fork>
  if(pid2 == 0)
    1c85:	85 c0                	test   %eax,%eax
  pid2 = fork();
    1c87:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
    1c89:	75 02                	jne    1c8d <preempt+0x3d>
    1c8b:	eb fe                	jmp    1c8b <preempt+0x3b>
  pipe(pfds);
    1c8d:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1c90:	89 04 24             	mov    %eax,(%esp)
    1c93:	e8 1a 30 00 00       	call   4cb2 <pipe>
  pid3 = fork();
    1c98:	e8 fd 2f 00 00       	call   4c9a <fork>
  if(pid3 == 0){
    1c9d:	85 c0                	test   %eax,%eax
  pid3 = fork();
    1c9f:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
    1ca1:	75 4c                	jne    1cef <preempt+0x9f>
    close(pfds[0]);
    1ca3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ca6:	89 04 24             	mov    %eax,(%esp)
    1ca9:	e8 1c 30 00 00       	call   4cca <close>
    if(write(pfds[1], "x", 1) != 1)
    1cae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1cb1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1cb8:	00 
    1cb9:	c7 44 24 04 fd 5a 00 	movl   $0x5afd,0x4(%esp)
    1cc0:	00 
    1cc1:	89 04 24             	mov    %eax,(%esp)
    1cc4:	e8 f9 2f 00 00       	call   4cc2 <write>
    1cc9:	83 f8 01             	cmp    $0x1,%eax
    1ccc:	74 14                	je     1ce2 <preempt+0x92>
      printf(1, "preempt write error");
    1cce:	c7 44 24 04 42 55 00 	movl   $0x5542,0x4(%esp)
    1cd5:	00 
    1cd6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1cdd:	e8 1e 31 00 00       	call   4e00 <printf>
    close(pfds[1]);
    1ce2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ce5:	89 04 24             	mov    %eax,(%esp)
    1ce8:	e8 dd 2f 00 00       	call   4cca <close>
    1ced:	eb fe                	jmp    1ced <preempt+0x9d>
  close(pfds[1]);
    1cef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1cf2:	89 04 24             	mov    %eax,(%esp)
    1cf5:	e8 d0 2f 00 00       	call   4cca <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    1cfa:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1cfd:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1d04:	00 
    1d05:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    1d0c:	00 
    1d0d:	89 04 24             	mov    %eax,(%esp)
    1d10:	e8 a5 2f 00 00       	call   4cba <read>
    1d15:	83 f8 01             	cmp    $0x1,%eax
    1d18:	74 1c                	je     1d36 <preempt+0xe6>
    printf(1, "preempt read error");
    1d1a:	c7 44 24 04 56 55 00 	movl   $0x5556,0x4(%esp)
    1d21:	00 
    1d22:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d29:	e8 d2 30 00 00       	call   4e00 <printf>
}
    1d2e:	83 c4 2c             	add    $0x2c,%esp
    1d31:	5b                   	pop    %ebx
    1d32:	5e                   	pop    %esi
    1d33:	5f                   	pop    %edi
    1d34:	5d                   	pop    %ebp
    1d35:	c3                   	ret    
  close(pfds[0]);
    1d36:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1d39:	89 04 24             	mov    %eax,(%esp)
    1d3c:	e8 89 2f 00 00       	call   4cca <close>
  printf(1, "kill... ");
    1d41:	c7 44 24 04 69 55 00 	movl   $0x5569,0x4(%esp)
    1d48:	00 
    1d49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d50:	e8 ab 30 00 00       	call   4e00 <printf>
  kill(pid1);
    1d55:	89 3c 24             	mov    %edi,(%esp)
    1d58:	e8 75 2f 00 00       	call   4cd2 <kill>
  kill(pid2);
    1d5d:	89 34 24             	mov    %esi,(%esp)
    1d60:	e8 6d 2f 00 00       	call   4cd2 <kill>
  kill(pid3);
    1d65:	89 1c 24             	mov    %ebx,(%esp)
    1d68:	e8 65 2f 00 00       	call   4cd2 <kill>
  printf(1, "wait... ");
    1d6d:	c7 44 24 04 72 55 00 	movl   $0x5572,0x4(%esp)
    1d74:	00 
    1d75:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d7c:	e8 7f 30 00 00       	call   4e00 <printf>
  wait();
    1d81:	e8 24 2f 00 00       	call   4caa <wait>
  wait();
    1d86:	e8 1f 2f 00 00       	call   4caa <wait>
    1d8b:	90                   	nop
    1d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  wait();
    1d90:	e8 15 2f 00 00       	call   4caa <wait>
  printf(1, "preempt ok\n");
    1d95:	c7 44 24 04 7b 55 00 	movl   $0x557b,0x4(%esp)
    1d9c:	00 
    1d9d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1da4:	e8 57 30 00 00       	call   4e00 <printf>
    1da9:	eb 83                	jmp    1d2e <preempt+0xde>
    1dab:	90                   	nop
    1dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001db0 <exitwait>:
{
    1db0:	55                   	push   %ebp
    1db1:	89 e5                	mov    %esp,%ebp
    1db3:	56                   	push   %esi
    1db4:	be 64 00 00 00       	mov    $0x64,%esi
    1db9:	53                   	push   %ebx
    1dba:	83 ec 10             	sub    $0x10,%esp
    1dbd:	eb 13                	jmp    1dd2 <exitwait+0x22>
    1dbf:	90                   	nop
    if(pid){
    1dc0:	74 71                	je     1e33 <exitwait+0x83>
      if(wait() != pid){
    1dc2:	e8 e3 2e 00 00       	call   4caa <wait>
    1dc7:	39 d8                	cmp    %ebx,%eax
    1dc9:	75 2d                	jne    1df8 <exitwait+0x48>
  for(i = 0; i < 100; i++){
    1dcb:	83 ee 01             	sub    $0x1,%esi
    1dce:	66 90                	xchg   %ax,%ax
    1dd0:	74 46                	je     1e18 <exitwait+0x68>
    pid = fork();
    1dd2:	e8 c3 2e 00 00       	call   4c9a <fork>
    if(pid < 0){
    1dd7:	85 c0                	test   %eax,%eax
    pid = fork();
    1dd9:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1ddb:	79 e3                	jns    1dc0 <exitwait+0x10>
      printf(1, "fork failed\n");
    1ddd:	c7 44 24 04 e5 60 00 	movl   $0x60e5,0x4(%esp)
    1de4:	00 
    1de5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1dec:	e8 0f 30 00 00       	call   4e00 <printf>
}
    1df1:	83 c4 10             	add    $0x10,%esp
    1df4:	5b                   	pop    %ebx
    1df5:	5e                   	pop    %esi
    1df6:	5d                   	pop    %ebp
    1df7:	c3                   	ret    
        printf(1, "wait wrong pid\n");
    1df8:	c7 44 24 04 87 55 00 	movl   $0x5587,0x4(%esp)
    1dff:	00 
    1e00:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e07:	e8 f4 2f 00 00       	call   4e00 <printf>
}
    1e0c:	83 c4 10             	add    $0x10,%esp
    1e0f:	5b                   	pop    %ebx
    1e10:	5e                   	pop    %esi
    1e11:	5d                   	pop    %ebp
    1e12:	c3                   	ret    
    1e13:	90                   	nop
    1e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "exitwait ok\n");
    1e18:	c7 44 24 04 97 55 00 	movl   $0x5597,0x4(%esp)
    1e1f:	00 
    1e20:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e27:	e8 d4 2f 00 00       	call   4e00 <printf>
}
    1e2c:	83 c4 10             	add    $0x10,%esp
    1e2f:	5b                   	pop    %ebx
    1e30:	5e                   	pop    %esi
    1e31:	5d                   	pop    %ebp
    1e32:	c3                   	ret    
      exit();
    1e33:	e8 6a 2e 00 00       	call   4ca2 <exit>
    1e38:	90                   	nop
    1e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001e40 <mem>:
{
    1e40:	55                   	push   %ebp
    1e41:	89 e5                	mov    %esp,%ebp
    1e43:	57                   	push   %edi
    1e44:	56                   	push   %esi
    1e45:	53                   	push   %ebx
    1e46:	83 ec 1c             	sub    $0x1c,%esp
  printf(1, "mem test\n");
    1e49:	c7 44 24 04 a4 55 00 	movl   $0x55a4,0x4(%esp)
    1e50:	00 
    1e51:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e58:	e8 a3 2f 00 00       	call   4e00 <printf>
  ppid = getpid();
    1e5d:	e8 c0 2e 00 00       	call   4d22 <getpid>
    1e62:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
    1e64:	e8 31 2e 00 00       	call   4c9a <fork>
    1e69:	85 c0                	test   %eax,%eax
    1e6b:	75 73                	jne    1ee0 <mem+0xa0>
    1e6d:	31 db                	xor    %ebx,%ebx
    1e6f:	90                   	nop
    1e70:	eb 0a                	jmp    1e7c <mem+0x3c>
    1e72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *(char**)m2 = m1;
    1e78:	89 18                	mov    %ebx,(%eax)
    1e7a:	89 c3                	mov    %eax,%ebx
    while((m2 = malloc(10001)) != 0){
    1e7c:	c7 04 24 11 27 00 00 	movl   $0x2711,(%esp)
    1e83:	e8 f8 31 00 00       	call   5080 <malloc>
    1e88:	85 c0                	test   %eax,%eax
    1e8a:	75 ec                	jne    1e78 <mem+0x38>
    while(m1){
    1e8c:	85 db                	test   %ebx,%ebx
    1e8e:	75 0a                	jne    1e9a <mem+0x5a>
    1e90:	eb 16                	jmp    1ea8 <mem+0x68>
    1e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      m1 = m2;
    1e98:	89 fb                	mov    %edi,%ebx
      m2 = *(char**)m1;
    1e9a:	8b 3b                	mov    (%ebx),%edi
      free(m1);
    1e9c:	89 1c 24             	mov    %ebx,(%esp)
    1e9f:	e8 4c 31 00 00       	call   4ff0 <free>
    while(m1){
    1ea4:	85 ff                	test   %edi,%edi
    1ea6:	75 f0                	jne    1e98 <mem+0x58>
    m1 = malloc(1024*20);
    1ea8:	c7 04 24 00 50 00 00 	movl   $0x5000,(%esp)
    1eaf:	e8 cc 31 00 00       	call   5080 <malloc>
    if(m1 == 0){
    1eb4:	85 c0                	test   %eax,%eax
    1eb6:	74 38                	je     1ef0 <mem+0xb0>
    free(m1);
    1eb8:	89 04 24             	mov    %eax,(%esp)
    1ebb:	e8 30 31 00 00       	call   4ff0 <free>
    printf(1, "mem ok\n");
    1ec0:	c7 44 24 04 c8 55 00 	movl   $0x55c8,0x4(%esp)
    1ec7:	00 
    1ec8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ecf:	e8 2c 2f 00 00       	call   4e00 <printf>
    exit();
    1ed4:	e8 c9 2d 00 00       	call   4ca2 <exit>
    1ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
    1ee0:	83 c4 1c             	add    $0x1c,%esp
    1ee3:	5b                   	pop    %ebx
    1ee4:	5e                   	pop    %esi
    1ee5:	5f                   	pop    %edi
    1ee6:	5d                   	pop    %ebp
    wait();
    1ee7:	e9 be 2d 00 00       	jmp    4caa <wait>
    1eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
    1ef0:	c7 44 24 04 ae 55 00 	movl   $0x55ae,0x4(%esp)
    1ef7:	00 
    1ef8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1eff:	e8 fc 2e 00 00       	call   4e00 <printf>
      kill(ppid);
    1f04:	89 34 24             	mov    %esi,(%esp)
    1f07:	e8 c6 2d 00 00       	call   4cd2 <kill>
      exit();
    1f0c:	e8 91 2d 00 00       	call   4ca2 <exit>
    1f11:	eb 0d                	jmp    1f20 <sharedfd>
    1f13:	90                   	nop
    1f14:	90                   	nop
    1f15:	90                   	nop
    1f16:	90                   	nop
    1f17:	90                   	nop
    1f18:	90                   	nop
    1f19:	90                   	nop
    1f1a:	90                   	nop
    1f1b:	90                   	nop
    1f1c:	90                   	nop
    1f1d:	90                   	nop
    1f1e:	90                   	nop
    1f1f:	90                   	nop

00001f20 <sharedfd>:
{
    1f20:	55                   	push   %ebp
    1f21:	89 e5                	mov    %esp,%ebp
    1f23:	57                   	push   %edi
    1f24:	56                   	push   %esi
    1f25:	53                   	push   %ebx
    1f26:	83 ec 3c             	sub    $0x3c,%esp
  printf(1, "sharedfd test\n");
    1f29:	c7 44 24 04 d0 55 00 	movl   $0x55d0,0x4(%esp)
    1f30:	00 
    1f31:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f38:	e8 c3 2e 00 00       	call   4e00 <printf>
  unlink("sharedfd");
    1f3d:	c7 04 24 df 55 00 00 	movl   $0x55df,(%esp)
    1f44:	e8 a9 2d 00 00       	call   4cf2 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    1f49:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1f50:	00 
    1f51:	c7 04 24 df 55 00 00 	movl   $0x55df,(%esp)
    1f58:	e8 85 2d 00 00       	call   4ce2 <open>
  if(fd < 0){
    1f5d:	85 c0                	test   %eax,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
    1f5f:	89 c7                	mov    %eax,%edi
  if(fd < 0){
    1f61:	0f 88 40 01 00 00    	js     20a7 <sharedfd+0x187>
  pid = fork();
    1f67:	e8 2e 2d 00 00       	call   4c9a <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1f6c:	8d 75 de             	lea    -0x22(%ebp),%esi
    1f6f:	bb e8 03 00 00       	mov    $0x3e8,%ebx
    1f74:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1f7b:	00 
    1f7c:	89 34 24             	mov    %esi,(%esp)
    1f7f:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
    1f82:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1f85:	19 c0                	sbb    %eax,%eax
    1f87:	83 e0 f3             	and    $0xfffffff3,%eax
    1f8a:	83 c0 70             	add    $0x70,%eax
    1f8d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f91:	e8 9a 2b 00 00       	call   4b30 <memset>
    1f96:	eb 05                	jmp    1f9d <sharedfd+0x7d>
  for(i = 0; i < 1000; i++){
    1f98:	83 eb 01             	sub    $0x1,%ebx
    1f9b:	74 2d                	je     1fca <sharedfd+0xaa>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    1f9d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1fa4:	00 
    1fa5:	89 74 24 04          	mov    %esi,0x4(%esp)
    1fa9:	89 3c 24             	mov    %edi,(%esp)
    1fac:	e8 11 2d 00 00       	call   4cc2 <write>
    1fb1:	83 f8 0a             	cmp    $0xa,%eax
    1fb4:	74 e2                	je     1f98 <sharedfd+0x78>
      printf(1, "fstests: write sharedfd failed\n");
    1fb6:	c7 44 24 04 d0 62 00 	movl   $0x62d0,0x4(%esp)
    1fbd:	00 
    1fbe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1fc5:	e8 36 2e 00 00       	call   4e00 <printf>
  if(pid == 0)
    1fca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1fcd:	85 c0                	test   %eax,%eax
    1fcf:	0f 84 26 01 00 00    	je     20fb <sharedfd+0x1db>
    wait();
    1fd5:	e8 d0 2c 00 00       	call   4caa <wait>
  close(fd);
    1fda:	89 3c 24             	mov    %edi,(%esp)
    1fdd:	e8 e8 2c 00 00       	call   4cca <close>
  fd = open("sharedfd", 0);
    1fe2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1fe9:	00 
    1fea:	c7 04 24 df 55 00 00 	movl   $0x55df,(%esp)
    1ff1:	e8 ec 2c 00 00       	call   4ce2 <open>
  if(fd < 0){
    1ff6:	85 c0                	test   %eax,%eax
  fd = open("sharedfd", 0);
    1ff8:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
    1ffb:	0f 88 c2 00 00 00    	js     20c3 <sharedfd+0x1a3>
    2001:	31 d2                	xor    %edx,%edx
    2003:	31 db                	xor    %ebx,%ebx
    2005:	8d 7d e8             	lea    -0x18(%ebp),%edi
    2008:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    200b:	90                   	nop
    200c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
    2010:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2013:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    201a:	00 
    201b:	89 74 24 04          	mov    %esi,0x4(%esp)
    201f:	89 04 24             	mov    %eax,(%esp)
    2022:	e8 93 2c 00 00       	call   4cba <read>
    2027:	85 c0                	test   %eax,%eax
    2029:	7e 36                	jle    2061 <sharedfd+0x141>
    202b:	89 f0                	mov    %esi,%eax
    202d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2030:	eb 18                	jmp    204a <sharedfd+0x12a>
    2032:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        np++;
    2038:	80 f9 70             	cmp    $0x70,%cl
    203b:	0f 94 c1             	sete   %cl
    203e:	83 c0 01             	add    $0x1,%eax
    2041:	0f b6 c9             	movzbl %cl,%ecx
    2044:	01 cb                	add    %ecx,%ebx
    for(i = 0; i < sizeof(buf); i++){
    2046:	39 f8                	cmp    %edi,%eax
    2048:	74 12                	je     205c <sharedfd+0x13c>
      if(buf[i] == 'c')
    204a:	0f b6 08             	movzbl (%eax),%ecx
    204d:	80 f9 63             	cmp    $0x63,%cl
    2050:	75 e6                	jne    2038 <sharedfd+0x118>
    2052:	83 c0 01             	add    $0x1,%eax
        nc++;
    2055:	83 c2 01             	add    $0x1,%edx
    for(i = 0; i < sizeof(buf); i++){
    2058:	39 f8                	cmp    %edi,%eax
    205a:	75 ee                	jne    204a <sharedfd+0x12a>
    205c:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    205f:	eb af                	jmp    2010 <sharedfd+0xf0>
  close(fd);
    2061:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2064:	89 04 24             	mov    %eax,(%esp)
    2067:	e8 5e 2c 00 00       	call   4cca <close>
  unlink("sharedfd");
    206c:	c7 04 24 df 55 00 00 	movl   $0x55df,(%esp)
    2073:	e8 7a 2c 00 00       	call   4cf2 <unlink>
  if(nc == 10000 && np == 10000){
    2078:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    207e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2081:	75 5c                	jne    20df <sharedfd+0x1bf>
    2083:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
    2089:	75 54                	jne    20df <sharedfd+0x1bf>
    printf(1, "sharedfd ok\n");
    208b:	c7 44 24 04 e8 55 00 	movl   $0x55e8,0x4(%esp)
    2092:	00 
    2093:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    209a:	e8 61 2d 00 00       	call   4e00 <printf>
}
    209f:	83 c4 3c             	add    $0x3c,%esp
    20a2:	5b                   	pop    %ebx
    20a3:	5e                   	pop    %esi
    20a4:	5f                   	pop    %edi
    20a5:	5d                   	pop    %ebp
    20a6:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for writing");
    20a7:	c7 44 24 04 a4 62 00 	movl   $0x62a4,0x4(%esp)
    20ae:	00 
    20af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20b6:	e8 45 2d 00 00       	call   4e00 <printf>
}
    20bb:	83 c4 3c             	add    $0x3c,%esp
    20be:	5b                   	pop    %ebx
    20bf:	5e                   	pop    %esi
    20c0:	5f                   	pop    %edi
    20c1:	5d                   	pop    %ebp
    20c2:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
    20c3:	c7 44 24 04 f0 62 00 	movl   $0x62f0,0x4(%esp)
    20ca:	00 
    20cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20d2:	e8 29 2d 00 00       	call   4e00 <printf>
}
    20d7:	83 c4 3c             	add    $0x3c,%esp
    20da:	5b                   	pop    %ebx
    20db:	5e                   	pop    %esi
    20dc:	5f                   	pop    %edi
    20dd:	5d                   	pop    %ebp
    20de:	c3                   	ret    
    printf(1, "sharedfd oops %d %d\n", nc, np);
    20df:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    20e3:	89 54 24 08          	mov    %edx,0x8(%esp)
    20e7:	c7 44 24 04 f5 55 00 	movl   $0x55f5,0x4(%esp)
    20ee:	00 
    20ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20f6:	e8 05 2d 00 00       	call   4e00 <printf>
    exit();
    20fb:	e8 a2 2b 00 00       	call   4ca2 <exit>

00002100 <fourfiles>:
{
    2100:	55                   	push   %ebp
    2101:	89 e5                	mov    %esp,%ebp
    2103:	57                   	push   %edi
    2104:	56                   	push   %esi
  printf(1, "fourfiles test\n");
    2105:	be 0a 56 00 00       	mov    $0x560a,%esi
{
    210a:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    210b:	31 db                	xor    %ebx,%ebx
{
    210d:	83 ec 2c             	sub    $0x2c,%esp
  printf(1, "fourfiles test\n");
    2110:	c7 44 24 04 10 56 00 	movl   $0x5610,0x4(%esp)
    2117:	00 
    2118:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  char *names[] = { "f0", "f1", "f2", "f3" };
    211f:	c7 45 d8 0a 56 00 00 	movl   $0x560a,-0x28(%ebp)
    2126:	c7 45 dc 53 57 00 00 	movl   $0x5753,-0x24(%ebp)
    212d:	c7 45 e0 57 57 00 00 	movl   $0x5757,-0x20(%ebp)
    2134:	c7 45 e4 0d 56 00 00 	movl   $0x560d,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    213b:	e8 c0 2c 00 00       	call   4e00 <printf>
    unlink(fname);
    2140:	89 34 24             	mov    %esi,(%esp)
    2143:	e8 aa 2b 00 00       	call   4cf2 <unlink>
    pid = fork();
    2148:	e8 4d 2b 00 00       	call   4c9a <fork>
    if(pid < 0){
    214d:	85 c0                	test   %eax,%eax
    214f:	0f 88 89 01 00 00    	js     22de <fourfiles+0x1de>
    if(pid == 0){
    2155:	0f 84 e4 00 00 00    	je     223f <fourfiles+0x13f>
  for(pi = 0; pi < 4; pi++){
    215b:	83 c3 01             	add    $0x1,%ebx
    215e:	83 fb 04             	cmp    $0x4,%ebx
    2161:	74 06                	je     2169 <fourfiles+0x69>
    2163:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    2167:	eb d7                	jmp    2140 <fourfiles+0x40>
    wait();
    2169:	e8 3c 2b 00 00       	call   4caa <wait>
    216e:	bf 30 00 00 00       	mov    $0x30,%edi
    2173:	e8 32 2b 00 00       	call   4caa <wait>
    2178:	e8 2d 2b 00 00       	call   4caa <wait>
    217d:	e8 28 2b 00 00       	call   4caa <wait>
    2182:	c7 45 d4 0a 56 00 00 	movl   $0x560a,-0x2c(%ebp)
    fd = open(fname, 0);
    2189:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    total = 0;
    218c:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
    218e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2195:	00 
    2196:	89 04 24             	mov    %eax,(%esp)
    2199:	e8 44 2b 00 00       	call   4ce2 <open>
    219e:	89 c6                	mov    %eax,%esi
    while((n = read(fd, buf, sizeof(buf))) > 0){
    21a0:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    21a7:	00 
    21a8:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    21af:	00 
    21b0:	89 34 24             	mov    %esi,(%esp)
    21b3:	e8 02 2b 00 00       	call   4cba <read>
    21b8:	85 c0                	test   %eax,%eax
    21ba:	7e 1a                	jle    21d6 <fourfiles+0xd6>
    21bc:	31 d2                	xor    %edx,%edx
    21be:	66 90                	xchg   %ax,%ax
        if(buf[j] != '0'+i){
    21c0:	0f be 8a 40 9a 00 00 	movsbl 0x9a40(%edx),%ecx
    21c7:	39 cf                	cmp    %ecx,%edi
    21c9:	75 5b                	jne    2226 <fourfiles+0x126>
      for(j = 0; j < n; j++){
    21cb:	83 c2 01             	add    $0x1,%edx
    21ce:	39 c2                	cmp    %eax,%edx
    21d0:	75 ee                	jne    21c0 <fourfiles+0xc0>
      total += n;
    21d2:	01 d3                	add    %edx,%ebx
    21d4:	eb ca                	jmp    21a0 <fourfiles+0xa0>
    close(fd);
    21d6:	89 34 24             	mov    %esi,(%esp)
    21d9:	e8 ec 2a 00 00       	call   4cca <close>
    if(total != 12*500){
    21de:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    21e4:	0f 85 d7 00 00 00    	jne    22c1 <fourfiles+0x1c1>
    unlink(fname);
    21ea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    21ed:	89 04 24             	mov    %eax,(%esp)
    21f0:	e8 fd 2a 00 00       	call   4cf2 <unlink>
  for(i = 0; i < 2; i++){
    21f5:	83 ff 31             	cmp    $0x31,%edi
    21f8:	75 1c                	jne    2216 <fourfiles+0x116>
  printf(1, "fourfiles ok\n");
    21fa:	c7 44 24 04 4e 56 00 	movl   $0x564e,0x4(%esp)
    2201:	00 
    2202:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2209:	e8 f2 2b 00 00       	call   4e00 <printf>
}
    220e:	83 c4 2c             	add    $0x2c,%esp
    2211:	5b                   	pop    %ebx
    2212:	5e                   	pop    %esi
    2213:	5f                   	pop    %edi
    2214:	5d                   	pop    %ebp
    2215:	c3                   	ret    
    2216:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2219:	bf 31 00 00 00       	mov    $0x31,%edi
    221e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    2221:	e9 63 ff ff ff       	jmp    2189 <fourfiles+0x89>
          printf(1, "wrong char\n");
    2226:	c7 44 24 04 31 56 00 	movl   $0x5631,0x4(%esp)
    222d:	00 
    222e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2235:	e8 c6 2b 00 00       	call   4e00 <printf>
          exit();
    223a:	e8 63 2a 00 00       	call   4ca2 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    223f:	89 34 24             	mov    %esi,(%esp)
    2242:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2249:	00 
    224a:	e8 93 2a 00 00       	call   4ce2 <open>
      if(fd < 0){
    224f:	85 c0                	test   %eax,%eax
      fd = open(fname, O_CREATE | O_RDWR);
    2251:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    2253:	0f 88 9e 00 00 00    	js     22f7 <fourfiles+0x1f7>
      memset(buf, '0'+pi, 512);
    2259:	83 c3 30             	add    $0x30,%ebx
    225c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    2260:	bb 0c 00 00 00       	mov    $0xc,%ebx
    2265:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    226c:	00 
    226d:	c7 04 24 40 9a 00 00 	movl   $0x9a40,(%esp)
    2274:	e8 b7 28 00 00       	call   4b30 <memset>
    2279:	eb 0a                	jmp    2285 <fourfiles+0x185>
    227b:	90                   	nop
    227c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < 12; i++){
    2280:	83 eb 01             	sub    $0x1,%ebx
    2283:	74 b5                	je     223a <fourfiles+0x13a>
        if((n = write(fd, buf, 500)) != 500){
    2285:	c7 44 24 08 f4 01 00 	movl   $0x1f4,0x8(%esp)
    228c:	00 
    228d:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    2294:	00 
    2295:	89 34 24             	mov    %esi,(%esp)
    2298:	e8 25 2a 00 00       	call   4cc2 <write>
    229d:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    22a2:	74 dc                	je     2280 <fourfiles+0x180>
          printf(1, "write failed %d\n", n);
    22a4:	89 44 24 08          	mov    %eax,0x8(%esp)
    22a8:	c7 44 24 04 20 56 00 	movl   $0x5620,0x4(%esp)
    22af:	00 
    22b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22b7:	e8 44 2b 00 00       	call   4e00 <printf>
          exit();
    22bc:	e8 e1 29 00 00       	call   4ca2 <exit>
      printf(1, "wrong length %d\n", total);
    22c1:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    22c5:	c7 44 24 04 3d 56 00 	movl   $0x563d,0x4(%esp)
    22cc:	00 
    22cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22d4:	e8 27 2b 00 00       	call   4e00 <printf>
      exit();
    22d9:	e8 c4 29 00 00       	call   4ca2 <exit>
      printf(1, "fork failed\n");
    22de:	c7 44 24 04 e5 60 00 	movl   $0x60e5,0x4(%esp)
    22e5:	00 
    22e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22ed:	e8 0e 2b 00 00       	call   4e00 <printf>
      exit();
    22f2:	e8 ab 29 00 00       	call   4ca2 <exit>
        printf(1, "create failed\n");
    22f7:	c7 44 24 04 ab 58 00 	movl   $0x58ab,0x4(%esp)
    22fe:	00 
    22ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2306:	e8 f5 2a 00 00       	call   4e00 <printf>
        exit();
    230b:	e8 92 29 00 00       	call   4ca2 <exit>

00002310 <createdelete>:
{
    2310:	55                   	push   %ebp
    2311:	89 e5                	mov    %esp,%ebp
    2313:	57                   	push   %edi
    2314:	56                   	push   %esi
    2315:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    2316:	31 db                	xor    %ebx,%ebx
{
    2318:	83 ec 4c             	sub    $0x4c,%esp
  printf(1, "createdelete test\n");
    231b:	c7 44 24 04 5c 56 00 	movl   $0x565c,0x4(%esp)
    2322:	00 
    2323:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    232a:	e8 d1 2a 00 00       	call   4e00 <printf>
    pid = fork();
    232f:	e8 66 29 00 00       	call   4c9a <fork>
    if(pid < 0){
    2334:	85 c0                	test   %eax,%eax
    2336:	0f 88 d2 01 00 00    	js     250e <createdelete+0x1fe>
    233c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0){
    2340:	0f 84 14 01 00 00    	je     245a <createdelete+0x14a>
  for(pi = 0; pi < 4; pi++){
    2346:	83 c3 01             	add    $0x1,%ebx
    2349:	83 fb 04             	cmp    $0x4,%ebx
    234c:	75 e1                	jne    232f <createdelete+0x1f>
    234e:	66 90                	xchg   %ax,%ax
    wait();
    2350:	e8 55 29 00 00       	call   4caa <wait>
  for(i = 0; i < N; i++){
    2355:	31 f6                	xor    %esi,%esi
    wait();
    2357:	e8 4e 29 00 00       	call   4caa <wait>
    235c:	8d 7d c8             	lea    -0x38(%ebp),%edi
    235f:	e8 46 29 00 00       	call   4caa <wait>
    2364:	e8 41 29 00 00       	call   4caa <wait>
  name[0] = name[1] = name[2] = 0;
    2369:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    236d:	8d 76 00             	lea    0x0(%esi),%esi
    2370:	85 f6                	test   %esi,%esi
      name[2] = '\0';
    2372:	bb 70 00 00 00       	mov    $0x70,%ebx
    2377:	8d 46 30             	lea    0x30(%esi),%eax
    237a:	0f 94 45 c7          	sete   -0x39(%ebp)
    237e:	83 fe 09             	cmp    $0x9,%esi
    2381:	88 45 c6             	mov    %al,-0x3a(%ebp)
    2384:	0f 9f c0             	setg   %al
    2387:	08 45 c7             	or     %al,-0x39(%ebp)
    238a:	8d 46 ff             	lea    -0x1(%esi),%eax
    238d:	89 45 c0             	mov    %eax,-0x40(%ebp)
      name[1] = '0' + i;
    2390:	0f b6 45 c6          	movzbl -0x3a(%ebp),%eax
      fd = open(name, 0);
    2394:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    239b:	00 
    239c:	89 3c 24             	mov    %edi,(%esp)
      name[0] = 'p' + pi;
    239f:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
    23a2:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    23a5:	e8 38 29 00 00       	call   4ce2 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    23aa:	80 7d c7 00          	cmpb   $0x0,-0x39(%ebp)
    23ae:	0f 84 84 00 00 00    	je     2438 <createdelete+0x128>
    23b4:	85 c0                	test   %eax,%eax
    23b6:	0f 88 1c 01 00 00    	js     24d8 <createdelete+0x1c8>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    23bc:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    23c0:	0f 86 61 01 00 00    	jbe    2527 <createdelete+0x217>
        close(fd);
    23c6:	89 04 24             	mov    %eax,(%esp)
    23c9:	83 c3 01             	add    $0x1,%ebx
    23cc:	e8 f9 28 00 00       	call   4cca <close>
    for(pi = 0; pi < 4; pi++){
    23d1:	80 fb 74             	cmp    $0x74,%bl
    23d4:	75 ba                	jne    2390 <createdelete+0x80>
  for(i = 0; i < N; i++){
    23d6:	83 c6 01             	add    $0x1,%esi
    23d9:	83 fe 14             	cmp    $0x14,%esi
    23dc:	75 92                	jne    2370 <createdelete+0x60>
    23de:	be 70 00 00 00       	mov    $0x70,%esi
    23e3:	90                   	nop
    23e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    23e8:	8d 46 c0             	lea    -0x40(%esi),%eax
    23eb:	bb 04 00 00 00       	mov    $0x4,%ebx
    23f0:	88 45 c7             	mov    %al,-0x39(%ebp)
      name[0] = 'p' + i;
    23f3:	89 f0                	mov    %esi,%eax
    23f5:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    23f8:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    23fc:	89 3c 24             	mov    %edi,(%esp)
      name[1] = '0' + i;
    23ff:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    2402:	e8 eb 28 00 00       	call   4cf2 <unlink>
    for(pi = 0; pi < 4; pi++){
    2407:	83 eb 01             	sub    $0x1,%ebx
    240a:	75 e7                	jne    23f3 <createdelete+0xe3>
    240c:	83 c6 01             	add    $0x1,%esi
  for(i = 0; i < N; i++){
    240f:	89 f0                	mov    %esi,%eax
    2411:	3c 84                	cmp    $0x84,%al
    2413:	75 d3                	jne    23e8 <createdelete+0xd8>
  printf(1, "createdelete ok\n");
    2415:	c7 44 24 04 6f 56 00 	movl   $0x566f,0x4(%esp)
    241c:	00 
    241d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2424:	e8 d7 29 00 00       	call   4e00 <printf>
}
    2429:	83 c4 4c             	add    $0x4c,%esp
    242c:	5b                   	pop    %ebx
    242d:	5e                   	pop    %esi
    242e:	5f                   	pop    %edi
    242f:	5d                   	pop    %ebp
    2430:	c3                   	ret    
    2431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if((i >= 1 && i < N/2) && fd >= 0){
    2438:	85 c0                	test   %eax,%eax
    243a:	0f 89 e7 00 00 00    	jns    2527 <createdelete+0x217>
    2440:	83 c3 01             	add    $0x1,%ebx
    for(pi = 0; pi < 4; pi++){
    2443:	80 fb 74             	cmp    $0x74,%bl
    2446:	0f 85 44 ff ff ff    	jne    2390 <createdelete+0x80>
  for(i = 0; i < N; i++){
    244c:	83 c6 01             	add    $0x1,%esi
    244f:	83 fe 14             	cmp    $0x14,%esi
    2452:	0f 85 18 ff ff ff    	jne    2370 <createdelete+0x60>
    2458:	eb 84                	jmp    23de <createdelete+0xce>
      name[0] = 'p' + pi;
    245a:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    245d:	be 01 00 00 00       	mov    $0x1,%esi
      name[0] = 'p' + pi;
    2462:	88 5d c8             	mov    %bl,-0x38(%ebp)
    2465:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    2468:	31 db                	xor    %ebx,%ebx
    246a:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    246e:	eb 0b                	jmp    247b <createdelete+0x16b>
      for(i = 0; i < N; i++){
    2470:	83 fe 14             	cmp    $0x14,%esi
    2473:	74 7b                	je     24f0 <createdelete+0x1e0>
    2475:	83 c3 01             	add    $0x1,%ebx
    2478:	83 c6 01             	add    $0x1,%esi
    247b:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    247e:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2485:	00 
    2486:	89 3c 24             	mov    %edi,(%esp)
    2489:	88 45 c9             	mov    %al,-0x37(%ebp)
    248c:	e8 51 28 00 00       	call   4ce2 <open>
        if(fd < 0){
    2491:	85 c0                	test   %eax,%eax
    2493:	78 60                	js     24f5 <createdelete+0x1e5>
        close(fd);
    2495:	89 04 24             	mov    %eax,(%esp)
    2498:	e8 2d 28 00 00       	call   4cca <close>
        if(i > 0 && (i % 2 ) == 0){
    249d:	85 db                	test   %ebx,%ebx
    249f:	74 d4                	je     2475 <createdelete+0x165>
    24a1:	f6 c3 01             	test   $0x1,%bl
    24a4:	75 ca                	jne    2470 <createdelete+0x160>
          name[1] = '0' + (i / 2);
    24a6:	89 d8                	mov    %ebx,%eax
    24a8:	d1 f8                	sar    %eax
    24aa:	83 c0 30             	add    $0x30,%eax
          if(unlink(name) < 0){
    24ad:	89 3c 24             	mov    %edi,(%esp)
          name[1] = '0' + (i / 2);
    24b0:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    24b3:	e8 3a 28 00 00       	call   4cf2 <unlink>
    24b8:	85 c0                	test   %eax,%eax
    24ba:	79 b4                	jns    2470 <createdelete+0x160>
            printf(1, "unlink failed\n");
    24bc:	c7 44 24 04 5d 52 00 	movl   $0x525d,0x4(%esp)
    24c3:	00 
    24c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24cb:	e8 30 29 00 00       	call   4e00 <printf>
            exit();
    24d0:	e8 cd 27 00 00       	call   4ca2 <exit>
    24d5:	8d 76 00             	lea    0x0(%esi),%esi
        printf(1, "oops createdelete %s didn't exist\n", name);
    24d8:	89 7c 24 08          	mov    %edi,0x8(%esp)
    24dc:	c7 44 24 04 1c 63 00 	movl   $0x631c,0x4(%esp)
    24e3:	00 
    24e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24eb:	e8 10 29 00 00       	call   4e00 <printf>
        exit();
    24f0:	e8 ad 27 00 00       	call   4ca2 <exit>
          printf(1, "create failed\n");
    24f5:	c7 44 24 04 ab 58 00 	movl   $0x58ab,0x4(%esp)
    24fc:	00 
    24fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2504:	e8 f7 28 00 00       	call   4e00 <printf>
          exit();
    2509:	e8 94 27 00 00       	call   4ca2 <exit>
      printf(1, "fork failed\n");
    250e:	c7 44 24 04 e5 60 00 	movl   $0x60e5,0x4(%esp)
    2515:	00 
    2516:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    251d:	e8 de 28 00 00       	call   4e00 <printf>
      exit();
    2522:	e8 7b 27 00 00       	call   4ca2 <exit>
        printf(1, "oops createdelete %s did exist\n", name);
    2527:	89 7c 24 08          	mov    %edi,0x8(%esp)
    252b:	c7 44 24 04 40 63 00 	movl   $0x6340,0x4(%esp)
    2532:	00 
    2533:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    253a:	e8 c1 28 00 00       	call   4e00 <printf>
        exit();
    253f:	e8 5e 27 00 00       	call   4ca2 <exit>
    2544:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    254a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00002550 <unlinkread>:
{
    2550:	55                   	push   %ebp
    2551:	89 e5                	mov    %esp,%ebp
    2553:	56                   	push   %esi
    2554:	53                   	push   %ebx
    2555:	83 ec 10             	sub    $0x10,%esp
  printf(1, "unlinkread test\n");
    2558:	c7 44 24 04 80 56 00 	movl   $0x5680,0x4(%esp)
    255f:	00 
    2560:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2567:	e8 94 28 00 00       	call   4e00 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    256c:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2573:	00 
    2574:	c7 04 24 91 56 00 00 	movl   $0x5691,(%esp)
    257b:	e8 62 27 00 00       	call   4ce2 <open>
  if(fd < 0){
    2580:	85 c0                	test   %eax,%eax
  fd = open("unlinkread", O_CREATE | O_RDWR);
    2582:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2584:	0f 88 fe 00 00 00    	js     2688 <unlinkread+0x138>
  write(fd, "hello", 5);
    258a:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    2591:	00 
    2592:	c7 44 24 04 b6 56 00 	movl   $0x56b6,0x4(%esp)
    2599:	00 
    259a:	89 04 24             	mov    %eax,(%esp)
    259d:	e8 20 27 00 00       	call   4cc2 <write>
  close(fd);
    25a2:	89 1c 24             	mov    %ebx,(%esp)
    25a5:	e8 20 27 00 00       	call   4cca <close>
  fd = open("unlinkread", O_RDWR);
    25aa:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    25b1:	00 
    25b2:	c7 04 24 91 56 00 00 	movl   $0x5691,(%esp)
    25b9:	e8 24 27 00 00       	call   4ce2 <open>
  if(fd < 0){
    25be:	85 c0                	test   %eax,%eax
  fd = open("unlinkread", O_RDWR);
    25c0:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    25c2:	0f 88 3d 01 00 00    	js     2705 <unlinkread+0x1b5>
  if(unlink("unlinkread") != 0){
    25c8:	c7 04 24 91 56 00 00 	movl   $0x5691,(%esp)
    25cf:	e8 1e 27 00 00       	call   4cf2 <unlink>
    25d4:	85 c0                	test   %eax,%eax
    25d6:	0f 85 10 01 00 00    	jne    26ec <unlinkread+0x19c>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    25dc:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    25e3:	00 
    25e4:	c7 04 24 91 56 00 00 	movl   $0x5691,(%esp)
    25eb:	e8 f2 26 00 00       	call   4ce2 <open>
  write(fd1, "yyy", 3);
    25f0:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    25f7:	00 
    25f8:	c7 44 24 04 ee 56 00 	movl   $0x56ee,0x4(%esp)
    25ff:	00 
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    2600:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    2602:	89 04 24             	mov    %eax,(%esp)
    2605:	e8 b8 26 00 00       	call   4cc2 <write>
  close(fd1);
    260a:	89 34 24             	mov    %esi,(%esp)
    260d:	e8 b8 26 00 00       	call   4cca <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    2612:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    2619:	00 
    261a:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    2621:	00 
    2622:	89 1c 24             	mov    %ebx,(%esp)
    2625:	e8 90 26 00 00       	call   4cba <read>
    262a:	83 f8 05             	cmp    $0x5,%eax
    262d:	0f 85 a0 00 00 00    	jne    26d3 <unlinkread+0x183>
  if(buf[0] != 'h'){
    2633:	80 3d 40 9a 00 00 68 	cmpb   $0x68,0x9a40
    263a:	75 7e                	jne    26ba <unlinkread+0x16a>
  if(write(fd, buf, 10) != 10){
    263c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    2643:	00 
    2644:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    264b:	00 
    264c:	89 1c 24             	mov    %ebx,(%esp)
    264f:	e8 6e 26 00 00       	call   4cc2 <write>
    2654:	83 f8 0a             	cmp    $0xa,%eax
    2657:	75 48                	jne    26a1 <unlinkread+0x151>
  close(fd);
    2659:	89 1c 24             	mov    %ebx,(%esp)
    265c:	e8 69 26 00 00       	call   4cca <close>
  unlink("unlinkread");
    2661:	c7 04 24 91 56 00 00 	movl   $0x5691,(%esp)
    2668:	e8 85 26 00 00       	call   4cf2 <unlink>
  printf(1, "unlinkread ok\n");
    266d:	c7 44 24 04 39 57 00 	movl   $0x5739,0x4(%esp)
    2674:	00 
    2675:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    267c:	e8 7f 27 00 00       	call   4e00 <printf>
}
    2681:	83 c4 10             	add    $0x10,%esp
    2684:	5b                   	pop    %ebx
    2685:	5e                   	pop    %esi
    2686:	5d                   	pop    %ebp
    2687:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    2688:	c7 44 24 04 9c 56 00 	movl   $0x569c,0x4(%esp)
    268f:	00 
    2690:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2697:	e8 64 27 00 00       	call   4e00 <printf>
    exit();
    269c:	e8 01 26 00 00       	call   4ca2 <exit>
    printf(1, "unlinkread write failed\n");
    26a1:	c7 44 24 04 20 57 00 	movl   $0x5720,0x4(%esp)
    26a8:	00 
    26a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26b0:	e8 4b 27 00 00       	call   4e00 <printf>
    exit();
    26b5:	e8 e8 25 00 00       	call   4ca2 <exit>
    printf(1, "unlinkread wrong data\n");
    26ba:	c7 44 24 04 09 57 00 	movl   $0x5709,0x4(%esp)
    26c1:	00 
    26c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26c9:	e8 32 27 00 00       	call   4e00 <printf>
    exit();
    26ce:	e8 cf 25 00 00       	call   4ca2 <exit>
    printf(1, "unlinkread read failed");
    26d3:	c7 44 24 04 f2 56 00 	movl   $0x56f2,0x4(%esp)
    26da:	00 
    26db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26e2:	e8 19 27 00 00       	call   4e00 <printf>
    exit();
    26e7:	e8 b6 25 00 00       	call   4ca2 <exit>
    printf(1, "unlink unlinkread failed\n");
    26ec:	c7 44 24 04 d4 56 00 	movl   $0x56d4,0x4(%esp)
    26f3:	00 
    26f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26fb:	e8 00 27 00 00       	call   4e00 <printf>
    exit();
    2700:	e8 9d 25 00 00       	call   4ca2 <exit>
    printf(1, "open unlinkread failed\n");
    2705:	c7 44 24 04 bc 56 00 	movl   $0x56bc,0x4(%esp)
    270c:	00 
    270d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2714:	e8 e7 26 00 00       	call   4e00 <printf>
    exit();
    2719:	e8 84 25 00 00       	call   4ca2 <exit>
    271e:	66 90                	xchg   %ax,%ax

00002720 <linktest>:
{
    2720:	55                   	push   %ebp
    2721:	89 e5                	mov    %esp,%ebp
    2723:	53                   	push   %ebx
    2724:	83 ec 14             	sub    $0x14,%esp
  printf(1, "linktest\n");
    2727:	c7 44 24 04 48 57 00 	movl   $0x5748,0x4(%esp)
    272e:	00 
    272f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2736:	e8 c5 26 00 00       	call   4e00 <printf>
  unlink("lf1");
    273b:	c7 04 24 52 57 00 00 	movl   $0x5752,(%esp)
    2742:	e8 ab 25 00 00       	call   4cf2 <unlink>
  unlink("lf2");
    2747:	c7 04 24 56 57 00 00 	movl   $0x5756,(%esp)
    274e:	e8 9f 25 00 00       	call   4cf2 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    2753:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    275a:	00 
    275b:	c7 04 24 52 57 00 00 	movl   $0x5752,(%esp)
    2762:	e8 7b 25 00 00       	call   4ce2 <open>
  if(fd < 0){
    2767:	85 c0                	test   %eax,%eax
  fd = open("lf1", O_CREATE|O_RDWR);
    2769:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    276b:	0f 88 26 01 00 00    	js     2897 <linktest+0x177>
  if(write(fd, "hello", 5) != 5){
    2771:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    2778:	00 
    2779:	c7 44 24 04 b6 56 00 	movl   $0x56b6,0x4(%esp)
    2780:	00 
    2781:	89 04 24             	mov    %eax,(%esp)
    2784:	e8 39 25 00 00       	call   4cc2 <write>
    2789:	83 f8 05             	cmp    $0x5,%eax
    278c:	0f 85 cd 01 00 00    	jne    295f <linktest+0x23f>
  close(fd);
    2792:	89 1c 24             	mov    %ebx,(%esp)
    2795:	e8 30 25 00 00       	call   4cca <close>
  if(link("lf1", "lf2") < 0){
    279a:	c7 44 24 04 56 57 00 	movl   $0x5756,0x4(%esp)
    27a1:	00 
    27a2:	c7 04 24 52 57 00 00 	movl   $0x5752,(%esp)
    27a9:	e8 54 25 00 00       	call   4d02 <link>
    27ae:	85 c0                	test   %eax,%eax
    27b0:	0f 88 90 01 00 00    	js     2946 <linktest+0x226>
  unlink("lf1");
    27b6:	c7 04 24 52 57 00 00 	movl   $0x5752,(%esp)
    27bd:	e8 30 25 00 00       	call   4cf2 <unlink>
  if(open("lf1", 0) >= 0){
    27c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    27c9:	00 
    27ca:	c7 04 24 52 57 00 00 	movl   $0x5752,(%esp)
    27d1:	e8 0c 25 00 00       	call   4ce2 <open>
    27d6:	85 c0                	test   %eax,%eax
    27d8:	0f 89 4f 01 00 00    	jns    292d <linktest+0x20d>
  fd = open("lf2", 0);
    27de:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    27e5:	00 
    27e6:	c7 04 24 56 57 00 00 	movl   $0x5756,(%esp)
    27ed:	e8 f0 24 00 00       	call   4ce2 <open>
  if(fd < 0){
    27f2:	85 c0                	test   %eax,%eax
  fd = open("lf2", 0);
    27f4:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    27f6:	0f 88 18 01 00 00    	js     2914 <linktest+0x1f4>
  if(read(fd, buf, sizeof(buf)) != 5){
    27fc:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    2803:	00 
    2804:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    280b:	00 
    280c:	89 04 24             	mov    %eax,(%esp)
    280f:	e8 a6 24 00 00       	call   4cba <read>
    2814:	83 f8 05             	cmp    $0x5,%eax
    2817:	0f 85 de 00 00 00    	jne    28fb <linktest+0x1db>
  close(fd);
    281d:	89 1c 24             	mov    %ebx,(%esp)
    2820:	e8 a5 24 00 00       	call   4cca <close>
  if(link("lf2", "lf2") >= 0){
    2825:	c7 44 24 04 56 57 00 	movl   $0x5756,0x4(%esp)
    282c:	00 
    282d:	c7 04 24 56 57 00 00 	movl   $0x5756,(%esp)
    2834:	e8 c9 24 00 00       	call   4d02 <link>
    2839:	85 c0                	test   %eax,%eax
    283b:	0f 89 a1 00 00 00    	jns    28e2 <linktest+0x1c2>
  unlink("lf2");
    2841:	c7 04 24 56 57 00 00 	movl   $0x5756,(%esp)
    2848:	e8 a5 24 00 00       	call   4cf2 <unlink>
  if(link("lf2", "lf1") >= 0){
    284d:	c7 44 24 04 52 57 00 	movl   $0x5752,0x4(%esp)
    2854:	00 
    2855:	c7 04 24 56 57 00 00 	movl   $0x5756,(%esp)
    285c:	e8 a1 24 00 00       	call   4d02 <link>
    2861:	85 c0                	test   %eax,%eax
    2863:	79 64                	jns    28c9 <linktest+0x1a9>
  if(link(".", "lf1") >= 0){
    2865:	c7 44 24 04 52 57 00 	movl   $0x5752,0x4(%esp)
    286c:	00 
    286d:	c7 04 24 1a 5a 00 00 	movl   $0x5a1a,(%esp)
    2874:	e8 89 24 00 00       	call   4d02 <link>
    2879:	85 c0                	test   %eax,%eax
    287b:	79 33                	jns    28b0 <linktest+0x190>
  printf(1, "linktest ok\n");
    287d:	c7 44 24 04 f0 57 00 	movl   $0x57f0,0x4(%esp)
    2884:	00 
    2885:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    288c:	e8 6f 25 00 00       	call   4e00 <printf>
}
    2891:	83 c4 14             	add    $0x14,%esp
    2894:	5b                   	pop    %ebx
    2895:	5d                   	pop    %ebp
    2896:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    2897:	c7 44 24 04 5a 57 00 	movl   $0x575a,0x4(%esp)
    289e:	00 
    289f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28a6:	e8 55 25 00 00       	call   4e00 <printf>
    exit();
    28ab:	e8 f2 23 00 00       	call   4ca2 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    28b0:	c7 44 24 04 d4 57 00 	movl   $0x57d4,0x4(%esp)
    28b7:	00 
    28b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28bf:	e8 3c 25 00 00       	call   4e00 <printf>
    exit();
    28c4:	e8 d9 23 00 00       	call   4ca2 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    28c9:	c7 44 24 04 88 63 00 	movl   $0x6388,0x4(%esp)
    28d0:	00 
    28d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28d8:	e8 23 25 00 00       	call   4e00 <printf>
    exit();
    28dd:	e8 c0 23 00 00       	call   4ca2 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    28e2:	c7 44 24 04 b6 57 00 	movl   $0x57b6,0x4(%esp)
    28e9:	00 
    28ea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28f1:	e8 0a 25 00 00       	call   4e00 <printf>
    exit();
    28f6:	e8 a7 23 00 00       	call   4ca2 <exit>
    printf(1, "read lf2 failed\n");
    28fb:	c7 44 24 04 a5 57 00 	movl   $0x57a5,0x4(%esp)
    2902:	00 
    2903:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    290a:	e8 f1 24 00 00       	call   4e00 <printf>
    exit();
    290f:	e8 8e 23 00 00       	call   4ca2 <exit>
    printf(1, "open lf2 failed\n");
    2914:	c7 44 24 04 94 57 00 	movl   $0x5794,0x4(%esp)
    291b:	00 
    291c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2923:	e8 d8 24 00 00       	call   4e00 <printf>
    exit();
    2928:	e8 75 23 00 00       	call   4ca2 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    292d:	c7 44 24 04 60 63 00 	movl   $0x6360,0x4(%esp)
    2934:	00 
    2935:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    293c:	e8 bf 24 00 00       	call   4e00 <printf>
    exit();
    2941:	e8 5c 23 00 00       	call   4ca2 <exit>
    printf(1, "link lf1 lf2 failed\n");
    2946:	c7 44 24 04 7f 57 00 	movl   $0x577f,0x4(%esp)
    294d:	00 
    294e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2955:	e8 a6 24 00 00       	call   4e00 <printf>
    exit();
    295a:	e8 43 23 00 00       	call   4ca2 <exit>
    printf(1, "write lf1 failed\n");
    295f:	c7 44 24 04 6d 57 00 	movl   $0x576d,0x4(%esp)
    2966:	00 
    2967:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    296e:	e8 8d 24 00 00       	call   4e00 <printf>
    exit();
    2973:	e8 2a 23 00 00       	call   4ca2 <exit>
    2978:	90                   	nop
    2979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002980 <concreate>:
{
    2980:	55                   	push   %ebp
    2981:	89 e5                	mov    %esp,%ebp
    2983:	57                   	push   %edi
    2984:	56                   	push   %esi
  for(i = 0; i < 40; i++){
    2985:	31 f6                	xor    %esi,%esi
{
    2987:	53                   	push   %ebx
    2988:	83 ec 5c             	sub    $0x5c,%esp
  printf(1, "concreate test\n");
    298b:	c7 44 24 04 fd 57 00 	movl   $0x57fd,0x4(%esp)
    2992:	00 
    2993:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    2996:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    299d:	e8 5e 24 00 00       	call   4e00 <printf>
  file[0] = 'C';
    29a2:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    29a6:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    29aa:	eb 4f                	jmp    29fb <concreate+0x7b>
    29ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid && (i % 3) == 1){
    29b0:	b8 56 55 55 55       	mov    $0x55555556,%eax
    29b5:	89 f1                	mov    %esi,%ecx
    29b7:	f7 ee                	imul   %esi
    29b9:	89 f0                	mov    %esi,%eax
    29bb:	c1 f8 1f             	sar    $0x1f,%eax
    29be:	29 c2                	sub    %eax,%edx
    29c0:	8d 04 52             	lea    (%edx,%edx,2),%eax
    29c3:	29 c1                	sub    %eax,%ecx
    29c5:	83 f9 01             	cmp    $0x1,%ecx
    29c8:	74 7e                	je     2a48 <concreate+0xc8>
      fd = open(file, O_CREATE | O_RDWR);
    29ca:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    29d1:	00 
    29d2:	89 1c 24             	mov    %ebx,(%esp)
    29d5:	e8 08 23 00 00       	call   4ce2 <open>
      if(fd < 0){
    29da:	85 c0                	test   %eax,%eax
    29dc:	0f 88 43 02 00 00    	js     2c25 <concreate+0x2a5>
      close(fd);
    29e2:	89 04 24             	mov    %eax,(%esp)
    29e5:	e8 e0 22 00 00       	call   4cca <close>
    if(pid == 0)
    29ea:	85 ff                	test   %edi,%edi
    29ec:	74 52                	je     2a40 <concreate+0xc0>
  for(i = 0; i < 40; i++){
    29ee:	83 c6 01             	add    $0x1,%esi
      wait();
    29f1:	e8 b4 22 00 00       	call   4caa <wait>
  for(i = 0; i < 40; i++){
    29f6:	83 fe 28             	cmp    $0x28,%esi
    29f9:	74 6d                	je     2a68 <concreate+0xe8>
    29fb:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    29fe:	89 1c 24             	mov    %ebx,(%esp)
    2a01:	88 45 ae             	mov    %al,-0x52(%ebp)
    2a04:	e8 e9 22 00 00       	call   4cf2 <unlink>
    pid = fork();
    2a09:	e8 8c 22 00 00       	call   4c9a <fork>
    if(pid && (i % 3) == 1){
    2a0e:	85 c0                	test   %eax,%eax
    pid = fork();
    2a10:	89 c7                	mov    %eax,%edi
    if(pid && (i % 3) == 1){
    2a12:	75 9c                	jne    29b0 <concreate+0x30>
    } else if(pid == 0 && (i % 5) == 1){
    2a14:	b8 67 66 66 66       	mov    $0x66666667,%eax
    2a19:	89 f1                	mov    %esi,%ecx
    2a1b:	f7 ee                	imul   %esi
    2a1d:	89 f0                	mov    %esi,%eax
    2a1f:	c1 f8 1f             	sar    $0x1f,%eax
    2a22:	d1 fa                	sar    %edx
    2a24:	29 c2                	sub    %eax,%edx
    2a26:	8d 04 92             	lea    (%edx,%edx,4),%eax
    2a29:	29 c1                	sub    %eax,%ecx
    2a2b:	83 f9 01             	cmp    $0x1,%ecx
    2a2e:	75 9a                	jne    29ca <concreate+0x4a>
      link("C0", file);
    2a30:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    2a34:	c7 04 24 0d 58 00 00 	movl   $0x580d,(%esp)
    2a3b:	e8 c2 22 00 00       	call   4d02 <link>
        exit();
    2a40:	e8 5d 22 00 00       	call   4ca2 <exit>
    2a45:	8d 76 00             	lea    0x0(%esi),%esi
      link("C0", file);
    2a48:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  for(i = 0; i < 40; i++){
    2a4c:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    2a4f:	c7 04 24 0d 58 00 00 	movl   $0x580d,(%esp)
    2a56:	e8 a7 22 00 00       	call   4d02 <link>
      wait();
    2a5b:	e8 4a 22 00 00       	call   4caa <wait>
  for(i = 0; i < 40; i++){
    2a60:	83 fe 28             	cmp    $0x28,%esi
    2a63:	75 96                	jne    29fb <concreate+0x7b>
    2a65:	8d 76 00             	lea    0x0(%esi),%esi
  memset(fa, 0, sizeof(fa));
    2a68:	8d 45 c0             	lea    -0x40(%ebp),%eax
    2a6b:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    2a72:	00 
    2a73:	8d 7d b0             	lea    -0x50(%ebp),%edi
    2a76:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2a7d:	00 
    2a7e:	89 04 24             	mov    %eax,(%esp)
    2a81:	e8 aa 20 00 00       	call   4b30 <memset>
  fd = open(".", 0);
    2a86:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2a8d:	00 
    2a8e:	c7 04 24 1a 5a 00 00 	movl   $0x5a1a,(%esp)
    2a95:	e8 48 22 00 00       	call   4ce2 <open>
  n = 0;
    2a9a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
  fd = open(".", 0);
    2aa1:	89 c6                	mov    %eax,%esi
    2aa3:	90                   	nop
    2aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    2aa8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    2aaf:	00 
    2ab0:	89 7c 24 04          	mov    %edi,0x4(%esp)
    2ab4:	89 34 24             	mov    %esi,(%esp)
    2ab7:	e8 fe 21 00 00       	call   4cba <read>
    2abc:	85 c0                	test   %eax,%eax
    2abe:	7e 40                	jle    2b00 <concreate+0x180>
    if(de.inum == 0)
    2ac0:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    2ac5:	74 e1                	je     2aa8 <concreate+0x128>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    2ac7:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    2acb:	75 db                	jne    2aa8 <concreate+0x128>
    2acd:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    2ad1:	75 d5                	jne    2aa8 <concreate+0x128>
      i = de.name[1] - '0';
    2ad3:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    2ad7:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    2ada:	83 f8 27             	cmp    $0x27,%eax
    2add:	0f 87 5f 01 00 00    	ja     2c42 <concreate+0x2c2>
      if(fa[i]){
    2ae3:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    2ae8:	0f 85 8d 01 00 00    	jne    2c7b <concreate+0x2fb>
      fa[i] = 1;
    2aee:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    2af3:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    2af7:	eb af                	jmp    2aa8 <concreate+0x128>
    2af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    2b00:	89 34 24             	mov    %esi,(%esp)
    2b03:	e8 c2 21 00 00       	call   4cca <close>
  if(n != 40){
    2b08:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    2b0c:	0f 85 50 01 00 00    	jne    2c62 <concreate+0x2e2>
    2b12:	31 f6                	xor    %esi,%esi
    2b14:	eb 7f                	jmp    2b95 <concreate+0x215>
    2b16:	66 90                	xchg   %ax,%ax
       ((i % 3) == 1 && pid != 0)){
    2b18:	85 ff                	test   %edi,%edi
    2b1a:	0f 84 ae 00 00 00    	je     2bce <concreate+0x24e>
      close(open(file, 0));
    2b20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b27:	00 
    2b28:	89 1c 24             	mov    %ebx,(%esp)
    2b2b:	e8 b2 21 00 00       	call   4ce2 <open>
    2b30:	89 04 24             	mov    %eax,(%esp)
    2b33:	e8 92 21 00 00       	call   4cca <close>
      close(open(file, 0));
    2b38:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b3f:	00 
    2b40:	89 1c 24             	mov    %ebx,(%esp)
    2b43:	e8 9a 21 00 00       	call   4ce2 <open>
    2b48:	89 04 24             	mov    %eax,(%esp)
    2b4b:	e8 7a 21 00 00       	call   4cca <close>
      close(open(file, 0));
    2b50:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b57:	00 
    2b58:	89 1c 24             	mov    %ebx,(%esp)
    2b5b:	e8 82 21 00 00       	call   4ce2 <open>
    2b60:	89 04 24             	mov    %eax,(%esp)
    2b63:	e8 62 21 00 00       	call   4cca <close>
      close(open(file, 0));
    2b68:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b6f:	00 
    2b70:	89 1c 24             	mov    %ebx,(%esp)
    2b73:	e8 6a 21 00 00       	call   4ce2 <open>
    2b78:	89 04 24             	mov    %eax,(%esp)
    2b7b:	e8 4a 21 00 00       	call   4cca <close>
    if(pid == 0)
    2b80:	85 ff                	test   %edi,%edi
    2b82:	0f 84 b8 fe ff ff    	je     2a40 <concreate+0xc0>
  for(i = 0; i < 40; i++){
    2b88:	83 c6 01             	add    $0x1,%esi
      wait();
    2b8b:	e8 1a 21 00 00       	call   4caa <wait>
  for(i = 0; i < 40; i++){
    2b90:	83 fe 28             	cmp    $0x28,%esi
    2b93:	74 5b                	je     2bf0 <concreate+0x270>
    2b95:	8d 46 30             	lea    0x30(%esi),%eax
    2b98:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    2b9b:	e8 fa 20 00 00       	call   4c9a <fork>
    if(pid < 0){
    2ba0:	85 c0                	test   %eax,%eax
    pid = fork();
    2ba2:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    2ba4:	78 66                	js     2c0c <concreate+0x28c>
    if(((i % 3) == 0 && pid == 0) ||
    2ba6:	b8 56 55 55 55       	mov    $0x55555556,%eax
    2bab:	f7 ee                	imul   %esi
    2bad:	89 f0                	mov    %esi,%eax
    2baf:	c1 f8 1f             	sar    $0x1f,%eax
    2bb2:	29 c2                	sub    %eax,%edx
    2bb4:	8d 04 52             	lea    (%edx,%edx,2),%eax
    2bb7:	89 f2                	mov    %esi,%edx
    2bb9:	29 c2                	sub    %eax,%edx
    2bbb:	89 d0                	mov    %edx,%eax
    2bbd:	09 f8                	or     %edi,%eax
    2bbf:	0f 84 5b ff ff ff    	je     2b20 <concreate+0x1a0>
    2bc5:	83 fa 01             	cmp    $0x1,%edx
    2bc8:	0f 84 4a ff ff ff    	je     2b18 <concreate+0x198>
      unlink(file);
    2bce:	89 1c 24             	mov    %ebx,(%esp)
    2bd1:	e8 1c 21 00 00       	call   4cf2 <unlink>
      unlink(file);
    2bd6:	89 1c 24             	mov    %ebx,(%esp)
    2bd9:	e8 14 21 00 00       	call   4cf2 <unlink>
      unlink(file);
    2bde:	89 1c 24             	mov    %ebx,(%esp)
    2be1:	e8 0c 21 00 00       	call   4cf2 <unlink>
      unlink(file);
    2be6:	89 1c 24             	mov    %ebx,(%esp)
    2be9:	e8 04 21 00 00       	call   4cf2 <unlink>
    2bee:	eb 90                	jmp    2b80 <concreate+0x200>
  printf(1, "concreate ok\n");
    2bf0:	c7 44 24 04 62 58 00 	movl   $0x5862,0x4(%esp)
    2bf7:	00 
    2bf8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bff:	e8 fc 21 00 00       	call   4e00 <printf>
}
    2c04:	83 c4 5c             	add    $0x5c,%esp
    2c07:	5b                   	pop    %ebx
    2c08:	5e                   	pop    %esi
    2c09:	5f                   	pop    %edi
    2c0a:	5d                   	pop    %ebp
    2c0b:	c3                   	ret    
      printf(1, "fork failed\n");
    2c0c:	c7 44 24 04 e5 60 00 	movl   $0x60e5,0x4(%esp)
    2c13:	00 
    2c14:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c1b:	e8 e0 21 00 00       	call   4e00 <printf>
      exit();
    2c20:	e8 7d 20 00 00       	call   4ca2 <exit>
        printf(1, "concreate create %s failed\n", file);
    2c25:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    2c29:	c7 44 24 04 10 58 00 	movl   $0x5810,0x4(%esp)
    2c30:	00 
    2c31:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c38:	e8 c3 21 00 00       	call   4e00 <printf>
        exit();
    2c3d:	e8 60 20 00 00       	call   4ca2 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    2c42:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2c45:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c49:	c7 44 24 04 2c 58 00 	movl   $0x582c,0x4(%esp)
    2c50:	00 
    2c51:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c58:	e8 a3 21 00 00       	call   4e00 <printf>
    2c5d:	e9 de fd ff ff       	jmp    2a40 <concreate+0xc0>
    printf(1, "concreate not enough files in directory listing\n");
    2c62:	c7 44 24 04 ac 63 00 	movl   $0x63ac,0x4(%esp)
    2c69:	00 
    2c6a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c71:	e8 8a 21 00 00       	call   4e00 <printf>
    exit();
    2c76:	e8 27 20 00 00       	call   4ca2 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    2c7b:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2c7e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c82:	c7 44 24 04 45 58 00 	movl   $0x5845,0x4(%esp)
    2c89:	00 
    2c8a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c91:	e8 6a 21 00 00       	call   4e00 <printf>
        exit();
    2c96:	e8 07 20 00 00       	call   4ca2 <exit>
    2c9b:	90                   	nop
    2c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002ca0 <linkunlink>:
{
    2ca0:	55                   	push   %ebp
    2ca1:	89 e5                	mov    %esp,%ebp
    2ca3:	57                   	push   %edi
    2ca4:	56                   	push   %esi
    2ca5:	53                   	push   %ebx
    2ca6:	83 ec 1c             	sub    $0x1c,%esp
  printf(1, "linkunlink test\n");
    2ca9:	c7 44 24 04 70 58 00 	movl   $0x5870,0x4(%esp)
    2cb0:	00 
    2cb1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2cb8:	e8 43 21 00 00       	call   4e00 <printf>
  unlink("x");
    2cbd:	c7 04 24 fd 5a 00 00 	movl   $0x5afd,(%esp)
    2cc4:	e8 29 20 00 00       	call   4cf2 <unlink>
  pid = fork();
    2cc9:	e8 cc 1f 00 00       	call   4c9a <fork>
  if(pid < 0){
    2cce:	85 c0                	test   %eax,%eax
  pid = fork();
    2cd0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    2cd3:	0f 88 b8 00 00 00    	js     2d91 <linkunlink+0xf1>
  unsigned int x = (pid ? 1 : 97);
    2cd9:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    2cdd:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    2ce2:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    2ce7:	19 ff                	sbb    %edi,%edi
    2ce9:	83 e7 60             	and    $0x60,%edi
    2cec:	83 c7 01             	add    $0x1,%edi
    2cef:	eb 1d                	jmp    2d0e <linkunlink+0x6e>
    2cf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    2cf8:	83 fa 01             	cmp    $0x1,%edx
    2cfb:	74 7b                	je     2d78 <linkunlink+0xd8>
      unlink("x");
    2cfd:	c7 04 24 fd 5a 00 00 	movl   $0x5afd,(%esp)
    2d04:	e8 e9 1f 00 00       	call   4cf2 <unlink>
  for(i = 0; i < 100; i++){
    2d09:	83 eb 01             	sub    $0x1,%ebx
    2d0c:	74 3c                	je     2d4a <linkunlink+0xaa>
    x = x * 1103515245 + 12345;
    2d0e:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    2d14:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    2d1a:	89 f8                	mov    %edi,%eax
    2d1c:	f7 e6                	mul    %esi
    2d1e:	d1 ea                	shr    %edx
    2d20:	8d 04 52             	lea    (%edx,%edx,2),%eax
    2d23:	89 fa                	mov    %edi,%edx
    2d25:	29 c2                	sub    %eax,%edx
    2d27:	75 cf                	jne    2cf8 <linkunlink+0x58>
      close(open("x", O_RDWR | O_CREATE));
    2d29:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2d30:	00 
    2d31:	c7 04 24 fd 5a 00 00 	movl   $0x5afd,(%esp)
    2d38:	e8 a5 1f 00 00       	call   4ce2 <open>
    2d3d:	89 04 24             	mov    %eax,(%esp)
    2d40:	e8 85 1f 00 00       	call   4cca <close>
  for(i = 0; i < 100; i++){
    2d45:	83 eb 01             	sub    $0x1,%ebx
    2d48:	75 c4                	jne    2d0e <linkunlink+0x6e>
  if(pid)
    2d4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d4d:	85 c0                	test   %eax,%eax
    2d4f:	74 59                	je     2daa <linkunlink+0x10a>
    wait();
    2d51:	e8 54 1f 00 00       	call   4caa <wait>
  printf(1, "linkunlink ok\n");
    2d56:	c7 44 24 04 85 58 00 	movl   $0x5885,0x4(%esp)
    2d5d:	00 
    2d5e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d65:	e8 96 20 00 00       	call   4e00 <printf>
}
    2d6a:	83 c4 1c             	add    $0x1c,%esp
    2d6d:	5b                   	pop    %ebx
    2d6e:	5e                   	pop    %esi
    2d6f:	5f                   	pop    %edi
    2d70:	5d                   	pop    %ebp
    2d71:	c3                   	ret    
    2d72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      link("cat", "x");
    2d78:	c7 44 24 04 fd 5a 00 	movl   $0x5afd,0x4(%esp)
    2d7f:	00 
    2d80:	c7 04 24 81 58 00 00 	movl   $0x5881,(%esp)
    2d87:	e8 76 1f 00 00       	call   4d02 <link>
    2d8c:	e9 78 ff ff ff       	jmp    2d09 <linkunlink+0x69>
    printf(1, "fork failed\n");
    2d91:	c7 44 24 04 e5 60 00 	movl   $0x60e5,0x4(%esp)
    2d98:	00 
    2d99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2da0:	e8 5b 20 00 00       	call   4e00 <printf>
    exit();
    2da5:	e8 f8 1e 00 00       	call   4ca2 <exit>
    exit();
    2daa:	e8 f3 1e 00 00       	call   4ca2 <exit>
    2daf:	90                   	nop

00002db0 <bigdir>:
{
    2db0:	55                   	push   %ebp
    2db1:	89 e5                	mov    %esp,%ebp
    2db3:	56                   	push   %esi
    2db4:	53                   	push   %ebx
    2db5:	83 ec 20             	sub    $0x20,%esp
  printf(1, "bigdir test\n");
    2db8:	c7 44 24 04 94 58 00 	movl   $0x5894,0x4(%esp)
    2dbf:	00 
    2dc0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dc7:	e8 34 20 00 00       	call   4e00 <printf>
  unlink("bd");
    2dcc:	c7 04 24 a1 58 00 00 	movl   $0x58a1,(%esp)
    2dd3:	e8 1a 1f 00 00       	call   4cf2 <unlink>
  fd = open("bd", O_CREATE);
    2dd8:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2ddf:	00 
    2de0:	c7 04 24 a1 58 00 00 	movl   $0x58a1,(%esp)
    2de7:	e8 f6 1e 00 00       	call   4ce2 <open>
  if(fd < 0){
    2dec:	85 c0                	test   %eax,%eax
    2dee:	0f 88 e6 00 00 00    	js     2eda <bigdir+0x12a>
  close(fd);
    2df4:	89 04 24             	mov    %eax,(%esp)
  for(i = 0; i < 500; i++){
    2df7:	31 db                	xor    %ebx,%ebx
  close(fd);
    2df9:	e8 cc 1e 00 00       	call   4cca <close>
    2dfe:	8d 75 ee             	lea    -0x12(%ebp),%esi
    2e01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    name[1] = '0' + (i / 64);
    2e08:	89 d8                	mov    %ebx,%eax
    2e0a:	c1 f8 06             	sar    $0x6,%eax
    2e0d:	83 c0 30             	add    $0x30,%eax
    2e10:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    2e13:	89 d8                	mov    %ebx,%eax
    2e15:	83 e0 3f             	and    $0x3f,%eax
    2e18:	83 c0 30             	add    $0x30,%eax
    if(link("bd", name) != 0){
    2e1b:	89 74 24 04          	mov    %esi,0x4(%esp)
    2e1f:	c7 04 24 a1 58 00 00 	movl   $0x58a1,(%esp)
    name[0] = 'x';
    2e26:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[2] = '0' + (i % 64);
    2e2a:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    2e2d:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(link("bd", name) != 0){
    2e31:	e8 cc 1e 00 00       	call   4d02 <link>
    2e36:	85 c0                	test   %eax,%eax
    2e38:	75 6e                	jne    2ea8 <bigdir+0xf8>
  for(i = 0; i < 500; i++){
    2e3a:	83 c3 01             	add    $0x1,%ebx
    2e3d:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    2e43:	75 c3                	jne    2e08 <bigdir+0x58>
  unlink("bd");
    2e45:	c7 04 24 a1 58 00 00 	movl   $0x58a1,(%esp)
  for(i = 0; i < 500; i++){
    2e4c:	66 31 db             	xor    %bx,%bx
  unlink("bd");
    2e4f:	e8 9e 1e 00 00       	call   4cf2 <unlink>
    2e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    name[1] = '0' + (i / 64);
    2e58:	89 d8                	mov    %ebx,%eax
    2e5a:	c1 f8 06             	sar    $0x6,%eax
    2e5d:	83 c0 30             	add    $0x30,%eax
    2e60:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    2e63:	89 d8                	mov    %ebx,%eax
    2e65:	83 e0 3f             	and    $0x3f,%eax
    2e68:	83 c0 30             	add    $0x30,%eax
    if(unlink(name) != 0){
    2e6b:	89 34 24             	mov    %esi,(%esp)
    name[0] = 'x';
    2e6e:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[2] = '0' + (i % 64);
    2e72:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    2e75:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(unlink(name) != 0){
    2e79:	e8 74 1e 00 00       	call   4cf2 <unlink>
    2e7e:	85 c0                	test   %eax,%eax
    2e80:	75 3f                	jne    2ec1 <bigdir+0x111>
  for(i = 0; i < 500; i++){
    2e82:	83 c3 01             	add    $0x1,%ebx
    2e85:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    2e8b:	75 cb                	jne    2e58 <bigdir+0xa8>
  printf(1, "bigdir ok\n");
    2e8d:	c7 44 24 04 e3 58 00 	movl   $0x58e3,0x4(%esp)
    2e94:	00 
    2e95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e9c:	e8 5f 1f 00 00       	call   4e00 <printf>
}
    2ea1:	83 c4 20             	add    $0x20,%esp
    2ea4:	5b                   	pop    %ebx
    2ea5:	5e                   	pop    %esi
    2ea6:	5d                   	pop    %ebp
    2ea7:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    2ea8:	c7 44 24 04 ba 58 00 	movl   $0x58ba,0x4(%esp)
    2eaf:	00 
    2eb0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2eb7:	e8 44 1f 00 00       	call   4e00 <printf>
      exit();
    2ebc:	e8 e1 1d 00 00       	call   4ca2 <exit>
      printf(1, "bigdir unlink failed");
    2ec1:	c7 44 24 04 ce 58 00 	movl   $0x58ce,0x4(%esp)
    2ec8:	00 
    2ec9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ed0:	e8 2b 1f 00 00       	call   4e00 <printf>
      exit();
    2ed5:	e8 c8 1d 00 00       	call   4ca2 <exit>
    printf(1, "bigdir create failed\n");
    2eda:	c7 44 24 04 a4 58 00 	movl   $0x58a4,0x4(%esp)
    2ee1:	00 
    2ee2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ee9:	e8 12 1f 00 00       	call   4e00 <printf>
    exit();
    2eee:	e8 af 1d 00 00       	call   4ca2 <exit>
    2ef3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2ef9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002f00 <subdir>:
{
    2f00:	55                   	push   %ebp
    2f01:	89 e5                	mov    %esp,%ebp
    2f03:	53                   	push   %ebx
    2f04:	83 ec 14             	sub    $0x14,%esp
  printf(1, "subdir test\n");
    2f07:	c7 44 24 04 ee 58 00 	movl   $0x58ee,0x4(%esp)
    2f0e:	00 
    2f0f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f16:	e8 e5 1e 00 00       	call   4e00 <printf>
  unlink("ff");
    2f1b:	c7 04 24 77 59 00 00 	movl   $0x5977,(%esp)
    2f22:	e8 cb 1d 00 00       	call   4cf2 <unlink>
  if(mkdir("dd") != 0){
    2f27:	c7 04 24 14 5a 00 00 	movl   $0x5a14,(%esp)
    2f2e:	e8 d7 1d 00 00       	call   4d0a <mkdir>
    2f33:	85 c0                	test   %eax,%eax
    2f35:	0f 85 07 06 00 00    	jne    3542 <subdir+0x642>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    2f3b:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2f42:	00 
    2f43:	c7 04 24 4d 59 00 00 	movl   $0x594d,(%esp)
    2f4a:	e8 93 1d 00 00       	call   4ce2 <open>
  if(fd < 0){
    2f4f:	85 c0                	test   %eax,%eax
  fd = open("dd/ff", O_CREATE | O_RDWR);
    2f51:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2f53:	0f 88 d0 05 00 00    	js     3529 <subdir+0x629>
  write(fd, "ff", 2);
    2f59:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    2f60:	00 
    2f61:	c7 44 24 04 77 59 00 	movl   $0x5977,0x4(%esp)
    2f68:	00 
    2f69:	89 04 24             	mov    %eax,(%esp)
    2f6c:	e8 51 1d 00 00       	call   4cc2 <write>
  close(fd);
    2f71:	89 1c 24             	mov    %ebx,(%esp)
    2f74:	e8 51 1d 00 00       	call   4cca <close>
  if(unlink("dd") >= 0){
    2f79:	c7 04 24 14 5a 00 00 	movl   $0x5a14,(%esp)
    2f80:	e8 6d 1d 00 00       	call   4cf2 <unlink>
    2f85:	85 c0                	test   %eax,%eax
    2f87:	0f 89 83 05 00 00    	jns    3510 <subdir+0x610>
  if(mkdir("/dd/dd") != 0){
    2f8d:	c7 04 24 28 59 00 00 	movl   $0x5928,(%esp)
    2f94:	e8 71 1d 00 00       	call   4d0a <mkdir>
    2f99:	85 c0                	test   %eax,%eax
    2f9b:	0f 85 56 05 00 00    	jne    34f7 <subdir+0x5f7>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2fa1:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2fa8:	00 
    2fa9:	c7 04 24 4a 59 00 00 	movl   $0x594a,(%esp)
    2fb0:	e8 2d 1d 00 00       	call   4ce2 <open>
  if(fd < 0){
    2fb5:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2fb7:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2fb9:	0f 88 25 04 00 00    	js     33e4 <subdir+0x4e4>
  write(fd, "FF", 2);
    2fbf:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    2fc6:	00 
    2fc7:	c7 44 24 04 6b 59 00 	movl   $0x596b,0x4(%esp)
    2fce:	00 
    2fcf:	89 04 24             	mov    %eax,(%esp)
    2fd2:	e8 eb 1c 00 00       	call   4cc2 <write>
  close(fd);
    2fd7:	89 1c 24             	mov    %ebx,(%esp)
    2fda:	e8 eb 1c 00 00       	call   4cca <close>
  fd = open("dd/dd/../ff", 0);
    2fdf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2fe6:	00 
    2fe7:	c7 04 24 6e 59 00 00 	movl   $0x596e,(%esp)
    2fee:	e8 ef 1c 00 00       	call   4ce2 <open>
  if(fd < 0){
    2ff3:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/../ff", 0);
    2ff5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2ff7:	0f 88 ce 03 00 00    	js     33cb <subdir+0x4cb>
  cc = read(fd, buf, sizeof(buf));
    2ffd:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    3004:	00 
    3005:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    300c:	00 
    300d:	89 04 24             	mov    %eax,(%esp)
    3010:	e8 a5 1c 00 00       	call   4cba <read>
  if(cc != 2 || buf[0] != 'f'){
    3015:	83 f8 02             	cmp    $0x2,%eax
    3018:	0f 85 fe 02 00 00    	jne    331c <subdir+0x41c>
    301e:	80 3d 40 9a 00 00 66 	cmpb   $0x66,0x9a40
    3025:	0f 85 f1 02 00 00    	jne    331c <subdir+0x41c>
  close(fd);
    302b:	89 1c 24             	mov    %ebx,(%esp)
    302e:	e8 97 1c 00 00       	call   4cca <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    3033:	c7 44 24 04 ae 59 00 	movl   $0x59ae,0x4(%esp)
    303a:	00 
    303b:	c7 04 24 4a 59 00 00 	movl   $0x594a,(%esp)
    3042:	e8 bb 1c 00 00       	call   4d02 <link>
    3047:	85 c0                	test   %eax,%eax
    3049:	0f 85 c7 03 00 00    	jne    3416 <subdir+0x516>
  if(unlink("dd/dd/ff") != 0){
    304f:	c7 04 24 4a 59 00 00 	movl   $0x594a,(%esp)
    3056:	e8 97 1c 00 00       	call   4cf2 <unlink>
    305b:	85 c0                	test   %eax,%eax
    305d:	0f 85 eb 02 00 00    	jne    334e <subdir+0x44e>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    3063:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    306a:	00 
    306b:	c7 04 24 4a 59 00 00 	movl   $0x594a,(%esp)
    3072:	e8 6b 1c 00 00       	call   4ce2 <open>
    3077:	85 c0                	test   %eax,%eax
    3079:	0f 89 5f 04 00 00    	jns    34de <subdir+0x5de>
  if(chdir("dd") != 0){
    307f:	c7 04 24 14 5a 00 00 	movl   $0x5a14,(%esp)
    3086:	e8 87 1c 00 00       	call   4d12 <chdir>
    308b:	85 c0                	test   %eax,%eax
    308d:	0f 85 32 04 00 00    	jne    34c5 <subdir+0x5c5>
  if(chdir("dd/../../dd") != 0){
    3093:	c7 04 24 e2 59 00 00 	movl   $0x59e2,(%esp)
    309a:	e8 73 1c 00 00       	call   4d12 <chdir>
    309f:	85 c0                	test   %eax,%eax
    30a1:	0f 85 8e 02 00 00    	jne    3335 <subdir+0x435>
  if(chdir("dd/../../../dd") != 0){
    30a7:	c7 04 24 08 5a 00 00 	movl   $0x5a08,(%esp)
    30ae:	e8 5f 1c 00 00       	call   4d12 <chdir>
    30b3:	85 c0                	test   %eax,%eax
    30b5:	0f 85 7a 02 00 00    	jne    3335 <subdir+0x435>
  if(chdir("./..") != 0){
    30bb:	c7 04 24 17 5a 00 00 	movl   $0x5a17,(%esp)
    30c2:	e8 4b 1c 00 00       	call   4d12 <chdir>
    30c7:	85 c0                	test   %eax,%eax
    30c9:	0f 85 2e 03 00 00    	jne    33fd <subdir+0x4fd>
  fd = open("dd/dd/ffff", 0);
    30cf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    30d6:	00 
    30d7:	c7 04 24 ae 59 00 00 	movl   $0x59ae,(%esp)
    30de:	e8 ff 1b 00 00       	call   4ce2 <open>
  if(fd < 0){
    30e3:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ffff", 0);
    30e5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    30e7:	0f 88 81 05 00 00    	js     366e <subdir+0x76e>
  if(read(fd, buf, sizeof(buf)) != 2){
    30ed:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    30f4:	00 
    30f5:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    30fc:	00 
    30fd:	89 04 24             	mov    %eax,(%esp)
    3100:	e8 b5 1b 00 00       	call   4cba <read>
    3105:	83 f8 02             	cmp    $0x2,%eax
    3108:	0f 85 47 05 00 00    	jne    3655 <subdir+0x755>
  close(fd);
    310e:	89 1c 24             	mov    %ebx,(%esp)
    3111:	e8 b4 1b 00 00       	call   4cca <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    3116:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    311d:	00 
    311e:	c7 04 24 4a 59 00 00 	movl   $0x594a,(%esp)
    3125:	e8 b8 1b 00 00       	call   4ce2 <open>
    312a:	85 c0                	test   %eax,%eax
    312c:	0f 89 4e 02 00 00    	jns    3380 <subdir+0x480>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    3132:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    3139:	00 
    313a:	c7 04 24 62 5a 00 00 	movl   $0x5a62,(%esp)
    3141:	e8 9c 1b 00 00       	call   4ce2 <open>
    3146:	85 c0                	test   %eax,%eax
    3148:	0f 89 19 02 00 00    	jns    3367 <subdir+0x467>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    314e:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    3155:	00 
    3156:	c7 04 24 87 5a 00 00 	movl   $0x5a87,(%esp)
    315d:	e8 80 1b 00 00       	call   4ce2 <open>
    3162:	85 c0                	test   %eax,%eax
    3164:	0f 89 42 03 00 00    	jns    34ac <subdir+0x5ac>
  if(open("dd", O_CREATE) >= 0){
    316a:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3171:	00 
    3172:	c7 04 24 14 5a 00 00 	movl   $0x5a14,(%esp)
    3179:	e8 64 1b 00 00       	call   4ce2 <open>
    317e:	85 c0                	test   %eax,%eax
    3180:	0f 89 0d 03 00 00    	jns    3493 <subdir+0x593>
  if(open("dd", O_RDWR) >= 0){
    3186:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    318d:	00 
    318e:	c7 04 24 14 5a 00 00 	movl   $0x5a14,(%esp)
    3195:	e8 48 1b 00 00       	call   4ce2 <open>
    319a:	85 c0                	test   %eax,%eax
    319c:	0f 89 d8 02 00 00    	jns    347a <subdir+0x57a>
  if(open("dd", O_WRONLY) >= 0){
    31a2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    31a9:	00 
    31aa:	c7 04 24 14 5a 00 00 	movl   $0x5a14,(%esp)
    31b1:	e8 2c 1b 00 00       	call   4ce2 <open>
    31b6:	85 c0                	test   %eax,%eax
    31b8:	0f 89 a3 02 00 00    	jns    3461 <subdir+0x561>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    31be:	c7 44 24 04 f6 5a 00 	movl   $0x5af6,0x4(%esp)
    31c5:	00 
    31c6:	c7 04 24 62 5a 00 00 	movl   $0x5a62,(%esp)
    31cd:	e8 30 1b 00 00       	call   4d02 <link>
    31d2:	85 c0                	test   %eax,%eax
    31d4:	0f 84 6e 02 00 00    	je     3448 <subdir+0x548>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    31da:	c7 44 24 04 f6 5a 00 	movl   $0x5af6,0x4(%esp)
    31e1:	00 
    31e2:	c7 04 24 87 5a 00 00 	movl   $0x5a87,(%esp)
    31e9:	e8 14 1b 00 00       	call   4d02 <link>
    31ee:	85 c0                	test   %eax,%eax
    31f0:	0f 84 39 02 00 00    	je     342f <subdir+0x52f>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    31f6:	c7 44 24 04 ae 59 00 	movl   $0x59ae,0x4(%esp)
    31fd:	00 
    31fe:	c7 04 24 4d 59 00 00 	movl   $0x594d,(%esp)
    3205:	e8 f8 1a 00 00       	call   4d02 <link>
    320a:	85 c0                	test   %eax,%eax
    320c:	0f 84 a0 01 00 00    	je     33b2 <subdir+0x4b2>
  if(mkdir("dd/ff/ff") == 0){
    3212:	c7 04 24 62 5a 00 00 	movl   $0x5a62,(%esp)
    3219:	e8 ec 1a 00 00       	call   4d0a <mkdir>
    321e:	85 c0                	test   %eax,%eax
    3220:	0f 84 73 01 00 00    	je     3399 <subdir+0x499>
  if(mkdir("dd/xx/ff") == 0){
    3226:	c7 04 24 87 5a 00 00 	movl   $0x5a87,(%esp)
    322d:	e8 d8 1a 00 00       	call   4d0a <mkdir>
    3232:	85 c0                	test   %eax,%eax
    3234:	0f 84 02 04 00 00    	je     363c <subdir+0x73c>
  if(mkdir("dd/dd/ffff") == 0){
    323a:	c7 04 24 ae 59 00 00 	movl   $0x59ae,(%esp)
    3241:	e8 c4 1a 00 00       	call   4d0a <mkdir>
    3246:	85 c0                	test   %eax,%eax
    3248:	0f 84 d5 03 00 00    	je     3623 <subdir+0x723>
  if(unlink("dd/xx/ff") == 0){
    324e:	c7 04 24 87 5a 00 00 	movl   $0x5a87,(%esp)
    3255:	e8 98 1a 00 00       	call   4cf2 <unlink>
    325a:	85 c0                	test   %eax,%eax
    325c:	0f 84 a8 03 00 00    	je     360a <subdir+0x70a>
  if(unlink("dd/ff/ff") == 0){
    3262:	c7 04 24 62 5a 00 00 	movl   $0x5a62,(%esp)
    3269:	e8 84 1a 00 00       	call   4cf2 <unlink>
    326e:	85 c0                	test   %eax,%eax
    3270:	0f 84 7b 03 00 00    	je     35f1 <subdir+0x6f1>
  if(chdir("dd/ff") == 0){
    3276:	c7 04 24 4d 59 00 00 	movl   $0x594d,(%esp)
    327d:	e8 90 1a 00 00       	call   4d12 <chdir>
    3282:	85 c0                	test   %eax,%eax
    3284:	0f 84 4e 03 00 00    	je     35d8 <subdir+0x6d8>
  if(chdir("dd/xx") == 0){
    328a:	c7 04 24 f9 5a 00 00 	movl   $0x5af9,(%esp)
    3291:	e8 7c 1a 00 00       	call   4d12 <chdir>
    3296:	85 c0                	test   %eax,%eax
    3298:	0f 84 21 03 00 00    	je     35bf <subdir+0x6bf>
  if(unlink("dd/dd/ffff") != 0){
    329e:	c7 04 24 ae 59 00 00 	movl   $0x59ae,(%esp)
    32a5:	e8 48 1a 00 00       	call   4cf2 <unlink>
    32aa:	85 c0                	test   %eax,%eax
    32ac:	0f 85 9c 00 00 00    	jne    334e <subdir+0x44e>
  if(unlink("dd/ff") != 0){
    32b2:	c7 04 24 4d 59 00 00 	movl   $0x594d,(%esp)
    32b9:	e8 34 1a 00 00       	call   4cf2 <unlink>
    32be:	85 c0                	test   %eax,%eax
    32c0:	0f 85 e0 02 00 00    	jne    35a6 <subdir+0x6a6>
  if(unlink("dd") == 0){
    32c6:	c7 04 24 14 5a 00 00 	movl   $0x5a14,(%esp)
    32cd:	e8 20 1a 00 00       	call   4cf2 <unlink>
    32d2:	85 c0                	test   %eax,%eax
    32d4:	0f 84 b3 02 00 00    	je     358d <subdir+0x68d>
  if(unlink("dd/dd") < 0){
    32da:	c7 04 24 29 59 00 00 	movl   $0x5929,(%esp)
    32e1:	e8 0c 1a 00 00       	call   4cf2 <unlink>
    32e6:	85 c0                	test   %eax,%eax
    32e8:	0f 88 86 02 00 00    	js     3574 <subdir+0x674>
  if(unlink("dd") < 0){
    32ee:	c7 04 24 14 5a 00 00 	movl   $0x5a14,(%esp)
    32f5:	e8 f8 19 00 00       	call   4cf2 <unlink>
    32fa:	85 c0                	test   %eax,%eax
    32fc:	0f 88 59 02 00 00    	js     355b <subdir+0x65b>
  printf(1, "subdir ok\n");
    3302:	c7 44 24 04 f6 5b 00 	movl   $0x5bf6,0x4(%esp)
    3309:	00 
    330a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3311:	e8 ea 1a 00 00       	call   4e00 <printf>
}
    3316:	83 c4 14             	add    $0x14,%esp
    3319:	5b                   	pop    %ebx
    331a:	5d                   	pop    %ebp
    331b:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    331c:	c7 44 24 04 93 59 00 	movl   $0x5993,0x4(%esp)
    3323:	00 
    3324:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    332b:	e8 d0 1a 00 00       	call   4e00 <printf>
    exit();
    3330:	e8 6d 19 00 00       	call   4ca2 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    3335:	c7 44 24 04 ee 59 00 	movl   $0x59ee,0x4(%esp)
    333c:	00 
    333d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3344:	e8 b7 1a 00 00       	call   4e00 <printf>
    exit();
    3349:	e8 54 19 00 00       	call   4ca2 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    334e:	c7 44 24 04 b9 59 00 	movl   $0x59b9,0x4(%esp)
    3355:	00 
    3356:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    335d:	e8 9e 1a 00 00       	call   4e00 <printf>
    exit();
    3362:	e8 3b 19 00 00       	call   4ca2 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    3367:	c7 44 24 04 6b 5a 00 	movl   $0x5a6b,0x4(%esp)
    336e:	00 
    336f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3376:	e8 85 1a 00 00       	call   4e00 <printf>
    exit();
    337b:	e8 22 19 00 00       	call   4ca2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    3380:	c7 44 24 04 50 64 00 	movl   $0x6450,0x4(%esp)
    3387:	00 
    3388:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    338f:	e8 6c 1a 00 00       	call   4e00 <printf>
    exit();
    3394:	e8 09 19 00 00       	call   4ca2 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    3399:	c7 44 24 04 ff 5a 00 	movl   $0x5aff,0x4(%esp)
    33a0:	00 
    33a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33a8:	e8 53 1a 00 00       	call   4e00 <printf>
    exit();
    33ad:	e8 f0 18 00 00       	call   4ca2 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    33b2:	c7 44 24 04 c0 64 00 	movl   $0x64c0,0x4(%esp)
    33b9:	00 
    33ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33c1:	e8 3a 1a 00 00       	call   4e00 <printf>
    exit();
    33c6:	e8 d7 18 00 00       	call   4ca2 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    33cb:	c7 44 24 04 7a 59 00 	movl   $0x597a,0x4(%esp)
    33d2:	00 
    33d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33da:	e8 21 1a 00 00       	call   4e00 <printf>
    exit();
    33df:	e8 be 18 00 00       	call   4ca2 <exit>
    printf(1, "create dd/dd/ff failed\n");
    33e4:	c7 44 24 04 53 59 00 	movl   $0x5953,0x4(%esp)
    33eb:	00 
    33ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33f3:	e8 08 1a 00 00       	call   4e00 <printf>
    exit();
    33f8:	e8 a5 18 00 00       	call   4ca2 <exit>
    printf(1, "chdir ./.. failed\n");
    33fd:	c7 44 24 04 1c 5a 00 	movl   $0x5a1c,0x4(%esp)
    3404:	00 
    3405:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    340c:	e8 ef 19 00 00       	call   4e00 <printf>
    exit();
    3411:	e8 8c 18 00 00       	call   4ca2 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    3416:	c7 44 24 04 08 64 00 	movl   $0x6408,0x4(%esp)
    341d:	00 
    341e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3425:	e8 d6 19 00 00       	call   4e00 <printf>
    exit();
    342a:	e8 73 18 00 00       	call   4ca2 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    342f:	c7 44 24 04 9c 64 00 	movl   $0x649c,0x4(%esp)
    3436:	00 
    3437:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    343e:	e8 bd 19 00 00       	call   4e00 <printf>
    exit();
    3443:	e8 5a 18 00 00       	call   4ca2 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    3448:	c7 44 24 04 78 64 00 	movl   $0x6478,0x4(%esp)
    344f:	00 
    3450:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3457:	e8 a4 19 00 00       	call   4e00 <printf>
    exit();
    345c:	e8 41 18 00 00       	call   4ca2 <exit>
    printf(1, "open dd wronly succeeded!\n");
    3461:	c7 44 24 04 db 5a 00 	movl   $0x5adb,0x4(%esp)
    3468:	00 
    3469:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3470:	e8 8b 19 00 00       	call   4e00 <printf>
    exit();
    3475:	e8 28 18 00 00       	call   4ca2 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    347a:	c7 44 24 04 c2 5a 00 	movl   $0x5ac2,0x4(%esp)
    3481:	00 
    3482:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3489:	e8 72 19 00 00       	call   4e00 <printf>
    exit();
    348e:	e8 0f 18 00 00       	call   4ca2 <exit>
    printf(1, "create dd succeeded!\n");
    3493:	c7 44 24 04 ac 5a 00 	movl   $0x5aac,0x4(%esp)
    349a:	00 
    349b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34a2:	e8 59 19 00 00       	call   4e00 <printf>
    exit();
    34a7:	e8 f6 17 00 00       	call   4ca2 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    34ac:	c7 44 24 04 90 5a 00 	movl   $0x5a90,0x4(%esp)
    34b3:	00 
    34b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34bb:	e8 40 19 00 00       	call   4e00 <printf>
    exit();
    34c0:	e8 dd 17 00 00       	call   4ca2 <exit>
    printf(1, "chdir dd failed\n");
    34c5:	c7 44 24 04 d1 59 00 	movl   $0x59d1,0x4(%esp)
    34cc:	00 
    34cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34d4:	e8 27 19 00 00       	call   4e00 <printf>
    exit();
    34d9:	e8 c4 17 00 00       	call   4ca2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    34de:	c7 44 24 04 2c 64 00 	movl   $0x642c,0x4(%esp)
    34e5:	00 
    34e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34ed:	e8 0e 19 00 00       	call   4e00 <printf>
    exit();
    34f2:	e8 ab 17 00 00       	call   4ca2 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    34f7:	c7 44 24 04 2f 59 00 	movl   $0x592f,0x4(%esp)
    34fe:	00 
    34ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3506:	e8 f5 18 00 00       	call   4e00 <printf>
    exit();
    350b:	e8 92 17 00 00       	call   4ca2 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    3510:	c7 44 24 04 e0 63 00 	movl   $0x63e0,0x4(%esp)
    3517:	00 
    3518:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    351f:	e8 dc 18 00 00       	call   4e00 <printf>
    exit();
    3524:	e8 79 17 00 00       	call   4ca2 <exit>
    printf(1, "create dd/ff failed\n");
    3529:	c7 44 24 04 13 59 00 	movl   $0x5913,0x4(%esp)
    3530:	00 
    3531:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3538:	e8 c3 18 00 00       	call   4e00 <printf>
    exit();
    353d:	e8 60 17 00 00       	call   4ca2 <exit>
    printf(1, "subdir mkdir dd failed\n");
    3542:	c7 44 24 04 fb 58 00 	movl   $0x58fb,0x4(%esp)
    3549:	00 
    354a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3551:	e8 aa 18 00 00       	call   4e00 <printf>
    exit();
    3556:	e8 47 17 00 00       	call   4ca2 <exit>
    printf(1, "unlink dd failed\n");
    355b:	c7 44 24 04 e4 5b 00 	movl   $0x5be4,0x4(%esp)
    3562:	00 
    3563:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    356a:	e8 91 18 00 00       	call   4e00 <printf>
    exit();
    356f:	e8 2e 17 00 00       	call   4ca2 <exit>
    printf(1, "unlink dd/dd failed\n");
    3574:	c7 44 24 04 cf 5b 00 	movl   $0x5bcf,0x4(%esp)
    357b:	00 
    357c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3583:	e8 78 18 00 00       	call   4e00 <printf>
    exit();
    3588:	e8 15 17 00 00       	call   4ca2 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    358d:	c7 44 24 04 e4 64 00 	movl   $0x64e4,0x4(%esp)
    3594:	00 
    3595:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    359c:	e8 5f 18 00 00       	call   4e00 <printf>
    exit();
    35a1:	e8 fc 16 00 00       	call   4ca2 <exit>
    printf(1, "unlink dd/ff failed\n");
    35a6:	c7 44 24 04 ba 5b 00 	movl   $0x5bba,0x4(%esp)
    35ad:	00 
    35ae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    35b5:	e8 46 18 00 00       	call   4e00 <printf>
    exit();
    35ba:	e8 e3 16 00 00       	call   4ca2 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    35bf:	c7 44 24 04 a2 5b 00 	movl   $0x5ba2,0x4(%esp)
    35c6:	00 
    35c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    35ce:	e8 2d 18 00 00       	call   4e00 <printf>
    exit();
    35d3:	e8 ca 16 00 00       	call   4ca2 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    35d8:	c7 44 24 04 8a 5b 00 	movl   $0x5b8a,0x4(%esp)
    35df:	00 
    35e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    35e7:	e8 14 18 00 00       	call   4e00 <printf>
    exit();
    35ec:	e8 b1 16 00 00       	call   4ca2 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    35f1:	c7 44 24 04 6e 5b 00 	movl   $0x5b6e,0x4(%esp)
    35f8:	00 
    35f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3600:	e8 fb 17 00 00       	call   4e00 <printf>
    exit();
    3605:	e8 98 16 00 00       	call   4ca2 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    360a:	c7 44 24 04 52 5b 00 	movl   $0x5b52,0x4(%esp)
    3611:	00 
    3612:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3619:	e8 e2 17 00 00       	call   4e00 <printf>
    exit();
    361e:	e8 7f 16 00 00       	call   4ca2 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    3623:	c7 44 24 04 35 5b 00 	movl   $0x5b35,0x4(%esp)
    362a:	00 
    362b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3632:	e8 c9 17 00 00       	call   4e00 <printf>
    exit();
    3637:	e8 66 16 00 00       	call   4ca2 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    363c:	c7 44 24 04 1a 5b 00 	movl   $0x5b1a,0x4(%esp)
    3643:	00 
    3644:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    364b:	e8 b0 17 00 00       	call   4e00 <printf>
    exit();
    3650:	e8 4d 16 00 00       	call   4ca2 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    3655:	c7 44 24 04 47 5a 00 	movl   $0x5a47,0x4(%esp)
    365c:	00 
    365d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3664:	e8 97 17 00 00       	call   4e00 <printf>
    exit();
    3669:	e8 34 16 00 00       	call   4ca2 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    366e:	c7 44 24 04 2f 5a 00 	movl   $0x5a2f,0x4(%esp)
    3675:	00 
    3676:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    367d:	e8 7e 17 00 00       	call   4e00 <printf>
    exit();
    3682:	e8 1b 16 00 00       	call   4ca2 <exit>
    3687:	89 f6                	mov    %esi,%esi
    3689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003690 <bigwrite>:
{
    3690:	55                   	push   %ebp
    3691:	89 e5                	mov    %esp,%ebp
    3693:	56                   	push   %esi
    3694:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    3695:	bb f3 01 00 00       	mov    $0x1f3,%ebx
{
    369a:	83 ec 10             	sub    $0x10,%esp
  printf(1, "bigwrite test\n");
    369d:	c7 44 24 04 01 5c 00 	movl   $0x5c01,0x4(%esp)
    36a4:	00 
    36a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36ac:	e8 4f 17 00 00       	call   4e00 <printf>
  unlink("bigwrite");
    36b1:	c7 04 24 10 5c 00 00 	movl   $0x5c10,(%esp)
    36b8:	e8 35 16 00 00       	call   4cf2 <unlink>
    36bd:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
    36c0:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    36c7:	00 
    36c8:	c7 04 24 10 5c 00 00 	movl   $0x5c10,(%esp)
    36cf:	e8 0e 16 00 00       	call   4ce2 <open>
    if(fd < 0){
    36d4:	85 c0                	test   %eax,%eax
    fd = open("bigwrite", O_CREATE | O_RDWR);
    36d6:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    36d8:	0f 88 8e 00 00 00    	js     376c <bigwrite+0xdc>
      int cc = write(fd, buf, sz);
    36de:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    36e2:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    36e9:	00 
    36ea:	89 04 24             	mov    %eax,(%esp)
    36ed:	e8 d0 15 00 00       	call   4cc2 <write>
      if(cc != sz){
    36f2:	39 d8                	cmp    %ebx,%eax
    36f4:	75 55                	jne    374b <bigwrite+0xbb>
      int cc = write(fd, buf, sz);
    36f6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    36fa:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    3701:	00 
    3702:	89 34 24             	mov    %esi,(%esp)
    3705:	e8 b8 15 00 00       	call   4cc2 <write>
      if(cc != sz){
    370a:	39 c3                	cmp    %eax,%ebx
    370c:	75 3d                	jne    374b <bigwrite+0xbb>
    close(fd);
    370e:	89 34 24             	mov    %esi,(%esp)
  for(sz = 499; sz < 12*512; sz += 471){
    3711:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    3717:	e8 ae 15 00 00       	call   4cca <close>
    unlink("bigwrite");
    371c:	c7 04 24 10 5c 00 00 	movl   $0x5c10,(%esp)
    3723:	e8 ca 15 00 00       	call   4cf2 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    3728:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    372e:	75 90                	jne    36c0 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    3730:	c7 44 24 04 43 5c 00 	movl   $0x5c43,0x4(%esp)
    3737:	00 
    3738:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    373f:	e8 bc 16 00 00       	call   4e00 <printf>
}
    3744:	83 c4 10             	add    $0x10,%esp
    3747:	5b                   	pop    %ebx
    3748:	5e                   	pop    %esi
    3749:	5d                   	pop    %ebp
    374a:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    374b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    374f:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    3753:	c7 44 24 04 31 5c 00 	movl   $0x5c31,0x4(%esp)
    375a:	00 
    375b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3762:	e8 99 16 00 00       	call   4e00 <printf>
        exit();
    3767:	e8 36 15 00 00       	call   4ca2 <exit>
      printf(1, "cannot create bigwrite\n");
    376c:	c7 44 24 04 19 5c 00 	movl   $0x5c19,0x4(%esp)
    3773:	00 
    3774:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    377b:	e8 80 16 00 00       	call   4e00 <printf>
      exit();
    3780:	e8 1d 15 00 00       	call   4ca2 <exit>
    3785:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003790 <bigfile>:
{
    3790:	55                   	push   %ebp
    3791:	89 e5                	mov    %esp,%ebp
    3793:	57                   	push   %edi
    3794:	56                   	push   %esi
    3795:	53                   	push   %ebx
    3796:	83 ec 1c             	sub    $0x1c,%esp
  printf(1, "bigfile test\n");
    3799:	c7 44 24 04 50 5c 00 	movl   $0x5c50,0x4(%esp)
    37a0:	00 
    37a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    37a8:	e8 53 16 00 00       	call   4e00 <printf>
  unlink("bigfile");
    37ad:	c7 04 24 6c 5c 00 00 	movl   $0x5c6c,(%esp)
    37b4:	e8 39 15 00 00       	call   4cf2 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    37b9:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    37c0:	00 
    37c1:	c7 04 24 6c 5c 00 00 	movl   $0x5c6c,(%esp)
    37c8:	e8 15 15 00 00       	call   4ce2 <open>
  if(fd < 0){
    37cd:	85 c0                	test   %eax,%eax
  fd = open("bigfile", O_CREATE | O_RDWR);
    37cf:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    37d1:	0f 88 7f 01 00 00    	js     3956 <bigfile+0x1c6>
    37d7:	31 db                	xor    %ebx,%ebx
    37d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    37e0:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    37e7:	00 
    37e8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    37ec:	c7 04 24 40 9a 00 00 	movl   $0x9a40,(%esp)
    37f3:	e8 38 13 00 00       	call   4b30 <memset>
    if(write(fd, buf, 600) != 600){
    37f8:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    37ff:	00 
    3800:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    3807:	00 
    3808:	89 34 24             	mov    %esi,(%esp)
    380b:	e8 b2 14 00 00       	call   4cc2 <write>
    3810:	3d 58 02 00 00       	cmp    $0x258,%eax
    3815:	0f 85 09 01 00 00    	jne    3924 <bigfile+0x194>
  for(i = 0; i < 20; i++){
    381b:	83 c3 01             	add    $0x1,%ebx
    381e:	83 fb 14             	cmp    $0x14,%ebx
    3821:	75 bd                	jne    37e0 <bigfile+0x50>
  close(fd);
    3823:	89 34 24             	mov    %esi,(%esp)
    3826:	e8 9f 14 00 00       	call   4cca <close>
  fd = open("bigfile", 0);
    382b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3832:	00 
    3833:	c7 04 24 6c 5c 00 00 	movl   $0x5c6c,(%esp)
    383a:	e8 a3 14 00 00       	call   4ce2 <open>
  if(fd < 0){
    383f:	85 c0                	test   %eax,%eax
  fd = open("bigfile", 0);
    3841:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    3843:	0f 88 f4 00 00 00    	js     393d <bigfile+0x1ad>
    3849:	31 db                	xor    %ebx,%ebx
    384b:	31 ff                	xor    %edi,%edi
    384d:	eb 2f                	jmp    387e <bigfile+0xee>
    384f:	90                   	nop
    if(cc != 300){
    3850:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    3855:	0f 85 97 00 00 00    	jne    38f2 <bigfile+0x162>
    if(buf[0] != i/2 || buf[299] != i/2){
    385b:	0f be 05 40 9a 00 00 	movsbl 0x9a40,%eax
    3862:	89 fa                	mov    %edi,%edx
    3864:	d1 fa                	sar    %edx
    3866:	39 d0                	cmp    %edx,%eax
    3868:	75 6f                	jne    38d9 <bigfile+0x149>
    386a:	0f be 15 6b 9b 00 00 	movsbl 0x9b6b,%edx
    3871:	39 d0                	cmp    %edx,%eax
    3873:	75 64                	jne    38d9 <bigfile+0x149>
    total += cc;
    3875:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    387b:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    387e:	c7 44 24 08 2c 01 00 	movl   $0x12c,0x8(%esp)
    3885:	00 
    3886:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    388d:	00 
    388e:	89 34 24             	mov    %esi,(%esp)
    3891:	e8 24 14 00 00       	call   4cba <read>
    if(cc < 0){
    3896:	85 c0                	test   %eax,%eax
    3898:	78 71                	js     390b <bigfile+0x17b>
    if(cc == 0)
    389a:	75 b4                	jne    3850 <bigfile+0xc0>
  close(fd);
    389c:	89 34 24             	mov    %esi,(%esp)
    389f:	90                   	nop
    38a0:	e8 25 14 00 00       	call   4cca <close>
  if(total != 20*600){
    38a5:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    38ab:	0f 85 be 00 00 00    	jne    396f <bigfile+0x1df>
  unlink("bigfile");
    38b1:	c7 04 24 6c 5c 00 00 	movl   $0x5c6c,(%esp)
    38b8:	e8 35 14 00 00       	call   4cf2 <unlink>
  printf(1, "bigfile test ok\n");
    38bd:	c7 44 24 04 fb 5c 00 	movl   $0x5cfb,0x4(%esp)
    38c4:	00 
    38c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    38cc:	e8 2f 15 00 00       	call   4e00 <printf>
}
    38d1:	83 c4 1c             	add    $0x1c,%esp
    38d4:	5b                   	pop    %ebx
    38d5:	5e                   	pop    %esi
    38d6:	5f                   	pop    %edi
    38d7:	5d                   	pop    %ebp
    38d8:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    38d9:	c7 44 24 04 c8 5c 00 	movl   $0x5cc8,0x4(%esp)
    38e0:	00 
    38e1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    38e8:	e8 13 15 00 00       	call   4e00 <printf>
      exit();
    38ed:	e8 b0 13 00 00       	call   4ca2 <exit>
      printf(1, "short read bigfile\n");
    38f2:	c7 44 24 04 b4 5c 00 	movl   $0x5cb4,0x4(%esp)
    38f9:	00 
    38fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3901:	e8 fa 14 00 00       	call   4e00 <printf>
      exit();
    3906:	e8 97 13 00 00       	call   4ca2 <exit>
      printf(1, "read bigfile failed\n");
    390b:	c7 44 24 04 9f 5c 00 	movl   $0x5c9f,0x4(%esp)
    3912:	00 
    3913:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    391a:	e8 e1 14 00 00       	call   4e00 <printf>
      exit();
    391f:	e8 7e 13 00 00       	call   4ca2 <exit>
      printf(1, "write bigfile failed\n");
    3924:	c7 44 24 04 74 5c 00 	movl   $0x5c74,0x4(%esp)
    392b:	00 
    392c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3933:	e8 c8 14 00 00       	call   4e00 <printf>
      exit();
    3938:	e8 65 13 00 00       	call   4ca2 <exit>
    printf(1, "cannot open bigfile\n");
    393d:	c7 44 24 04 8a 5c 00 	movl   $0x5c8a,0x4(%esp)
    3944:	00 
    3945:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    394c:	e8 af 14 00 00       	call   4e00 <printf>
    exit();
    3951:	e8 4c 13 00 00       	call   4ca2 <exit>
    printf(1, "cannot create bigfile");
    3956:	c7 44 24 04 5e 5c 00 	movl   $0x5c5e,0x4(%esp)
    395d:	00 
    395e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3965:	e8 96 14 00 00       	call   4e00 <printf>
    exit();
    396a:	e8 33 13 00 00       	call   4ca2 <exit>
    printf(1, "read bigfile wrong total\n");
    396f:	c7 44 24 04 e1 5c 00 	movl   $0x5ce1,0x4(%esp)
    3976:	00 
    3977:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    397e:	e8 7d 14 00 00       	call   4e00 <printf>
    exit();
    3983:	e8 1a 13 00 00       	call   4ca2 <exit>
    3988:	90                   	nop
    3989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003990 <fourteen>:
{
    3990:	55                   	push   %ebp
    3991:	89 e5                	mov    %esp,%ebp
    3993:	83 ec 18             	sub    $0x18,%esp
  printf(1, "fourteen test\n");
    3996:	c7 44 24 04 0c 5d 00 	movl   $0x5d0c,0x4(%esp)
    399d:	00 
    399e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    39a5:	e8 56 14 00 00       	call   4e00 <printf>
  if(mkdir("12345678901234") != 0){
    39aa:	c7 04 24 47 5d 00 00 	movl   $0x5d47,(%esp)
    39b1:	e8 54 13 00 00       	call   4d0a <mkdir>
    39b6:	85 c0                	test   %eax,%eax
    39b8:	0f 85 92 00 00 00    	jne    3a50 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    39be:	c7 04 24 04 65 00 00 	movl   $0x6504,(%esp)
    39c5:	e8 40 13 00 00       	call   4d0a <mkdir>
    39ca:	85 c0                	test   %eax,%eax
    39cc:	0f 85 fb 00 00 00    	jne    3acd <fourteen+0x13d>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    39d2:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    39d9:	00 
    39da:	c7 04 24 54 65 00 00 	movl   $0x6554,(%esp)
    39e1:	e8 fc 12 00 00       	call   4ce2 <open>
  if(fd < 0){
    39e6:	85 c0                	test   %eax,%eax
    39e8:	0f 88 c6 00 00 00    	js     3ab4 <fourteen+0x124>
  close(fd);
    39ee:	89 04 24             	mov    %eax,(%esp)
    39f1:	e8 d4 12 00 00       	call   4cca <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    39f6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    39fd:	00 
    39fe:	c7 04 24 c4 65 00 00 	movl   $0x65c4,(%esp)
    3a05:	e8 d8 12 00 00       	call   4ce2 <open>
  if(fd < 0){
    3a0a:	85 c0                	test   %eax,%eax
    3a0c:	0f 88 89 00 00 00    	js     3a9b <fourteen+0x10b>
  close(fd);
    3a12:	89 04 24             	mov    %eax,(%esp)
    3a15:	e8 b0 12 00 00       	call   4cca <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    3a1a:	c7 04 24 38 5d 00 00 	movl   $0x5d38,(%esp)
    3a21:	e8 e4 12 00 00       	call   4d0a <mkdir>
    3a26:	85 c0                	test   %eax,%eax
    3a28:	74 58                	je     3a82 <fourteen+0xf2>
  if(mkdir("123456789012345/12345678901234") == 0){
    3a2a:	c7 04 24 60 66 00 00 	movl   $0x6660,(%esp)
    3a31:	e8 d4 12 00 00       	call   4d0a <mkdir>
    3a36:	85 c0                	test   %eax,%eax
    3a38:	74 2f                	je     3a69 <fourteen+0xd9>
  printf(1, "fourteen ok\n");
    3a3a:	c7 44 24 04 56 5d 00 	movl   $0x5d56,0x4(%esp)
    3a41:	00 
    3a42:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a49:	e8 b2 13 00 00       	call   4e00 <printf>
}
    3a4e:	c9                   	leave  
    3a4f:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    3a50:	c7 44 24 04 1b 5d 00 	movl   $0x5d1b,0x4(%esp)
    3a57:	00 
    3a58:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a5f:	e8 9c 13 00 00       	call   4e00 <printf>
    exit();
    3a64:	e8 39 12 00 00       	call   4ca2 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    3a69:	c7 44 24 04 80 66 00 	movl   $0x6680,0x4(%esp)
    3a70:	00 
    3a71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a78:	e8 83 13 00 00       	call   4e00 <printf>
    exit();
    3a7d:	e8 20 12 00 00       	call   4ca2 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    3a82:	c7 44 24 04 30 66 00 	movl   $0x6630,0x4(%esp)
    3a89:	00 
    3a8a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a91:	e8 6a 13 00 00       	call   4e00 <printf>
    exit();
    3a96:	e8 07 12 00 00       	call   4ca2 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    3a9b:	c7 44 24 04 f4 65 00 	movl   $0x65f4,0x4(%esp)
    3aa2:	00 
    3aa3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3aaa:	e8 51 13 00 00       	call   4e00 <printf>
    exit();
    3aaf:	e8 ee 11 00 00       	call   4ca2 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    3ab4:	c7 44 24 04 84 65 00 	movl   $0x6584,0x4(%esp)
    3abb:	00 
    3abc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3ac3:	e8 38 13 00 00       	call   4e00 <printf>
    exit();
    3ac8:	e8 d5 11 00 00       	call   4ca2 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    3acd:	c7 44 24 04 24 65 00 	movl   $0x6524,0x4(%esp)
    3ad4:	00 
    3ad5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3adc:	e8 1f 13 00 00       	call   4e00 <printf>
    exit();
    3ae1:	e8 bc 11 00 00       	call   4ca2 <exit>
    3ae6:	8d 76 00             	lea    0x0(%esi),%esi
    3ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003af0 <rmdot>:
{
    3af0:	55                   	push   %ebp
    3af1:	89 e5                	mov    %esp,%ebp
    3af3:	83 ec 18             	sub    $0x18,%esp
  printf(1, "rmdot test\n");
    3af6:	c7 44 24 04 63 5d 00 	movl   $0x5d63,0x4(%esp)
    3afd:	00 
    3afe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3b05:	e8 f6 12 00 00       	call   4e00 <printf>
  if(mkdir("dots") != 0){
    3b0a:	c7 04 24 6f 5d 00 00 	movl   $0x5d6f,(%esp)
    3b11:	e8 f4 11 00 00       	call   4d0a <mkdir>
    3b16:	85 c0                	test   %eax,%eax
    3b18:	0f 85 9a 00 00 00    	jne    3bb8 <rmdot+0xc8>
  if(chdir("dots") != 0){
    3b1e:	c7 04 24 6f 5d 00 00 	movl   $0x5d6f,(%esp)
    3b25:	e8 e8 11 00 00       	call   4d12 <chdir>
    3b2a:	85 c0                	test   %eax,%eax
    3b2c:	0f 85 35 01 00 00    	jne    3c67 <rmdot+0x177>
  if(unlink(".") == 0){
    3b32:	c7 04 24 1a 5a 00 00 	movl   $0x5a1a,(%esp)
    3b39:	e8 b4 11 00 00       	call   4cf2 <unlink>
    3b3e:	85 c0                	test   %eax,%eax
    3b40:	0f 84 08 01 00 00    	je     3c4e <rmdot+0x15e>
  if(unlink("..") == 0){
    3b46:	c7 04 24 19 5a 00 00 	movl   $0x5a19,(%esp)
    3b4d:	e8 a0 11 00 00       	call   4cf2 <unlink>
    3b52:	85 c0                	test   %eax,%eax
    3b54:	0f 84 db 00 00 00    	je     3c35 <rmdot+0x145>
  if(chdir("/") != 0){
    3b5a:	c7 04 24 ed 51 00 00 	movl   $0x51ed,(%esp)
    3b61:	e8 ac 11 00 00       	call   4d12 <chdir>
    3b66:	85 c0                	test   %eax,%eax
    3b68:	0f 85 ae 00 00 00    	jne    3c1c <rmdot+0x12c>
  if(unlink("dots/.") == 0){
    3b6e:	c7 04 24 b7 5d 00 00 	movl   $0x5db7,(%esp)
    3b75:	e8 78 11 00 00       	call   4cf2 <unlink>
    3b7a:	85 c0                	test   %eax,%eax
    3b7c:	0f 84 81 00 00 00    	je     3c03 <rmdot+0x113>
  if(unlink("dots/..") == 0){
    3b82:	c7 04 24 d5 5d 00 00 	movl   $0x5dd5,(%esp)
    3b89:	e8 64 11 00 00       	call   4cf2 <unlink>
    3b8e:	85 c0                	test   %eax,%eax
    3b90:	74 58                	je     3bea <rmdot+0xfa>
  if(unlink("dots") != 0){
    3b92:	c7 04 24 6f 5d 00 00 	movl   $0x5d6f,(%esp)
    3b99:	e8 54 11 00 00       	call   4cf2 <unlink>
    3b9e:	85 c0                	test   %eax,%eax
    3ba0:	75 2f                	jne    3bd1 <rmdot+0xe1>
  printf(1, "rmdot ok\n");
    3ba2:	c7 44 24 04 0a 5e 00 	movl   $0x5e0a,0x4(%esp)
    3ba9:	00 
    3baa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3bb1:	e8 4a 12 00 00       	call   4e00 <printf>
}
    3bb6:	c9                   	leave  
    3bb7:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    3bb8:	c7 44 24 04 74 5d 00 	movl   $0x5d74,0x4(%esp)
    3bbf:	00 
    3bc0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3bc7:	e8 34 12 00 00       	call   4e00 <printf>
    exit();
    3bcc:	e8 d1 10 00 00       	call   4ca2 <exit>
    printf(1, "unlink dots failed!\n");
    3bd1:	c7 44 24 04 f5 5d 00 	movl   $0x5df5,0x4(%esp)
    3bd8:	00 
    3bd9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3be0:	e8 1b 12 00 00       	call   4e00 <printf>
    exit();
    3be5:	e8 b8 10 00 00       	call   4ca2 <exit>
    printf(1, "unlink dots/.. worked!\n");
    3bea:	c7 44 24 04 dd 5d 00 	movl   $0x5ddd,0x4(%esp)
    3bf1:	00 
    3bf2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3bf9:	e8 02 12 00 00       	call   4e00 <printf>
    exit();
    3bfe:	e8 9f 10 00 00       	call   4ca2 <exit>
    printf(1, "unlink dots/. worked!\n");
    3c03:	c7 44 24 04 be 5d 00 	movl   $0x5dbe,0x4(%esp)
    3c0a:	00 
    3c0b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c12:	e8 e9 11 00 00       	call   4e00 <printf>
    exit();
    3c17:	e8 86 10 00 00       	call   4ca2 <exit>
    printf(1, "chdir / failed\n");
    3c1c:	c7 44 24 04 ef 51 00 	movl   $0x51ef,0x4(%esp)
    3c23:	00 
    3c24:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c2b:	e8 d0 11 00 00       	call   4e00 <printf>
    exit();
    3c30:	e8 6d 10 00 00       	call   4ca2 <exit>
    printf(1, "rm .. worked!\n");
    3c35:	c7 44 24 04 a8 5d 00 	movl   $0x5da8,0x4(%esp)
    3c3c:	00 
    3c3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c44:	e8 b7 11 00 00       	call   4e00 <printf>
    exit();
    3c49:	e8 54 10 00 00       	call   4ca2 <exit>
    printf(1, "rm . worked!\n");
    3c4e:	c7 44 24 04 9a 5d 00 	movl   $0x5d9a,0x4(%esp)
    3c55:	00 
    3c56:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c5d:	e8 9e 11 00 00       	call   4e00 <printf>
    exit();
    3c62:	e8 3b 10 00 00       	call   4ca2 <exit>
    printf(1, "chdir dots failed\n");
    3c67:	c7 44 24 04 87 5d 00 	movl   $0x5d87,0x4(%esp)
    3c6e:	00 
    3c6f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c76:	e8 85 11 00 00       	call   4e00 <printf>
    exit();
    3c7b:	e8 22 10 00 00       	call   4ca2 <exit>

00003c80 <dirfile>:
{
    3c80:	55                   	push   %ebp
    3c81:	89 e5                	mov    %esp,%ebp
    3c83:	53                   	push   %ebx
    3c84:	83 ec 14             	sub    $0x14,%esp
  printf(1, "dir vs file\n");
    3c87:	c7 44 24 04 14 5e 00 	movl   $0x5e14,0x4(%esp)
    3c8e:	00 
    3c8f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c96:	e8 65 11 00 00       	call   4e00 <printf>
  fd = open("dirfile", O_CREATE);
    3c9b:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3ca2:	00 
    3ca3:	c7 04 24 21 5e 00 00 	movl   $0x5e21,(%esp)
    3caa:	e8 33 10 00 00       	call   4ce2 <open>
  if(fd < 0){
    3caf:	85 c0                	test   %eax,%eax
    3cb1:	0f 88 4e 01 00 00    	js     3e05 <dirfile+0x185>
  close(fd);
    3cb7:	89 04 24             	mov    %eax,(%esp)
    3cba:	e8 0b 10 00 00       	call   4cca <close>
  if(chdir("dirfile") == 0){
    3cbf:	c7 04 24 21 5e 00 00 	movl   $0x5e21,(%esp)
    3cc6:	e8 47 10 00 00       	call   4d12 <chdir>
    3ccb:	85 c0                	test   %eax,%eax
    3ccd:	0f 84 19 01 00 00    	je     3dec <dirfile+0x16c>
  fd = open("dirfile/xx", 0);
    3cd3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3cda:	00 
    3cdb:	c7 04 24 5a 5e 00 00 	movl   $0x5e5a,(%esp)
    3ce2:	e8 fb 0f 00 00       	call   4ce2 <open>
  if(fd >= 0){
    3ce7:	85 c0                	test   %eax,%eax
    3ce9:	0f 89 e4 00 00 00    	jns    3dd3 <dirfile+0x153>
  fd = open("dirfile/xx", O_CREATE);
    3cef:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3cf6:	00 
    3cf7:	c7 04 24 5a 5e 00 00 	movl   $0x5e5a,(%esp)
    3cfe:	e8 df 0f 00 00       	call   4ce2 <open>
  if(fd >= 0){
    3d03:	85 c0                	test   %eax,%eax
    3d05:	0f 89 c8 00 00 00    	jns    3dd3 <dirfile+0x153>
  if(mkdir("dirfile/xx") == 0){
    3d0b:	c7 04 24 5a 5e 00 00 	movl   $0x5e5a,(%esp)
    3d12:	e8 f3 0f 00 00       	call   4d0a <mkdir>
    3d17:	85 c0                	test   %eax,%eax
    3d19:	0f 84 7c 01 00 00    	je     3e9b <dirfile+0x21b>
  if(unlink("dirfile/xx") == 0){
    3d1f:	c7 04 24 5a 5e 00 00 	movl   $0x5e5a,(%esp)
    3d26:	e8 c7 0f 00 00       	call   4cf2 <unlink>
    3d2b:	85 c0                	test   %eax,%eax
    3d2d:	0f 84 4f 01 00 00    	je     3e82 <dirfile+0x202>
  if(link("README", "dirfile/xx") == 0){
    3d33:	c7 44 24 04 5a 5e 00 	movl   $0x5e5a,0x4(%esp)
    3d3a:	00 
    3d3b:	c7 04 24 be 5e 00 00 	movl   $0x5ebe,(%esp)
    3d42:	e8 bb 0f 00 00       	call   4d02 <link>
    3d47:	85 c0                	test   %eax,%eax
    3d49:	0f 84 1a 01 00 00    	je     3e69 <dirfile+0x1e9>
  if(unlink("dirfile") != 0){
    3d4f:	c7 04 24 21 5e 00 00 	movl   $0x5e21,(%esp)
    3d56:	e8 97 0f 00 00       	call   4cf2 <unlink>
    3d5b:	85 c0                	test   %eax,%eax
    3d5d:	0f 85 ed 00 00 00    	jne    3e50 <dirfile+0x1d0>
  fd = open(".", O_RDWR);
    3d63:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    3d6a:	00 
    3d6b:	c7 04 24 1a 5a 00 00 	movl   $0x5a1a,(%esp)
    3d72:	e8 6b 0f 00 00       	call   4ce2 <open>
  if(fd >= 0){
    3d77:	85 c0                	test   %eax,%eax
    3d79:	0f 89 b8 00 00 00    	jns    3e37 <dirfile+0x1b7>
  fd = open(".", 0);
    3d7f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3d86:	00 
    3d87:	c7 04 24 1a 5a 00 00 	movl   $0x5a1a,(%esp)
    3d8e:	e8 4f 0f 00 00       	call   4ce2 <open>
  if(write(fd, "x", 1) > 0){
    3d93:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3d9a:	00 
    3d9b:	c7 44 24 04 fd 5a 00 	movl   $0x5afd,0x4(%esp)
    3da2:	00 
    3da3:	89 04 24             	mov    %eax,(%esp)
  fd = open(".", 0);
    3da6:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    3da8:	e8 15 0f 00 00       	call   4cc2 <write>
    3dad:	85 c0                	test   %eax,%eax
    3daf:	7f 6d                	jg     3e1e <dirfile+0x19e>
  close(fd);
    3db1:	89 1c 24             	mov    %ebx,(%esp)
    3db4:	e8 11 0f 00 00       	call   4cca <close>
  printf(1, "dir vs file OK\n");
    3db9:	c7 44 24 04 f1 5e 00 	movl   $0x5ef1,0x4(%esp)
    3dc0:	00 
    3dc1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3dc8:	e8 33 10 00 00       	call   4e00 <printf>
}
    3dcd:	83 c4 14             	add    $0x14,%esp
    3dd0:	5b                   	pop    %ebx
    3dd1:	5d                   	pop    %ebp
    3dd2:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    3dd3:	c7 44 24 04 65 5e 00 	movl   $0x5e65,0x4(%esp)
    3dda:	00 
    3ddb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3de2:	e8 19 10 00 00       	call   4e00 <printf>
    exit();
    3de7:	e8 b6 0e 00 00       	call   4ca2 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    3dec:	c7 44 24 04 40 5e 00 	movl   $0x5e40,0x4(%esp)
    3df3:	00 
    3df4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3dfb:	e8 00 10 00 00       	call   4e00 <printf>
    exit();
    3e00:	e8 9d 0e 00 00       	call   4ca2 <exit>
    printf(1, "create dirfile failed\n");
    3e05:	c7 44 24 04 29 5e 00 	movl   $0x5e29,0x4(%esp)
    3e0c:	00 
    3e0d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e14:	e8 e7 0f 00 00       	call   4e00 <printf>
    exit();
    3e19:	e8 84 0e 00 00       	call   4ca2 <exit>
    printf(1, "write . succeeded!\n");
    3e1e:	c7 44 24 04 dd 5e 00 	movl   $0x5edd,0x4(%esp)
    3e25:	00 
    3e26:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e2d:	e8 ce 0f 00 00       	call   4e00 <printf>
    exit();
    3e32:	e8 6b 0e 00 00       	call   4ca2 <exit>
    printf(1, "open . for writing succeeded!\n");
    3e37:	c7 44 24 04 d4 66 00 	movl   $0x66d4,0x4(%esp)
    3e3e:	00 
    3e3f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e46:	e8 b5 0f 00 00       	call   4e00 <printf>
    exit();
    3e4b:	e8 52 0e 00 00       	call   4ca2 <exit>
    printf(1, "unlink dirfile failed!\n");
    3e50:	c7 44 24 04 c5 5e 00 	movl   $0x5ec5,0x4(%esp)
    3e57:	00 
    3e58:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e5f:	e8 9c 0f 00 00       	call   4e00 <printf>
    exit();
    3e64:	e8 39 0e 00 00       	call   4ca2 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    3e69:	c7 44 24 04 b4 66 00 	movl   $0x66b4,0x4(%esp)
    3e70:	00 
    3e71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e78:	e8 83 0f 00 00       	call   4e00 <printf>
    exit();
    3e7d:	e8 20 0e 00 00       	call   4ca2 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    3e82:	c7 44 24 04 a0 5e 00 	movl   $0x5ea0,0x4(%esp)
    3e89:	00 
    3e8a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e91:	e8 6a 0f 00 00       	call   4e00 <printf>
    exit();
    3e96:	e8 07 0e 00 00       	call   4ca2 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    3e9b:	c7 44 24 04 83 5e 00 	movl   $0x5e83,0x4(%esp)
    3ea2:	00 
    3ea3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3eaa:	e8 51 0f 00 00       	call   4e00 <printf>
    exit();
    3eaf:	e8 ee 0d 00 00       	call   4ca2 <exit>
    3eb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3eba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003ec0 <iref>:
{
    3ec0:	55                   	push   %ebp
    3ec1:	89 e5                	mov    %esp,%ebp
    3ec3:	53                   	push   %ebx
  printf(1, "empty file name\n");
    3ec4:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    3ec9:	83 ec 14             	sub    $0x14,%esp
  printf(1, "empty file name\n");
    3ecc:	c7 44 24 04 01 5f 00 	movl   $0x5f01,0x4(%esp)
    3ed3:	00 
    3ed4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3edb:	e8 20 0f 00 00       	call   4e00 <printf>
    if(mkdir("irefd") != 0){
    3ee0:	c7 04 24 12 5f 00 00 	movl   $0x5f12,(%esp)
    3ee7:	e8 1e 0e 00 00       	call   4d0a <mkdir>
    3eec:	85 c0                	test   %eax,%eax
    3eee:	0f 85 af 00 00 00    	jne    3fa3 <iref+0xe3>
    if(chdir("irefd") != 0){
    3ef4:	c7 04 24 12 5f 00 00 	movl   $0x5f12,(%esp)
    3efb:	e8 12 0e 00 00       	call   4d12 <chdir>
    3f00:	85 c0                	test   %eax,%eax
    3f02:	0f 85 b4 00 00 00    	jne    3fbc <iref+0xfc>
    mkdir("");
    3f08:	c7 04 24 c7 55 00 00 	movl   $0x55c7,(%esp)
    3f0f:	e8 f6 0d 00 00       	call   4d0a <mkdir>
    link("README", "");
    3f14:	c7 44 24 04 c7 55 00 	movl   $0x55c7,0x4(%esp)
    3f1b:	00 
    3f1c:	c7 04 24 be 5e 00 00 	movl   $0x5ebe,(%esp)
    3f23:	e8 da 0d 00 00       	call   4d02 <link>
    fd = open("", O_CREATE);
    3f28:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3f2f:	00 
    3f30:	c7 04 24 c7 55 00 00 	movl   $0x55c7,(%esp)
    3f37:	e8 a6 0d 00 00       	call   4ce2 <open>
    if(fd >= 0)
    3f3c:	85 c0                	test   %eax,%eax
    3f3e:	78 08                	js     3f48 <iref+0x88>
      close(fd);
    3f40:	89 04 24             	mov    %eax,(%esp)
    3f43:	e8 82 0d 00 00       	call   4cca <close>
    fd = open("xx", O_CREATE);
    3f48:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3f4f:	00 
    3f50:	c7 04 24 fc 5a 00 00 	movl   $0x5afc,(%esp)
    3f57:	e8 86 0d 00 00       	call   4ce2 <open>
    if(fd >= 0)
    3f5c:	85 c0                	test   %eax,%eax
    3f5e:	78 08                	js     3f68 <iref+0xa8>
      close(fd);
    3f60:	89 04 24             	mov    %eax,(%esp)
    3f63:	e8 62 0d 00 00       	call   4cca <close>
    unlink("xx");
    3f68:	c7 04 24 fc 5a 00 00 	movl   $0x5afc,(%esp)
    3f6f:	e8 7e 0d 00 00       	call   4cf2 <unlink>
  for(i = 0; i < 50 + 1; i++){
    3f74:	83 eb 01             	sub    $0x1,%ebx
    3f77:	0f 85 63 ff ff ff    	jne    3ee0 <iref+0x20>
  chdir("/");
    3f7d:	c7 04 24 ed 51 00 00 	movl   $0x51ed,(%esp)
    3f84:	e8 89 0d 00 00       	call   4d12 <chdir>
  printf(1, "empty file name OK\n");
    3f89:	c7 44 24 04 40 5f 00 	movl   $0x5f40,0x4(%esp)
    3f90:	00 
    3f91:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3f98:	e8 63 0e 00 00       	call   4e00 <printf>
}
    3f9d:	83 c4 14             	add    $0x14,%esp
    3fa0:	5b                   	pop    %ebx
    3fa1:	5d                   	pop    %ebp
    3fa2:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    3fa3:	c7 44 24 04 18 5f 00 	movl   $0x5f18,0x4(%esp)
    3faa:	00 
    3fab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3fb2:	e8 49 0e 00 00       	call   4e00 <printf>
      exit();
    3fb7:	e8 e6 0c 00 00       	call   4ca2 <exit>
      printf(1, "chdir irefd failed\n");
    3fbc:	c7 44 24 04 2c 5f 00 	movl   $0x5f2c,0x4(%esp)
    3fc3:	00 
    3fc4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3fcb:	e8 30 0e 00 00       	call   4e00 <printf>
      exit();
    3fd0:	e8 cd 0c 00 00       	call   4ca2 <exit>
    3fd5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003fe0 <forktest>:
{
    3fe0:	55                   	push   %ebp
    3fe1:	89 e5                	mov    %esp,%ebp
    3fe3:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    3fe4:	31 db                	xor    %ebx,%ebx
{
    3fe6:	83 ec 14             	sub    $0x14,%esp
  printf(1, "fork test\n");
    3fe9:	c7 44 24 04 54 5f 00 	movl   $0x5f54,0x4(%esp)
    3ff0:	00 
    3ff1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3ff8:	e8 03 0e 00 00       	call   4e00 <printf>
    3ffd:	eb 13                	jmp    4012 <forktest+0x32>
    3fff:	90                   	nop
    if(pid == 0)
    4000:	0f 84 87 00 00 00    	je     408d <forktest+0xad>
  for(n=0; n<1000; n++){
    4006:	83 c3 01             	add    $0x1,%ebx
    4009:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    400f:	90                   	nop
    4010:	74 4e                	je     4060 <forktest+0x80>
    pid = fork();
    4012:	e8 83 0c 00 00       	call   4c9a <fork>
    if(pid < 0)
    4017:	85 c0                	test   %eax,%eax
    4019:	79 e5                	jns    4000 <forktest+0x20>
  for(; n > 0; n--){
    401b:	85 db                	test   %ebx,%ebx
    401d:	8d 76 00             	lea    0x0(%esi),%esi
    4020:	74 15                	je     4037 <forktest+0x57>
    4022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    4028:	e8 7d 0c 00 00       	call   4caa <wait>
    402d:	85 c0                	test   %eax,%eax
    402f:	90                   	nop
    4030:	78 47                	js     4079 <forktest+0x99>
  for(; n > 0; n--){
    4032:	83 eb 01             	sub    $0x1,%ebx
    4035:	75 f1                	jne    4028 <forktest+0x48>
  if(wait() != -1){
    4037:	e8 6e 0c 00 00       	call   4caa <wait>
    403c:	83 f8 ff             	cmp    $0xffffffff,%eax
    403f:	90                   	nop
    4040:	75 50                	jne    4092 <forktest+0xb2>
  printf(1, "fork test OK\n");
    4042:	c7 44 24 04 86 5f 00 	movl   $0x5f86,0x4(%esp)
    4049:	00 
    404a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4051:	e8 aa 0d 00 00       	call   4e00 <printf>
}
    4056:	83 c4 14             	add    $0x14,%esp
    4059:	5b                   	pop    %ebx
    405a:	5d                   	pop    %ebp
    405b:	c3                   	ret    
    405c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "fork claimed to work 1000 times!\n");
    4060:	c7 44 24 04 f4 66 00 	movl   $0x66f4,0x4(%esp)
    4067:	00 
    4068:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    406f:	e8 8c 0d 00 00       	call   4e00 <printf>
    exit();
    4074:	e8 29 0c 00 00       	call   4ca2 <exit>
      printf(1, "wait stopped early\n");
    4079:	c7 44 24 04 5f 5f 00 	movl   $0x5f5f,0x4(%esp)
    4080:	00 
    4081:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4088:	e8 73 0d 00 00       	call   4e00 <printf>
      exit();
    408d:	e8 10 0c 00 00       	call   4ca2 <exit>
    printf(1, "wait got too many\n");
    4092:	c7 44 24 04 73 5f 00 	movl   $0x5f73,0x4(%esp)
    4099:	00 
    409a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    40a1:	e8 5a 0d 00 00       	call   4e00 <printf>
    exit();
    40a6:	e8 f7 0b 00 00       	call   4ca2 <exit>
    40ab:	90                   	nop
    40ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000040b0 <sbrktest>:
{
    40b0:	55                   	push   %ebp
    40b1:	89 e5                	mov    %esp,%ebp
    40b3:	57                   	push   %edi
    40b4:	56                   	push   %esi
  for(i = 0; i < 5000; i++){
    40b5:	31 f6                	xor    %esi,%esi
{
    40b7:	53                   	push   %ebx
    40b8:	83 ec 6c             	sub    $0x6c,%esp
  printf(stdout, "sbrk test\n");
    40bb:	a1 60 72 00 00       	mov    0x7260,%eax
    40c0:	c7 44 24 04 94 5f 00 	movl   $0x5f94,0x4(%esp)
    40c7:	00 
    40c8:	89 04 24             	mov    %eax,(%esp)
    40cb:	e8 30 0d 00 00       	call   4e00 <printf>
  oldbrk = sbrk(0);
    40d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    40d7:	e8 4e 0c 00 00       	call   4d2a <sbrk>
  a = sbrk(0);
    40dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    40e3:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  a = sbrk(0);
    40e6:	e8 3f 0c 00 00       	call   4d2a <sbrk>
    40eb:	89 c3                	mov    %eax,%ebx
    40ed:	8d 76 00             	lea    0x0(%esi),%esi
    b = sbrk(1);
    40f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    40f7:	e8 2e 0c 00 00       	call   4d2a <sbrk>
    if(b != a){
    40fc:	39 d8                	cmp    %ebx,%eax
    b = sbrk(1);
    40fe:	89 c7                	mov    %eax,%edi
    if(b != a){
    4100:	0f 85 78 02 00 00    	jne    437e <sbrktest+0x2ce>
  for(i = 0; i < 5000; i++){
    4106:	83 c6 01             	add    $0x1,%esi
    a = b + 1;
    4109:	83 c3 01             	add    $0x1,%ebx
    *b = 1;
    410c:	c6 43 ff 01          	movb   $0x1,-0x1(%ebx)
  for(i = 0; i < 5000; i++){
    4110:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    4116:	75 d8                	jne    40f0 <sbrktest+0x40>
  pid = fork();
    4118:	e8 7d 0b 00 00       	call   4c9a <fork>
  if(pid < 0){
    411d:	85 c0                	test   %eax,%eax
  pid = fork();
    411f:	89 c3                	mov    %eax,%ebx
  if(pid < 0){
    4121:	0f 88 c5 03 00 00    	js     44ec <sbrktest+0x43c>
  c = sbrk(1);
    4127:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    412e:	e8 f7 0b 00 00       	call   4d2a <sbrk>
  c = sbrk(1);
    4133:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    413a:	e8 eb 0b 00 00       	call   4d2a <sbrk>
  if(c != a + 1){
    413f:	8d 57 02             	lea    0x2(%edi),%edx
    4142:	39 d0                	cmp    %edx,%eax
    4144:	0f 85 88 03 00 00    	jne    44d2 <sbrktest+0x422>
  if(pid == 0)
    414a:	85 db                	test   %ebx,%ebx
    414c:	0f 84 7b 03 00 00    	je     44cd <sbrktest+0x41d>
  wait();
    4152:	e8 53 0b 00 00       	call   4caa <wait>
  a = sbrk(0);
    4157:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    415e:	e8 c7 0b 00 00       	call   4d2a <sbrk>
  amt = (BIG) - (uint)a;
    4163:	ba 00 00 40 06       	mov    $0x6400000,%edx
    4168:	29 c2                	sub    %eax,%edx
  a = sbrk(0);
    416a:	89 c3                	mov    %eax,%ebx
  p = sbrk(amt);
    416c:	89 14 24             	mov    %edx,(%esp)
    416f:	e8 b6 0b 00 00       	call   4d2a <sbrk>
  if (p != a) {
    4174:	39 d8                	cmp    %ebx,%eax
    4176:	0f 85 3c 03 00 00    	jne    44b8 <sbrktest+0x408>
  *lastaddr = 99;
    417c:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    4183:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    418a:	e8 9b 0b 00 00       	call   4d2a <sbrk>
  c = sbrk(-4096);
    418f:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    4196:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    4198:	e8 8d 0b 00 00       	call   4d2a <sbrk>
  if(c == (char*)0xffffffff){
    419d:	83 f8 ff             	cmp    $0xffffffff,%eax
    41a0:	0f 84 f8 02 00 00    	je     449e <sbrktest+0x3ee>
  c = sbrk(0);
    41a6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41ad:	e8 78 0b 00 00       	call   4d2a <sbrk>
  if(c != a - 4096){
    41b2:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    41b8:	39 d0                	cmp    %edx,%eax
    41ba:	0f 85 bc 02 00 00    	jne    447c <sbrktest+0x3cc>
  a = sbrk(0);
    41c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41c7:	e8 5e 0b 00 00       	call   4d2a <sbrk>
  c = sbrk(4096);
    41cc:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  a = sbrk(0);
    41d3:	89 c6                	mov    %eax,%esi
  c = sbrk(4096);
    41d5:	e8 50 0b 00 00       	call   4d2a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    41da:	39 f0                	cmp    %esi,%eax
  c = sbrk(4096);
    41dc:	89 c3                	mov    %eax,%ebx
  if(c != a || sbrk(0) != a + 4096){
    41de:	0f 85 76 02 00 00    	jne    445a <sbrktest+0x3aa>
    41e4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41eb:	e8 3a 0b 00 00       	call   4d2a <sbrk>
    41f0:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    41f6:	39 d0                	cmp    %edx,%eax
    41f8:	0f 85 5c 02 00 00    	jne    445a <sbrktest+0x3aa>
  if(*lastaddr == 99){
    41fe:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    4205:	0f 84 35 02 00 00    	je     4440 <sbrktest+0x390>
  a = sbrk(0);
    420b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4212:	e8 13 0b 00 00       	call   4d2a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    4217:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    421e:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    4220:	e8 05 0b 00 00       	call   4d2a <sbrk>
    4225:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    4228:	29 c1                	sub    %eax,%ecx
    422a:	89 0c 24             	mov    %ecx,(%esp)
    422d:	e8 f8 0a 00 00       	call   4d2a <sbrk>
  if(c != a){
    4232:	39 d8                	cmp    %ebx,%eax
    4234:	0f 85 e4 01 00 00    	jne    441e <sbrktest+0x36e>
    423a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    423f:	90                   	nop
    ppid = getpid();
    4240:	e8 dd 0a 00 00       	call   4d22 <getpid>
    4245:	89 c6                	mov    %eax,%esi
    pid = fork();
    4247:	e8 4e 0a 00 00       	call   4c9a <fork>
    if(pid < 0){
    424c:	85 c0                	test   %eax,%eax
    424e:	0f 88 b0 01 00 00    	js     4404 <sbrktest+0x354>
    if(pid == 0){
    4254:	0f 84 7d 01 00 00    	je     43d7 <sbrktest+0x327>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    425a:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    wait();
    4260:	e8 45 0a 00 00       	call   4caa <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    4265:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    426b:	75 d3                	jne    4240 <sbrktest+0x190>
  if(pipe(fds) != 0){
    426d:	8d 45 b8             	lea    -0x48(%ebp),%eax
    4270:	89 04 24             	mov    %eax,(%esp)
    4273:	e8 3a 0a 00 00       	call   4cb2 <pipe>
    4278:	85 c0                	test   %eax,%eax
    427a:	0f 85 3e 01 00 00    	jne    43be <sbrktest+0x30e>
    4280:	8d 5d e8             	lea    -0x18(%ebp),%ebx
    4283:	8d 75 c0             	lea    -0x40(%ebp),%esi
      read(fds[0], &scratch, 1);
    4286:	8d 7d b7             	lea    -0x49(%ebp),%edi
    if((pids[i] = fork()) == 0){
    4289:	e8 0c 0a 00 00       	call   4c9a <fork>
    428e:	85 c0                	test   %eax,%eax
    4290:	89 06                	mov    %eax,(%esi)
    4292:	0f 84 9f 00 00 00    	je     4337 <sbrktest+0x287>
    if(pids[i] != -1)
    4298:	83 f8 ff             	cmp    $0xffffffff,%eax
    429b:	74 17                	je     42b4 <sbrktest+0x204>
      read(fds[0], &scratch, 1);
    429d:	8b 45 b8             	mov    -0x48(%ebp),%eax
    42a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    42a7:	00 
    42a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
    42ac:	89 04 24             	mov    %eax,(%esp)
    42af:	e8 06 0a 00 00       	call   4cba <read>
    42b4:	83 c6 04             	add    $0x4,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    42b7:	39 de                	cmp    %ebx,%esi
    42b9:	75 ce                	jne    4289 <sbrktest+0x1d9>
  c = sbrk(4096);
    42bb:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    42c2:	8d 75 c0             	lea    -0x40(%ebp),%esi
    42c5:	e8 60 0a 00 00       	call   4d2a <sbrk>
    42ca:	89 c7                	mov    %eax,%edi
    if(pids[i] == -1)
    42cc:	8b 06                	mov    (%esi),%eax
    42ce:	83 f8 ff             	cmp    $0xffffffff,%eax
    42d1:	74 0d                	je     42e0 <sbrktest+0x230>
    kill(pids[i]);
    42d3:	89 04 24             	mov    %eax,(%esp)
    42d6:	e8 f7 09 00 00       	call   4cd2 <kill>
    wait();
    42db:	e8 ca 09 00 00       	call   4caa <wait>
    42e0:	83 c6 04             	add    $0x4,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    42e3:	39 f3                	cmp    %esi,%ebx
    42e5:	75 e5                	jne    42cc <sbrktest+0x21c>
  if(c == (char*)0xffffffff){
    42e7:	83 ff ff             	cmp    $0xffffffff,%edi
    42ea:	0f 84 b4 00 00 00    	je     43a4 <sbrktest+0x2f4>
  if(sbrk(0) > oldbrk)
    42f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    42f7:	e8 2e 0a 00 00       	call   4d2a <sbrk>
    42fc:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    42ff:	73 19                	jae    431a <sbrktest+0x26a>
    sbrk(-(sbrk(0) - oldbrk));
    4301:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4308:	e8 1d 0a 00 00       	call   4d2a <sbrk>
    430d:	8b 7d a4             	mov    -0x5c(%ebp),%edi
    4310:	29 c7                	sub    %eax,%edi
    4312:	89 3c 24             	mov    %edi,(%esp)
    4315:	e8 10 0a 00 00       	call   4d2a <sbrk>
  printf(stdout, "sbrk test OK\n");
    431a:	a1 60 72 00 00       	mov    0x7260,%eax
    431f:	c7 44 24 04 3c 60 00 	movl   $0x603c,0x4(%esp)
    4326:	00 
    4327:	89 04 24             	mov    %eax,(%esp)
    432a:	e8 d1 0a 00 00       	call   4e00 <printf>
}
    432f:	83 c4 6c             	add    $0x6c,%esp
    4332:	5b                   	pop    %ebx
    4333:	5e                   	pop    %esi
    4334:	5f                   	pop    %edi
    4335:	5d                   	pop    %ebp
    4336:	c3                   	ret    
      sbrk(BIG - (uint)sbrk(0));
    4337:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    433e:	e8 e7 09 00 00       	call   4d2a <sbrk>
    4343:	ba 00 00 40 06       	mov    $0x6400000,%edx
    4348:	29 c2                	sub    %eax,%edx
    434a:	89 14 24             	mov    %edx,(%esp)
    434d:	e8 d8 09 00 00       	call   4d2a <sbrk>
      write(fds[1], "x", 1);
    4352:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4355:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    435c:	00 
    435d:	c7 44 24 04 fd 5a 00 	movl   $0x5afd,0x4(%esp)
    4364:	00 
    4365:	89 04 24             	mov    %eax,(%esp)
    4368:	e8 55 09 00 00       	call   4cc2 <write>
    436d:	8d 76 00             	lea    0x0(%esi),%esi
      for(;;) sleep(1000);
    4370:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
    4377:	e8 b6 09 00 00       	call   4d32 <sleep>
    437c:	eb f2                	jmp    4370 <sbrktest+0x2c0>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    437e:	89 44 24 10          	mov    %eax,0x10(%esp)
    4382:	a1 60 72 00 00       	mov    0x7260,%eax
    4387:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    438b:	89 74 24 08          	mov    %esi,0x8(%esp)
    438f:	c7 44 24 04 9f 5f 00 	movl   $0x5f9f,0x4(%esp)
    4396:	00 
    4397:	89 04 24             	mov    %eax,(%esp)
    439a:	e8 61 0a 00 00       	call   4e00 <printf>
      exit();
    439f:	e8 fe 08 00 00       	call   4ca2 <exit>
    printf(stdout, "failed sbrk leaked memory\n");
    43a4:	a1 60 72 00 00       	mov    0x7260,%eax
    43a9:	c7 44 24 04 21 60 00 	movl   $0x6021,0x4(%esp)
    43b0:	00 
    43b1:	89 04 24             	mov    %eax,(%esp)
    43b4:	e8 47 0a 00 00       	call   4e00 <printf>
    exit();
    43b9:	e8 e4 08 00 00       	call   4ca2 <exit>
    printf(1, "pipe() failed\n");
    43be:	c7 44 24 04 dd 54 00 	movl   $0x54dd,0x4(%esp)
    43c5:	00 
    43c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    43cd:	e8 2e 0a 00 00       	call   4e00 <printf>
    exit();
    43d2:	e8 cb 08 00 00       	call   4ca2 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    43d7:	0f be 03             	movsbl (%ebx),%eax
    43da:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    43de:	c7 44 24 04 08 60 00 	movl   $0x6008,0x4(%esp)
    43e5:	00 
    43e6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    43ea:	a1 60 72 00 00       	mov    0x7260,%eax
    43ef:	89 04 24             	mov    %eax,(%esp)
    43f2:	e8 09 0a 00 00       	call   4e00 <printf>
      kill(ppid);
    43f7:	89 34 24             	mov    %esi,(%esp)
    43fa:	e8 d3 08 00 00       	call   4cd2 <kill>
      exit();
    43ff:	e8 9e 08 00 00       	call   4ca2 <exit>
      printf(stdout, "fork failed\n");
    4404:	a1 60 72 00 00       	mov    0x7260,%eax
    4409:	c7 44 24 04 e5 60 00 	movl   $0x60e5,0x4(%esp)
    4410:	00 
    4411:	89 04 24             	mov    %eax,(%esp)
    4414:	e8 e7 09 00 00       	call   4e00 <printf>
      exit();
    4419:	e8 84 08 00 00       	call   4ca2 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    441e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4422:	a1 60 72 00 00       	mov    0x7260,%eax
    4427:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    442b:	c7 44 24 04 e8 67 00 	movl   $0x67e8,0x4(%esp)
    4432:	00 
    4433:	89 04 24             	mov    %eax,(%esp)
    4436:	e8 c5 09 00 00       	call   4e00 <printf>
    exit();
    443b:	e8 62 08 00 00       	call   4ca2 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    4440:	a1 60 72 00 00       	mov    0x7260,%eax
    4445:	c7 44 24 04 b8 67 00 	movl   $0x67b8,0x4(%esp)
    444c:	00 
    444d:	89 04 24             	mov    %eax,(%esp)
    4450:	e8 ab 09 00 00       	call   4e00 <printf>
    exit();
    4455:	e8 48 08 00 00       	call   4ca2 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    445a:	a1 60 72 00 00       	mov    0x7260,%eax
    445f:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    4463:	89 74 24 08          	mov    %esi,0x8(%esp)
    4467:	c7 44 24 04 90 67 00 	movl   $0x6790,0x4(%esp)
    446e:	00 
    446f:	89 04 24             	mov    %eax,(%esp)
    4472:	e8 89 09 00 00       	call   4e00 <printf>
    exit();
    4477:	e8 26 08 00 00       	call   4ca2 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    447c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4480:	a1 60 72 00 00       	mov    0x7260,%eax
    4485:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    4489:	c7 44 24 04 58 67 00 	movl   $0x6758,0x4(%esp)
    4490:	00 
    4491:	89 04 24             	mov    %eax,(%esp)
    4494:	e8 67 09 00 00       	call   4e00 <printf>
    exit();
    4499:	e8 04 08 00 00       	call   4ca2 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    449e:	a1 60 72 00 00       	mov    0x7260,%eax
    44a3:	c7 44 24 04 ed 5f 00 	movl   $0x5fed,0x4(%esp)
    44aa:	00 
    44ab:	89 04 24             	mov    %eax,(%esp)
    44ae:	e8 4d 09 00 00       	call   4e00 <printf>
    exit();
    44b3:	e8 ea 07 00 00       	call   4ca2 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    44b8:	a1 60 72 00 00       	mov    0x7260,%eax
    44bd:	c7 44 24 04 18 67 00 	movl   $0x6718,0x4(%esp)
    44c4:	00 
    44c5:	89 04 24             	mov    %eax,(%esp)
    44c8:	e8 33 09 00 00       	call   4e00 <printf>
    exit();
    44cd:	e8 d0 07 00 00       	call   4ca2 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    44d2:	a1 60 72 00 00       	mov    0x7260,%eax
    44d7:	c7 44 24 04 d1 5f 00 	movl   $0x5fd1,0x4(%esp)
    44de:	00 
    44df:	89 04 24             	mov    %eax,(%esp)
    44e2:	e8 19 09 00 00       	call   4e00 <printf>
    exit();
    44e7:	e8 b6 07 00 00       	call   4ca2 <exit>
    printf(stdout, "sbrk test fork failed\n");
    44ec:	a1 60 72 00 00       	mov    0x7260,%eax
    44f1:	c7 44 24 04 ba 5f 00 	movl   $0x5fba,0x4(%esp)
    44f8:	00 
    44f9:	89 04 24             	mov    %eax,(%esp)
    44fc:	e8 ff 08 00 00       	call   4e00 <printf>
    exit();
    4501:	e8 9c 07 00 00       	call   4ca2 <exit>
    4506:	8d 76 00             	lea    0x0(%esi),%esi
    4509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004510 <validateint>:
{
    4510:	55                   	push   %ebp
    4511:	89 e5                	mov    %esp,%ebp
}
    4513:	5d                   	pop    %ebp
    4514:	c3                   	ret    
    4515:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004520 <validatetest>:
{
    4520:	55                   	push   %ebp
    4521:	89 e5                	mov    %esp,%ebp
    4523:	56                   	push   %esi
    4524:	53                   	push   %ebx
  for(p = 0; p <= (uint)hi; p += 4096){
    4525:	31 db                	xor    %ebx,%ebx
{
    4527:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "validate test\n");
    452a:	a1 60 72 00 00       	mov    0x7260,%eax
    452f:	c7 44 24 04 4a 60 00 	movl   $0x604a,0x4(%esp)
    4536:	00 
    4537:	89 04 24             	mov    %eax,(%esp)
    453a:	e8 c1 08 00 00       	call   4e00 <printf>
    453f:	90                   	nop
    if((pid = fork()) == 0){
    4540:	e8 55 07 00 00       	call   4c9a <fork>
    4545:	85 c0                	test   %eax,%eax
    4547:	89 c6                	mov    %eax,%esi
    4549:	74 79                	je     45c4 <validatetest+0xa4>
    sleep(0);
    454b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4552:	e8 db 07 00 00       	call   4d32 <sleep>
    sleep(0);
    4557:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    455e:	e8 cf 07 00 00       	call   4d32 <sleep>
    kill(pid);
    4563:	89 34 24             	mov    %esi,(%esp)
    4566:	e8 67 07 00 00       	call   4cd2 <kill>
    wait();
    456b:	e8 3a 07 00 00       	call   4caa <wait>
    if(link("nosuchfile", (char*)p) != -1){
    4570:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    4574:	c7 04 24 59 60 00 00 	movl   $0x6059,(%esp)
    457b:	e8 82 07 00 00       	call   4d02 <link>
    4580:	83 f8 ff             	cmp    $0xffffffff,%eax
    4583:	75 2a                	jne    45af <validatetest+0x8f>
  for(p = 0; p <= (uint)hi; p += 4096){
    4585:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    458b:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    4591:	75 ad                	jne    4540 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    4593:	a1 60 72 00 00       	mov    0x7260,%eax
    4598:	c7 44 24 04 7d 60 00 	movl   $0x607d,0x4(%esp)
    459f:	00 
    45a0:	89 04 24             	mov    %eax,(%esp)
    45a3:	e8 58 08 00 00       	call   4e00 <printf>
}
    45a8:	83 c4 10             	add    $0x10,%esp
    45ab:	5b                   	pop    %ebx
    45ac:	5e                   	pop    %esi
    45ad:	5d                   	pop    %ebp
    45ae:	c3                   	ret    
      printf(stdout, "link should not succeed\n");
    45af:	a1 60 72 00 00       	mov    0x7260,%eax
    45b4:	c7 44 24 04 64 60 00 	movl   $0x6064,0x4(%esp)
    45bb:	00 
    45bc:	89 04 24             	mov    %eax,(%esp)
    45bf:	e8 3c 08 00 00       	call   4e00 <printf>
      exit();
    45c4:	e8 d9 06 00 00       	call   4ca2 <exit>
    45c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000045d0 <bsstest>:
{
    45d0:	55                   	push   %ebp
    45d1:	89 e5                	mov    %esp,%ebp
    45d3:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "bss test\n");
    45d6:	a1 60 72 00 00       	mov    0x7260,%eax
    45db:	c7 44 24 04 8a 60 00 	movl   $0x608a,0x4(%esp)
    45e2:	00 
    45e3:	89 04 24             	mov    %eax,(%esp)
    45e6:	e8 15 08 00 00       	call   4e00 <printf>
    if(uninit[i] != '\0'){
    45eb:	80 3d 20 73 00 00 00 	cmpb   $0x0,0x7320
    45f2:	75 36                	jne    462a <bsstest+0x5a>
  for(i = 0; i < sizeof(uninit); i++){
    45f4:	b8 01 00 00 00       	mov    $0x1,%eax
    45f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(uninit[i] != '\0'){
    4600:	80 b8 20 73 00 00 00 	cmpb   $0x0,0x7320(%eax)
    4607:	75 21                	jne    462a <bsstest+0x5a>
  for(i = 0; i < sizeof(uninit); i++){
    4609:	83 c0 01             	add    $0x1,%eax
    460c:	3d 10 27 00 00       	cmp    $0x2710,%eax
    4611:	75 ed                	jne    4600 <bsstest+0x30>
  printf(stdout, "bss test ok\n");
    4613:	a1 60 72 00 00       	mov    0x7260,%eax
    4618:	c7 44 24 04 a5 60 00 	movl   $0x60a5,0x4(%esp)
    461f:	00 
    4620:	89 04 24             	mov    %eax,(%esp)
    4623:	e8 d8 07 00 00       	call   4e00 <printf>
}
    4628:	c9                   	leave  
    4629:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    462a:	a1 60 72 00 00       	mov    0x7260,%eax
    462f:	c7 44 24 04 94 60 00 	movl   $0x6094,0x4(%esp)
    4636:	00 
    4637:	89 04 24             	mov    %eax,(%esp)
    463a:	e8 c1 07 00 00       	call   4e00 <printf>
      exit();
    463f:	e8 5e 06 00 00       	call   4ca2 <exit>
    4644:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    464a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00004650 <bigargtest>:
{
    4650:	55                   	push   %ebp
    4651:	89 e5                	mov    %esp,%ebp
    4653:	83 ec 18             	sub    $0x18,%esp
  unlink("bigarg-ok");
    4656:	c7 04 24 b2 60 00 00 	movl   $0x60b2,(%esp)
    465d:	e8 90 06 00 00       	call   4cf2 <unlink>
  pid = fork();
    4662:	e8 33 06 00 00       	call   4c9a <fork>
  if(pid == 0){
    4667:	85 c0                	test   %eax,%eax
    4669:	74 45                	je     46b0 <bigargtest+0x60>
    466b:	90                   	nop
    466c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else if(pid < 0){
    4670:	0f 88 d0 00 00 00    	js     4746 <bigargtest+0xf6>
  wait();
    4676:	e8 2f 06 00 00       	call   4caa <wait>
  fd = open("bigarg-ok", 0);
    467b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4682:	00 
    4683:	c7 04 24 b2 60 00 00 	movl   $0x60b2,(%esp)
    468a:	e8 53 06 00 00       	call   4ce2 <open>
  if(fd < 0){
    468f:	85 c0                	test   %eax,%eax
    4691:	0f 88 95 00 00 00    	js     472c <bigargtest+0xdc>
  close(fd);
    4697:	89 04 24             	mov    %eax,(%esp)
    469a:	e8 2b 06 00 00       	call   4cca <close>
  unlink("bigarg-ok");
    469f:	c7 04 24 b2 60 00 00 	movl   $0x60b2,(%esp)
    46a6:	e8 47 06 00 00       	call   4cf2 <unlink>
}
    46ab:	c9                   	leave  
    46ac:	c3                   	ret    
    46ad:	8d 76 00             	lea    0x0(%esi),%esi
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    46b0:	c7 04 85 80 72 00 00 	movl   $0x680c,0x7280(,%eax,4)
    46b7:	0c 68 00 00 
    for(i = 0; i < MAXARG-1; i++)
    46bb:	83 c0 01             	add    $0x1,%eax
    46be:	83 f8 1f             	cmp    $0x1f,%eax
    46c1:	75 ed                	jne    46b0 <bigargtest+0x60>
    printf(stdout, "bigarg test\n");
    46c3:	a1 60 72 00 00       	mov    0x7260,%eax
    46c8:	c7 44 24 04 bc 60 00 	movl   $0x60bc,0x4(%esp)
    46cf:	00 
    args[MAXARG-1] = 0;
    46d0:	c7 05 fc 72 00 00 00 	movl   $0x0,0x72fc
    46d7:	00 00 00 
    printf(stdout, "bigarg test\n");
    46da:	89 04 24             	mov    %eax,(%esp)
    46dd:	e8 1e 07 00 00       	call   4e00 <printf>
    exec("echo", args);
    46e2:	c7 44 24 04 80 72 00 	movl   $0x7280,0x4(%esp)
    46e9:	00 
    46ea:	c7 04 24 89 52 00 00 	movl   $0x5289,(%esp)
    46f1:	e8 e4 05 00 00       	call   4cda <exec>
    printf(stdout, "bigarg test ok\n");
    46f6:	a1 60 72 00 00       	mov    0x7260,%eax
    46fb:	c7 44 24 04 c9 60 00 	movl   $0x60c9,0x4(%esp)
    4702:	00 
    4703:	89 04 24             	mov    %eax,(%esp)
    4706:	e8 f5 06 00 00       	call   4e00 <printf>
    fd = open("bigarg-ok", O_CREATE);
    470b:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    4712:	00 
    4713:	c7 04 24 b2 60 00 00 	movl   $0x60b2,(%esp)
    471a:	e8 c3 05 00 00       	call   4ce2 <open>
    close(fd);
    471f:	89 04 24             	mov    %eax,(%esp)
    4722:	e8 a3 05 00 00       	call   4cca <close>
    exit();
    4727:	e8 76 05 00 00       	call   4ca2 <exit>
    printf(stdout, "bigarg test failed!\n");
    472c:	a1 60 72 00 00       	mov    0x7260,%eax
    4731:	c7 44 24 04 f2 60 00 	movl   $0x60f2,0x4(%esp)
    4738:	00 
    4739:	89 04 24             	mov    %eax,(%esp)
    473c:	e8 bf 06 00 00       	call   4e00 <printf>
    exit();
    4741:	e8 5c 05 00 00       	call   4ca2 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    4746:	a1 60 72 00 00       	mov    0x7260,%eax
    474b:	c7 44 24 04 d9 60 00 	movl   $0x60d9,0x4(%esp)
    4752:	00 
    4753:	89 04 24             	mov    %eax,(%esp)
    4756:	e8 a5 06 00 00       	call   4e00 <printf>
    exit();
    475b:	e8 42 05 00 00       	call   4ca2 <exit>

00004760 <fsfull>:
{
    4760:	55                   	push   %ebp
    4761:	89 e5                	mov    %esp,%ebp
    4763:	57                   	push   %edi
    4764:	56                   	push   %esi
    4765:	53                   	push   %ebx
  for(nfiles = 0; ; nfiles++){
    4766:	31 db                	xor    %ebx,%ebx
{
    4768:	83 ec 5c             	sub    $0x5c,%esp
  printf(1, "fsfull test\n");
    476b:	c7 44 24 04 07 61 00 	movl   $0x6107,0x4(%esp)
    4772:	00 
    4773:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    477a:	e8 81 06 00 00       	call   4e00 <printf>
    477f:	90                   	nop
    name[1] = '0' + nfiles / 1000;
    4780:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    4785:	89 d9                	mov    %ebx,%ecx
    4787:	f7 eb                	imul   %ebx
    name[2] = '0' + (nfiles % 1000) / 100;
    4789:	89 de                	mov    %ebx,%esi
    name[1] = '0' + nfiles / 1000;
    478b:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    478e:	89 df                	mov    %ebx,%edi
    printf(1, "writing %s\n", name);
    4790:	c7 44 24 04 14 61 00 	movl   $0x6114,0x4(%esp)
    4797:	00 
    4798:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    name[1] = '0' + nfiles / 1000;
    479f:	c1 fa 06             	sar    $0x6,%edx
    47a2:	29 ca                	sub    %ecx,%edx
    47a4:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    47a7:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    47ad:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    47b0:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[0] = 'f';
    47b5:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    47b9:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    47bd:	29 d6                	sub    %edx,%esi
    47bf:	f7 ee                	imul   %esi
    name[3] = '0' + (nfiles % 100) / 10;
    47c1:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    47c6:	c1 fe 1f             	sar    $0x1f,%esi
    47c9:	c1 fa 05             	sar    $0x5,%edx
    47cc:	29 f2                	sub    %esi,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    47ce:	be 67 66 66 66       	mov    $0x66666667,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    47d3:	83 c2 30             	add    $0x30,%edx
    47d6:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    47d9:	f7 eb                	imul   %ebx
    47db:	c1 fa 05             	sar    $0x5,%edx
    47de:	29 ca                	sub    %ecx,%edx
    47e0:	6b d2 64             	imul   $0x64,%edx,%edx
    47e3:	29 d7                	sub    %edx,%edi
    47e5:	89 f8                	mov    %edi,%eax
    47e7:	f7 ee                	imul   %esi
    name[4] = '0' + (nfiles % 10);
    47e9:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    47eb:	c1 ff 1f             	sar    $0x1f,%edi
    47ee:	c1 fa 02             	sar    $0x2,%edx
    47f1:	29 fa                	sub    %edi,%edx
    47f3:	83 c2 30             	add    $0x30,%edx
    47f6:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    47f9:	f7 ee                	imul   %esi
    47fb:	c1 fa 02             	sar    $0x2,%edx
    47fe:	29 ca                	sub    %ecx,%edx
    4800:	89 d9                	mov    %ebx,%ecx
    4802:	8d 04 92             	lea    (%edx,%edx,4),%eax
    4805:	01 c0                	add    %eax,%eax
    4807:	29 c1                	sub    %eax,%ecx
    4809:	89 c8                	mov    %ecx,%eax
    480b:	83 c0 30             	add    $0x30,%eax
    480e:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    4811:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4814:	89 44 24 08          	mov    %eax,0x8(%esp)
    4818:	e8 e3 05 00 00       	call   4e00 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    481d:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4820:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    4827:	00 
    4828:	89 04 24             	mov    %eax,(%esp)
    482b:	e8 b2 04 00 00       	call   4ce2 <open>
    if(fd < 0){
    4830:	85 c0                	test   %eax,%eax
    int fd = open(name, O_CREATE|O_RDWR);
    4832:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    4834:	78 57                	js     488d <fsfull+0x12d>
    4836:	31 f6                	xor    %esi,%esi
    4838:	eb 08                	jmp    4842 <fsfull+0xe2>
    483a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      total += cc;
    4840:	01 c6                	add    %eax,%esi
      int cc = write(fd, buf, 512);
    4842:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    4849:	00 
    484a:	c7 44 24 04 40 9a 00 	movl   $0x9a40,0x4(%esp)
    4851:	00 
    4852:	89 3c 24             	mov    %edi,(%esp)
    4855:	e8 68 04 00 00       	call   4cc2 <write>
      if(cc < 512)
    485a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    485f:	7f df                	jg     4840 <fsfull+0xe0>
    printf(1, "wrote %d bytes\n", total);
    4861:	89 74 24 08          	mov    %esi,0x8(%esp)
    4865:	c7 44 24 04 30 61 00 	movl   $0x6130,0x4(%esp)
    486c:	00 
    486d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4874:	e8 87 05 00 00       	call   4e00 <printf>
    close(fd);
    4879:	89 3c 24             	mov    %edi,(%esp)
    487c:	e8 49 04 00 00       	call   4cca <close>
    if(total == 0)
    4881:	85 f6                	test   %esi,%esi
    4883:	74 23                	je     48a8 <fsfull+0x148>
  for(nfiles = 0; ; nfiles++){
    4885:	83 c3 01             	add    $0x1,%ebx
  }
    4888:	e9 f3 fe ff ff       	jmp    4780 <fsfull+0x20>
      printf(1, "open %s failed\n", name);
    488d:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4890:	89 44 24 08          	mov    %eax,0x8(%esp)
    4894:	c7 44 24 04 20 61 00 	movl   $0x6120,0x4(%esp)
    489b:	00 
    489c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    48a3:	e8 58 05 00 00       	call   4e00 <printf>
    name[1] = '0' + nfiles / 1000;
    48a8:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    48ad:	89 d9                	mov    %ebx,%ecx
    48af:	f7 eb                	imul   %ebx
    name[2] = '0' + (nfiles % 1000) / 100;
    48b1:	89 de                	mov    %ebx,%esi
    name[1] = '0' + nfiles / 1000;
    48b3:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    48b6:	89 df                	mov    %ebx,%edi
    name[0] = 'f';
    48b8:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    48bc:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    48c0:	c1 fa 06             	sar    $0x6,%edx
    48c3:	29 ca                	sub    %ecx,%edx
    48c5:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    48c8:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    48ce:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    48d1:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    48d6:	29 d6                	sub    %edx,%esi
    48d8:	f7 ee                	imul   %esi
    name[3] = '0' + (nfiles % 100) / 10;
    48da:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    48df:	c1 fe 1f             	sar    $0x1f,%esi
    48e2:	c1 fa 05             	sar    $0x5,%edx
    48e5:	29 f2                	sub    %esi,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    48e7:	be 67 66 66 66       	mov    $0x66666667,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    48ec:	83 c2 30             	add    $0x30,%edx
    48ef:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    48f2:	f7 eb                	imul   %ebx
    48f4:	c1 fa 05             	sar    $0x5,%edx
    48f7:	29 ca                	sub    %ecx,%edx
    48f9:	6b d2 64             	imul   $0x64,%edx,%edx
    48fc:	29 d7                	sub    %edx,%edi
    48fe:	89 f8                	mov    %edi,%eax
    4900:	f7 ee                	imul   %esi
    name[4] = '0' + (nfiles % 10);
    4902:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    4904:	c1 ff 1f             	sar    $0x1f,%edi
    4907:	c1 fa 02             	sar    $0x2,%edx
    490a:	29 fa                	sub    %edi,%edx
    490c:	83 c2 30             	add    $0x30,%edx
    490f:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    4912:	f7 ee                	imul   %esi
    4914:	c1 fa 02             	sar    $0x2,%edx
    4917:	29 ca                	sub    %ecx,%edx
    4919:	89 d9                	mov    %ebx,%ecx
    491b:	8d 04 92             	lea    (%edx,%edx,4),%eax
    nfiles--;
    491e:	83 eb 01             	sub    $0x1,%ebx
    name[4] = '0' + (nfiles % 10);
    4921:	01 c0                	add    %eax,%eax
    4923:	29 c1                	sub    %eax,%ecx
    4925:	89 c8                	mov    %ecx,%eax
    4927:	83 c0 30             	add    $0x30,%eax
    492a:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    492d:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4930:	89 04 24             	mov    %eax,(%esp)
    4933:	e8 ba 03 00 00       	call   4cf2 <unlink>
  while(nfiles >= 0){
    4938:	83 fb ff             	cmp    $0xffffffff,%ebx
    493b:	0f 85 67 ff ff ff    	jne    48a8 <fsfull+0x148>
  printf(1, "fsfull test finished\n");
    4941:	c7 44 24 04 40 61 00 	movl   $0x6140,0x4(%esp)
    4948:	00 
    4949:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4950:	e8 ab 04 00 00       	call   4e00 <printf>
}
    4955:	83 c4 5c             	add    $0x5c,%esp
    4958:	5b                   	pop    %ebx
    4959:	5e                   	pop    %esi
    495a:	5f                   	pop    %edi
    495b:	5d                   	pop    %ebp
    495c:	c3                   	ret    
    495d:	8d 76 00             	lea    0x0(%esi),%esi

00004960 <uio>:
{
    4960:	55                   	push   %ebp
    4961:	89 e5                	mov    %esp,%ebp
    4963:	83 ec 18             	sub    $0x18,%esp
  printf(1, "uio test\n");
    4966:	c7 44 24 04 56 61 00 	movl   $0x6156,0x4(%esp)
    496d:	00 
    496e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4975:	e8 86 04 00 00       	call   4e00 <printf>
  pid = fork();
    497a:	e8 1b 03 00 00       	call   4c9a <fork>
  if(pid == 0){
    497f:	85 c0                	test   %eax,%eax
    4981:	74 1d                	je     49a0 <uio+0x40>
  } else if(pid < 0){
    4983:	78 42                	js     49c7 <uio+0x67>
  wait();
    4985:	e8 20 03 00 00       	call   4caa <wait>
  printf(1, "uio test done\n");
    498a:	c7 44 24 04 60 61 00 	movl   $0x6160,0x4(%esp)
    4991:	00 
    4992:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4999:	e8 62 04 00 00       	call   4e00 <printf>
}
    499e:	c9                   	leave  
    499f:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    49a0:	ba 70 00 00 00       	mov    $0x70,%edx
    49a5:	b8 09 00 00 00       	mov    $0x9,%eax
    49aa:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    49ab:	b2 71                	mov    $0x71,%dl
    49ad:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    49ae:	c7 44 24 04 ec 68 00 	movl   $0x68ec,0x4(%esp)
    49b5:	00 
    49b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    49bd:	e8 3e 04 00 00       	call   4e00 <printf>
    exit();
    49c2:	e8 db 02 00 00       	call   4ca2 <exit>
    printf (1, "fork failed\n");
    49c7:	c7 44 24 04 e5 60 00 	movl   $0x60e5,0x4(%esp)
    49ce:	00 
    49cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    49d6:	e8 25 04 00 00       	call   4e00 <printf>
    exit();
    49db:	e8 c2 02 00 00       	call   4ca2 <exit>

000049e0 <argptest>:
{
    49e0:	55                   	push   %ebp
    49e1:	89 e5                	mov    %esp,%ebp
    49e3:	53                   	push   %ebx
    49e4:	83 ec 14             	sub    $0x14,%esp
  fd = open("init", O_RDONLY);
    49e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    49ee:	00 
    49ef:	c7 04 24 6f 61 00 00 	movl   $0x616f,(%esp)
    49f6:	e8 e7 02 00 00       	call   4ce2 <open>
  if (fd < 0) {
    49fb:	85 c0                	test   %eax,%eax
  fd = open("init", O_RDONLY);
    49fd:	89 c3                	mov    %eax,%ebx
  if (fd < 0) {
    49ff:	78 45                	js     4a46 <argptest+0x66>
  read(fd, sbrk(0) - 1, -1);
    4a01:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a08:	e8 1d 03 00 00       	call   4d2a <sbrk>
    4a0d:	89 1c 24             	mov    %ebx,(%esp)
    4a10:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
    4a17:	ff 
    4a18:	83 e8 01             	sub    $0x1,%eax
    4a1b:	89 44 24 04          	mov    %eax,0x4(%esp)
    4a1f:	e8 96 02 00 00       	call   4cba <read>
  close(fd);
    4a24:	89 1c 24             	mov    %ebx,(%esp)
    4a27:	e8 9e 02 00 00       	call   4cca <close>
  printf(1, "arg test passed\n");
    4a2c:	c7 44 24 04 81 61 00 	movl   $0x6181,0x4(%esp)
    4a33:	00 
    4a34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4a3b:	e8 c0 03 00 00       	call   4e00 <printf>
}
    4a40:	83 c4 14             	add    $0x14,%esp
    4a43:	5b                   	pop    %ebx
    4a44:	5d                   	pop    %ebp
    4a45:	c3                   	ret    
    printf(2, "open failed\n");
    4a46:	c7 44 24 04 74 61 00 	movl   $0x6174,0x4(%esp)
    4a4d:	00 
    4a4e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    4a55:	e8 a6 03 00 00       	call   4e00 <printf>
    exit();
    4a5a:	e8 43 02 00 00       	call   4ca2 <exit>
    4a5f:	90                   	nop

00004a60 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    4a60:	69 05 5c 72 00 00 0d 	imul   $0x19660d,0x725c,%eax
    4a67:	66 19 00 
{
    4a6a:	55                   	push   %ebp
    4a6b:	89 e5                	mov    %esp,%ebp
}
    4a6d:	5d                   	pop    %ebp
  randstate = randstate * 1664525 + 1013904223;
    4a6e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    4a73:	a3 5c 72 00 00       	mov    %eax,0x725c
}
    4a78:	c3                   	ret    
    4a79:	66 90                	xchg   %ax,%ax
    4a7b:	66 90                	xchg   %ax,%ax
    4a7d:	66 90                	xchg   %ax,%ax
    4a7f:	90                   	nop

00004a80 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    4a80:	55                   	push   %ebp
    4a81:	89 e5                	mov    %esp,%ebp
    4a83:	8b 45 08             	mov    0x8(%ebp),%eax
    4a86:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    4a89:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    4a8a:	89 c2                	mov    %eax,%edx
    4a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    4a90:	83 c1 01             	add    $0x1,%ecx
    4a93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    4a97:	83 c2 01             	add    $0x1,%edx
    4a9a:	84 db                	test   %bl,%bl
    4a9c:	88 5a ff             	mov    %bl,-0x1(%edx)
    4a9f:	75 ef                	jne    4a90 <strcpy+0x10>
    ;
  return os;
}
    4aa1:	5b                   	pop    %ebx
    4aa2:	5d                   	pop    %ebp
    4aa3:	c3                   	ret    
    4aa4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4aaa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00004ab0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4ab0:	55                   	push   %ebp
    4ab1:	89 e5                	mov    %esp,%ebp
    4ab3:	8b 55 08             	mov    0x8(%ebp),%edx
    4ab6:	53                   	push   %ebx
    4ab7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    4aba:	0f b6 02             	movzbl (%edx),%eax
    4abd:	84 c0                	test   %al,%al
    4abf:	74 2d                	je     4aee <strcmp+0x3e>
    4ac1:	0f b6 19             	movzbl (%ecx),%ebx
    4ac4:	38 d8                	cmp    %bl,%al
    4ac6:	74 0e                	je     4ad6 <strcmp+0x26>
    4ac8:	eb 2b                	jmp    4af5 <strcmp+0x45>
    4aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4ad0:	38 c8                	cmp    %cl,%al
    4ad2:	75 15                	jne    4ae9 <strcmp+0x39>
    p++, q++;
    4ad4:	89 d9                	mov    %ebx,%ecx
    4ad6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    4ad9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    4adc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    4adf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    4ae3:	84 c0                	test   %al,%al
    4ae5:	75 e9                	jne    4ad0 <strcmp+0x20>
    4ae7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    4ae9:	29 c8                	sub    %ecx,%eax
}
    4aeb:	5b                   	pop    %ebx
    4aec:	5d                   	pop    %ebp
    4aed:	c3                   	ret    
    4aee:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    4af1:	31 c0                	xor    %eax,%eax
    4af3:	eb f4                	jmp    4ae9 <strcmp+0x39>
    4af5:	0f b6 cb             	movzbl %bl,%ecx
    4af8:	eb ef                	jmp    4ae9 <strcmp+0x39>
    4afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00004b00 <strlen>:

uint
strlen(char *s)
{
    4b00:	55                   	push   %ebp
    4b01:	89 e5                	mov    %esp,%ebp
    4b03:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    4b06:	80 39 00             	cmpb   $0x0,(%ecx)
    4b09:	74 12                	je     4b1d <strlen+0x1d>
    4b0b:	31 d2                	xor    %edx,%edx
    4b0d:	8d 76 00             	lea    0x0(%esi),%esi
    4b10:	83 c2 01             	add    $0x1,%edx
    4b13:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    4b17:	89 d0                	mov    %edx,%eax
    4b19:	75 f5                	jne    4b10 <strlen+0x10>
    ;
  return n;
}
    4b1b:	5d                   	pop    %ebp
    4b1c:	c3                   	ret    
  for(n = 0; s[n]; n++)
    4b1d:	31 c0                	xor    %eax,%eax
}
    4b1f:	5d                   	pop    %ebp
    4b20:	c3                   	ret    
    4b21:	eb 0d                	jmp    4b30 <memset>
    4b23:	90                   	nop
    4b24:	90                   	nop
    4b25:	90                   	nop
    4b26:	90                   	nop
    4b27:	90                   	nop
    4b28:	90                   	nop
    4b29:	90                   	nop
    4b2a:	90                   	nop
    4b2b:	90                   	nop
    4b2c:	90                   	nop
    4b2d:	90                   	nop
    4b2e:	90                   	nop
    4b2f:	90                   	nop

00004b30 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4b30:	55                   	push   %ebp
    4b31:	89 e5                	mov    %esp,%ebp
    4b33:	8b 55 08             	mov    0x8(%ebp),%edx
    4b36:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    4b37:	8b 4d 10             	mov    0x10(%ebp),%ecx
    4b3a:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b3d:	89 d7                	mov    %edx,%edi
    4b3f:	fc                   	cld    
    4b40:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    4b42:	89 d0                	mov    %edx,%eax
    4b44:	5f                   	pop    %edi
    4b45:	5d                   	pop    %ebp
    4b46:	c3                   	ret    
    4b47:	89 f6                	mov    %esi,%esi
    4b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004b50 <strchr>:

char*
strchr(const char *s, char c)
{
    4b50:	55                   	push   %ebp
    4b51:	89 e5                	mov    %esp,%ebp
    4b53:	8b 45 08             	mov    0x8(%ebp),%eax
    4b56:	53                   	push   %ebx
    4b57:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    4b5a:	0f b6 18             	movzbl (%eax),%ebx
    4b5d:	84 db                	test   %bl,%bl
    4b5f:	74 1d                	je     4b7e <strchr+0x2e>
    if(*s == c)
    4b61:	38 d3                	cmp    %dl,%bl
    4b63:	89 d1                	mov    %edx,%ecx
    4b65:	75 0d                	jne    4b74 <strchr+0x24>
    4b67:	eb 17                	jmp    4b80 <strchr+0x30>
    4b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4b70:	38 ca                	cmp    %cl,%dl
    4b72:	74 0c                	je     4b80 <strchr+0x30>
  for(; *s; s++)
    4b74:	83 c0 01             	add    $0x1,%eax
    4b77:	0f b6 10             	movzbl (%eax),%edx
    4b7a:	84 d2                	test   %dl,%dl
    4b7c:	75 f2                	jne    4b70 <strchr+0x20>
      return (char*)s;
  return 0;
    4b7e:	31 c0                	xor    %eax,%eax
}
    4b80:	5b                   	pop    %ebx
    4b81:	5d                   	pop    %ebp
    4b82:	c3                   	ret    
    4b83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004b90 <gets>:

char*
gets(char *buf, int max)
{
    4b90:	55                   	push   %ebp
    4b91:	89 e5                	mov    %esp,%ebp
    4b93:	57                   	push   %edi
    4b94:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4b95:	31 f6                	xor    %esi,%esi
{
    4b97:	53                   	push   %ebx
    4b98:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    4b9b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    4b9e:	eb 31                	jmp    4bd1 <gets+0x41>
    cc = read(0, &c, 1);
    4ba0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4ba7:	00 
    4ba8:	89 7c 24 04          	mov    %edi,0x4(%esp)
    4bac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4bb3:	e8 02 01 00 00       	call   4cba <read>
    if(cc < 1)
    4bb8:	85 c0                	test   %eax,%eax
    4bba:	7e 1d                	jle    4bd9 <gets+0x49>
      break;
    buf[i++] = c;
    4bbc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    4bc0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    4bc2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    4bc5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    4bc7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    4bcb:	74 0c                	je     4bd9 <gets+0x49>
    4bcd:	3c 0a                	cmp    $0xa,%al
    4bcf:	74 08                	je     4bd9 <gets+0x49>
  for(i=0; i+1 < max; ){
    4bd1:	8d 5e 01             	lea    0x1(%esi),%ebx
    4bd4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    4bd7:	7c c7                	jl     4ba0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    4bd9:	8b 45 08             	mov    0x8(%ebp),%eax
    4bdc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    4be0:	83 c4 2c             	add    $0x2c,%esp
    4be3:	5b                   	pop    %ebx
    4be4:	5e                   	pop    %esi
    4be5:	5f                   	pop    %edi
    4be6:	5d                   	pop    %ebp
    4be7:	c3                   	ret    
    4be8:	90                   	nop
    4be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004bf0 <stat>:

int
stat(char *n, struct stat *st)
{
    4bf0:	55                   	push   %ebp
    4bf1:	89 e5                	mov    %esp,%ebp
    4bf3:	56                   	push   %esi
    4bf4:	53                   	push   %ebx
    4bf5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4bf8:	8b 45 08             	mov    0x8(%ebp),%eax
    4bfb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4c02:	00 
    4c03:	89 04 24             	mov    %eax,(%esp)
    4c06:	e8 d7 00 00 00       	call   4ce2 <open>
  if(fd < 0)
    4c0b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    4c0d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    4c0f:	78 27                	js     4c38 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    4c11:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c14:	89 1c 24             	mov    %ebx,(%esp)
    4c17:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c1b:	e8 da 00 00 00       	call   4cfa <fstat>
  close(fd);
    4c20:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    4c23:	89 c6                	mov    %eax,%esi
  close(fd);
    4c25:	e8 a0 00 00 00       	call   4cca <close>
  return r;
    4c2a:	89 f0                	mov    %esi,%eax
}
    4c2c:	83 c4 10             	add    $0x10,%esp
    4c2f:	5b                   	pop    %ebx
    4c30:	5e                   	pop    %esi
    4c31:	5d                   	pop    %ebp
    4c32:	c3                   	ret    
    4c33:	90                   	nop
    4c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    4c38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4c3d:	eb ed                	jmp    4c2c <stat+0x3c>
    4c3f:	90                   	nop

00004c40 <atoi>:

int
atoi(const char *s)
{
    4c40:	55                   	push   %ebp
    4c41:	89 e5                	mov    %esp,%ebp
    4c43:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4c46:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4c47:	0f be 11             	movsbl (%ecx),%edx
    4c4a:	8d 42 d0             	lea    -0x30(%edx),%eax
    4c4d:	3c 09                	cmp    $0x9,%al
  n = 0;
    4c4f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    4c54:	77 17                	ja     4c6d <atoi+0x2d>
    4c56:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    4c58:	83 c1 01             	add    $0x1,%ecx
    4c5b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    4c5e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    4c62:	0f be 11             	movsbl (%ecx),%edx
    4c65:	8d 5a d0             	lea    -0x30(%edx),%ebx
    4c68:	80 fb 09             	cmp    $0x9,%bl
    4c6b:	76 eb                	jbe    4c58 <atoi+0x18>
  return n;
}
    4c6d:	5b                   	pop    %ebx
    4c6e:	5d                   	pop    %ebp
    4c6f:	c3                   	ret    

00004c70 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4c70:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    4c71:	31 d2                	xor    %edx,%edx
{
    4c73:	89 e5                	mov    %esp,%ebp
    4c75:	56                   	push   %esi
    4c76:	8b 45 08             	mov    0x8(%ebp),%eax
    4c79:	53                   	push   %ebx
    4c7a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4c7d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    4c80:	85 db                	test   %ebx,%ebx
    4c82:	7e 12                	jle    4c96 <memmove+0x26>
    4c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    4c88:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    4c8c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    4c8f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    4c92:	39 da                	cmp    %ebx,%edx
    4c94:	75 f2                	jne    4c88 <memmove+0x18>
  return vdst;
}
    4c96:	5b                   	pop    %ebx
    4c97:	5e                   	pop    %esi
    4c98:	5d                   	pop    %ebp
    4c99:	c3                   	ret    

00004c9a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4c9a:	b8 01 00 00 00       	mov    $0x1,%eax
    4c9f:	cd 40                	int    $0x40
    4ca1:	c3                   	ret    

00004ca2 <exit>:
SYSCALL(exit)
    4ca2:	b8 02 00 00 00       	mov    $0x2,%eax
    4ca7:	cd 40                	int    $0x40
    4ca9:	c3                   	ret    

00004caa <wait>:
SYSCALL(wait)
    4caa:	b8 03 00 00 00       	mov    $0x3,%eax
    4caf:	cd 40                	int    $0x40
    4cb1:	c3                   	ret    

00004cb2 <pipe>:
SYSCALL(pipe)
    4cb2:	b8 04 00 00 00       	mov    $0x4,%eax
    4cb7:	cd 40                	int    $0x40
    4cb9:	c3                   	ret    

00004cba <read>:
SYSCALL(read)
    4cba:	b8 05 00 00 00       	mov    $0x5,%eax
    4cbf:	cd 40                	int    $0x40
    4cc1:	c3                   	ret    

00004cc2 <write>:
SYSCALL(write)
    4cc2:	b8 10 00 00 00       	mov    $0x10,%eax
    4cc7:	cd 40                	int    $0x40
    4cc9:	c3                   	ret    

00004cca <close>:
SYSCALL(close)
    4cca:	b8 15 00 00 00       	mov    $0x15,%eax
    4ccf:	cd 40                	int    $0x40
    4cd1:	c3                   	ret    

00004cd2 <kill>:
SYSCALL(kill)
    4cd2:	b8 06 00 00 00       	mov    $0x6,%eax
    4cd7:	cd 40                	int    $0x40
    4cd9:	c3                   	ret    

00004cda <exec>:
SYSCALL(exec)
    4cda:	b8 07 00 00 00       	mov    $0x7,%eax
    4cdf:	cd 40                	int    $0x40
    4ce1:	c3                   	ret    

00004ce2 <open>:
SYSCALL(open)
    4ce2:	b8 0f 00 00 00       	mov    $0xf,%eax
    4ce7:	cd 40                	int    $0x40
    4ce9:	c3                   	ret    

00004cea <mknod>:
SYSCALL(mknod)
    4cea:	b8 11 00 00 00       	mov    $0x11,%eax
    4cef:	cd 40                	int    $0x40
    4cf1:	c3                   	ret    

00004cf2 <unlink>:
SYSCALL(unlink)
    4cf2:	b8 12 00 00 00       	mov    $0x12,%eax
    4cf7:	cd 40                	int    $0x40
    4cf9:	c3                   	ret    

00004cfa <fstat>:
SYSCALL(fstat)
    4cfa:	b8 08 00 00 00       	mov    $0x8,%eax
    4cff:	cd 40                	int    $0x40
    4d01:	c3                   	ret    

00004d02 <link>:
SYSCALL(link)
    4d02:	b8 13 00 00 00       	mov    $0x13,%eax
    4d07:	cd 40                	int    $0x40
    4d09:	c3                   	ret    

00004d0a <mkdir>:
SYSCALL(mkdir)
    4d0a:	b8 14 00 00 00       	mov    $0x14,%eax
    4d0f:	cd 40                	int    $0x40
    4d11:	c3                   	ret    

00004d12 <chdir>:
SYSCALL(chdir)
    4d12:	b8 09 00 00 00       	mov    $0x9,%eax
    4d17:	cd 40                	int    $0x40
    4d19:	c3                   	ret    

00004d1a <dup>:
SYSCALL(dup)
    4d1a:	b8 0a 00 00 00       	mov    $0xa,%eax
    4d1f:	cd 40                	int    $0x40
    4d21:	c3                   	ret    

00004d22 <getpid>:
SYSCALL(getpid)
    4d22:	b8 0b 00 00 00       	mov    $0xb,%eax
    4d27:	cd 40                	int    $0x40
    4d29:	c3                   	ret    

00004d2a <sbrk>:
SYSCALL(sbrk)
    4d2a:	b8 0c 00 00 00       	mov    $0xc,%eax
    4d2f:	cd 40                	int    $0x40
    4d31:	c3                   	ret    

00004d32 <sleep>:
SYSCALL(sleep)
    4d32:	b8 0d 00 00 00       	mov    $0xd,%eax
    4d37:	cd 40                	int    $0x40
    4d39:	c3                   	ret    

00004d3a <uptime>:
SYSCALL(uptime)
    4d3a:	b8 0e 00 00 00       	mov    $0xe,%eax
    4d3f:	cd 40                	int    $0x40
    4d41:	c3                   	ret    

00004d42 <shm_open>:
SYSCALL(shm_open)
    4d42:	b8 16 00 00 00       	mov    $0x16,%eax
    4d47:	cd 40                	int    $0x40
    4d49:	c3                   	ret    

00004d4a <shm_close>:
SYSCALL(shm_close)	
    4d4a:	b8 17 00 00 00       	mov    $0x17,%eax
    4d4f:	cd 40                	int    $0x40
    4d51:	c3                   	ret    
    4d52:	66 90                	xchg   %ax,%ax
    4d54:	66 90                	xchg   %ax,%ax
    4d56:	66 90                	xchg   %ax,%ax
    4d58:	66 90                	xchg   %ax,%ax
    4d5a:	66 90                	xchg   %ax,%ax
    4d5c:	66 90                	xchg   %ax,%ax
    4d5e:	66 90                	xchg   %ax,%ax

00004d60 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    4d60:	55                   	push   %ebp
    4d61:	89 e5                	mov    %esp,%ebp
    4d63:	57                   	push   %edi
    4d64:	56                   	push   %esi
    4d65:	89 c6                	mov    %eax,%esi
    4d67:	53                   	push   %ebx
    4d68:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    4d6b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    4d6e:	85 db                	test   %ebx,%ebx
    4d70:	74 09                	je     4d7b <printint+0x1b>
    4d72:	89 d0                	mov    %edx,%eax
    4d74:	c1 e8 1f             	shr    $0x1f,%eax
    4d77:	84 c0                	test   %al,%al
    4d79:	75 75                	jne    4df0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    4d7b:	89 d0                	mov    %edx,%eax
  neg = 0;
    4d7d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    4d84:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    4d87:	31 ff                	xor    %edi,%edi
    4d89:	89 ce                	mov    %ecx,%esi
    4d8b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    4d8e:	eb 02                	jmp    4d92 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    4d90:	89 cf                	mov    %ecx,%edi
    4d92:	31 d2                	xor    %edx,%edx
    4d94:	f7 f6                	div    %esi
    4d96:	8d 4f 01             	lea    0x1(%edi),%ecx
    4d99:	0f b6 92 43 69 00 00 	movzbl 0x6943(%edx),%edx
  }while((x /= base) != 0);
    4da0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    4da2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    4da5:	75 e9                	jne    4d90 <printint+0x30>
  if(neg)
    4da7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    4daa:	89 c8                	mov    %ecx,%eax
    4dac:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    4daf:	85 d2                	test   %edx,%edx
    4db1:	74 08                	je     4dbb <printint+0x5b>
    buf[i++] = '-';
    4db3:	8d 4f 02             	lea    0x2(%edi),%ecx
    4db6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    4dbb:	8d 79 ff             	lea    -0x1(%ecx),%edi
    4dbe:	66 90                	xchg   %ax,%ax
    4dc0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    4dc5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    4dc8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4dcf:	00 
    4dd0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    4dd4:	89 34 24             	mov    %esi,(%esp)
    4dd7:	88 45 d7             	mov    %al,-0x29(%ebp)
    4dda:	e8 e3 fe ff ff       	call   4cc2 <write>
  while(--i >= 0)
    4ddf:	83 ff ff             	cmp    $0xffffffff,%edi
    4de2:	75 dc                	jne    4dc0 <printint+0x60>
    putc(fd, buf[i]);
}
    4de4:	83 c4 4c             	add    $0x4c,%esp
    4de7:	5b                   	pop    %ebx
    4de8:	5e                   	pop    %esi
    4de9:	5f                   	pop    %edi
    4dea:	5d                   	pop    %ebp
    4deb:	c3                   	ret    
    4dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    4df0:	89 d0                	mov    %edx,%eax
    4df2:	f7 d8                	neg    %eax
    neg = 1;
    4df4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    4dfb:	eb 87                	jmp    4d84 <printint+0x24>
    4dfd:	8d 76 00             	lea    0x0(%esi),%esi

00004e00 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4e00:	55                   	push   %ebp
    4e01:	89 e5                	mov    %esp,%ebp
    4e03:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    4e04:	31 ff                	xor    %edi,%edi
{
    4e06:	56                   	push   %esi
    4e07:	53                   	push   %ebx
    4e08:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4e0b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    4e0e:	8d 45 10             	lea    0x10(%ebp),%eax
{
    4e11:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    4e14:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    4e17:	0f b6 13             	movzbl (%ebx),%edx
    4e1a:	83 c3 01             	add    $0x1,%ebx
    4e1d:	84 d2                	test   %dl,%dl
    4e1f:	75 39                	jne    4e5a <printf+0x5a>
    4e21:	e9 c2 00 00 00       	jmp    4ee8 <printf+0xe8>
    4e26:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    4e28:	83 fa 25             	cmp    $0x25,%edx
    4e2b:	0f 84 bf 00 00 00    	je     4ef0 <printf+0xf0>
  write(fd, &c, 1);
    4e31:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    4e34:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4e3b:	00 
    4e3c:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e40:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    4e43:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    4e46:	e8 77 fe ff ff       	call   4cc2 <write>
    4e4b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    4e4e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    4e52:	84 d2                	test   %dl,%dl
    4e54:	0f 84 8e 00 00 00    	je     4ee8 <printf+0xe8>
    if(state == 0){
    4e5a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    4e5c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    4e5f:	74 c7                	je     4e28 <printf+0x28>
      }
    } else if(state == '%'){
    4e61:	83 ff 25             	cmp    $0x25,%edi
    4e64:	75 e5                	jne    4e4b <printf+0x4b>
      if(c == 'd'){
    4e66:	83 fa 64             	cmp    $0x64,%edx
    4e69:	0f 84 31 01 00 00    	je     4fa0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    4e6f:	25 f7 00 00 00       	and    $0xf7,%eax
    4e74:	83 f8 70             	cmp    $0x70,%eax
    4e77:	0f 84 83 00 00 00    	je     4f00 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    4e7d:	83 fa 73             	cmp    $0x73,%edx
    4e80:	0f 84 a2 00 00 00    	je     4f28 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    4e86:	83 fa 63             	cmp    $0x63,%edx
    4e89:	0f 84 35 01 00 00    	je     4fc4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    4e8f:	83 fa 25             	cmp    $0x25,%edx
    4e92:	0f 84 e0 00 00 00    	je     4f78 <printf+0x178>
  write(fd, &c, 1);
    4e98:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    4e9b:	83 c3 01             	add    $0x1,%ebx
    4e9e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4ea5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    4ea6:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    4ea8:	89 44 24 04          	mov    %eax,0x4(%esp)
    4eac:	89 34 24             	mov    %esi,(%esp)
    4eaf:	89 55 d0             	mov    %edx,-0x30(%ebp)
    4eb2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    4eb6:	e8 07 fe ff ff       	call   4cc2 <write>
        putc(fd, c);
    4ebb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    4ebe:	8d 45 e7             	lea    -0x19(%ebp),%eax
    4ec1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4ec8:	00 
    4ec9:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ecd:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    4ed0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    4ed3:	e8 ea fd ff ff       	call   4cc2 <write>
  for(i = 0; fmt[i]; i++){
    4ed8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    4edc:	84 d2                	test   %dl,%dl
    4ede:	0f 85 76 ff ff ff    	jne    4e5a <printf+0x5a>
    4ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    4ee8:	83 c4 3c             	add    $0x3c,%esp
    4eeb:	5b                   	pop    %ebx
    4eec:	5e                   	pop    %esi
    4eed:	5f                   	pop    %edi
    4eee:	5d                   	pop    %ebp
    4eef:	c3                   	ret    
        state = '%';
    4ef0:	bf 25 00 00 00       	mov    $0x25,%edi
    4ef5:	e9 51 ff ff ff       	jmp    4e4b <printf+0x4b>
    4efa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    4f00:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4f03:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    4f08:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    4f0a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4f11:	8b 10                	mov    (%eax),%edx
    4f13:	89 f0                	mov    %esi,%eax
    4f15:	e8 46 fe ff ff       	call   4d60 <printint>
        ap++;
    4f1a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    4f1e:	e9 28 ff ff ff       	jmp    4e4b <printf+0x4b>
    4f23:	90                   	nop
    4f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    4f28:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    4f2b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    4f2f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    4f31:	b8 3c 69 00 00       	mov    $0x693c,%eax
    4f36:	85 ff                	test   %edi,%edi
    4f38:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    4f3b:	0f b6 07             	movzbl (%edi),%eax
    4f3e:	84 c0                	test   %al,%al
    4f40:	74 2a                	je     4f6c <printf+0x16c>
    4f42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4f48:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    4f4b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    4f4e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    4f51:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4f58:	00 
    4f59:	89 44 24 04          	mov    %eax,0x4(%esp)
    4f5d:	89 34 24             	mov    %esi,(%esp)
    4f60:	e8 5d fd ff ff       	call   4cc2 <write>
        while(*s != 0){
    4f65:	0f b6 07             	movzbl (%edi),%eax
    4f68:	84 c0                	test   %al,%al
    4f6a:	75 dc                	jne    4f48 <printf+0x148>
      state = 0;
    4f6c:	31 ff                	xor    %edi,%edi
    4f6e:	e9 d8 fe ff ff       	jmp    4e4b <printf+0x4b>
    4f73:	90                   	nop
    4f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    4f78:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    4f7b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    4f7d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4f84:	00 
    4f85:	89 44 24 04          	mov    %eax,0x4(%esp)
    4f89:	89 34 24             	mov    %esi,(%esp)
    4f8c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    4f90:	e8 2d fd ff ff       	call   4cc2 <write>
    4f95:	e9 b1 fe ff ff       	jmp    4e4b <printf+0x4b>
    4f9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    4fa0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4fa3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    4fa8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    4fab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4fb2:	8b 10                	mov    (%eax),%edx
    4fb4:	89 f0                	mov    %esi,%eax
    4fb6:	e8 a5 fd ff ff       	call   4d60 <printint>
        ap++;
    4fbb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    4fbf:	e9 87 fe ff ff       	jmp    4e4b <printf+0x4b>
        putc(fd, *ap);
    4fc4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    4fc7:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    4fc9:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    4fcb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4fd2:	00 
    4fd3:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    4fd6:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    4fd9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4fdc:	89 44 24 04          	mov    %eax,0x4(%esp)
    4fe0:	e8 dd fc ff ff       	call   4cc2 <write>
        ap++;
    4fe5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    4fe9:	e9 5d fe ff ff       	jmp    4e4b <printf+0x4b>
    4fee:	66 90                	xchg   %ax,%ax

00004ff0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4ff0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4ff1:	a1 00 73 00 00       	mov    0x7300,%eax
{
    4ff6:	89 e5                	mov    %esp,%ebp
    4ff8:	57                   	push   %edi
    4ff9:	56                   	push   %esi
    4ffa:	53                   	push   %ebx
    4ffb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4ffe:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    5000:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5003:	39 d0                	cmp    %edx,%eax
    5005:	72 11                	jb     5018 <free+0x28>
    5007:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    5008:	39 c8                	cmp    %ecx,%eax
    500a:	72 04                	jb     5010 <free+0x20>
    500c:	39 ca                	cmp    %ecx,%edx
    500e:	72 10                	jb     5020 <free+0x30>
    5010:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5012:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    5014:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5016:	73 f0                	jae    5008 <free+0x18>
    5018:	39 ca                	cmp    %ecx,%edx
    501a:	72 04                	jb     5020 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    501c:	39 c8                	cmp    %ecx,%eax
    501e:	72 f0                	jb     5010 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    5020:	8b 73 fc             	mov    -0x4(%ebx),%esi
    5023:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    5026:	39 cf                	cmp    %ecx,%edi
    5028:	74 1e                	je     5048 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    502a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    502d:	8b 48 04             	mov    0x4(%eax),%ecx
    5030:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    5033:	39 f2                	cmp    %esi,%edx
    5035:	74 28                	je     505f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    5037:	89 10                	mov    %edx,(%eax)
  freep = p;
    5039:	a3 00 73 00 00       	mov    %eax,0x7300
}
    503e:	5b                   	pop    %ebx
    503f:	5e                   	pop    %esi
    5040:	5f                   	pop    %edi
    5041:	5d                   	pop    %ebp
    5042:	c3                   	ret    
    5043:	90                   	nop
    5044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    5048:	03 71 04             	add    0x4(%ecx),%esi
    504b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    504e:	8b 08                	mov    (%eax),%ecx
    5050:	8b 09                	mov    (%ecx),%ecx
    5052:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    5055:	8b 48 04             	mov    0x4(%eax),%ecx
    5058:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    505b:	39 f2                	cmp    %esi,%edx
    505d:	75 d8                	jne    5037 <free+0x47>
    p->s.size += bp->s.size;
    505f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    5062:	a3 00 73 00 00       	mov    %eax,0x7300
    p->s.size += bp->s.size;
    5067:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    506a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    506d:	89 10                	mov    %edx,(%eax)
}
    506f:	5b                   	pop    %ebx
    5070:	5e                   	pop    %esi
    5071:	5f                   	pop    %edi
    5072:	5d                   	pop    %ebp
    5073:	c3                   	ret    
    5074:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    507a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00005080 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    5080:	55                   	push   %ebp
    5081:	89 e5                	mov    %esp,%ebp
    5083:	57                   	push   %edi
    5084:	56                   	push   %esi
    5085:	53                   	push   %ebx
    5086:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    5089:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    508c:	8b 1d 00 73 00 00    	mov    0x7300,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    5092:	8d 48 07             	lea    0x7(%eax),%ecx
    5095:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    5098:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    509a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    509d:	0f 84 9b 00 00 00    	je     513e <malloc+0xbe>
    50a3:	8b 13                	mov    (%ebx),%edx
    50a5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    50a8:	39 fe                	cmp    %edi,%esi
    50aa:	76 64                	jbe    5110 <malloc+0x90>
    50ac:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    50b3:	bb 00 80 00 00       	mov    $0x8000,%ebx
    50b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    50bb:	eb 0e                	jmp    50cb <malloc+0x4b>
    50bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    50c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    50c2:	8b 78 04             	mov    0x4(%eax),%edi
    50c5:	39 fe                	cmp    %edi,%esi
    50c7:	76 4f                	jbe    5118 <malloc+0x98>
    50c9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    50cb:	3b 15 00 73 00 00    	cmp    0x7300,%edx
    50d1:	75 ed                	jne    50c0 <malloc+0x40>
  if(nu < 4096)
    50d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    50d6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    50dc:	bf 00 10 00 00       	mov    $0x1000,%edi
    50e1:	0f 43 fe             	cmovae %esi,%edi
    50e4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    50e7:	89 04 24             	mov    %eax,(%esp)
    50ea:	e8 3b fc ff ff       	call   4d2a <sbrk>
  if(p == (char*)-1)
    50ef:	83 f8 ff             	cmp    $0xffffffff,%eax
    50f2:	74 18                	je     510c <malloc+0x8c>
  hp->s.size = nu;
    50f4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    50f7:	83 c0 08             	add    $0x8,%eax
    50fa:	89 04 24             	mov    %eax,(%esp)
    50fd:	e8 ee fe ff ff       	call   4ff0 <free>
  return freep;
    5102:	8b 15 00 73 00 00    	mov    0x7300,%edx
      if((p = morecore(nunits)) == 0)
    5108:	85 d2                	test   %edx,%edx
    510a:	75 b4                	jne    50c0 <malloc+0x40>
        return 0;
    510c:	31 c0                	xor    %eax,%eax
    510e:	eb 20                	jmp    5130 <malloc+0xb0>
    if(p->s.size >= nunits){
    5110:	89 d0                	mov    %edx,%eax
    5112:	89 da                	mov    %ebx,%edx
    5114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    5118:	39 fe                	cmp    %edi,%esi
    511a:	74 1c                	je     5138 <malloc+0xb8>
        p->s.size -= nunits;
    511c:	29 f7                	sub    %esi,%edi
    511e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    5121:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    5124:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    5127:	89 15 00 73 00 00    	mov    %edx,0x7300
      return (void*)(p + 1);
    512d:	83 c0 08             	add    $0x8,%eax
  }
}
    5130:	83 c4 1c             	add    $0x1c,%esp
    5133:	5b                   	pop    %ebx
    5134:	5e                   	pop    %esi
    5135:	5f                   	pop    %edi
    5136:	5d                   	pop    %ebp
    5137:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    5138:	8b 08                	mov    (%eax),%ecx
    513a:	89 0a                	mov    %ecx,(%edx)
    513c:	eb e9                	jmp    5127 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    513e:	c7 05 00 73 00 00 04 	movl   $0x7304,0x7300
    5145:	73 00 00 
    base.s.size = 0;
    5148:	ba 04 73 00 00       	mov    $0x7304,%edx
    base.s.ptr = freep = prevp = &base;
    514d:	c7 05 04 73 00 00 04 	movl   $0x7304,0x7304
    5154:	73 00 00 
    base.s.size = 0;
    5157:	c7 05 08 73 00 00 00 	movl   $0x0,0x7308
    515e:	00 00 00 
    5161:	e9 46 ff ff ff       	jmp    50ac <malloc+0x2c>
    5166:	66 90                	xchg   %ax,%ax
    5168:	66 90                	xchg   %ax,%ax
    516a:	66 90                	xchg   %ax,%ax
    516c:	66 90                	xchg   %ax,%ax
    516e:	66 90                	xchg   %ax,%ax

00005170 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    5170:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    5171:	b9 01 00 00 00       	mov    $0x1,%ecx
    5176:	89 e5                	mov    %esp,%ebp
    5178:	8b 55 08             	mov    0x8(%ebp),%edx
    517b:	90                   	nop
    517c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    5180:	89 c8                	mov    %ecx,%eax
    5182:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    5185:	85 c0                	test   %eax,%eax
    5187:	75 f7                	jne    5180 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    5189:	0f ae f0             	mfence 
}
    518c:	5d                   	pop    %ebp
    518d:	c3                   	ret    
    518e:	66 90                	xchg   %ax,%ax

00005190 <urelease>:

void urelease (struct uspinlock *lk) {
    5190:	55                   	push   %ebp
    5191:	89 e5                	mov    %esp,%ebp
    5193:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    5196:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    5199:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    519f:	5d                   	pop    %ebp
    51a0:	c3                   	ret    
