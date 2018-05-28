var list_code=$('#list_code').val();
getAllList();
function test(i) {
	$.ajax({
		type : 'delete',
		url : 'deleteAccom/' + i,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},
		dataType : "text",
		success : function(result) {
			if (result == "SUCCESS") {
				alert("삭제되었습니다.");
				console.log(list_code);
				$("#tbody").html("");
			}
		}
	});
}
		function getAllList(){
			var list_code=$('#list_code').val();
			var str="";
			$.getJSON("/accomJson/"+list_code,function(data){
				$(data).each(function() {
					console.log(this.accom_type);
						str +="<td>1</td>"
						+"<td>"+this.accom_type+"</td>"
						+"<td>"+this.accom_name+"</td>"
						+"<td>"+this.accom_check_in+"</td>"
						+"<td>"+this.accom_check_out+"</td>"
						+"<td><div id='outputAccord' data-children='.item'>"
							+"<div class='item'>"	
								+"<a data-toggle='collapse' data-parent='#exampleAccordion'"
									+"href='#exampleAccordion1' aria-expanded='true'"	
										+"aria-controls='exampleAccordion1'> 자세히 보기 </a>"
									+"<div id='exampleAccordion1' class='collapse' role='tabpanel'>"
										+"<p class='mb-3'>"+this.accom_contents+"</p>"
									+"</div></div></div></td><td>"
									+"<button type='button' onclick='test("+this.list_code+");' class='btn btn-outline-danger'"
									+">X</button></td></tr>";
			});
			$("#tbody").html(str);
			});
		}
		$("#submitbtn").click(function() {
	         if ($("#accom_check_in").val() > $("#accom_check_out").val()) {
	            alert("날짜 입력 오류");
	            $("#accom_check_out").focus();
	         } else {
	            if ($("#accom_check_in").val() == "") {
	               alert("시작일 입력 오류");
	               $("#accom_check_in").focus();
	            } else if ($("#accom_check_out").val() == "") {
	               alert("종료일 입력 오류");
	               $("#accom_check_out").focus();
	            }

	            else if ($("#accom_name").val() == "") {
	               alert("숙소명 입력 오류");
	               $("#accom_name").focus();
	            } else if ($("#accom_type").val() == "선택") {
	               alert("숙소타입 입력 오류");
	               $("#accom_type").focus();
	            }
	            else{
	            	var accom_type=$("#accom_type").val();
	            	var accom_name=$("#accom_name").val();
	            	var accom_check_in=$("#accom_check_in").val();
	            	var accom_check_out=$("#accom_check_out").val();
	            	var accom_contents=$("#accom_contents").val();
	              $.ajax({
	            	  type:'post',
	            	  url:'insertAccom',
	            	  headers: {
	          			"Content-Type" : "application/json",
	        			"X-HTTP-Method-Override" : "POST"
	        		},
	        		dataType:'text',
	        		data:JSON.stringify({
	        			accom_type:accom_type,
	        			accom_name:accom_name,
	        			accom_check_in:accom_check_in,
	        			accom_check_out:accom_check_out,
	        			accom_contents:accom_contents,
	        			list_code:list_code
	        		}),
	        		success:function(result){
	        			if(result=="SUCCESS"){
	        				$(".collapse").collapse('hide');
	        				alert("입력 성공");
	        				getAllList();
	        				  $('form').each(function(){
	        					    this.reset();
	        					  });
	        			}
	        		}
	              });
	            }
	         }
	      });
		
	

						