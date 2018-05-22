$(document).ready(function(){
	  $('header').load("header_each.jsp");
      $('footer').load("footer.jsp");
   });
   
function answer(index){
	   $('#faqcontent' + index).slideToggle('slow', function() {}); 
}
function question(){
	   location.href = "question.do";
}

function qadetail(q_seq){
	   location.href = "detailQA.do?q_seq=" + q_seq;
}

function fnSearch(page){
	   var form = $("#sch_form");
	   $("#sch_title").val($("#sch_title_txt").val());	
	   $("#page").val(page);
	   form.submit();
}