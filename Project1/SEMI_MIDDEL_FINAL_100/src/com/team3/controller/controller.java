package com.team3.controller;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.team3.dao.dao;
import com.team3.dao.daoImpl;
import com.team3.paging.pageinfo;
import com.team3.paging.bpageinfo;
import com.team3.vo.board;
import com.team3.vo.calendar;
import com.team3.vo.companyVo;
import com.team3.vo.ldetailVo;
import com.team3.vo.lsearch;
import com.team3.vo.member;
import com.team3.vo.reply;
import com.team3.vo.topVo;
import com.team3.vo.zzim;


@WebServlet("/controller.do")
public class controller extends HttpServlet {
   
   private static final long serialVersionUID = 1L;
   dao d = new daoImpl();

      public controller() {
      
   }

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");

      String command = request.getParameter("command");
      
      
      HttpSession session = request.getSession(true);
      dao d = new daoImpl();

   
      if(command.equals("login")) {
         
         String id = request.getParameter("id");
         String pw = request.getParameter("pw");
         
         boolean idRes = d.idChk(id);
         boolean pwRes = d.pwChk(id, pw);
         
         boolean res = true;
         int countGrade = 0;
         
         member m = null;
         
         if(idRes) {
            if(pwRes) {
               
               m = d.login(id,pw); 
               countGrade = d.countGrade(m.getNickname());
               
               session.setAttribute("grade", countGrade);
               session.setAttribute("vo", m);
               session.setMaxInactiveInterval(60*60);
               
            } else {
               
               res=false;
               
               JSONObject obj = new JSONObject();
               obj.put("res", res);
               
               PrintWriter out = response.getWriter();
               out.println(obj.toJSONString());
            }
         } else {
            
            res=true;
            
            JSONObject obj = new JSONObject();
            obj.put("res", res);
            
            PrintWriter out = response.getWriter();
            out.println(obj.toJSONString());
         }
      
      }

      
      else if (command.equals("logout")) {

         session.invalidate();
         response.sendRedirect("index.jsp");

      }

       
      else if (command.equals("all")) {

         String ccode = request.getParameter("ccode");

         List<lsearch> list = d.all(ccode);

         request.setAttribute("list", list);
         dispatch("allcertiDetail.jsp", request, response);

      }

      
      else if (command.equals("top")) {
         
         member m = (member) session.getAttribute("vo");

         if (m != null) {
            List<zzim> zzimlist = d.zzim(m.getUserid());
            session.setAttribute("zzimlist", zzimlist);
         }

         List<topVo> t = d.top();
         List<lsearch> t3 = d.some();
         
         List tword = new ArrayList(); 
         
         for(topVo t2 : t) {
            
            tword.add(t2.getLname());
            tword.add(t2.getConut());            
         }
         
         for(lsearch tt : t3) {
            
            tword.add(tt.getLname());
            tword.add(tt.getConut());
            
         }
         
         String wordCloud = "C:\\workspace\\semi_project\\SEMI_MIDDEL_FINAL_99\\WebContent\\assets\\csv\\wordcloud.csv";

         String head = "name,freq\r\n";
         String row = "";
         
         for(int i = 0; i<tword.size(); i++) {
            if(i%2 ==1) {
               row += tword.get(i) + "\r\n";
            } else {
               row += tword.get(i) + ",";
            }
         }
         

         BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(wordCloud)));
         writer.write("\uFEFF");
         writer.write(head);
         writer.write(row);
         writer.close();
         
         request.setAttribute("tList", t);

         dispatch("top.jsp", request, response);

      }


      
      else if(command.equals("mypage")) {
         
         member m = (member)session.getAttribute("vo");         
         
         String id = m.getUserid();
         
         member vo = d.mypage(id);
         request.setAttribute("vo",vo);
         
         dispatch("mypage.jsp", request, response);
                     
      }

      
      else if (command.equals("calendar")) {

         String userid = request.getParameter("userid");
         

         List<calendar> c = d.calendar(userid);

         

         request.setAttribute("clist", c);

         dispatch("calendar.jsp", request, response);
      }

      
      else if (command.equals("company")) {

         String code = request.getParameter("ccode3");
         List<companyVo> list = d.company(code);

         request.setAttribute("companylist", list);

         dispatch("company.jsp", request, response);
      }

      
      else if(command.equals("community")) {
         String tabloc = "community";
         String curpagenum = request.getParameter("curpagenum");
                  
         List<board> list = d.community(tabloc);
         int listCount = list.size();
         request.setAttribute("listsize", listCount);
                  
         int currentPage = 0;
         
         if(curpagenum==null || curpagenum=="0") {
            currentPage = 1;
         }else {
            currentPage = Integer.parseInt(request.getParameter("curpagenum"));
         }
         
   
         
         
         bpageinfo page = new bpageinfo();
         page.setCurrentPage(currentPage);
         page.setListCount(listCount);
         page.setAllPage(listCount);
         page.setPreve(currentPage);
         page.setStartRow(currentPage);
         page.setStartPage(currentPage,page.getAllPage());
         page.setEndPage(currentPage, page.getAllPage());
         page.setNext(currentPage, page.getAllPage());
         
         
         request.setAttribute("page", page);
                  
         List<board> noticelist = d.noticelist(tabloc);
         
         request.setAttribute("noticelist", noticelist);   
                                    
         request.setAttribute("list", list);
         request.setAttribute("tabloc", tabloc);
         dispatch("communityboard.jsp", request, response);
         return;
      }


      else if(command.equals("study")) {
         String tabloc = "study";
         List<board> list = d.study(tabloc);
                  
         int listCount = list.size();
         String curpagenum = request.getParameter("curpagenum");
         request.setAttribute("listsize", listCount);
         
         int currentPage = 0;
         if(curpagenum==null || curpagenum=="0") {
            currentPage = 1;
         }else {
            currentPage = Integer.parseInt(request.getParameter("curpagenum"));
         }
         
         
         bpageinfo page = new bpageinfo();
         
         page.setCurrentPage(currentPage);
         page.setListCount(listCount);
         page.setAllPage(listCount);
         page.setPreve(currentPage);
         page.setStartRow(currentPage);
         page.setStartPage(currentPage,page.getAllPage());
         page.setEndPage(currentPage, page.getAllPage());
         page.setNext(currentPage, page.getAllPage());
         
         
         
         List<board> noticelist = d.noticelist(tabloc);
         
         request.setAttribute("noticelist", noticelist);
         request.setAttribute("list", list);
         request.setAttribute("page", page);
         request.setAttribute("tabloc", tabloc);
         
         dispatch("studyboard.jsp", request, response);
         return;      
      }

      
      else if (command.equals("detail")) {

         String lcode = request.getParameter("lcode");
         
         member m = (member) session.getAttribute("vo");
         
         if (m != null) {
            List<zzim> zzimlist = d.zzim(m.getUserid());
            session.setAttribute("zzimlist", zzimlist);
         }         

         List<ldetailVo> list = d.detail(lcode);

         request.setAttribute("dlist", list);
         
         

         dispatch("certidetail.jsp", request, response);
      }

      
      else if (command.equals("reply")) {

         dispatch("freeboardDetail.jsp", request, response);
      }


      
      else if (command.equals("conditionlist")) {

         String name = request.getParameter("name");
         String big = request.getParameter("bigcategory");
         String middle = request.getParameter("middlecategory");
         String small = request.getParameter("smallcategory");

         
         if (name == "") {
            name = null;
         }
         if (small == "") {
            small = null;
         }

         List<lsearch> list = d.conditionlist(name, big, middle, small);

         member m = (member) session.getAttribute("vo");
         
         if (m != null) {
            List<zzim> zzimlist = d.zzim(m.getUserid());
            session.setAttribute("zzimlist", zzimlist);
         }

         session.setAttribute("list", list);

         String curpagenum = request.getParameter("curpagenum");
         

         int currentPage = 0;

         if (curpagenum == null || curpagenum == "0") {
            currentPage = 1;
         } else {
            currentPage = Integer.parseInt(request.getParameter("curpagenum"));
         }

         

         int listCount = list.size();

         pageinfo page = new pageinfo();
         page.setBoardSize(4);
         page.setCurrentPage(currentPage);
         page.setPreve(currentPage);
         page.setStartRow(currentPage);
         page.setListCount(listCount);
         page.setAllPage(listCount);
         page.setStartPage(currentPage, page.getAllPage());
         page.setEndPage(currentPage, page.getAllPage());
         page.setNext(currentPage, page.getAllPage());

         request.setAttribute("page", page);
         

         dispatch("certiname.jsp", request, response);
      }

      
      else if(command.equals("sign")) {
         String userId = request.getParameter("regId");
         String userPw = request.getParameter("regPwd");
         String nickname = request.getParameter("nick");
         String email = request.getParameter("email");
         
         member m = new member();
         m.setUserid(userId);
         m.setUserpw(userPw);
         m.setNickname(nickname);
         m.setEmail(email);
         m.setIsdel("N");
         
         int res = d.sign(m);
         
         if(res>0) {
            
            dispatch("login.jsp",request,response);
         } else {
            
         }
         
      } 

      
      else if (command.equals("boarddetail")) {
            String categoryname = request.getParameter("categoryname");              
            String curpage = request.getParameter("curpagenum");
            String rcurpage = request.getParameter("rcurpagenum");            
            
            
            int boardno = Integer.parseInt(request.getParameter("boardno"));
                        
            int curpagenum = 0;
            if(curpage == null) {
               curpagenum = 1;
            }else {
               curpagenum = Integer.parseInt(request.getParameter("curpagenum"));
            }
            int rcurpagenum = 0;
            if(rcurpage== null) {
               rcurpagenum = 1;
            }else {
               rcurpagenum = Integer.parseInt(rcurpage);
            }
            
            List<reply> rlist = d.replylist(boardno);
            int listCount = rlist.size();   
             
                         
            
            
            pageinfo bpage = new pageinfo();
            bpage.setBoardSize(10);
            bpage.setCurrentPage(rcurpagenum);
            bpage.setPreve(rcurpagenum);
            bpage.setStartRow(rcurpagenum);
            bpage.setListCount(listCount);
            bpage.setAllPage(listCount);
            bpage.setStartPage(rcurpagenum, bpage.getAllPage());
            bpage.setEndPage(rcurpagenum, bpage.getAllPage());
            bpage.setNext(rcurpagenum, bpage.getAllPage());

            int updatecount = d.boardcountupdate(boardno);
            
            board b = d.boarddetail(boardno);
            
            
            
            request.setAttribute("nickname", b.getNickname());
            request.setAttribute("curpagenum", curpagenum);
            request.setAttribute("rlist", rlist);
            request.setAttribute("bvo", b);            
            request.setAttribute("category", d.categorycode((b.getHeadtag())));
            request.setAttribute("rpage", bpage);
            
            
            dispatch("freeboardDetail.jsp", request, response);
            return;

         }

      
      else if (command.equals("zzimheart")) {

         String lcode = request.getParameter("lcode");

         member m = (member) session.getAttribute("vo");

         boolean res = d.zzimheart(lcode, m.getUserid());

         JSONObject obj = new JSONObject();
         obj.put("res", res);

         PrintWriter out = response.getWriter();
         out.println(obj.toJSONString());
      }

      
      else if (command.equals("count")) {

         List list = d.countNum();

         request.setAttribute("countlist", list);
         dispatch("home.jsp", request, response);

      }

      
      else if (command.equals("idfind")) {

         String email = request.getParameter("email");

         member m = d.idfind(email);


         JSONObject obj = new JSONObject();
         obj.put("userid", m.getUserid());
         obj.put("email", m.getEmail());

         PrintWriter out = response.getWriter();
         out.println(obj.toJSONString());

      }

      
      else if (command.equals("pwdfind")) {

         String userid = request.getParameter("id");
         String email = request.getParameter("email");

         
         member m = d.selectone(userid);
         JSONObject obj = new JSONObject();
         PrintWriter out = response.getWriter();

         if (m == null || !m.getEmail().equals(email)) {

            obj.put("msg", "※ 아이디나 이메일 정보가 맞지 않습니다");

            out.println(obj.toJSONString());
            return;

         }

         String host = "smtp.naver.com";
         String user = "juihy1005";
         String password = "wndp0303";

         String to_email = m.getEmail();

         Properties props = new Properties();
         props.put("mail.smtp.host", host);
         props.put("mail.smtp.port", 465);
         props.put("mail.smtp.auth", "true");
         props.put("mail.smtp.ssl.enable", "true");

         StringBuffer temp = new StringBuffer();
         Random rnd = new Random();

         for (int i = 0; i < 10; i++) {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
               temp.append((char) ((int) (rnd.nextInt(26)) + 97));
               break;
            case 1:
               temp.append((char) ((int) (rnd.nextInt(26)) + 65));
               break;
            case 2:
               temp.append((rnd.nextInt(10)));
               break;
            }
         }

         String AuthenticationKey = temp.toString();
         

         Session session2 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(user, password);
            }
         });

         MimeMessage msg = new MimeMessage(session2);

         try {

            msg.setFrom(new InternetAddress(user, "YOU DESERVE IT"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

            msg.setSubject("넌 그럴 자격이 있어 비밀번호 인증 메일입니다.");
            msg.setText(m.getUserid() + "님의 임시 비밀번호는 :" + temp + "입니다.");

            Transport.send(msg);
            

         } catch (MessagingException e) {
         
            e.printStackTrace();
         }

         HttpSession saveKey = request.getSession();
         saveKey.setAttribute("AuthenticationKey", AuthenticationKey);

         obj.put("msg2", "이메일이 전송되었습니다.");
         obj.put("userid", userid);
         obj.put("newpwd", AuthenticationKey);

         out.println(obj.toJSONString());

      }

      else if (command.equals("updatepwd")) {

         String userid = request.getParameter("userid");
         String userpwd = request.getParameter("userpwd");

         int res = d.updatepwd(userid, userpwd);

      }

      else if (command.equals("send")) {

         String id = request.getParameter("id");
         String email = request.getParameter("email");
         String context = request.getParameter("context");

         String host = "smtp.naver.com";
         String user = "juihy1005";
         String password = "wndp0303";
         String to_email = "juihy1005@naver.com";

         Properties props = new Properties();
         props.put("mail.smtp.host", host);
         props.put("mail.smtp.port", 465);
         props.put("mail.smtp.auth", "true");
         props.put("mail.smtp.ssl.enable", "true");

         Session session2 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(user, password);
            }
         });

         MimeMessage msg = new MimeMessage(session2);

         try {

            msg.setFrom(new InternetAddress(user, email));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
            msg.setSubject(id + "님이 보내신 contact메일 입니다.");
            msg.setText(context);
            Transport.send(msg);
            

         } catch (MessagingException e) {
            e.printStackTrace();
         }
         dispatch("contactus.jsp", request, response);

      }

      else if (command.equals("paging")) {

         List<lsearch> list = (List<lsearch>) session.getAttribute("list");
         List<zzim> zzimlist = (List<zzim>) session.getAttribute("zzimlist");

         String curpagenum = request.getParameter("curpagenum");
         

         int currentPage = 0;

         if (curpagenum == null || curpagenum == "0") {
            currentPage = 1;
         } else {
            currentPage = Integer.parseInt(request.getParameter("curpagenum"));
         }
         

         int listCount = list.size();

         pageinfo page = new pageinfo();
         page.setBoardSize(4);
         page.setCurrentPage(currentPage);
         page.setPreve(currentPage);
         page.setStartRow(currentPage);
         page.setListCount(listCount);
         page.setAllPage(listCount);
         page.setStartPage(currentPage, page.getAllPage());
         page.setEndPage(currentPage, page.getAllPage());
         page.setNext(currentPage, page.getAllPage());

         request.setAttribute("page", page);
         

         dispatch("certiname.jsp", request, response);
      }

   
      else if (command.equals("qna")) {

         String tabloc = "qna";
         List<board> list = d.qna(tabloc);         
         int listCount = list.size();
         request.setAttribute("listsize", listCount);
         
         String curpagenum = request.getParameter("curpagenum");
         
         int currentPage = 0;

         if (curpagenum == null || curpagenum == "0") {
            currentPage = 1;
         } else {
            currentPage = Integer.parseInt(request.getParameter("curpagenum"));
         }

         bpageinfo page = new bpageinfo();

         page.setCurrentPage(currentPage);
         page.setListCount(listCount);
         page.setAllPage(listCount);
         page.setPreve(currentPage);
         page.setStartRow(currentPage);
         page.setStartPage(currentPage, page.getAllPage());
         page.setEndPage(currentPage, page.getAllPage());
         page.setNext(currentPage, page.getAllPage());

         request.setAttribute("page", page);

         List<board> noticelist = d.noticelist(tabloc);
         request.setAttribute("noticelist", noticelist);

         request.setAttribute("list", list);
         request.setAttribute("tabloc", tabloc);

         dispatch("freeboard.jsp", request, response);

      }

      
      else if (command.equals("headtag")) {
         String horsehead = request.getParameter("horsehead");
         String tabloc = request.getParameter("tabloc");
                  
         session.setAttribute("horsehead2", horsehead);

         if (horsehead.equals("horsehead")) {
            if (tabloc.equals("qna")) {
               response.sendRedirect("controller.do?command=qna");
               return;
            } else if (tabloc.equals("community")) {
               response.sendRedirect("controller.do?command=community");
               return;
            } else if (tabloc.equals("study")) {
               response.sendRedirect("controller.do?command=study");
               return;
            }
         }

         List<board> list = d.headtag(tabloc, horsehead);

         String curpagenum = request.getParameter("curpagenum");
         
         int currentPage = 0;

         if (curpagenum == null || curpagenum == "0") {
            currentPage = 1;
         } else {
            currentPage = Integer.parseInt(request.getParameter("curpagenum"));
         }
         int listCount = list.size();

         bpageinfo page = new bpageinfo();
         page.setCurrentPage(currentPage);
         page.setListCount(listCount);
         page.setAllPage(listCount);
         page.setPreve(currentPage);
         page.setStartRow(currentPage);
         page.setStartPage(currentPage, page.getAllPage());
         page.setEndPage(currentPage, page.getAllPage());
         page.setNext(currentPage, page.getAllPage());
         

         request.setAttribute("categorypage", page);

         List<board> noticelist = d.noticelist("tabloc");
         request.setAttribute("noticelist", noticelist);
         request.setAttribute("clistsize", listCount);
         request.setAttribute("categorylist", list);

         if (tabloc.equals("qna")) {
            request.setAttribute("tabloc", tabloc);
            dispatch("freeboard.jsp", request, response);
            return;
         } else if (tabloc.equals("community")) {
            request.setAttribute("tabloc", tabloc);
            dispatch("communityboard.jsp", request, response);
            return;
         } else if (tabloc.equals("study")) {
            request.setAttribute("tabloc", tabloc);
            dispatch("studyboard.jsp", request, response);
            return;
         }

      }

      else if (command.equals("boardnotice")) {
         int boardno = Integer.parseInt(request.getParameter("boardno"));
         String tabloc = request.getParameter("tabloc");
         String notice = request.getParameter("notice");

         if (notice.equals("Y")) {
            notice = "N";
         } else if (notice.equals("N")) {
            notice = "Y";
         } else {
            notice = "N";
         }

         int res = d.noticeupdate(boardno, notice);
         if (res > 0) {
            System.out.println("업데이트 성공");
         } else {
            System.out.println("업데이트 실패");
         }

         if (tabloc.equals("qna")) {
            dispatch("controller.do?command=qna", request, response);
         } else if (tabloc.equals("community")) {
            dispatch("controller.do?command=community", request, response);
         } else if (tabloc.equals("study")) {
            dispatch("controller.do?command=study", request, response);
         }

      }

      
      else if (command.equals("replyinsert")) {
            String comments = request.getParameter("comments");
            String nickname = request.getParameter("nickname");
            int boardno = Integer.parseInt(request.getParameter("boardno"));
            String curpagenum = request.getParameter("curpagenum");
            String rcurpage = request.getParameter("rcurpagenum");
             
            
            
            request.setAttribute("curpagenum", curpagenum);
            request.setAttribute("boardno", boardno);
            
            reply rvo = new reply(boardno, nickname, comments);
            boolean res = d.replyinsert(rvo);
            
            List<reply> rlist = d.replylist(boardno);
            int listCount = rlist.size();
            
            int rcurpagenum = 0;
            if(rlist.size()%10 == 0) {
              rcurpagenum =  rlist.size()/10 ;
            }else {
               rcurpagenum = (rlist.size()/10) +1;
            }
            
            
            
            if (res) {            
               dispatch("controller.do?command=boarddetail&rcurpagenum="+rcurpagenum,request,response);
            } else {
               dispatch("controller.do?command=boarddetail&rcurpagenum="+rcurpagenum,request,response);
            }
         }

         
         else if (command.equals("replyupdate")) {
            int boardno = Integer.parseInt(request.getParameter("boardno"));
            int commentno = Integer.parseInt(request.getParameter("commentno"));
            String curpagenum = request.getParameter("curpagenum");
            String comments = request.getParameter("comments");
            String rcurpagenum = request.getParameter("rcurpagenum");
            reply rvo = new reply(commentno, comments);
            boolean res = d.replyupdate(rvo);
            
            
            request.setAttribute("rcurpagenum", rcurpagenum);
            request.setAttribute("curpagenum", curpagenum);
            request.setAttribute("boardno", boardno);
            if (res) {            
               dispatch("controller.do?command=boarddetail",request,response);
            } else {
               dispatch("controller.do?command=boarddetail",request,response);
            }

         }

         
         else if (command.equals("replydelete")) {
           
            int boardno = Integer.parseInt(request.getParameter("boardno"));
            int commentno = Integer.parseInt(request.getParameter("commentno"));
            String curpagenum = request.getParameter("curpagenum");
            int rcurpagenum = Integer.parseInt(request.getParameter("rcurpagenum"));
            boolean res = d.replydelete(commentno);
            
            List<reply> rlist = d.replylist(boardno);
            int listCount = rlist.size();
            
            if(rcurpagenum !=1 && listCount % 10 == 0) {
               rcurpagenum = rcurpagenum -1;                
            }
                       
           
            
            request.setAttribute("curpagenum", curpagenum);
            request.setAttribute("boardno", boardno);
                       
            if (res) {            
               dispatch("controller.do?command=boarddetail&rcurpagenum="+rcurpagenum,request,response);
            } else {
               dispatch("controller.do?command=boarddetail&rcurpagenum="+rcurpagenum,request,response);
            }
            
         }

      
      else if (command.equals("writebefore")) {

         String tabloc = request.getParameter("tabloc");
         String tablocname = "";

         switch (tabloc) {
         case "qna":
            tablocname = "Q & A";
            break;
         case "community":
            tablocname = "커뮤니티";
            break;
         case "study":
            tablocname = "소모임만들기";
            break;
         }
         ;
         
         request.setAttribute("tabloc", tabloc);
         request.setAttribute("tablocname", tablocname);
         dispatch("boardinsert.jsp", request, response);

      }

      
      else if (command.equals("write")) {
         String nickname = request.getParameter("nickname");
         String boardcategory = request.getParameter("boardcategory");
         String horsehead = request.getParameter("horsehead");
         String tabloc = request.getParameter("boardcategory");
         String tablocname = "";
         
         if (horsehead == null) {
            horsehead = "";
         }
         String title = request.getParameter("title");
         String content = request.getParameter("content");

         if(title == null || title  == "" || content == null || content =="") {
            
            switch (tabloc) {
            case "qna":
               tablocname = "Q & A";
               break;
            case "community":
               tablocname = "커뮤니티";
               break;
            case "study":
               tablocname = "소모임만들기";
               break;
            }
            ;
            request.setAttribute("tabloc", tabloc);
            request.setAttribute("tablocname", tablocname);
            
            dispatch("boardinsert.jsp", request, response);
            
            return;
            
         }
         
         board insert = new board();
         insert.setContent(content);
         insert.setTitle(title);
         insert.setHeadtag(horsehead);
         insert.setNickname(nickname);
         insert.setTabloc(boardcategory);

         int result = 0;

         result = d.write(insert);

         if (result > 0) {
            System.out.println("삽입성공");
         } else {
            System.out.println("삽입실패");
         }

         if (boardcategory.equals("qna")) {
            dispatch("controller.do?command=qna", request, response);
         } else if (boardcategory.equals("study")) {
            dispatch("controller.do?command=study", request, response);
         } else if (boardcategory.equals("community")) {
            dispatch("controller.do?command=community", request, response);
         }

      }
      
      
      else if(command.equals("beforeupdate")) {
         
         int boardno = Integer.parseInt(request.getParameter("boardno"));
         String categoryname = request.getParameter("categoryname");
         
         String categorycode = d.categorycode(categoryname);
         
         
         
         int curpagenum = Integer.parseInt(request.getParameter("curpagenum"));         
         
         board b = d.boarddetail(boardno);
         
         request.setAttribute("curpagenum", curpagenum);
         request.setAttribute("bvo", b);                  
         request.setAttribute("categorycode",categorycode);   
                  
         dispatch("boardupdate.jsp",request,response);
         
                  
      }


      else if(command.equals("update")) {
         int curpagenum = Integer.parseInt(request.getParameter("curpagenum"));
         int boardno = Integer.parseInt(request.getParameter("boardno"));
         String categorycode = request.getParameter("categorycode");
         
         String title = request.getParameter("title");
         String content = request.getParameter("content");
         String tabloc = request.getParameter("tabloc");
         
         
         board b = new board();
         b.setBoardno(boardno);
         b.setContent(content);
         b.setTitle(title);
         b.setHeadtag(categorycode);
         
         int res = d.update(b);
         
         board b1 = d.boarddetail(boardno);
                        
         if(res>0) {
            request.setAttribute("boardno", boardno);
            request.setAttribute("categorycode", categorycode);
            request.setAttribute("curpagenum", curpagenum);
            
            dispatch("controller.do?command=boarddetail",request,response);
            
         } else {            
            request.setAttribute("boardno", boardno);
            request.setAttribute("categorycode", categorycode);
            request.setAttribute("curpagenum", curpagenum);
            dispatch("controller.do?command=boarddetail",request,response);
         }

      }
      
      else if(command.equals("delete")) {
         String tabloc = request.getParameter("tabloc");            
         int boardno = Integer.parseInt(request.getParameter("boardno"));
         int res =d.delete(boardno);
         if(res>0) {
            System.out.println("게시글 데이터 삭제 완료!");
         }else {
            System.out.println("게시글 데이터 삭제 실패!");
         }
         
         int curpagenum = Integer.parseInt(request.getParameter("curpagenum"));
         
         if(curpagenum==1) {
            
            if(tabloc.equals("qna")) {
               dispatch("controller.do?command=qna", request, response);               
            } else if(tabloc.equals("study")) {
               dispatch("controller.do?command=study", request, response);
            } else if(tabloc.equals("community")) {
               dispatch("controller.do?command=community", request, response);
            }
         }else {
            if(tabloc.equals("qna")) {
               List<board> list = d.qna(tabloc);         
               int listCount = list.size();
               if(listCount % 10 == 0) {
                  curpagenum = curpagenum-1;
               }
               dispatch("controller.do?command=qna&curpagenum="+curpagenum, request, response);               
            } else if(tabloc.equals("study")) {
               List<board> list = d.study(tabloc);         
               int listCount = list.size();
               if(listCount % 10 == 0) {
                  curpagenum = curpagenum-1;
               }
               dispatch("controller.do?command=study&curpagenum="+curpagenum, request, response);
            } else if(tabloc.equals("community")) {
               List<board> list = d.community(tabloc);         
               int listCount = list.size();
               if(listCount % 10 == 0) {
                  curpagenum = curpagenum-1;
               }
               dispatch("controller.do?command=community&curpagenum="+curpagenum, request, response);
            }
         
         }
               
      }

      else if(command.equals("searchboard")) {
         
         String searchtag = request.getParameter("searchtag");
         request.setAttribute("searchtag",searchtag);
         String boardkeyword = request.getParameter("boardkeyword");
         request.setAttribute("boardkeyword",boardkeyword);
         
         String tabloc = request.getParameter("tabloc");
         request.setAttribute("tabloc",tabloc);
         String curpagenum = request.getParameter("curpagenum");
         int currentPage = 0;
         
         if(curpagenum==null || curpagenum=="0") {
            currentPage = 1;
         }else {
            currentPage = Integer.parseInt(request.getParameter("curpagenum"));
         }
            
         if(searchtag.equals("title")) {
            List<board> list = d.titlesearch(boardkeyword,tabloc);
            request.setAttribute("slist", list);
            int listCount = list.size();
            request.setAttribute("slistsize", listCount);
            bpageinfo page = new bpageinfo();
            page.setCurrentPage(currentPage);
            page.setListCount(listCount);
            page.setAllPage(listCount);
            page.setPreve(currentPage);
            page.setStartRow(currentPage);
            page.setStartPage(currentPage,page.getAllPage());
            page.setEndPage(currentPage, page.getAllPage());
            page.setNext(currentPage, page.getAllPage());
            
            
            request.setAttribute("searchpage", page);
            
            if(tabloc.equals("qna")) {
               dispatch("freeboard.jsp", request, response);               
            }else if(tabloc.equals("community")) {
               dispatch("communityboard.jsp", request, response);   
            }else if(tabloc.equals("study")) {
               dispatch("studyboard.jsp", request, response);   
            }
         }else if(searchtag.equals("nickname")) {
            List<board> list = d.nicknamesearch(boardkeyword,tabloc);
            request.setAttribute("slist", list);
            int listCount = list.size();
            request.setAttribute("slistsize", listCount);
            bpageinfo page = new bpageinfo();
            page.setCurrentPage(currentPage);
            page.setListCount(listCount);
            page.setAllPage(listCount);
            page.setPreve(currentPage);
            page.setStartRow(currentPage);
            page.setStartPage(currentPage,page.getAllPage());
            page.setEndPage(currentPage, page.getAllPage());
            page.setNext(currentPage, page.getAllPage());
                        
            request.setAttribute("searchpage", page);
            request.setAttribute("listsize", listCount);
            if(tabloc.equals("qna")) {
               dispatch("freeboard.jsp", request, response);               
            }else if(tabloc.equals("community")) {
               dispatch("communityboard.jsp", request, response);   
            }else if(tabloc.equals("study")) {
               dispatch("studyboard.jsp", request, response);   
            }
         }else if(searchtag.equals("content")) {
            List<board> list = d.contentsearch(boardkeyword,tabloc);
            request.setAttribute("slist", list);
            int listCount = list.size();
            request.setAttribute("slistsize", listCount);
            bpageinfo page = new bpageinfo();
            page.setCurrentPage(currentPage);
            page.setListCount(listCount);
            page.setAllPage(listCount);
            page.setPreve(currentPage);
            page.setStartRow(currentPage);
            page.setStartPage(currentPage,page.getAllPage());
            page.setEndPage(currentPage, page.getAllPage());
            page.setNext(currentPage, page.getAllPage());
                        
            request.setAttribute("searchpage", page);
            
            if(tabloc.equals("qna")) {
               dispatch("freeboard.jsp", request, response);               
            }else if(tabloc.equals("community")) {
               dispatch("communityboard.jsp", request, response);   
            }else if(tabloc.equals("study")) {
               dispatch("studyboard.jsp", request, response);   
            }
         }else if(searchtag.equals("both")) {
            List<board> list = d.bothsearch(boardkeyword, tabloc);
            request.setAttribute("slist", list);
            int listCount = list.size();
            request.setAttribute("slistsize", listCount);
            bpageinfo page = new bpageinfo();
            page.setCurrentPage(currentPage);
            page.setListCount(listCount);
            page.setAllPage(listCount);
            page.setPreve(currentPage);
            page.setStartRow(currentPage);
            page.setStartPage(currentPage,page.getAllPage());
            page.setEndPage(currentPage, page.getAllPage());
            page.setNext(currentPage, page.getAllPage());
            
            
            request.setAttribute("searchpage", page);
            
            if(tabloc.equals("qna")) {
               dispatch("freeboard.jsp", request, response);               
            }else if(tabloc.equals("community")) {
               dispatch("communityboard.jsp", request, response);   
            }else if(tabloc.equals("study")) {
               dispatch("studyboard.jsp", request, response);   
            }
         }
      }
      
      
      else if(command.equals("updateinfo")) {
         member m = (member)session.getAttribute("vo");
         String id = m.getUserid();
         String pw = request.getParameter("pwd");
         String nickname = request.getParameter("nick");
         String email = request.getParameter("email");
         
         int res = d.updateinfo(m, pw, nickname, email);
         
         if(res>0) {            
                  
            member vo = d.mypage(id);
            request.setAttribute("vo",vo);
            session.setAttribute("vo", vo);
            
            dispatch("mypage.jsp",request,response);   

         }
         
         
      }

      else if(command.equals("updateNickChk")) {
         String nickname = request.getParameter("nick");
         boolean res = true;
         if(nickname=="") {
            res=false;
         } else {
            res=d.updateNickChk(nickname);
         }
         
         JSONObject obj = new JSONObject();
         obj.put("res", res);
               
         PrintWriter out = response.getWriter();
         out.println(obj.toJSONString());
      }
      
         else if(command.equals("updateEmailChk")) {
         String email = request.getParameter("email");
         boolean res = true;
         if(email=="") {
            res=false;
         } else {
            res=d.updateEmailChk(email);
         }
         
         JSONObject obj = new JSONObject();
         obj.put("res", res);
         
         PrintWriter out = response.getWriter();
         out.println(obj.toJSONString());
      }


      else if(command.equals("deleteinfo")) {
         member m = (member)session.getAttribute("vo");         
         String id = m.getUserid();
         
         int res = d.deleteinfo(id);
         
         if(res>0) {            
            session.invalidate();
            dispatch("index.jsp",request,response);
         }
         
      }


      else if(command.equals("zzim")) {
         member m = (member)session.getAttribute("vo");         
         String id = m.getUserid();
         
         List<zzim> zzimlist=d.zzim(id);         

         String curpagenum = request.getParameter("curpagenum");                  
         int currentPage = 0;
         
         if(curpagenum==null || curpagenum=="0") {
            currentPage = 1;
         }else {
            currentPage = Integer.parseInt(request.getParameter("curpagenum"));
         }      
                  
         int listCount = zzimlist.size();
         
         pageinfo page = new pageinfo();
         page.setBoardSize(4);
         page.setCurrentPage(currentPage);
         page.setPreve(currentPage);
         page.setStartRow(currentPage);
         page.setListCount(listCount);
         page.setAllPage(listCount);
         page.setStartPage(currentPage, page.getAllPage());
         page.setEndPage(currentPage, page.getAllPage());
         page.setNext(currentPage, page.getAllPage());
         
         
         request.setAttribute("zzimpage", page);
         request.setAttribute("zzimlist", zzimlist);
         dispatch("selectCerti.jsp",request,response);
      }
            
         else if(command.equals("zzimdelete")) {
                  
         member m = (member)session.getAttribute("vo");         
         String id = m.getUserid();
         String lcode = request.getParameter("lcode");
         
         boolean res = d.zzimheart(lcode, id);
         
         if(res!=true) {
            List<zzim> zzimlist=d.zzim(id);            
            
            String curpagenum = request.getParameter("curpagenum");
                     
            int currentPage = 0;
            
            if(curpagenum==null || curpagenum=="0") {
               currentPage = 1;
            }else {
               currentPage = Integer.parseInt(request.getParameter("curpagenum"));
            }
            
            int listCount = zzimlist.size();
            
            if(currentPage != 1 && listCount % 4 == 0 ) {
               currentPage = currentPage-1;
            }
            
            pageinfo page = new pageinfo();
            page.setBoardSize(4);
            page.setCurrentPage(currentPage);
            page.setPreve(currentPage);
            page.setStartRow(currentPage);
            page.setListCount(listCount);
            page.setAllPage(listCount);
            page.setStartPage(currentPage, page.getAllPage());
            page.setEndPage(currentPage, page.getAllPage());
            page.setNext(currentPage, page.getAllPage());
            
            
            request.setAttribute("zzimpage", page);            
            request.setAttribute("zzimlist", zzimlist);
            dispatch("selectCerti.jsp",request,response);
         }
         
         
      }

   
      else if(command.equals("IdChk")) {
         String id = request.getParameter("regId");
         boolean res = true;
         if(id=="") {
            res = false;
         }else {
             res = d.reidChk(id);
         }
            
         JSONObject obj = new JSONObject();
         
         obj.put("res",res);
         
         PrintWriter out = response.getWriter();
         out.println(obj.toJSONString());
         
      }
      
      
      else if(command.equals("NickChk")) { 
         String id = request.getParameter("nick");
         boolean res = true;
         if(id=="") {
            res = false;
         }else {
             res = d.nickChk(id);
         }
                  
         JSONObject obj = new JSONObject();
         
         obj.put("res",res);
         
         PrintWriter out = response.getWriter();
         out.println(obj.toJSONString());
         
      }
      
      
      
        else if(command.equals("EmailChk")) { 
           String id = request.getParameter("email");
           String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
           boolean res = false;
           
           if(id=="" || !(id.matches(regex))) {
              res = false;
           }else {
               res = d.emailChk(id);
           }
           
           
           JSONObject obj = new JSONObject();
           
           obj.put("res",res);
           
           PrintWriter out = response.getWriter();
           out.println(obj.toJSONString());
           
        }

   }

   
   public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) {

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      try {

         dispatcher.forward(request, response);

      } catch (ServletException | IOException e) {
         
         e.printStackTrace();
      }

   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      doGet(request, response);
   }

}