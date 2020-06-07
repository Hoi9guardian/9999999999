package com.team3.vo;

public class zzim {
	
	private String zzimcode;
	private String userid;
	private String lcode;
	private String lname;
	private String ccode1;
	private String ccode3;
	private String ccodeimg;
	
	public zzim() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public zzim(String zzimcode, String userid, String lcode, String lname, String ccode1, String ccode3) {
		super();
		this.zzimcode = zzimcode;
		this.userid = userid;
		this.lcode = lcode;
		this.lname = lname;
		this.ccode1 = ccode1;
		this.ccode3 = ccode3;
	}

	
	public zzim(String zzimcode, String userid, String lcode, String lname, String ccode1, String ccode3,
			String ccodeimg) {
		super();
		this.zzimcode = zzimcode;
		this.userid = userid;
		this.lcode = lcode;
		this.lname = lname;
		this.ccode1 = ccode1;
		this.ccode3 = ccode3;
		this.ccodeimg = ccodeimg;
	}




	public String getZzimcode() {
		return zzimcode;
	}

	public void setZzimcode(String zzimcode) {
		this.zzimcode = zzimcode;
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
	
	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getCcode1() {
		return ccode1;
	}

	public void setCcode1(String ccode1) {
		this.ccode1 = ccode1;
	}

	public String getCcode3() {
		return ccode3;
	}

	public void setCcode3(String ccode3) {
		this.ccode3 = ccode3;
	}
	
	

	public String getCcodeimg() {
		return ccodeimg;
	}


	public void setCcodeimg(String ccodeimg) {
		this.ccodeimg = ccodeimg;
	}


	@Override
	public String toString() {
		return "zzim [zzimcode=" + zzimcode + ", userid=" + userid + ", lcode=" + lcode + ", lname=" + lname
				+ ", ccode1=" + ccode1 + ", ccode3=" + ccode3 + ", ccodeimg=" + ccodeimg + "]";
	}


}
