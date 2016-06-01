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
import com.mfrp.beans.RejectedUserBean;
import com.mfrp.beans.UserClaimsBean;
import com.mfrp.beans.UserDeathBean;
import com.mfrp.beans.UserDetailsBean;
import com.mfrp.beans.UserLoginBean;
import com.mfrp.dao.DAO;
import com.mfrp.dao.DBQueries;
/*import com.mfrp.servlets.UserNewClaimRequest;*/
import com.mfrp.servlets.FileUploadHandler;
import com.mfrp.servlets.UserClaimStatus;
/*import com.mfrp.servlets.UserDetails;*/
import com.mfrp.servlets.UserLoginValidate;
/*import com.mfrp.servlets.UserProfileUpdateToDB;
import com.mfrp.servlets.UserUpdateProfile;*/
import com.mfrp.servlets.UserRegistration;

public class UserBO implements DBQueries {
	public static int count = 1;
	static final Logger LOGGER = Logger.getLogger(UserBO.class);	
	
	
	public boolean registerUser(UserDetailsBean ub) {
		/*long startTime = System.currentTimeMillis();*/
		PreparedStatement ps2 = null;		
		PreparedStatement ps = null;
		Connection connection = null;		
		try {
			connection = UserRegistration.dataSource.getConnection();
			ps = connection.prepareStatement(userregister);			
			ps.setString(1, ub.getUser_id());
			ps.setString(2, ub.getUser_first_name());
			ps.setString(3, ub.getUser_last_name());
			ps.setString(4, ub.getUser_gender());
			ps.setString(5, ub.getUser_dob());
			ps.setString(6, ub.getUser_address());
			ps.setString(7, ub.getUser_contact_no());
			ps.setString(8, ub.getUser_email());
			ps.setInt(9, ub.getUser_nominee_count());
			ps.setString(10, ub.getUser_insurance_type());
			ps.setFloat(11, ub.getUser_insured_amount());
			ps.setDouble(12, ub.getUser_max_claimable_amount());
			ps.setString(13, ub.getUser_password());
			ps.setString(14, ub.getStatus());
			ps.setDouble(15,ub.getUser_max_claim_amount());
			
			/*long endTime   = System.currentTimeMillis();
			System.out.println("Time for one reg - " + (endTime - startTime));
			long startTime2 = System.currentTimeMillis();*/
			ps2 = connection.prepareStatement(userregister2);
			ps2.setString(1, ub.getUser_first_name());
			ps2.setString(2, ub.getUser_last_name());
			ps2.setString(3, ub.getUser_gender());
			ps2.setString(4, ub.getUser_dob());
			ps2.setString(5, ub.getUser_address());
			ps2.setString(6, ub.getUser_contact_no());
			ps2.setString(7, ub.getUser_email());
			ps2.setInt(8, ub.getUser_nominee_count());
			ps2.setString(9, ub.getUser_insurance_type());
			ps2.setFloat(10, ub.getUser_insured_amount());
			ps2.setDouble(11, ub.getUser_max_claimable_amount());
			
			int suc = ps.executeUpdate();
			int suc2 = ps2.executeUpdate();			
			/*long endTime2   = System.currentTimeMillis();
			
			System.out.println("Time for one + second reg - " + (endTime2 - startTime));
			System.out.println("second reg - " + (endTime2 - startTime2));*/
			
			if (suc > 0 && suc2 > 0) {
				UserRegistration.connection.close();
				return true;
			} else {
				UserRegistration.connection.close();
				return false;
			}
		} catch (SQLException e) {
			LOGGER.error("SQLException in UserBo.registerUser " + e);
			DAO.closeConnection();
			return false;
		}
		finally {
				try {
					if(ps!=null)
						ps.close();
					if(ps2!=null)
					ps2.close();
					if (connection != null)
						connection.close();								
			} catch (SQLException e) {
				LOGGER.error(e);
			}
		}
	}
	

	public int userLogin(UserLoginBean userb) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection connection = null;
		try {
			connection = UserLoginValidate.dataSource.getConnection();
			ps = connection.prepareStatement(user_login_verification);
			ps.setString(1, userb.getMember_username());
			ps.setString(2, userb.getMember_password());
			// ps.setString(3, udb.getStatus());
			rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString("status") == null) {					
					return 3;
				}
				else if(rs.getString("status").equalsIgnoreCase("no"))
				{					
					
					return 4;
				}
				
				return 1;

			} else {
				
				return 2;
			}
		} catch (SQLException e) {			
			LOGGER.error("SQLException in UserBO : " + e);
			return 0;
		}
		finally {
			try {
				if(ps != null)
					ps.close();	
				if(rs != null)
					rs.close();
				if (connection != null)
					connection.close();								
		} catch (SQLException e) {
			LOGGER.error(e);
		}
	}

	}
	
	public boolean UserUpdateProfile(UserDetailsBean ub) {

		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(userupdateprofile);			
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
			ps.setInt(11, ub.getUser_insured_amount());
			ps.setDouble(12, ub.getUser_max_claimable_amount());
			/*ps.setString(13, ub.getUser_password());*/
			ps.setString(13, ub.getUser_id());
			int suc = ps.executeUpdate();			
			DAO.closeConnection();
			if (suc > 0) {
				DAO.closeConnection();
				return true;
			} else {
				DAO.closeConnection();
				return false;
			}
		} catch (SQLException e) {
			System.err.println("SQL Exception in UserBo.userupdateprofile : " + e);
			DAO.closeConnection();
			return false;
		}
	}
		
/*	public boolean UserUpdateProfile(UserDetailsBean ub) {		
		PreparedStatement ps=null;
		Connection connection = null;
		try {
			connection = UserProfileUpdateToDB.dataSource.getConnection();
			ps = connection.prepareStatement(userupdateprofile);			
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
			ps.setInt(11, ub.getUser_insured_amount());
			ps.setDouble(12, ub.getUser_max_claimable_amount());			
			ps.setString(13, ub.getUser_id());			
			int suc = ps.executeUpdate();			
			
			if (suc > 0) {				
				return true;
			} else {				
				return false;
			}
		} catch (SQLException e) {
			System.err.println("SQL Exception in UserBo.userupdateprofile : " + e);			
			return false;
		}
		finally {
			try {
				if(ps!=null)
					ps.close();	
				if (connection != null)
					connection.close();								
		} catch (SQLException e) {
			System.err.println("SQLException in UserBO.UserUpdateProfile : " + e);
			LOGGER.error(e);
		}
	}
		
	}*/

	
	
	
/*public Map<String, UserDetailsBean> getUserDetailsForUpdate(String temp) {
	ResultSet rs = null;
	PreparedStatement ps=null;
	Connection connection = null;
		Map<String, UserDetailsBean> mymap = new HashMap<String, UserDetailsBean>();		
		try {
			connection = UserUpdateProfile.dataSource.getConnection();
			ps = connection.prepareStatement(getuserdetails);					
			ps.setString(1, temp);
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
				ub.setUser_max_claim_amount(rs.getLong("max_claim_amount"));
				ub.setUser_insurance_type(rs.getString("insurance_type"));
				ub.setUser_insured_amount(rs.getInt("insured_amount"));
				ub.setUser_max_claimable_amount(rs.getLong("max_claimable_amount"));				
				mymap.put(ub.getUser_id(), ub);

			}
		} catch (SQLException e) {
			System.err.println("SQLException1 in UserBO.getUserDetails : " + e);
			LOGGER.error(e);
		}
		finally {
			try {
				if(ps!=null)
					ps.close();	
				if(rs!=null)
					rs.close();
				if (connection != null)
					connection.close();								
		} catch (SQLException e) {
			System.err.println("SQLException2 in UserBO.UserUpdateProfile : " + e);
			LOGGER.error(e);
		}
	}
		return mymap;
	}*/
	
	

public Map<String, UserDetailsBean> getUserDetails(String temp) {
	
	Map<String, UserDetailsBean> mymap = new HashMap<String, UserDetailsBean>();
	Connection con = DAO.getConnection();
	try {			
		
		PreparedStatement ps = con.prepareStatement(getuserdetails);					
		ps.setString(1, temp);
		ResultSet rs = ps.executeQuery();
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
			ub.setUser_max_claim_amount(rs.getLong("max_claim_amount"));
			ub.setUser_insurance_type(rs.getString("insurance_type"));
			ub.setUser_insured_amount(rs.getInt("insured_amount"));
			ub.setUser_max_claimable_amount(rs.getLong("max_claimable_amount"));				
			mymap.put(ub.getUser_id(), ub);

		}
	} catch (SQLException e) {
		System.err.println("SQLException in AdminBo.getAllUsers : " + e);
		e.printStackTrace();
	}
	return mymap;
}

	public Map<Integer, UserClaimsBean> userClaimStatus(String temp) {		
		ResultSet rs = null;
		PreparedStatement ps=null;
		Connection connection = null;
		Map<Integer, UserClaimsBean> mymap = new HashMap<Integer, UserClaimsBean>();
	
		try {
			connection = UserClaimStatus.dataSource.getConnection();
			ps = connection.prepareStatement(userclaimdetails);
			ps.setString(1, temp);
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
				ub.setFinal_approval_date(rs.getString("final_approval_date"));
				ub.setUser_upload_flag(rs.getInt("user_upload_flag"));	
				ub.setReject_reason(rs.getString("reject_reason"));
				/*mymap.put(ub.getUser_id(), ub);*/
				mymap.put(ub.getClaim_index(), ub);				
			}
			
		} catch (SQLException e) {
			System.err.println("SQLException in UserBo.userClaimStatus : " + e);
			LOGGER.error(e);
		}
		
		finally {
			try {
				if(ps!=null)
					ps.close();	
				if(rs!=null)
					rs.close();
				if (connection != null)
					connection.close();								
		} catch (SQLException e) {
			System.err.println("SQLException in UserBO.userClaimStatus : " + e);
			LOGGER.error(e);
		}
	}
		
		return mymap;
	}
	
	public Map<Integer, RejectedUserBean> userRejectedClaimStatus(String temp) {
		
		ResultSet rs = null;
		PreparedStatement ps=null;
		Connection connection = null;
		Map<Integer, RejectedUserBean> mymap = new HashMap<Integer, RejectedUserBean>();		
		try {
			connection = UserClaimStatus.dataSource.getConnection();
			ps = connection.prepareStatement(userrejectedclaimdetails);
			ps.setString(1, temp);
			rs = ps.executeQuery();			
			while (rs.next()) {				
				RejectedUserBean ub = new RejectedUserBean();
				ub.setUser_id(rs.getString("user_id"));				
				ub.setRequest_date(rs.getString("request_date"));
				ub.setClaim_reason(rs.getString("claim_reason"));
				ub.setInsurance_type(rs.getString("insurance_type"));
				ub.setNominee_count(rs.getInt("nominee_count"));
				ub.setMax_claim_amount(rs.getLong("max_claim_amount"));
				ub.setFinal_claim_amount(rs.getLong("final_claim_amount"));
				ub.setReject_reason(rs.getString("reject_reason"));
				ub.setClaim_index(rs.getInt("claim_index"));
				/*System.out.println(rs.getString("claim_reason"));*/
				/*mymap.put(ub.getUser_id(), ub);*/
				mymap.put(ub.getClaim_index(), ub);				
			}
		} catch (SQLException e) {
			System.err.println("SQLException in UserBo.userRejectedClaimStatus : " + e);
			e.printStackTrace();
		}
		
		finally {
			try {
				if(ps!=null)
					ps.close();	
				if(rs!=null)
					rs.close();
				if (connection != null)
						connection.close();								
		} catch (SQLException e) {
			System.err.println("SQLException in UserBO.userRejectedClaimStatus : " + e);
			LOGGER.error(e);
		}
	}
		return mymap;
	}
	
	public Map<String, UserDeathBean> userDeathClaimStatus(String temp) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection connection = null;
		Map<String, UserDeathBean> deathmap = new HashMap<String, UserDeathBean>();		
		try {
			connection = UserClaimStatus.dataSource.getConnection();
			ps = connection.prepareStatement(getdeathdetails);
			ps.setString(1, temp);
			rs = ps.executeQuery();
			while (rs.next()) {
				
				UserDeathBean udb = new UserDeathBean();
				udb.setUser_id(rs.getString("user_id"));
				udb.setDeath_date(rs.getString("death_date"));
				udb.setDeath_reason(rs.getString("death_reason"));
				udb.setNominee_1(rs.getString("nominee_1"));
				udb.setNominee_2(rs.getString("nominee_2"));
				udb.setNominee_3(rs.getString("nominee_3"));				
				deathmap.put(udb.getUser_id(), udb);
			}
		} catch (SQLException e) {
			System.err.println("SQLException in USERBO.getDeathClaims : " + e);
			e.printStackTrace();
		}
		finally {
			try {
				if(ps!=null)
					ps.close();	
				if(rs!=null)
					rs.close();
				if (connection != null)
					connection.close();								
		} catch (SQLException e) {
			System.err.println("SQLException in UserBO.userDeathClaimStatus : " + e);
			LOGGER.error(e);
		}
	}
		return deathmap;
	}


	/*public boolean checkUser(UserDetailsBean ub) {
		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(usercheck);
			ps.setString(1, ub.getUser_email());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				return false;
			} else {
				return true;
			}

		} catch (SQLException e) {
			System.err.println("SQL Exception in UserBo.checkUser : " + e);
			DAO.closeConnection();
			return false;
		}
	}*/
	
	public boolean UserNewClaimRequest(UserClaimsBean ucb, UserDeathBean udb) {

		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(userclaimrequest);
			ps.setString(1, ucb.getUser_id());
			ps.setString(2, ucb.getUser_first_name());
			ps.setString(3, ucb.getUser_last_name());
			ps.setInt(4, ucb.getUser_nominee_count());
			ps.setDouble(5, ucb.getUser_max_claim_amount());
			ps.setString(6, ucb.getUser_insurance_type());
			ps.setString(7, ucb.getRequest_date());
			ps.setString(8, ucb.getClaim_reason());
			ps.setDouble(9, ucb.getFinal_claim_amount());
			
			int suc = ps.executeUpdate();			
			int suc2 = 0;
			
			if(ucb.getClaim_reason().equals("Death") && ucb.getUser_nominee_count() == 3)
			{			
					PreparedStatement ps2 = con.prepareStatement(deathclaim_3);
					ps2.setString(1,udb.getUser_id());
					ps2.setString(2, udb.getDeath_date());
					ps2.setString(3, udb.getDeath_reason());
					ps2.setString(4, udb.getNominee_1());
					ps2.setString(5,udb.getNominee_2());
					ps2.setString(6,udb.getNominee_3());
					suc2 = ps2.executeUpdate();
			}
			
			else if(ucb.getClaim_reason().equals("Death") && ucb.getUser_nominee_count() == 2)
			{				
				PreparedStatement ps2 = con.prepareStatement(deathclaim_2);
				ps2.setString(1,udb.getUser_id());
				ps2.setString(2, udb.getDeath_date());
				ps2.setString(3, udb.getDeath_reason());
				ps2.setString(4, udb.getNominee_1());
				ps2.setString(5,udb.getNominee_2());
				suc2 = ps2.executeUpdate();
			}
			
			else if(ucb.getClaim_reason().equals("Death") && ucb.getUser_nominee_count() == 1)
			{
				System.out.println("user bo nominee 1");
				PreparedStatement ps2 = con.prepareStatement(deathclaim_1);
				ps2.setString(1,udb.getUser_id());
				ps2.setString(2, udb.getDeath_date());
				ps2.setString(3, udb.getDeath_reason());
				ps2.setString(4, udb.getNominee_1());				
				suc2 = ps2.executeUpdate();
				System.out.println(suc2);
			}
			
			
			DAO.closeConnection();
			if (suc > 0) {
				DAO.closeConnection();
				return true;
			} else {
				DAO.closeConnection();
				return false;
			}
		} catch (SQLException e) {
			System.err.println("SQL Exception in UserBo.UserNewClaimRequest : " + e);
			DAO.closeConnection();
			return false;
		}
	}

	public boolean checkClaim(UserClaimsBean ubo) {		
		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(userclaimcheck);
			ps.setString(1, ubo.getUser_id());
			ps.setString(2, ubo.getClaim_reason());
			/*ps.setString(3, ubo.getStatus());*/
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				DAO.closeConnection();
				return false;
			} else {
				DAO.closeConnection();
				return true;
			}

		} catch (SQLException e) {
			System.err.println("SQL Exception in UserBo.checkClaim : " + e);
			DAO.closeConnection();
			return false;
		}
		
	}

	public boolean fileUpload(UserClaimsBean ucb) {		
		
		PreparedStatement ps = null;
		Connection connection = null;
		try {
			connection = FileUploadHandler.dataSource.getConnection();
			ps = connection.prepareStatement(userfileupload);
			ps.setString(1, ucb.getClaim_documents());
			ps.setInt(2, ucb.getUser_upload_flag());
			ps.setInt(3, ucb.getClaim_index());
			
			int suc = ps.executeUpdate();
			if(suc>0){
				connection.close();
				return true;
			} else {
				connection.close();
				return false;
			}

		} catch (SQLException e) {
			System.err.println("SQL Exception in UserBo.fileUpload : " + e);
			LOGGER.error(e);
			return false;
		}
		
		finally {
			try {
				if(ps!=null)
					ps.close();				
				if (connection != null)
					connection.close();								
			} catch (SQLException e) {
			System.err.println("SQLException in UserBO.fileUpload : " + e);
			LOGGER.error(e);
		  }
		}
	}
	
	
	public static String memberIdGenerator() throws SQLException {
		StringBuffer ch = new StringBuffer("MBC-");
		DecimalFormat df = new DecimalFormat("00000");		
		PreparedStatement ps = DAO.getConnection().prepareStatement(maxuseridindex);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int val = rs.getInt(1);
		ch.append(df.format(val+1));
		return ch.toString();
	}
	
public boolean generateReport(String id, String baseurl){
		
        try {
        	Connection con = DAO.getConnection();        
        	PreparedStatement ps = con.prepareStatement(generatepdf);
        	ps.setString(1, id);        	
        	ResultSet rs = ps.executeQuery();        	
        	
        	/*PreparedStatement ps1 = con.prepareStatement(getdeathclaimsforapproved2);
        	ps1.setString(1, id);        	
        	ResultSet rs2 = ps1.executeQuery();*/
        	while (rs.next()) { 
        		
        		String user_id = rs.getString("user_id");        		
				String full_name = rs.getString("user_firstname") + " " + rs.getString("user_lastname");				
				/*int nominee_count = rs.getInt("nominee_count");
				long max_claim_amount = rs.getLong("max_claim_amount");*/
				String insurance_type = rs.getString("insurance_type");
				String request_date = rs.getString("request_date");				
				String claim_reason = rs.getString("claim_reason");				
				int final_claim_amount = rs.getInt("final_claim_amount");
				String final_approval_date = rs.getString("final_approval_date");				
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				 Calendar now = Calendar.getInstance();
				 Date parsedDate = sdf.parse(final_approval_date);
		 		 now.setTime(parsedDate); 
		 		 now.add(Calendar.DAY_OF_MONTH, 10);
		 		 SimpleDateFormat sdf2 = new SimpleDateFormat("d MMMM, yyyy");
		 		 String temp=sdf2.format(now.getTime());
				
				String path = baseurl + "/WebContent/resources/" + user_id.toUpperCase() + "/" +  request_date + "-" + claim_reason + "/" + user_id.toUpperCase() + ".pdf";
              OutputStream file = new FileOutputStream(new File("D:/Nikhil/" + path));
             
	          Document document = new Document();
	          PdfWriter.getInstance(document, file);
			//Inserting Image in PDF
	          Image image = Image.getInstance ("D:/Nikhil/" + baseurl + "/WebContent/resources/images/logo.png");			  
	          image.setAlignment(Element.ALIGN_RIGHT);
			     image.scaleAbsolute(120f, 40f);//image width,height	

			//Inserting Table in PDF
			     PdfPTable table=new PdfPTable(2);
			     Font boldFont = new Font(Font.FontFamily.HELVETICA, 15, Font.BOLD);
	                   /*PdfPCell cell = new PdfPCell (new Paragraph ("YOUR CLAIM DETAILS") );*/			   
			     PdfPCell cell =  new PdfPCell(new Phrase("YOUR CLAIM DETAILS", boldFont));
			    
			     
				      cell.setColspan (2);
				      cell.setHorizontalAlignment (Element.ALIGN_CENTER);
				      cell.setPadding (10.0f);
				      cell.setBackgroundColor (new BaseColor (140, 221, 8));					               

				      table.addCell(cell);						               

				      table.addCell("User ID");
				      table.addCell(user_id);
				      table.addCell("Full Name");
				      table.addCell(full_name);
				      table.addCell("Insurance Type");
				      table.addCell(insurance_type);
				      
                      table.addCell("Claim Reason");
                      table.addCell(claim_reason);
                      
                      table.addCell("Claim Request Date");
                      
                      Date rd = sdf.parse(request_date);                      
      					table.addCell(sdf2.format(rd));
      				
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
							PreparedStatement ps2 = con.prepareStatement(generatepdf2);
				        	ps2.setString(1, id);
				        	String death_date = null, death_reason = null, nominee_1 = null,nominee_2 = null,nominee_3 = null;
				        	ResultSet rs2 = ps2.executeQuery();
				        	while(rs2.next())
				        	{
				        		death_date = rs2.getString("death_date");
				        		death_reason = rs2.getString("death_reason");
				        		nominee_1 = rs2.getString("nominee_1");
				        		nominee_2 = rs2.getString("nominee_2");
				        		nominee_3 = rs2.getString("nominee_3");
				        		
				        	}				        	
				        	table.addCell("Death Date");
				        	/*Date dd = sdf.parse(death_date);*/				        	
						     /* table.addCell(sdf2.format(dd));*/
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
	

			 //Text formating in PDF
	                Chunk chunk=new Chunk("This is an automated generated receipt for your kind reference. Thank you for using Claims Management System.");
				    document.open();//PDF document opened........
		         	document.add(image);
					document.add(Chunk.NEWLINE); 					
					document.add(Chunk.NEWLINE);					
					document.add(new Paragraph("Dear " + full_name + ","));	                
					document.add(table);
					document.add(chunk);
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



