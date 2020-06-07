package com.mvc.kiview.model.vo;

public class ProvinceVo {
	private String province;
	private String city;
	private String town;
	
	public ProvinceVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProvinceVo(String province, String city) {
		super();
		this.province = province;
		this.city = city;
	}

	public ProvinceVo(String province, String city, String town) {
		super();
		this.province = province;
		this.city = city;
		this.town = town;
	}

	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	@Override
	public String toString() {
		return "ProvinceVo [province=" + province + ", city=" + city + ", town=" + town + "]";
	}
	
	

}
