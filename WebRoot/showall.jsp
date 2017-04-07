<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.eazybank.dao.*"%>
<%@page import="com.eazybank.dto.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showall.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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


</style>
  </head>
  
  <body>
   
<table width=50% align="center" border=0 bgcolor="#0099FF">
   	
				<tr><th colspan=6 scope="col"><center><img src="img/ooopic_1482156316.png">用户信息</center></th></tr>				
				<tr bgcolor="#FFFFFF">
				<td>id</td><td>昵称</td>		
				</tr>
				
				<%			
				eazybankDao ezdao=new eazybankDao();
				ArrayList<UsersDto> arydao=new ArrayList<UsersDto>();
				arydao=ezdao.QueryUsersAll();	
			
			for(int i=0;i<arydao.size();i++){%>					
				<tr bgcolor="#FFFFFF">
				<td><%=arydao.get(i).getU_id()%></td>
				<td><%=arydao.get(i).getU_nickname() %></td>
				</tr>
			
			<%} %>	
				<tr bgcolor="#FFFFFF">
				<td colspan=2><center><a href="index.jsp">返回</a></center></td>			
				</tr>
</table>






<jsp:include page="foot.jsp"/><!--底部信息-->
  </body>
</html>
