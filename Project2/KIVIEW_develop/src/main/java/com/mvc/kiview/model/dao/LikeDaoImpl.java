package com.mvc.kiview.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.kiview.model.vo.CafeBoardVo;
import com.mvc.kiview.model.vo.CafeMenuVo;
import com.mvc.kiview.model.vo.FavoriteVo;
import com.mvc.kiview.model.vo.KinderVo;

import com.mvc.kiview.model.vo.LikeVo;
import com.mvc.kiview.model.vo.ReviewVo;

@Repository
public class LikeDaoImpl implements LikeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectLikeCount(LikeVo vo) {
		int resultLike = 0;
		try {
			resultLike = sqlSession.selectOne(namespace + "selectLikeCount", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultLike;
	}

	@Override
	public int likeInsert(LikeVo vo) {
		int res = 0;

		try {
			res = sqlSession.insert(namespace + "insertlike", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int likeDelete(LikeVo vo) {
		int res = 0;

		try {
			res = sqlSession.delete(namespace + "deletelike", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	
	
	
	@Override
	public int favoriteInsertCount(FavoriteVo vo) {
		int res = 0;
		
		try {
		res = sqlSession.insert(namespace + "insertfavorite", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	@Override
	public int favoriteDeleteCount(FavoriteVo vo) {
		int res = 0;
		try {
		res = sqlSession.delete(namespace + "deletefavorite",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
 		return res;
	}

	@Override
	public List<LikeVo> selectAll() {
		List<LikeVo> res = new ArrayList<LikeVo>();

		try {
			res = sqlSession.selectList(namespace + "selectAll");

		} catch (Exception e) {
			e.printStackTrace();

		}
		return res;
	}

	@Override
	public List<LikeVo> selectMy(int member_no) {
		List<LikeVo> res = new ArrayList<LikeVo>();

		try {
			res = sqlSession.selectList(namespace + "selectMy", member_no);

		} catch (Exception e) {
			e.printStackTrace();

		}
		return res;
	}
	

   

	@Override
	public List<ReviewVo> myReview(String member_id) {
		List<ReviewVo> res = null;
		
		try {
			res = sqlSession.selectList(namespace + "myReview", member_id);

		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return res;
	}

	@Override
	public List<CafeBoardVo> myBoard(String member_id) {
		List<CafeBoardVo> res = null;
		
		try {
			res = sqlSession.selectList(namespace + "myBoard", member_id);

		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return res;
	}
	
	@Override
	public List<CafeBoardVo> myBoard_paging(Map boardMap) {
		List<CafeBoardVo> res = null;
		
		try {
			res = sqlSession.selectList(namespace + "myBoard_paging", boardMap);

		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return res;
	}

	@Override
	public List<CafeMenuVo> myMenu() {
		List<CafeMenuVo> res = null;
		
		try {
			res = sqlSession.selectList(namespace + "myMenu");

		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return res;
	}

	@Override
	public List<KinderVo> myFavorite(String member_id) {
		List<KinderVo> res = null;
		
		try {
			res = sqlSession.selectList(namespace + "myFavorite", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	

	@Override
	public FavoriteVo selectFavorite(FavoriteVo vo) {
		FavoriteVo res = null;
		
		try {
			res = sqlSession.selectOne(namespace + "selectFavorite", vo);
		} catch (Exception e){
			e.printStackTrace();
		}
	
		return res;
	}

	@Override
	public List<KinderVo> myFavorite_paging(Map favoriteMap) {
		List<KinderVo> res = null;
		try { 
			res = sqlSession.selectList(namespace+"myFavorite_paging", favoriteMap);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("myFavorite_paging 오류");
		}
		return res;
	}

	@Override
	public List<ReviewVo> bestReview() {
		List<ReviewVo> res = null;
		try { 
			res = sqlSession.selectList(namespace+"bestReview");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("bestReview 오류");
		}
		return res;
	}

	

	

	

}