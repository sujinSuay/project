
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="/Star_Planner/scripts/jquery.datetimepicker.css"/>
<script src="/Star_Planner/scripts/jquery.js"></script>
<script src="/Star_Planner/scripts/jquery.datetimepicker.js"></script>
<style type="text/css">
.custom-date-style {
	background-color: red !important;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr
								+ ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('address').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('address2').focus();
				}
			}).open();
}
$(document).keydown(function(e){
	if(e.target.nodeName == "INPUT" && e.target.getAttribute("readonly") == "readonly"){
		if(e.keyCode == 8){
			return false;
		}
	}
});
</script>
<style type="text/css">
td{
	padding-left: 10px;
	padding-right: 10px;
	padding-bottom: 5px;
}
</style>
</head>
<body>
<div style="width: 100%;" align="center">
	<h2>스케줄 수정</h2>
	<form action="/Star_Planner/schedule/scheduleModify.do" method="post">
	<input type="hidden" id="group_id" name="group_id" value="${sessionScope.groupId }">
	<input type="hidden" id="m_id" name="m_id" value="${sessionScope.loginId }">
	<input type="hidden" id="schedule_id" name="schedule_id" value="${requestScope.preSchedule.schedule_id}">
		<table>
			<tr>
				<td>날짜</td>
				<td>
					<input type="text" class="some_class" value="${requestScope.preSchedule.schedule_start }" id="some_class_1" name="schedule_start" required="required" readonly="readonly"/>&nbsp; ~&nbsp;
					<input type="text" class="some_class" value="${requestScope.preSchedule.schedule_end }" id="some_class_2" name="schedule_end" required="required" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td>가수</td>
				<td>
					<select name="singer_id">
						<c:forEach items="${requestScope.singerList }" var="singer">
							<option value="${singer.singer_id }" ${singer.singer_name==requestScope.preSchedule.singer.singer_name?'selected=selected':'' }>${singer.singer_name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>일정 타입</td>
				<td>
					<select name="type_name">
						<c:forEach items="${requestScope.eventList }" var="type">
							<option ${type==requestScope.preSchedule.type_name?'selected=selected':''}>${type }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>일정 이름</td>
				<td><input type="text" id="schedule_name" name="schedule_name" required="required" value="${requestScope.preSchedule.schedule_name }"></td>
			</tr>
			<tr>
				<td>일정 장소</td>
				<td colspan="2">
					<input type="text" id="postcode" name="schedule_address" value="${requestScope.temAdr[0] }" required="required" onclick="execDaumPostcode()" readonly="readonly"> 
					<input type="button" onclick="execDaumPostcode()" value="주소 찾기">
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="text" id="address" name="schedule_address"	value="${requestScope.temAdr[1] }" required="required" onclick="execDaumPostcode()" readonly="readonly"> 
					<input type="text" id="address2" name="schedule_address" value="${requestScope.temAdr[2] }">
				</td>
			</tr>
			<tr>
				<td>일정 내용</td>
				<td><textarea id="schedule_contents" name="schedule_contents" rows="3" cols="50">${requestScope.preSchedule.schedule_contents }</textarea></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="수정">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</div>


</body>
<script>
	$('.some_class').datetimepicker({
		lang:'ko',
		format: 'Y-m-d \\TH:i'
	});
</script>
</html>