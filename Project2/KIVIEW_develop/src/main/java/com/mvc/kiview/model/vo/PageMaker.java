package com.mvc.kiview.model.vo;

import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount; //게시물의 총 갯수
	private int startPage = 1; //시작 페이지 1로 셋팅
	private int endPage; //마지막 페이지
	private boolean prev; //이전
	private boolean next; //다음
	private int displayPageNum = 5; //보여줄 페이지의 개수 ex) << 1 2 3 4 5 >> 이렇게 5개 보여줌
	private Criteria cri; //Criteria에서 선언한 값들

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	private void calcData() {

		// 끝 페이지 번호 = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		// 마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의 갯수
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		// 이전 버튼 생성 여부 = 시작 페이지 번호 == 1 ? false : true (시작페이지가 1이 아니면 생김)
		prev = startPage == 1 ? false : true;
		// 다음 버튼 생성 여부 = 끝 페이지 번호 * 한 페이지당 보여줄 게시글의 갯수 < 총 게시글의 수 ? true: false
		next = endPage * cri.getPerPageNum() < totalCount ? true : false;
	}
	
	//실질적으로 파라미터로 보내지는 값 셋팅 
	public String makeQuery(int page) {
		//ex) kiview/kiviewnotice.do?page=1&perPageNum=10 이렇게 
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", this.cri.getPerPageNum());
		
		//review search type 
		if(this.cri.getType() != null) {
			uriComponentsBuilder.queryParam("type", this.cri.getType()).queryParam("keyword", 
					this.cri.getKeyword());
		}
		
		//FAQ의 분류 카테고리를 눌렀을 때의 파라미터 
		if(this.cri.getFaqcatd() != null) {
		  uriComponentsBuilder.queryParam("faqcatd", this.cri.getFaqcatd()); 
		  }
		 
		
		//공지사항에서 검색조건 선택한 경우
		if (this.cri.getSearchType() != null) {
			uriComponentsBuilder.queryParam("searchType", this.cri.getSearchType()).queryParam("keyword",
					this.cri.getKeyword());
		}
		//최신순, 조회순 선택 한 경우
		if (this.cri.getSort() != null) {
			uriComponentsBuilder.queryParam("sort", this.cri.getSort());
		}
		
		//분류 공지사항, 키뷰소식 선택 한 경우
		if(this.cri.getCat_detail() != null) {
			uriComponentsBuilder.queryParam("catd", this.cri.getCat_detail());
		}
		
		//String 값들을 encode/toString해서 return 
		return uriComponentsBuilder.build().encode().toString();
	}
}