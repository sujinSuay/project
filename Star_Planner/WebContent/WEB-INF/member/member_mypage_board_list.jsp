<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		"url":"/Star_Planner/member/searchBoardList.do",
		"type":"post",
		"data":"m_id=${sessionScope.loginId}",
		"dataType":"json",
		"success":function(board){
			if(board.isEmpty){
				$("#boardTable").append("<tr><td colspan='6'>게시글이 없습니다.</td></tr>");
			}else{
				var thtml="111";
				for(var i=0;i<board.length;i++){
					thtml="<tr><td>" + board[i].board_no+"</td>"+
					 		"<td align='left'><a href='/Star_Planner/board/boardView.do?id="+board[i].singer_name+"&no="+board[i].board_no+"&page=1'>"+board[i].board_title+"</a></td>"+
					 		"<td>"+board[i].singer_name+"</td>"+
							"<td>"+board[i].board_date+"</td>"+
							"<td>"+board[i].board_hits+"</td>"+
							"<td>"+board[i].board_likes+"</td>"+
							"<td><button id='deleteBoard' value='삭제' onclick='deleteBoard("+board[i].board_no+")'>삭제</button></td></tr>";
		
					$("#boardTable").append(thtml); 
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
function deleteBoard(board_no){
	alert(board_no);
	$.ajax({
		"url":"/Star_Planner/member/deleteMyBoard.do",
		"type":"post",
		"data":"board_no="+board_no,
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
<div style=" height: 200px; width:100%; overflow-x: hidden; overflow-y: scroll;">
	<table style="width: 100%;">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="10%">게시판</th>
				<th width="15%">날짜</th>
				<th>조회</th>
				<th>추천</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody align="center" id="boardTable">
		</tbody>
	</table>
</div>
</body>
</html>