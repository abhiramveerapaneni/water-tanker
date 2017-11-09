package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.net.httpserver.HttpsConfigurator;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminController() {
        super();
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

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=null;
		String actioncheck=request.getParameter("action");
		System.out.println(actioncheck);
		if(actioncheck.equals("login_admin")){
			
			String name=request.getParameter("admin_name");
			String pass=request.getParameter("admin_password");
			if(name.equals("admin") && pass.equals("adminpassword")){
			session=request.getSession();
			
			
			RequestDispatcher rd=request.getRequestDispatcher("adminDashBoard.jsp");
			rd.forward(request, response);
			
			}
			else{
				
				request.setAttribute("errormessage", "You are not admin. If you forget password reset in source code !");
				RequestDispatcher rd=request.getRequestDispatcher("adminLogin.jsp");
				rd.forward(request, response);
			}
		}
		else if(actioncheck.equals("AnalyseData")){
			
			
			
			RequestDispatcher rd=request.getRequestDispatcher("AnalyseData.jsp");
			rd.forward(request, response);
			
		}
		else if(actioncheck.equals("ShowData")){
			String zone=request.getParameter("zone");
			System.out.println(zone);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
			PreparedStatement ps=con.prepareStatement("select * from tanker_bookings where zone=?");
			ps.setString(1, zone);
			ResultSet rs=ps.executeQuery();
		    
			
			request.setAttribute("data", rs);
			
			request.setAttribute("zone", zone);
			RequestDispatcher rd=request.getRequestDispatcher("AnalyseDataFinal.jsp");
			rd.forward(request, response);
			
		}
		
		
		else if(actioncheck.equals("userData")){
			
			
				try {
					System.out.println("hello");
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
					PreparedStatement ps=con.prepareStatement("select * from user_registration");
					ResultSet rs=ps.executeQuery();
					request.setAttribute("rs", rs);
					request.getSession();
				
				
				RequestDispatcher rd=request.getRequestDispatcher("admin_user_data.jsp");
				rd.forward(request, response);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
		}
		else if(actioncheck.equals("admin_out")){
			
			request.getSession().invalidate();
			RequestDispatcher rd=request.getRequestDispatcher("adminLogin.jsp");
			rd.forward(request, response);
			
		}
		else if(actioncheck.equals("supplierData")){
			
			
			try {
				System.out.println("hello");
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
				PreparedStatement ps=con.prepareStatement("select * from company_registration");
				ResultSet rs=ps.executeQuery();
				request.setAttribute("rs", rs);
				request.getSession();
			
			
			RequestDispatcher rd=request.getRequestDispatcher("adminCompanyData.jsp");
			rd.forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
	}
		else if(actioncheck.equals("resetCount")){
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/water_tanker","root","root");
			PreparedStatement ps=con.prepareStatement("update user_registration set govt_tanker_count=0");
			
			String timeStamp = new SimpleDateFormat("dd").format(Calendar.getInstance().getTime());
			if(timeStamp.equals("01")){
				
				ps.executeUpdate();
				request.setAttribute("errormessage", "Count Updated Successfully !");
				RequestDispatcher rd=request.getRequestDispatcher("adminDashBoard.jsp");
				rd.forward(request, response);
				
				
			}
			else{
				request.setAttribute("errormessage", "Today is not first day of month. So Count can't update !");
				RequestDispatcher rd=request.getRequestDispatcher("adminDashBoard.jsp");
				rd.forward(request, response);
			}
			
			
			
			
			
		}
		
		else if(actioncheck.equals("goback")){
			
			RequestDispatcher rd=request.getRequestDispatcher("adminDashBoard.jsp");
			rd.forward(request, response);
		}
		
	}

}
