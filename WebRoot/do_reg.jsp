<%@ page language="java" import="java.util.*,zy.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'do_reg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   

<%

request.setCharacterEncoding("utf-8");
String rcode=String.valueOf(session.getAttribute("rCode"));
String code=String.valueOf(request.getParameter("code"));
//session.getAttribute("rCode","");//清空session的验证码 防止恶意注册

//if(!rcode.equals(code) || "".equals(code)){
//response.setHeader("refresh", "0;url=reg.html");
//out.print("<script type=\"text/javascript\">alert('请输入正确的验证码');</script>");
//return;
//}


String name=String.valueOf(request.getParameter("name"));


if("".equals(name)){
response.setHeader("refresh", "0;url=reg.html");
out.print("<script type=\"text/javascript\">alert('姓名不能为空');</script>");
return;
}


String password=String.valueOf(request.getParameter("Password"));
String password2=String.valueOf(request.getParameter("Password2"));

if("".equals(password2) || "".equals(password)){
response.setHeader("refresh", "0;url=reg.html");
out.print("<script type=\"text/javascript\">alert('两次密码不能为空');</script>");
return;
}


if(!password.equals(password2)){
response.setHeader("refresh", "0;url=reg.html");
out.print("<script type=\"text/javascript\">alert('两次密码不一致,请重新输入密码');</script>");
return;
}




String sex=String.valueOf(request.getParameter("sex"));


SQL_User zy =new SQL_User();

if(zy.CheckUsers(name)){
response.setHeader("refresh", "0;url=reg.html");
out.print("<script type=\"text/javascript\">alert('该用户已被注册');</script>");
return;
}



if(zy.RegUsers(name,password,"0")){
response.setHeader("refresh", "0;url=login.jsp");
out.print("<script type=\"text/javascript\">alert('恭喜，注册成功');</script>");

}else{

response.setHeader("refresh", "0;url=reg.jsp");
out.print("<script type=\"text/javascript\">alert('数据库发生了一个错误,注册失败');</script>");

}

//out.println(password);
//out.println(password2);
//out.println(sex);
//out.println(name);

 %>





  </body>
</html>
