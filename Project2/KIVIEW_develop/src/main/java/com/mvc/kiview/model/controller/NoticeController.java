package com.mvc.kiview.model.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.kiview.model.biz.NoticeBiz;
import com.mvc.kiview.model.vo.Criteria;
import com.mvc.kiview.model.vo.FAQVo;
import com.mvc.kiview.model.vo.NoticeVo;
import com.mvc.kiview.model.vo.PageMaker;

@Controller // 공지관련
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeBiz n_biz;

	/* 키뷰안내, 공지사항 */

	@RequestMapping("/kiviewnotice.do")

	public String kiview_notice(Model model, Criteria cri) {

		logger.info("NOTICE LIST");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(n_biz.notice_count(cri));

		model.addAttribute("noticelist", n_biz.noticeList(cri));
		model.addAttribute("pageMaker", pageMaker);

		return "notice/kiview_notice";
	}

	/* 공지사항 selectOne */
	@RequestMapping("/kiviewdetail.do")
	public String kiview_detail(Model model, int notice_no, Criteria cri) {

		logger.info("NOTICE DETAIL");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(n_biz.notice_count(cri));

		model.addAttribute("noticedetail", n_biz.n_selectOne(notice_no));
		model.addAttribute("pageMaker", pageMaker);

		return "notice/kiview_notice_detail";
	}

	/* admin 계정으로 로그인 - 글쓰기 버튼 클릭시 write 폼으로 */
	@RequestMapping("/kiviewwrite.do")
	public String kiview_write() {

		logger.info("NOTICE WRITE");

		return "notice/kiview_notice_write";
	}

	/* 글 작성 insert redirect 부분 */
	@RequestMapping("/writeRes.do")
	public String kiview_insertRes(NoticeVo n_vo, @RequestParam("page") int page) {

		logger.info("NOTICE WRITE RESULT");

		int res = n_biz.notice_insert(n_vo);

		if (res > 0) {
			return "redirect:kiviewnotice.do?page=" + page;
		} else {
			return "redirect:kiviewwrite.do";
		}

	}

	/* 수정하기 버튼 클릭 시 update폼으로 */
	@RequestMapping("/noticeUpdate.do")
	public String notice_update(Model model, int notice_no, int page) {

		logger.info("NOTICE UPDATE FORM");

		model.addAttribute("noticeupdate", n_biz.n_selectOne(notice_no));
		model.addAttribute("page", page);

		return "notice/kiview_notice_update";
	}

	/* 수정완료 클릭 시 redirect */
	@RequestMapping("/noticeUpdateRes.do")
	public String notice_updateRes(NoticeVo n_vo, @RequestParam("page") int page) {

		logger.info("NOTICE UPDATE RESULT");

		int res = n_biz.notice_update(n_vo);

		if (res > 0) {
			return "redirect:kiviewdetail.do?notice_no=" + n_vo.getNotice_no() + "&page=" + page;
		} else {
			return "redirect:noticeUpdate.do?notice_no" + n_vo.getNotice_no() + "&page=" + page;
		}

	}

	/* 게시글 삭제 */
	@RequestMapping("/kiviewdel.do")
	public String kiview_delete(int notice_no, int page) {

		logger.info("NOTICE DELETE");

		int res = n_biz.notice_delete(notice_no);

		if (res > 0) {
			return "redirect:kiviewnotice.do?page=" + page;
		} else {
			return "redirect:kiviewdetail.do?notice_no" + notice_no + "&page=" + page;
		}

	}

	/* kiview 소개 페이지 */
	@RequestMapping("/kiviewintro.do")
	public String kiview_intro() {
		return "notice/kiview_intro";
	}

	/* FAQ 처음 로딩시 전체 list */
	@RequestMapping("/kiviewfaq.do")
	public String kiview_faq(Model model, Criteria cri, @RequestParam("faqcatd") String faqcatd) {

		logger.info("FAQ LIST");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(n_biz.faq_count(cri));

		model.addAttribute("faqlist", n_biz.faqList(cri));
		model.addAttribute("pageMaker", pageMaker);

		return "notice/kiview_FAQ";
	}

	/* FAQ 질문 Detail AJAX 처리 메소드 */
	@RequestMapping("/kiviewone.do")
	@ResponseBody
	public Map<String, Object> kiview_faq_one(@RequestParam("faq_no") int faq_no, Criteria cri) {

		logger.info("FAQ SELECT ONE");

		FAQVo faq_one = new FAQVo();
		List<FAQVo> list = new ArrayList<>();

		Map<String, Object> map = new HashMap<>();

		faq_one = n_biz.f_selectOne(faq_no);
		list = n_biz.faqList(cri);
		String content = faq_one.getFaq_content();
		map.put("faq_content", content);
		map.put("list", list);
		map.put("faq_no", faq_no);

		return map;
	}

	/* FAQ 글쓰기 폼 */
	@RequestMapping("/kiviewfaqwrite.do")
	public String kiview_faq_write() {

		logger.info("FAQ INSERT FORM");

		return "notice/kiview_faq_write";
	}

	/* FAQ 글작성 insert redirect */
	@RequestMapping("/faqwriteRes.do")
	public String kiview_faqwriteRes(FAQVo f_vo) {

		logger.info("FAQ INSERT RESULT");

		int res = n_biz.faq_insert(f_vo);

		if (res > 0) {
			return "redirect:kiviewfaq.do?page=1&faqcatd=";
		} else {
			return "redirect:kiviewfaqwrite.do";
		}

	}

	@RequestMapping("/faqupdateform.do")
	public String kiview_faq_update(Model model, int faq_no, @RequestParam("page") int page,
			@RequestParam("faqcatd") String faqcatd) {

		logger.info("FAQ UPDATE FORM");
		model.addAttribute("faqupdate", n_biz.faq_updateOne(faq_no));
		model.addAttribute("page", page);
		model.addAttribute("faqcatd", faqcatd);

		return "notice/kiview_faq_update";
	}

	@RequestMapping("/faqUpdateRes.do")
	public String kiview_faq_updateRes(FAQVo f_vo, @RequestParam("page") int page) {

		logger.info("FAQ UPDATE RESULT");

		int res = 0;
		res = n_biz.faq_update(f_vo);

		if (res > 0) {
			return "redirect:kiviewfaq.do?page=" + page + "&faqcatd=";
		} else {
			return "redirect:faqupdateform.do?faq_no=" + f_vo.getFaq_no() + "&page=" + page + "&faqcatd=";
		}

	}

	@RequestMapping("/faqdelete.do")
	@ResponseBody
	public Map<String, Object> kiview_faq_delete(@RequestParam("faq_no") int faq_no,
			@RequestParam("faqcatd") String faqcatd) {

		logger.info("FAQ DELETE AJAX");

		int res = 0;
		res = n_biz.faq_delete(faq_no);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("faqDel", res);
		map.put("faq_no", faq_no);
		map.put("faqcatd", faqcatd);

		return map;
	}

}