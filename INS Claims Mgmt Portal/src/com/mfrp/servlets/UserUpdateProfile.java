package com.mfrp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.mfrp.bo.UserBO;

@WebServlet("/member-panel/UserUpdateProfile")
public class UserUpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(UserUpdateProfile.class);

	public static Connection connection;
	public static DataSource dataSource;

	public UserUpdateProfile() {
		super();

	}

	public void init() throws ServletException {

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserBO userBO = new UserBO();
		HttpSession session = request.getSession();
		/*
		 * if(session.getAttribute("user_name").equals(null)) {
		 * RequestDispatcher d = request.getRequestDispatcher("../index.jsp");
		 * d.forward(request, response); } else
		 */
		
		if (session.getAttribute("user_name") != null) {
			String temp_username = session.getAttribute("user_name").toString();
			request.setAttribute("user_details", userBO.getUserDetails(temp_username));			
		}
		RequestDispatcher d = request.getRequestDispatcher("/member-panel/user_profile_update.jsp");
		d.forward(request, response);

	}

}
