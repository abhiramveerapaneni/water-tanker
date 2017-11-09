package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.companyLoginBean;
import com.Bean.companyRegisterBean;
import com.NavigationService.NavigationService;

@WebServlet("/SupplierController")
public class SupplierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SupplierController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
			doProcess(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception{

		HttpSession session=null;
		String actionCheck=request.getParameter("action");
           if(actionCheck.equals("company_register")){
			
			String company_name =request.getParameter("company_name");
			String company_email=request.getParameter("company_email");
			String company_password=request.getParameter("company_password");
			String company_password1=request.getParameter("company_password1");
			String company_licence=request.getParameter("company_licence");
			String company_phone=request.getParameter("company_phone");
			String company_address=request.getParameter("company_address");
			String company_Organisation=request.getParameter("Organisation");
			String company_tanker_cost=request.getParameter("company_cost");
			
			if(company_password.equals(company_password1)){
				
				companyRegisterBean crb=new companyRegisterBean();
				crb.setAddress(company_address);
				crb.setEmail(company_email);
				crb.setLicence(company_licence);
				crb.setMobile(company_phone);
				crb.setName(company_name);
				crb.setPassword(company_password);
				crb.setOrganisation(company_Organisation);
				crb.setCost(company_tanker_cost);
				boolean b=NavigationService.register_supplier(crb);
				
				if(b==true){
					RequestDispatcher rd=request.getRequestDispatcher("after_register_supplier_confirm.jsp");
					rd.forward(request, response);
				}
				else{
					request.setAttribute("errormessage", "Not Registered Some problem is there please try after some time!");

					RequestDispatcher rd=request.getRequestDispatcher("register_supplier.jsp");
					rd.forward(request, response);
				}
				
			}
			else{

				request.setAttribute("errormessage", "Password and Confirm password are not matched");

				RequestDispatcher rd=request.getRequestDispatcher("register_supplier.jsp");
				rd.forward(request, response);
			}
			
		}
           else if(actionCheck.equals("supplier_login")){
   			
   			String company_name=request.getParameter("company_name");
   			String company_password=request.getParameter("company_password");
   			companyLoginBean clb=NavigationService.supplier_login(company_name);
   			
   			
   			if(clb.getC_password()==null){
				request.setAttribute("errormessage", "Please Enter Correct Name!");

   				RequestDispatcher rd=request.getRequestDispatcher("login_supply.jsp");
   				rd.forward(request, response);
   			}
   			if(clb.getC_password().equals(company_password)){
   				session=request.getSession();
   				session.setAttribute("cname", company_name);
   				
   				ResultSet rs=NavigationService.supplier_list(company_name);
   				if(rs==null){
   					request.setAttribute("c_name", (String)request.getSession().getAttribute("cname"));
   					request.setAttribute("bookings", "No Current Booking Requests");
   					RequestDispatcher rd=request.getRequestDispatcher("after_login_supplier.jsp");
   					rd.forward(request, response);
   				}
   				else{
   					request.getSession().setAttribute("cost", clb.getC_cost());
   					request.setAttribute("c_name", company_name);
   					request.setAttribute("bookings", rs);
   					RequestDispatcher rd=request.getRequestDispatcher("after_login_supplier.jsp");
   					rd.forward(request, response);
   				}
   			}
   			else{
				request.setAttribute("errormessage", "Your Password is Wrong.Please Enter Correct Password !");

   				RequestDispatcher rd=request.getRequestDispatcher("login_supply.jsp");
   				rd.forward(request, response);
   			}
   			
   		}
           else if(actionCheck.equals("updateSupplierPassword")){
   			RequestDispatcher rd=request.getRequestDispatcher("update_supplier_password.jsp");
   			rd.forward(request, response);
   		}
   		else if(actionCheck.equals("update_supplier_password")){
   			
   			String company_name=request.getParameter("company_name");
   			String company_password=request.getParameter("company_password");
   			String company_licence=request.getParameter("company_license");
   			String cpassword=request.getParameter("cpassword");
   			System.out.println(company_name+".."+company_licence+"...."+company_password+"...."+cpassword);
   			if(company_password.equals(cpassword)){
   				int i=NavigationService.updateSupplierPassword(company_name,company_licence,company_password);
   				if(i>0){
   					RequestDispatcher rd=request.getRequestDispatcher("update_supplier_password_success.jsp");
   					rd.forward(request, response);
   					
   				}
   				else{
   					request.setAttribute("errormessage", "Your are not registered supplier !");
   					RequestDispatcher rd=request.getRequestDispatcher("update_supplier_password.jsp");
   					rd.forward(request, response);
   				}
   			}
   			else{
   				request.setAttribute("errormessage", "Your Password and confirm password Do not match !");
   				RequestDispatcher rd=request.getRequestDispatcher("update_supplier_password.jsp");
   				rd.forward(request, response);
   			}
   			
   			
   		}
else if(actionCheck.equals("accept")){
			
			System.out.println(actionCheck);
			String status=request.getParameter("status");
			String aadhar_number=request.getParameter("aadhar_number");
			String c_name=request.getParameter("c_name");
			
			int i=NavigationService.booking_status(aadhar_number,status, c_name);
			
			
			//sending mail while booking confirmed
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
			PreparedStatement ps=con.prepareStatement("select * from aadhar_database where aadhar_number=?");
			ps.setString(1, aadhar_number);
			ResultSet rs=ps.executeQuery();
			String mailid=null;
			
			while(rs.next()){
				mailid=rs.getString(4);
			}
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			Session session1 = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("abhiram.veerapaneni@gmail.com","8106632929");
					}
				});

		

				Message message = new MimeMessage(session1);
				message.setFrom(new InternetAddress("abhiram.veerapaneni@gmail.com"));
				message.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse(mailid));
				message.setSubject("Water Tanker Booking Confirmation Alert");
				if(status.equals("accepted")){
				message.setText( "Your Order With : "+c_name+" is : "+status+"  Succesfully.\n  Amount to be paid For Tanker is: "+request.getSession().getAttribute("cost") );
				}
				if(status.equals("rejected")){
					message.setText( "Your Order With : "+c_name+" is : "+status );
					
				}
				Transport.send(message);
			
			
			request.setAttribute("c_name", c_name);
			RequestDispatcher rd=request.getRequestDispatcher("supplier_redirect.jsp");
			rd.forward(request, response);
			
			
		}
else if(actionCheck.equals("Temporary")){
	String company_name=(String) request.getSession().getAttribute("cname");
	ResultSet rs=NavigationService.supplier_list(company_name);
	if(rs==null){
		request.setAttribute("bookings", "No Current Booking Requests");
		request.setAttribute("c_name", company_name);
		RequestDispatcher rd=request.getRequestDispatcher("after_login_supplier.jsp");
		rd.forward(request, response);
	}
	else{
		request.setAttribute("bookings", rs);
		request.setAttribute("c_name", company_name);
		RequestDispatcher rd=request.getRequestDispatcher("after_login_supplier.jsp");
		rd.forward(request, response);
	}
}
           
else if(actionCheck.equals("supplier_out")){
	
	session=request.getSession();
	session.invalidate();
	RequestDispatcher rd=request.getRequestDispatcher("index.html");
	rd.forward(request, response);
	
}
	}

}
