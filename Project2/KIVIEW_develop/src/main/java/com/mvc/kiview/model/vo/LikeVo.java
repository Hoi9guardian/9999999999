package com.mvc.kiview.model.vo;

public class LikeVo {
	
   private String like_no;
   private String review_no;
   private String member_no;
   
   public LikeVo() {
   super();
   // TODO Auto-generated constructor stub
   	}
   public String getLike_no() {
	   return like_no;
   }
   public void setLike_no(String like_no) {
	   this.like_no = like_no;
   }
   public String getReview_no() {
	   return review_no;
   }
   public void setReview_no(String review_no) {
	   this.review_no = review_no;
   }
   public String getMember_no() {
	   return member_no;
   }
   public void setMember_no(String member_no) {
	   this.member_no = member_no;
   }
   public LikeVo(String like_no, String review_no, String member_no) {
	   super();
	   this.like_no = like_no;
	   this.review_no = review_no;
	   this.member_no = member_no;
   }

}