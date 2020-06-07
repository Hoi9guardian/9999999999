package com.mvc.kiview.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.kiview.model.dao.NoticeDao;
import com.mvc.kiview.model.vo.Criteria;
import com.mvc.kiview.model.vo.FAQVo;
import com.mvc.kiview.model.vo.NoticeVo;

@Service
public class NoticeBizImpl implements NoticeBiz {

	@Autowired
	private NoticeDao n_dao;

	@Override
	public List<NoticeVo> noticeList(Criteria cri) {
		return n_dao.noticeList(cri);
	}

	@Override
	public int notice_count(Criteria cri) {
		return n_dao.notice_count(cri);
	}

	@Override
	public NoticeVo n_selectOne(int notice_no) {

		n_dao.notice_hitupdate(notice_no);

		return n_dao.n_selectOne(notice_no);
	}

	@Override
	public int notice_insert(NoticeVo n_vo) {
		return n_dao.notice_insert(n_vo);
	}

	@Override
	public int notice_update(NoticeVo n_vo) {

		n_dao.notice_hitminus(n_vo.getNotice_no());

		return n_dao.notice_update(n_vo);
	}

	@Override
	public int notice_delete(int notice_no) {
		return n_dao.notice_delete(notice_no);
	}

	@Override
	public List<FAQVo> faqList(Criteria cri) {
		return n_dao.faqList(cri);
	}

	@Override
	public FAQVo f_selectOne(int faq_no) {
		return n_dao.f_selectOne(faq_no);
	}

	@Override
	public int faq_insert(FAQVo f_vo) {
		return n_dao.faq_insert(f_vo);
	}

	@Override
	public int faq_update(FAQVo f_vo) {
		return n_dao.faq_update(f_vo);
	}

	@Override
	public int faq_delete(int faq_no) {
		return n_dao.faq_delete(faq_no);
	}

	@Override
	public int faq_count(Criteria cri) {
		return n_dao.faq_count(cri);
	}

	@Override
	public FAQVo faq_updateOne(int faq_no) {
		return n_dao.faq_updateOne(faq_no);
	}

}
