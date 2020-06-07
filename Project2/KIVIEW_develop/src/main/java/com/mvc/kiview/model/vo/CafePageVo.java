package com.mvc.kiview.model.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class CafePageVo {
   private int curpagenum; // 현제 페이지 
   private int totallistcount; //총 게시글 수
   private int pagepercount=10; // 페이지당 보여질 게시글 수   
   private int totalpagecount; // 총 페이지 수
   
   private int displaypagenum = 10; // 페이지 당 보여질 페이지 수 -> << < 1 2 3 4 5 6 7 > >> 7개
   
   
   private int startpage; // 페이지에 보여질 시작 페이지
   private int endpage;   // 페이지에 보여질 끝 페이지
   
   private int rowStart; //한 페이지당 게시글 개수 start
   private int rowEnd; //한 페이지당 게시글 개수 end 
   
   
   private boolean pagenext;
   private boolean pagepre;
   
   private String searchoption;
   private String keyword;
   private int cafe_menu_no;
   private int cafe_board_no;
   private int cafe_no;
   private int cafe_reply;
   private String content;
   
   
   
      
   public CafePageVo() {     
      this.pagepercount = 10;
      this.searchoption = null;
      this.keyword = null;
      this.rowStart = 0;
      this.rowEnd = 0;
      
   }
   
   //현재페이지
   public int getCurpagenum() {
      return curpagenum;
   }
   public void setCurpagenum(int curpagenum) {
      if(curpagenum<=0) {
         this.curpagenum = 1;
         return;
      }
      this.curpagenum =curpagenum;
   }
   // 페이지당 보여질 게시글 수
   public int getPagepercount() {
      return pagepercount;
   }

   
   public void setPagepercount(int pagepercount) {      
      this.pagepercount = pagepercount;
   }
   
   //총 게시글 수
   public int getTotallistcount() {
      return totallistcount;
   }


   public void setTotallistcount(int totallistcount) {
      this.totallistcount = totallistcount;
   }
   
   // 총 페이지 수
   public int getTotalpagecount() {
      return totalpagecount;
   }

   
   public void setTotalpagecount(int pagepercount,int totallistcount) {
      
      if(totallistcount % pagepercount == 0) {
         this.totalpagecount = (totallistcount / pagepercount);
       
      }else {
         this.totalpagecount = ((int)(totallistcount / pagepercount)+1);
         }   
      
   }   

   // 페이지 당 보여질 페이지 수 
   public int getDisplaypagenum() {
      
      return displaypagenum;
   }

   public void setDisplaypagenum(int displaypagenum) {
      this.displaypagenum = displaypagenum;
   }

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
   // 페이지에 보여질 시작 페이지
   public int getStartpage() {
      return startpage;
   }


   public void setStartpage(int curpagenum,int displaypagenum) {
      
      this.startpage = (int)((curpagenum-1)/10)*10+1;
      
   }
   
    // 페이지에 보여질 끝 페이지
   public int getEndpage() {
      return endpage;
   }
   
   
   public void setEndpage(int startpage, int displaypagenum,int totalpagecount) {
     
      this.endpage = startpage + displaypagenum -1;
      
      if(endpage > totalpagecount) {
         
         this.endpage = totalpagecount;
      }

   }
     
   
  
   
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
     
   
   // 리스트 게시글 시작 번호
   public int getRowStart() {
      rowStart = ((curpagenum - 1) * pagepercount) + 1;
      return rowStart;
   }

   public void setRowStart(int rowStart) {
      this.rowStart = rowStart;
   }
    // 리스트 게시글 끝 번호
   public int getRowEnd() {
      rowEnd = rowStart + pagepercount - 1;
      return rowEnd;
   }

   public void setRowEnd(int rowEnd) {
      this.rowEnd = rowEnd;
   }

   
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
   public boolean isPagenext() {
      return pagenext;
   }

   public void setPagenext(int curpagenum,int totalpagecount) {
      
      if(curpagenum == totalpagecount) {
         this.pagenext = false;
      }else {
         this.pagenext = true;
      }
      
   }

   public boolean isPagepre() {
      return pagepre;
   }

   public void setPagepre(int curpagenum) {
      if(curpagenum == 1) {
         this.pagepre = false;
      }else {
         this.pagepre = true;
      }
     
   }   

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
   public int getCafe_board_no() {
      return cafe_board_no;
   }
   
   public void setCafe_board_no(int cafe_board_no) {
      this.cafe_board_no = cafe_board_no;
   }

   

   public String getSearchoption() {
      return searchoption;
   }


   public void setSearchoption(String searchoption) {
      this.searchoption = searchoption;
   }


   public String getKeyword() {
      return keyword;
   }


   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }


   public int getCafe_menu_no() {
      return cafe_menu_no;
   }


   public void setCafe_menu_no(int cafe_menu_no) {
      this.cafe_menu_no = cafe_menu_no;
   }
   
      


      public int getCafe_no() {
      return cafe_no;
   }
   
   public void setCafe_no(int cafe_no) {
      this.cafe_no = cafe_no;
   }
   
   

   public int getCafe_reply() {
      return cafe_reply;
   }

   public void setCafe_rely(int cafe_reply) {
      this.cafe_reply = cafe_reply;
   }
   
   

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }


   @Override
   public String toString() {
      return "CafePageVo [curpagenum=" + curpagenum + ", totallistcount=" + totallistcount + ", pagepercount="
            + pagepercount + ", totalpagecount=" + totalpagecount + ", displaypagenum=" + displaypagenum
            + ", startpage=" + startpage + ", endpage=" + endpage + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
            + ", pagenext=" + pagenext + ", pagepre=" + pagepre + ", searchoption=" + searchoption + ", keyword="
            + keyword + ", cafe_menu_no=" + cafe_menu_no + ", cafe_board_no=" + cafe_board_no + ", cafe_reply=" +cafe_reply+"]";
   }
   
   
    
   
      
}