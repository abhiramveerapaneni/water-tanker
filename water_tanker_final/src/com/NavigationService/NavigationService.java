package com.NavigationService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.Bean.AadharBean;
import com.Bean.MailBean;
import com.Bean.companyLoginBean;
import com.Bean.companyRegisterBean;

public class NavigationService {
	
	static AadharBean ab=new AadharBean();

	public static MailBean register_user(String aadhar_number) throws Exception{

		String name=null,mail1=null;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
			PreparedStatement ps=con.prepareStatement("select * from aadhar_database where aadhar_number=?");
			ps.setString(1, aadhar_number);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				 name=rs.getString(2);
				 mail1=rs.getString(4);
			}
			MailBean mb=new MailBean();
			mb.setMailid(mail1);
			mb.setName(name);
			return mb;
		
	}

	public static boolean register_supplier(companyRegisterBean crb) throws Exception{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
		PreparedStatement ps=con.prepareStatement("insert into company_registration values(?,?,?,?,?,?,?,?)");
		ps.setString(1, crb.getName());
		ps.setString(2, crb.getPassword());
		ps.setString(3, crb.getEmail());
		ps.setString(4, crb.getMobile());
		ps.setString(5, crb.getLicence());
		ps.setString(6, crb.getCost());
		ps.setString(7, crb.getOrganisation());
		ps.setString(8, crb.getAddress());
		int i=ps.executeUpdate();
		System.out.println(i);
		if(i==1){
			return true;
		}
		else{
			return false;
		}
		
		
		
	}

	public static ResultSet user_login(String user_aadhar, String user_password) throws Exception{

		ResultSet rs=null;
		String pswd=null;;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
		PreparedStatement ps=con.prepareStatement("select * from user_registration where aadhar_number=?");
		ps.setString(1, user_aadhar);
		rs=ps.executeQuery();
		
		return rs;
		
		
		
	}

	public static companyLoginBean supplier_login(String company_name) throws Exception {

		ResultSet rs=null;
		String pswd=null;
		companyLoginBean clb=new companyLoginBean();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
		PreparedStatement ps=con.prepareStatement("select * from company_registration where company_name=?");
		ps.setString(1, company_name);
		rs=ps.executeQuery();
		if(rs!=null){
		while(rs.next()){
			clb.setC_name(rs.getString(1));
			clb.setC_password(rs.getString(2));
			clb.setC_email(rs.getString(3));
			clb.setC_mobile(rs.getString(4));
			clb.setC_licence(rs.getString(5));
			clb.setC_cost(rs.getString(6));
			clb.setC_type(rs.getString(7));
			clb.setC_address(rs.getString(8));
			
		}
		return clb;
		}
		else{
			return null;
		}
		
	}

	public static AadharBean Govt_Booking(String aadhar_number) throws Exception{

		AadharBean ab=new AadharBean();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
		PreparedStatement ps=con.prepareStatement("select * from aadhar_database where aadhar_number=?");
		ps.setString(1, aadhar_number);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			ab.setZone(rs.getString(7));
			ab.setAadhar_address(rs.getString(6));
			ab.setAadhar_email(rs.getString(4));
			ab.setAadhar_gender(rs.getString(5));
			ab.setAadhar_mobile(rs.getString(3));
			ab.setAadhar_name(rs.getString(2));
			ab.setAadhar_number(rs.getString(1));
			
		}
		return ab;
		
	}

	public static ResultSet PrivateBooking(String company_name) throws Exception{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
		PreparedStatement ps=con.prepareStatement("select * from company_registration where company_name=?;");
		ps.setString(1, company_name);
		ResultSet rs=ps.executeQuery();
		return rs;
		
		
	}

	public static ResultSet supplier_list(String company_name) throws Exception{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
		PreparedStatement ps=con.prepareStatement("select * from tanker_bookings where company_name=? and status=?");
		ps.setString(1, company_name);
		ps.setString(2, "Pending");
		ResultSet rs=ps.executeQuery();
		if(rs!=null){
			return rs;
		}
		else{
			return null;
		}
		
	}

	public static int booking_status(String aadhar_number, String status, String c_name) throws Exception{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
		PreparedStatement ps=con.prepareStatement("update tanker_bookings set status=? where user_aadhar_number=? and company_name=?");
		ps.setString(1, status);
		ps.setString(2, aadhar_number);
		ps.setString(3, c_name);
		int i=ps.executeUpdate();
		return i;
		
	}

	public static int updateUserPassword(String aadhar, String password) throws Exception{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
		PreparedStatement ps=con.prepareStatement("update user_registration set password=? where aadhar_number=?");
		ps.setString(1, password);
		ps.setString(2, aadhar);
		int i=ps.executeUpdate();
		System.out.println("executed "+i);
		return i;
	}

	public static int updateSupplierPassword(String company_name, String company_licence, String company_password) throws Exception {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
		PreparedStatement ps=con.prepareStatement("update company_registration set company_password=? where company_name=? and company_licence=?");
		ps.setString(1, company_password);
		ps.setString(2, company_name);
		ps.setString(3, company_licence);
		int i=ps.executeUpdate();
		System.out.println("executed"+i);
		return i;
		
		
	}

	public static int updateCount(String aadhar) throws Exception{

		int count=0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
		PreparedStatement ps=con.prepareStatement("select * from user_registration where aadhar_number=?");
		ps.setString(1, aadhar);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			count=rs.getInt(3);
		}
		count=count+1;
		return count;
		
		
		
	}

	
		
	}

