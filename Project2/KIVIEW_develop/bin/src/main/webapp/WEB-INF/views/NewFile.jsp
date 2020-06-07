<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            background-color: #FEFEFE;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 60px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
 <input style="position:relative; left:35%; width:30% "class="btn btn-secondary" id="myBtn" type="button" value="리뷰쓰기">
<!-- Trigger/Open The Modal -->
   <!--<button id="myBtn">Open Modal</button>-->

   <!-- The Modal -->
   <div id="myModal" class="modal">

      <!-- Modal content -->
      <div class="modal-content" style="padding: 40px;">
         <span style="width: 5%;" class="close">&times;</span>

         <div>
            <h3>
               <b>유치원 리뷰쓰기</b>
            </h3>
            <h6 style="width: 100%">키뷰는 평가자의 익명성을 보장하며 평가내역에 어떠한 개인정보도 노출되지 않음을 약속드립니다.</h6>
            <br>

            <form action="">
               <div>
                  <label>유치원 명 </label><br> <input type="text" placeholder="유치원을 검색해 주세요. 유치원 목록 필요." name="name" style="width: 101%"><br> <br> <label> 등원시기 </label><br>
                  <select style="width: 101%; height: 35px;">
                     <option selected="selected">선택</option>
                     <option>2020</option>
                  </select>
                  <br> <br> <label>제목 </label><br> <input type="text" placeholder="제목을 입력하세요" name="name" style="width: 101%"><br> <br> <label>내용 </label><span style="position: relative; left: 85%">0/200자</span><br>
                  <textarea style="width: 100%; height: auto; resize: none;" placeholder="내용 주의사항 적어서 쓰십쇼! 최소 글자수 제한 필요" name="name"></textarea>
                  <br> <br>
               </div>
               <br>

               <div>
                  <div class="star-input">
                     <h4>
                        <b>평점</b>
                     </h4>
                     <label>선생님평점</label><br>
                     <div class="input">

                        <input type="radio" name="star-input" value="1" id="p1"> <label for="p1">1</label> <input type="radio" name="star-input" value="2" id="p2"> <label for="p2">2</label> <input type="radio" name="star-input" value="3" id="p3"> <label for="p3">3</label> <input type="radio" name="star-input" value="4" id="p4"> <label for="p4">4</label> <input type="radio" name="star-input" value="5" id="p5"> <label for="p5">5</label>

                     </div>

                     <output for="star-input">
                        <b>0</b>점
                     </output>
                  </div>
                  <br> <br>
                  <div class="star-input2">
                     <label>아무거나평점</label><br>
                     <div class="input2">

                        <input type="radio" name="star-input2" value="1" id="p12"> <label for="p12">1</label> <input type="radio" name="star-input2" value="2" id="p22"> <label for="p22">2</label> <input type="radio" name="star-input2" value="3" id="p32"> <label for="p32">3</label> <input type="radio" name="star-input2" value="4" id="p42"> <label for="p42">4</label> <input type="radio" name="star-input2" value="5" id="p52"> <label for="p52">5</label>


                     </div>

                     <output for="star-input2">
                        <b>0</b>점
                     </output>
                  </div>
                  <br> <br>
                  <div class="star-input3">
                     <label>시설평점</label><br>
                     <div class="input3">

                        <input type="radio" name="star-input3" value="1" id="p13"> <label for="p13">1</label> <input type="radio" name="star-input3" value="2" id="p23"> <label for="p23">2</label> <input type="radio" name="star-input3" value="3" id="p33"> <label for="p33">3</label> <input type="radio" name="star-input3" value="4" id="p43"> <label for="p43">4</label> <input type="radio" name="star-input3" value="5" id="p53"> <label for="p53">5</label>


                     </div>

                     <output for="star-input3">
                        <b>0</b>점
                     </output>
                  </div>



                  <br> <br> <br>

               </div>
               <div style="position: relative; left: 38%;">
                  <input class="btn btn-secondary" style="width: 15%" type="submit" value="작성">&nbsp;&nbsp;&nbsp; <input id="modal-close" class="btn btn-primary" style="width: 15%" type="button" value="취소">
               </div>
            </form>
         </div>



      </div>




   </div>
</body>
</html>