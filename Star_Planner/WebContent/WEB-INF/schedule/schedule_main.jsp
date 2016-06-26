<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>schedule_main</title>
<link href='/Star_Planner/fullcalendar-2.7.3/fullcalendar.css' rel='stylesheet' />
<link href='/Star_Planner/fullcalendar-2.7.3/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/Star_Planner/fullcalendar-2.7.3/lib/moment.min.js'></script>
<script src='/Star_Planner/fullcalendar-2.7.3/lib/jquery.min.js'></script>
<script src='/Star_Planner/fullcalendar-2.7.3/fullcalendar.min.js'></script>
<script>

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '2016-05-12',
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
						{
							title: 'All Day Event',
							start: '2016-05-01'
						},
						{
							title: 'Long Event',
							start: '2016-05-07',
							end: '2016-05-10'
						},
						{
							id: 999,
							title: 'Repeating Event',
							start: '2016-05-09T16:00:00'
						},
						{
							id: 999,
							title: 'Repeating Event',
							start: '2016-05-16T16:00:00'
						},
						{
							title: 'Conference',
							start: '2016-05-11',
							end: '2016-05-13'
						},
						{
							title: 'Meeting',
							start: '2016-05-12T10:30:00',
							end: '2016-05-12T12:30:00'
						},
						{
							title: 'Lunch',
							start: '2016-05-12T12:00:00'
						},
						{
							title: 'Meeting',
							start: '2016-05-12T14:30:00'
						},
						{
							title: 'Happy Hour',
							start: '2016-05-12T17:30:00'
						},
						{
							title: 'Dinner',
							start: '2016-05-12T20:00:00'
						},
						{
							title: 'Birthday Party',
							start: '2016-05-13T07:00:00'
						},
						{
							title: 'Click for Google',
							url: 'http://google.com/',
							start: '2016-05-28'
						}
					]
		});
		$("#jsonBtn").on("click",function(){
			$.ajax({
				"url":"/calendar_test/calendar/findById_json.do",
				"type":"post",
				"data":{"id":$("#id").val()},
				"dataType":"text",
				"success":function(obj){
					/* var d = new Date(obj.birthday);
					alert(d.getFullYear()+"/"+d.getMonth()+1+"/"+d.getDate()); */
					
					/* var txt = obj.id+"<br>"+obj.name+"<br>"+obj.age+"<br>"+obj.birthday; */
					/* $("#result").html(obj); */
					
					$('#calendar').fullCalendar('addEventSource',{
					    events: [
					        {
					            title  : 'event1',
					            start  : '2016-05-27'
					        },
					        {
					            title  : 'event2',
					            start  : '2016-05-28',
					            end    : '2016-05-29'
					        },
					        {
					            title  : 'event3',
					            start  : '2016-05-30T12:30:00',
					            allDay : false // will make the time show
					        }
					    ]
					});
				},
				"error":function(xhr, status, errorMsg){
					alert("오류 발생 - "+status+","+errorMsg);
				}
			});
		});
		
	});

</script>
<!-- <style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}
	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
</style> -->
</head>
<body>
	<div id='calendar'></div>
	<h2>Ajax 요청 페이지</h2>
	<input type="text" id="id"><button id="jsonBtn">JSON호출btn</button>
	<p>
	<div id="result"></div>
</body>
</html>