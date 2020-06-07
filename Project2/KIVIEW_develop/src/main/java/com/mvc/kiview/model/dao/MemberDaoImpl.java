package com.mvc.kiview.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.kiview.model.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVo selectOne(MemberVo vo) {
		MemberVo res = null;
		System.out.println(vo.getMember_id()+"/"+vo.getMember_pwd());
		
		try {
			res=sqlSession.selectOne(namespace+"selectOne",vo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("[error] : selectOne");
		}		
		return res;
	}

	@Override
	public MemberVo idSearch(MemberVo vo) {
		MemberVo res = null;
		
		try {
			res=sqlSession.selectOne(namespace+"idSearch",vo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("[error] : idSearch");
		}		
		return res;
	}

	@Override
	public int signup(MemberVo vo) {
		int res = 0;
		
		try {
			res=sqlSession.insert(namespace+"signup",vo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("[error] : signup");
		}		
		return res;
	}

	@Override
	public MemberVo signupIdChk(MemberVo vo) {
		MemberVo res = null;	
		
		try {
			res=sqlSession.selectOne(namespace+"signupIdChk",vo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("[error] : signupIdChk");
		}		
		return res;
	}

	@Override
	public int updateMember(MemberVo vo) {
		int res = 0;	

		try {
			res = sqlSession.update(namespace + "updateMember",vo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("[error] : update");
		}		
		return res;
	}

	@Override
	public int deleteMember(MemberVo vo) {
		int res = 0;	

		try {
			res = sqlSession.update(namespace + "deleteMember",vo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("[error] : delete");
		}		
		return res;
	}

	@Override
	public int findPwd(MemberVo vo) {
		int res = 0;	

		try {
			res = sqlSession.selectOne(namespace + "findPwd",vo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("[error] : findPwd");
		}		
		return res;
	}

	@Override
	public MemberVo selectEmailId(String snsEmail) {
		//
		System.out.println(snsEmail);	//삭젝
		
		MemberVo res = null;

		try {
			res=sqlSession.selectOne(namespace+"selectEmail",snsEmail);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("[error] : selectEmail");
		}		
		return res;
	}

	@Override
	public int tmpPwd(MemberVo vo) {
		int res = 0;	

		try {
			res = sqlSession.update(namespace + "tmpPwd",vo);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("[error] : tmpPwd");
		}		
		return res;
	}

	@Override
	public int membercount() {
		
		int res = 0;	

		try {
			res = sqlSession.selectOne(namespace + "membercount");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("[error] : membercount");
		}		
		return res;
	}

	@Override
	public List<MemberVo> chkEmail(String email) {
		List<MemberVo> res = null;
				
		try {
			res = sqlSession.selectList(namespace+"chkEmail",email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] : chkEmail");
		}
		return res;
	}



}



