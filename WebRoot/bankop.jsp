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
    
    <title>My JSP 'bankop.jsp' starting page</title>
    
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
   
   <%
   
  String action=request.getParameter("action");
  String title="";
  String img="img/ooopic_1482156274.png";
  int type=0;//0取款 1存 2转 3贷 4还
  if("take".equals(action)){
  title="取款";
 img="img/76.png";}
  if("save".equals(action)){
  title="存款";type=1;
   img="img/94.png";}
  if("turn".equals(action)){
  title="转账";type=2;
  img="img/97.png";}
  if("borrow".equals(action)){
  title="贷款";type=3;
  img="img/52.png";}
  if("still".equals(action)){
  title="还款";type=4;
   img="img/3.png";}
  if(type<0 || type >4){
	out.print("<script>alert('无法识别的错误');location.href='index.jsp'</script>");
  }
    %>
   
   <form action="do_bank.jsp" method="post">
   <input type="hidden" name="type" value="<%=type%>" /><!-- 传递操作类型 -->
<table width=50% align="center" border=0 bgcolor="#0099FF">  	
				<tr><th colspan=3 scope="col"><center><img src="<%=img%>"/><%=title %></center></th></tr>	
		<%				
				eazybankDao ezdao=new eazybankDao();			
				MoneyDto moneydto=new MoneyDto();				
				moneydto.setU_id(Integer.valueOf(String.valueOf(session.getAttribute("u_id"))));
				moneydto.setDeposit(ezdao.QueryMoney(moneydto).getDeposit());			
				moneydto.setLoan(ezdao.QueryLoan(moneydto).getLoan());							
									
	 %>
				<tr bgcolor="#FFFFFF">
				<td width="45%">当前余额</td>
				<td width="45%"><%=moneydto.getDeposit() %></td>				
				<td width="10%">\</td>
				</tr>
						
				<tr bgcolor="#FFFFFF">
				<td>当前贷款</td>
				<td><%=moneydto.getLoan()%></td>				
				<td></td>
				</tr>
								
				<%if(type==0){//取款%>		
				
				<tr bgcolor="#FFFFFF">
				<td>取款:</td>
				<td><input name="money" type="text" maxlength="10" onkeyup="value=value.replace(/[^\d.]/g,'')"/></td>				
				<td></td>
				</tr>
				
				<tr bgcolor="#FFFFFF">
				<td></td>
				<td><input name="take_submit" type="submit"value="取款" style="width:90px;height:40px;"/></td>				
				<td></td>
				</tr>
				
				<tr bgcolor="#FFFFFF">
				<td></td>
				<td><a href="index.jsp">返回首页</a></td>				
				<td></td>
				</tr>
				</table>
				<%}%>			
				<!-- 1 -->
				<%if(type==1){//存款%>
								
				<tr bgcolor="#FFFFFF">
				<td colspan="3">存款提示(每次最多存5万,大于1万后多出的钱将收取5%的手续费)</td>
				</tr>
				
				<tr bgcolor="#FFFFFF">
				<td>存款</td>
				<td><input name="money" type="text" maxlength="10" onkeyup="value=value.replace(/[^\d.]/g,'')"/></td>				
				<td></td>
				</tr>
				
				<tr bgcolor="#FFFFFF">
				<td></td>
				<td><input name="save_submit" type="submit"value="存款" style="width:90px;height:40px;"/></td>				
				<td></td>
				</tr>
					
					<tr bgcolor="#FFFFFF">
				<td></td>
				<td><a href="index.jsp">返回首页</a></td>				
				<td></td>
				</tr>
				</table>
				
				<table width=50% align="center" border=0 bgcolor="#0099FF">  	
				<tr><th colspan=2 scope="col"><center><img src="img/ooopic_1482156277.png"/>网银助手小提示:丘山积卑而高，江河合水而为大。-庄子</center></th></tr>				
				</table>
						
				<%}%>
				 
				 <!-- 2 -->
				<%if(type==2){//转账%>
				
				<tr bgcolor="#FFFFFF">
				<td>待收款人ID:</td>
				<td><input name="topeo_id" type="text" maxlength="10" onkeyup="value=value.replace(/[^\d.]/g,'')"/></td>				
				<td></td>
				</tr>
				
				<tr bgcolor="#FFFFFF">
				<td>金额:</td>
				<td><input name="money" type="text" maxlength="10" onkeyup="value=value.replace(/[^\d.]/g,'')"/></td>				
				<td></td>
				</tr>
				
				<tr bgcolor="#FFFFFF">
				<td></td>
				<td><input name="turn_submit" type="submit"value="转账" style="width:90px;height:40px;"/></td>				
				<td></td>
				</tr>
				
					<tr bgcolor="#FFFFFF">
				<td></td>
				<td><a href="index.jsp">返回首页</a></td>				
				<td></td>
				</tr>
				</table>
				
				<table width=50% align="center" border=0 bgcolor="#0099FF">  	
				<tr><th colspan=2 scope="col"><center><img src="img/ooopic_1482156277.png"/>网银助手小提示:进行转账时，请仔细核对金额和ID</center></th></tr>				
				</table>
				
				
				<%}%>
				 <!-- 3 -->
				<%if(type==3){//贷款%>
				
				<tr bgcolor="#FFFFFF">
				<td>贷款金额(最大额度3000):</td>
				<td><input name="money" type="text" maxlength="10" onkeyup="value=value.replace(/[^\d.]/g,'')"/></td>				
				<td></td>
				</tr>
				
				<tr bgcolor="#FFFFFF">
				<td></td>
				<td><input name="borrow_submit" type="submit"value="贷款" style="width:90px;height:40px;"/></td>				
				<td></td>
				</tr>
			
				<tr bgcolor="#FFFFFF">
				<td></td>
				<td><a href="index.jsp">返回首页</a></td>				
				<td></td>
				</tr>
				</table>

				<table width=50% align="center" border=0 bgcolor="#0099FF">  	
				<tr><th colspan=2 scope="col"><center><img src="img/ooopic_1482156277.png"/>网银助手小提示:诚信像一面镜子，一旦打破，你的人格就会出现裂痕。</center></th></tr>				
				</table>
				
				<%}%>
				
				
				<%if(type==4){//还款有借有还再借不难%>
				
				<tr bgcolor="#FFFFFF">
				<td>还款金额:</td>
				<td><input name="money" type="text" maxlength="10" onkeyup="value=value.replace(/[^\d.]/g,'')"/></td>				
				<td></td>
				</tr>
				
				<tr bgcolor="#FFFFFF">
				<td></td>
				<td><input name="stil_submit" type="submit" value="还款" style="width:90px;height:40px;"/></td>				
				<td></td>
				</tr>
				
					<tr bgcolor="#FFFFFF">
				<td></td>
				<td><a href="index.jsp">返回首页</a></td>				
				<td></td>
				</tr>
				</table>

				
				<table width=50% align="center" border=0 bgcolor="#0099FF">  	
				<tr><th colspan=2 scope="col"><center><img src="img/ooopic_1482156277.png"/>网银助手小提示:人无信不立。</center></th></tr>				
				</table>
				
				<%}%>
				
				
			
				
				
				

</form>


<jsp:include page="foot.jsp"/><!--底部信息-->
  </body>
</html>
