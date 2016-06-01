package com.mfrp.beans;

public class UserLoginBean extends UserDetailsBean{
	
	private String member_username,member_password;

	public String getMember_username() {
		return member_username;
	}

	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}	
	
}
