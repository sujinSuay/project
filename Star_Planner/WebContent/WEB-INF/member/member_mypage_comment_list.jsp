<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){

	$.ajax({
		"url":"/Star_Planner/member/searchCommentList.do",
		"type":"post",
		"data":"m_id=${sessionScope.loginId}",
		"dataType":"json",
		"success":function(comment){
			if(comment.isEmpty){
				$("#commentTable").append("<tr><td colspan='6'>댓글이 없습니다.</td></tr>");
			}else{
				for(var i=0;i<comment.length;i++){
					thtml="<tr><td>" + comment[i].comment_id+"</td>"+
					 		"<td align='left'><a href='/Star_Planner/board/boardView.do?id="+comment[i].singer_name+"&no="+comment[i].board_no+"&page=1'>"+comment[i].comment_content+"</a></td>"+
					 		"<td>"+comment[i].singer_name+"</td>"+
							"<td>"+comment[i].comment_date+"</td>"+
							"<td><button id='deleteComment' onclick='deleteComment("+comment[i].comment_id+")' style='width: 78px; height: 30px; background: url(\"/Star_Planner/img/btn_d_del.gif\") center; background-repeat: no-repeat; border-radius: 5px;'></button></td></tr>";
					$("#commentTable").append(thtml); 
				}
				
			}
			
		},
		"error":function(xhr, status, errorMsg){
			alert("오류 발생 - "+status+","+errorMsg);
		},
		"beforeSend":function(){
		}
	});
	
});
function deleteComment(comment_id){
	alert(comment_id);
	$.ajax({
		"url":"/Star_Planner/member/deleteMyComment.do",
		"type":"post",
		"data":"comment_id="+comment_id,
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
var stripe = function() {
	/* var tables = document.getElementsByTagName("table"); */
	var tables = document.getElementsByName("listTable");

	for(var x=0;x!=tables.length;x++){
		var table = tables[x];
		if (! table) { return; }
		
		var tbodies = table.getElementsByTagName("tbody");
		
		for (var h = 0; h < tbodies.length; h++) {
			var even = true;
			var trs = tbodies[h].getElementsByTagName("tr");
			
			for (var i = 0; i < trs.length; i++) {
				trs[i].onmouseover=function(){
					this.className += " ruled"; return false
				}
				trs[i].onmouseout=function(){
					this.className = this.className.replace("ruled", ""); return false
				}
				
			}
		}
	}
}

window.onload = stripe;
</script>
<style type="text/css">

tbody tr.ruled td{
		color: #000;
		background-color: #C6E3FF; 
		font-weight: bold;
		border-color: #3292FC;
}

</style>
</head>
<body>
<div style=" height: 200px; width:100%; overflow-x: hidden; overflow-y: scroll; padding-bottom: 30px;">
	<table style="width: 100%" name="listTable">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th width="55%">내용</th>
				<th width="10%">게시판</th>
				<th width="15%">날짜</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody align="center" id="commentTable">
			
		</tbody>
	</table>
</div>
</body>
</html>