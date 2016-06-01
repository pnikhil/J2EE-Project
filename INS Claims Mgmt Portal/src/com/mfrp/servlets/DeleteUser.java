package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.mfrp.dao.*;

@WebServlet("/admin-panel/DeleteUser")
public class DeleteUser extends HttpServlet implements DBQueries{
	static final Logger LOGGER = Logger.getLogger(DeleteUser.class);
	private static final long serialVersionUID = 1L;

	
	public DeleteUser() {
		super();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		Connection con = DAO.getConnection();
		try {
			
			PreparedStatement ps2 = con.prepareStatement(deleteuser2);
			ps2.setString(1, id);
			ps2.executeUpdate();
			
			PreparedStatement ps = con.prepareStatement(deleteuser);			
			ps.setString(1, id);
			ps.executeUpdate();	
			
			LOGGER.info("User with ID " + request.getParameter("id") + " has been deleted");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			response.setHeader("Access-Control-Allow-Origin", "*"); 
			out.print("User Deleted Successfully");				
			 
		} catch (SQLException e) {
			LOGGER.error(e);
			System.err.println("Exception in Delete user ");
			e.printStackTrace();
		}
	}

}