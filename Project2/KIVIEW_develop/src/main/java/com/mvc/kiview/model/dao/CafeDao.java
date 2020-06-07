package com.mvc.kiview.model.dao;

import java.util.List;
import java.util.Map;

import com.mvc.kiview.model.vo.CafeBoardVo;
import com.mvc.kiview.model.vo.CafeCategoryVo;
import com.mvc.kiview.model.vo.CafeChatVo;
import com.mvc.kiview.model.vo.CafeMemberVo;
import com.mvc.kiview.model.vo.CafeMenuVo;
import com.mvc.kiview.model.vo.CafePageVo;
import com.mvc.kiview.model.vo.CafeReplyVo;
import com.mvc.kiview.model.vo.CafeVo;

public interface CafeDao {
   String namespace = "cafe."; 
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ카페ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ   
   public List<CafeVo> cafe_Ulist(int member_no);
   
   public List<CafeVo> cafe_Alist(String member_id);
   
   public List<CafeVo> cafe_admin(String admin);
   
   public CafeMemberVo cafe_regyn(CafeMemberVo regyn);
   

   public List<CafeVo> best_cafe();

   public List<CafeVo> cafe_selectAll();
	
   public int cafe_delete(int cafe_no);
	   
   public int cafe_insert(CafeVo vo);
	    
   public int cafe_insert2(CafeMemberVo vo);
	   
   public CafeVo cafe_selectone(int cafe_no);
	   
   public int cafe_update(CafeVo cafe);
	
   public CafeVo cafe_chk(String title);
   
   public List<CafeVo> cafe_search(CafePageVo pagevo);
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ   
   
   
   
   public int menu_insert(CafeMenuVo vo);
   
   public int category_insert(String cat);
   
   public int cafe_join(CafeMemberVo vo);

   public List<CafeVo> cafe_search(String keyword);

	public List<CafeMenuVo> menu_list(int cafe_no);

	public CafeMenuVo menu_detail1(int no);

	public List<CafeCategoryVo> menu_detail2(int no);

	public CafeMenuVo menu_chk(CafeMenuVo menu);

	public List<CafeMemberVo> cafe_member_list(int cafe_no);

	public int menu_delete(int cafe_menu_no);

	public int category_delete_all(int cafe_menu_no);

	public int category_update(CafeCategoryVo category);
	
	public int menu_update(CafeMenuVo menu);
   
   //-------------------------------  게시판 --------------------------------
   
	public List<CafeBoardVo> cafe_board(int cafe_no);

	public List<CafeBoardVo> cafe_boardlist(int cafe_menu_no);

	public String cafe_menu_name(int cafe_menu_no);

	
	
	public int cafe_board_insert(CafeBoardVo cafeboardvo);

	public CafeBoardVo cafe_board_detail(int cafe_board_no);

	public int cafe_board_delete(int cafe_board_no);

	public int cafe_board_update(CafeBoardVo cafeboardvo);
	
	public int cafe_board_hit(int cafe_board_no);

	public List<CafeBoardVo> cafe_searchlist(CafePageVo cafepagevo);
	
	
	public List<CafeReplyVo> cafe_reply_list(int cafe_board_no);

	public int reply_insert(CafeReplyVo cafereplyvo);

	public int reply_delete(int cafe_reply);

	public int reply_update(CafeReplyVo cafereplyvo);
	
	public List<CafeReplyVo> cafe_board_reply_allList();
	
	public List<CafeBoardVo> cafe_board_list_total(int cafe_no);
	
	
	public int cafe_board_list_count(int cafe_menu_no);
	   
	   public List<CafeBoardVo> cafe_boardlistcount(Map slistcount);

	   public List<CafeBoardVo> cafe_boardlistpage(CafePageVo pagevo);

	   public List<CafeReplyVo> cafe_board_reply_list(CafePageVo pagevo);
	
	
	
	
	
	
	
	
	
	
	
	
	
	//------------------------------------------------------------------------
	
	public int category_delete(int category_no);

	public int category_update_insert(CafeCategoryVo category);

	
	
	
	  //------------------------------- 회원관리 --------------------------------

	public int member_block(int cafe_member_no);
	
	public int member_sign(int cafe_member_no);
	
	

	public List<CafeMemberVo> member_selectAll();

	public int member_delete(int cafe_member_no);

	public int member_unblock(int cafe_member_no);

	
	
	
	
	 //------------------------------- 채팅 -------------------------------


	public List<CafeChatVo> cafe_chat_select(Map parameter);

	public int cafe_chat_insert(CafeChatVo vo);

	public List<CafeVo> cafe_my(Map map);

	

	

	

	

	
}