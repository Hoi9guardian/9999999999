package com.mvc.kiview.model.vo;

public class MemberVo {
	private int member_no;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_addr;
	private String member_phone;
	private String member_email;
	
	public MemberVo() { }

	public MemberVo(int member_no, String member_id, String member_pwd, String member_name, String member_addr,
			String member_phone, String member_email) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_addr = member_addr;
		this.member_phone = member_phone;
		this.member_email = member_email;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	@Override
	public String toString() {
		return "MemberVo [member_no=" + member_no + ", member_id=" + member_id + ", member_pwd=" + member_pwd
				+ ", member_name=" + member_name + ", member_addr=" + member_addr + ", member_phone=" + member_phone
				+ ", member_email=" + member_email + "]";
	}
	
	

}
