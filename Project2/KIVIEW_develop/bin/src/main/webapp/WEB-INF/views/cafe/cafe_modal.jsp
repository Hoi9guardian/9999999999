<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp" %>
<style type="text/css">
 /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
        	
            background-color: #fefefe;  
            margin: 15% auto; /* 15% from the top and centered */
            padding: 30px;
            padding-left:80px; 
              
            border: 1px solid #888; 
            width: 40%; /* Could be more or less, depending on screen size */                          
        }
        
       
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
           	position:relative;
           	left:95%;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>

<script type="text/javascript">



$(function(){
	$("#myBtn").on("click",function(){
		//modal.style.display = "block";
		$("#myModal").show();
		
	}) 
	
	$(".close").on("click",function(){
		$("#myModal").hide();
	})
	
	
})



</script>
</head>

<body>

        <!-- Trigger/Open The Modal -->
    <!--<button id="myBtn">Open Modal</button>-->
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        
        	<label style="font-weight:bold; color:black"># 게시판 추가하기</label>
        	<br> 
        	<div style="width:100%">
        	
        	<input type="text" placeholder="게시판 이름" value="공지사항" size="30">&nbsp;<a href="#">X</a><br>
        	
        	
        	 
        	
        	<input type="text" placeholder="게시판 이름" value="잡 담" size="30">&nbsp;<a href="#">X</a><br>
        	
        	
        	<form action="#">
        	   
        	<input type="text" placeholder="게시판 이름" size="30"><input type="submit" class="btn btn-primary" value="추가"><br>
        	</form>
        	
        	<br>
        	 
        	</div>
        
      </div>
 
    </div>

</body>
</html>