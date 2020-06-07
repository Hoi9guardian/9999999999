package com.team3.dao;

import java.util.List;



import com.team3.vo.companyVo;
import com.team3.vo.ldetailVo;
import com.team3.vo.lsearch;
import com.team3.vo.member;
import com.team3.vo.reply;
import com.team3.vo.topVo;
import com.team3.vo.zzim;
import com.team3.vo.board;
import com.team3.vo.calendar;

public interface dao {
	
	String boardlist = "SELECT * FROM BOARD_TB WHERE TABLOC = ? ORDER BY BOARDNO DESC";
	String allboardlist = "SELECT * FROM BOARD_TB ORDER BY BOARDNO DESC";
	String boarddetail = "SELECT * FROM BOARD_TB WHERE BOARDNO = ?";
	String headtaglist = "SELECT * FROM BOARD_TB WHERE TABLOC = ? AND HEADTAG = ? ORDER BY BOARDNO DESC " ;
	String write = " INSERT INTO BOARD_TB VALUES(BOARDSEQ.NEXTVAL,?,?,?,?,SYSDATE,?,'N',0) ";
	String category = " SELECT CNAME FROM CATEGORY_TB WHERE CCODE = ? ";
	String category2= " SELECT CCODE FROM CATEGORY_TB WHERE CNAME = ? ";
	String delete = " DELETE FROM BOARD_TB WHERE BOARDNO = ? ";
	String update = " UPDATE BOARD_TB SET HEADTAG=?,TITLE=?,CONTENT=? WHERE BOARDNO=? ";
	String pagecount = " SELECT count(*) FROM BOARD_TB WHERE TABLOC=? ";
	String replylist = "SELECT * FROM COMMENT_TB WHERE BOARDNO = ? ORDER BY REGDATE";
    String replyinsert="INSERT INTO COMMENT_TB VALUES(COMMSEQ.NEXTVAL,?,?,SYSDATE,?)";
    String replyupdate="UPDATE COMMENT_TB SET COMMENTS=? WHERE COMMENTNO=?";
    String replydelete="DELETE FROM COMMENT_TB WHERE COMMENTNO=?";
    String noticeupdate=" UPDATE BOARD_TB SET NOTICE=? WHERE BOARDNO = ? " ;
    String noticelist = " SELECT * FROM BOARD_TB WHERE TABLOC = ? AND NOTICE = 'Y' " ;
    String boardcountupdate = " UPDATE BOARD_TB SET COUNT=COUNT+1 WHERE BOARDNO = ? ";
    String qnareplyyn = " SELECT DISTINCT(B.BOARDNO),B.NICKNAME,B.HEADTAG,B.TITLE,B.CONTENT,B.REGDATE,B.TABLOC,B.NOTICE,B.COUNT,(SELECT COUNT(*) FROM COMMENT_TB WHERE BOARDNO=B.BOARDNO AND NICKNAME='관리자') FROM BOARD_TB B left JOIN COMMENT_TB C ON B.BOARDNO = C.BOARDNO WHERE TABLOC= ? ORDER BY B.BOARDNO DESC ";
    String boardtitle = "SELECT * FROM BOARD_TB WHERE TITLE LIKE '%'||?||'%' AND TABLOC = ? ORDER BY BOARDNO DESC ";
    String boardnickname ="SELECT * FROM BOARD_TB WHERE NICKNAME = ? AND TABLOC = ? ORDER BY BOARDNO DESC ";
    String boardcontent ="SELECT * FROM BOARD_TB WHERE CONTENT LIKE '%'||?||'%' AND TABLOC = ? ORDER BY BOARDNO DESC ";
    String boardboth = "SELECT * FROM BOARD_TB WHERE TITLE LIKE '%'||?||'%' OR CONTENT LIKE '%'||?||'%' AND TABLOC= ? ORDER BY BOARDNO DESC ";
    String loginSelect = "SELECT * FROM MEMBER_TB WHERE USERID = ? AND USERPW = ? AND ISDEL = 'N'";
	String signMember = "INSERT INTO MEMBER_TB VALUES(?, ?, ?, ?, 'N')";
	String selectMember = "SELECT * FROM MEMBER_TB WHERE USERID=?";
	String updateMember = "UPDATE MEMBER_TB SET USERPW=?, NICKNAME=?, EMAIL=? WHERE USERID=?";
	String deleteMember = "UPDATE MEMBER_TB SET ISDEL='Y' WHERE USERID=?";

	public member login(String id, String pwd);//login
	public List<lsearch> all(String ccode);//자격증 분야 전체보기
	public List<topVo> top();
	public List<board> qna(String tabloc);//qna 게시판
	public List<board> study(String tabloc);//소모임 모으기 게시판 2
	public List<board> community(String tabloc);//커뮤니티 게시판 2
	public member mypage(String id);//마이페이지 - 내정보
	public List<calendar> calendar(String userid);//마이페이지 - 달력
	public List<zzim> zzim(String id);//찜목록
	public List<ldetailVo> detail(String lcode);//자격증상세정보
	public List<companyVo> company(String code);//기업정보
	public List<lsearch> conditionlist(String name, String big, String middle, String small);//조건에 따른 자격증 명출력
	public int sign(member m);//회원가입
	public board boarddetail(int boardno);
	public List<board> headtag(String tabloc,String horsehead);//말머리
	public boolean zzimheart(String lcode, String userid);//자격증이름페이지의 찜
	public List countNum();
	public member idfind(String email); //아이디찾기
	public member selectone(String userid);//하나출력
	public int updatepwd(String userid, String userpwd);//랜덤 비밀번호 수정
	public int noticeupdate(int boardno,String notice);// 공지사항 등록/삭제
	public List<board> noticelist(String tabloc); //공지사항 목록
	public String categoryname(String ccode);
	public String categorycode(String cname);
	public int boardcountupdate(int boardno);
	public List<reply> replylist(int boardno);//댓글목록
    public boolean replyinsert(reply rvo);//댓글 추가
   	public boolean replyupdate(reply rvo);//댓글 수정
    public boolean replydelete(int commentno);//댓글 삭제
	public int write(board insert);//글쓰기
	public int update(board b);//글수정 2
	public int delete(int boardno);//글삭제 2
	public boolean qnareplyyn(int boardno); // qna 답변 여부 확인 
	public List<board> titlesearch(String boardkeyword,String tabloc);
	public List<board> nicknamesearch(String boardkeyword,String tabloc);
	public List<board> contentsearch(String boardkeyword,String tabloc);
	public List<board> bothsearch(String boardkeyword,String tabloc);
	public boolean idChk(String id);//아이디체크
	public boolean pwChk(String id, String pw);//패스워드체크
	public int updateinfo(member m, String pwd, String nickname, String email);//update info
	public int deleteinfo(String id);//delete info
	public boolean updateNickChk(String nickname);//닉네임
	public boolean updateEmailChk(String email);//이메일
	public boolean reidChk(String id); //�븘�씠�뵒 以묐났 泥댄겕
	public boolean nickChk(String id); //�땳�꽕�엫 以묐났 泥댄겕
	public boolean emailChk(String id);
	public int countGrade(String nick);//아바타
	public List<lsearch> some();
	public int countComment(int boardno);
}
