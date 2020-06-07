package com.mvc.kiview.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.kiview.model.dao.LikeDao;

import com.mvc.kiview.model.vo.CafeBoardVo;
import com.mvc.kiview.model.vo.CafeMenuVo;
import com.mvc.kiview.model.vo.FavoriteVo;
import com.mvc.kiview.model.vo.KinderVo;
import com.mvc.kiview.model.vo.LikeVo;
import com.mvc.kiview.model.vo.ReviewVo;

@Service
public class LikeBizImpl implements LikeBiz{
   
   @Autowired
   private LikeDao dao;

   @Override
   public int selectLikeCount(LikeVo vo) {
      return dao.selectLikeCount(vo);
   }
   
   @Override
   public int likeInsert(LikeVo vo) {
      return dao.likeInsert(vo);
   }

   @Override
   public int likeDelete(LikeVo vo) {
      return dao.likeDelete(vo);
   }
   

	
	
	@Override
	public int favoriteDelete(FavoriteVo vo) {
		return dao.favoriteDeleteCount(vo);
	}
	
	@Override
	public int favoriteInsert(FavoriteVo vo) {
		return dao.favoriteInsertCount(vo);
	}
  

	@Override
	public List<LikeVo> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<LikeVo> selectMy(int member_no) {
		return dao.selectMy(member_no);
	}

	@Override
	public List<ReviewVo> myReview(String member_id) {
		return dao.myReview(member_id);
	}

	@Override
	public List<CafeBoardVo> myBoard(String member_id) {
		return dao.myBoard(member_id);
	}
	
	@Override
	public List<CafeBoardVo> myBoard_paging(Map boardMap) {
		
		return dao.myBoard_paging(boardMap);
	}
	
	

	@Override
	public List<CafeMenuVo> myMenu() {
		return dao.myMenu();
	}
	

	@Override
	public List<KinderVo> myFavorite(String member_id) {
		return dao.myFavorite(member_id);
	}

	@Override
	public FavoriteVo selectFavorite(FavoriteVo vo) {
		
		return dao.selectFavorite(vo);
	}

	@Override
	public List<KinderVo> myFavorite_paging(Map favoriteMap) {
		
		return dao.myFavorite_paging(favoriteMap);
	}

	@Override
	public List<ReviewVo> bestReview() {
		
		return dao.bestReview();
	}

	

	



   

}