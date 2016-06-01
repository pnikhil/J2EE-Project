package com.mfrp.beans;


public class UserClaimsBean {

	String user_first_name, user_last_name, user_insurance_type, request_date, claim_reason, status, user_id;
	String final_approval_date;
	int user_nominee_count;
	int claim_index;
	int user_upload_flag;
	String reject_reason;
	
	public String getReject_reason() {
		return reject_reason;
	}

	public void setReject_reason(String reject_reason) {
		this.reject_reason = reject_reason;
	}

	public String getFinal_approval_date() {
		return final_approval_date;
	}

	public void setFinal_approval_date(String final_approval_date) {
		this.final_approval_date = final_approval_date;
	}

	String claim_documents;
	public int getUser_upload_flag() {
		return user_upload_flag;
	}

	public void setUser_upload_flag(int user_upload_flag) {
		this.user_upload_flag = user_upload_flag;
	}

	public String getClaim_documents() {
		return claim_documents;
	}

	public void setClaim_documents(String file_path) {
		this.claim_documents = file_path;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}	

	public int getClaim_index() {
		return claim_index;
	}

	public void setClaim_index(int claim_index) {
		this.claim_index = claim_index;
	}

	long user_max_claim_amount, final_claim_amount;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUser_first_name() {
		return user_first_name;
	}

	public void setUser_first_name(String user_first_name) {
		this.user_first_name = user_first_name;
	}

	public String getUser_last_name() {
		return user_last_name;
	}

	public void setUser_last_name(String user_last_name) {
		this.user_last_name = user_last_name;
	}

	public String getUser_insurance_type() {
		return user_insurance_type;
	}

	public void setUser_insurance_type(String user_insurance_type) {
		this.user_insurance_type = user_insurance_type;
	}

	public String getRequest_date() {
		return request_date;
	}

	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}

	public String getClaim_reason() {
		return claim_reason;
	}

	public void setClaim_reason(String claim_reason) {
		this.claim_reason = claim_reason;
	}

	public int getUser_nominee_count() {
		return user_nominee_count;
	}

	public void setUser_nominee_count(int user_nominee_count) {
		this.user_nominee_count = user_nominee_count;
	}

	public long getUser_max_claim_amount() {
		return user_max_claim_amount;
	}

	public void setUser_max_claim_amount(long user_max_claim_amount) {
		this.user_max_claim_amount = user_max_claim_amount;
	}

	public long getFinal_claim_amount() {
		return final_claim_amount;
	}

	public void setFinal_claim_amount(long final_claim_amount) {
		this.final_claim_amount = final_claim_amount;
	}

}
