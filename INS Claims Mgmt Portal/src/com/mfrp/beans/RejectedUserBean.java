package com.mfrp.beans;
 
public class RejectedUserBean {
       String user_firstname, user_lastname, insurance_type, request_date, claim_reason, user_id,reject_reason;
       long max_claim_amount, final_claim_amount;
       int nominee_count;
       int claim_index;      
 
       public String getUser_id() {
              return user_id;
       }
 
       public void setUser_id(String user_id) {
              this.user_id = user_id;
       }
 
       public void setMax_claim_amount(long max_claim_amount) {
              this.max_claim_amount = max_claim_amount;
       }
 
       public String getReject_reason() {
		return reject_reason;
	}

	public void setReject_reason(String reject_reason) {
		this.reject_reason = reject_reason;
	}

	public int getNominee_count() {
		return nominee_count;
	}

	public long getFinal_claim_amount() {
              return final_claim_amount;
       }
 
       public void setFinal_claim_amount(long final_claim_amount) {
              this.final_claim_amount = final_claim_amount;
       }
 
       public long getMax_claim_amount() {
              return max_claim_amount;
       }
 
       
 
       public String getUser_firstname() {
              return user_firstname;
       }
 
       public String getUser_lastname() {
              return user_lastname;
       }
 
       public String getInsurance_type() {
              return insurance_type;
       }
 
       public String getRequest_date() {
              return request_date;
       }
 
       public String getClaim_reason() {
              return claim_reason;
       }
 
       public void setUser_firstname(String user_firstname) {
              this.user_firstname = user_firstname;
       }
 
       public void setUser_lastname(String user_lastname) {
              this.user_lastname = user_lastname;
       }
 
       public void setInsurance_type(String Insurance_type) {
              this.insurance_type = Insurance_type;
       }
 
       public void setRequest_date(String request_date) {
              this.request_date = request_date;
       }
 
       public void setClaim_reason(String claim_reason) {
              this.claim_reason = claim_reason;
       }
 
       public void setNominee_count(int user_nominee_count) {
              this.nominee_count = user_nominee_count;
       }
 
       public void setClaim_index(int claim_index) {
              this.claim_index = claim_index;
       }
 
       public int getUser_nominee_count() {
              return nominee_count;
       }
 
       public int getClaim_index() {
              return claim_index;
       }
 
}