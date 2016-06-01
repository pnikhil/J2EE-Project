package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.mfrp.dao.*;

@WebServlet("/admin-panel/ApproveUser")
public class ApproveUser extends HttpServlet implements DBQueries {
	static final Logger LOGGER = Logger.getLogger(ApproveUser.class);
	private static final long serialVersionUID = 1L;
	
	public ApproveUser() {
		super();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		Connection con = DAO.getConnection();
		try {
			
			PreparedStatement ps = con.prepareStatement(approveuser);
			ps.setString(1, "yes");
			ps.setString(2, id);
			ps.executeUpdate();
			
			PreparedStatement ps2 = con.prepareStatement(approveuser2);
			ps2.setString(1, id);
			ps2.executeUpdate();
			
			LOGGER.info("User with ID " + request.getParameter("id") + " has been Approved");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			response.setHeader("Access-Control-Allow-Origin", "*"); 
			out.print("Dear Admin, Member added successfully with member ID:" + id);
			
			
		} catch (Exception e) {
			LOGGER.error(e);			
			System.err.println("Exception in approve users ");
		}

	}

}