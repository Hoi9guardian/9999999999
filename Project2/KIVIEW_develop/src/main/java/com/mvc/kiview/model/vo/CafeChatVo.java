package com.mvc.kiview.model.vo;

import java.util.Date;

public class CafeChatVo {
	private int cafe_chat_no;
	private int cafe_no;
	private int member_no;
	private String writer; 
	private String msg;
	private Date senddate;
	
	CafeChatVo(){}
	
	
	
	
	public CafeChatVo(int cafe_chat_no, int cafe_no, int member_no, String writer, String msg, Date senddate) {
		super();
		this.cafe_chat_no = cafe_chat_no;
		this.cafe_no = cafe_no;
		this.member_no = member_no;
		this.writer = writer;
		this.msg = msg;
		this.senddate = senddate;
	}




	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	
	

	public int getCafe_chat_no() {
		return cafe_chat_no;
	}

	public void setCafe_chat_no(int cafe_chat_no) {
		this.cafe_chat_no = cafe_chat_no;
	}

	public int getCafe_no() {
		return cafe_no;
	}

	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	
	
	
	
}
