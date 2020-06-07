package com.team3.vo;

public class member {
	
	//field
	private String userid;
	private String userpw;
	private String nickname;
	private String email;
	private String isdel;
	
	//생성자
	public member() {
		super();
		// TODO Auto-generated constructor stub
	}

	//전체 매개변수
	public member(String userid, String userpw, String nickname, String email, String isdel) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.nickname = nickname;
		this.email = email;
		this.isdel = isdel;
	}
	
	public member(String nickname, String userid, String email) {
		super();
		this.nickname=nickname;
		this.userid=userid;
		this.email=email;
	}
	
	//로그인
	public member(String userid, String userpw) {
		super();
		this.userid = userid;
		this.userpw = userpw;
	}

	//getter. setter
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}

	
	//tostring
	
	@Override
	public String toString() {
		return "member [userid=" + userid + ", userpw=" + userpw + ", nickname=" + nickname + ", email=" + email
				+ ", isdel=" + isdel + "]";
	}	
	

}
