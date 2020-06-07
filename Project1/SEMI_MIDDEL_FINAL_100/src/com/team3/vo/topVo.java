package com.team3.vo;

public class topVo {
	
	//field
	private String lcode;
	private String lname;
	private String ccode3;
	private int conut;
	private String cimg;
	private String cname;
	
	//생성자
	public topVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public topVo(String lname, int conut) {
		super();
		this.lname = lname;
		this.conut = conut;
	}



	//매개변수 생성자
	public topVo(String lcode, String lname, String ccode3, int conut, String cimg, String cname) {
		super();
		this.lcode = lcode;
		this.lname = lname;
		this.ccode3 = ccode3;
		this.conut = conut;
		this.cimg = cimg;
		this.cname = cname;
	}

	//getter setter
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

	public String getCimg() {
		return cimg;
	}

	public void setCimg(String cimg) {
		this.cimg = cimg;
	}
	
	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	//tostring
	@Override
	public String toString() {
		return "topVo [lcode=" + lcode + ", lname=" + lname + ", ccode3=" + ccode3 + ", conut=" + conut + ", cimg="
				+ cimg + ", cname=" + cname + "]";
	}


	
	}
	

