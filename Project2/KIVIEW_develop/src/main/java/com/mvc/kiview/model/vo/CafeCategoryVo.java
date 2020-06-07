package com.mvc.kiview.model.vo;

public class CafeCategoryVo {
	private int cafe_category_no;
	private int cafe_menu_no;
	private String category;
	
	
	
	public CafeCategoryVo() {
		super();
		
	}
	public CafeCategoryVo(int cafe_category_no, int cafe_menu_no, String category) {
		super();
		this.cafe_category_no = cafe_category_no;
		this.cafe_menu_no = cafe_menu_no;
		this.category = category;
	}
	public int getCafe_category_no() {
		return cafe_category_no;
	}
	public void setCafe_category_no(int cafe_category_no) {
		this.cafe_category_no = cafe_category_no;
	}
	public int getCafe_menu_no() {
		return cafe_menu_no;
	}
	public void setCafe_menu_no(int cafe_menu_no) {
		this.cafe_menu_no = cafe_menu_no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "CafeCategoryVo [cafe_category_no=" + cafe_category_no + ", cafe_menu_no=" + cafe_menu_no + ", category="
				+ category + "]";
	}
	
	
	
	

}
