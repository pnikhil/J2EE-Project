package com.mfrp.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import com.mfrp.beans.AdminBean;
import com.mfrp.bo.AdminBO;
import com.mfrp.dao.DAO;

@WebServlet("/AdminLoginValidate")
public class AdminLoginValidate extends HttpServlet {
	static final Logger LOGGER = Logger.getLogger(AdminLoginValidate.class);
	private static final long serialVersionUID = 1L;
	
    public AdminLoginValidate() {
        super();
     
    }
    
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminBean adminb  = new AdminBean();
		adminb.setAdmin_name(request.getParameter("admin_username"));
		adminb.setAdmin_password(request.getParameter("admin_password"));		
		AdminBO adminBO = new AdminBO();
		boolean success =adminBO.adminLogin(adminb);
		HttpSession session = request.getSession();		
		if(success){			
			session.setAttribute("admin_name", "Administrator");
			session.setAttribute("isUserLoggedIn",true);
			//request.setAttribute("user_details", adminBO.getPendingUsers());
			//RequestDispatcher d = request.getRequestDispatcher("/admin-panel/admin_dashboard.jsp");
			//d.forward(request, response);
			LOGGER.info("Admin has logged in");
			/*DAO.closeConnection();*/
			response.sendRedirect(request.getContextPath() + "/admin-panel/admin_dashboard");
		}
		
		else {	
			LOGGER.info("Admin has entered invalid login credentials");
			response.setContentType("text/html");  
	        PrintWriter out=response.getWriter(); 
	        out.print("<center><div class=\"alert alert-danger voffset2\"><h2>Invalid Login Credentials</h2></div></center>");
	        DAO.closeConnection();
	        request.getRequestDispatcher("/admin_login.jsp").include(request, response);	        
		}
		
	}

}
