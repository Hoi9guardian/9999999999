package com.mvc.kiview.model.vo;

import java.util.Date;

public class CafeMemberVo {
	private int cafe_member_no;
	private int member_no;
	private int cafe_no;
	private String name;
	private String answer;
	private String signyn;
	private String blockyn;
	private Date signdate;
	
	
	
	public CafeMemberVo(int member_no, String name,String answer, String signyn) {
		super();
		this.member_no = member_no;
		this.name = name;
		this.answer = answer;
		this.signyn = signyn;
		
		
	}
	public CafeMemberVo(int cafe_member_no, int member_no, int cafe_no, String name, String answer, String signyn,
			String blockyn, Date signdate) {
		super();
		this.cafe_member_no = cafe_member_no;
		this.member_no = member_no;
		this.cafe_no = cafe_no;
		this.name = name;
		this.answer = answer;
		this.signyn = signyn;
		this.blockyn = blockyn;
		this.signdate = signdate;
	}
	public CafeMemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCafe_member_no() {
		return cafe_member_no;
	}
	public void setCafe_member_no(int cafe_member_no) {
		this.cafe_member_no = cafe_member_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getCafe_no() {
		return cafe_no;
	}
	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getSignyn() {
		return signyn;
	}
	public void setSignyn(String signyn) {
		this.signyn = signyn;
	}
	public String getBlockyn() {
		return blockyn;
	}
	public void setBlockyn(String blockyn) {
		this.blockyn = blockyn;
	}
	public Date getSigndate() {
		return signdate;
	}
	public void setSigndate(Date signdate) {
		this.signdate = signdate;
	}
	@Override
	public String toString() {
		return "CafeMemberVo [cafe_member_no=" + cafe_member_no + ", member_no=" + member_no + ", cafe_no=" + cafe_no
				+ ", name=" + name + ", answer=" + answer + ", signyn=" + signyn + ", blockyn=" + blockyn
				+ ", signdate=" + signdate + "]";
	}
	
	
	
	

}
