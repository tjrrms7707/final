$(document).ready(function(){
      $('header').load("header_each.jsp");
      $('footer').load("footer.jsp");
   });
   
   function qcomplete(){
		  if($('#name').val() == ""){
			  swal({
				  title: "이름을 입력하세요.",
				  icon: "error",
				  button: "확인",
				});
			  return;
		  }	
		  			  
		  $('#q_content').val($('#content').val().replace(/(?:\r\n|\r|\n)/g, '<br />'));
		  
		  
		  $('#qaForm').submit();
		  
   }