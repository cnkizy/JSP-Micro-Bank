<%@page import="com.eazybank.dto.UsersDto"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.eazybank.dao.*"%>
<%

request.setCharacterEncoding("utf-8");
String action=request.getParameter("action");


	if("login".equals(action)){//若是login方法

	String username=request.getParameter("username");//取得用户名
	String password=request.getParameter("password");//取得密码

	eazybankDao ezdao=new eazybankDao();
	UsersDto usdto=new UsersDto();
	
	usdto.setU_name(username);	
	usdto.setU_password(password);

		if(ezdao.LoginUsers(usdto)){//登录成功时	
			usdto=ezdao.QueryUsersId(usdto);//当用户登录成功后 设置session
			session.setAttribute("u_id", usdto.getU_id());//取得用户id
			out.print("<script>alert('登录成功,欢迎光临');location.href='index.jsp'</script>");//跳转至首页
		}else{//登录失败后
		out.print("<script>alert('密码或用户名错误,登录失败');history.go(-1)</script>");//跳回去咯	
		}

	}

	if("reg".equals(action)){//若是login方法

	String username=request.getParameter("username");//取得用户名
	String nickname=request.getParameter("nickname");//取得昵称
	String email=request.getParameter("email");//取得邮件
	String phone=request.getParameter("phone");//取得手机
	String password=request.getParameter("password");//取得密码
	String password2=request.getParameter("password2");//取得密码2
	
	if("".equals(username)){
	out.print("<script>alert('用户名不能为空');history.go(-1)</script>");//跳回去咯	
	return;}
	
	if("".equals(nickname)){
	out.print("<script>alert('昵称不能为空');history.go(-1)</script>");//跳回去咯	
	return;}
	
	if("".equals(email)){
	out.print("<script>alert('邮件不能为空');history.go(-1)</script>");//跳回去咯	
	return;}
	
	if("".equals(phone)){
	out.print("<script>alert('手机不能为空');history.go(-1)</script>");//跳回去咯	
	return;}
	
	if("".equals(password)){
	out.print("<script>alert('密码不能为空');history.go(-1)</script>");//跳回去咯	
	return;}
	
	if("".equals(password2)){
	out.print("<script>alert('重复密码不能为空');history.go(-1)</script>");//跳回去咯	
	return;}
		
	if(!password.equals(password2)){	
	out.print("<script>alert('两次密码不一致,注册失败');history.go(-1)</script>");//跳回去咯	
	}

	
	eazybankDao ezdao=new eazybankDao();
	UsersDto usdto=new UsersDto();
	usdto.setU_email(email);
	usdto.setU_name(username);
	usdto.setU_nickname(nickname);
	usdto.setU_password(password);
	usdto.setU_phone(phone);
	
	
	if(ezdao.CheckUsers(usdto)){
	out.print("<script>alert('有重复的用户名，注册失败');history.go(-1)</script>");//跳转至首页
	return;
	}
	
	
	if(ezdao.CheckNickname(usdto)){
	out.print("<script>alert('有重复的昵称，注册失败');history.go(-1)</script>");//跳转至首页
	return;
	}
	
		if(ezdao.RegUsers(usdto)){//登录成功时	
			usdto.setU_id(ezdao.QueryUsersId(usdto).getU_id());//取得用户id
			session.setAttribute("u_id", usdto.getU_id());//当用户登录成功后 设置session
			out.print("<script>alert('注册成功,已登录,欢迎光临');location.href='index.jsp'</script>");//跳转至首页
		}else{//登录失败后
		out.print("<script>alert('数据库错误,注册失败');history.go(-1)</script>");//跳回去咯	
		}
	}


%>

