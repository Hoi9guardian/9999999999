package com.mvc.kiview.model.biz;

import java.util.List;

import com.mvc.kiview.model.vo.Criteria;
import com.mvc.kiview.model.vo.FAQVo;
import com.mvc.kiview.model.vo.NoticeVo;

public interface NoticeBiz {

	
	/* 공지사항 관련 method */
	
	public List<NoticeVo> noticeList(Criteria cri); //notice게시판 selectList 
	public NoticeVo n_selectOne(int notice_no); //notice게시판 selectOne 
	public int notice_count(Criteria cri); //noticelist count
	public int notice_insert(NoticeVo n_vo); //notice게시판 insert(글쓰기) 
	public int notice_update(NoticeVo n_vo); //notice게시판 글 update(수정) 
	public int notice_delete(int notice_no); //notice게시판 글 delete(삭제) 
	
	
	/* FAQ관련 method */
	public List<FAQVo> faqList(Criteria cri); // FAQ게시판 selectList
	public FAQVo f_selectOne(int faq_no); // FAQ게시판 selectOne
	public FAQVo faq_updateOne(int faq_no);
	public int faq_count(Criteria cri); //게시글 count
	public int faq_insert(FAQVo f_vo); // FAQ게시판 insert
	public int faq_update(FAQVo f_vo); // FAQ게시판 update
	public int faq_delete(int faq_no); // FAQ게시판 delete
	
	
	
	
}
