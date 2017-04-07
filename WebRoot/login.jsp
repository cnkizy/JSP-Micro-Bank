<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>网上银行-登录</title>
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
margin-left:20px;

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
<%if(session.getAttribute("u_id")!=null){//若用户已经登录，则直接跳转至主页
out.print("<script>location.href='index.jsp'</script>");
}%>

<div class="boder">
<form action="do_user.jsp?action=login" method="post">

<table width="100%" border="0">
  <tr height="50">
    <td width="15"></td>
    <td width="70"></td>
    <td width="286"></td>
  </tr>
  <tr height="50">
    <td></td>
    <td></td>
    <td>网上银行-用户登录</td>
  </tr>
    <tr height="30">
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" valign="bottom"><!-- 登录 --><img src="img/login2.png"></td>
    <td><input name="username" type="text" maxlength="15" /></td>
  </tr>
  <tr height="20">
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" valign="bottom"><!-- 密码--><img src="img/password.png"></td>
    <td><input name="password" type="password" maxlength="15" /></td>
  </tr>
  <tr height="30">
    <td>&nbsp;</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td height="50"><input name="login" type="submit"value="登录" style="width:90px;height:40px;"/> <a href="reg.jsp" style="margin-left:20px;">注册</a></td>
  </tr>
</table>
</form>
</div>
</body>
</html>
