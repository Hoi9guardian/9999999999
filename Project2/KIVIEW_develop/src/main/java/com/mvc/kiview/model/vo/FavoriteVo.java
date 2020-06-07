package com.mvc.kiview.model.vo;

public class FavoriteVo {

	private String favorite_no;
	private String kinder_no;
	private String member_no;
	

	public String getFavorite_no() {
		return favorite_no;
	}


	public void setFavorite_no(String favorite_no) {
		this.favorite_no = favorite_no;
	}


	public String getKinder_no() {
		return kinder_no;
	}


	public void setKinder_no(String kinder_no) {
		this.kinder_no = kinder_no;
	}


	public String getMember_no() {
		return member_no;
	}


	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}


	@Override
	public String toString() {
		return "FavoriteVo [favorite_no=" + favorite_no + ", kinder_no=" + kinder_no + ", member_no=" + member_no + "]";
	}
	
	

}

