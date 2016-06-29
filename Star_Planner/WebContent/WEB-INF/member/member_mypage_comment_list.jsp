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
					 		"<td align='center'><a href='/Star_Planner/board/boardView.do?id="+comment[i].singer_name+"&no="+comment[i].board_no+"&page=1'>"+comment[i].comment_content+"</a></td>"+
					 		"<td>"+comment[i].singer_name+"</td>"+
							"<td>"+comment[i].comment_date+"</td>"+
							"<td><button id='deleteComment' value='삭제' onclick='deleteComment("+comment[i].comment_id+")'>삭제</button></td></tr>";
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
</script>
</head>
<body>
<div style=" height: 200px; width:950px; overflow-x: hidden; overflow-y: scroll;">
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th width="300">내용</th>
				<th width="150">게시판</th>
				<th width="200">날짜</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody align="center" id="commentTable">
			
		</tbody>
	</table>
</div>
</body>
</html>