package com.mvc.kiview.model.biz;

import java.util.List;
import java.util.Map;

import com.mvc.kiview.model.vo.Criteria;
import com.mvc.kiview.model.vo.KinderVo;
import com.mvc.kiview.model.vo.ReviewVo;

public interface ReviewBiz {
	public List<ReviewVo> reviewList(Criteria cri); //목록
	public int reviewInsert(ReviewVo vo); //게시글 쓰기
	public int reviewUpdate(ReviewVo vo); //게시글 수정
	public int reviewDelete(int review_no); //게시글 삭제
	public List<ReviewVo> reviewSearch(Criteria cri); //검색 
	public ReviewVo reviewSelect(int review_no);
	public List<KinderVo> kinderSearch(String keyword); //유치원 검색(insert안)
	public KinderVo kinderSearch2(String kinder_name);
	public int reviewCount(Criteria cri); //리뷰 갯수 카운트 **승혜
	
}