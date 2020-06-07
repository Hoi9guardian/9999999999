function notice_edit(notice_no, page) {

	location.href = "noticeUpdate.do?notice_no=" + notice_no+"&page="+page;

}

function notice_del(notice_no, page){
	var result = confirm("정말 삭제하시겠습니까?");
	
	if(result){
		alert("삭제 완료");
		location.href = "kiviewdel.do?notice_no="+notice_no+"&page="+page;
	}else{
		alert("취소");
		return;
	}
	
	
}

function backlist(pagenum){
	
	var num = pagenum;
	
	location.href = "kiviewnotice.do?page="+num;
	
}


function CopyUrlToClipboard(){
	var obj = document.getElementById("ShareUrl");
	obj.select();
	document.execCommand('copy');
	
	 $('#snackbar').css({opacity:1});
	  setTimeout(function(){
	 $('#snackbar').css({opacity:0});},2000);
}
