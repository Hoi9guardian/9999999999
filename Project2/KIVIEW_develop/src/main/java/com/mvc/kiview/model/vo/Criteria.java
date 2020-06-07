package com.mvc.kiview.model.vo;

public class Criteria {

	private int page; // 페이지 번호 << 1 2 3 4 5 >> 이런식의 페이지 번호 나타내는 것
	private int perPageNum; // 페이지 갯수 ex)<< 1 2 3 4 5 >> 총 5개의 페이지
	private int rowStart; // 한 페이지당 게시글 개수 start
	private int rowEnd; // 한 페이지당 게시글 개수 end
	// ----> start + end 합쳐서 한 페이지 당 총 10개 보여주기

	// searchType, keyword, sort, catd 추가
	private String searchType; // 검색타입 ex) 공지사항 - 제목/내용/제목+작성자 등
	private String keyword; // 검색어
	private String sort; // 정렬 ex) 공지사항 - 최신순/조회순 정렬
	private String cat_detail; // 카테고리 정렬 ex) 공지사항 - 공지사항/키뷰소식 정렬
	private String faqcatd; // FAQ 분류 카테고리 ex) FAQ - 전체/리뷰/회원/서비스 나누는 목적
	private String type; // review search type

	// 생성자
	public Criteria() {
		this.page = 1; // 첫 페이지 번호 1로 셋팅
		this.perPageNum = 10; // 게시글 10개로 셋팅(여기서는 한 페이지당 10개의 게시물을 보여주기 위해 10으로 셋팅함)
		this.searchType = null;
		this.keyword = null;
		this.sort = null;
		this.cat_detail = null;
		this.faqcatd = null;
		this.type = null;
	}

	public void setPage(int page) {

		// 페이지 번호가 없을 때 1로 맞춰줌
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	// 페이지 개수
	public void setPerPageNum(int pageCount) {

		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public void setCat_detail(String cat_detail) {
		this.cat_detail = cat_detail;
	}

	public void setFaqcatd(String faqcatd) {
		this.faqcatd = faqcatd;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSearchType() {
		return searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public String getSort() {
		return sort;
	}

	public String getCat_detail() {
		return cat_detail;
	}

	public String getFaqcatd() {
		return faqcatd;
	}

	public String getType() {
		return type;
	}

	public int getPage() {
		return page;
	}

	// 페이지 시작 번호
	public int getPageStart() {

		return ((this.page - 1) * perPageNum) + 1;
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}

	// 한 페이지당 게시글 수 start
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}

	// 한 페이지당 게시글 수 end
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

}