package com.mvc.kiview.model.dao;

import java.util.List;

import com.mvc.kiview.model.vo.MemberVo;

public interface MemberDao {
	
	String namespace = "member.";
	
	public MemberVo selectOne(MemberVo vo);

	public MemberVo idSearch(MemberVo vo);

	public int signup(MemberVo vo);

	public MemberVo signupIdChk(MemberVo vo);

	public int updateMember(MemberVo vo);

	public int deleteMember(MemberVo vo);

	public int findPwd(MemberVo vo);

	public MemberVo selectEmailId(String snsEmail);

	public int tmpPwd(MemberVo vo);

	public int membercount();

	public List<MemberVo> chkEmail(String email);


	
}
