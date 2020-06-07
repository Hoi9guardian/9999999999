package com.mvc.kiview.model.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.kiview.model.biz.LikeBiz;
import com.mvc.kiview.model.biz.ReviewBiz;
import com.mvc.kiview.model.vo.Criteria;
import com.mvc.kiview.model.vo.KinderVo;
import com.mvc.kiview.model.vo.PageMaker;
import com.mvc.kiview.model.vo.ReviewVo;

@Controller //리뷰관련
public class ReviewController {

   
   private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
   
   @Autowired
   private ReviewBiz biz;
   
   //200305 지민추가
   @Autowired 
   private LikeBiz biz_like;
   
   /* 승혜 : 페이징 vo 추가 --> CRUD할 때 현재 페이지를 파라미터로 보내줘야 됩니다! */
   @RequestMapping("/reviewboard.do")
   public String list(Model model, Criteria cri) {
      logger.info("ReviewController : REVIEW LIST");
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(biz.reviewCount(cri));
      
      
      model.addAttribute("list", biz.reviewList(cri));
      model.addAttribute("pageMaker", pageMaker);
      
      //200305 지민추가
      model.addAttribute("likeAll", biz_like.selectAll());
   
      
      
      System.out.println(biz.reviewList(cri));
      return "review/kiview_reviewboard";
   }
   
   /* 이렇게 insert할 때도 현재 page번호를 파라미터로 받아서 보내줘야 합니다! */
   @RequestMapping("/reviewInsert.do")
   public String reviewInsert(ReviewVo vo, int page) {
      logger.info("ReviewController : INSERT REVIEW");
      
      int res = biz.reviewInsert(vo);
      
      if(res > 0) {
         return "redirect:reviewboard.do?page="+page;
      } else {
         return "redirect:reviewboard.do?page="+page;
      }
   }
   
   /* update, delete도 마찬가지로 페이지번호 파라미터로 받아서 보내주기 */
   @RequestMapping("/reviewUpdate.do")
   public String reviewUpdate(ReviewVo vo, int page) {
      logger.info("ReviewController : UPDATE RES");
      
      int res = biz.reviewUpdate(vo);
      
      if(res > 0) {
         return "redirect:reviewboard.do?page="+page;
      } else {
         return "redirect:reviewboard.do?page="+page;
      }
   }
   
   @RequestMapping("/reviewDelete.do")
   public String reviewDelete(int review_no, int page) {
      logger.info("ReviewController : DELETE REVIEW");
      
      int res = biz.reviewDelete(review_no);
      
      if(res > 0) {
         return "redirect:reviewboard.do?page="+page;
      } else {
         System.out.println("ReviewController : FAIL ---- DELETE");
         return "redirect:reviewboard.do?page="+page;
      }
   }
   
   @RequestMapping("/reviewselect.do")
   @ResponseBody //json으로 바꿔서 해 주는 역할
   public Map review_select(int review_no) {
      ReviewVo review = biz.reviewSelect(review_no);
      System.out.println(review);
      Map map = new HashMap();
      map.put("review", review);
      
      return map;
      
   }
   
   @RequestMapping("/searchkinder.do")
   @ResponseBody
   public Map kinderSearch(String keyword) {
      
      List<KinderVo> kinder = biz.kinderSearch(keyword);
      
      Map map = new HashMap();
      map.put("kinder", kinder);
      
      
      
      return map;
   }
   
   @RequestMapping("/searchkinder2.do")
   @ResponseBody
   public Map kinderSearch2(String kinder_name) {
      KinderVo kinder = biz.kinderSearch2(kinder_name);
      System.out.println(kinder);
      Map map = new HashMap();
      map.put("kinder",kinder);
      
      return map;
   }
   
   @RequestMapping("/reviewsearch.do")
   public String reviewSearch(String keyword, Model model, Criteria cri){
      
	  logger.info("REVIEW SEARCH");
	   
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(biz.reviewCount(cri));
      
      List<ReviewVo> list = biz.reviewSearch(cri); 
      model.addAttribute("list",list);
      model.addAttribute("keyword",keyword);
      model.addAttribute("likeAll", biz_like.selectAll());
      model.addAttribute("pageMaker", pageMaker);
      
      return "review/kiview_reviewboard";
   }


}