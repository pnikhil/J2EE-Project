package com.mfrp.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import com.mfrp.beans.RejectedUserBean;
import com.mfrp.dao.*;


@WebServlet("/admin-panel/DeleteClaim")
public class DeleteClaim extends HttpServlet implements DBQueries {
	static final Logger LOGGER = Logger.getLogger(DeleteClaim.class);
	private static final long serialVersionUID = 1L;

	
	public DeleteClaim() {
		super();
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long start = System.currentTimeMillis();
		String id = request.getParameter("id");		
		String reject_reason = request.getParameter("id2");
		Connection con = DAO.getConnection();
		try {			
			PreparedStatement ps1 = con.prepareStatement(getrejectedClaims);
			ps1.setString(1, id);
			ResultSet rs = ps1.executeQuery();
			RejectedUserBean rub = new RejectedUserBean();
			while (rs.next()) {

				rub.setUser_id(rs.getString("user_id"));
				rub.setUser_firstname(rs.getString("user_firstname"));
				rub.setUser_lastname(rs.getString("user_lastname"));
				rub.setInsurance_type(rs.getString("insurance_type"));
				rub.setNominee_count(rs.getInt("nominee_count"));
				rub.setClaim_reason(rs.getString("claim_reason"));
				rub.setRequest_date(rs.getString("request_date"));
				rub.setClaim_index(rs.getInt("claim_index"));
				rub.setMax_claim_amount(rs.getLong("max_claim_amount"));
				rub.setFinal_claim_amount(rs.getLong("final_claim_amount"));
			}
			rub.setReject_reason(reject_reason);
			
			PreparedStatement ps2 = con.prepareStatement(rejectedClaims);
			ps2.setString(1, rub.getUser_id());
			ps2.setString(2, rub.getUser_firstname());
			ps2.setString(3, rub.getUser_lastname());
			ps2.setInt(4, rub.getUser_nominee_count());
			ps2.setLong(5, rub.getMax_claim_amount());
			ps2.setString(6, rub.getInsurance_type());
			ps2.setString(7, rub.getRequest_date());
			ps2.setString(8, rub.getClaim_reason());
			ps2.setLong(9, rub.getFinal_claim_amount());
			ps2.setInt(10, rub.getClaim_index());
			ps2.setString(11, rub.getReject_reason());
			ps2.executeUpdate();
			
			if(rub.getClaim_reason().equalsIgnoreCase("Death")){
				PreparedStatement ps3 = con.prepareStatement(deleteclaimfromdeath);			
				ps3.setString(1, id);
				ps3.executeUpdate();				
			}			
			
			PreparedStatement ps = con.prepareStatement(deleteclaim);			
			ps.setString(1, id);
			ps.executeUpdate();
			
			long end = System.currentTimeMillis();
			System.out.println(end-start);
			LOGGER.info("User Claim request with Claim Index " + request.getParameter("id") + " has been rejected");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			response.setHeader("Access-Control-Allow-Origin", "*");
			out.print("User Claim deleted Successfully");

		} catch (SQLException e) {
			LOGGER.error(e);
			System.err.println("Exception in Delete Claim");

		}
	}
}