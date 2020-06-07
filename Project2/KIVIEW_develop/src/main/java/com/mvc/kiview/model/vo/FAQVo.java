package com.mvc.kiview.model.vo;

public class FAQVo {
	
	private int faq_no;
	private String faq_catd;
	private String faq_title;
	private String faq_content;

	public FAQVo() {
		super();
	}
	
	public FAQVo(int faq_no, String faq_catd, String faq_title, String faq_content) {
		super();
		this.faq_no = faq_no;
		this.faq_catd = faq_catd;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getFaq_catd() {
		return faq_catd;
	}

	public void setFaq_catd(String faq_catd) {
		this.faq_catd = faq_catd;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	@Override
	public String toString() {
		return "FAQVo [faq_no=" + faq_no + ", faq_catd=" + faq_catd + ", faq_title=" + faq_title + ", faq_content="
				+ faq_content + "]";
	}

}
