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
		"url":"/Star_Planner/board/searchBoardList.do",
		"type":"post",
		"data":"m_id=${sessionScope.loginId}",
		"dataType":"json",
		"success":function(board){
			alert(board[0].board_date);
			if(board.isEmpty){
				$("#listTable").append("<tr><td colspan='6'>게시글이 없습니다.</td></tr>");
			}else{
				for(var i=0;i<board.length;i++){
					
	
					thtml="<tr><td>" + board[i].board_no+"</td>"+
					 		"<td align='left'><a href='/Star_Planner/board/boardView.do?id="+board[i].singer_id+"&no="+board[i].board_no+"&page=1'>"+board[i].board_title+"</a></td>"+
					 		"<td>"+board[i].m_id+"</td>"+
							"<td>"+board[i].board_date+"</td>"+
							"<td>"+board[i].board_hits+"</td>"
							"<td>"+board[i].board_likes+"</td>";
				}
				$("#listTable").html(thtml); 
			}
			
		},
		"error":function(xhr, status, errorMsg){
			alert("오류 발생 - "+status+","+errorMsg);
		},
		"beforeSend":function(){
		}
	});
});
</script>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th width="150">글쓴이</th>
			<th width="200">날짜</th>
			<th>조회</th>
			<th>추천</th>
		</tr>
	</thead>
	<tbody align="center" id="listTable">
		
	</tbody>
</table>
</body>
</html>