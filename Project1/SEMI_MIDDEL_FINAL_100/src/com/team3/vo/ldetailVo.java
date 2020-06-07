package com.team3.vo;

public class ldetailVo {
	
	//field
	private String lcode;
	private String lname;
	private String ccode3;
	private String cname;
	private int cnt;
	private String institute;
	private String urls;
	private String summary;
	private String jobs;
	private String outlook;
	private String chk_w;
	private String chk_p;
	private int price_w;
	private int price_p;
	private String subject_w;
	private String subject_p;
	private String pass;
	private String nth;
	private String w_period;
	private String w_test;
	private String w_pass;
	private String p_period;
	private String p_test;
	private String p_pass;
	
	//기본생성자
	public ldetailVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	//매개변수 생성자
	public ldetailVo(String lcode, String lname, String ccode3, String cname, int cnt, String institute, String urls,
			String summary, String jobs, String outlook, String chk_w, String chk_p, int price_w, int price_p,
			String subject_w, String subject_p, String pass, String nth, String w_period, String w_test, String w_pass,
			String p_period, String p_test, String p_pass) {
		super();
		this.lcode = lcode;
		this.lname = lname;
		this.ccode3 = ccode3;
		this.cname = cname;
		this.cnt = cnt;
		this.institute = institute;
		this.urls = urls;
		this.summary = summary;
		this.jobs = jobs;
		this.outlook = outlook;
		this.chk_w = chk_w;
		this.chk_p = chk_p;
		this.price_w = price_w;
		this.price_p = price_p;
		this.subject_w = subject_w;
		this.subject_p = subject_p;
		this.pass = pass;
		this.nth = nth;
		this.w_period = w_period;
		this.w_test = w_test;
		this.w_pass = w_pass;
		this.p_period = p_period;
		this.p_test = p_test;
		this.p_pass = p_pass;
	}

	//getter, setter
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

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getInstitute() {
		return institute;
	}

	public void setInstitute(String institute) {
		this.institute = institute;
	}

	public String getUrls() {
		return urls;
	}

	public void setUrls(String urls) {
		this.urls = urls;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getJobs() {
		return jobs;
	}

	public void setJobs(String jobs) {
		this.jobs = jobs;
	}

	public String getOutlook() {
		return outlook;
	}

	public void setOutlook(String outlook) {
		this.outlook = outlook;
	}

	public String getChk_w() {
		return chk_w;
	}

	public void setChk_w(String chk_w) {
		this.chk_w = chk_w;
	}

	public String getChk_p() {
		return chk_p;
	}

	public void setChk_p(String chk_p) {
		this.chk_p = chk_p;
	}

	public int getPrice_w() {
		return price_w;
	}

	public void setPrice_w(int price_w) {
		this.price_w = price_w;
	}

	public int getPrice_p() {
		return price_p;
	}

	public void setPrice_p(int price_p) {
		this.price_p = price_p;
	}

	public String getSubject_w() {
		return subject_w;
	}

	public void setSubject_w(String subject_w) {
		this.subject_w = subject_w;
	}

	public String getSubject_p() {
		return subject_p;
	}

	public void setSubject_p(String subject_p) {
		this.subject_p = subject_p;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
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

	//tostring
	@Override
	public String toString() {
		return "ldetailVo [lcode=" + lcode + ", lname=" + lname + ", ccode3=" + ccode3 + ", cname=" + cname + ", cnt="
				+ cnt + ", institute=" + institute + ", urls=" + urls + ", summary=" + summary + ", jobs=" + jobs
				+ ", outlook=" + outlook + ", chk_w=" + chk_w + ", chk_p=" + chk_p + ", price_w=" + price_w
				+ ", price_p=" + price_p + ", subject_w=" + subject_w + ", subject_p=" + subject_p + ", pass=" + pass
				+ ", nth=" + nth + ", w_period=" + w_period + ", w_test=" + w_test + ", w_pass=" + w_pass
				+ ", p_period=" + p_period + ", p_test=" + p_test + ", p_pass=" + p_pass + "]";
	}

}
