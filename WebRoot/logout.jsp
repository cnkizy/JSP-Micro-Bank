<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
if(session.getAttribute("u_id") ==null){
out.print("<script>alert('未登录');location.href='login.jsp'</script>");
}else{
session.invalidate();
out.print("<script>alert('注销成功');location.href='login.jsp'</script>");
}

%>


