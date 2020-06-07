
$(function() {
   //시작 이벤트
   $('#loginChk').hide();
   $('#loginIdChk').hide();
   $('#loginPwdChk').hide();
   $('#idUseBtn').hide();
   $("#member_id").focus();
   
   //엔터 이벤트
   $('.jsx-639067573').keydown(function(key) {
      // 키의 코드가 13번일 경우 (엔터의 키코드는 13)
      if (key.keyCode == 13) {
         login();
      }
   });

   $('.find-id').keydown(function(key) {
      if (key.keyCode == 13) {
         idCk();
      }
   });

   //클릭 이벤트
   $('#idCkBtn').click(function() {
      $('#idSearchHTML').hide();
      $('#idSearchRes').hide();
      $('#idSearch_name').val("");
      $('#idSearch_email').val("");
      $("#idSearch_name").focus();

   });

});

//로그인
function login() {
   var member_id = $("#member_id").val().trim();
   var member_pwd = $('#member_pwd').val().trim();

   var loginVal = {
      "member_id" : member_id,
      "member_pwd" : member_pwd
   };

   if (member_id == null || member_id == "") {
      $('#loginChk').hide();
      $('#loginPwdChk').hide();
      $("#loginIdChk").show().html("&nbsp;&nbsp;아이디를 입력해주세요");
      $('input').eq(0).val("");
      $('input').eq(1).val("");

   } else if (member_pwd == null || member_pwd == "") {
      $('#loginChk').hide();
      $('#loginIdChk').hide();
      $("#loginPwdChk").show().html("&nbsp;&nbsp;비밀번호를 입력해주세요");
      $('input').eq(1).val("");

   } else {
      $.ajax({
         type : "post",
         url : "ajaxlogin.do",
         data : JSON.stringify(loginVal),
         contentType : "application/json",
         dataType : "json",
         success : function(msg) {
        	

            if (msg.check == "1") {
            	if(msg.arrLast == null){
            		location.href = "index.do";
            	} else {
            		
            		location.href = msg.arrLast;
            	}
            } else if(msg.check == "2"){
            	$('#loginIdChk').hide();
            	$('#loginPwdChk').hide();
            	$("#loginChk").show().html("네이버/카카오톡 로그인은 위의 네이버/카카오톡 버튼을 이용해주세요");
            } else {
               $('#loginIdChk').hide();
               $('#loginPwdChk').hide();
               $("#loginChk").show().html("비밀번호가 일치하지 않습니다");
               $('input').eq(1).val("");
            }
         },
         error : function() {
            $('#loginIdChk').hide();
            $('#loginPwdChk').hide();
            $("#loginChk").show().html("아이디가 존재하지 않습니다");
            $('input').eq(0).val("");
            $('input').eq(1).val("");
         }
      });
   }
}

//아이디 찾기
var searchedId = "";
function idChk() {

   var member_name = $("#idSearch_name").val().trim();
   var member_email = $('#idSearch_email').val().trim();

   var idSearchVal = {
      "member_name" : member_name,
      "member_email" : member_email
   };

   if (member_name == null || member_name == "" || member_email == null || member_email == "") {
      $('#idSearch_name').val("");
      $('#idSearch_email').val("");
      $("#idSearchHTML").show().html("이름과 이메일을 입력해주세요");

   } else {
      $.ajax({
         type : "post",
         url : "kiviewidsearch.do",
         data : JSON.stringify(idSearchVal),
         contentType : "application/json",
         dataType : "json",
         success : function(msg) {

            if (msg != null) {
               $('#idSearchHTML').hide();
               $('#idSearchRes').show().html("ID: " + msg.idSearch.member_id);
               searchedId = msg.idSearch.member_id;
               
               $('#idChkBtn').hide();
               $('#idUseBtn').show();
            } else {
               $('#idSearchHTML').hide();
               $("#idSearchHTML").show().html("이름과 이메일이 일치하지 않습니다");
               $('#idSearch_name').val("");
               $('#idSearch_email').val("");
            }
         },
         error : function() {
            $('#idSearchHTML').hide();
            $('#idSearchHTML').show().html("존재하지 않는 회원입니다");
            $('#idSearch_name').val("");
            $('#idSearch_email').val("");
         }
      });

      $("#idSearchRes").hide();

   }

}

//아이디 찾기에 성공한 아이디 로그인에 사용하기
function idUse(){
   var id = searchedId;
   $('#member_id').val(id);
   $('#id01').hide();
}

//비밀번호 찾기
function findPwd() {

   var member_id = $("#findPwd_id").val().trim();
   var member_email = $('#findPwd_email').val().trim();
   
   $("#findPwdMsg").hide().html("");

   var findPwdVal = {
      "member_id" : member_id,
      "member_email" : member_email
   };

   if (member_id == null || member_id == "" || member_email == null || member_email == "") {
      $("#findPwdMsg").show().css("color","red").html("아이디와 이메일을 입력해주세요");

   } else {
      $.ajax({
         type : "post",
         url : "kiviewfindpwd.do",
         data : JSON.stringify(findPwdVal),
         contentType : "application/json",
         dataType : "json",
         success : function(msg) {

            if (msg.check2 == true) {
               //이메일발송
               $.ajax({
                  type : "post",
                  url : "kiviewsendemail.do",
                  data : JSON.stringify(findPwdVal),
                  contentType : "application/json",
                  dataType : "json",
                  success : function(msg) {
                     console.log("메일전송성공");
                  },
                  error : function() {
                     $("#findPwdMsg").show().css("color","blue").html("이메일인증에 실패하였습니다. 다시 시도해주세요");
                  }
               });
               //
               $("#findPwdMsg").show().css("color","blue").html("이메일로 임시 비밀번호가 발송되었습니다");
               
            } else {
               $("#findPwdMsg").show().css("color","red").html("아이디와 이메일이 일치하지 않습니다");
               $('#findPwd_id').val("");
               $('#findPwd_email').val("");
            }
         },
         error : function() {
            $("#findPwdMsg").show().css("color","red").html("존재하지 않는 회원입니다");
            $('#findPwd_id').val("");
            $('#findPwd_email').val("");
         }
      });

   }
   
   $("#findPwd_id").val("");
   $("#findPwd_email").val("");

}
