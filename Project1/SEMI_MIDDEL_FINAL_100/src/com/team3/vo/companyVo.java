package com.team3.vo;

public class companyVo {
	
	private int dcode;
	private String keyword;
	private String dname;
	private String industry;
	private String divide;
	private String homepage;
	private String logo;
	private String cname;
	private String cimg;

	public companyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public companyVo(int dcode, String keyword, String dname, String industry, String divide, String homepage,
			String logo, String cname, String cimg) {
		super();
		this.dcode = dcode;
		this.keyword = keyword;
		this.dname = dname;
		this.industry = industry;
		this.divide = divide;
		this.homepage = homepage;
		this.logo = logo;
		this.cname = cname;
		this.cimg = cimg;
	}


	public int getDcode() {
		return dcode;
	}

	public void setDcode(int dcode) {
		this.dcode = dcode;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getDivide() {
		return divide;
	}

	public void setDivide(String divide) {
		this.divide = divide;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	

	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public String getCimg() {
		return cimg;
	}


	public void setCimg(String cimg) {
		this.cimg = cimg;
	}


	@Override
	public String toString() {
		return "companyVo [dcode=" + dcode + ", keyword=" + keyword + ", dname=" + dname + ", industry=" + industry
				+ ", divide=" + divide + ", homepage=" + homepage + ", logo=" + logo + ", cname=" + cname + ", cimg="
				+ cimg + "]";
	}

		

}
