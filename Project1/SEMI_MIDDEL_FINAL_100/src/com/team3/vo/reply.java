package com.team3.vo;

import java.util.Date;

public class reply {
   
   private int commentno;
   private int boardno;
   private String nickname;
   private Date regdate;
   private String comments;
   private int gradeCount;
   
   public reply() {
      super();
      // TODO Auto-generated constructor stub
   }
   

   public reply(int commentno, String comments) {
      super();
      this.commentno = commentno;
      this.comments = comments;
   }

   public reply(int boardno, String nickname, String comments) {
      super();
      this.boardno = boardno;
      this.nickname = nickname;
      this.comments = comments;
   }



   public reply(int commentno, int boardno, String nickname, Date regdate, String comments) {
      super();
      this.commentno = commentno;
      this.boardno = boardno;
      this.nickname = nickname;
      this.regdate = regdate;
      this.comments = comments;
   }
   
   

   public reply(int commentno, int boardno, String nickname, Date regdate, String comments, int gradeCount) {
	super();
	this.commentno = commentno;
	this.boardno = boardno;
	this.nickname = nickname;
	this.regdate = regdate;
	this.comments = comments;
	this.gradeCount = gradeCount;
}


public int getCommentno() {
      return commentno;
   }

   public void setCommentno(int commentno) {
      this.commentno = commentno;
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

   public Date getRegdate() {
      return regdate;
   }

   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }

   public String getComments() {
      return comments;
   }

   public void setComment(String comments) {
      this.comments = comments;
   }
   
   

   public int getGradeCount() {
	return gradeCount;
	}
	
	
	public void setGradeCount(int gradeCount) {
		this.gradeCount = gradeCount;
	}
	
	
	public void setComments(String comments) {
		this.comments = comments;
	}


	@Override
	public String toString() {
		return "reply [commentno=" + commentno + ", boardno=" + boardno + ", nickname=" + nickname + ", regdate="
				+ regdate + ", comments=" + comments + ", gradeCount=" + gradeCount + "]";
	}
  

}