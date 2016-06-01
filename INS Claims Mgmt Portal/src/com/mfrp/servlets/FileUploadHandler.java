package com.mfrp.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import com.mfrp.beans.UserClaimsBean;
import com.mfrp.bo.UserBO;

@WebServlet("/member-panel/FileUploadHandler")
public class FileUploadHandler extends HttpServlet {	
	
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(FileUploadHandler.class);
	public static Connection connection;
	public static DataSource dataSource; 
	String user_id = null, claim_date = null, claim_reason = null, appendfile;
	String root, file_path="";
	String claim_index;
	File path;
	
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

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * String user_id = request.getParameter("user_id"); String claim_date =
		 * request.getParameter("request_date"); String claim_reason =
		 * request.getParameter("claim_reason");
		 */
		/* System.out.println(user_id+"-"+claim_date+"-"+claim_reason); */
		HttpSession session = request.getSession();

		if (session.getAttribute("user_name") != null) {

			if (ServletFileUpload.isMultipartContent(request)) {
				try {
					List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

					for (FileItem item : multiparts) {
						if (item.isFormField()) {
							
							String fieldname = item.getFieldName();
							String fieldvalue = item.getString();
							if (fieldname.equals("user_id"))
								user_id = fieldvalue;
							if (fieldname.equals("claim_date"))
								claim_date = fieldvalue;
							if (fieldname.equals("claim_reason"))
								claim_reason = fieldvalue;
							if (fieldname.equals("claim_index"))
								claim_index = fieldvalue;
							appendfile = claim_date + "-" + claim_reason;							
							if (claim_reason != null) {
								root = "D:/Nikhil/MFRPGroup2/WebContent/resources";
								path = new File(root + "/" + session.getAttribute("user_name").toString().toUpperCase() + "/" + appendfile);
								if (!path.exists()) {
									path.mkdirs();
								}
							}
						} else {
							String name = new File(item.getName()).getName();
							item.write(new File(path + File.separator + name));
							file_path = file_path.concat(name);
							file_path = file_path.concat(",");
						}
						
					}
					
					UserClaimsBean ucb = new UserClaimsBean();
					UserBO ubo = new UserBO();
					ucb.setClaim_documents(file_path);
					ucb.setClaim_index(Integer.parseInt(claim_index));
					ucb.setUser_upload_flag(1);
					boolean success = ubo.fileUpload(ucb);
					if(success == true)
					{
						LOGGER.info("User with claim index " + claim_index + " has uploaded documents successfully");
						request.setAttribute("file_upload_success1", "File Uploaded Successfully");	
						file_path="";
					}
					else
					{
					LOGGER.info("User with claim index " + claim_index + " has failed uploading documents");
					request.setAttribute("file_upload_success1", "File Uploaded Failed");
					}
						
				} catch (Exception ex) {
					ex.printStackTrace();
					LOGGER.error(ex);
					request.setAttribute("file_upload_success2", "File Upload Failed due to " + ex);

				}

			} else {
				LOGGER.info("User with claim index " + claim_index + " - Servlet only handles file upload request");
				request.setAttribute("file_upload_success3", "Sorry this Servlet only handles file upload request");

			}

			request.getRequestDispatcher("/member-panel/UserClaimStatus").forward(request, response);

		}

	}

}