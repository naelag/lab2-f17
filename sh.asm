
_sh:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  return 0;
}

int
main(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 10             	sub    $0x10,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    1009:	eb 0e                	jmp    1019 <main+0x19>
    100b:	90                   	nop
    100c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
    1010:	83 f8 02             	cmp    $0x2,%eax
    1013:	0f 8f cd 00 00 00    	jg     10e6 <main+0xe6>
  while((fd = open("console", O_RDWR)) >= 0){
    1019:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1020:	00 
    1021:	c7 04 24 85 23 00 00 	movl   $0x2385,(%esp)
    1028:	e8 f5 0d 00 00       	call   1e22 <open>
    102d:	85 c0                	test   %eax,%eax
    102f:	79 df                	jns    1010 <main+0x10>
    1031:	eb 23                	jmp    1056 <main+0x56>
    1033:	90                   	nop
    1034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    1038:	80 3d c2 29 00 00 20 	cmpb   $0x20,0x29c2
    103f:	90                   	nop
    1040:	74 60                	je     10a2 <main+0xa2>
    1042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
    1048:	e8 43 01 00 00       	call   1190 <fork1>
    104d:	85 c0                	test   %eax,%eax
    104f:	74 38                	je     1089 <main+0x89>
      runcmd(parsecmd(buf));
    wait();
    1051:	e8 94 0d 00 00       	call   1dea <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
    1056:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
    105d:	00 
    105e:	c7 04 24 c0 29 00 00 	movl   $0x29c0,(%esp)
    1065:	e8 96 00 00 00       	call   1100 <getcmd>
    106a:	85 c0                	test   %eax,%eax
    106c:	78 2f                	js     109d <main+0x9d>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    106e:	80 3d c0 29 00 00 63 	cmpb   $0x63,0x29c0
    1075:	75 d1                	jne    1048 <main+0x48>
    1077:	80 3d c1 29 00 00 64 	cmpb   $0x64,0x29c1
    107e:	74 b8                	je     1038 <main+0x38>
    if(fork1() == 0)
    1080:	e8 0b 01 00 00       	call   1190 <fork1>
    1085:	85 c0                	test   %eax,%eax
    1087:	75 c8                	jne    1051 <main+0x51>
      runcmd(parsecmd(buf));
    1089:	c7 04 24 c0 29 00 00 	movl   $0x29c0,(%esp)
    1090:	e8 ab 0a 00 00       	call   1b40 <parsecmd>
    1095:	89 04 24             	mov    %eax,(%esp)
    1098:	e8 13 01 00 00       	call   11b0 <runcmd>
  }
  exit();
    109d:	e8 40 0d 00 00       	call   1de2 <exit>
      buf[strlen(buf)-1] = 0;  // chop \n
    10a2:	c7 04 24 c0 29 00 00 	movl   $0x29c0,(%esp)
    10a9:	e8 92 0b 00 00       	call   1c40 <strlen>
      if(chdir(buf+3) < 0)
    10ae:	c7 04 24 c3 29 00 00 	movl   $0x29c3,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
    10b5:	c6 80 bf 29 00 00 00 	movb   $0x0,0x29bf(%eax)
      if(chdir(buf+3) < 0)
    10bc:	e8 91 0d 00 00       	call   1e52 <chdir>
    10c1:	85 c0                	test   %eax,%eax
    10c3:	79 91                	jns    1056 <main+0x56>
        printf(2, "cannot cd %s\n", buf+3);
    10c5:	c7 44 24 08 c3 29 00 	movl   $0x29c3,0x8(%esp)
    10cc:	00 
    10cd:	c7 44 24 04 8d 23 00 	movl   $0x238d,0x4(%esp)
    10d4:	00 
    10d5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    10dc:	e8 5f 0e 00 00       	call   1f40 <printf>
    10e1:	e9 70 ff ff ff       	jmp    1056 <main+0x56>
      close(fd);
    10e6:	89 04 24             	mov    %eax,(%esp)
    10e9:	e8 1c 0d 00 00       	call   1e0a <close>
    10ee:	66 90                	xchg   %ax,%ax
      break;
    10f0:	e9 61 ff ff ff       	jmp    1056 <main+0x56>
    10f5:	66 90                	xchg   %ax,%ax
    10f7:	66 90                	xchg   %ax,%ax
    10f9:	66 90                	xchg   %ax,%ax
    10fb:	66 90                	xchg   %ax,%ax
    10fd:	66 90                	xchg   %ax,%ax
    10ff:	90                   	nop

00001100 <getcmd>:
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	56                   	push   %esi
    1104:	53                   	push   %ebx
    1105:	83 ec 10             	sub    $0x10,%esp
    1108:	8b 5d 08             	mov    0x8(%ebp),%ebx
    110b:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
    110e:	c7 44 24 04 e4 22 00 	movl   $0x22e4,0x4(%esp)
    1115:	00 
    1116:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    111d:	e8 1e 0e 00 00       	call   1f40 <printf>
  memset(buf, 0, nbuf);
    1122:	89 74 24 08          	mov    %esi,0x8(%esp)
    1126:	89 1c 24             	mov    %ebx,(%esp)
    1129:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1130:	00 
    1131:	e8 3a 0b 00 00       	call   1c70 <memset>
  gets(buf, nbuf);
    1136:	89 74 24 04          	mov    %esi,0x4(%esp)
    113a:	89 1c 24             	mov    %ebx,(%esp)
    113d:	e8 8e 0b 00 00       	call   1cd0 <gets>
  if(buf[0] == 0) // EOF
    1142:	31 c0                	xor    %eax,%eax
    1144:	80 3b 00             	cmpb   $0x0,(%ebx)
    1147:	0f 94 c0             	sete   %al
}
    114a:	83 c4 10             	add    $0x10,%esp
    114d:	5b                   	pop    %ebx
  if(buf[0] == 0) // EOF
    114e:	f7 d8                	neg    %eax
}
    1150:	5e                   	pop    %esi
    1151:	5d                   	pop    %ebp
    1152:	c3                   	ret    
    1153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001160 <panic>:
}

void
panic(char *s)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
    1166:	8b 45 08             	mov    0x8(%ebp),%eax
    1169:	c7 44 24 04 81 23 00 	movl   $0x2381,0x4(%esp)
    1170:	00 
    1171:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1178:	89 44 24 08          	mov    %eax,0x8(%esp)
    117c:	e8 bf 0d 00 00       	call   1f40 <printf>
  exit();
    1181:	e8 5c 0c 00 00       	call   1de2 <exit>
    1186:	8d 76 00             	lea    0x0(%esi),%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001190 <fork1>:
}

int
fork1(void)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	83 ec 18             	sub    $0x18,%esp
  int pid;

  pid = fork();
    1196:	e8 3f 0c 00 00       	call   1dda <fork>
  if(pid == -1)
    119b:	83 f8 ff             	cmp    $0xffffffff,%eax
    119e:	74 02                	je     11a2 <fork1+0x12>
    panic("fork");
  return pid;
}
    11a0:	c9                   	leave  
    11a1:	c3                   	ret    
    panic("fork");
    11a2:	c7 04 24 e7 22 00 00 	movl   $0x22e7,(%esp)
    11a9:	e8 b2 ff ff ff       	call   1160 <panic>
    11ae:	66 90                	xchg   %ax,%ax

000011b0 <runcmd>:
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	53                   	push   %ebx
    11b4:	83 ec 24             	sub    $0x24,%esp
    11b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
    11ba:	85 db                	test   %ebx,%ebx
    11bc:	74 5f                	je     121d <runcmd+0x6d>
  switch(cmd->type){
    11be:	83 3b 05             	cmpl   $0x5,(%ebx)
    11c1:	0f 87 e7 00 00 00    	ja     12ae <runcmd+0xfe>
    11c7:	8b 03                	mov    (%ebx),%eax
    11c9:	ff 24 85 9c 23 00 00 	jmp    *0x239c(,%eax,4)
    if(pipe(p) < 0)
    11d0:	8d 45 f0             	lea    -0x10(%ebp),%eax
    11d3:	89 04 24             	mov    %eax,(%esp)
    11d6:	e8 17 0c 00 00       	call   1df2 <pipe>
    11db:	85 c0                	test   %eax,%eax
    11dd:	0f 88 d7 00 00 00    	js     12ba <runcmd+0x10a>
    if(fork1() == 0){
    11e3:	e8 a8 ff ff ff       	call   1190 <fork1>
    11e8:	85 c0                	test   %eax,%eax
    11ea:	0f 84 2e 01 00 00    	je     131e <runcmd+0x16e>
    if(fork1() == 0){
    11f0:	e8 9b ff ff ff       	call   1190 <fork1>
    11f5:	85 c0                	test   %eax,%eax
    11f7:	0f 84 e9 00 00 00    	je     12e6 <runcmd+0x136>
    close(p[0]);
    11fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1200:	89 04 24             	mov    %eax,(%esp)
    1203:	e8 02 0c 00 00       	call   1e0a <close>
    close(p[1]);
    1208:	8b 45 f4             	mov    -0xc(%ebp),%eax
    120b:	89 04 24             	mov    %eax,(%esp)
    120e:	e8 f7 0b 00 00       	call   1e0a <close>
    wait();
    1213:	e8 d2 0b 00 00       	call   1dea <wait>
    wait();
    1218:	e8 cd 0b 00 00       	call   1dea <wait>
    121d:	8d 76 00             	lea    0x0(%esi),%esi
      exit();
    1220:	e8 bd 0b 00 00       	call   1de2 <exit>
    if(fork1() == 0)
    1225:	e8 66 ff ff ff       	call   1190 <fork1>
    122a:	85 c0                	test   %eax,%eax
    122c:	75 ef                	jne    121d <runcmd+0x6d>
    122e:	66 90                	xchg   %ax,%ax
    1230:	eb 71                	jmp    12a3 <runcmd+0xf3>
    if(ecmd->argv[0] == 0)
    1232:	8b 43 04             	mov    0x4(%ebx),%eax
    1235:	85 c0                	test   %eax,%eax
    1237:	74 e4                	je     121d <runcmd+0x6d>
    exec(ecmd->argv[0], ecmd->argv);
    1239:	8d 53 04             	lea    0x4(%ebx),%edx
    123c:	89 54 24 04          	mov    %edx,0x4(%esp)
    1240:	89 04 24             	mov    %eax,(%esp)
    1243:	e8 d2 0b 00 00       	call   1e1a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    1248:	8b 43 04             	mov    0x4(%ebx),%eax
    124b:	c7 44 24 04 f3 22 00 	movl   $0x22f3,0x4(%esp)
    1252:	00 
    1253:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    125a:	89 44 24 08          	mov    %eax,0x8(%esp)
    125e:	e8 dd 0c 00 00       	call   1f40 <printf>
    break;
    1263:	eb b8                	jmp    121d <runcmd+0x6d>
    if(fork1() == 0)
    1265:	e8 26 ff ff ff       	call   1190 <fork1>
    126a:	85 c0                	test   %eax,%eax
    126c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1270:	74 31                	je     12a3 <runcmd+0xf3>
    wait();
    1272:	e8 73 0b 00 00       	call   1dea <wait>
    runcmd(lcmd->right);
    1277:	8b 43 08             	mov    0x8(%ebx),%eax
    127a:	89 04 24             	mov    %eax,(%esp)
    127d:	e8 2e ff ff ff       	call   11b0 <runcmd>
    close(rcmd->fd);
    1282:	8b 43 14             	mov    0x14(%ebx),%eax
    1285:	89 04 24             	mov    %eax,(%esp)
    1288:	e8 7d 0b 00 00       	call   1e0a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
    128d:	8b 43 10             	mov    0x10(%ebx),%eax
    1290:	89 44 24 04          	mov    %eax,0x4(%esp)
    1294:	8b 43 08             	mov    0x8(%ebx),%eax
    1297:	89 04 24             	mov    %eax,(%esp)
    129a:	e8 83 0b 00 00       	call   1e22 <open>
    129f:	85 c0                	test   %eax,%eax
    12a1:	78 23                	js     12c6 <runcmd+0x116>
      runcmd(bcmd->cmd);
    12a3:	8b 43 04             	mov    0x4(%ebx),%eax
    12a6:	89 04 24             	mov    %eax,(%esp)
    12a9:	e8 02 ff ff ff       	call   11b0 <runcmd>
    panic("runcmd");
    12ae:	c7 04 24 ec 22 00 00 	movl   $0x22ec,(%esp)
    12b5:	e8 a6 fe ff ff       	call   1160 <panic>
      panic("pipe");
    12ba:	c7 04 24 13 23 00 00 	movl   $0x2313,(%esp)
    12c1:	e8 9a fe ff ff       	call   1160 <panic>
      printf(2, "open %s failed\n", rcmd->file);
    12c6:	8b 43 08             	mov    0x8(%ebx),%eax
    12c9:	c7 44 24 04 03 23 00 	movl   $0x2303,0x4(%esp)
    12d0:	00 
    12d1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    12d8:	89 44 24 08          	mov    %eax,0x8(%esp)
    12dc:	e8 5f 0c 00 00       	call   1f40 <printf>
    12e1:	e9 37 ff ff ff       	jmp    121d <runcmd+0x6d>
      close(0);
    12e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12ed:	e8 18 0b 00 00       	call   1e0a <close>
      dup(p[0]);
    12f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12f5:	89 04 24             	mov    %eax,(%esp)
    12f8:	e8 5d 0b 00 00       	call   1e5a <dup>
      close(p[0]);
    12fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1300:	89 04 24             	mov    %eax,(%esp)
    1303:	e8 02 0b 00 00       	call   1e0a <close>
      close(p[1]);
    1308:	8b 45 f4             	mov    -0xc(%ebp),%eax
    130b:	89 04 24             	mov    %eax,(%esp)
    130e:	e8 f7 0a 00 00       	call   1e0a <close>
      runcmd(pcmd->right);
    1313:	8b 43 08             	mov    0x8(%ebx),%eax
    1316:	89 04 24             	mov    %eax,(%esp)
    1319:	e8 92 fe ff ff       	call   11b0 <runcmd>
      close(1);
    131e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1325:	e8 e0 0a 00 00       	call   1e0a <close>
      dup(p[1]);
    132a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    132d:	89 04 24             	mov    %eax,(%esp)
    1330:	e8 25 0b 00 00       	call   1e5a <dup>
      close(p[0]);
    1335:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1338:	89 04 24             	mov    %eax,(%esp)
    133b:	e8 ca 0a 00 00       	call   1e0a <close>
      close(p[1]);
    1340:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1343:	89 04 24             	mov    %eax,(%esp)
    1346:	e8 bf 0a 00 00       	call   1e0a <close>
      runcmd(pcmd->left);
    134b:	8b 43 04             	mov    0x4(%ebx),%eax
    134e:	89 04 24             	mov    %eax,(%esp)
    1351:	e8 5a fe ff ff       	call   11b0 <runcmd>
    1356:	8d 76 00             	lea    0x0(%esi),%esi
    1359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001360 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	53                   	push   %ebx
    1364:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1367:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
    136e:	e8 4d 0e 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    1373:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
    137a:	00 
    137b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1382:	00 
  cmd = malloc(sizeof(*cmd));
    1383:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1385:	89 04 24             	mov    %eax,(%esp)
    1388:	e8 e3 08 00 00       	call   1c70 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
    138d:	89 d8                	mov    %ebx,%eax
  cmd->type = EXEC;
    138f:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
}
    1395:	83 c4 14             	add    $0x14,%esp
    1398:	5b                   	pop    %ebx
    1399:	5d                   	pop    %ebp
    139a:	c3                   	ret    
    139b:	90                   	nop
    139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013a0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	53                   	push   %ebx
    13a4:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13a7:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    13ae:	e8 0d 0e 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    13b3:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
    13ba:	00 
    13bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    13c2:	00 
    13c3:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
    13c6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    13c8:	e8 a3 08 00 00       	call   1c70 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
    13cd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
    13d0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
    13d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
    13d9:	8b 45 0c             	mov    0xc(%ebp),%eax
    13dc:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
    13df:	8b 45 10             	mov    0x10(%ebp),%eax
    13e2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
    13e5:	8b 45 14             	mov    0x14(%ebp),%eax
    13e8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
    13eb:	8b 45 18             	mov    0x18(%ebp),%eax
    13ee:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
    13f1:	83 c4 14             	add    $0x14,%esp
    13f4:	89 d8                	mov    %ebx,%eax
    13f6:	5b                   	pop    %ebx
    13f7:	5d                   	pop    %ebp
    13f8:	c3                   	ret    
    13f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001400 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	53                   	push   %ebx
    1404:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1407:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    140e:	e8 ad 0d 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    1413:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
    141a:	00 
    141b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1422:	00 
    1423:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
    1426:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1428:	e8 43 08 00 00       	call   1c70 <memset>
  cmd->type = PIPE;
  cmd->left = left;
    142d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
    1430:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
    1436:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
    1439:	8b 45 0c             	mov    0xc(%ebp),%eax
    143c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
    143f:	83 c4 14             	add    $0x14,%esp
    1442:	89 d8                	mov    %ebx,%eax
    1444:	5b                   	pop    %ebx
    1445:	5d                   	pop    %ebp
    1446:	c3                   	ret    
    1447:	89 f6                	mov    %esi,%esi
    1449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001450 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	53                   	push   %ebx
    1454:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1457:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    145e:	e8 5d 0d 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    1463:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
    146a:	00 
    146b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1472:	00 
    1473:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
    1476:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1478:	e8 f3 07 00 00       	call   1c70 <memset>
  cmd->type = LIST;
  cmd->left = left;
    147d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
    1480:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
    1486:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
    1489:	8b 45 0c             	mov    0xc(%ebp),%eax
    148c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
    148f:	83 c4 14             	add    $0x14,%esp
    1492:	89 d8                	mov    %ebx,%eax
    1494:	5b                   	pop    %ebx
    1495:	5d                   	pop    %ebp
    1496:	c3                   	ret    
    1497:	89 f6                	mov    %esi,%esi
    1499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000014a0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	53                   	push   %ebx
    14a4:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    14a7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    14ae:	e8 0d 0d 00 00       	call   21c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    14b3:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
    14ba:	00 
    14bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14c2:	00 
    14c3:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
    14c6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    14c8:	e8 a3 07 00 00       	call   1c70 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
    14cd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
    14d0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
    14d6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
    14d9:	83 c4 14             	add    $0x14,%esp
    14dc:	89 d8                	mov    %ebx,%eax
    14de:	5b                   	pop    %ebx
    14df:	5d                   	pop    %ebp
    14e0:	c3                   	ret    
    14e1:	eb 0d                	jmp    14f0 <gettoken>
    14e3:	90                   	nop
    14e4:	90                   	nop
    14e5:	90                   	nop
    14e6:	90                   	nop
    14e7:	90                   	nop
    14e8:	90                   	nop
    14e9:	90                   	nop
    14ea:	90                   	nop
    14eb:	90                   	nop
    14ec:	90                   	nop
    14ed:	90                   	nop
    14ee:	90                   	nop
    14ef:	90                   	nop

000014f0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
    14f0:	55                   	push   %ebp
    14f1:	89 e5                	mov    %esp,%ebp
    14f3:	57                   	push   %edi
    14f4:	56                   	push   %esi
    14f5:	53                   	push   %ebx
    14f6:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
    14f9:	8b 45 08             	mov    0x8(%ebp),%eax
{
    14fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    14ff:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
    1502:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
    1504:	39 df                	cmp    %ebx,%edi
    1506:	72 0f                	jb     1517 <gettoken+0x27>
    1508:	eb 24                	jmp    152e <gettoken+0x3e>
    150a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
    1510:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
    1513:	39 df                	cmp    %ebx,%edi
    1515:	74 17                	je     152e <gettoken+0x3e>
    1517:	0f be 07             	movsbl (%edi),%eax
    151a:	c7 04 24 ac 29 00 00 	movl   $0x29ac,(%esp)
    1521:	89 44 24 04          	mov    %eax,0x4(%esp)
    1525:	e8 66 07 00 00       	call   1c90 <strchr>
    152a:	85 c0                	test   %eax,%eax
    152c:	75 e2                	jne    1510 <gettoken+0x20>
  if(q)
    152e:	85 f6                	test   %esi,%esi
    1530:	74 02                	je     1534 <gettoken+0x44>
    *q = s;
    1532:	89 3e                	mov    %edi,(%esi)
  ret = *s;
    1534:	0f b6 0f             	movzbl (%edi),%ecx
    1537:	0f be f1             	movsbl %cl,%esi
  switch(*s){
    153a:	80 f9 29             	cmp    $0x29,%cl
  ret = *s;
    153d:	89 f0                	mov    %esi,%eax
  switch(*s){
    153f:	7f 4f                	jg     1590 <gettoken+0xa0>
    1541:	80 f9 28             	cmp    $0x28,%cl
    1544:	7d 55                	jge    159b <gettoken+0xab>
    1546:	84 c9                	test   %cl,%cl
    1548:	0f 85 ca 00 00 00    	jne    1618 <gettoken+0x128>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    154e:	8b 45 14             	mov    0x14(%ebp),%eax
    1551:	85 c0                	test   %eax,%eax
    1553:	74 05                	je     155a <gettoken+0x6a>
    *eq = s;
    1555:	8b 45 14             	mov    0x14(%ebp),%eax
    1558:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
    155a:	39 df                	cmp    %ebx,%edi
    155c:	72 09                	jb     1567 <gettoken+0x77>
    155e:	eb 1e                	jmp    157e <gettoken+0x8e>
    s++;
    1560:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
    1563:	39 df                	cmp    %ebx,%edi
    1565:	74 17                	je     157e <gettoken+0x8e>
    1567:	0f be 07             	movsbl (%edi),%eax
    156a:	c7 04 24 ac 29 00 00 	movl   $0x29ac,(%esp)
    1571:	89 44 24 04          	mov    %eax,0x4(%esp)
    1575:	e8 16 07 00 00       	call   1c90 <strchr>
    157a:	85 c0                	test   %eax,%eax
    157c:	75 e2                	jne    1560 <gettoken+0x70>
  *ps = s;
    157e:	8b 45 08             	mov    0x8(%ebp),%eax
    1581:	89 38                	mov    %edi,(%eax)
  return ret;
}
    1583:	83 c4 1c             	add    $0x1c,%esp
    1586:	89 f0                	mov    %esi,%eax
    1588:	5b                   	pop    %ebx
    1589:	5e                   	pop    %esi
    158a:	5f                   	pop    %edi
    158b:	5d                   	pop    %ebp
    158c:	c3                   	ret    
    158d:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
    1590:	80 f9 3e             	cmp    $0x3e,%cl
    1593:	75 0b                	jne    15a0 <gettoken+0xb0>
    if(*s == '>'){
    1595:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    1599:	74 6d                	je     1608 <gettoken+0x118>
    s++;
    159b:	83 c7 01             	add    $0x1,%edi
    159e:	eb ae                	jmp    154e <gettoken+0x5e>
  switch(*s){
    15a0:	7f 56                	jg     15f8 <gettoken+0x108>
    15a2:	83 e9 3b             	sub    $0x3b,%ecx
    15a5:	80 f9 01             	cmp    $0x1,%cl
    15a8:	76 f1                	jbe    159b <gettoken+0xab>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    15aa:	39 fb                	cmp    %edi,%ebx
    15ac:	77 2b                	ja     15d9 <gettoken+0xe9>
    15ae:	66 90                	xchg   %ax,%ax
    15b0:	eb 3b                	jmp    15ed <gettoken+0xfd>
    15b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    15b8:	0f be 07             	movsbl (%edi),%eax
    15bb:	c7 04 24 a4 29 00 00 	movl   $0x29a4,(%esp)
    15c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    15c6:	e8 c5 06 00 00       	call   1c90 <strchr>
    15cb:	85 c0                	test   %eax,%eax
    15cd:	75 1e                	jne    15ed <gettoken+0xfd>
      s++;
    15cf:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    15d2:	39 df                	cmp    %ebx,%edi
    15d4:	74 17                	je     15ed <gettoken+0xfd>
    15d6:	0f be 07             	movsbl (%edi),%eax
    15d9:	89 44 24 04          	mov    %eax,0x4(%esp)
    15dd:	c7 04 24 ac 29 00 00 	movl   $0x29ac,(%esp)
    15e4:	e8 a7 06 00 00       	call   1c90 <strchr>
    15e9:	85 c0                	test   %eax,%eax
    15eb:	74 cb                	je     15b8 <gettoken+0xc8>
    ret = 'a';
    15ed:	be 61 00 00 00       	mov    $0x61,%esi
    15f2:	e9 57 ff ff ff       	jmp    154e <gettoken+0x5e>
    15f7:	90                   	nop
  switch(*s){
    15f8:	80 f9 7c             	cmp    $0x7c,%cl
    15fb:	74 9e                	je     159b <gettoken+0xab>
    15fd:	8d 76 00             	lea    0x0(%esi),%esi
    1600:	eb a8                	jmp    15aa <gettoken+0xba>
    1602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      s++;
    1608:	83 c7 02             	add    $0x2,%edi
      ret = '+';
    160b:	be 2b 00 00 00       	mov    $0x2b,%esi
    1610:	e9 39 ff ff ff       	jmp    154e <gettoken+0x5e>
    1615:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
    1618:	80 f9 26             	cmp    $0x26,%cl
    161b:	75 8d                	jne    15aa <gettoken+0xba>
    161d:	e9 79 ff ff ff       	jmp    159b <gettoken+0xab>
    1622:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001630 <peek>:

int
peek(char **ps, char *es, char *toks)
{
    1630:	55                   	push   %ebp
    1631:	89 e5                	mov    %esp,%ebp
    1633:	57                   	push   %edi
    1634:	56                   	push   %esi
    1635:	53                   	push   %ebx
    1636:	83 ec 1c             	sub    $0x1c,%esp
    1639:	8b 7d 08             	mov    0x8(%ebp),%edi
    163c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
    163f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
    1641:	39 f3                	cmp    %esi,%ebx
    1643:	72 0a                	jb     164f <peek+0x1f>
    1645:	eb 1f                	jmp    1666 <peek+0x36>
    1647:	90                   	nop
    s++;
    1648:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
    164b:	39 f3                	cmp    %esi,%ebx
    164d:	74 17                	je     1666 <peek+0x36>
    164f:	0f be 03             	movsbl (%ebx),%eax
    1652:	c7 04 24 ac 29 00 00 	movl   $0x29ac,(%esp)
    1659:	89 44 24 04          	mov    %eax,0x4(%esp)
    165d:	e8 2e 06 00 00       	call   1c90 <strchr>
    1662:	85 c0                	test   %eax,%eax
    1664:	75 e2                	jne    1648 <peek+0x18>
  *ps = s;
    1666:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
    1668:	0f be 13             	movsbl (%ebx),%edx
    166b:	31 c0                	xor    %eax,%eax
    166d:	84 d2                	test   %dl,%dl
    166f:	74 17                	je     1688 <peek+0x58>
    1671:	8b 45 10             	mov    0x10(%ebp),%eax
    1674:	89 54 24 04          	mov    %edx,0x4(%esp)
    1678:	89 04 24             	mov    %eax,(%esp)
    167b:	e8 10 06 00 00       	call   1c90 <strchr>
    1680:	85 c0                	test   %eax,%eax
    1682:	0f 95 c0             	setne  %al
    1685:	0f b6 c0             	movzbl %al,%eax
}
    1688:	83 c4 1c             	add    $0x1c,%esp
    168b:	5b                   	pop    %ebx
    168c:	5e                   	pop    %esi
    168d:	5f                   	pop    %edi
    168e:	5d                   	pop    %ebp
    168f:	c3                   	ret    

00001690 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
    1690:	55                   	push   %ebp
    1691:	89 e5                	mov    %esp,%ebp
    1693:	57                   	push   %edi
    1694:	56                   	push   %esi
    1695:	53                   	push   %ebx
    1696:	83 ec 3c             	sub    $0x3c,%esp
    1699:	8b 75 0c             	mov    0xc(%ebp),%esi
    169c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    169f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    16a0:	c7 44 24 08 35 23 00 	movl   $0x2335,0x8(%esp)
    16a7:	00 
    16a8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    16ac:	89 34 24             	mov    %esi,(%esp)
    16af:	e8 7c ff ff ff       	call   1630 <peek>
    16b4:	85 c0                	test   %eax,%eax
    16b6:	0f 84 9c 00 00 00    	je     1758 <parseredirs+0xc8>
    tok = gettoken(ps, es, 0, 0);
    16bc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    16c3:	00 
    16c4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    16cb:	00 
    16cc:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    16d0:	89 34 24             	mov    %esi,(%esp)
    16d3:	e8 18 fe ff ff       	call   14f0 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
    16d8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    16dc:	89 34 24             	mov    %esi,(%esp)
    tok = gettoken(ps, es, 0, 0);
    16df:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
    16e1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    16e4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16e8:	8d 45 e0             	lea    -0x20(%ebp),%eax
    16eb:	89 44 24 08          	mov    %eax,0x8(%esp)
    16ef:	e8 fc fd ff ff       	call   14f0 <gettoken>
    16f4:	83 f8 61             	cmp    $0x61,%eax
    16f7:	75 6a                	jne    1763 <parseredirs+0xd3>
      panic("missing file for redirection");
    switch(tok){
    16f9:	83 ff 3c             	cmp    $0x3c,%edi
    16fc:	74 42                	je     1740 <parseredirs+0xb0>
    16fe:	83 ff 3e             	cmp    $0x3e,%edi
    1701:	74 05                	je     1708 <parseredirs+0x78>
    1703:	83 ff 2b             	cmp    $0x2b,%edi
    1706:	75 98                	jne    16a0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    1708:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    170f:	00 
    1710:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
    1717:	00 
    1718:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    171b:	89 44 24 08          	mov    %eax,0x8(%esp)
    171f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1722:	89 44 24 04          	mov    %eax,0x4(%esp)
    1726:	8b 45 08             	mov    0x8(%ebp),%eax
    1729:	89 04 24             	mov    %eax,(%esp)
    172c:	e8 6f fc ff ff       	call   13a0 <redircmd>
    1731:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    1734:	e9 67 ff ff ff       	jmp    16a0 <parseredirs+0x10>
    1739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    1740:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1747:	00 
    1748:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    174f:	00 
    1750:	eb c6                	jmp    1718 <parseredirs+0x88>
    1752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
    1758:	8b 45 08             	mov    0x8(%ebp),%eax
    175b:	83 c4 3c             	add    $0x3c,%esp
    175e:	5b                   	pop    %ebx
    175f:	5e                   	pop    %esi
    1760:	5f                   	pop    %edi
    1761:	5d                   	pop    %ebp
    1762:	c3                   	ret    
      panic("missing file for redirection");
    1763:	c7 04 24 18 23 00 00 	movl   $0x2318,(%esp)
    176a:	e8 f1 f9 ff ff       	call   1160 <panic>
    176f:	90                   	nop

00001770 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
    1770:	55                   	push   %ebp
    1771:	89 e5                	mov    %esp,%ebp
    1773:	57                   	push   %edi
    1774:	56                   	push   %esi
    1775:	53                   	push   %ebx
    1776:	83 ec 3c             	sub    $0x3c,%esp
    1779:	8b 75 08             	mov    0x8(%ebp),%esi
    177c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    177f:	c7 44 24 08 38 23 00 	movl   $0x2338,0x8(%esp)
    1786:	00 
    1787:	89 34 24             	mov    %esi,(%esp)
    178a:	89 7c 24 04          	mov    %edi,0x4(%esp)
    178e:	e8 9d fe ff ff       	call   1630 <peek>
    1793:	85 c0                	test   %eax,%eax
    1795:	0f 85 a5 00 00 00    	jne    1840 <parseexec+0xd0>
    return parseblock(ps, es);

  ret = execcmd();
    179b:	e8 c0 fb ff ff       	call   1360 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
    17a0:	89 7c 24 08          	mov    %edi,0x8(%esp)
    17a4:	89 74 24 04          	mov    %esi,0x4(%esp)
    17a8:	89 04 24             	mov    %eax,(%esp)
  ret = execcmd();
    17ab:	89 c3                	mov    %eax,%ebx
    17ad:	89 45 cc             	mov    %eax,-0x34(%ebp)
  ret = parseredirs(ret, ps, es);
    17b0:	e8 db fe ff ff       	call   1690 <parseredirs>
  argc = 0;
    17b5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  ret = parseredirs(ret, ps, es);
    17bc:	89 45 d0             	mov    %eax,-0x30(%ebp)
  while(!peek(ps, es, "|)&;")){
    17bf:	eb 1d                	jmp    17de <parseexec+0x6e>
    17c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
    17c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    17cb:	89 7c 24 08          	mov    %edi,0x8(%esp)
    17cf:	89 74 24 04          	mov    %esi,0x4(%esp)
    17d3:	89 04 24             	mov    %eax,(%esp)
    17d6:	e8 b5 fe ff ff       	call   1690 <parseredirs>
    17db:	89 45 d0             	mov    %eax,-0x30(%ebp)
  while(!peek(ps, es, "|)&;")){
    17de:	c7 44 24 08 4f 23 00 	movl   $0x234f,0x8(%esp)
    17e5:	00 
    17e6:	89 7c 24 04          	mov    %edi,0x4(%esp)
    17ea:	89 34 24             	mov    %esi,(%esp)
    17ed:	e8 3e fe ff ff       	call   1630 <peek>
    17f2:	85 c0                	test   %eax,%eax
    17f4:	75 62                	jne    1858 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    17f6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    17f9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    17fd:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1800:	89 44 24 08          	mov    %eax,0x8(%esp)
    1804:	89 7c 24 04          	mov    %edi,0x4(%esp)
    1808:	89 34 24             	mov    %esi,(%esp)
    180b:	e8 e0 fc ff ff       	call   14f0 <gettoken>
    1810:	85 c0                	test   %eax,%eax
    1812:	74 44                	je     1858 <parseexec+0xe8>
    if(tok != 'a')
    1814:	83 f8 61             	cmp    $0x61,%eax
    1817:	75 61                	jne    187a <parseexec+0x10a>
    cmd->argv[argc] = q;
    1819:	8b 45 e0             	mov    -0x20(%ebp),%eax
    181c:	83 c3 04             	add    $0x4,%ebx
    argc++;
    181f:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    cmd->argv[argc] = q;
    1823:	89 03                	mov    %eax,(%ebx)
    cmd->eargv[argc] = eq;
    1825:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1828:	89 43 28             	mov    %eax,0x28(%ebx)
    if(argc >= MAXARGS)
    182b:	83 7d d4 0a          	cmpl   $0xa,-0x2c(%ebp)
    182f:	75 97                	jne    17c8 <parseexec+0x58>
      panic("too many args");
    1831:	c7 04 24 41 23 00 00 	movl   $0x2341,(%esp)
    1838:	e8 23 f9 ff ff       	call   1160 <panic>
    183d:	8d 76 00             	lea    0x0(%esi),%esi
    return parseblock(ps, es);
    1840:	89 7c 24 04          	mov    %edi,0x4(%esp)
    1844:	89 34 24             	mov    %esi,(%esp)
    1847:	e8 84 01 00 00       	call   19d0 <parseblock>
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
    184c:	83 c4 3c             	add    $0x3c,%esp
    184f:	5b                   	pop    %ebx
    1850:	5e                   	pop    %esi
    1851:	5f                   	pop    %edi
    1852:	5d                   	pop    %ebp
    1853:	c3                   	ret    
    1854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1858:	8b 45 cc             	mov    -0x34(%ebp),%eax
    185b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    185e:	8d 04 90             	lea    (%eax,%edx,4),%eax
  cmd->argv[argc] = 0;
    1861:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
    1868:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  return ret;
    186f:	8b 45 d0             	mov    -0x30(%ebp),%eax
}
    1872:	83 c4 3c             	add    $0x3c,%esp
    1875:	5b                   	pop    %ebx
    1876:	5e                   	pop    %esi
    1877:	5f                   	pop    %edi
    1878:	5d                   	pop    %ebp
    1879:	c3                   	ret    
      panic("syntax");
    187a:	c7 04 24 3a 23 00 00 	movl   $0x233a,(%esp)
    1881:	e8 da f8 ff ff       	call   1160 <panic>
    1886:	8d 76 00             	lea    0x0(%esi),%esi
    1889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001890 <parsepipe>:
{
    1890:	55                   	push   %ebp
    1891:	89 e5                	mov    %esp,%ebp
    1893:	57                   	push   %edi
    1894:	56                   	push   %esi
    1895:	53                   	push   %ebx
    1896:	83 ec 1c             	sub    $0x1c,%esp
    1899:	8b 5d 08             	mov    0x8(%ebp),%ebx
    189c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parseexec(ps, es);
    189f:	89 1c 24             	mov    %ebx,(%esp)
    18a2:	89 74 24 04          	mov    %esi,0x4(%esp)
    18a6:	e8 c5 fe ff ff       	call   1770 <parseexec>
  if(peek(ps, es, "|")){
    18ab:	c7 44 24 08 54 23 00 	movl   $0x2354,0x8(%esp)
    18b2:	00 
    18b3:	89 74 24 04          	mov    %esi,0x4(%esp)
    18b7:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseexec(ps, es);
    18ba:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
    18bc:	e8 6f fd ff ff       	call   1630 <peek>
    18c1:	85 c0                	test   %eax,%eax
    18c3:	75 0b                	jne    18d0 <parsepipe+0x40>
}
    18c5:	83 c4 1c             	add    $0x1c,%esp
    18c8:	89 f8                	mov    %edi,%eax
    18ca:	5b                   	pop    %ebx
    18cb:	5e                   	pop    %esi
    18cc:	5f                   	pop    %edi
    18cd:	5d                   	pop    %ebp
    18ce:	c3                   	ret    
    18cf:	90                   	nop
    gettoken(ps, es, 0, 0);
    18d0:	89 74 24 04          	mov    %esi,0x4(%esp)
    18d4:	89 1c 24             	mov    %ebx,(%esp)
    18d7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    18de:	00 
    18df:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    18e6:	00 
    18e7:	e8 04 fc ff ff       	call   14f0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
    18ec:	89 74 24 04          	mov    %esi,0x4(%esp)
    18f0:	89 1c 24             	mov    %ebx,(%esp)
    18f3:	e8 98 ff ff ff       	call   1890 <parsepipe>
    18f8:	89 7d 08             	mov    %edi,0x8(%ebp)
    18fb:	89 45 0c             	mov    %eax,0xc(%ebp)
}
    18fe:	83 c4 1c             	add    $0x1c,%esp
    1901:	5b                   	pop    %ebx
    1902:	5e                   	pop    %esi
    1903:	5f                   	pop    %edi
    1904:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    1905:	e9 f6 fa ff ff       	jmp    1400 <pipecmd>
    190a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001910 <parseline>:
{
    1910:	55                   	push   %ebp
    1911:	89 e5                	mov    %esp,%ebp
    1913:	57                   	push   %edi
    1914:	56                   	push   %esi
    1915:	53                   	push   %ebx
    1916:	83 ec 1c             	sub    $0x1c,%esp
    1919:	8b 5d 08             	mov    0x8(%ebp),%ebx
    191c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
    191f:	89 1c 24             	mov    %ebx,(%esp)
    1922:	89 74 24 04          	mov    %esi,0x4(%esp)
    1926:	e8 65 ff ff ff       	call   1890 <parsepipe>
    192b:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
    192d:	eb 27                	jmp    1956 <parseline+0x46>
    192f:	90                   	nop
    gettoken(ps, es, 0, 0);
    1930:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1937:	00 
    1938:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    193f:	00 
    1940:	89 74 24 04          	mov    %esi,0x4(%esp)
    1944:	89 1c 24             	mov    %ebx,(%esp)
    1947:	e8 a4 fb ff ff       	call   14f0 <gettoken>
    cmd = backcmd(cmd);
    194c:	89 3c 24             	mov    %edi,(%esp)
    194f:	e8 4c fb ff ff       	call   14a0 <backcmd>
    1954:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
    1956:	c7 44 24 08 56 23 00 	movl   $0x2356,0x8(%esp)
    195d:	00 
    195e:	89 74 24 04          	mov    %esi,0x4(%esp)
    1962:	89 1c 24             	mov    %ebx,(%esp)
    1965:	e8 c6 fc ff ff       	call   1630 <peek>
    196a:	85 c0                	test   %eax,%eax
    196c:	75 c2                	jne    1930 <parseline+0x20>
  if(peek(ps, es, ";")){
    196e:	c7 44 24 08 52 23 00 	movl   $0x2352,0x8(%esp)
    1975:	00 
    1976:	89 74 24 04          	mov    %esi,0x4(%esp)
    197a:	89 1c 24             	mov    %ebx,(%esp)
    197d:	e8 ae fc ff ff       	call   1630 <peek>
    1982:	85 c0                	test   %eax,%eax
    1984:	75 0a                	jne    1990 <parseline+0x80>
}
    1986:	83 c4 1c             	add    $0x1c,%esp
    1989:	89 f8                	mov    %edi,%eax
    198b:	5b                   	pop    %ebx
    198c:	5e                   	pop    %esi
    198d:	5f                   	pop    %edi
    198e:	5d                   	pop    %ebp
    198f:	c3                   	ret    
    gettoken(ps, es, 0, 0);
    1990:	89 74 24 04          	mov    %esi,0x4(%esp)
    1994:	89 1c 24             	mov    %ebx,(%esp)
    1997:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    199e:	00 
    199f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    19a6:	00 
    19a7:	e8 44 fb ff ff       	call   14f0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
    19ac:	89 74 24 04          	mov    %esi,0x4(%esp)
    19b0:	89 1c 24             	mov    %ebx,(%esp)
    19b3:	e8 58 ff ff ff       	call   1910 <parseline>
    19b8:	89 7d 08             	mov    %edi,0x8(%ebp)
    19bb:	89 45 0c             	mov    %eax,0xc(%ebp)
}
    19be:	83 c4 1c             	add    $0x1c,%esp
    19c1:	5b                   	pop    %ebx
    19c2:	5e                   	pop    %esi
    19c3:	5f                   	pop    %edi
    19c4:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
    19c5:	e9 86 fa ff ff       	jmp    1450 <listcmd>
    19ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000019d0 <parseblock>:
{
    19d0:	55                   	push   %ebp
    19d1:	89 e5                	mov    %esp,%ebp
    19d3:	57                   	push   %edi
    19d4:	56                   	push   %esi
    19d5:	53                   	push   %ebx
    19d6:	83 ec 1c             	sub    $0x1c,%esp
    19d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    19dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
    19df:	c7 44 24 08 38 23 00 	movl   $0x2338,0x8(%esp)
    19e6:	00 
    19e7:	89 1c 24             	mov    %ebx,(%esp)
    19ea:	89 74 24 04          	mov    %esi,0x4(%esp)
    19ee:	e8 3d fc ff ff       	call   1630 <peek>
    19f3:	85 c0                	test   %eax,%eax
    19f5:	74 76                	je     1a6d <parseblock+0x9d>
  gettoken(ps, es, 0, 0);
    19f7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    19fe:	00 
    19ff:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1a06:	00 
    1a07:	89 74 24 04          	mov    %esi,0x4(%esp)
    1a0b:	89 1c 24             	mov    %ebx,(%esp)
    1a0e:	e8 dd fa ff ff       	call   14f0 <gettoken>
  cmd = parseline(ps, es);
    1a13:	89 74 24 04          	mov    %esi,0x4(%esp)
    1a17:	89 1c 24             	mov    %ebx,(%esp)
    1a1a:	e8 f1 fe ff ff       	call   1910 <parseline>
  if(!peek(ps, es, ")"))
    1a1f:	c7 44 24 08 74 23 00 	movl   $0x2374,0x8(%esp)
    1a26:	00 
    1a27:	89 74 24 04          	mov    %esi,0x4(%esp)
    1a2b:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseline(ps, es);
    1a2e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
    1a30:	e8 fb fb ff ff       	call   1630 <peek>
    1a35:	85 c0                	test   %eax,%eax
    1a37:	74 40                	je     1a79 <parseblock+0xa9>
  gettoken(ps, es, 0, 0);
    1a39:	89 74 24 04          	mov    %esi,0x4(%esp)
    1a3d:	89 1c 24             	mov    %ebx,(%esp)
    1a40:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1a47:	00 
    1a48:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1a4f:	00 
    1a50:	e8 9b fa ff ff       	call   14f0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
    1a55:	89 74 24 08          	mov    %esi,0x8(%esp)
    1a59:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1a5d:	89 3c 24             	mov    %edi,(%esp)
    1a60:	e8 2b fc ff ff       	call   1690 <parseredirs>
}
    1a65:	83 c4 1c             	add    $0x1c,%esp
    1a68:	5b                   	pop    %ebx
    1a69:	5e                   	pop    %esi
    1a6a:	5f                   	pop    %edi
    1a6b:	5d                   	pop    %ebp
    1a6c:	c3                   	ret    
    panic("parseblock");
    1a6d:	c7 04 24 58 23 00 00 	movl   $0x2358,(%esp)
    1a74:	e8 e7 f6 ff ff       	call   1160 <panic>
    panic("syntax - missing )");
    1a79:	c7 04 24 63 23 00 00 	movl   $0x2363,(%esp)
    1a80:	e8 db f6 ff ff       	call   1160 <panic>
    1a85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001a90 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
    1a90:	55                   	push   %ebp
    1a91:	89 e5                	mov    %esp,%ebp
    1a93:	53                   	push   %ebx
    1a94:	83 ec 14             	sub    $0x14,%esp
    1a97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1a9a:	85 db                	test   %ebx,%ebx
    1a9c:	0f 84 8e 00 00 00    	je     1b30 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
    1aa2:	83 3b 05             	cmpl   $0x5,(%ebx)
    1aa5:	77 49                	ja     1af0 <nulterminate+0x60>
    1aa7:	8b 03                	mov    (%ebx),%eax
    1aa9:	ff 24 85 b4 23 00 00 	jmp    *0x23b4(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    1ab0:	8b 43 04             	mov    0x4(%ebx),%eax
    1ab3:	89 04 24             	mov    %eax,(%esp)
    1ab6:	e8 d5 ff ff ff       	call   1a90 <nulterminate>
    nulterminate(lcmd->right);
    1abb:	8b 43 08             	mov    0x8(%ebx),%eax
    1abe:	89 04 24             	mov    %eax,(%esp)
    1ac1:	e8 ca ff ff ff       	call   1a90 <nulterminate>
    break;
    1ac6:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
    1ac8:	83 c4 14             	add    $0x14,%esp
    1acb:	5b                   	pop    %ebx
    1acc:	5d                   	pop    %ebp
    1acd:	c3                   	ret    
    1ace:	66 90                	xchg   %ax,%ax
    for(i=0; ecmd->argv[i]; i++)
    1ad0:	8b 4b 04             	mov    0x4(%ebx),%ecx
    1ad3:	89 d8                	mov    %ebx,%eax
    1ad5:	85 c9                	test   %ecx,%ecx
    1ad7:	74 17                	je     1af0 <nulterminate+0x60>
    1ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
    1ae0:	8b 50 2c             	mov    0x2c(%eax),%edx
    1ae3:	83 c0 04             	add    $0x4,%eax
    1ae6:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
    1ae9:	8b 50 04             	mov    0x4(%eax),%edx
    1aec:	85 d2                	test   %edx,%edx
    1aee:	75 f0                	jne    1ae0 <nulterminate+0x50>
}
    1af0:	83 c4 14             	add    $0x14,%esp
  switch(cmd->type){
    1af3:	89 d8                	mov    %ebx,%eax
}
    1af5:	5b                   	pop    %ebx
    1af6:	5d                   	pop    %ebp
    1af7:	c3                   	ret    
    nulterminate(bcmd->cmd);
    1af8:	8b 43 04             	mov    0x4(%ebx),%eax
    1afb:	89 04 24             	mov    %eax,(%esp)
    1afe:	e8 8d ff ff ff       	call   1a90 <nulterminate>
}
    1b03:	83 c4 14             	add    $0x14,%esp
    break;
    1b06:	89 d8                	mov    %ebx,%eax
}
    1b08:	5b                   	pop    %ebx
    1b09:	5d                   	pop    %ebp
    1b0a:	c3                   	ret    
    1b0b:	90                   	nop
    1b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(rcmd->cmd);
    1b10:	8b 43 04             	mov    0x4(%ebx),%eax
    1b13:	89 04 24             	mov    %eax,(%esp)
    1b16:	e8 75 ff ff ff       	call   1a90 <nulterminate>
    *rcmd->efile = 0;
    1b1b:	8b 43 0c             	mov    0xc(%ebx),%eax
    1b1e:	c6 00 00             	movb   $0x0,(%eax)
}
    1b21:	83 c4 14             	add    $0x14,%esp
    break;
    1b24:	89 d8                	mov    %ebx,%eax
}
    1b26:	5b                   	pop    %ebx
    1b27:	5d                   	pop    %ebp
    1b28:	c3                   	ret    
    1b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return 0;
    1b30:	31 c0                	xor    %eax,%eax
    1b32:	eb 94                	jmp    1ac8 <nulterminate+0x38>
    1b34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1b3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001b40 <parsecmd>:
{
    1b40:	55                   	push   %ebp
    1b41:	89 e5                	mov    %esp,%ebp
    1b43:	56                   	push   %esi
    1b44:	53                   	push   %ebx
    1b45:	83 ec 10             	sub    $0x10,%esp
  es = s + strlen(s);
    1b48:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1b4b:	89 1c 24             	mov    %ebx,(%esp)
    1b4e:	e8 ed 00 00 00       	call   1c40 <strlen>
    1b53:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
    1b55:	8d 45 08             	lea    0x8(%ebp),%eax
    1b58:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1b5c:	89 04 24             	mov    %eax,(%esp)
    1b5f:	e8 ac fd ff ff       	call   1910 <parseline>
  peek(&s, es, "");
    1b64:	c7 44 24 08 02 23 00 	movl   $0x2302,0x8(%esp)
    1b6b:	00 
    1b6c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  cmd = parseline(&s, es);
    1b70:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
    1b72:	8d 45 08             	lea    0x8(%ebp),%eax
    1b75:	89 04 24             	mov    %eax,(%esp)
    1b78:	e8 b3 fa ff ff       	call   1630 <peek>
  if(s != es){
    1b7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b80:	39 d8                	cmp    %ebx,%eax
    1b82:	75 11                	jne    1b95 <parsecmd+0x55>
  nulterminate(cmd);
    1b84:	89 34 24             	mov    %esi,(%esp)
    1b87:	e8 04 ff ff ff       	call   1a90 <nulterminate>
}
    1b8c:	83 c4 10             	add    $0x10,%esp
    1b8f:	89 f0                	mov    %esi,%eax
    1b91:	5b                   	pop    %ebx
    1b92:	5e                   	pop    %esi
    1b93:	5d                   	pop    %ebp
    1b94:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
    1b95:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b99:	c7 44 24 04 76 23 00 	movl   $0x2376,0x4(%esp)
    1ba0:	00 
    1ba1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1ba8:	e8 93 03 00 00       	call   1f40 <printf>
    panic("syntax");
    1bad:	c7 04 24 3a 23 00 00 	movl   $0x233a,(%esp)
    1bb4:	e8 a7 f5 ff ff       	call   1160 <panic>
    1bb9:	66 90                	xchg   %ax,%ax
    1bbb:	66 90                	xchg   %ax,%ax
    1bbd:	66 90                	xchg   %ax,%ax
    1bbf:	90                   	nop

00001bc0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1bc0:	55                   	push   %ebp
    1bc1:	89 e5                	mov    %esp,%ebp
    1bc3:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1bc9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1bca:	89 c2                	mov    %eax,%edx
    1bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1bd0:	83 c1 01             	add    $0x1,%ecx
    1bd3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1bd7:	83 c2 01             	add    $0x1,%edx
    1bda:	84 db                	test   %bl,%bl
    1bdc:	88 5a ff             	mov    %bl,-0x1(%edx)
    1bdf:	75 ef                	jne    1bd0 <strcpy+0x10>
    ;
  return os;
}
    1be1:	5b                   	pop    %ebx
    1be2:	5d                   	pop    %ebp
    1be3:	c3                   	ret    
    1be4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1bea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001bf0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1bf0:	55                   	push   %ebp
    1bf1:	89 e5                	mov    %esp,%ebp
    1bf3:	8b 55 08             	mov    0x8(%ebp),%edx
    1bf6:	53                   	push   %ebx
    1bf7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    1bfa:	0f b6 02             	movzbl (%edx),%eax
    1bfd:	84 c0                	test   %al,%al
    1bff:	74 2d                	je     1c2e <strcmp+0x3e>
    1c01:	0f b6 19             	movzbl (%ecx),%ebx
    1c04:	38 d8                	cmp    %bl,%al
    1c06:	74 0e                	je     1c16 <strcmp+0x26>
    1c08:	eb 2b                	jmp    1c35 <strcmp+0x45>
    1c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1c10:	38 c8                	cmp    %cl,%al
    1c12:	75 15                	jne    1c29 <strcmp+0x39>
    p++, q++;
    1c14:	89 d9                	mov    %ebx,%ecx
    1c16:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1c19:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1c1c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1c1f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    1c23:	84 c0                	test   %al,%al
    1c25:	75 e9                	jne    1c10 <strcmp+0x20>
    1c27:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1c29:	29 c8                	sub    %ecx,%eax
}
    1c2b:	5b                   	pop    %ebx
    1c2c:	5d                   	pop    %ebp
    1c2d:	c3                   	ret    
    1c2e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    1c31:	31 c0                	xor    %eax,%eax
    1c33:	eb f4                	jmp    1c29 <strcmp+0x39>
    1c35:	0f b6 cb             	movzbl %bl,%ecx
    1c38:	eb ef                	jmp    1c29 <strcmp+0x39>
    1c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001c40 <strlen>:

uint
strlen(char *s)
{
    1c40:	55                   	push   %ebp
    1c41:	89 e5                	mov    %esp,%ebp
    1c43:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1c46:	80 39 00             	cmpb   $0x0,(%ecx)
    1c49:	74 12                	je     1c5d <strlen+0x1d>
    1c4b:	31 d2                	xor    %edx,%edx
    1c4d:	8d 76 00             	lea    0x0(%esi),%esi
    1c50:	83 c2 01             	add    $0x1,%edx
    1c53:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1c57:	89 d0                	mov    %edx,%eax
    1c59:	75 f5                	jne    1c50 <strlen+0x10>
    ;
  return n;
}
    1c5b:	5d                   	pop    %ebp
    1c5c:	c3                   	ret    
  for(n = 0; s[n]; n++)
    1c5d:	31 c0                	xor    %eax,%eax
}
    1c5f:	5d                   	pop    %ebp
    1c60:	c3                   	ret    
    1c61:	eb 0d                	jmp    1c70 <memset>
    1c63:	90                   	nop
    1c64:	90                   	nop
    1c65:	90                   	nop
    1c66:	90                   	nop
    1c67:	90                   	nop
    1c68:	90                   	nop
    1c69:	90                   	nop
    1c6a:	90                   	nop
    1c6b:	90                   	nop
    1c6c:	90                   	nop
    1c6d:	90                   	nop
    1c6e:	90                   	nop
    1c6f:	90                   	nop

00001c70 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1c70:	55                   	push   %ebp
    1c71:	89 e5                	mov    %esp,%ebp
    1c73:	8b 55 08             	mov    0x8(%ebp),%edx
    1c76:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1c77:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1c7a:	8b 45 0c             	mov    0xc(%ebp),%eax
    1c7d:	89 d7                	mov    %edx,%edi
    1c7f:	fc                   	cld    
    1c80:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1c82:	89 d0                	mov    %edx,%eax
    1c84:	5f                   	pop    %edi
    1c85:	5d                   	pop    %ebp
    1c86:	c3                   	ret    
    1c87:	89 f6                	mov    %esi,%esi
    1c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c90 <strchr>:

char*
strchr(const char *s, char c)
{
    1c90:	55                   	push   %ebp
    1c91:	89 e5                	mov    %esp,%ebp
    1c93:	8b 45 08             	mov    0x8(%ebp),%eax
    1c96:	53                   	push   %ebx
    1c97:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    1c9a:	0f b6 18             	movzbl (%eax),%ebx
    1c9d:	84 db                	test   %bl,%bl
    1c9f:	74 1d                	je     1cbe <strchr+0x2e>
    if(*s == c)
    1ca1:	38 d3                	cmp    %dl,%bl
    1ca3:	89 d1                	mov    %edx,%ecx
    1ca5:	75 0d                	jne    1cb4 <strchr+0x24>
    1ca7:	eb 17                	jmp    1cc0 <strchr+0x30>
    1ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1cb0:	38 ca                	cmp    %cl,%dl
    1cb2:	74 0c                	je     1cc0 <strchr+0x30>
  for(; *s; s++)
    1cb4:	83 c0 01             	add    $0x1,%eax
    1cb7:	0f b6 10             	movzbl (%eax),%edx
    1cba:	84 d2                	test   %dl,%dl
    1cbc:	75 f2                	jne    1cb0 <strchr+0x20>
      return (char*)s;
  return 0;
    1cbe:	31 c0                	xor    %eax,%eax
}
    1cc0:	5b                   	pop    %ebx
    1cc1:	5d                   	pop    %ebp
    1cc2:	c3                   	ret    
    1cc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001cd0 <gets>:

char*
gets(char *buf, int max)
{
    1cd0:	55                   	push   %ebp
    1cd1:	89 e5                	mov    %esp,%ebp
    1cd3:	57                   	push   %edi
    1cd4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1cd5:	31 f6                	xor    %esi,%esi
{
    1cd7:	53                   	push   %ebx
    1cd8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    1cdb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    1cde:	eb 31                	jmp    1d11 <gets+0x41>
    cc = read(0, &c, 1);
    1ce0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1ce7:	00 
    1ce8:	89 7c 24 04          	mov    %edi,0x4(%esp)
    1cec:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cf3:	e8 02 01 00 00       	call   1dfa <read>
    if(cc < 1)
    1cf8:	85 c0                	test   %eax,%eax
    1cfa:	7e 1d                	jle    1d19 <gets+0x49>
      break;
    buf[i++] = c;
    1cfc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    1d00:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    1d02:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1d05:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    1d07:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1d0b:	74 0c                	je     1d19 <gets+0x49>
    1d0d:	3c 0a                	cmp    $0xa,%al
    1d0f:	74 08                	je     1d19 <gets+0x49>
  for(i=0; i+1 < max; ){
    1d11:	8d 5e 01             	lea    0x1(%esi),%ebx
    1d14:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1d17:	7c c7                	jl     1ce0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1d19:	8b 45 08             	mov    0x8(%ebp),%eax
    1d1c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1d20:	83 c4 2c             	add    $0x2c,%esp
    1d23:	5b                   	pop    %ebx
    1d24:	5e                   	pop    %esi
    1d25:	5f                   	pop    %edi
    1d26:	5d                   	pop    %ebp
    1d27:	c3                   	ret    
    1d28:	90                   	nop
    1d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001d30 <stat>:

int
stat(char *n, struct stat *st)
{
    1d30:	55                   	push   %ebp
    1d31:	89 e5                	mov    %esp,%ebp
    1d33:	56                   	push   %esi
    1d34:	53                   	push   %ebx
    1d35:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1d38:	8b 45 08             	mov    0x8(%ebp),%eax
    1d3b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1d42:	00 
    1d43:	89 04 24             	mov    %eax,(%esp)
    1d46:	e8 d7 00 00 00       	call   1e22 <open>
  if(fd < 0)
    1d4b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    1d4d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    1d4f:	78 27                	js     1d78 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    1d51:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d54:	89 1c 24             	mov    %ebx,(%esp)
    1d57:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d5b:	e8 da 00 00 00       	call   1e3a <fstat>
  close(fd);
    1d60:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1d63:	89 c6                	mov    %eax,%esi
  close(fd);
    1d65:	e8 a0 00 00 00       	call   1e0a <close>
  return r;
    1d6a:	89 f0                	mov    %esi,%eax
}
    1d6c:	83 c4 10             	add    $0x10,%esp
    1d6f:	5b                   	pop    %ebx
    1d70:	5e                   	pop    %esi
    1d71:	5d                   	pop    %ebp
    1d72:	c3                   	ret    
    1d73:	90                   	nop
    1d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1d78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1d7d:	eb ed                	jmp    1d6c <stat+0x3c>
    1d7f:	90                   	nop

00001d80 <atoi>:

int
atoi(const char *s)
{
    1d80:	55                   	push   %ebp
    1d81:	89 e5                	mov    %esp,%ebp
    1d83:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1d86:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1d87:	0f be 11             	movsbl (%ecx),%edx
    1d8a:	8d 42 d0             	lea    -0x30(%edx),%eax
    1d8d:	3c 09                	cmp    $0x9,%al
  n = 0;
    1d8f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1d94:	77 17                	ja     1dad <atoi+0x2d>
    1d96:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1d98:	83 c1 01             	add    $0x1,%ecx
    1d9b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1d9e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1da2:	0f be 11             	movsbl (%ecx),%edx
    1da5:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1da8:	80 fb 09             	cmp    $0x9,%bl
    1dab:	76 eb                	jbe    1d98 <atoi+0x18>
  return n;
}
    1dad:	5b                   	pop    %ebx
    1dae:	5d                   	pop    %ebp
    1daf:	c3                   	ret    

00001db0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1db0:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1db1:	31 d2                	xor    %edx,%edx
{
    1db3:	89 e5                	mov    %esp,%ebp
    1db5:	56                   	push   %esi
    1db6:	8b 45 08             	mov    0x8(%ebp),%eax
    1db9:	53                   	push   %ebx
    1dba:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1dbd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    1dc0:	85 db                	test   %ebx,%ebx
    1dc2:	7e 12                	jle    1dd6 <memmove+0x26>
    1dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1dc8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    1dcc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    1dcf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1dd2:	39 da                	cmp    %ebx,%edx
    1dd4:	75 f2                	jne    1dc8 <memmove+0x18>
  return vdst;
}
    1dd6:	5b                   	pop    %ebx
    1dd7:	5e                   	pop    %esi
    1dd8:	5d                   	pop    %ebp
    1dd9:	c3                   	ret    

00001dda <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1dda:	b8 01 00 00 00       	mov    $0x1,%eax
    1ddf:	cd 40                	int    $0x40
    1de1:	c3                   	ret    

00001de2 <exit>:
SYSCALL(exit)
    1de2:	b8 02 00 00 00       	mov    $0x2,%eax
    1de7:	cd 40                	int    $0x40
    1de9:	c3                   	ret    

00001dea <wait>:
SYSCALL(wait)
    1dea:	b8 03 00 00 00       	mov    $0x3,%eax
    1def:	cd 40                	int    $0x40
    1df1:	c3                   	ret    

00001df2 <pipe>:
SYSCALL(pipe)
    1df2:	b8 04 00 00 00       	mov    $0x4,%eax
    1df7:	cd 40                	int    $0x40
    1df9:	c3                   	ret    

00001dfa <read>:
SYSCALL(read)
    1dfa:	b8 05 00 00 00       	mov    $0x5,%eax
    1dff:	cd 40                	int    $0x40
    1e01:	c3                   	ret    

00001e02 <write>:
SYSCALL(write)
    1e02:	b8 10 00 00 00       	mov    $0x10,%eax
    1e07:	cd 40                	int    $0x40
    1e09:	c3                   	ret    

00001e0a <close>:
SYSCALL(close)
    1e0a:	b8 15 00 00 00       	mov    $0x15,%eax
    1e0f:	cd 40                	int    $0x40
    1e11:	c3                   	ret    

00001e12 <kill>:
SYSCALL(kill)
    1e12:	b8 06 00 00 00       	mov    $0x6,%eax
    1e17:	cd 40                	int    $0x40
    1e19:	c3                   	ret    

00001e1a <exec>:
SYSCALL(exec)
    1e1a:	b8 07 00 00 00       	mov    $0x7,%eax
    1e1f:	cd 40                	int    $0x40
    1e21:	c3                   	ret    

00001e22 <open>:
SYSCALL(open)
    1e22:	b8 0f 00 00 00       	mov    $0xf,%eax
    1e27:	cd 40                	int    $0x40
    1e29:	c3                   	ret    

00001e2a <mknod>:
SYSCALL(mknod)
    1e2a:	b8 11 00 00 00       	mov    $0x11,%eax
    1e2f:	cd 40                	int    $0x40
    1e31:	c3                   	ret    

00001e32 <unlink>:
SYSCALL(unlink)
    1e32:	b8 12 00 00 00       	mov    $0x12,%eax
    1e37:	cd 40                	int    $0x40
    1e39:	c3                   	ret    

00001e3a <fstat>:
SYSCALL(fstat)
    1e3a:	b8 08 00 00 00       	mov    $0x8,%eax
    1e3f:	cd 40                	int    $0x40
    1e41:	c3                   	ret    

00001e42 <link>:
SYSCALL(link)
    1e42:	b8 13 00 00 00       	mov    $0x13,%eax
    1e47:	cd 40                	int    $0x40
    1e49:	c3                   	ret    

00001e4a <mkdir>:
SYSCALL(mkdir)
    1e4a:	b8 14 00 00 00       	mov    $0x14,%eax
    1e4f:	cd 40                	int    $0x40
    1e51:	c3                   	ret    

00001e52 <chdir>:
SYSCALL(chdir)
    1e52:	b8 09 00 00 00       	mov    $0x9,%eax
    1e57:	cd 40                	int    $0x40
    1e59:	c3                   	ret    

00001e5a <dup>:
SYSCALL(dup)
    1e5a:	b8 0a 00 00 00       	mov    $0xa,%eax
    1e5f:	cd 40                	int    $0x40
    1e61:	c3                   	ret    

00001e62 <getpid>:
SYSCALL(getpid)
    1e62:	b8 0b 00 00 00       	mov    $0xb,%eax
    1e67:	cd 40                	int    $0x40
    1e69:	c3                   	ret    

00001e6a <sbrk>:
SYSCALL(sbrk)
    1e6a:	b8 0c 00 00 00       	mov    $0xc,%eax
    1e6f:	cd 40                	int    $0x40
    1e71:	c3                   	ret    

00001e72 <sleep>:
SYSCALL(sleep)
    1e72:	b8 0d 00 00 00       	mov    $0xd,%eax
    1e77:	cd 40                	int    $0x40
    1e79:	c3                   	ret    

00001e7a <uptime>:
SYSCALL(uptime)
    1e7a:	b8 0e 00 00 00       	mov    $0xe,%eax
    1e7f:	cd 40                	int    $0x40
    1e81:	c3                   	ret    

00001e82 <shm_open>:
SYSCALL(shm_open)
    1e82:	b8 16 00 00 00       	mov    $0x16,%eax
    1e87:	cd 40                	int    $0x40
    1e89:	c3                   	ret    

00001e8a <shm_close>:
SYSCALL(shm_close)	
    1e8a:	b8 17 00 00 00       	mov    $0x17,%eax
    1e8f:	cd 40                	int    $0x40
    1e91:	c3                   	ret    
    1e92:	66 90                	xchg   %ax,%ax
    1e94:	66 90                	xchg   %ax,%ax
    1e96:	66 90                	xchg   %ax,%ax
    1e98:	66 90                	xchg   %ax,%ax
    1e9a:	66 90                	xchg   %ax,%ax
    1e9c:	66 90                	xchg   %ax,%ax
    1e9e:	66 90                	xchg   %ax,%ax

00001ea0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1ea0:	55                   	push   %ebp
    1ea1:	89 e5                	mov    %esp,%ebp
    1ea3:	57                   	push   %edi
    1ea4:	56                   	push   %esi
    1ea5:	89 c6                	mov    %eax,%esi
    1ea7:	53                   	push   %ebx
    1ea8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1eab:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1eae:	85 db                	test   %ebx,%ebx
    1eb0:	74 09                	je     1ebb <printint+0x1b>
    1eb2:	89 d0                	mov    %edx,%eax
    1eb4:	c1 e8 1f             	shr    $0x1f,%eax
    1eb7:	84 c0                	test   %al,%al
    1eb9:	75 75                	jne    1f30 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1ebb:	89 d0                	mov    %edx,%eax
  neg = 0;
    1ebd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1ec4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    1ec7:	31 ff                	xor    %edi,%edi
    1ec9:	89 ce                	mov    %ecx,%esi
    1ecb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1ece:	eb 02                	jmp    1ed2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1ed0:	89 cf                	mov    %ecx,%edi
    1ed2:	31 d2                	xor    %edx,%edx
    1ed4:	f7 f6                	div    %esi
    1ed6:	8d 4f 01             	lea    0x1(%edi),%ecx
    1ed9:	0f b6 92 d3 23 00 00 	movzbl 0x23d3(%edx),%edx
  }while((x /= base) != 0);
    1ee0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1ee2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1ee5:	75 e9                	jne    1ed0 <printint+0x30>
  if(neg)
    1ee7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    1eea:	89 c8                	mov    %ecx,%eax
    1eec:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    1eef:	85 d2                	test   %edx,%edx
    1ef1:	74 08                	je     1efb <printint+0x5b>
    buf[i++] = '-';
    1ef3:	8d 4f 02             	lea    0x2(%edi),%ecx
    1ef6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    1efb:	8d 79 ff             	lea    -0x1(%ecx),%edi
    1efe:	66 90                	xchg   %ax,%ax
    1f00:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1f05:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    1f08:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1f0f:	00 
    1f10:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1f14:	89 34 24             	mov    %esi,(%esp)
    1f17:	88 45 d7             	mov    %al,-0x29(%ebp)
    1f1a:	e8 e3 fe ff ff       	call   1e02 <write>
  while(--i >= 0)
    1f1f:	83 ff ff             	cmp    $0xffffffff,%edi
    1f22:	75 dc                	jne    1f00 <printint+0x60>
    putc(fd, buf[i]);
}
    1f24:	83 c4 4c             	add    $0x4c,%esp
    1f27:	5b                   	pop    %ebx
    1f28:	5e                   	pop    %esi
    1f29:	5f                   	pop    %edi
    1f2a:	5d                   	pop    %ebp
    1f2b:	c3                   	ret    
    1f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    1f30:	89 d0                	mov    %edx,%eax
    1f32:	f7 d8                	neg    %eax
    neg = 1;
    1f34:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    1f3b:	eb 87                	jmp    1ec4 <printint+0x24>
    1f3d:	8d 76 00             	lea    0x0(%esi),%esi

00001f40 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1f40:	55                   	push   %ebp
    1f41:	89 e5                	mov    %esp,%ebp
    1f43:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1f44:	31 ff                	xor    %edi,%edi
{
    1f46:	56                   	push   %esi
    1f47:	53                   	push   %ebx
    1f48:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1f4b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    1f4e:	8d 45 10             	lea    0x10(%ebp),%eax
{
    1f51:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    1f54:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    1f57:	0f b6 13             	movzbl (%ebx),%edx
    1f5a:	83 c3 01             	add    $0x1,%ebx
    1f5d:	84 d2                	test   %dl,%dl
    1f5f:	75 39                	jne    1f9a <printf+0x5a>
    1f61:	e9 c2 00 00 00       	jmp    2028 <printf+0xe8>
    1f66:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1f68:	83 fa 25             	cmp    $0x25,%edx
    1f6b:	0f 84 bf 00 00 00    	je     2030 <printf+0xf0>
  write(fd, &c, 1);
    1f71:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1f74:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1f7b:	00 
    1f7c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f80:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    1f83:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    1f86:	e8 77 fe ff ff       	call   1e02 <write>
    1f8b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    1f8e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1f92:	84 d2                	test   %dl,%dl
    1f94:	0f 84 8e 00 00 00    	je     2028 <printf+0xe8>
    if(state == 0){
    1f9a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    1f9c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    1f9f:	74 c7                	je     1f68 <printf+0x28>
      }
    } else if(state == '%'){
    1fa1:	83 ff 25             	cmp    $0x25,%edi
    1fa4:	75 e5                	jne    1f8b <printf+0x4b>
      if(c == 'd'){
    1fa6:	83 fa 64             	cmp    $0x64,%edx
    1fa9:	0f 84 31 01 00 00    	je     20e0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1faf:	25 f7 00 00 00       	and    $0xf7,%eax
    1fb4:	83 f8 70             	cmp    $0x70,%eax
    1fb7:	0f 84 83 00 00 00    	je     2040 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1fbd:	83 fa 73             	cmp    $0x73,%edx
    1fc0:	0f 84 a2 00 00 00    	je     2068 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1fc6:	83 fa 63             	cmp    $0x63,%edx
    1fc9:	0f 84 35 01 00 00    	je     2104 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1fcf:	83 fa 25             	cmp    $0x25,%edx
    1fd2:	0f 84 e0 00 00 00    	je     20b8 <printf+0x178>
  write(fd, &c, 1);
    1fd8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1fdb:	83 c3 01             	add    $0x1,%ebx
    1fde:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1fe5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1fe6:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1fe8:	89 44 24 04          	mov    %eax,0x4(%esp)
    1fec:	89 34 24             	mov    %esi,(%esp)
    1fef:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1ff2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1ff6:	e8 07 fe ff ff       	call   1e02 <write>
        putc(fd, c);
    1ffb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    1ffe:	8d 45 e7             	lea    -0x19(%ebp),%eax
    2001:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    2008:	00 
    2009:	89 44 24 04          	mov    %eax,0x4(%esp)
    200d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    2010:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    2013:	e8 ea fd ff ff       	call   1e02 <write>
  for(i = 0; fmt[i]; i++){
    2018:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    201c:	84 d2                	test   %dl,%dl
    201e:	0f 85 76 ff ff ff    	jne    1f9a <printf+0x5a>
    2024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    2028:	83 c4 3c             	add    $0x3c,%esp
    202b:	5b                   	pop    %ebx
    202c:	5e                   	pop    %esi
    202d:	5f                   	pop    %edi
    202e:	5d                   	pop    %ebp
    202f:	c3                   	ret    
        state = '%';
    2030:	bf 25 00 00 00       	mov    $0x25,%edi
    2035:	e9 51 ff ff ff       	jmp    1f8b <printf+0x4b>
    203a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    2040:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2043:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    2048:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    204a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2051:	8b 10                	mov    (%eax),%edx
    2053:	89 f0                	mov    %esi,%eax
    2055:	e8 46 fe ff ff       	call   1ea0 <printint>
        ap++;
    205a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    205e:	e9 28 ff ff ff       	jmp    1f8b <printf+0x4b>
    2063:	90                   	nop
    2064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    2068:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    206b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    206f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    2071:	b8 cc 23 00 00       	mov    $0x23cc,%eax
    2076:	85 ff                	test   %edi,%edi
    2078:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    207b:	0f b6 07             	movzbl (%edi),%eax
    207e:	84 c0                	test   %al,%al
    2080:	74 2a                	je     20ac <printf+0x16c>
    2082:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2088:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    208b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    208e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    2091:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    2098:	00 
    2099:	89 44 24 04          	mov    %eax,0x4(%esp)
    209d:	89 34 24             	mov    %esi,(%esp)
    20a0:	e8 5d fd ff ff       	call   1e02 <write>
        while(*s != 0){
    20a5:	0f b6 07             	movzbl (%edi),%eax
    20a8:	84 c0                	test   %al,%al
    20aa:	75 dc                	jne    2088 <printf+0x148>
      state = 0;
    20ac:	31 ff                	xor    %edi,%edi
    20ae:	e9 d8 fe ff ff       	jmp    1f8b <printf+0x4b>
    20b3:	90                   	nop
    20b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    20b8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    20bb:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    20bd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    20c4:	00 
    20c5:	89 44 24 04          	mov    %eax,0x4(%esp)
    20c9:	89 34 24             	mov    %esi,(%esp)
    20cc:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    20d0:	e8 2d fd ff ff       	call   1e02 <write>
    20d5:	e9 b1 fe ff ff       	jmp    1f8b <printf+0x4b>
    20da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    20e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    20e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    20e8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    20eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20f2:	8b 10                	mov    (%eax),%edx
    20f4:	89 f0                	mov    %esi,%eax
    20f6:	e8 a5 fd ff ff       	call   1ea0 <printint>
        ap++;
    20fb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    20ff:	e9 87 fe ff ff       	jmp    1f8b <printf+0x4b>
        putc(fd, *ap);
    2104:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    2107:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    2109:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    210b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    2112:	00 
    2113:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    2116:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    2119:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    211c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2120:	e8 dd fc ff ff       	call   1e02 <write>
        ap++;
    2125:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    2129:	e9 5d fe ff ff       	jmp    1f8b <printf+0x4b>
    212e:	66 90                	xchg   %ax,%ax

00002130 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    2130:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2131:	a1 24 2a 00 00       	mov    0x2a24,%eax
{
    2136:	89 e5                	mov    %esp,%ebp
    2138:	57                   	push   %edi
    2139:	56                   	push   %esi
    213a:	53                   	push   %ebx
    213b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    213e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    2140:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2143:	39 d0                	cmp    %edx,%eax
    2145:	72 11                	jb     2158 <free+0x28>
    2147:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2148:	39 c8                	cmp    %ecx,%eax
    214a:	72 04                	jb     2150 <free+0x20>
    214c:	39 ca                	cmp    %ecx,%edx
    214e:	72 10                	jb     2160 <free+0x30>
    2150:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2152:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2154:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2156:	73 f0                	jae    2148 <free+0x18>
    2158:	39 ca                	cmp    %ecx,%edx
    215a:	72 04                	jb     2160 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    215c:	39 c8                	cmp    %ecx,%eax
    215e:	72 f0                	jb     2150 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    2160:	8b 73 fc             	mov    -0x4(%ebx),%esi
    2163:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    2166:	39 cf                	cmp    %ecx,%edi
    2168:	74 1e                	je     2188 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    216a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    216d:	8b 48 04             	mov    0x4(%eax),%ecx
    2170:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    2173:	39 f2                	cmp    %esi,%edx
    2175:	74 28                	je     219f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    2177:	89 10                	mov    %edx,(%eax)
  freep = p;
    2179:	a3 24 2a 00 00       	mov    %eax,0x2a24
}
    217e:	5b                   	pop    %ebx
    217f:	5e                   	pop    %esi
    2180:	5f                   	pop    %edi
    2181:	5d                   	pop    %ebp
    2182:	c3                   	ret    
    2183:	90                   	nop
    2184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    2188:	03 71 04             	add    0x4(%ecx),%esi
    218b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    218e:	8b 08                	mov    (%eax),%ecx
    2190:	8b 09                	mov    (%ecx),%ecx
    2192:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    2195:	8b 48 04             	mov    0x4(%eax),%ecx
    2198:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    219b:	39 f2                	cmp    %esi,%edx
    219d:	75 d8                	jne    2177 <free+0x47>
    p->s.size += bp->s.size;
    219f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    21a2:	a3 24 2a 00 00       	mov    %eax,0x2a24
    p->s.size += bp->s.size;
    21a7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    21aa:	8b 53 f8             	mov    -0x8(%ebx),%edx
    21ad:	89 10                	mov    %edx,(%eax)
}
    21af:	5b                   	pop    %ebx
    21b0:	5e                   	pop    %esi
    21b1:	5f                   	pop    %edi
    21b2:	5d                   	pop    %ebp
    21b3:	c3                   	ret    
    21b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    21ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000021c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    21c0:	55                   	push   %ebp
    21c1:	89 e5                	mov    %esp,%ebp
    21c3:	57                   	push   %edi
    21c4:	56                   	push   %esi
    21c5:	53                   	push   %ebx
    21c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    21c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    21cc:	8b 1d 24 2a 00 00    	mov    0x2a24,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    21d2:	8d 48 07             	lea    0x7(%eax),%ecx
    21d5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    21d8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    21da:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    21dd:	0f 84 9b 00 00 00    	je     227e <malloc+0xbe>
    21e3:	8b 13                	mov    (%ebx),%edx
    21e5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    21e8:	39 fe                	cmp    %edi,%esi
    21ea:	76 64                	jbe    2250 <malloc+0x90>
    21ec:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    21f3:	bb 00 80 00 00       	mov    $0x8000,%ebx
    21f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    21fb:	eb 0e                	jmp    220b <malloc+0x4b>
    21fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2200:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    2202:	8b 78 04             	mov    0x4(%eax),%edi
    2205:	39 fe                	cmp    %edi,%esi
    2207:	76 4f                	jbe    2258 <malloc+0x98>
    2209:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    220b:	3b 15 24 2a 00 00    	cmp    0x2a24,%edx
    2211:	75 ed                	jne    2200 <malloc+0x40>
  if(nu < 4096)
    2213:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2216:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    221c:	bf 00 10 00 00       	mov    $0x1000,%edi
    2221:	0f 43 fe             	cmovae %esi,%edi
    2224:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    2227:	89 04 24             	mov    %eax,(%esp)
    222a:	e8 3b fc ff ff       	call   1e6a <sbrk>
  if(p == (char*)-1)
    222f:	83 f8 ff             	cmp    $0xffffffff,%eax
    2232:	74 18                	je     224c <malloc+0x8c>
  hp->s.size = nu;
    2234:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    2237:	83 c0 08             	add    $0x8,%eax
    223a:	89 04 24             	mov    %eax,(%esp)
    223d:	e8 ee fe ff ff       	call   2130 <free>
  return freep;
    2242:	8b 15 24 2a 00 00    	mov    0x2a24,%edx
      if((p = morecore(nunits)) == 0)
    2248:	85 d2                	test   %edx,%edx
    224a:	75 b4                	jne    2200 <malloc+0x40>
        return 0;
    224c:	31 c0                	xor    %eax,%eax
    224e:	eb 20                	jmp    2270 <malloc+0xb0>
    if(p->s.size >= nunits){
    2250:	89 d0                	mov    %edx,%eax
    2252:	89 da                	mov    %ebx,%edx
    2254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    2258:	39 fe                	cmp    %edi,%esi
    225a:	74 1c                	je     2278 <malloc+0xb8>
        p->s.size -= nunits;
    225c:	29 f7                	sub    %esi,%edi
    225e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    2261:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    2264:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    2267:	89 15 24 2a 00 00    	mov    %edx,0x2a24
      return (void*)(p + 1);
    226d:	83 c0 08             	add    $0x8,%eax
  }
}
    2270:	83 c4 1c             	add    $0x1c,%esp
    2273:	5b                   	pop    %ebx
    2274:	5e                   	pop    %esi
    2275:	5f                   	pop    %edi
    2276:	5d                   	pop    %ebp
    2277:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    2278:	8b 08                	mov    (%eax),%ecx
    227a:	89 0a                	mov    %ecx,(%edx)
    227c:	eb e9                	jmp    2267 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    227e:	c7 05 24 2a 00 00 28 	movl   $0x2a28,0x2a24
    2285:	2a 00 00 
    base.s.size = 0;
    2288:	ba 28 2a 00 00       	mov    $0x2a28,%edx
    base.s.ptr = freep = prevp = &base;
    228d:	c7 05 28 2a 00 00 28 	movl   $0x2a28,0x2a28
    2294:	2a 00 00 
    base.s.size = 0;
    2297:	c7 05 2c 2a 00 00 00 	movl   $0x0,0x2a2c
    229e:	00 00 00 
    22a1:	e9 46 ff ff ff       	jmp    21ec <malloc+0x2c>
    22a6:	66 90                	xchg   %ax,%ax
    22a8:	66 90                	xchg   %ax,%ax
    22aa:	66 90                	xchg   %ax,%ax
    22ac:	66 90                	xchg   %ax,%ax
    22ae:	66 90                	xchg   %ax,%ax

000022b0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    22b0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    22b1:	b9 01 00 00 00       	mov    $0x1,%ecx
    22b6:	89 e5                	mov    %esp,%ebp
    22b8:	8b 55 08             	mov    0x8(%ebp),%edx
    22bb:	90                   	nop
    22bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    22c0:	89 c8                	mov    %ecx,%eax
    22c2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    22c5:	85 c0                	test   %eax,%eax
    22c7:	75 f7                	jne    22c0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    22c9:	0f ae f0             	mfence 
}
    22cc:	5d                   	pop    %ebp
    22cd:	c3                   	ret    
    22ce:	66 90                	xchg   %ax,%ax

000022d0 <urelease>:

void urelease (struct uspinlock *lk) {
    22d0:	55                   	push   %ebp
    22d1:	89 e5                	mov    %esp,%ebp
    22d3:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    22d6:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    22d9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    22df:	5d                   	pop    %ebp
    22e0:	c3                   	ret    
