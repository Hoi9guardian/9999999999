package com.mvc.kiview.model.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.kiview.model.biz.CafeBiz;
import com.mvc.kiview.model.biz.KinderBiz;
import com.mvc.kiview.model.biz.LikeBiz;
import com.mvc.kiview.model.biz.MemberBiz;
import com.mvc.kiview.model.biz.ReviewBiz;
import com.mvc.kiview.model.vo.CafeMemberVo;
import com.mvc.kiview.model.vo.CafeVo;
import com.mvc.kiview.model.vo.Criteria;
import com.mvc.kiview.model.vo.KinderVo;
import com.mvc.kiview.model.vo.LikeVo;
import com.mvc.kiview.model.vo.PageMaker;
import com.mvc.kiview.model.vo.ReviewVo;

@Controller // 인덱스 관련된 컨트롤러
public class MainController {
	
   @Autowired
   private MemberBiz mbiz;
	
   @Autowired
   private KinderBiz biz;
   
   @Autowired
   private CafeBiz biz_cafe;
   
   @Autowired
   private LikeBiz biz_like;
   
   @Autowired
   private ReviewBiz biz_review;
   
 
   
   
   

   @RequestMapping("/index.do")
   public String index(Model model) {

      List<CafeMemberVo> member = biz_cafe.member_selectAll();
      List<CafeVo> best = biz_cafe.best_cafe();
      List<CafeVo> cafealllist = biz_cafe.cafe_selectAll();
      int cafecount =cafealllist.size();
      int membercount = mbiz.membercount();
      
      
      model.addAttribute("member", member);
      model.addAttribute("best",best);

      model.addAttribute("cafecount",cafecount);
      model.addAttribute("membercount",membercount);
      
      
      List<KinderVo> kinderlist = biz.bestKinderList();
      List<KinderVo> kinder_res = new ArrayList<KinderVo>();
      List<KinderVo> kinderAll = biz.KinderListAll();
      
      Collections.shuffle(kinderlist);
      
      
      for(int i=0; i<4; i++) {
         kinder_res.add(kinderlist.get(i));
      }
      
      model.addAttribute("bestkinder",kinder_res);
      model.addAttribute("kindercnt",kinderAll.size());
      
      List<ReviewVo> review = biz_like.bestReview();
      List<LikeVo> like = biz_like.selectAll();
      model.addAttribute("review",review);
      model.addAttribute("reviewcnt",biz_like.bestReview().size());
      model.addAttribute("like", like);
      
      
      
      
      
      
      return "index";
   }
   
   @RequestMapping("/autosearch.do")
   @ResponseBody
   public List<KinderVo> autoSearch(String keyword) {    
       
      List<KinderVo> list = biz.KinderList(keyword);

       return list;
   }
   
   @RequestMapping("/mainsearch.do")
   public ModelAndView mainSearch(String keyword,Criteria cri,Integer kinder_no) {
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      
      ModelAndView mav = new ModelAndView("kinder/kiview_Search_detail");
      if(keyword!=null ) {
         mav.addObject("kindervo",biz.Kinderdetail(keyword));         
         mav.addObject("reviewvo",biz.ReviewList(biz.Kinderdetail(keyword).getKinder_no(),cri));
         pageMaker.setTotalCount(biz.ReviewCnt(biz.Kinderdetail(keyword).getKinder_no()));
      }else {
         mav.addObject("kindervo", biz.Kinderdetail(kinder_no));
         mav.addObject("reviewvo",biz.ReviewList(kinder_no,cri));
         pageMaker.setTotalCount(biz.ReviewCnt(kinder_no));

      }
      mav.addObject("pageMaker", pageMaker);
      
      return mav;
   }

   
	   
   

}