package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.AadharBean;
import com.Bean.MailBean;
import com.NavigationService.NavigationService;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			doProcess(request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			doProcess(request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception{

		String actionCheck=request.getParameter("action");
		HttpSession session = null;
		if(actionCheck.equals("user_register")){
			
			
			String password=request.getParameter("password");
			String cPassword=request.getParameter("password1");
			String aadhar_number=request.getParameter("aadhar");
			if(password.equals(cPassword)){
				MailBean mb=NavigationService.register_user(aadhar_number);
				
			if(mb!=null){
				
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
					PreparedStatement ps=con.prepareStatement("insert into user_registration values(?,?,?)");
					ps.setString(1, aadhar_number);
					ps.setString(2, password);
					ps.setInt(3, 0);
					ps.executeUpdate();
					
					//sending registration mail
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
								InternetAddress.parse(mb.getMailid()));
						message.setSubject("Water Tanker Booking Registration");
						message.setText("You are registered successfully \n Your userId id is:"+aadhar_number+"\nYour Password is:"+password);

						Transport.send(message);

					
					
				RequestDispatcher rd=request.getRequestDispatcher("after_register_user_confirm.jsp");
				rd.forward(request, response);
			}
			else{
				
				RequestDispatcher rd=request.getRequestDispatcher("user_register_fail.jsp");
				rd.forward(request, response);
			}
			
		}
		else{
			request.setAttribute("errormessage", "Password and Confirm password are not matched");
			RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
		
	}
		else if(actionCheck.equals("login_user")){
			String pswd1=null;
			int count=0;
			String aadhar=request.getParameter("user_aadhar");
			String password=request.getParameter("user_password");
			System.out.println(aadhar+password);
			ResultSet rs=NavigationService.user_login(aadhar, password);
			while(rs.next()){
				pswd1=rs.getString(2);
				count=rs.getInt(3);
			}
			if(pswd1!=null){
				if(pswd1.equals(password)){
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
					PreparedStatement ps=con.prepareStatement("select * from aadhar_database where aadhar_number=?");
					ps.setString(1, aadhar);
					 session=request.getSession();
					session.setAttribute("aadhar", aadhar);
					ResultSet rs2=ps.executeQuery();
					
					String mailid=null;
					String nameid = null;
					while(rs2.next()){
						mailid=rs2.getString(4);
						 nameid=rs2.getString(2);
				    request.setAttribute("name", rs2.getString(2));
				    session.setAttribute("name", rs2.getString(2));
				    session.setAttribute("mailid", mailid);
					}
					request.setAttribute("govtcount", count);
					
					
					Timestamp timestamp = new Timestamp(System.currentTimeMillis());
					
			       //sending login mail
					
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
						message.setSubject("Water Tanker Booking Login Alert Mail");
						message.setText(nameid+" : You are Logged In successfully at : "+timestamp+". \n If You are not logged in Please change your password." );

						Transport.send(message);

					
					
					RequestDispatcher rd=request.getRequestDispatcher("after_login_user.jsp");
					rd.forward(request, response);
				}
				else{

					request.setAttribute("errormessage", "Your Password is Wrong.Please Enter Correct Password !");
					RequestDispatcher rd=request.getRequestDispatcher("login_user.jsp");
					rd.forward(request, response);
				}
				
			}
			else{

				request.setAttribute("errormessage", "Please Enter Valid Aadhar Number!");
				RequestDispatcher rd=request.getRequestDispatcher("login_user.jsp");
				rd.forward(request, response);
			}
		}
			else if(actionCheck.equals("updatePassword")){
			
				RequestDispatcher rd=request.getRequestDispatcher("updateUserPassword.jsp");
				rd.forward(request, response);
			
		}
			else if(actionCheck.equals("updateUserPassword")){
				
				String aadhar=request.getParameter("user_aadhar");
				String password=request.getParameter("user_password");
				String cPassword=request.getParameter("confirm_user_password");
				System.out.println(aadhar+".."+password+"..."+cPassword);
				if(password.equals(cPassword)){
					int i=NavigationService.updateUserPassword(aadhar,password);
					if(i>0){
						
						//sending mail for updating password
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


						String maill=null,namee=null;
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
						PreparedStatement ps=con.prepareStatement("select * from aadhar_database where aadhar_number=?");
						ps.setString(1, aadhar);
						ResultSet rs=ps.executeQuery();
						while(rs.next()){
							maill=rs.getString(4);
							namee=rs.getString(2);
						}
                         
							Message message = new MimeMessage(session1);
							message.setFrom(new InternetAddress("abhiram.veerapaneni@gmail.com"));
							message.setRecipients(Message.RecipientType.TO,
									InternetAddress.parse(maill));
							message.setSubject("Water Tanker Booking Password Update");
							message.setText(namee+" : Your Password is updated Successfully.\n Your new password is : "+password);

							Transport.send(message);
						
						
						
						RequestDispatcher rd=request.getRequestDispatcher("updateUserPasswordSuccess.jsp");
						rd.forward(request, response);
					}
					else{

						request.setAttribute("errormessage", "You are not Registered User!");

						RequestDispatcher rd=request.getRequestDispatcher("updateUserPassword.jsp");
						rd.forward(request, response);
					}
				}
				else{
					request.setAttribute("errormessage", "Password and confirm password are not matched!");

					RequestDispatcher rd=request.getRequestDispatcher("updateUserPassword.jsp");
					rd.forward(request, response);
				}
				
				
			}
			
			else if(actionCheck.equals("user_govt_booking")){
				String add=null,fzone=null;
				String user_address=request.getParameter("address");
				String aadhar_number=(String) request.getSession().getAttribute("aadhar");
				String zone=request.getParameter("zone");
				System.out.println("zone is:"+zone);
				AadharBean ab=NavigationService.Govt_Booking(aadhar_number);
				if(user_address.length()<5){
					add=ab.getAadhar_address();
					fzone=ab.getZone();
				}
				else{
					add=user_address;
					fzone=zone; 
				}
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
				PreparedStatement ps=con.prepareStatement("insert into tanker_bookings values(?,?,?,?,?,?,?)");
				ps.setString(1, aadhar_number);
				ps.setString(2, "Government");
				ps.setString(3, "Government");
				ps.setString(4, add);
				ps.setString(5, ab.getAadhar_mobile());
				ps.setString(6, "Pending");
				ps.setString(7, zone);

				ps.executeUpdate();
				
				con.close();
				System.out.println("order booked in governmert");
				String name=(String) request.getSession().getAttribute("name");
				String aadhar=(String) request.getSession().getAttribute("aadhar");
				int c=NavigationService.updateCount(aadhar);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
				PreparedStatement ps1=con1.prepareStatement("update user_registration set govt_tanker_count=? where aadhar_number=?");
				ps1.setInt(1, c);
				ps1.setString(2, aadhar);
				int i1=ps1.executeUpdate();
				con.close();
				System.out.println(i1+"...updated successfully");
				 
				
				//sending mail government tanker booking 
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
				String maill=(String) request.getSession().getAttribute("mailid");
				String namee=(String) request.getSession().getAttribute("name");
					Message message = new MimeMessage(session1);
					message.setFrom(new InternetAddress("abhiram.veerapaneni@gmail.com"));
					message.setRecipients(Message.RecipientType.TO,
							InternetAddress.parse(maill));
					message.setSubject("Water Tanker Booking Confirmation");
					message.setText("Hello "+name+",\n \n Your Order Placed With Government Tanker Successfull.\n \n You will be intimated with a mail Shortly After your order confirmed"
							+ "\n \n You alredy Booked "+c+" tanker(s) This month. \n \n Your Tanker will arrive to :"+add);

					Transport.send(message);
				
				
				
				
					RequestDispatcher rd=request.getRequestDispatcher("user_order_confirm.jsp");
					rd.forward(request, response);
				
			}
		
			else if(actionCheck.equals("user_booked_status")){
				
				String aadhar=(String) request.getSession().getAttribute("aadhar");
				String name=(String) request.getSession().getAttribute("name");
				System.out.println(aadhar);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
				PreparedStatement ps=con.prepareStatement("select * from tanker_bookings where user_aadhar_number=?;");
				ps.setString(1, aadhar);
				ResultSet rs=ps.executeQuery();
				request.setAttribute("status", rs);
				request.setAttribute("name", name);
				RequestDispatcher rd=request.getRequestDispatcher("user_final.jsp");
				rd.forward(request, response);
			}
			else if(actionCheck.equals("show_next_page")){
				
				
				String n=(String) request.getSession().getAttribute("name");
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
				PreparedStatement ps=con.prepareStatement("select company_name,company_tanker_cost,company_address from company_registration;");
				ResultSet rs=ps.executeQuery();
				request.setAttribute("company", rs);
				
			    request.setAttribute("name", n);
				RequestDispatcher rd=request.getRequestDispatcher("user_private_booking.jsp");
				rd.forward(request, response);
			}
			
			else if(actionCheck.equals("bookingg")){
				int count=0;
				String name=(String) request.getSession().getAttribute("name");
				String aadhar=(String) request.getSession().getAttribute("aadhar");
				request.setAttribute("name", name);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
				PreparedStatement ps=con.prepareStatement("select govt_tanker_count from user_registration where aadhar_number=?");
				ps.setString(1, aadhar);
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					count=rs.getInt(1);
				}
				request.setAttribute("govtcount", count);
				
				RequestDispatcher rd=request.getRequestDispatcher("after_login_user.jsp");
				rd.forward(request, response);
			}
		
			else if(actionCheck.equals("Private_Booking")){
				String company_name=request.getParameter("company_name");
				String aadhar=(String) request.getSession().getAttribute("aadhar");
				String address=request.getParameter("address");
				String zone=request.getParameter("zone");
				System.out.println(company_name+"..."+aadhar);
				ResultSet rs=NavigationService.PrivateBooking(company_name);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
				PreparedStatement ps=con.prepareStatement("select * from aadhar_database where aadhar_number=?;");
				ps.setString(1, aadhar);
				ResultSet rs1=ps.executeQuery();
				
				PreparedStatement ps1=con.prepareStatement("insert into tanker_bookings values(?,?,?,?,?,?,?)");
				ps1.setString(1, aadhar);
				ps1.setString(2, company_name);
				while(rs.next()){
					ps1.setString(3, rs.getString(7));
				}
				String add=null;
				while(rs1.next()){
					if(address.length()<5){
						add=rs1.getString(6);
						ps1.setString(4, rs1.getString(6));
						ps1.setString(7, rs1.getString(7));
					}
					else{
						add=address;
					ps1.setString(4, address);
					ps1.setString(7, zone);
					}
					ps1.setString(5, rs1.getString(3));
				}
				ps1.setString(6, "Pending");
				ps1.setString(7, zone);
				int j=ps1.executeUpdate();
				String name=(String) request.getSession().getAttribute("name");
				 request.setAttribute("name", name);
				 
				 //user private booking confirmation
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
								InternetAddress.parse((String) request.getSession().getAttribute("mailid")));
						message.setSubject("Water Tanker Booking Login Alert Mail");
						message.setText("Hello "+(String) request.getSession().getAttribute("name")+",\n \n Your Order Placed With "+company_name+" Tanker Successfull.\n \n You will be intimated with a mail Shortly After your order confirmed"
								+ " \n \n Your Tanker will arrive to :"+add );

						Transport.send(message);
				 
				 
					RequestDispatcher rd=request.getRequestDispatcher("user_order_confirm.jsp");
					rd.forward(request, response);
				
			}
		
			else if(actionCheck.equals("invalidate")){
				
				request.getSession().invalidate();
				RequestDispatcher rd=request.getRequestDispatcher("index.html");
				rd.forward(request, response);
			}
			
		
	}

}
