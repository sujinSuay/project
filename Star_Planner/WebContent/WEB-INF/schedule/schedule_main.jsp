<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>schedule_main</title>


<link rel='stylesheet' href='/Star_Planner/fullcalendar-2.7.3/lib/cupertino/jquery-ui.min.css' />
<link href='/Star_Planner/fullcalendar-2.7.3/fullcalendar.css' rel='stylesheet' />
<link href='/Star_Planner/fullcalendar-2.7.3/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/Star_Planner/fullcalendar-2.7.3/lib/moment.min.js'></script>
<script src='/Star_Planner/fullcalendar-2.7.3/lib/jquery.min.js'></script>
<script src='/Star_Planner/fullcalendar-2.7.3/fullcalendar.min.js'></script>
<script src='/Star_Planner/fullcalendar-2.7.3/lang-all.js'></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<script>
	var tmpUrl = "/Star_Planner/schedule/selectSchedule.do";

	$(document).ready(function() {

		getAllEvent();
		
		$("#searchBtn").on("click",function(){
			if($("#category").val() == "가수"){
				tmpUrl = "/Star_Planner/schedule/searchSinger.do";
			}else if($("#category").val() == "회사"){
				tmpUrl = "/Star_Planner/schedule/searchGroup.do";
			}else if($("#category").val() == "지역"){
				tmpUrl = "/Star_Planner/schedule/selectScheduleByLocation.do";
			}
			$.ajax({
				"url":tmpUrl,
				"type":"post",
				"data":"keyword="+$("#keyword").val(),
				"dataType":"json",
				"success":function(data){
					$("#searchResult").html("검색 결과:&nbsp;&nbsp;");
					if($("#category").val() == "가수"){
						if (data.length != 0) {
							$.each(data, function(key, val) {
								$("#searchResult").append("<a href='' onClick='getSingerEvent("+val.singer_id+");return false' >"+val.singer_name+"</a>&nbsp;&nbsp;&nbsp;");
							});	
						}else{
							$("#searchResult").append("조건에 일치하는 가수가 없습니다.");
						}
					}else if($("#category").val() == "회사"){
						if (data.length != 0) {
							$.each(data, function(key, val) {
								$("#searchResult").append("<a href='' onClick='getGroupEvent("+val.group_id+");return false' >"+val.group_name+"</a>&nbsp;&nbsp;&nbsp;");
							});	
						}else{
							$("#searchResult").append("조건에 일치하는 회사가 없습니다.");
						}
					}else if($("#category").val() == "지역"){
						$("#searchResult").append($("#keyword").val());
						var eventsData = [];
						if (data.length != 0) {
							$.each(data, function(key, val) {
								var t = '('+val.singer.singer_name+') '+ val.schedule_name;
								if(val.group_id == '${sessionScope.groupId}'){
									eventsData.push({
										id : val.schedule_id,
										title : t,
										start : val.schedule_start,
										end : val.schedule_end,
										/* editable : true */
									});
								}else{
									eventsData.push({
										id : val.schedule_id,
										title : t,
										start : val.schedule_start,
										end : val.schedule_end
									});	
								}
							});
						}else{
							$("#searchResult").append(" 지역에는 일정이 없습니다.");
						}
						$('#calendar').fullCalendar('destroy');
						renderCalendar(eventsData);	
					}
					
				},
				"error":function(xhr, status, errorMsg){
					alert("오류 발생 - "+status+","+errorMsg);
				},
				"beforeSend":function(){
					if(!$("#keyword").val()){
						alert("조회할 " + $("#category").val() + " 입력");
						$("#keyword").focus();
						return false;
					}
				}
			});
		});
		
		$("#detail").dialog({
	    	autoOpen: false,
	    	resizable:false,
	    	draggable: false,
	    	minWidth: 780,
	    	buttons:{
                "장소확인":function(){
                    $(this).dialog("close");
                    getMap();
                },"닫기":function(){
                    $(this).dialog("close");
                }
            }
	    	
	    });
		
	});

	function getMap(){
		var address = $("#address").text().split('.');
		if(address[2] == null || address[2].trim() == ""){
			window.open('http://map.daum.net/link/search/'+address[1], "지도", "fullscreen" );
		}else{
			window.open('http://map.daum.net/link/search/'+address[2], "지도", "fullscreen" );
		}
	}
	
	function getSingerEvent(singerId){
		$.ajax({
			"url":"/Star_Planner/schedule/selectScheduleBySinger.do",
			"type":"post",
			"data":"singer_id="+singerId,
			"dataType":"json",
			"success":function(data){
				var eventsData = [];
				if (data.length != 0) {
					$.each(data, function(key, val) {
						if(val.group_id == '${sessionScope.groupId}'){
							eventsData.push({
								id : val.schedule_id,
								title : val.schedule_name,
								start : val.schedule_start,
								end : val.schedule_end,
								/* editable : true */
							});
						}else{
							eventsData.push({
								id : val.schedule_id,
								title : val.schedule_name,
								start : val.schedule_start,
								end : val.schedule_end
							});	
						}
						
					});
				}
				$('#calendar').fullCalendar('destroy');
				renderCalendar(eventsData);	
				
			},
			"error":function(xhr, status, errorMsg){
				alert("오류 발생 - "+status+","+errorMsg);
			}
		});
	}
	
	function getGroupEvent(groupId){
		$.ajax({
			"url":"/Star_Planner/schedule/selectScheduleByGroup.do",
			"type":"post",
			"data":"group_id="+groupId,
			"dataType":"json",
			"success":function(data){
				var eventsData = [];
				if (data.length != 0) {
					$.each(data, function(key, val) {
						var t = '('+val.singer.singer_name+') '+ val.schedule_name;
						if(val.group_id == '${sessionScope.groupId}'){
							eventsData.push({
								id : val.schedule_id,
								title : t,
								start : val.schedule_start,
								end : val.schedule_end,
								/* editable : true */
							});
						}else{
							eventsData.push({
								id : val.schedule_id,
								title : t,
								start : val.schedule_start,
								end : val.schedule_end
							});	
						}
						
					});
				}
				$('#calendar').fullCalendar('destroy');
				renderCalendar(eventsData);	
				
			},
			"error":function(xhr, status, errorMsg){
				alert("오류 발생 - "+status+","+errorMsg);
			}
		});
	}
	
	function getAllEvent() {
		$.ajax({
			url : "/Star_Planner/schedule/selectAllSchedule.do",
			type : 'post',
			dataType : 'json',
			success : function(data) {
				var eventsData = [];
				if (data.length != 0) {
					$.each(data, function(key, val) {
						var t = '('+val.singer.singer_name+') '+ val.schedule_name;
						if(val.group_id == '${sessionScope.groupId}'){
							eventsData.push({
								id : val.schedule_id,
								title : t,
								start : val.schedule_start,
								end : val.schedule_end,
								/* editable : true */
							});
						}else{
							eventsData.push({
								id : val.schedule_id,
								title : t,
								start : val.schedule_start,
								end : val.schedule_end
							});	
						}
					});
				}
				renderCalendar(eventsData);
			},
			error : function(request, textStatus, errorThrown) {
				alert('error: ' + textStatus);
			}
		});
	}

	function renderCalendar(eventsData) {
		$('#calendar').fullCalendar({
			theme: true,
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			lang : 'ko',
			timezone: 'local',
			//selectable: true,
			/* 
			selectHelper: true,
			select: function(start, end, jsEvent, view) {
				alert(jsEvent.events);
				alert(view.title);
				//var title = prompt('Event Title:');
				var eventData;
				if (title) {
					eventData = {
						title: title,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				}
				$('#calendar').fullCalendar('unselect');
			}, */
			eventRender : function(event, element) {
				element.bind('click', function() { // 일정보기,수정
					getData(event);
				});
			},
			editable : false,
			eventLimit : true,
			events : eventsData
		});
	}
	function getData(event){
		$.ajax({
			url : "/Star_Planner/schedule/getDataById.do",
			type : 'post',
			data: "schedule_id="+event.id,
			dataType : 'json',
			success : function(data) {
				$("#title").html(event.title);
				$("#date").html(event.start.format("YYYY-MM-DD a hh:mm")+" ~ "+event.end.format("YYYY-MM-DD a hh:mm"));
				$("#address").html(data.schedule_address);
				$("#contents").html((data.schedule_contents==null?'':data.schedule_contents));
				$("#detail").dialog("open");
			},
			error : function(request, textStatus, errorThrown) {
				alert('error: ' + textStatus);
			}
		});
	}
	
</script>
<style type="text/css">
tr{
	vertical-align: top;
	padding-bottom: 10px;
}
</style>
</head>
<body>
	<div align="center">
		<select id="category">
			<c:forEach items="${requestScope.categoryList }" var="category">
				<option>${category }</option>
			</c:forEach>
		</select>
		<input type="text" id="keyword" size="20">
		<input type="button" id="searchBtn" value="검색">
	</div>
	<p>
	<div id="searchResult">검색 결과:&nbsp;&nbsp;</div>
	<p>
	<div id='calendar' style="padding-bottom: 50px;"></div>

	<div id="detail" title="상세정보">
		<table>
			<tr>
				<td width="80">일정:&nbsp;</td>
				<td id="title"></td>
			</tr>
			<tr>
				<td>시간:&nbsp;</td>
				<td id="date" width="700"></td>
			</tr>
			<tr>
				<td>장소:&nbsp;</td>
				<td id="address"></td>
			</tr>
			<tr>
				<td>내용:&nbsp;</td>
				<td id="contents"></td>
			</tr>
		</table>
	</div>


</body>
</html>