package com.mfrp.servlets;
import java.io.IOException;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import org.apache.log4j.Logger;


@WebServlet("/UserLogin")
public class UserLoginValidate extends HttpServlet {
	
	static final Logger LOGGER = Logger.getLogger(UserLoginValidate.class);
	private static final long serialVersionUID = 1L;
	public static Connection connection;
	public static DataSource dataSource;
   
    public UserLoginValidate() {
        super();
        
    }
    
    public void init() throws ServletException{  
		 
    	try {
            Context initContext  = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/mfrpdb");    
            try {
				connection = dataSource.getConnection();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
        } catch (NamingException e) {
        	LOGGER.error(e);
        }    	
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	/*UserLoginBean userb  = new UserLoginBean();   	    	
    	userb.setMember_username(request.getParameter("username"));
    	userb.setMember_password(request.getParameter("userpassword")); 
		UserBO userBO = new UserBO();
		int success = userBO.userLogin(userb);
		HttpSession session = request.getSession();
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter(); 
		if(success == 1){			
			session.setAttribute("user_name", userb.getMember_username());			
			session.setAttribute("isUserLoggedIn",true);
			LOGGER.info(session.getAttribute("user_name") + " has successfully logged in");*/
			response.sendRedirect(request.getContextPath() + "/member-panel/user_dashboard");
		/*	
		}
		else if(success == 3){
			
			try {
				LOGGER.info(request.getParameter("username") + " has hit the Registration on hold page");
				connection.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			out.print("<center><div class=\"alert alert-danger voffset2\" id=\"regonhold\"><h2>Registration on hold</h2></div></center>");
			request.getRequestDispatcher("/index").include(request, response); 
			
		}			
		else if(success == 2) {
			
			try {
				LOGGER.info(request.getParameter("username") + " has hit the Invalid Login Credentials page");
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print("<center><div class=\"alert alert-danger voffset2\"><h2>Invalid Login Credentials</h2></div></center>");
			request.getRequestDispatcher("/member_login").include(request, response); 
			
		}		
		else if(success == 4) {			
			try {
				LOGGER.info(request.getParameter("username") + " has hit the Registration Rejected Page");
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print("<center><div class=\"alert alert-danger voffset2\"><h2>Registration Rejected. Try Again</h2></div></center>");
			request.getRequestDispatcher("/user_registration").include(request, response); 	
			
		}
*/	}

}