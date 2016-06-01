package com.mfrp.beans;

public class UserDeathBean {
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getDeath_reason() {
		return death_reason;
	}

	public void setDeath_reason(String death_reason) {
		this.death_reason = death_reason;
	}

	public String getDeath_date() {
		return death_date;
	}

	public void setDeath_date(String death_date) {
		this.death_date = death_date;
	}

	public String getNominee_1() {
		return nominee_1;
	}

	public void setNominee_1(String nominee_1) {
		this.nominee_1 = nominee_1;
	}

	public String getNominee_2() {
		return nominee_2;
	}

	public void setNominee_2(String nominee_2) {
		this.nominee_2 = nominee_2;
	}

	public String getNominee_3() {
		return nominee_3;
	}

	public void setNominee_3(String nominee_3) {
		this.nominee_3 = nominee_3;
	}

	String user_id, death_reason, death_date, nominee_1, nominee_2, nominee_3;

}
