package com.team3.vo;

public class lsearch {
	
	private String lcode;
	private String lname;
	private String ccode1;
	private String ccode2;
	private String ccode3;
	private int conut;
	
	public lsearch() {
		super();
		// TODO Auto-generated constructor stub
	}

	public lsearch(String lcode, String lname, String ccode1, String ccode2, String ccode3, int conut) {
		super();
		this.lcode = lcode;
		this.lname = lname;
		this.ccode1 = ccode1;
		this.ccode2 = ccode2;
		this.ccode3 = ccode3;
		this.conut = conut;
	}
	
	public lsearch(String lcode, String lname, String ccode1, String ccode3) {
		super();
		this.lcode = lcode;
		this.lname = lname;
		this.ccode1 = ccode1;
		this.ccode3 = ccode3;
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

	public String getCcode2() {
		return ccode2;
	}

	public void setCcode2(String ccode2) {
		this.ccode2 = ccode2;
	}

	public String getCcode3() {
		return ccode3;
	}

	public void setCcode3(String ccode3) {
		this.ccode3 = ccode3;
	}

	public int getConut() {
		return conut;
	}

	public void setConut(int conut) {
		this.conut = conut;
	}

	@Override
	public String toString() {
		return "lsearch [lcode=" + lcode + ", lname=" + lname + ", ccode1=" + ccode1 + ", ccode2=" + ccode2
				+ ", ccode3=" + ccode3 + ", conut=" + conut + "]";
	}
	
	
}
