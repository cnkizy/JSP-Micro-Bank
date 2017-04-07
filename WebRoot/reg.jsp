<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<title>网上银行-在线注册</title>
<style type="text/css">

body {
	background-repeat: repeat;
	background-image: url(img/login.jpg);
}
.boder{


   width: 371px; height: 400px;
    position: absolute; left: 50%; top: 50%;
    margin-top:-200px;    /* 高度的一半 */
    margin-left:-300px;    /* 宽度的一半 */
	background-repeat: repeat;
	background-image: url(img/login_boder.png);
	
	}
input{
margin:0px 0px 0px 10px;

}
a:link {
	color: #333333;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}


</style></head>

<body>


<div class="boder">
<form action="do_user.jsp?action=reg" method="post">

<table width="100%" border="0" align="right">
  <tr height="50">
    <td width="15"></td>
    <td width="90"></td>
    <td width="236"></td>
  </tr>
  <tr height="50">
    <td></td>
    <td></td>
    <td>网上银行-用户注册</td>
  </tr>
    <tr height="30">
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" valign="bottom"><!-- 登录 -->用户名：</td>
    <td><input name="username" type="text" maxlength="15" /></td>
  </tr>
  <tr height="20">
    <td>&nbsp;</td>
    <td align="right">昵称：</td>
    <td><input name="nickname" type="text" maxlength="15" /></td>
  </tr>
    <tr height="20">
    <td>&nbsp;</td>
    <td align="right">邮件：</td>
    <td><input name="email" type="text" maxlength="15" /></td>
  </tr>
    <tr height="20">
    <td>&nbsp;</td>
    <td align="right">电话：</td>
    <td><input name="phone" type="text" maxlength="15" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" valign="bottom"><!-- 密码-->密码：</td>
    <td><input name="password" type="password" maxlength="15" /></td>
  </tr>
  <tr>
    <td></td>
    <td align="right">重复密码：</td>
    <td><input name="password2" type="password" maxlength="15" /></td>
  <tr>
    <td>&nbsp;</td>
    <td align="right" valign="bottom"><!-- 密码--></td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td height="50"><input name="login" type="submit"value="注册" style="width:90px;height:40px;"/> <a href="login.jsp" style="margin-left:20px;">返回登录</a></td>
  </tr>
</table>
</form>
</div>
</body>
</html>
