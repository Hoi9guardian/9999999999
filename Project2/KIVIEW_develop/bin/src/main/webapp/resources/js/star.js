/*별점 : .star-input*/
/*출처 : http://codepen.io/naradesign/pen/zxPbOw*/

var starRating = function(){
var $star = $(".star-input"),
    $result = $star.find("output>b");

//  	$(document)
//	.on("focusin", ".star-input>.input", 
//		function(){
//   		 $(this).addClass("focus");
//   		 
// 	})
//		 
//   	.on("focusout", ".star-input>.input", function(){
//    	var $this = $(this);
//    	setTimeout(function(){
//      		if($this.find(":focus").length === 0){
//       			$this.removeClass("focus");
//     	 	}
//   		}, 100);
// 	 })
//  
//    .on("change", ".star-input :radio", function(){
//    	$result.text($(this).next().text());
//  	})
//    .on("mouseover", ".star-input label", function(){
//    	$result.text($(this).text());
//    })
//    .on("mouseleave", ".star-input>.input", function(){
//    	var $checked = $star.find(":checked");
//    		
//    		if($checked.length == 0){
//     	 		$result.text("0");
//   		 	} else {
//     	 		$result.text($checked.next().text());
//    		}
//  	});
};

starRating();

var starRating2 = function(){
	var $star2 = $(".star-input2"),
	    $result2 = $star2.find("output>b");	
		
	  	$(".input2").on("focusin", ".star-input2>.input2",function(){
	  		$(this).addClass("focus");
	 	}).on("focusout", ".star-input2>.input2", function(){
	    	var $this = $(this);
	    	setTimeout(function(){
	      		if($this.find(":focus").length == 0){
	       			$this.removeClass("focus");
	     	 	}
	   		}, 100);
	 	 }).on("change", ".star-input2 :radio", function(){ 		
	    	$result2.text($(this).next().text());
	  	}).on("mouseover", ".star-input2 label", function(){
	    	$result2.text($(this).text());
	    }).on("mouseleave", ".star-input2>.input2", function(){
	    	var $checked = $star2.find(":checked");
	    		if($checked.length == 0){
	     	 		$result2.text("0");
	   		 	} else {
	     	 		$result2.text($checked.next().text());
	    		}
	  	});
	};

	starRating2();
	
	var starRating3 = function(){
		var $star3 = $(".star-input3"),
		    $result3 = $star3.find("output>b");	
			
		  	$(".input3").on("focusin", ".star-input3>.input3",function(){
		  		$(this).addClass("focus");
		 	}).on("focusout", ".star-input3>.input3", function(){
		    	var $this = $(this);
		    	setTimeout(function(){
		      		if($this.find(":focus").length == 0){
		       			$this.removeClass("focus");
		     	 	}
		   		}, 100);
		 	 }).on("change", ".star-input3 :radio", function(){ 		
		    	$result3.text($(this).next().text());
		  	}).on("mouseover", ".star-input3 label", function(){
		    	$result3.text($(this).text());
		    }).on("mouseleave", ".star-input3>.input3", function(){
		    	var $checked = $star3.find(":checked");
		    		if($checked.length == 0){
		     	 		$result3.text("0");
		   		 	} else {
		     	 		$result3.text($checked.next().text());
		    		}
		  	});
		};

		starRating3();	