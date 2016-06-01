package com.mfrp.beans;

public class UserDetailsBean {	
	

	String user_first_name, user_insurance_type,user_password;	

	int user_nominee_count, user_insured_amount;

	long user_max_claimable_amount,user_max_claim_amount;	
	
	static String user_id;
	static String status;
	
	public String getUser_id() {
		return user_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		UserDetailsBean.status = status;
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
	
	public void setUser_id(String user_id) {
		UserDetailsBean.user_id = user_id;
	}
	public void setUser_last_name(String user_last_name) {
		this.user_last_name = user_last_name;
	}
	public String getUser_dob() {
		return user_dob;
	}
	public void setUser_dob(String user_dob) {
		this.user_dob = user_dob;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_contact_no() {
		return user_contact_no;
	}
	public void setUser_contact_no(String user_contact_no) {
		this.user_contact_no = user_contact_no;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public int getUser_nominee_count() {
		return user_nominee_count;
	}
	public void setUser_nominee_count(int user_nominee_count) {
		this.user_nominee_count = user_nominee_count;
	}
	public int getUser_insured_amount() {
		return user_insured_amount;
	}
	public void setUser_insured_amount(int user_insured_amount) {
		this.user_insured_amount = user_insured_amount;
	}
	public long getUser_max_claimable_amount() {
		return user_max_claimable_amount;
	}
	public void setUser_max_claimable_amount(long user_max_claimable_amount) {
		this.user_max_claimable_amount = user_max_claimable_amount;
	}
	public long getUser_max_claim_amount() {
		return user_max_claim_amount;
	}
	public void setUser_max_claim_amount(long user_max_claim_amount) {
		this.user_max_claim_amount = user_max_claim_amount;
	}
	public String getUser_insurance_type() {
		return user_insurance_type;
	}
	public void setUser_insurance_type(String user_insurance_type) {
		this.user_insurance_type = user_insurance_type;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	String user_last_name, user_dob, user_address, user_contact_no, user_email, user_gender;
	

}
