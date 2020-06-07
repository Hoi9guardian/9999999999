package com.mvc.kiview.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.kiview.model.dao.ReviewDao;
import com.mvc.kiview.model.vo.Criteria;
import com.mvc.kiview.model.vo.KinderVo;
import com.mvc.kiview.model.vo.ReviewVo;

@Service
public class ReviewBizImpl implements ReviewBiz{
	
	@Autowired
	private ReviewDao dao;
	
	@Override
	public List<ReviewVo> reviewList(Criteria cri) {
		return dao.reviewList(cri);
	}

	@Override
	public int reviewInsert(ReviewVo vo) {
		return dao.reviewInsert(vo);
	}

	@Override
	public int reviewUpdate(ReviewVo vo) {
		return dao.reviewUpdate(vo);
	}

	@Override
	public int reviewDelete(int review_no) {
		return dao.reviewDelete(review_no);
	}

	

	@Override
	public ReviewVo reviewSelect(int review_no) {
		return dao.reviewSelect(review_no);
	}

	@Override
	public List<KinderVo> kinderSearch(String keyword) {
		
		return dao.kinderSearch(keyword);
	}

	@Override
	public KinderVo kinderSearch2(String kinder_name) {
		return dao.kinderSearch2(kinder_name);
	}

	@Override
	public List<ReviewVo> reviewSearch(Criteria cri) {
		
		return dao.reviewSearch(cri);
	}

	@Override
	public int reviewCount(Criteria cri) {
		return dao.reviewCount(cri);
	}

	

}
