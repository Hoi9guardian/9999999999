
$(function() {
   //회원가입시 엔터키 막기
   $('.jsx-3372927190').keydown(function(key) {
      if (key.keyCode == 13) {
         return false;
      }
   });
   
});

//아이디 중복체크
function signupIdCkBtn(){
   var member_id = $("#member_id").val().trim().toLowerCase();
   $("#member_id").val(member_id);
   var idChkVal = {
      "member_id" : member_id,
   };
   var stringVal = member_id, exp1 = /admin/, exp2 = /system/ ; 
   $("#signupIdMsg").show().html(""); 
   
   //아이디 정규식
   var idReg =  /^[a-z]{1}[a-z0-9]{4,19}$/;
    if( !idReg.test( member_id ) ) {
        $("#signupIdMsg").show().css("color","red").html("&nbsp;&nbsp;영소문자로 시작하는 영소문자/숫자 조합, 5~20자리로 입력해주세요");
        return false;
    } else if( exp1.test(stringVal) ){
        $("#signupIdMsg").show().css("color","red").html("&nbsp;&nbsp;이용할 수 없는 아이디입니다");
       return false;
    } else if( exp2.test(stringVal) ){
        $("#signupIdMsg").show().css("color","red").html("&nbsp;&nbsp;이용할 수 없는 아이디입니다");

       return false;
    } else {
      $.ajax({
         type : "post",
         url : "kiviewsignupidchk.do",
         data : JSON.stringify(idChkVal),
         contentType : "application/json",
         dataType : "json",
         success : function(msg) {
               $("#signupIdMsg").show().css("color","red").html("&nbsp;&nbsp;이미 사용중인 아이디입니다");
         },
         error : function() {
            $("#signupIdMsg").show().css("color","blue").html("&nbsp;&nbsp;사용 가능한 아이디입니다");
            $('#idChkChk').val("idChecked");
         }
      });
   
   }
   

}



//회원가입 확인
function signupChk(){

   var member_name = $("#member_name").val().trim();
   var member_id = $("#member_id").val().trim();
   var member_pwd = $("#member_pwd").val().trim();
   var member_pwdChk = $("#member_pwdChk").val().trim();
   var member_addr = $("#member_addr").val().trim();
   var member_phone = $("#member_phone").val().trim();
   var member_email = $("#member_email").val().trim();
   
   $("#signupNameMsg").hide().html('');
   $("#signupAddrMsg").hide().html('');
   $("#signupPhoneMsg").hide().html('');
   $("#signupEmailMsg").hide().html('');
   
   //이름 null 확인
   if(member_name==null || member_name==""){
      $("#signupNameMsg").show().css('color', 'red').html("&nbsp;&nbsp;이름을 작성해주세요");

       var signupInfo = $('#signupInfo').offset();
      $('html').animate({scrollTop : signupInfo.top}, 200);
      
      return false;
   }
   //아이디 null 확인
   else if(member_id==null || member_id==""){
      $("#signupIdMsg").show().css('color', 'red').html("&nbsp;&nbsp;아이디를 작성해주세요");

       var signupNameMsg = $('#signupNameMsg').offset();
      $('html').animate({scrollTop : signupNameMsg.top}, 200);
      
      return false;
   }
   //비밀번호 null 확인
   else if(member_pwd==null || member_pwd=="" || member_pwdChk==null || member_pwdChk==""){
      $("#signupPwdMsg").show().css('color', 'red').html("&nbsp;&nbsp;비밀번호를 작성해주세요");

       var signupIdMsg = $('#signupIdMsg').offset();
      $('html').animate({scrollTop : signupIdMsg.top}, 200);
      
      return false;
   }
   //전화번호 null 확인
   else if(member_phone==null || member_phone==""){
      $("#signupPhoneMsg").show().css('color', 'red').html("&nbsp;&nbsp;전화번호를 작성해주세요");

      return false;
   } 
   //전화번호 정규식
   else if( !(/^[0-9]*$/).test( member_phone ) ) {    
       $("#signupPhoneMsg").show().css('color', 'red').html("&nbsp;&nbsp;숫자만 입력해주세요&nbsp;&nbsp;ex)01011112222");

       return false;
    } 
   //이메일 null 확인
   else if(member_email==null || member_email==""){
      $("#signupEmailMsg").show().css('color', 'red').html("&nbsp;&nbsp;이메일을 작성해주세요");
      
      return false;
   }
   //이메일 정규식
   else if( !(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i).test( member_email ) ) {   
       $("#signupEmailMsg").show().css('color', 'red').html("&nbsp;&nbsp;올바른 이메일형식으로 입력해주세요&nbsp;&nbsp;ex)test01@email.com");
      
        return false;
    } 
   //아이디 중복확인 여부
   else if( $('#idChkChk').val() == "idUnchecked" ){      
      var signupNameMsg = $('#signupNameMsg').offset();
      $('html').animate({scrollTop : signupNameMsg.top}, 200);
      
      return false;
   } 
   //정상 작성시
   else {    
      //도로명주소+상세주소
       var member_addrRes = $('#member_addr').val().trim() + " " + $('#member_addrDetail').val().trim();
       $('#member_addr').val(member_addrRes);
      
      alert("성공적으로 KIVIEW의 회원이 되셨습니다");
   
      return true;
    }
   
   return false;
}

//아이디 중복확인 여부
function idChk_chk(){
   $('#idChkChk').val("idUnchecked");
   $("#signupIdMsg").show().css('color', 'red').html("&nbsp;&nbsp;중복확인을 해주세요");
   
}

//비밀번호 확인
function idPwd_chk(){
   var member_pwd = $("#member_pwd").val().trim();
   var member_pwdChk = $("#member_pwdChk").val().trim();
   
   $("#signupPwdMsg").hide().html('');
   //비밀번호 일치 확인
   if(member_pwd != member_pwdChk){   
      $("#signupPwdMsg").show().css('color', 'red').html("&nbsp;&nbsp;비밀번호가 일치하지 않습니다");
      return false;
   } 
   //비밀번호 정규식
   else if (!/^.*(?=^.{4,19}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test( member_pwd ) ) {
      $("#signupPwdMsg").show().css('color', 'red').html("&nbsp;&nbsp;영문(소/대문자 구분), 숫자, 특수문자를 포함 5~20자리");
      return false;
   }
   //비밀번호 확인 메시지
   else{
      $("#signupPwdMsg").show().css('color', 'blue').html("&nbsp;&nbsp;비밀번호가 일치합니다");
      return false;
   }
   
}


//주소 api
function addrPopup(){
   
   //팝업 크기/위치
   var winHeight = document.body.clientHeight;   // 현재창의 높이
    var winWidth = document.body.clientWidth;   // 현재창의 너비
    var winX = window.screenLeft;   // 현재창의 x좌표
    var winY = window.screenTop;   // 현재창의 y좌표
    var width = 434;
    var height = 569;
    var popX = winX + (winWidth - 434)/2;
    var popY = winY + (winHeight - 569)/2;
   
   // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
   var pop = window.open("kiviewjusopopup.do","pop","width="+width+"px,height="+height+"px,top="+popY+",left="+popX+",scrollbars=no, resizable=yes");
   // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
   //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
   
}

//검색된 도로명주소 해당 페이지에 출력
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
        , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
   // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
   
   document.getElementById('member_addr').value = roadAddrPart1;
   document.getElementById('member_addrDetail').value = addrDetail;
}







