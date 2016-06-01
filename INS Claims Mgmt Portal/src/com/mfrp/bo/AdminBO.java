package com.mfrp.bo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.Logger;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.mfrp.dao.*;
import com.mfrp.beans.*;

public class AdminBO implements DBQueries {
	static final Logger LOGGER = Logger.getLogger(AdminBO.class);	
	
	
	
	
	public boolean adminLogin(AdminBean ab) {
		
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection con = DAO.getConnection();
		try {				
			ps = con.prepareStatement(admin_login_verification);
			ps.setString(1, ab.getAdmin_name());
			ps.setString(2, ab.getAdmin_password());
			rs = ps.executeQuery();
			if (rs.next()) {
				rs.close();
				ps.close();
				DAO.closeConnection();
				return true;

			} else {
				rs.close();
				ps.close();
				DAO.closeConnection();
				return false;
			}
		} catch (SQLException e) {			
			LOGGER.error("SQLException in AdminBO " + e);			
			return false;
		}		

	}
	
	public boolean adminUserUpdate(UserDetailsBean ub) {
		
		PreparedStatement ps;
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(adminupdateuser);
			
			ps.setString(1, ub.getUser_first_name());
			ps.setString(2, ub.getUser_last_name());
			ps.setString(3, ub.getUser_gender());
			ps.setString(4, ub.getUser_dob());
			ps.setString(5, ub.getUser_address());
			ps.setString(6, ub.getUser_contact_no());
			ps.setString(7, ub.getUser_email());
			ps.setInt(8, ub.getUser_nominee_count());
			ps.setDouble(9, ub.getUser_max_claim_amount());
			ps.setString(10, ub.getUser_insurance_type());
			ps.setFloat(11, ub.getUser_insured_amount());
			ps.setDouble(12, ub.getUser_max_claimable_amount());
			ps.setString(13, ub.getUser_id());
			int suc = ps.executeUpdate();			
			if (suc > 0) {
				ps.close();
				DAO.closeConnection();
				return true;
			} else {
				ps.close();
				DAO.closeConnection();
				return false;
			}
		} catch (SQLException e) {
			System.err.println("SQL Exception in UserBo.adminupdateuser : " + e);
			DAO.closeConnection();
			return false;
		}
	}

	public Map<String, UserDetailsBean> getPendingUsers() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<String, UserDetailsBean> mymap = new HashMap<String, UserDetailsBean>();		
		try {
				Connection con = DAO.getConnection();
				ps = con.prepareStatement(getpendingusers);
				rs = ps.executeQuery();
				while (rs.next()) {
				UserDetailsBean ub = new UserDetailsBean();
				ub.setUser_id(rs.getString("user_id"));
				ub.setUser_first_name(rs.getString("user_firstname"));
				ub.setUser_last_name(rs.getString("user_lastname"));
				ub.setUser_gender(rs.getString("user_gender"));
				ub.setUser_dob(rs.getString("user_dob"));
				ub.setUser_address(rs.getString("user_address"));
				ub.setUser_contact_no(rs.getString("user_contact_no"));
				ub.setUser_email(rs.getString("user_email_address"));
				ub.setUser_nominee_count(rs.getInt("nominee_count"));
				ub.setUser_insurance_type(rs.getString("insurance_type"));
				ub.setUser_insured_amount(rs.getInt("insured_amount"));
				ub.setUser_max_claimable_amount(rs.getLong("max_claimable_amount"));
				ub.setUser_max_claim_amount(rs.getLong("max_claim_amount"));			
				mymap.put(ub.getUser_id(), ub);				
			}
		} catch (SQLException e) {
			System.err.println("SQLException in AdminBo.getpendingusers : " + e);
			e.printStackTrace();
		}
		
		DAO.closeConnection();
		try {
			ps.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return mymap;
	}

	public Map<String, UserDetailsBean> getAllUsers() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<String, UserDetailsBean> mymap = new HashMap<String, UserDetailsBean>();
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(getallusers);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserDetailsBean ub = new UserDetailsBean();
				ub.setUser_id(rs.getString("user_id"));
				ub.setUser_first_name(rs.getString("user_firstname"));
				ub.setUser_last_name(rs.getString("user_lastname"));
				ub.setUser_gender(rs.getString("user_gender"));
				ub.setUser_dob(rs.getString("user_dob"));
				ub.setUser_address(rs.getString("user_address"));
				ub.setUser_contact_no(rs.getString("user_contact_no"));
				ub.setUser_email(rs.getString("user_email_address"));
				ub.setUser_nominee_count(rs.getInt("nominee_count"));
				ub.setUser_insurance_type(rs.getString("insurance_type"));
				ub.setUser_insured_amount(rs.getInt("insured_amount"));
				ub.setUser_max_claimable_amount(rs.getLong("max_claimable_amount"));
				ub.setUser_max_claim_amount(rs.getLong("max_claim_amount"));
				mymap.put(ub.getUser_id(), ub);

			}
		} catch (SQLException e) {
			System.err.println("SQLException in AdminBo.getAllUsers : " + e);
			e.printStackTrace();
		}
		try {
			DAO.closeConnection();
			rs.close();
			ps.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return mymap;
	}

	public Map<String, UserDetailsBean> getRejectedUsers() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<String, UserDetailsBean> mymap = new HashMap<String, UserDetailsBean>();
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(getrejectedusers);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserDetailsBean ub = new UserDetailsBean();
				/* ub.setUser_id(rs.getString("user_id")); */
				ub.setUser_first_name(rs.getString("user_firstname"));
				ub.setUser_last_name(rs.getString("user_lastname"));
				ub.setUser_gender(rs.getString("user_gender"));
				ub.setUser_dob(rs.getString("user_dob"));
				ub.setUser_address(rs.getString("user_address"));
				ub.setUser_contact_no(rs.getString("user_contact_no"));
				ub.setUser_email(rs.getString("user_email_address"));
				ub.setUser_nominee_count(rs.getInt("nominee_count"));
				ub.setUser_insurance_type(rs.getString("insurance_type"));
				ub.setUser_insured_amount(rs.getInt("insured_amount"));
				ub.setUser_max_claimable_amount(rs.getLong("max_claimable_amount"));
				mymap.put(ub.getUser_email(), ub);

			}
		} catch (SQLException e) {
			System.err.println("SQLException in AdminBo.getAllUsers : " + e);
			e.printStackTrace();
		}
		try {
			ps.close();
			rs.close();
			DAO.closeConnection();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return mymap;
	}

	public Map<Integer, UserClaimsBean> getPendingClaims() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<Integer, UserClaimsBean> mymap = new HashMap<Integer, UserClaimsBean>();
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(getpendingclaims);
			rs = ps.executeQuery();

			while (rs.next()) {

				UserClaimsBean ub = new UserClaimsBean();
				ub.setUser_id(rs.getString("user_id"));
				ub.setUser_first_name(rs.getString("user_firstname"));
				ub.setUser_last_name(rs.getString("user_lastname"));
				ub.setUser_nominee_count(rs.getInt("nominee_count"));
				ub.setUser_max_claim_amount(rs.getLong("max_claim_amount"));
				ub.setUser_insurance_type(rs.getString("insurance_type"));
				ub.setRequest_date(rs.getString("request_date"));
				ub.setClaim_reason(rs.getString("claim_reason"));
				ub.setFinal_claim_amount(rs.getLong("final_claim_amount"));
				ub.setClaim_index(rs.getInt("claim_index"));
				// ub.setInsured_amount(rs.getInt("insured_amount"));
				mymap.put(ub.getClaim_index(), ub);				
			}
		} catch (SQLException e) {
			System.err.println("SQLException in AdminBo.getPendingclaims : " + e);
			e.printStackTrace();
		}
		try {
			ps.close();
			rs.close();
			DAO.closeConnection();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return mymap;
	}
	
	public Map<String, UserDeathBean> getDeathClaims() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<String, UserDeathBean> deathmap = new HashMap<String, UserDeathBean>();
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(getdeathclaims);
			rs = ps.executeQuery();

			while (rs.next()) {

				UserDeathBean udb = new UserDeathBean();
				udb.setUser_id(rs.getString("user_id"));
				udb.setDeath_date(rs.getString("death_date"));
				udb.setDeath_reason(rs.getString("death_reason"));
				udb.setNominee_1(rs.getString("nominee_1"));
				udb.setNominee_2(rs.getString("nominee_2"));
				udb.setNominee_3(rs.getString("nominee_3"));				
				// ub.setInsured_amount(rs.getInt("insured_amount"));
				deathmap.put(udb.getUser_id(), udb);
			}
		} catch (SQLException e) {
			System.err.println("SQLException in AdminBo.getDeathClaims : " + e);
			e.printStackTrace();
		}
		try {
			ps.close();
			rs.close();
			DAO.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return deathmap;
	}
	
	
	
	public Map<String, UserDeathBean> getDeathClaimsForApproved() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<String, UserDeathBean> deathmap = new HashMap<String, UserDeathBean>();
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(getdeathclaimsforapproved);
			rs = ps.executeQuery();

			while (rs.next()) {

				UserDeathBean udb = new UserDeathBean();
				udb.setUser_id(rs.getString("user_id"));
				udb.setDeath_date(rs.getString("death_date"));
				udb.setDeath_reason(rs.getString("death_reason"));
				udb.setNominee_1(rs.getString("nominee_1"));
				udb.setNominee_2(rs.getString("nominee_2"));
				udb.setNominee_3(rs.getString("nominee_3"));				
				// ub.setInsured_amount(rs.getInt("insured_amount"));
				deathmap.put(udb.getUser_id(), udb);
			}
		} catch (SQLException e) {
			System.err.println("SQLException in AdminBo.getDeathClaimsforapproved : " + e);
			e.printStackTrace();
		}
		try {
			ps.close();
			rs.close();
			DAO.closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return deathmap;
	}
	
	/*public Map<String, UserDeathBean> getDeathClaimsForRejected() {

		Map<String, UserDeathBean> deathmap = new HashMap<String, UserDeathBean>();
		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(getdeathclaimsforrejected);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				UserDeathBean udb = new UserDeathBean();
				udb.setUser_id(rs.getString("user_id"));
				udb.setDeath_date(rs.getString("death_date"));
				udb.setDeath_reason(rs.getString("death_reason"));
				udb.setNominee_1(rs.getString("nominee_1"));
				udb.setNominee_2(rs.getString("nominee_2"));
				udb.setNominee_3(rs.getString("nominee_3"));				
				// ub.setInsured_amount(rs.getInt("insured_amount"));
				deathmap.put(udb.getUser_id(), udb);
			}
		} catch (SQLException e) {
			System.err.println("SQLException in AdminBo.getDeathClaimsforapproved : " + e);
			e.printStackTrace();
		}
		DAO.closeConnection();
		return deathmap;
	}*/
	

	public Map<Integer, UserClaimsBean> getRejectedClaims() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<Integer, UserClaimsBean> mymap = new HashMap<Integer, UserClaimsBean>();
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(getrejectedclaims);
			rs = ps.executeQuery();

			while (rs.next()) {

				UserClaimsBean ub = new UserClaimsBean();
				ub.setUser_id(rs.getString("user_id"));

				ub.setUser_first_name(rs.getString("user_firstname"));
				ub.setUser_last_name(rs.getString("user_lastname"));
				ub.setUser_nominee_count(rs.getInt("nominee_count"));
				ub.setUser_max_claim_amount(rs.getLong("max_claim_amount"));
				ub.setUser_insurance_type(rs.getString("insurance_type"));
				ub.setRequest_date(rs.getString("request_date"));
				ub.setClaim_reason(rs.getString("claim_reason"));
				ub.setFinal_claim_amount(rs.getLong("final_claim_amount"));
				ub.setClaim_index(rs.getInt("claim_index"));
				ub.setReject_reason(rs.getString("reject_reason"));
				// ub.setInsured_amount(rs.getInt("insured_amount"));

				mymap.put(ub.getClaim_index(), ub);

			}
		} catch (SQLException e) {
			System.err.println("SQLException in AdminBo.getPendingclaims : " + e);
			e.printStackTrace();
		}
		try {
			DAO.closeConnection();
			ps.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mymap;
	}

	public Map<Integer, UserClaimsBean> getApprovedClaims() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<Integer, UserClaimsBean> mymap = new HashMap<Integer, UserClaimsBean>();
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(getapprovedclaims);
			rs = ps.executeQuery();

			while (rs.next()) {

				UserClaimsBean ub = new UserClaimsBean();
				ub.setUser_id(rs.getString("user_id"));

				ub.setUser_first_name(rs.getString("user_firstname"));
				ub.setUser_last_name(rs.getString("user_lastname"));
				ub.setUser_nominee_count(rs.getInt("nominee_count"));
				ub.setUser_max_claim_amount(rs.getLong("max_claim_amount"));
				ub.setUser_insurance_type(rs.getString("insurance_type"));
				ub.setRequest_date(rs.getString("request_date"));
				ub.setClaim_reason(rs.getString("claim_reason"));
				ub.setFinal_claim_amount(rs.getLong("final_claim_amount"));
				ub.setClaim_index(rs.getInt("claim_index"));
				// ub.setInsured_amount(rs.getInt("insured_amount"));

				mymap.put(ub.getClaim_index(), ub);

			}
		} catch (SQLException e) {
			System.err.println("SQLException in AdminBo.getPendingclaims : " + e);
			e.printStackTrace();
		}
		try {
			DAO.closeConnection();
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mymap;
	}

	public Map<Integer, UserClaimsBean> searchAllClaims() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<Integer, UserClaimsBean> mymap = new HashMap<Integer, UserClaimsBean>();
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(searchallclaims);
			rs = ps.executeQuery();

			while (rs.next()) {

				UserClaimsBean ub = new UserClaimsBean();
				ub.setUser_id(rs.getString("user_id"));
				ub.setUser_first_name(rs.getString("user_firstname"));
				ub.setUser_last_name(rs.getString("user_lastname"));
				ub.setUser_nominee_count(rs.getInt("nominee_count"));
				ub.setUser_max_claim_amount(rs.getLong("max_claim_amount"));
				ub.setUser_insurance_type(rs.getString("insurance_type"));
				ub.setRequest_date(rs.getString("request_date"));
				ub.setClaim_reason(rs.getString("claim_reason"));
				ub.setFinal_claim_amount(rs.getLong("final_claim_amount"));
				ub.setClaim_index(rs.getInt("claim_index"));
				ub.setStatus(rs.getString("claim_status"));
				// ub.setInsured_amount(rs.getInt("insured_amount"));
				mymap.put(ub.getClaim_index(), ub);
			}
		} catch (SQLException e) {
			System.err.println("SQLException in AdminBo.searchAllclaims : " + e);
			e.printStackTrace();
		}
		try {
			DAO.closeConnection();
			ps.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mymap;
	}

	public Map<Integer, UserClaimsBean> finalClaimProcess() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<Integer, UserClaimsBean> mymap = new HashMap<Integer, UserClaimsBean>();
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(finalclaimprocess);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserClaimsBean ucb = new UserClaimsBean();
				ucb.setClaim_index(rs.getInt("claim_index"));
				ucb.setUser_first_name(rs.getString("user_firstname"));
				ucb.setClaim_documents(rs.getString("claim_documents"));
				ucb.setRequest_date(rs.getString("request_date"));
				ucb.setClaim_reason(rs.getString("claim_reason"));
				ucb.setUser_insurance_type(rs.getString("insurance_type"));
				ucb.setFinal_claim_amount(rs.getLong("final_claim_amount"));
				ucb.setUser_last_name(rs.getString("user_lastname"));
				ucb.setUser_id(rs.getString("user_id"));
				mymap.put(ucb.getClaim_index(), ucb);
			}
		} catch (SQLException e) {
			System.err.println("SQLException in final claim process:" + e);
			e.printStackTrace();
		}
		try {
			DAO.closeConnection();
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mymap;
	}

	public Map<Integer, UserClaimsBean> ApprovedClaims() {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Map<Integer, UserClaimsBean> mymap = new HashMap<Integer, UserClaimsBean>();
		Connection con = DAO.getConnection();
		try {
			ps = con.prepareStatement(approvedclaims);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserClaimsBean ucb = new UserClaimsBean();
				ucb.setUser_id(rs.getString("user_id"));
				ucb.setUser_first_name(rs.getString("user_firstname"));
				ucb.setUser_last_name(rs.getString("user_lastname"));
				ucb.setUser_nominee_count(rs.getInt("nominee_count"));
				ucb.setUser_max_claim_amount(rs.getLong("max_claim_amount"));
				ucb.setUser_insurance_type(rs.getString("insurance_type"));
				ucb.setRequest_date(rs.getString("request_date"));
				ucb.setClaim_reason(rs.getString("claim_reason"));
				ucb.setFinal_claim_amount(rs.getLong("final_claim_amount"));
				ucb.setClaim_index(rs.getInt("claim_index"));
				mymap.put(ucb.getClaim_index(), ucb);
			}
		} catch (SQLException e) {
			System.err.println("SQLException in approved claims:" + e);
			e.printStackTrace();
		}
		try {
			DAO.closeConnection();
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mymap;

	}

	public boolean generateReport(String id, String baseurl) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		try {
			Connection con = DAO.getConnection();
			ps = con.prepareStatement(generatepdf);
			ps.setString(1, id);			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				String user_id = rs.getString("user_id").toUpperCase();
				String full_name = rs.getString("user_firstname") + " " + rs.getString("user_lastname");
				/*
				 * int nominee_count = rs.getInt("nominee_count"); long
				 * max_claim_amount = rs.getLong("max_claim_amount");
				 */
				String insurance_type = rs.getString("insurance_type");
				String request_date = rs.getString("request_date");
				String claim_reason = rs.getString("claim_reason");
				/*String request_date = rs.getString("request_date");*/
				int final_claim_amount = rs.getInt("final_claim_amount");
				String final_approval_date = rs.getString("final_approval_date");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar now = Calendar.getInstance();
				Date parsedDate = sdf.parse(final_approval_date);
				now.setTime(parsedDate);
				now.add(Calendar.DAY_OF_MONTH, 10);
				SimpleDateFormat sdf2 = new SimpleDateFormat("d MMMM, yyyy");
				String temp = sdf2.format(now.getTime());

				String path = baseurl + "/WebContent/resources/" + user_id + "/" + request_date + "-" + claim_reason
						+ "/" + user_id.toUpperCase() + " - details.pdf";
				OutputStream file = new FileOutputStream(new File("D:/Nikhil/" + path));

				Document document = new Document();
				PdfWriter.getInstance(document, file);
				// Inserting Image in PDF
				Image image = Image.getInstance("D:/Nikhil/" + baseurl + "/WebContent/resources/images/logo.png");
				image.setAlignment(Element.ALIGN_RIGHT);
				image.scaleAbsolute(120f, 40f);// image width,height

				// Inserting Table in PDF
				PdfPTable table = new PdfPTable(2);
				Font boldFont = new Font(Font.FontFamily.HELVETICA, 15, Font.BOLD);
				PdfPCell cell =  new PdfPCell(new Phrase("Insurance Claim details for " + full_name, boldFont));

				cell.setColspan(2);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setPadding(10.0f);
				cell.setBackgroundColor(new BaseColor(240, 128, 128));

				table.addCell(cell);

				table.addCell("User ID");
				table.addCell(user_id);
				table.addCell("Full Name");
				table.addCell(full_name);
				table.addCell("Insurance Type");
				table.addCell(insurance_type);
				
				table.addCell("Claim Request Date");
				Date rd = sdf.parse(request_date);                      
					table.addCell(sdf2.format(rd));
				
				table.addCell("Claim Reason");
				table.addCell(claim_reason);
				
				table.addCell("Final Claim Amount");
				DecimalFormat formatter = new DecimalFormat("##,##,##0");
				table.addCell("Rs. " + String.valueOf(formatter.format(final_claim_amount)));
				
				table.addCell("Final Approval Date");
				Date fad = sdf.parse(final_approval_date);				      
			      table.addCell(sdf2.format(fad));
				table.addCell("Amount Release Date");
				table.addCell(temp);
				
				if(claim_reason.equalsIgnoreCase("Death"))
				{
					ps2 = con.prepareStatement(generatepdf2);
		        	ps2.setString(1, id);
		        	String death_date = null, death_reason = null, nominee_1 = null,nominee_2 = null,nominee_3 = null;
		        	rs2 = ps2.executeQuery();
		        	while(rs2.next())
		        	{
		        		death_date = rs2.getString("death_date");
		        		death_reason = rs2.getString("death_reason");
		        		nominee_1 = rs2.getString("nominee_1");
		        		nominee_2 = rs2.getString("nominee_2");
		        		nominee_3 = rs2.getString("nominee_3");
		        		
		        	}		        	
		        	table.addCell("Death Date");
		        	System.out.println(death_date);
		        	/*Date dd = sdf.parse(death_date);*/
		        	/*table.addCell(sdf2.format(dd));*/
		        	table.addCell(death_date);
				      table.addCell("Death Reason");
				      table.addCell(death_reason);
				      table.addCell("Nominee 1");
				      table.addCell(nominee_1);
				      
				      if(nominee_2 != null)
				      {
				    	  table.addCell("Nominee 2");
					      table.addCell(nominee_2);						    	  
				      }						      
				      if(nominee_3 != null)
				      {
				    	  table.addCell("Nominee 3");
					      table.addCell(nominee_3);						    	  
				      }		        	
				}

				table.setSpacingBefore(30.0f);
				table.setSpacingAfter(30.0f);

				// Text formating in PDF
				// Chunk chunk=new Chunk("This is an automated generated receipt
				// for your kind reference. Thank you for using Claims
				// Management System.");

				document.open();// PDF document opened........

				document.add(image);

				document.add(Chunk.NEWLINE);
				document.add(Chunk.NEWLINE);

				document.add(new Paragraph("Dear Admin,"));

				document.add(table);

				// document.add(chunk);
				document.close();

				file.close();

			}
					
			return true;
		}

		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	

}
