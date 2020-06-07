$(function(){

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "smartEditor",
		sSkinURI : "se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,

			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : false,

			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : false
		}
	}); //createInIFrame

$("#savebutton").click(function() {
	
	
	oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);

	var selcatd = $("#selcatd > option:selected").val();
	var title = $("#title").val();
	var content = document.getElementById("smartEditor").value;;

	if (selcatd == "") {
		alert("카테고리를 선택해주세요.");
		return;
	}
	if (title == null || title == "") {
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return;
	}
	if(content == "" || content == null || content == '&nbsp;' || 
			content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
		alert("본문을 작성해주세요.");
		oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱
		return;
	}
	
	var result = confirm("수정 하시겠습니까?");
	
	if(result){
		/*alert("수정 완료!");*/
		$("#faqUpdateForm").submit();
	}else{
		return;
	}
	
	}); //click function

}); //function