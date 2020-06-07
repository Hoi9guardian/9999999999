package com.team3.vo;

public class calendar {
	
	private String userid;
	private String lcode;
	private String lname;
	private String nth;
	private String w_period;
	private String w_test;
	private String w_pass;
	private String p_period;
	private String p_test;
	private String p_pass;
	
	public calendar() {
		super();
		// TODO Auto-generated constructor stub
	}




	public calendar(String userid, String lcode, String lname, String nth, String w_period, String w_test,
			String w_pass, String p_period, String p_test, String p_pass) {
		super();
		this.userid = userid;
		this.lcode = lcode;
		this.lname = lname;
		this.nth = nth;
		this.w_period = w_period;
		this.w_test = w_test;
		this.w_pass = w_pass;
		this.p_period = p_period;
		this.p_test = p_test;
		this.p_pass = p_pass;
	}
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getLcode() {
		return lcode;
	}

	public void setLcode(String lcode) {
		this.lcode = lcode;
	}

	public String getNth() {
		return nth;
	}

	public void setNth(String nth) {
		this.nth = nth;
	}

	public String getW_period() {
		return w_period;
	}

	public void setW_period(String w_period) {
		this.w_period = w_period;
	}

	public String getW_test() {
		return w_test;
	}

	public void setW_test(String w_test) {
		this.w_test = w_test;
	}

	public String getW_pass() {
		return w_pass;
	}

	public void setW_pass(String w_pass) {
		this.w_pass = w_pass;
	}

	public String getP_period() {
		return p_period;
	}

	public void setP_period(String p_period) {
		this.p_period = p_period;
	}

	public String getP_test() {
		return p_test;
	}

	public void setP_test(String p_test) {
		this.p_test = p_test;
	}

	public String getP_pass() {
		return p_pass;
	}

	public void setP_pass(String p_pass) {
		this.p_pass = p_pass;
	}
	
	

	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}




	@Override
	public String toString() {
		return "calendar [userid=" + userid + ", lcode=" + lcode + ", lname=" + lname + ", nth=" + nth + ", w_period="
				+ w_period + ", w_test=" + w_test + ", w_pass=" + w_pass + ", p_period=" + p_period + ", p_test="
				+ p_test + ", p_pass=" + p_pass + "]";
	}


}
