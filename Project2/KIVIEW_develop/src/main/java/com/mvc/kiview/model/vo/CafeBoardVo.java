package com.mvc.kiview.model.vo;

import java.util.Date;

public class CafeBoardVo {

   private int cafe_board_no;
   private int cafe_menu_no;
   private String category;
   private String title;
   private String content;
   private String writer;
   private Date regdate;
   private int hit;
   private int replycount;
   
   
      
   
   public CafeBoardVo() {
      super();
      // TODO Auto-generated constructor stub
   }
   public CafeBoardVo(int cafe_board_no, int cafe_menu_no, String category, String title, String content,
         String writer, Date regdate, int hit, int replycount) {
      super();
      this.cafe_board_no = cafe_board_no;
      this.cafe_menu_no = cafe_menu_no;
      this.category = category;
      this.title = title;
      this.content = content;
      this.writer = writer;
      this.regdate = regdate;
      this.hit = hit;
      this.replycount = replycount;
   }
   public int getCafe_board_no() {
      return cafe_board_no;
   }
   public void setCafe_board_no(int cafe_board_no) {
      this.cafe_board_no = cafe_board_no;
   }
   public int getCafe_menu_no() {
      return cafe_menu_no;
   }
   public void setCafe_menu_no(int cafe_menu_no) {
      this.cafe_menu_no = cafe_menu_no;
   }
   public String getCategory() {
      return category;
   }
   public void setCategory(String category) {
      this.category = category;
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
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public Date getRegdate() {
      return regdate;
   }
   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }
   public int getHit() {
      return hit;
   }
   public void setHit(int hit) {
      this.hit = hit;
   }
   
// 리플 수 추가 함.   
   public int getReplycount() {
      return replycount;
   }
   public void setReplycount(int replycount) {
      this.replycount = replycount;
   }
   
   @Override
   public String toString() {
      return "CafeBoardVo [cafe_board_no=" + cafe_board_no + ", cafe_menu_no=" + cafe_menu_no + ", category="
            + category + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate=" + regdate
            + ", hit=" + hit + ", replycount=" +replycount +"]";
   }
   
   
}