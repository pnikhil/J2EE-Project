package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.mfrp.dao.*;

/**
 * Servlet implementation class RejectDocuments
 */
@WebServlet("/admin-panel/RejectDocuments")
public class RejectDocuments extends HttpServlet implements DBQueries {
	static final Logger LOGGER = Logger.getLogger(RejectDocuments.class);
	private static final long serialVersionUID = 1L;
       
    
    public RejectDocuments() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");		
		StringTokenizer st = new StringTokenizer(id,"||");
		String claim_index = st.nextToken();
		String reject_reason = st.nextToken();
		
		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(rejectdocuments);
			ps.setInt(1, -1);
			ps.setString(2, reject_reason);
			ps.setString(3, claim_index);
			ps.executeUpdate();
			LOGGER.info("User with claim index " + claim_index + " documents has been rejected");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			response.setHeader("Access-Control-Allow-Origin", "*");
			out.print("User Claim Documents Rejected!");

		} catch (SQLException e) {
			LOGGER.error(e);
			System.err.println("Exception in Reject Documents");
			e.printStackTrace();
		}

		
	}

}
