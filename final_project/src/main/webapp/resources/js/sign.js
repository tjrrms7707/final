var chkIdflag = false;

$(document).ready(function(){
      $('header').load("header_each.jsp");
      $('footer').load("footer.jsp");
      
      $('#rePassword').keyup(function() {
			if($('#Password').val() != '' || $('#rePassword').val() != ''){
				if($('#Password').val() != $('#rePassword').val()){
					$('#pwdFault').css("display","");
					$('#pwdSame').css("display","none");
				}
				else{
					$('#pwdFault').css("display","none");
					$('#pwdSame').css("display","");
				}
			}
      });
      
      $('#id').keyup(function() {
			chkIdflag = false;
			
			 if (!(event.keyCode >=37 && event.keyCode<=40)) {
		    	    var inputVal = $(this).val();
		    	    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
	    	 }		    	  
      });
      
      
   });
   
   function idChk(){
	   if($('#id').val() == ""){
			  alert("아이디를 입력하세요");
			  return;
		}	  
	   
	   var id = $('#id').val();
	   
	   $.ajax({
	        // type을 설정합니다.
	        type : 'POST',
	        url : "chkId.do",
	        // 사용자가 입력하여 id로 넘어온 값을 서버로 보냅니다.
	        data : {"id" : id},
	        // 성공적으로 값을 서버로 보냈을 경우 처리하는 코드입니다.
	        success : function (data) {
	           if(Number(data)>0){
	     		  swal({
	    			  title: "사용할 수 없는 아이디입니다.",
	    			  icon: "error",
	    			  button: "확인",
	    			});
	        	   chkIdflag = false;
	           } 
	           else{
		     		  swal({
		    			  title: "사용할 수 있는 아이디입니다.",
		    			  icon: "success",
		    			  button: "확인",
		    			});
	        	   chkIdflag = true;
	           }
	        }


	    });
   }
   
  function signBtn(){
	  if($('#name').val() == ""){
		  swal({
			  title: "이름을 입력하세요.",
			  icon: "error",
			  button: "확인",
			});
		  return;
	  }	
	  
	  if($('#id').val() == ""){
		  swal({
			  title: "아이디를 입력하세요.",
			  icon: "error",
			  button: "확인",
			});
		  return;
	  }	  
	  
	  if($('#Password').val() == ""){
		  swal({
			  title: "패스워드를 입력하세요.",
			  icon: "error",
			  button: "확인",
			});
		  return;
	  }
	  
	  if($('#email').val() == ""){
		  swal({
			  title: "이메일을 입력하세요.",
			  icon: "error",
			  button: "확인",
			});
		  return;
	  }	
	  
	  if($('#kakaoid').val() == ""){
		  swal({
			  title: "카카오아이디를 입력하세요.",
			  icon: "error",
			  button: "확인",
			});
		  return;
	  }	
	  
	  if(!validateEmail($('#email').val())){
		  swal({
			  title: "올바른 이메일 형식이 아닙니다.",
			  icon: "error",
			  button: "확인",
			});
		  return;
	  }
	  
	  if(!chkIdflag){
		  swal({
			  title: "아이디 중복체크를 하세요.",
			  icon: "error",
			  button: "확인",
			});
		  return;
	  }
	  
	  if($('#Password').val() != $('#rePassword').val()){
		  swal({
			  title: "패스워드가 다릅니다.",
			  icon: "error",
			  button: "확인",
			});
		  return;
	  }		  
	  
	  if(!$('#exampleCheck1').prop('checked')){
		  swal({
			  title: "약관에 동의하세요.",
			  icon: "error",
			  button: "확인",
			});
		  return;
	  }
	  
	  $('#signform').submit();
  } 
  
  function validateEmail(email) {
	  var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	  return re.test(email);
	  }