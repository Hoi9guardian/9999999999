package com.mvc.kiview.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.kiview.model.dao.MemberDao;
import com.mvc.kiview.model.vo.MemberVo;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberVo selectOne(MemberVo vo) {
		return dao.selectOne(vo);
	}

	@Override
	public MemberVo idSearch(MemberVo vo) {
		return dao.idSearch(vo);
	}

	@Override
	public int signup(MemberVo vo) {
		return dao.signup(vo);
	}

	@Override
	public MemberVo signupIdChk(MemberVo vo) {
		return dao.signupIdChk(vo);
	}

	@Override
	public int updateMember(MemberVo vo) {
		return dao.updateMember(vo);
	}

	@Override
	public int deleteMember(MemberVo vo) {
		return dao.deleteMember(vo);
	}

	@Override
	public int findPwd(MemberVo vo) {
		return dao.findPwd(vo);
	}

	@Override
	public MemberVo selectEmailId(String snsEmail) {
		return dao.selectEmailId(snsEmail);
	}

	@Override
	public int tmpPwd(MemberVo vo) {
		return dao.tmpPwd(vo);
	}

	@Override
	public int membercount() {
		
		return dao.membercount();
	}

	@Override
	public List<MemberVo> chkEmail(String email) {
	
		return dao.chkEmail(email);
	}


	
	
}
