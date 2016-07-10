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
				$("#listTable").append("<tr><td colspan='6'>일정이 없습니다.</td></tr>");
			}else{
				var thtml="";
				for(var i=0;i<schedule.length;i++){
					thtml="<tr><td>"+schedule[i].schedule_start+"<br>~"+schedule[i].schedule_end+"</td>"+
					 		"<td>" + schedule[i].singer.singer_name+"</td>"+
					 		"<td>"+schedule[i].schedule_name+"</td>"+
							"<td>"+schedule[i].schedule_address+"</td>"+
							"<td>"+schedule[i].schedule_contents+"</td>"+
							"<td>"+schedule[i].m_id+"</td>"+
							"<td align='center'><button onclick='modifyBtn("+schedule[i].schedule_id+")' disabled='${sessionScope.groupId>=10}?disable:' style='width: 78px; height: 30px; background: url(\"/Star_Planner/img/btn_d_correct.gif\") center; background-repeat: no-repeat;'></button></td>"+
							"<td><button id='deleteSchedule' onclick='deleteSchedule("+schedule[i].schedule_id+")' style='width: 78px; height: 30px; background: url(\"/Star_Planner/img/btn_d_del.gif\") center; background-repeat: no-repeat;'></button></td></tr>";
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
				$("#listTable").append("<tr><td colspan='6'>일정이 없습니다.</td></tr>");
			}else{
				var thtml="";
				for(var i=0;i<schedule.length;i++){
					thtml="<tr><td>"+schedule[i].schedule_start+"<br>~"+schedule[i].schedule_end+"</td>"+
					 		"<td>" + schedule[i].singer.singer_name+"</td>"+
					 		"<td>"+schedule[i].schedule_name+"</td>"+
							"<td>"+schedule[i].schedule_address+"</td>"+
							"<td>"+schedule[i].schedule_contents+"</td>"+
							"<td>"+schedule[i].m_id+"</td>"+
							"<td align='center'><button onclick='modifyBtn("+schedule[i].schedule_id+")' style='width: 78px; height: 30px; background: url(\"/Star_Planner/img/btn_d_correct.gif\") center; background-repeat: no-repeat; border-radius: 5px;'></button></td>"+
							"<td><button id='deleteSchedule' onclick='deleteSchedule("+schedule[i].schedule_id+")' style='width: 78px; height: 30px; background: url(\"/Star_Planner/img/btn_d_del.gif\") center; background-repeat: no-repeat; border-radius: 5px;'></button></td></tr>";
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
function modifyBtn(schedule_id){
	location.replace("/Star_Planner/schedule/scheduleModifyForm.do?schedule_id="+schedule_id);
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
<div id="modifyScheduleDiv" style=" height: 300px; width:100%; overflow-x: hidden; overflow-y: scroll; padding-bottom: 30px;">
	<table style="width: 100%;">
		<thead>
			<tr>
				<th width="15%">날짜</th>
				<th width="10%">가수</th>
				<th width="10%">일정이름</th>
				<th width="25%">일정장소</th>
				<th width="20%">일정내용</th>
				<th>매니저</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody align="center" id="listTable">
			
		</tbody>
	</table>
</div>
</body>
</html>