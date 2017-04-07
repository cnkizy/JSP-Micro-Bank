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
    
    <title>网上银行-首页-欢迎光临</title>
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
a:link {
	color: orange;
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
.lite{
width:20px;
height:20px;
margin-right:2px;
}

</style>

	
  </head>
<%
if(session.getAttribute("u_id")==null){
out.print("<script>alert('暂未登录，请返回登录');location.href='login.jsp'</script>");
return;
}
%>
  <body>
   
   	<table width=50% align="center" border=0 bgcolor="#0099FF">
   	
				<tr><th colspan=6 scope="col"><center><img src="img/ooopic_1482156318.png">个人信息</center></th></tr>				
				<tr bgcolor="#FFFFFF">
				<td>id</td><td>用户名</td><td>昵称</td><td>邮件</td><td>电话</td><td>\</td>			
				</tr>
				
				<%			
				eazybankDao ezdao=new eazybankDao();
				UsersDto usdto=new UsersDto();			
				usdto.setU_id(Integer.valueOf(String.valueOf(session.getAttribute("u_id"))));
				ezdao.QueryUsers(usdto);	
				 %>
			
				<tr bgcolor="#FFFFFF">
				<td><%=usdto.getU_id() %></td><td><%=usdto.getU_name() %></td><td><%=usdto.getU_nickname() %></td><td><%=usdto.getU_phone() %></td><td><%=usdto.getU_id() %></td><td>\</td>			
				</tr>
				
				<tr bgcolor="#FFFFFF">
				<td colspan=6><a href="logout.jsp">注销</a></td>			
				</tr>
</table>
<br/>
<table width=50% align="center" border=0 bgcolor="#0099FF">  	
				<tr><th colspan=2 scope="col"><center><img src="img/ooopic_1482156277.png"/>网银助手小提示:若要进行转账。请记住对方ID</center></th></tr>				
</table>
<p></p>
   	<table width=50% align="center" border=0 bgcolor="#0099FF">
				<tr><th colspan=3 scope="col"><center><img src="img/ooopic_1482156299.png">银行操作</center></th></tr>				
				<tr bgcolor="#FFFFFF">
				<%
				MoneyDto moneydto=new MoneyDto();
				
				moneydto.setU_id(Integer.valueOf(String.valueOf(session.getAttribute("u_id"))));
				moneydto.setDeposit(ezdao.QueryMoney(moneydto).getDeposit());
				
				
				moneydto.setLoan(ezdao.QueryLoan(moneydto).getLoan());
				 %>
				
				<td>当前存款:</td><td><%=moneydto.getDeposit() %></td><td width="250px"  align="left" ><img src="img/ooopic_1482156255.png"></td>			
				</tr>
				
				<tr bgcolor="#FFFFFF">
				<td>当前贷款:</td><td><%=moneydto.getLoan() %></td><td align="left"><img src="img/ooopic_1482156255.png"></td>		
				</tr>
				
				<tr bgcolor="#FFFFFF" >
				<td align="center" colspan="3">
				<img src="img/76.png" class="lite"><a href="bankop.jsp?action=take">取款</a>
				<img src="img/94.png" class="lite"><a href="bankop.jsp?action=save">存款</a>
				<img src="img/97.png" class="lite"><a href="bankop.jsp?action=turn">转账</a> 
				<img src="img/52.png" class="lite"><a href="bankop.jsp?action=borrow">贷款</a>  
				<img src="img/3.png" class="lite"><a href="bankop.jsp?action=still">还款</a> 
				<img src="img/ooopic_1482156316.png" class="lite"><a href="showall.jsp">查看当前银行内的用户和ID</a>
				</td>
			
				</tr>
</table>
<p>
</p>
<% 

RecordDto us=new RecordDto();
us.setU_id(Integer.valueOf(String.valueOf(session.getAttribute("u_id"))));

ArrayList<RecordDto> tmarry=new ArrayList<RecordDto>();

tmarry=ezdao.QueryRecord(us);

%>
<table width=50% align="center" border=0 bgcolor="#0099FF">  	
				<tr><th colspan=3 scope="col"><center><img src="img/ooopic_1482156272.png"/>记账单</center></th></tr>	
				
				<tr bgcolor="#FFFFFF">
				<td>存根id</td>
				<td>用户id</td>				
				<td>记录说明</td>
				</tr>
				<%if(tmarry.size()==0){%>
				<tr bgcolor="#FFFFFF">
				<td colspan="3">暂无记录</td>
				</tr>
	
				<%}else{for(int i=0;i<tmarry.size();i++){%>
				<tr bgcolor="#FFFFFF">
				<td><%=tmarry.get(i).getR_id() %></td>
				<td><%=tmarry.get(i).getU_id() %></td>				
				<td><%=tmarry.get(i).getR_record() %></td>
				</tr>	
	<%}} %>				
</table>

<br/>
<table width=70% align="center" border=0 bgcolor="#0099FF">  	
				<tr><th colspan=2 scope="col"><center><img src="img/ooopic_1482156277.png"/>网银助手小提示:每次只能存款5万,1万以内免去手续费,多余的钱将收取5%的手续费</center></th></tr>				
</table>

<p></p>

<jsp:include page="foot.jsp"/><!--底部信息-->
  </body>
</html>
