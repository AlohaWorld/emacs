<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Drcom上网登录窗                         </title>
<script language="JavaScript"><!--
sv=0;sv1=0;v6='http://[::]:9002/v6                                     ';myv6ip='                                       ';v4serip='10.4.1.2'       ;m46=0;v46ip='10.8.166.106'                           ;
ps=1;pid='1';calg='12345678';
function safe_add(x,y){
var lsw=(x&0xFFFF)+(y&0xFFFF)
var msw=(x>>16)+(y>>16)+(lsw>>16)
return(msw<<16)|(lsw&0xFFFF)}

function rol(num,cnt){return(num<<cnt)|(num>>>(32-cnt));}
function cmn(q,a,b,x,s,t){return safe_add(rol(safe_add(safe_add(a,q),safe_add(x,t)),s),b);}
function ff(a,b,c,d,x,s,t){return cmn((b&c)|((~b)&d),a,b,x,s,t);}
function gg(a,b,c,d,x,s,t){return cmn((b&d)|(c&(~d)),a,b,x,s,t);}
function hh(a,b,c,d,x,s,t){return cmn(b^c^d,a,b,x,s,t);}
function ii(a,b,c,d,x,s,t){return cmn(c^(b|(~d)),a,b,x,s,t);}
function coreMD5(x){
var a=1732584193
var b=-271733879
var c=-1732584194
var d=271733878
for(i=0; i < x.length; i+=16){
var olda=a
var oldb=b
var oldc=c
var oldd=d
a=ff(a,b,c,d,x[i+0],7,-680876936)
d=ff(d,a,b,c,x[i+1],12,-389564586)
c=ff(c,d,a,b,x[i+2],17,606105819)
b=ff(b,c,d,a,x[i+3],22,-1044525330)
a=ff(a,b,c,d,x[i+4],7,-176418897)
d=ff(d,a,b,c,x[i+5],12,1200080426)
c=ff(c,d,a,b,x[i+6],17,-1473231341)
b=ff(b,c,d,a,x[i+7],22,-45705983)
a=ff(a,b,c,d,x[i+8],7,1770035416)
d=ff(d,a,b,c,x[i+9],12,-1958414417)
c=ff(c,d,a,b,x[i+10],17,-42063)
b=ff(b,c,d,a,x[i+11],22,-1990404162)
a=ff(a,b,c,d,x[i+12],7,1804603682)
d=ff(d,a,b,c,x[i+13],12,-40341101)
c=ff(c,d,a,b,x[i+14],17,-1502002290)
b=ff(b,c,d,a,x[i+15],22,1236535329)
a=gg(a,b,c,d,x[i+1],5,-165796510)
d=gg(d,a,b,c,x[i+6],9,-1069501632)
c=gg(c,d,a,b,x[i+11],14,643717713)
b=gg(b,c,d,a,x[i+0],20,-373897302)
a=gg(a,b,c,d,x[i+5],5,-701558691)
d=gg(d,a,b,c,x[i+10],9,38016083)
c=gg(c,d,a,b,x[i+15],14,-660478335)
b=gg(b,c,d,a,x[i+4],20,-405537848)
a=gg(a,b,c,d,x[i+9],5,568446438)
d=gg(d,a,b,c,x[i+14],9,-1019803690)
c=gg(c,d,a,b,x[i+3],14,-187363961)
b=gg(b,c,d,a,x[i+8],20,1163531501)
a=gg(a,b,c,d,x[i+13],5,-1444681467)
d=gg(d,a,b,c,x[i+2],9,-51403784)
c=gg(c,d,a,b,x[i+7],14,1735328473)
b=gg(b,c,d,a,x[i+12],20,-1926607734)
a=hh(a,b,c,d,x[i+5],4,-378558)
d=hh(d,a,b,c,x[i+8],11,-2022574463)
c=hh(c,d,a,b,x[i+11],16,1839030562)
b=hh(b,c,d,a,x[i+14],23,-35309556)
a=hh(a,b,c,d,x[i+1],4,-1530992060)
d=hh(d,a,b,c,x[i+4],11,1272893353)
c=hh(c,d,a,b,x[i+7],16,-155497632)
b=hh(b,c,d,a,x[i+10],23,-1094730640)
a=hh(a,b,c,d,x[i+13],4,681279174)
d=hh(d,a,b,c,x[i+0],11,-358537222)
c=hh(c,d,a,b,x[i+3],16,-722521979)
b=hh(b,c,d,a,x[i+6],23,76029189)
a=hh(a,b,c,d,x[i+9],4,-640364487)
d=hh(d,a,b,c,x[i+12],11,-421815835)
c=hh(c,d,a,b,x[i+15],16,530742520)
b=hh(b,c,d,a,x[i+2],23,-995338651)
a=ii(a,b,c,d,x[i+0],6,-198630844)
d=ii(d,a,b,c,x[i+7],10,1126891415)
c=ii(c,d,a,b,x[i+14],15,-1416354905)
b=ii(b,c,d,a,x[i+5],21,-57434055)
a=ii(a,b,c,d,x[i+12],6,1700485571)
d=ii(d,a,b,c,x[i+3],10,-1894986606)
c=ii(c,d,a,b,x[i+10],15,-1051523)
b=ii(b,c,d,a,x[i+1],21,-2054922799)
a=ii(a,b,c,d,x[i+8],6,1873313359)
d=ii(d,a,b,c,x[i+15],10,-30611744)
c=ii(c,d,a,b,x[i+6],15,-1560198380)
b=ii(b,c,d,a,x[i+13],21,1309151649)
a=ii(a,b,c,d,x[i+4],6,-145523070)
d=ii(d,a,b,c,x[i+11],10,-1120210379)
c=ii(c,d,a,b,x[i+2],15,718787259)
b=ii(b,c,d,a,x[i+9],21,-343485551)
a=safe_add(a,olda)
b=safe_add(b,oldb)
c=safe_add(c,oldc)
d=safe_add(d,oldd);}
return [a,b,c,d];}

function binl2hex(binarray){
var hex_tab="0123456789abcdef"
var str=""
for(var i=0; i < binarray.length * 4; i++){
str+=hex_tab.charAt((binarray[i>>2] >>((i%4)*8+4))&0xF)+
hex_tab.charAt((binarray[i>>2] >>((i%4)*8))&0xF)
}
return str;}

function binl2b64(binarray){
var tab="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
var str=""
for(var i=0; i < binarray.length * 32; i+=6){
str+=tab.charAt(((binarray[i>>5] <<(i%32))&0x3F)|((binarray[i>>5+1] >>(32-i%32))&0x3F))
}
return str;}

function str2binl(str){
var nblk=((str.length+8)>>6)+1 // number of 16-word blocks
var blks=new Array(nblk * 16)
for(var i=0; i < nblk * 16; i++) blks[i]=0
for(var i=0; i < str.length; i++)
blks[i>>2]|=(str.charCodeAt(i)&0xFF) <<((i%4) * 8)
blks[i>>2]|=0x80 <<((i%4) * 8)
blks[nblk*16-2]=str.length * 8
return blks;}

function strw2binl(str){
var nblk=((str.length+4)>>5)+1 // number of 16-word blocks
var blks=new Array(nblk * 16)
for(var i=0; i < nblk * 16; i++) blks[i]=0
for(var i=0; i < str.length; i++)
blks[i>>1]|=str.charCodeAt(i) <<((i%2) * 16)
blks[i>>1]|=0x80 <<((i%2) * 16)
blks[nblk*16-2]=str.length * 16
return blks;}

function hexMD5(str){return binl2hex(coreMD5( str2binl(str)))}
function hexMD5w(str){return binl2hex(coreMD5(strw2binl(str)))}
function b64MD5(str){return binl2b64(coreMD5( str2binl(str)))}
function b64MD5w(str){return binl2b64(coreMD5(strw2binl(str)))}
function calcMD5(str){return binl2hex(coreMD5( str2binl(str)))}

function xproc1(str){
var EChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
var out,i,len,c1,c2,c3;
len=str.length;
i=0;
out = "";
while(i<len){
c1=str.charCodeAt(i++)&0xff;
if(i==len){out+=EChars.charAt(c1>>2);
out+=EChars.charAt((c1&0x3)<<4);
out+= "==";
break;}
c2=str.charCodeAt(i++);
if(i==len){out+=EChars.charAt(c1>>2);
out+=EChars.charAt(((c1&0x3)<<4)|((c2&0xF0)>>4));
out+=EChars.charAt((c2&0xF)<<2);
out+="=";
break;}
c3=str.charCodeAt(i++);
out+=EChars.charAt(c1>>2);
out+=EChars.charAt(((c1&0x3)<<4)|((c2&0xF0)>>4));
out+=EChars.charAt(((c2&0xF)<<2)|((c3&0xC0)>>6));
out+=EChars.charAt(c3&0x3F);}
return out;}

function cc(ss){f0.R1.value=ss;}
function ee(){
if(f1.DDDDD.value==""){alert("请输入您的账号");return false;}
f0.DDDDD.value=f1.DDDDD.value
if(ps==0){f0.upass.value=xproc1(f1.upass.value);}
else{tmpchar=pid+f1.upass.value+calg;f0.upass.value=calcMD5(tmpchar)+calg+pid;f0.R2.value=1;}
//write cookies
if(document.getElementsByName("save_me")[0].checked){
	var uname = document.getElementById("username").value;
	var pass = document.getElementById("password").value;
	setCookie("tj_login",uname+"|"+pass);
} else {
	delCookie("tj_login");
}
//--end write
document.f0.submit();
return false;}

function setCookie(name,value){
var Days = 360;
var exp  = new Date();
exp.setTime(exp.getTime() + Days*24*60*60*1000);
document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

function getCookie(name) {
var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
if(arr != null)
	return unescape(arr[2]);
return null;
}

function delCookie(name){
var exp = new Date();
exp.setTime(exp.getTime() - 1);
var cval=getCookie(name);
if(cval!=null)
	document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
//--></SCRIPT><style><!--
a {text-decoration: none}
body {text-align:center;background-color: #0966A9;}
.f1 { font-size: 8pt; font-family: Verdana; line-height: 14pt ;  color:#5F6468}
.f2 { font-size: 9pt; font-family: Verdana; line-height: 14pt; color:#5A7E98}
.input-border{border:1px solid #b8b8b8;	width:168px; line-height:20px; font-size:14px; height:22px;}
.con {width: 800px; height:450px; margin-right: auto; margin-left: auto; margin-top: 10px;}
.login {background-image: url('a01.jpg'); background-repeat: no-repeat; float: left;width: 800px; height:450px;}
.login .b_left {float: left;height: 450px;width: 400px}
.login .b_cernet {float: left;height: 450px;width: 336px;}
.login .b_right {float: left;height: 450px;	width: 64px;}
.login-b, .login-b2, .login-b3{background-image: url('a04.gif');height: 26px;width: 77px;border:0 none;cursor:hand !important}
.login-b2{background-image: url('a04.gif');	background-position: 0px -27px}
.login-b3{background-image: url('a04.gif'); background-position: 0px -54px}
.login-a, .login-a2, .login-a3{background-image: url('a05.gif');height: 26px;width: 77px;border:0 none;cursor:hand !important}
.login-a2{background-image: url('a05.gif');	background-position: 0px -27px}
.login-a3{background-image: url('a05.gif'); background-position: 0px -54px}
.h{cursor:pointer}
-->
</style>
</head>
<!--Dr.COMWebLoginID_0.htm-->
<body onselectstart="return false">
<div class="con">
<div class="login">
<div class="b_left">
<table border="0" width="100%" cellspacing="0" cellpadding="0" height="404">
				<tr>
					<td height="148" width="38">　</td>
					<td height="148">　</td>
					<td height="148" width="45">　</td>
				</tr>
				<tr>
					<td width="38" rowspan="2">　</td>
					<td height="184" valign="top">
					<p>
					<p>


<iframe name="I1"  width="336"  height="168" frameborder="0" src="http://10.3.8.210/gw/notice.htm" marginwidth="1" marginheight="1" allowtransparency="yes" target="_blank" scrolling="no"></iframe>
			
</p>
					</td>
					<td width="45" rowspan="2">　</td>
				</tr>
				<tr>
					<td>
		　</td>
				</tr>
			</table>
</div>
<div class="b_cernet" style="width: 325px; height: 450px">
<form name="f1" method="post" action="" onSubmit="return ee()">
<table border="0" width="104%" cellspacing="1" cellpadding="0" height="100%" class="f1">
	<tr>
		<td height="75" colspan="2">　</td>
	</tr>
	<tr>
		<td height="17" colspan="2"></td>
	</tr>
	<tr>
		<td height="66" colspan="2">
		<p align="center">
		<img border="0" src="a21.gif"></td>
	</tr>
	<tr>
		<td height="20" colspan="2">　</td>
	</tr>
	<tr>
		<td height="34" width="35%" align="right">账号 Account </td>
		<td height="34" width="64%">&nbsp;<input id=username name="DDDDD" type="text" maxlength="26" class="input-border"></td>
	</tr>
	<tr>
		<td height="32" width="35%" align="right">密码 Password </td>
		<td height="32" width="64%">&nbsp;<input id=password name="upass" type="password" maxlength="16" class="input-border"></td>
	</tr>
	<tr>
		<td height="57" width="35%">
		<p align="center">
<INPUT value=1 type=checkbox name=save_me>保存密码</td>
		<td height="57" width="64%">&nbsp;<input type="submit" name="0MKKey" value="" onClick="cc(0)" class="login-b"  onMouseOver="this.className='login-b2'" onMouseDown="this.className='login-b3'" onMouseOut="this.className='login-b'"/>&nbsp;&nbsp; <input type="submit" name="" value="" onClick="reset();return false;" class="login-a"  onMouseOver="this.className='login-a2'" onMouseDown="this.className='login-a3'" onMouseOut="this.className='login-a'"/></td>
	</tr>
	<tr>
		<td height="45">
		<p align="center">
		<a target="_blank" href="http://10.3.240.53:8081/gw/mainEndpoint">
		<font color="#5A7E98">eID登录</font></a></td>
		<td height="45">
							
		<font color="#5A7E98">
		&nbsp;</font><a target="_blank" href="http://10.3.8.200/Self/"><font color="#5A7E98">进入自服务</font></a><font color="#5A7E98">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a target="_blank" href="http://10.3.8.210/getpass.php">
		<font color="#5A7E98">找回密码</font></a></font></td>
	</tr>
	<tr>
		<td height="50" colspan="2">　</td>
	</tr>
	<tr>
		<td valign="top" colspan="2">
		　</td>
	</tr>
</table>
</form>
<form name="f0" method="post" action=""><input type="hidden" name="DDDDD" value="0"><input type="hidden" name="upass" value="0">
<input type="hidden" name="R1" value="0"><input type="hidden" name="R2" value="0"><input type="hidden" name="para" value="00">
<input type="hidden" name="0MKKey" value="123456">
</form>
</div>
<div class="b_right" style="width: 69px; height: 450px">
</div>
</div>
</div>
</body>
</html>
<script language="javascript">
	var cook = getCookie("tj_login");
	if(cook != null){
		var arr = cook.split("|");
		var uname = document.getElementById("username").value = arr[0];
		var pass = document.getElementById("password").value = arr[1];
		document.getElementsByName("save_me")[0].checked = true;
	}
</script>