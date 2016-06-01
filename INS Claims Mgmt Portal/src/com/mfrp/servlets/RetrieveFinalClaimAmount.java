package com.mfrp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RetrieveFinalClaimAmount")
public class RetrieveFinalClaimAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RetrieveFinalClaimAmount() {
        super();
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			
			long max_claim_amount = Long.parseLong(request.getParameter("max_claim_amount"));
			String insurance_type = String.valueOf(request.getParameter("insurance_type"));	
			String claim_reason = String.valueOf(request.getParameter("claim_reason"));
			
			long final_claim_amount = 0;
			
			if (insurance_type.equalsIgnoreCase("Home"))
			{
				if(claim_reason.equalsIgnoreCase("Renovate"))
				{
					final_claim_amount = (long) (0.50 * max_claim_amount);
				}
				else if(claim_reason.equalsIgnoreCase("Destroyed"))
				{
					final_claim_amount = (long) (0.70 * max_claim_amount);
				}
			}
			
			
			else if (insurance_type.equalsIgnoreCase("Vehicle"))
			{
				if(claim_reason.equalsIgnoreCase("Repair"))
				{
					final_claim_amount = (long) (0.40 * max_claim_amount);
				}
				else if(claim_reason.equalsIgnoreCase("Stolen"))
				{
					final_claim_amount = (long) (0.70 * max_claim_amount);
				}
			}
			
			else if (insurance_type.equalsIgnoreCase("Life"))
			{
				if(claim_reason.equalsIgnoreCase("Treatment"))
				{
					final_claim_amount = (long) (0.95 * max_claim_amount);
				}
				else if(claim_reason.equalsIgnoreCase("Death"))
				{
					final_claim_amount = (long) (max_claim_amount);
				}
			}
			
			out.print(final_claim_amount);
			

		} catch (Exception e) {
			System.err.println("Exception in getting data for final_claim_amount");
			e.printStackTrace();
		}
	}

}