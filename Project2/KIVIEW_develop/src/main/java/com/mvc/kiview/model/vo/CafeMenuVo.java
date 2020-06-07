package com.mvc.kiview.model.vo;

public class CafeMenuVo {
	private int cafe_menu_no;
	private int cafe_no;
	private String name;
	private String authority;
	private String concept;
	
	
	
	public CafeMenuVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CafeMenuVo(int cafe_menu_no, int cafe_no, String name, String authority, String concept) {
		super();
		this.cafe_menu_no = cafe_menu_no;
		this.cafe_no = cafe_no;
		this.name = name;
		this.authority = authority;
		this.concept = concept;
	}
	public int getCafe_menu_no() {
		return cafe_menu_no;
	}
	public void setCafe_menu_no(int cafe_menu_no) {
		this.cafe_menu_no = cafe_menu_no;
	}
	public int getCafe_no() {
		return cafe_no;
	}
	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getConcept() {
		return concept;
	}
	public void setConcept(String concept) {
		this.concept = concept;
	}
	@Override
	public String toString() {
		return "CafeMenuVo [cafe_menu_no=" + cafe_menu_no + ", cafe_no=" + cafe_no + ", name=" + name + ", authority="
				+ authority + ", concept=" + concept + "]";
	}
	
	

}
