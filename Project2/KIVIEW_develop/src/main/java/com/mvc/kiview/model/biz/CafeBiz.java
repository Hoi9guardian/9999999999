package com.mvc.kiview.model.biz;

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

public interface CafeBiz {
	

	public List<CafeVo> cafe_Ulist(int member_no);

	public List<CafeVo> cafe_Alist(String member_id);

	public CafeMemberVo cafe_regyn(CafeMemberVo regyn);


	//--카페 CRUD--

	public int cafe_insert(CafeVo vo1, CafeMemberVo vo2);
	
	public CafeVo cafe_chk(String title);
	
	public int cafe_delete(int cafe_no);
	
	public CafeVo cafe_selectone(int cafe_no);
	
	public List<CafeVo> cafe_search(String keyword);
	
	public int cafe_update(CafeVo cafe);
	
	public List<CafeVo> cafe_admin(String admin);
	

	public List<CafeVo> best_cafe();

	public List<CafeVo> cafe_selectAll();
	
	public CafePageVo spaging(int curpagenum, int size, int pagepercount);

	public List<CafeVo> cafe_search(CafePageVo pagevo);
	
	
	
	//--메뉴 CRUD--
	
	public List<CafeMenuVo> menu_list(int cafe_no);

	public int menu_insert(CafeMenuVo vo, String cat1, String cat2, String cat3);
	
	public CafeMenuVo menu_detail1(int no);

	public List<CafeCategoryVo> menu_detail2(int no);
	
	public CafeMenuVo menu_chk(CafeMenuVo menu);
	
	public int menu_delete(int cafe_menu_no);

	public int menu_update(CafeMenuVo menu);
	
	//--카테고리 CRUD
	public int category_insert(String cat);

	public int cafe_join(CafeMemberVo vo);
		
	public List<CafeMemberVo> cafe_member_list(int cafe_no);	
	
	public int category_delete_all(int cafe_menu_no);
	
	public int category_update(CafeCategoryVo category);
	
	public int category_delete(int category_no);
	
	public int category_update_insert(CafeCategoryVo category);
	
	
	
	//--게시판--//
	
	public List<CafeBoardVo> cafe_board(int cafe_no);

	public List<CafeBoardVo> cafe_boardlist(int cafe_menu_no);

	public String cafe_menu_name(int cafe_menu_no);
	
	public int cafe_board_insert(CafeBoardVo cafeboardvo);

	public CafeBoardVo cafe_board_detail(int cafe_board_no);

	public int cafe_board_delete(int cafe_board_no);

	public int cafe_board_update(CafeBoardVo cafeboardvo);
	
	public int cafe_board_hit(int cafe_board_no);

	public List<CafeBoardVo> cafe_searchlist(CafePageVo cafepagevo);

	public List<CafeBoardVo> cafe_board_list_total(int cafe_no);
	
	
	
	//200228
	public List<CafeBoardVo> cafe_boardlistpage(CafePageVo cafepagevo);

	public List<CafeReplyVo> cafe_board_reply_list(CafePageVo pagevo);
	   
	public CafePageVo paging(int curpagenum,int lsitsize );
	
	public List<CafeBoardVo> cafe_boardlistcount(Map<String, Object> slistcount);
	
	
	
	
	
	//-----------댓글-----------------------------
	public List<CafeReplyVo> cafe_board_reply_list(int cafe_board_no);
	
	public int reply_insert(CafeReplyVo cafereplyvo);

	public int reply_delete(int cafe_reply);

	public int reply_update(CafeReplyVo cafereplyvo);
	
	public List<CafeReplyVo> cafe_board_reply_allList();
	
	
	
	
	
	
	
	
	
	
	//--멤버관리--//
	public int member_block(int cafe_member_no);
	
	public int member_unblock(int cafe_member_no);
	
	public int member_sign(int cafe_member_no);
	
	public List<CafeMemberVo> member_selectAll();

	public int member_delete(int cafe_member_no);

	
	
	
	
	

	
	

	public List<CafeChatVo> cafe_chat_select(Map parameter);

	public int cafe_chat_insert(CafeChatVo vo);

	public List<CafeVo> cafe_my(Map map);

	

	

	

	
	

	

	

	

	
	
	

}