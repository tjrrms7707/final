function getAllList() {
	var str='';
	var list_code =$("#code").val();
	$.getJSON('/dayJson/' + list_code, function(data) {
		$(data).each(function() {
			str +="<tr>"
				<!-- 번호 -->
				+"<th scope='row' style='width: 54px;'>"
				+"</th>"
				<!-- 시간 -->
				+"<td style='width: 64px;'>"
				+this.day_time+"</td>"
				<!-- 제목 -->
				+"<td id='outsubject' style='width:50px;'>"+this.day_title
					<!-- 내용 -->
				+"<td><div id='outputAccord' data-children='.item'>"
						+"<div class='item'>"
							+"<a data-toggle='collapse' data-parent='#exampleAccordion'"
							+"href='#"+this.day_code+"' aria-expanded='true'"
							+"aria-controls='#"+this.day_code+"'> 자세히 보기 </a>"
							+"<div id='"+this.day_code+"' class='collapse' role='tabpanel'>"
							+"<p class='mb-3'>"+this.day_contents+"</p>"
							+"</div></div></div></td>"
							+"<td style='width: 59px;'>"
							+"<form>"
							+"<button type='button' onclick='test("+this.day_code+");' class='btn btn-outline-danger' id='btn"+this.day_code+"'"
							+">X</button>"
							+"</form>" 
							+"</td>" 
							+"</tr>"
		});
		$('#tbody').html(str);
	});
}
$("#button1").click(function(){
	if ($("#day_time").val() == "") {
		alert("시간 입력 오류");
		$("#day_time").focus();

	} else if ($("#day_title").val() == "") {
		alert("제목 입력 오류");
		$("#day_title").focus();
	} else if ($("#day_contents").val() == "") {
		alert("내용 입력 오류");
		$("#day_contents").focus();
	}else{
	var day_time=$("#day_time").val();
	var day_contents=$("#day_contents").val();
	var day_title=$("#day_title").val();
	var list_code =$("#code").val();
	$.ajax({
		type : 'post',
		url : '/insertDay',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			day_time:day_time,
			day_contents:day_contents,
			day_title:day_title,
			list_code:list_code
		}),
		success : function(result) {
			if (result == "SUCCESS") {
				getAllList();
				$(".collapse").collapse('hide');
				alert("입력 성공");
				  $('form').each(function(){
					    this.reset();
					  });
			}
		}
	})
	}
});
function test(i){
	$.ajax({
		type:'delete',
		url:'deleteDay/'+i,
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},
		dataType : 'text',
		success : function(result) {
			if (result == "SUCCESS") {
				alert("삭제 성공");
				getAllList();
			}
		}
	})
}
getAllList();
