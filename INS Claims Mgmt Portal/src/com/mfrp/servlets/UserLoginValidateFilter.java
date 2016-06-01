package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.mfrp.beans.UserLoginBean;
import com.mfrp.bo.UserBO;

@WebFilter("/UserLogin")
public class UserLoginValidateFilter implements Filter {
	static final Logger LOGGER = Logger.getLogger(UserLoginValidate.class);
	
	public UserLoginValidateFilter() {
		// TODO Auto-generated constructor stub
	}

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		UserLoginBean userb = new UserLoginBean();
		userb.setMember_username(req.getParameter("username"));
		userb.setMember_password(req.getParameter("userpassword"));
		UserBO userBO = new UserBO();
		int success = userBO.userLogin(userb);
		req.setAttribute("success", success);
		HttpSession session = req.getSession();
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		if (success == 1) {
			session.setAttribute("user_name", userb.getMember_username());
			session.setAttribute("isUserLoggedIn", true);
			LOGGER.info(session.getAttribute("user_name") + " has successfully logged in");
			// resp.sendRedirect(req.getContextPath() +
			// "/member-panel/user-dashboard.jsp");
			chain.doFilter(request, response);

		} else if (success == 3) {

			out.print(
					"<center><div class=\"alert alert-danger voffset2\" id=\"regonhold\"><h2>Registration on hold</h2></div></center>");
			req.getRequestDispatcher("/index.jsp").include(request, response);

		}

		else if (success == 2) {

			out.print(
					"<center><div class=\"alert alert-danger voffset2\"><h2>Invalid Login Credentials</h2></div></center>");
			req.getRequestDispatcher("/user_login.jsp").include(request, response);

		}

	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}