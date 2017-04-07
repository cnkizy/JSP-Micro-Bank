<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.eazybank.dto.*"%>
<%@page import="com.eazybank.dao.eazybankDao"%>
<%

if(session.getAttribute("u_id")==null){
out.print("<script>alert('暂未登录，请返回登录');location.href='login.jsp'</script>");
}

int userid=Integer.valueOf(String.valueOf(session.getAttribute("u_id")));//用户id
int type=Integer.valueOf(request.getParameter("type"));//操作类型  0取款 1存 2转 3贷 4还
double money=0;

eazybankDao ezdao=new eazybankDao();
MoneyDto mydto=new MoneyDto();
RecordDto recdto=new RecordDto();
UsersDto usdto=new UsersDto();

		if("".equals(request.getParameter("money"))){
		out.print("<script>alert('未输入金额');history.go(-1)</script>");
		return;	
		}
		
	if(type==0){//取款
	
		money=Double.valueOf(request.getParameter("money"));
		mydto.setU_id(userid);

		if(money<=0){
		out.print("<script>alert('取款金额不能小于等于0');history.go(-1)</script>");
		return;		
		}
		
		
		
		if(ezdao.WithdrawMoney(mydto,money)){
				
		//此处记录银行记账单
		recdto.setU_id(userid);
		recdto.setR_record("取款"+money+"元");
		ezdao.Record(recdto);
		
		out.print("<script>alert('取款成功，已取款"+money+"元');location.href='index.jsp'</script>");
		}else{
		out.print("<script>alert('取款失败');history.go(-1)</script>");
		}
	}


	if(type==1){//存款
		money=Double.valueOf(request.getParameter("money"));
		mydto.setU_id(userid);
		
		if(money<=0){
		out.print("<script>alert('存款金额不能小于等于0');history.go(-1)</script>");
		return;		
		}
		
		if(money>50000){//每次只能存款5万以内
		out.print("<script>alert('存款失败，每次最多存款5万');history.go(-1)</script>");
		return;
		}
		
		if(money>10000){//多出1万后将收取5%手续费		
		double duochudeqian=(money-10000)*0.05;
		money-=duochudeqian;		
		}				
		
		if(ezdao.DepositMoney(mydto,money)){	
				
		//此处记录银行记账单
		recdto.setU_id(userid);
		recdto.setR_record("存款"+money+"元");
		ezdao.Record(recdto);
		
			out.print("<script>alert('存款成功，已存款"+money+"');location.href='index.jsp'</script>");
		}else{
		out.print("<script>alert('存款失败');history.go(-1)</script>");
		}
	}



	if(type==2){//转账
	int topeoid=Integer.valueOf(request.getParameter("topeo_id"));//待收款人ID
	
		money=Double.valueOf(request.getParameter("money"));//转账金额	
		
		
		if(money<=0){
		out.print("<script>alert('转账金额不能小于等于0');history.go(-1)</script>");
		return;		
		}
		
			
		mydto.setU_id(userid);
		
		MoneyDto tmp =new MoneyDto();
		tmp.setU_id(topeoid);		
		
		if(ezdao.TransferMoney(mydto,tmp,money)){
		
		//此处记录银行记账单
		recdto.setU_id(userid);//记录转账人的ID
		recdto.setR_record("向 ID:"+topeoid+"	的用户,转账"+money+"元");
		ezdao.Record(recdto);
		
		recdto.setU_id(topeoid);//记录收款人的ID
		recdto.setR_record("ID:"+userid+"	的用户,向你转账"+money+"元");
		
		ezdao.Record(recdto);
		
		out.print("<script>alert('转账成功，转账人ID:"+topeoid+"，金额"+money+"');location.href='index.jsp'</script>");
		}else{
		out.print("<script>alert('转账失败');history.go(-1)</script>");
		}
	}


	if(type==3){//贷款
		money=Double.valueOf(request.getParameter("money"));//转账金额		
		mydto.setU_id(userid);


		if(money<=0){
		out.print("<script>alert('贷款金额不能小于等于0');history.go(-1)</script>");
		return;		
		}
		
		if(ezdao.LoanMoney(mydto, money)){
		//此处记录银行记账单
		recdto.setU_id(userid);
		recdto.setR_record("向 银行贷款"+money+"	元");
		ezdao.Record(recdto);
		
		out.print("<script>alert('贷款成功。向银行贷款:"+money+"元');location.href='index.jsp'</script>");
		}else{	
		out.print("<script>alert('贷款失败');history.go(-1)</script>");	
		}



	}

	if(type==4){//还款
		money=Double.valueOf(request.getParameter("money"));//转账金额		
		mydto.setU_id(userid);
		
		if(money<=0){
		out.print("<script>alert('还款不能小于等于0');history.go(-1)</script>");
		return;		
		}
		
		if(money<0){
		out.print("<script>alert('还款失败,不接受负数');history.go(-1)</script>");	
		return;
		}

		if(ezdao.StillMoney(mydto, money)){
		//此处记录银行记账单
		recdto.setU_id(userid);
		recdto.setR_record("向 银行还款"+money+"	元");
		ezdao.Record(recdto);
		out.print("<script>alert('还款成功。向银行还款:"+money+"元');location.href='index.jsp'</script>");
		}else{
		out.print("<script>alert('还款失败');history.go(-1)</script>");	
		}
		
	}
	
	

%>

