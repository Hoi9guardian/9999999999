package com.mvc.kiview.model.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mvc.kiview.model.biz.MemberBiz;
import com.mvc.kiview.model.vo.KakaoApi;
import com.mvc.kiview.model.vo.MemberVo;
import com.mvc.kiview.model.vo.NaverLoginBO;

@Controller // 회원관련
public class MemberController {

   private Logger logger = LoggerFactory.getLogger(MemberController.class);

   @Autowired 
   private MemberBiz biz;

   @Autowired
   BCryptPasswordEncoder passwordEncoder;
   
   private String arrLast = null;
   
   
   //@@ 로그인 @@ /////////////////////////////////////////////////////////////////////////
   //로그인 ajax
   @RequestMapping(value = "/ajaxlogin.do", method = RequestMethod.POST)
   @ResponseBody
   public Map<String, String> ajaxLogin(HttpSession session, @RequestBody MemberVo vo) {
      logger.info("ajaxLogin");
      System.out.println(vo);
      MemberVo res = biz.selectOne(vo);
      
      String check = null;
      String vopw = vo.getMember_pwd();   //사용자가 입력한 비밀번호
      String respw = res.getMember_pwd();   //db에서 가져온 비밀번호 (암호화된 번호)
      
      Map<String, String> map = new HashMap<String, String>();
      
      if(vo.getMember_id().contains("@")) {
         check = "2";
         
      } else if (passwordEncoder.matches(vopw, respw) ) {
         session.setAttribute("login", res);

         //세션 유지 시간 1시간으로 설정
         session.setMaxInactiveInterval(60*60) ;
         
         //이전 페이지로 이동
         if( arrLast.contains("review") ) {
            map.put("arrLast", arrLast);
         } else if( arrLast.contains("cafe") ){
            map.put("arrLast", "cafehome.do?member_no=" + res.getMember_no() + "&member_id=" + res.getMember_id() );
         } else {
            map.put("arrLast", null);
         }

         check = "1";
      }
         
      map.put("check", check);

      return map;
   }
   
   //로그인 아이디 찾기
   @RequestMapping(value = "/kiviewidsearch.do", method = RequestMethod.POST)
   @ResponseBody
   public Map<String, MemberVo> kiview_idSearch(@RequestBody MemberVo vo) {
      logger.info("idSearch");
      MemberVo res = biz.idSearch(vo);

      System.out.println(res.getMember_name() + "/" + res.getMember_email() + "/" + res.getMember_id());

      Map<String, MemberVo> map = new HashMap<String, MemberVo>();
      map.put("idSearch", res);

      return map;
   }
   
   //로그아웃
   @RequestMapping("/kiviewlogout.do")
   public String kiview_logout(HttpSession session) {
      logger.info("loginout");
      session.invalidate(); 
      return "redirect:index.do";
   }

   //@@ 회원가입 @@ /////////////////////////////////////////////////////////////////////////
   //회원가입 종류 선택
   @RequestMapping("/kiviewsignupoption.do")
   public String kiview_signupOption(Model model, HttpSession session) throws Exception {
      logger.info("signupOption");

      /* 네이버,카카오 code 발행 */
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      String kakaoAuthUrl = kakaoApi.getAuthorizationUrl(session);

      /* 생성한 인증 URL을 View로 전달 */
      model.addAttribute("naver_url", naverAuthUrl);
      model.addAttribute("kakao_url", kakaoAuthUrl);

      System.out.println("model :" + model);

      /* 생성한 인증 URL을 Model에 담아서 전달 */
      return "member/kiview_signup-option";
   }
   
   //kiview 회원가입 페이지
   @RequestMapping("/kiviewsignup.do")
   public String kiview_signup() {
      logger.info("signup");
      return "member/kiview_signup";
   }
   
   //회원가입 아이디 중복확인
   @RequestMapping(value = "/kiviewsignupidchk.do", method = RequestMethod.POST)
   @ResponseBody
   public Map<String, Boolean> kiview_signupIdChk(@RequestBody MemberVo vo) {
      logger.info("signupIdChk");
      MemberVo res = biz.signupIdChk(vo);
      System.out.println(res.getMember_id());
      boolean signupIdChk = false;

      if (res != null) {
         signupIdChk = true;
      }
      Map<String, Boolean> map = new HashMap<String, Boolean>();
      map.put("signupIdChk", signupIdChk);

      return map;
   } 

   //회원가입 결과
   @RequestMapping("/kiviewsignupres.do")
   public String kiview_signup(MemberVo vo) {
      logger.info("signupRes");
      
      vo.setMember_pwd(passwordEncoder.encode(vo.getMember_pwd()));
      System.out.println("암호화된 비밀번호: " + vo.getMember_pwd());
      
      int res = biz.signup(vo);
       
      if(res > 0) {
         return "redirect:login.do";
      }else {
         return "redirect:kiviewsignup.do";
      }

   }
   
   //도로명 api
   @RequestMapping("/kiviewjusopopup")
   public String kiview_jusoPopup() {
      logger.info("addrPopup");
      return "member/addrPopup";
   }
   
   
   //@@ 마이페이지 @@ /////////////////////////////////////////////////////////////////////////
   //마이페이지 - 회원정보
   @RequestMapping("/kiviewmypage.do")
   public String mypage(HttpSession session) {
      logger.info("mypage");
      
      MemberVo sessionVo = (MemberVo)session.getAttribute("login");
      String getSessionId= sessionVo.getMember_id();
      System.out.println("session 아이디: " + getSessionId);
      
      if(session==null) {
         return "member/kiview_login";
      } else if(getSessionId.contains("@")) {
         return "member/kiview_mypage_sns"; 
      }else {
         return "member/kiview_mypage"; 
      }
      
   }
   
  
   
   //회원정보 수정
   @RequestMapping("/kiviewupdate.do")
   public String memberUpdate (HttpSession session, MemberVo vo) {
      logger.info("memberUpdate");
      vo.setMember_pwd(passwordEncoder.encode(vo.getMember_pwd()));   //수정된 객체 비밀번호 암호화
      int res = biz.updateMember(vo);
      
      //세션에 수정된 로그인정보 담기
      MemberVo res2 = biz.selectOne(vo);
      
      System.out.println("수정된 멤버객체: "+res2);
       
      //session.invalidate();
      session.setAttribute("login", res2);

      //세션 유지 시간 1시간으로 설정
      session.setMaxInactiveInterval(60*60) ;
      
      return "redirect:kiviewmypage.do";
   }
    

   //회원 탈퇴
   @RequestMapping(value="/kiviewdelete.do", method=RequestMethod.POST)
   public String deleteMember(HttpSession session) {
      logger.info("deleteMember");
      MemberVo vo = (MemberVo) session.getAttribute("login");
      int res = biz.deleteMember(vo);
      session.invalidate();
      return "redirect:index.do";
   }
   
   //소셜 로그인
   /* NaverLoginBO */
   private NaverLoginBO naverLoginBO;
   private String apiResult = null;

   /* KakaoLogin */
   private KakaoApi kakaoApi;

   @Autowired
   private void setKakaoApi(KakaoApi kakaoApi) {
      this.kakaoApi = kakaoApi;
   }
   @Autowired
   private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
      this.naverLoginBO = naverLoginBO;
   }

   @RequestMapping("/login.do")
   public String initLogin(Model model, HttpSession session, HttpServletRequest request) throws Exception {
      logger.info("login");
      /* 네이버,카카오 code 발행 */
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      String kakaoAuthUrl = kakaoApi.getAuthorizationUrl(session);

      /* 생성한 인증 URL을 View로 전달 */
      model.addAttribute("naver_url", naverAuthUrl);
      model.addAttribute("kakao_url", kakaoAuthUrl);

      System.out.println("model :" + model);
      
      //이전 페이지 주소 저장
      String referer = request.getHeader("Referer");
      if(referer!=null) {
         request.getSession().setAttribute("redirectURI", referer);
         System.out.println("이전페이지 주소: "+referer);
         String[] arr = referer.split("/");
         arrLast = arr[arr.length-1];   //필드에 선언해둔 String 변수에 담음
         System.out.println("마지막 인텍스: " + arrLast);
      }
      
      /* 생성한 인증 URL을 Model에 담아서 전달 */
      return "member/kiview_login";
   }

   // 네이버 로그인 성공시 callback호출 메소드 
   @RequestMapping(value = "/callback.do")
   public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, MemberVo vo)
         throws IOException {

      System.out.println("네이버 callback");
      OAuth2AccessToken oauthToken;
      oauthToken = naverLoginBO.getAccessToken(session, code, state);
      // 로그인 사용자 정보를 읽어온다.
      apiResult = naverLoginBO.getUserProfile(oauthToken);
      model.addAttribute("result", apiResult);
      System.out.println("result: " + apiResult);
      
      //이메일 가져오기
      JsonParser parser = new JsonParser();
      JsonElement element = parser.parse(apiResult);
      JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
      String snsEmail = response.getAsJsonObject().get("email").getAsString();
      System.out.println("내가 출력하고 싶은 이메일: " + snsEmail );
      
      //이메일아이디 중복확인
      vo = biz.selectEmailId(snsEmail);
      
      //네이버로그인 가입자라면 자동 로그인
      if( vo != null && vo.getMember_name().equals("네이버로그인가입자") ) {
        session.setAttribute("login", vo);

        //세션 유지 시간 1시간으로 설정
        session.setMaxInactiveInterval(60*60) ;

        if( arrLast.contains("review") ) {
           model.addAttribute("arrLast", arrLast);

        } else if( arrLast.contains("cafe") ){
           model.addAttribute("arrLast", "cafehome.do?");
        } 

        return "member/kiview_snsLoginRes";
      } 
      //네이버로그인 미가입자라면 자동 회원가입
      else {
          String tmpPwd = UUID.randomUUID().toString().replaceAll("-", "");   //임시 비밀번호 생성
          tmpPwd = tmpPwd.substring(0, 20); //임시비밀번호를 20자리까지 자름
          String PtmpPwd = null;
          PtmpPwd = passwordEncoder.encode(tmpPwd);   //임시비밀번호 암호화
         
          MemberVo snsVo = new MemberVo();
          snsVo.setMember_id(snsEmail);
          snsVo.setMember_pwd(PtmpPwd);
          snsVo.setMember_name("네이버로그인가입자");
          snsVo.setMember_addr("주소를 입력해주세요");
          snsVo.setMember_phone("전화번호를 입력해주세요");
          snsVo.setMember_email(snsEmail);
 
          System.out.println("snsVo: " + snsVo);
          
          int signupRes = biz.signup(snsVo);   //자동 회원가입
          if(signupRes>0) {
             System.out.println("회원가입 후 snsVo: " + snsVo);
             session.setAttribute("login", snsVo);

             //세션 유지 시간 1시간으로 설정
             session.setMaxInactiveInterval(60*60) ;

             return "member/kiview_snsSignupRes";
          } else {
             System.out.println("회원가입 실패");
             return "member/kiview_login";
          }

      } 
      

   }

   //카카오 로그인 성공시 callback 호출
   @RequestMapping("/callback3.do")
   public String callback3(HttpServletRequest request, @RequestParam("code") String code, HttpSession session, MemberVo vo, Model model) {

      System.out.println("카카오 callback");
      String access_Token = kakaoApi.getAccessToken(code);
      System.out.println("카카오 access token : " + access_Token);

      HashMap<String, Object> userInfo = kakaoApi.getUserInfo(access_Token);
      System.out.println("login Controller : " + userInfo);
      
      String snsEmail = (String) userInfo.get("email");
      
      vo = biz.selectEmailId(snsEmail);
      
      //카카오로그인 가입자라면 자동로그인
      if( vo != null && vo.getMember_name().equals("카카오로그인가입자") ) {

         session.setAttribute("login", vo);

         //세션 유지 시간 1시간으로 설정
         session.setMaxInactiveInterval(60*60) ;

         if( arrLast.contains("review") ) {
            model.addAttribute("arrLast", arrLast);

         } else if( arrLast.contains("cafe") ){
            model.addAttribute("arrLast", "cafehome.do?");
         } 

         return "member/kiview_snsLoginRes";

      } 
      //카카오로그인 미가입자라면 자동 회원가입
      else {
         String tmpPwd = UUID.randomUUID().toString().replaceAll("-", "");   //임시 비밀번호 생성
         tmpPwd = tmpPwd.substring(0, 20); //임시비밀번호를 20자리까지 자름
         String PtmpPwd = null;
         PtmpPwd = passwordEncoder.encode(tmpPwd);   //임시비밀번호 암호화

         MemberVo snsVo = new MemberVo();
         snsVo.setMember_id(snsEmail);
         snsVo.setMember_pwd(PtmpPwd);
         snsVo.setMember_name("카카오로그인가입자");
         snsVo.setMember_addr("주소를 입력해주세요");
         snsVo.setMember_phone("전화번호를 입력해주세요");
         snsVo.setMember_email(snsEmail);

         int signupRes = biz.signup(snsVo);   //자동 회원가입
         if(signupRes>0) {
            System.out.println("회원가입 후 snsVo: " + snsVo);
            session.setAttribute("login", snsVo);

            //세션 유지 시간 1시간으로 설정
            session.setMaxInactiveInterval(60*60) ;

            return "member/kiview_snsSignupRes";
         } else {
            System.out.println("회원가입 실패");
            return "member/kiview_login";
         }


      } 

   }
   
   //비밀번호찾기 - 아이디/이메일 일치 여부확인
   @RequestMapping(value = "/kiviewfindpwd.do", method = RequestMethod.POST)
   @ResponseBody
   public Map<String, Boolean> findPwd(@RequestBody MemberVo vo) {
      logger.info("findPwd");
      int res = biz.findPwd(vo);

      boolean check2 = false;

      if (res>0) {
         check2 = true;
      }

      Map<String, Boolean> map = new HashMap<String, Boolean>();
      map.put("check2", check2);

      return map;
   }
   
   

   //비밀번호 찾기 이메일 발송
    @RequestMapping(value = "/kiviewsendemail.do", method = RequestMethod.POST)
    @ResponseBody
   public int send_mail(@RequestBody MemberVo vo) throws Exception {
       logger.info("sendEmail");
       
       //임시비밀번호 DB에 저장
       String tmpPwd = UUID.randomUUID().toString().replaceAll("-", "");   //임시 비밀번호 생성
       tmpPwd = tmpPwd.substring(0, 8); //임시비밀번호를 8자리까지 자름
       vo.setMember_pwd(passwordEncoder.encode(tmpPwd));   //임시비밀번호 암호화
       
       System.out.println("암호화 전 임시비밀번호: "+ tmpPwd);
       System.out.println("vo: " + vo);
       
       int res = biz.tmpPwd(vo);   //임시비밀번호  update
      
       // Mail Server 설정
      String charSet = "utf-8";
      String hostSMTP = "smtp.naver.com";
      String hostSMTPid = "blue920708";
      String hostSMTPpwd = "rsef8426$$";

      // 보내는 사람 EMail, 제목, 내용
      String fromEmail = "blue920708@naver.com";
      String fromName = "Kiview";
      String subject = "kiview에서 임시비밀번호가 발급되었습니다";
      String msg = "";
      
      msg += "<div align='center' style='border:1px solid black; font-family:verdana'; font-size:20px;>";
      msg += "<h3 style='color: blue;'>";
      msg += vo.getMember_id() + "님의 임시 비밀번호는&nbsp;<span style='color: red; font-size:30px'>"+ tmpPwd +"</span>&nbsp;입니다. "
            + "<br>로그인 후 비밀번호를 변경하여 사용하세요.</h3></p></div>";
       
      // 받는 사람 E-Mail 주소
      try {
         String mail = vo.getMember_email();
          System.out.println("mail: " + mail);
          
         HtmlEmail email = new HtmlEmail();
         email.setDebug(true);
         email.setCharset(charSet);
         email.setSSL(true);
         email.setHostName(hostSMTP);
         email.setSmtpPort(587);

         email.setAuthentication(hostSMTPid, hostSMTPpwd);
         email.setTLS(true);
         email.addTo(mail, charSet);
         email.setFrom(fromEmail, fromName, charSet);
         email.setSubject(subject);
         email.setHtmlMsg(msg);
         email.send();
      } catch (Exception e) {
         System.out.println("메일발송 실패 : " + e);
      }
       
       return res;
       
   }
    
    
    @RequestMapping("chkemail.do")
    @ResponseBody
    public Map chkEmail(String email) {
    	List<MemberVo> member = biz.chkEmail(email);
       boolean bool = true;
       if(member.size()<1) {
          bool = false;
       } else {
          bool= true;
       }
       
       Map map = new HashMap();
       map.put("bool",bool);
       
       return map;
       
       
    }
  
   
   
}