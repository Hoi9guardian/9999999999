    function divToggle(){
    	
    	$(".conditionDiv").slideToggle();
    	
    }
    
    function categoryToggle(){
    	
    	$(".conditionDiv2").fadeIn();
    	$(".conditionDiv1").fadeIn();
    	$(".labelN").css("color","#ff4f57").css("transition","all ease 0.3s 0s");
    	$(".labelNON").css("color","black").css("transition","all ease 0.3s 0s");
    	
    }
    
    function categoryToggle2(){
    	
    	$(".conditionDiv2").fadeOut();
    	$(".conditionDiv1").fadeIn();
    	$(".labelN").css("color","black");
    	$(".labelNON").css("color","#ff4f57");
    	
    }
    
    function boldChange(data){

    	for(var i = 1; i < 6;i++){
    		
    		if(i==data){
    			
    			$(".label"+i).css("color","#ff4f57").css("transition","all ease 0.3s 0s");
    			
    		} else {
    			
    			$(".label"+i).css("color","gray").css("transition","all ease 0.3s 0s");
    		}
    	}
    }