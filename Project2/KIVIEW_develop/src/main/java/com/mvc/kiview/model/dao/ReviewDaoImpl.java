package com.mvc.kiview.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.kiview.model.vo.Criteria;
import com.mvc.kiview.model.vo.KinderVo;
import com.mvc.kiview.model.vo.ReviewVo;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReviewVo> reviewList(Criteria cri) {

		List<ReviewVo> list = new ArrayList<ReviewVo>();

		try {
			list = sqlSession.selectList(namespace + "reviewList", cri);
		} catch (Exception e) {
			System.out.println("error : review list");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int reviewInsert(ReviewVo vo) {

		int res = 0;

		try {
			res = sqlSession.insert(namespace + "reviewInsert", vo);
		} catch (Exception e) {
			System.out.println("error : review insert DaoImpl");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int reviewUpdate(ReviewVo vo) {

		int res = 0;

		try {
			res = sqlSession.update(namespace + "reviewUpdate", vo);
		} catch (Exception e) {
			System.out.println("error : review update DaoImpl");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int reviewDelete(int review_no) {

		int res = 0;

		try {
			res = sqlSession.delete(namespace + "reviewDelete", review_no);
			System.out.println(review_no);
		} catch (Exception e) {
			System.out.println("error : review delete DaoImpl");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public ReviewVo reviewSelect(int review_no) {
		ReviewVo res = null;

		try {
			res = sqlSession.selectOne(namespace + "reviewselect", review_no);
		} catch (Exception e) {
			System.out.println("error : review select DaoImpl");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<KinderVo> kinderSearch(String keyword) {
		List<KinderVo> res = null;

		try {
			res = sqlSession.selectList(namespace + "kinderSearch", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error : kinder search DaoImpl");
		}
		return res;
	}

	@Override
	public KinderVo kinderSearch2(String kinder_name) {
		KinderVo res = null;

		try {
			res = sqlSession.selectOne(namespace + "kinderSearch2", kinder_name);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error : kinder search DaoImpl");
		}
		return res;
	}

	@Override
	public List<ReviewVo> reviewSearch(Criteria cri) {
		List<ReviewVo> res = null;

		try {
			res = sqlSession.selectList(namespace + "reviewSearch", cri);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error : reviewSearch DaoImpl");
		}
		return res;
	}

	// **승혜:리뷰 갯수 카운트
	@Override
	public int reviewCount(Criteria cri) {

		int count = 0;

		try {
			count = sqlSession.selectOne(namespace + "reviewCount", cri);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error : reviewCount DaoImpl");
		}

		return count;
	}

	

	
}
