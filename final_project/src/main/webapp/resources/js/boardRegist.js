$(function() {
	
	// datepicker 설정 (날짜 형식)
	$('#board_term').datepicker({
		format:'yy/mm/dd',
		todayHighlight : true,
		autoclose:true,
		language:'ko',
		startDate:setToday()
	});
	
	// datetimepicker 설정 (시간 형식)
	$('#board_time').datetimepicker({
		format:'HH:mm'
	});
	
	//날짜 시간 default : 오늘 날짜,현재 시간으로 설정
	$('#board_term').val(setToday());
	$('#board_time').val(setTime());
	
});


/*예약 날짜를 위한 default값으로 오늘 날짜 가져오기*/
function setToday(){
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var date = today.getDate();
	
	if(date < 10) {
		date = '0'+ date;
	}
	if(month < 10) {
		month = '0'+month;
	}
	
	today = year+'/'+month+'/'+date;
	
	return today;
}

/*미팅 시간을 위한 default값으로 현재 시간 가져오기*/
function setTime() {
	var today = new Date();
	var hour = today.getHours();
	var minute = today.getMinutes();
	
	time = hour+':'+minute;
	
	return time; 
}

function validationCheck(){
	var title = $('#board_title').val();
	var city= $('#category_code').val();
	var place= $('#board_place').val();
	var date = $('#board_term').val();
	var time = $('#board_time').val();
	var num = $('#recruit_number').val();
	
	if(title == '' || city == '' || place == ''|| date == '' || time == '' || num == '') {
		alert("필수 정보를 모두 입력해주세요.");
		return;
	} /*else if(checkDate()) {
		return;
	} */else if(checkNum()) {
		return;
	} else {
		$('#registForm').submit();
	}
}

function checkDate(){
	/*var date = $('#board_term').val();

	if(date < setToday()) {
		alert('올바른 날짜가 아닙니다.');
		return true;
	}*/
}

function checkNum() {
	var num = $('#recruit_number').val();
	if(num < 2) {
		alert('최소한 2명 이상 선택해주십시오.');
		return true;
	}
}
