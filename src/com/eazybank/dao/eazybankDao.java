package com.eazybank.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.eazybank.dto.*;
import com.eazybank.tools.*;
public class eazybankDao {

	private DB mydb=new DB();
	
	//ע��
	public boolean RegUsers(UsersDto dto){
		mydb.openDB();
		String sql="insert into users(u_name,u_password,u_nickname,u_email,u_phone)  values(?,?,?,?,?)";
		Object[] params={dto.getU_name(),dto.getU_password(),dto.getU_nickname(),dto.getU_email(),dto.getU_phone()};
		boolean flag=mydb.executeUpdate(sql, params);
		mydb.close();
		
		UsersDto dp=new UsersDto();
		dp.setU_name(dto.getU_name());
		
		DB Nmydb=new DB();

		Nmydb.openDB();
		sql="insert into money(u_id,deposit,loan)  values(?,0,0)";//ע��ɹ�������û���Ҫ������ݣ�Money��ҲҪ������ݽ���ͬ��
		Object[] param={QueryUsersId(dp).getU_id()};
		flag=Nmydb.executeUpdate(sql, param);		
		Nmydb.close();
		return flag;
	}
	
	//��ѯid
	public UsersDto QueryUsersId(UsersDto dto){	
		UsersDto tmp=new UsersDto();
			mydb.openDB();
			String sql="select u_id from users where u_name=?";
			Object[] params={dto.getU_name()};
			ResultSet rs=mydb.executeQuery(sql, params);
			
			try {
				if(rs.next()){				
					tmp.setU_id(rs.getInt(1));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
						
		
		mydb.close();
		return tmp;
	}
	
	
	//��ѯ�����û�
	public ArrayList<UsersDto> QueryUsersAll(){	
		ArrayList<UsersDto> Users =new ArrayList<UsersDto>();//����һ����̬����	
			mydb.openDB();
			String sql="select * from users";
			Object[] params={};
			ResultSet rs=mydb.executeQuery(sql, params);			
			try {
				while(rs.next()){//�������������
					UsersDto tmp=new UsersDto();
					tmp.setU_id(rs.getInt("u_id"));
					tmp.setU_name(rs.getString("u_name"));							
					tmp.setU_nickname(rs.getString("u_nickname"));
					tmp.setU_email(rs.getString("u_email"));		
					tmp.setU_phone(rs.getString("u_phone"));					
					Users.add(tmp);				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		mydb.close();
		return Users;
	}
	
	
	//��ѯ�ظ��û�
	public boolean CheckUsers(UsersDto usdto){	
		boolean flag=false;
			mydb.openDB();
			String sql="select * from users where u_name=?";
			Object[] params={usdto.getU_name()};
			ResultSet rs=mydb.executeQuery(sql, params);			
			try {
				if(rs.next()){//�����ظ����û����򷵻�true
					flag=true;		
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		mydb.close();
		return flag;
	}
	
	//��ѯ�ظ��ǳ�
	public boolean CheckNickname(UsersDto usdto){	
		boolean flag=false;
			mydb.openDB();
			String sql="select * from users where u_nickname=?";
			Object[] params={usdto.getU_nickname()};
			ResultSet rs=mydb.executeQuery(sql, params);			
			try {
				if(rs.next()){//�����ظ����û����򷵻�true
					flag=true;		
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		mydb.close();
		return flag;
	}
	

	
	//��ѯָ��id�û���Ϣ
	public UsersDto QueryUsers(UsersDto usdto){	
			mydb.openDB();
			String sql="select * from users where u_id=?";
			Object[] params={usdto.getU_id()};
			ResultSet rs=mydb.executeQuery(sql, params);			
			try {
				if(rs.next()){//�������������
					usdto.setU_id(rs.getInt("u_id"));
					usdto.setU_name(rs.getString("u_name"));							
					usdto.setU_nickname(rs.getString("u_nickname"));
					usdto.setU_email(rs.getString("u_email"));		
					usdto.setU_phone(rs.getString("u_phone"));								
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		mydb.close();
		return usdto;
	}
		
	//��½
	public boolean LoginUsers(UsersDto dto){
		boolean flag=false;
		try{
			mydb.openDB();
			String sql="select * from users where u_name=? and u_password=?";
			Object[] params={dto.getU_name(),dto.getU_password()};
			ResultSet rs=mydb.executeQuery(sql, params);
			flag=rs.next();
		}catch (Exception e) {
			e.printStackTrace(); // TODO: handle exception
		}
		mydb.close();
		return flag;
	}
	
	//��ѯ���
	public MoneyDto QueryMoney(MoneyDto dto){
		
			mydb.openDB();
			String sql="select * from money where u_id=?";
			Object[] params={dto.getU_id()};
			ResultSet rs=mydb.executeQuery(sql, params);
			try{
			if(rs.next()){				
				dto.setDeposit(rs.getDouble("deposit"));
			}			
		}catch (Exception e) {
			e.printStackTrace(); // TODO: handle exception
		}
		mydb.close();
		return dto;
	}
	
	
	
	//���
	public boolean DepositMoney(MoneyDto dto,double Money){
		mydb.openDB();
		String sql="update money set deposit=money.deposit+? where u_id=?;";
		Object[] params={Money,dto.getU_id()};		
		boolean flag=mydb.executeUpdate(sql, params);
		mydb.close();
		return flag;
	}
	
	//ȡ��
	public boolean WithdrawMoney(MoneyDto dto,double Money){
		mydb.openDB();
		String sql="update money set deposit=money.deposit-? where u_id=?;";
		Object[] params={Money,dto.getU_id()};
		boolean flag=mydb.executeUpdate(sql, params);
		mydb.close();
		return flag;
	}
	
	//ת��
	public boolean TransferMoney(MoneyDto user,MoneyDto Touser,double Money){
		mydb.openDB();
		
		String sql="update money set deposit=money.deposit-? where u_id=?;";
		Object[] params={Money,user.getU_id()};
		boolean flag=mydb.executeUpdate(sql, params);
		
		sql="update money set deposit=money.deposit+? where u_id=?;";
		Object[] param={Money,Touser.getU_id()};
		flag=mydb.executeUpdate(sql, param);
				
		mydb.close();
		return flag;
	}
	
	//���м���
	public boolean Record(RecordDto dto){
		mydb.openDB();
		String sql="insert into record(u_id,r_record)  values(?,?)";		
		Object[] params={dto.getU_id(),dto.getR_record()};
		boolean flag=mydb.executeUpdate(sql, params);
		mydb.close();
		return flag;
	}
	
	
	//���в�ѯ
	public ArrayList<RecordDto> QueryRecord(RecordDto dto){
		ArrayList<RecordDto> d=new ArrayList<RecordDto>();
		mydb.openDB();
		String sql="select * from  record where u_id=? order by r_id desc";		
		
		Object[] params={dto.getU_id()};
		ResultSet rs=mydb.executeQuery(sql, params);
		try{
		while(rs.next()){
			RecordDto D=new RecordDto();			
			D.setR_id(rs.getInt("r_id"));
			D.setU_id(rs.getInt("u_id"));
			D.setR_record(rs.getString("r_record"));			
			d.add(D);						
		}
		
	}catch (Exception e) {
		e.printStackTrace(); // TODO: handle exception
	}
		
		mydb.close();
		return d;
	}
	
	//��ѯ����
	public MoneyDto QueryLoan(MoneyDto dto){
		MoneyDto tmp=new MoneyDto();
		mydb.openDB();
		String sql="select loan from money where u_id=?";		
		Object[] params={dto.getU_id()};
		ResultSet rs=mydb.executeQuery(sql, params);		
		try {
			if(rs.next()){				
				tmp.setLoan(rs.getDouble("loan"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		mydb.close();
		return tmp;
	}
	
	//����
	public boolean LoanMoney(MoneyDto dto,double Money){
		mydb.openDB();
		String sql="update money set loan=money.loan+? where u_id=?";		
		Object[] params={Money,dto.getU_id()};
		boolean flag=mydb.executeUpdate(sql, params);
		mydb.close();
	
		
		if(flag){	//��������˴�������������
			DB Nmydb=new DB();

			Nmydb.openDB();
			sql="update money set deposit=money.deposit+? where u_id=?";
			Object[] param={Money,dto.getU_id()};
			flag=Nmydb.executeUpdate(sql, param);		
			Nmydb.close();			
		}


		return flag;
	}
	
	//����
	public boolean StillMoney(MoneyDto dto,double Money){
		mydb.openDB();
		String sql="update money set loan=money.loan-? where u_id=?;";		
		Object[] params={Money,dto.getU_id()};
		boolean flag=mydb.executeUpdate(sql, params);
		mydb.close();
		
		if(flag){	//�������ʧ����������
		DB Nmydb=new DB();
		Nmydb.openDB();
		sql="update money set deposit=money.deposit-? where u_id=?;";//ע��ɹ�������û���Ҫ������ݣ�Money��ҲҪ������ݽ���ͬ��
		flag=Nmydb.executeUpdate(sql, params);		
		Nmydb.close();
		}
		
		return flag;
	}
	
	
	
	
	
}
