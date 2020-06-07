package com.mvc.kiview.model.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.kiview.model.biz.CafeBiz;
import com.mvc.kiview.model.biz.LikeBiz;

import com.mvc.kiview.model.vo.CafeBoardVo;
import com.mvc.kiview.model.vo.CafeMenuVo;
import com.mvc.kiview.model.vo.CafePageVo;
import com.mvc.kiview.model.vo.CafeVo;
import com.mvc.kiview.model.vo.FavoriteVo;
import com.mvc.kiview.model.vo.KinderVo;

import com.mvc.kiview.model.vo.LikeVo;
import com.mvc.kiview.model.vo.ReviewVo;



@Controller //좋아요, 즐겨찾기 관련
public class LikeController {

   private static final Logger logger = LoggerFactory.getLogger(LikeController.class);
   
   @Autowired
   private LikeBiz biz;
	
	
   

   @RequestMapping(value="/likeSubmit.do", method=RequestMethod.POST)
   public @ResponseBody HashMap<String, Object> likeSubmit(@RequestBody LikeVo vo) {
      HashMap<String, Object> resultMap = new HashMap<String,Object>(); 
     
      
         int resultFlag =0;
         
         int likeCount = biz.selectLikeCount(vo);
         
         System.out.println("likecount" + likeCount);
         
         if(likeCount > 0) {
            resultFlag =biz.likeDelete(vo);
            resultMap.put("resultMsg", "delete");
         }else {
            resultFlag =biz.likeInsert(vo);
            resultMap.put("resultMsg", "insert");
         }
         LikeVo reviewCntVo = new LikeVo();
         reviewCntVo.setReview_no(vo.getReview_no());
         resultMap.put("reviewCnt", biz.selectLikeCount(reviewCntVo));
         System.out.println("reviewCnt: "+biz.selectLikeCount(reviewCntVo));
         
         resultMap.put("resultFlag",  resultFlag);
         
     
      return resultMap;
   }
   

   
   //즐겨찾기
   @RequestMapping(value="/favoriteSubmit.do", method=RequestMethod.POST)
   public @ResponseBody HashMap<String, Object> favoriteSubmit(@RequestBody FavoriteVo vo){

	   HashMap<String, Object> result = new HashMap<String,Object>();
	   
	   int resultSubmit = 0;
	   boolean bool = true;
	   
	   FavoriteVo favorite = biz.selectFavorite(vo);
	   
	   if(favorite == null) {
		   bool = false;
	   }
	   
	   
	   
	   
	   if(bool) {
		   resultSubmit = biz.favoriteDelete(vo);
		   result.put("resultMsg","delete");
		   
	   } else {
		   resultSubmit = biz.favoriteInsert(vo);
		   result.put("resultMsg","insert");
		  
	   }
	   result.put("resultSubmit", resultSubmit);
	   
	   return result;

   }
   
   
   
   @Autowired
   private CafeBiz biz_cafe;
   
   
   //마이페이지 - 회원활동
   @RequestMapping("/kiviewmyactivity.do")
   public String myactivity(Model model, String member_id) {

	 //내가 쓴 리뷰
	  List<ReviewVo> review = biz.myReview(member_id);
	  model.addAttribute("review",review);
	  
	  //내가 쓴  카페 글
	  List<CafeBoardVo> board = biz.myBoard(member_id);
	  model.addAttribute("board",board);
	  
	  List<CafeVo> cafe = biz_cafe.cafe_selectAll();
	  model.addAttribute("cafe",cafe);
	  
	  List<CafeMenuVo> menu = biz.myMenu();
	  model.addAttribute("menu",menu);
	  
	  
	  
	  //나의 즐겨찾기
	  List<KinderVo> favorite = biz.myFavorite(member_id);
	  model.addAttribute("favorite", favorite);
      
      return "member/kiview_myactivity";
   }
   
   //지민 추가
   @RequestMapping("/selectFavorite.do")
   @ResponseBody
   public Map selectfavorite(Model model, @RequestBody FavoriteVo vo) {
	  
	   HashMap map = new HashMap();
	   boolean bool = true;
	   
	   FavoriteVo favorite = biz.selectFavorite(vo);
	   
	   if(favorite == null) {
		   bool = false;
	   }
	   
	   map.put("bool", bool);
	   
	   return map;
   }
   
   
   @RequestMapping("/selectmyboard.do")
   public String selectmyboard(Model model, String member_id, int curpagenum) {
	   
	   
	   CafePageVo pagevo = biz_cafe.paging(curpagenum, biz.myBoard(member_id).size());
	   model.addAttribute("pagevo",pagevo);
	   
	   Map boardMap = new HashMap();
	   boardMap.put("member_id", member_id);
	   boardMap.put("rowStart",pagevo.getRowStart());
	   boardMap.put("rowEnd", pagevo.getRowEnd());
	   
	   List<CafeBoardVo> board = biz.myBoard_paging(boardMap);
	   model.addAttribute("size", biz.myBoard(member_id).size());
	   model.addAttribute("board",board);
	   
	   List<CafeVo> cafe = biz_cafe.cafe_selectAll();
	   model.addAttribute("cafe",cafe);
		  
	   List<CafeMenuVo> menu = biz.myMenu();
	   model.addAttribute("menu",menu);
	   
	   
	return "member/kiview_cafe_more";
   }
   
   @RequestMapping("selectmyfavorite.do")
   public String selectmyfavotire(Model model, String member_id, int curpagenum) {
	   //List<KinderVo> favorite = biz.myFavorite(member_id);
	   CafePageVo pagevo = biz_cafe.paging(curpagenum, biz.myFavorite(member_id).size());
	   model.addAttribute("pagevo",pagevo);
	   
	   Map FavoriteMap = new HashMap();
	   FavoriteMap.put("member_id", member_id);
	   FavoriteMap.put("rowStart", pagevo.getRowStart());
	   FavoriteMap.put("rowEnd", pagevo.getRowEnd());
	   
	   List<KinderVo> favorite = biz.myFavorite_paging(FavoriteMap);
	   model.addAttribute("size", biz.myFavorite(member_id).size());
	   model.addAttribute("favorite",favorite);
	  
	   
	   return "member/kiview_favorite_more";
   }
   
  


   
}