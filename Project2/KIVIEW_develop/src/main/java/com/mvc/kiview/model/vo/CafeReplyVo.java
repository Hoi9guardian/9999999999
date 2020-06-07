package com.mvc.kiview.model.vo;

import java.util.Date;

public class CafeReplyVo {
	private int cafe_reply;
	private int cafe_board_no;
	private String writer;
	private String content;
	private Date regdate;
	public int getCafe_reply() {
		return cafe_reply;
	}
	public void setCafe_reply(int cafe_reply) {
		this.cafe_reply = cafe_reply;
	}
	public int getCafe_board_no() {
		return cafe_board_no;
	}
	public void setCafe_board_no(int cafe_board_no) {
		this.cafe_board_no = cafe_board_no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "CafeReplyVo [cafe_reply=" + cafe_reply + ", cafe_board_no=" + cafe_board_no + ", writer=" + writer
				+ ", content=" + content + ", regdate=" + regdate + "]";
	}
	
	

}
