
$(function() {
   $("#mypagePwdMsg").show().html("&nbsp;&nbsp;&nbsp;&nbsp;기존 비밀번호 혹은 변경할 비밀번호를 입력해주세요");
   
   //엔터키 막기
   $('#mypageUpdateForm').keydown(function(key) {
      if (key.keyCode == 13) {
         return false;
      }
   });
   
});

//회원 탈퇴 확인 
function memberDel(){
   
   var result = confirm("회원탈퇴시 회원의 모든 정보가 삭제되며 복구할 수 없습니다. 정말 탈퇴하시겠습니까?")
   
   if(result){
      alert("탈퇴 되었습니다.");
      $("#deleteform").submit();
   }else{
      alert("취소 되었습니다.");
   }
   
    
}

//비밀번호 클릭시 수정 메시지 삭제
function pwdCkMsgClear(){
	$('#mypagePwdChkMsg').show().html('');
}

//회원정보 수정 확인
function mypageUpdate(){

   
   var mypagePwd = $('#mypagePwd').val().trim(); 
   var mypagePwdChk = $('#mypagePwdChk').val().trim(); 
   var mypageAddr = $('#mypageAddr').val(); 
   var mypagePhone = $('#mypagePhone').val().trim(); 
   var mypageEmail = $('#mypageEmail').val().trim();

   $('#mypagePwdMsg').show().html('');
   $('#mypagePwdChkMsg').show().html('');
   $('#mypageAddrMsg').show().html('');
   $('#mypagePhoneMsg').show().html('');
   $('#mypageEmailMsg').show().html('');
   
   if( mypagePwd == null || mypagePwd =="" || mypagePwdChk == null || mypagePwdChk =="" ){
      $('#mypagePwdMsg').show().html('&nbsp;&nbsp;&nbsp;&nbsp;비밀번호를 입력해주세요');
      
      var member_id = $('#member_id').offset();
      $('html').animate({scrollTop : member_id.top}, 400);
      
      return false;
   } else if( mypagePhone == null || mypagePhone =="" ){
	      $('#mypagePhoneMsg').show().html('&nbsp;&nbsp;&nbsp;&nbsp;전화번호를 입력해주세요');

	      var mypageAddrMsg = $('#mypageAddrMsg').offset();
	      $('html').animate({scrollTop : mypageAddrMsg.top}, 400);
	      
	      return false;
   } else if( mypageEmail== null || mypageEmail =="" ){
      $('#mypageEmailMsg').show().html('&nbsp;&nbsp;&nbsp;&nbsp;이메일를 입력해주세요');

      var mypagePhoneMsg = $('#mypagePhoneMsg').offset();
      $('html').animate({scrollTop : mypagePhoneMsg.top}, 400);
      
      return false;
   } else if( mypagePwd != mypagePwdChk ){
      $('#mypagePwdChkMsg').show().html('&nbsp;&nbsp;&nbsp;&nbsp;비밀번호가 일치하지 않습니다');
      
      var member_id = $('#member_id').offset();
      $('html').animate({scrollTop : member_id.top}, 400);
      
      return false;
   } else if (!/^.*(?=^.{4,19}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(mypagePwd)) {
      $("#mypagePwdMsg").show().html("&nbsp;&nbsp;영문(소/대문자 구분), 숫자, 특수문자를 포함 5~20자리로 입력해주세요");
      
      var member_id = $('#member_id').offset();
      $('html').animate({scrollTop : member_id.top}, 400);
      
      return false;
   } else if( !/^[0-9]*$/.test( mypagePhone ) ) {
       $("#mypagePhoneMsg").show().css('color', 'red').html("&nbsp;&nbsp;숫자만 입력해주세요&nbsp;&nbsp;ex)01011112222");
       
       var mypageAddrMsg = $('#mypageAddrMsg').offset();
      $('html').animate({scrollTop : mypageAddrMsg.top}, 200);

        
      return false;
    } else if( !(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i).test( mypageEmail ) ) {
       $("#mypageEmailMsg").show().css('color', 'red').html("&nbsp;&nbsp;올바른 이메일형식으로 입력해주세요&nbsp;&nbsp;ex)test01@email.com");
        
       var mypagePhoneMsg = $('#mypagePhoneMsg').offset();
      $('html').animate({scrollTop : mypagePhoneMsg.top}, 200);
        
      return false;
    } else {
      alert("회원정보가 수정되었습니다.");
      $('#mypageUpdateForm').submit();
    }
   
   return false;
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
   
   document.getElementById('member_addr').value = roadAddrPart1 + " " + addrDetail;
}




