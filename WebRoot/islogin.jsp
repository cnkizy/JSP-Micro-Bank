<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%


if(session.getAttribute("u_id")==null){
out.print("<script>alert('暂未登录，请返回登录');location.href='login.jsp'</script>");
return;
}

%>

