package com.team3.vo;

import java.util.Date;

public class board {
	
	private int boardno;
	private String nickname;
	private String headtag;
	private String title;
	private String content;
	private Date regdate;
	private String tabloc;
	private String notice;
	private int count;
	private int qnareplyyn;
	private int gradeCount;
	private int countComment;
	
	public board() {
		super();
		
	}

	public board(String nickname, String headtag, String title, String content, String tabloc) {
		super();
		this.nickname = nickname;
		this.headtag = headtag;
		this.title = title;
		this.content = content;
		this.tabloc = tabloc;
	}

	

	public board(int boardno, String headtag, String title, String content) {
		super();
		this.boardno = boardno;
		this.headtag = headtag;
		this.title = title;
		this.content = content;
	}
	
	
	
	public board(int boardno, String nickname, String headtag, String title, String content, Date regdate,
			String tabloc, String notice, int count) {
		super();
		this.boardno = boardno;
		this.nickname = nickname;
		this.headtag = headtag;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.tabloc = tabloc;
		this.notice = notice;
		this.count = count;
	}

	public board(int boardno, String nickname, String headtag, String title, String content, Date regdate,
			String tabloc, String notice, int count, int qnareplyyn, int gradeCount) {
		super();
		this.boardno = boardno;
		this.nickname = nickname;
		this.headtag = headtag;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.tabloc = tabloc;
		this.notice = notice;
		this.count = count;
		this.qnareplyyn = qnareplyyn;
		this.gradeCount = gradeCount;
	}

	public board(int boardno, String nickname, String headtag, String title, String content, Date regdate,
			String tabloc, String notice, int count, int qnareplyyn, int gradeCount, int countComment) {
		super();
		this.boardno = boardno;
		this.nickname = nickname;
		this.headtag = headtag;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.tabloc = tabloc;
		this.notice = notice;
		this.count = count;
		this.qnareplyyn = qnareplyyn;
		this.gradeCount = gradeCount;
		this.countComment = countComment;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getHeadtag() {
		return headtag;
	}

	public void setHeadtag(String headtag) {
		this.headtag = headtag;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getTabloc() {
		return tabloc;
	}

	public void setTabloc(String tabloc) {
		this.tabloc = tabloc;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	

	public int getQnareplyyn() {
		return qnareplyyn;
	}

	public void setQnareplyyn(int qnareplyyn) {
		this.qnareplyyn = qnareplyyn;
	}
	
	
	public int getGradeCount() {
		return gradeCount;
	}

	public void setGradeCount(int gradeCount) {
		this.gradeCount = gradeCount;
	}

	public int getCountComment() {
		return countComment;
	}

	public void setCountComment(int countComment) {
		this.countComment = countComment;
	}

	@Override
	public String toString() {
		return "board [boardno=" + boardno + ", nickname=" + nickname + ", headtag=" + headtag + ", title=" + title
				+ ", content=" + content + ", regdate=" + regdate + ", tabloc=" + tabloc + ", notice=" + notice
				+ ", count=" + count + ", qnareplyyn=" + qnareplyyn + ", gradeCount=" + gradeCount + ", countComment="
				+ countComment + "]";
	}

	

}
