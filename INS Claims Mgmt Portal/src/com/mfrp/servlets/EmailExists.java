package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.mfrp.dao.*;


@WebServlet("/EmailExists")
public class EmailExists extends HttpServlet implements DBQueries {
	static final Logger LOGGER = Logger.getLogger(EmailExists.class);
	private static final long serialVersionUID = 1L;
       
    
    public EmailExists() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		
		String user_email_address = String.valueOf(request.getParameter("user_email_address"));			
		PrintWriter out = response.getWriter();
		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(usercheck);
			ps.setString(1, user_email_address);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				/*String user_id = rs.getString("user_id");*/
				LOGGER.info("User tried to register with existing email in database");
				DAO.closeConnection();
				out.print("User with this email already exists. Choose another.");
			} else {
				DAO.closeConnection();							
			}

		} catch (SQLException e) {
			e.getStackTrace();
			System.err.println("SQL Exception in New Email Exists : " + e);
			DAO.closeConnection();
			
		}
		
	}
}
