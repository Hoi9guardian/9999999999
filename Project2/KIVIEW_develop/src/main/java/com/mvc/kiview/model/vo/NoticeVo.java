package com.mvc.kiview.model.vo;


public class NoticeVo {
	
	private int notice_no;
	private String cat_detail;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private String notice_date;
	private int notice_hit;
	
	public NoticeVo() {
		super();
	}
	
	
	public NoticeVo(int notice_no, String cat_detail, String notice_title, String notice_content, String notice_writer,
			String notice_date, int notice_hit) {
		super();
		this.notice_no = notice_no;
		this.cat_detail = cat_detail;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_writer = notice_writer;
		this.notice_date = notice_date;
		this.notice_hit = notice_hit;
	}


	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getCat_detail() {
		return cat_detail;
	}
	public void setCat_detail(String cat_detail) {
		this.cat_detail = cat_detail;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	
	@Override
	public String toString() {
		return "NoticeVo [notice_no=" + notice_no + ", cat_detail=" + cat_detail + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_writer=" + notice_writer + ", notice_date="
				+ notice_date + ", notice_hit=" + notice_hit + "]";
	}
	
	
	

}
