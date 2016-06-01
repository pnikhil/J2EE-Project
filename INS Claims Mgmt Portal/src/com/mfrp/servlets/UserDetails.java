package com.mfrp.servlets;

import java.io.IOException;
/*import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;*/
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*import javax.sql.DataSource;*/

import org.apache.log4j.Logger;

import com.mfrp.bo.UserBO;

@WebServlet("/member-panel/UserDetails")
public class UserDetails extends HttpServlet {
	static final Logger LOGGER = Logger.getLogger(UserDetails.class);
	private static final long serialVersionUID = 1L;
/*	Connection connection;
	public static DataSource dataSource;*/
	
	public UserDetails() {
		super();

	}
	/*public void init() throws ServletException{  
		 
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
    }*/

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserBO userBO = new UserBO();
		HttpSession session = request.getSession();
		if (session.getAttribute("user_name") != null) {
			String temp = session.getAttribute("user_name").toString();
			request.setAttribute("user_details", userBO.getUserDetails(temp));
		}
			RequestDispatcher d = request.getRequestDispatcher("/member-panel/user-profile.jsp");
			d.forward(request, response);
		
	}

}
