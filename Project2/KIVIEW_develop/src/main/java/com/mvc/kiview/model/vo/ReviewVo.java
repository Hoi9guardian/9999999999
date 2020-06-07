package com.mvc.kiview.model.vo;

import java.util.Date;

public class ReviewVo {
	private int review_no;
	private int kinder_no;
	private String kinder_name;
	private String kinder_addr;
	private int avg_score1;
	private int avg_score2;
	private int avg_score3;
	private String review_title;
	private String review_content;
	private String review_writer;
	private String review_year;
	private Date review_date;
	
	
	
	
	public ReviewVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewVo(int review_no, int kinder_no, String kinder_name, String kinder_addr, int avg_score1,
			int avg_score2, int avg_score3, String review_title, String review_content, String review_writer,
			String review_year, Date review_date) {
		super();
		this.review_no = review_no;
		this.kinder_no = kinder_no;
		this.kinder_name = kinder_name;
		this.kinder_addr = kinder_addr;
		this.avg_score1 = avg_score1;
		this.avg_score2 = avg_score2;
		this.avg_score3 = avg_score3;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_writer = review_writer;
		this.review_year = review_year;
		this.review_date = review_date;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getKinder_no() {
		return kinder_no;
	}
	public void setKinder_no(int kinder_no) {
		this.kinder_no = kinder_no;
	}
	public String getKinder_name() {
		return kinder_name;
	}
	public void setKinder_name(String kinder_name) {
		this.kinder_name = kinder_name;
	}
	public String getKinder_addr() {
		return kinder_addr;
	}
	public void setKinder_addr(String kinder_addr) {
		this.kinder_addr = kinder_addr;
	}
	public int getAvg_score1() {
		return avg_score1;
	}
	public void setAvg_score1(int avg_score1) {
		this.avg_score1 = avg_score1;
	}
	public int getAvg_score2() {
		return avg_score2;
	}
	public void setAvg_score2(int avg_score2) {
		this.avg_score2 = avg_score2;
	}
	public int getAvg_score3() {
		return avg_score3;
	}
	public void setAvg_score3(int avg_score3) {
		this.avg_score3 = avg_score3;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public String getReview_year() {
		return review_year;
	}
	public void setReview_year(String review_year) {
		this.review_year = review_year;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	@Override
	public String toString() {
		return "ReviewVo [review_no=" + review_no + ", kinder_no=" + kinder_no + ", kinder_name=" + kinder_name
				+ ", kinder_addr=" + kinder_addr + ", avg_score1=" + avg_score1 + ", avg_score2=" + avg_score2
				+ ", avg_score3=" + avg_score3 + ", review_title=" + review_title + ", review_content=" + review_content
				+ ", review_writer=" + review_writer + ", review_year=" + review_year + ", review_date=" + review_date
				+ "]";
	}
	
	
	

	
}