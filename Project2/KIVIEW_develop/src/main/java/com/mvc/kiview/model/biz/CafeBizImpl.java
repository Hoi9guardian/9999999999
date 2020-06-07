package com.mvc.kiview.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.kiview.model.dao.CafeDao;
import com.mvc.kiview.model.vo.CafeBoardVo;
import com.mvc.kiview.model.vo.CafeCategoryVo;
import com.mvc.kiview.model.vo.CafeChatVo;
import com.mvc.kiview.model.vo.CafeMemberVo;
import com.mvc.kiview.model.vo.CafeMenuVo;
import com.mvc.kiview.model.vo.CafePageVo;
import com.mvc.kiview.model.vo.CafeReplyVo;
import com.mvc.kiview.model.vo.CafeVo;

@Service
public class CafeBizImpl implements CafeBiz {

	@Autowired
	private CafeDao dao;


	@Override
	public List<CafeVo> cafe_Ulist(int member_no) {

		return dao.cafe_Ulist(member_no);
	}

	@Override
	public List<CafeVo> cafe_Alist(String member_id) {
		return dao.cafe_Alist(member_id);
	}

	@Override
	public CafeMemberVo cafe_regyn(CafeMemberVo regyn) {

		return dao.cafe_regyn(regyn);
	}

	@Transactional
	@Override
	public int cafe_insert(CafeVo vo1, CafeMemberVo vo2) {

		int res = dao.cafe_insert(vo1);

		if (res > 0) {
			res = dao.cafe_insert2(vo2);

			return res;
		}

		return res;
	}

	@Override
	public CafeVo cafe_selectone(int cafe_no) {

		return dao.cafe_selectone(cafe_no);
	}

	@Transactional
	@Override
	public int menu_insert(CafeMenuVo vo, String cat1, String cat2, String cat3) {

		int res = dao.menu_insert(vo);
		
		if(res>0) {
			if (cat1 != null) {
				res += dao.category_insert(cat1);
				
				

			}

			if (cat2 != null) {
				res += dao.category_insert(cat2);

			}

			if (cat3 != null) {
				res += dao.category_insert(cat3);

			}
		}

		

		return res;
	}

	@Override
	public int category_insert(String cat) {

		return dao.category_insert(cat);
	}

	@Override
	public int cafe_join(CafeMemberVo vo) {

		return dao.cafe_join(vo);
	}

	@Override
	public List<CafeMenuVo> menu_list(int cafe_no) {
		
		return dao.menu_list(cafe_no);
	}

	@Override
	public CafeMenuVo menu_detail1(int no) {
		
		return dao.menu_detail1(no);
	}

	@Override
	public List<CafeCategoryVo> menu_detail2(int no) {
		
		return dao.menu_detail2(no);
	}

	@Override
	public CafeMenuVo menu_chk(CafeMenuVo menu) {
		
		return dao.menu_chk(menu);
	}

	@Override
	public List<CafeVo> cafe_search(String keyword) {
		
		return dao.cafe_search(keyword);
	}

	@Override
	public List<CafeMemberVo> cafe_member_list(int cafe_no) {
		
		return dao.cafe_member_list(cafe_no);
	}
	
	
	@Override
	public int menu_delete(int cafe_menu_no) {
		
			
		return dao.menu_delete(cafe_menu_no);
			
	}
	

	@Override
	public int category_delete_all(int cafe_menu_no) {
		
		return dao.category_delete_all(cafe_menu_no);
	}
	
	//------------------------------- 게시판 -----------------------------//
	   @Override
	   public List<CafeBoardVo> cafe_board(int cafe_no) {
	      
	      return dao.cafe_board(cafe_no);
	   }

	   @Override
	   public List<CafeBoardVo> cafe_boardlist(int cafe_menu_no) {
	      
	      return dao.cafe_boardlist(cafe_menu_no);
	   }

	   @Override
	   public String cafe_menu_name(int cafe_menu_no) {
	      
	      return dao.cafe_menu_name(cafe_menu_no);
	   }
    
	   
	   @Override
	   public int cafe_board_insert(CafeBoardVo cafeboardvo) {
	      
	      return dao.cafe_board_insert(cafeboardvo);
	   }

	   @Override
	   public CafeBoardVo cafe_board_detail(int cafe_board_no) {
	      
	      return dao.cafe_board_detail(cafe_board_no);
	   }

	   @Override
	   public int cafe_board_delete(int cafe_board_no) {
	      
	      return dao.cafe_board_delete(cafe_board_no);
	   }

	   @Override
	   public int cafe_board_update(CafeBoardVo cafeboardvo) {
	      
	      return dao.cafe_board_update(cafeboardvo);
	   }
	   
	   @Override
	   public int cafe_board_hit(int cafe_board_no) {
	      
	      return dao.cafe_board_hit(cafe_board_no);
	   }

	   @Override
	   public List<CafeReplyVo> cafe_board_reply_list(int cafe_board_no) {
	      
	      return dao.cafe_reply_list(cafe_board_no);
	   }

	   @Override
	   public int reply_insert(CafeReplyVo cafereplyvo) {
	      
	      int res = dao.reply_insert(cafereplyvo);
	      
	      if(res>0) {
	         res = 1;
	      }else {
	         res = 0;
	      }
	      
	      
	      return res;
	   }

	   @Override
	   public int reply_delete(int cafe_reply) {
	      int res = dao.reply_delete(cafe_reply);
	      
	      if(res>0) {
	         res=1;
	      }else {
	         res=0;
	      }
	      return res;
	   }
	   
	   @Override
	   public int reply_update(CafeReplyVo cafereplyvo) {
	      int res = dao.reply_update(cafereplyvo);
	      
	      if(res>0) {
	         res=1;
	      }else {
	         res=0;
	      }
	      return res;
	      
	   }
	   
	   @Override
		public List<CafeReplyVo> cafe_board_reply_allList() {
			
			return dao.cafe_board_reply_allList();
		}
	   
	   @Override
	   public List<CafeBoardVo> cafe_searchlist(CafePageVo cafepagevo) {
	         
	      return dao.cafe_searchlist(cafepagevo);
	   }
	   
	   
	   
	   
	   
	   
	   
	   
	   //
	
	   @Override
	public int menu_update(CafeMenuVo menu) {
		
		return dao.menu_update(menu);
	}

	@Override
	public int category_update(CafeCategoryVo category) {
		
		return dao.category_update(category);
	}

	@Override
	public int category_delete(int category_no) {
		
		return dao.category_delete(category_no);
	}

	@Override
	public int category_update_insert(CafeCategoryVo category) {
		
		return dao.category_update_insert(category);
	}

	@Override
	public int cafe_update(CafeVo cafe) {
		
		return dao.cafe_update(cafe);
	}

	@Override
	public CafeVo cafe_chk(String title) {
		
		return dao.cafe_chk(title);
	}

	
	//--회원관리--//
	@Override
	public int member_block(int cafe_member_no) {
		
		return dao.member_block(cafe_member_no);
	}
	
	@Override
	public int member_unblock(int cafe_member_no) {
		
		return dao.member_unblock(cafe_member_no);
	}

	@Override
	public int member_sign(int cafe_member_no) {
		
		return dao.member_sign(cafe_member_no);
	}

	

	@Override
	public List<CafeMemberVo> member_selectAll() {
		
		return dao.member_selectAll();
	}

	@Override
	public int member_delete(int cafe_member_no) {
		
		return dao.member_delete(cafe_member_no);
	}

	@Override
	public int cafe_delete(int cafe_no) {
		
		return dao.cafe_delete(cafe_no);
	}

	@Override
	public List<CafeBoardVo> cafe_board_list_total(int cafe_no) {
		
		return dao.cafe_board_list_total(cafe_no);
	}

	@Override
	public List<CafeVo> cafe_admin(String admin) {
		
		return dao.cafe_admin(admin);
	}

	

	@Override
	public List<CafeVo> best_cafe() {
		
		return dao.best_cafe();
	}

	@Override
	public List<CafeVo> cafe_selectAll() {
		
		return dao.cafe_selectAll();
	}

	
	
	
	
	//200228
	@Override
	   public List<CafeBoardVo> cafe_boardlistcount(Map slistcount) {
	      
	      return dao.cafe_boardlistcount(slistcount);
	   }

	   @Override
	   public List<CafeBoardVo> cafe_boardlistpage(CafePageVo pagevo) {
	      
	      return dao.cafe_boardlistpage(pagevo);
	   }

	   @Override
	   public List<CafeReplyVo> cafe_board_reply_list(CafePageVo page) {
	      
	      return dao.cafe_board_reply_list(page);
	   }
	   
	   @Override
	      public CafePageVo paging(int curpagenum, int lsitsize) {
	         CafePageVo page = new CafePageVo();
	         page.setCurpagenum(curpagenum);
	         page.setTotallistcount(lsitsize);
	         page.setPagepercount(10);
	         page.setDisplaypagenum(10);
	         page.setTotalpagecount(10, page.getTotallistcount());
	         page.setStartpage(page.getCurpagenum(), page.getDisplaypagenum());
	         page.setEndpage(page.getStartpage(),page.getDisplaypagenum(), page.getTotalpagecount());
	         page.setRowStart(page.getRowStart());
	         page.setRowEnd(page.getRowEnd());
	         page.setPagepre(page.getCurpagenum());
	         page.setPagenext(page.getCurpagenum(), page.getTotalpagecount());
	         
	         return page;
	      }
	   
	   
	   @Override
	   public CafePageVo spaging(int curpagenum, int size, int pagepercount) {
	      CafePageVo page = new CafePageVo();
	        page.setCurpagenum(curpagenum);
	        page.setTotallistcount(size);
	        page.setPagepercount(9);
	        page.setDisplaypagenum(10);
	        page.setTotalpagecount(9, page.getTotallistcount());
	        page.setStartpage(page.getCurpagenum(), page.getDisplaypagenum());
	        page.setEndpage(page.getStartpage(),page.getDisplaypagenum(), page.getTotalpagecount());
	        page.setRowStart(page.getRowStart());
	        page.setRowEnd(page.getRowEnd());
	        page.setPagepre(page.getCurpagenum());
	        page.setPagenext(page.getCurpagenum(), page.getTotalpagecount());
	        
	        return page;
	      
	   }

	   @Override
	   public List<CafeVo> cafe_search(CafePageVo pagevo) {
	      
	      return dao.cafe_search(pagevo);
	   }

	@Override
	public List<CafeChatVo> cafe_chat_select(Map parameter) {
		
		return dao.cafe_chat_select(parameter);
	}

	@Override
	public int cafe_chat_insert(CafeChatVo vo) {
		
		return dao.cafe_chat_insert(vo);
	}

	@Override
	public List<CafeVo> cafe_my(Map map) {
		
		return dao.cafe_my(map);
	}

	
	

}