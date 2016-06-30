<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function(){
	if($("#sel").val()=="id"){
		callId();
	} else callGroup();
	$("#sel").on("change",function(){
		if($(this).val()=="id") callId();
		else callGroup();
	});
});
function callGroup(){
	$.ajax({
		"url":"/Star_Planner/member/searchScheduleByGroup.do",
		"type":"post",
		"data":"group_id=${sessionScope.groupId}",
		"dataType":"json",
		"success":function(schedule){
			$("#listTable").empty();
			if(schedule.isEmpty){
				$("#listTable").append("<tr><td colspan='6'>스케쥴이 없습니다.</td></tr>");
			}else{
				var thtml="";
				for(var i=0;i<schedule.length;i++){
					thtml="<tr><td>"+schedule[i].schedule_start+"<br>~"+schedule[i].schedule_end+"</td>"+
					 		"<td>" + schedule[i].singer.singer_name+"</td>"+
					 		"<td>"+schedule[i].schedule_name+"</td>"+
							"<td>"+schedule[i].schedule_address+"</td>"+
							"<td>"+schedule[i].schedule_contents+"</td>"+
							"<td>"+schedule[i].m_id+"</td>"+
							"<td align='center'><a href='/Star_Planner/schedule/modifySchedule.do?schedule_id="+schedule[i].schedule_id+"'>수정</a></td>"+
							"<td><button id='deleteSchedule' value='삭제' onclick='deleteSchedule("+schedule[i].schedule_id+")'>삭제</button></td></tr>";
		
					$("#listTable").append(thtml); 
				}
				
			}
			
		},
		"error":function(xhr, status, errorMsg){
			alert("오류 발생 - "+status+","+errorMsg);
		},
		"beforeSend":function(){
		}
	});
	
}
function callId(){
	$.ajax({
		"url":"/Star_Planner/member/searchScheduleById.do",
		"type":"post",
		"data":"m_id=${sessionScope.loginId}",
		"dataType":"json",
		"success":function(schedule){
			$("#listTable").empty();
			if(schedule.isEmpty){
				$("#listTable").append("<tr><td colspan='6'>스케쥴이 없습니다.</td></tr>");
			}else{
				var thtml="";
				for(var i=0;i<schedule.length;i++){
					thtml="<tr><td>"+schedule[i].schedule_start+"<br>~"+schedule[i].schedule_end+"</td>"+
					 		"<td>" + schedule[i].singer.singer_name+"</td>"+
					 		"<td>"+schedule[i].schedule_name+"</td>"+
							"<td>"+schedule[i].schedule_address+"</td>"+
							"<td>"+schedule[i].schedule_contents+"</td>"+
							"<td>"+schedule[i].m_id+"</td>"+
							"<td align='center'><input type='button' location.href='/Star_Planner/schedule/scheduleModifyForm.do?schedule_id="+schedule[i].schedule_id+"' value='수정'></td>"+
							"<td><button id='deleteSchedule' value='삭제' onclick='deleteSchedule("+schedule[i].schedule_id+")'>삭제</button></td></tr>";
		
					$("#listTable").append(thtml); 
				}
				
			}
			
		},
		"error":function(xhr, status, errorMsg){
			alert("오류 발생 - "+status+","+errorMsg);
		},
		"beforeSend":function(){
		}
	});
}
function deleteSchedule(schedule_id){
	$.ajax({
		"url":"/Star_Planner/schedule/deleteSchedule.do",
		"type":"post",
		"data":"schedule_id="+schedule_id,
		"dataType":"text",
		"success":function(){
			window.location.reload();
		},
		"error":function(xhr, status, errorMsg){
			alert("오류 발생 - "+status+","+errorMsg);
		},
		"beforeSend":function(){
		}
	});
}
</script>
</head>
<body>
<select id="sel">
	<option id="byId" selected="selected" value="id">${sessionScope.loginId }</option>
	<option id="byGroup" value="group">소속사전체</option>
</select>
<div style=" height: 200px; width:1050px; overflow-x: hidden; overflow-y: scroll;">
	<table>
		<thead>
			<tr>
				<th width="300">날짜</th>
				<th width="100">가수</th>
				<th width="150">일정이름</th>
				<th width="200">일정장소</th>
				<th width="200">일정내용</th>
				<th width="150">매니저</th>
				<th width="100">수정</th>
				<th width="100">삭제</th>
			</tr>
		</thead>
		<tbody align="center" id="listTable">
			
		</tbody>
	</table>
</div>
</body>
</html>