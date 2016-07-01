<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_main</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#searchBtn").on("click",function(){
		$.ajax({
			"url":"/Star_Planner/board/searchSinger.do",
			"type":"post",
			"data":"keyword="+$("#keyword").val(),
			"dataType":"json",
			"success":function(obj){
				$("#searchResult").html("검색된 가수:&nbsp;&nbsp;")
				if(obj.length == 0){
					$("#searchResult").append("조건에 일치하는 가수가 없습니다.");
				}else{
					for (var i = 0; i < obj.length; i++) {
						$("#searchResult").append("<a href='/Star_Planner/board/boardList.do?id="+obj[i]+"&page=1'>"+obj[i]+"</a>&nbsp;&nbsp;&nbsp;");
					}	
				}
			},
			"error":function(xhr, status, errorMsg){
				alert("오류 발생 - "+status+","+errorMsg);
			},
			"beforeSend":function(){
				if(!$("#keyword").val()){
					alert("조회할 가수 입력");
					$("#keyword").focus();
					return false;
				};
			}
		});
	});
});
</script>
<style type="text/css">
.title{
	font-weight: bold;
}
table {
    border-collapse: collapse;
    min-width: 800px;
    width: 80%;
}
td{
	padding-bottom: 10px;
	vertical-align: top;
}
.body{
	width: 100%;
}
</style>
</head>
<body>
<div align="center" class="body">
	<table>
		<tr align="center">
			<td colspan="4">
				<input type="text" id="keyword" size="20">
				<input type="button" id="searchBtn" value="검색">
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<c:if test="${sessionScope.loginId != null }">
					${sessionScope.loginId }님 선호 가수 리스트:&nbsp;&nbsp;
					<c:forEach items="${requestScope.favorite }" var="favorite">
						<a href="/Star_Planner/board/boardList.do?id=${favorite }&page=1">${favorite }</a>&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<div id="searchResult">검색된 가수:&nbsp;&nbsp;</div><br><br>
			</td>
		</tr>
		<tr align="center">
			<td class="title">일간 검색 순위</td>
			<td class="title">조회수 많은 게시글</td>
			<td class="title">좋아요 많은 게시글</td>
			<td class="title">팔로워 많은순</td>
		</tr>
		<tr align="center">
			<td width="200">
				<c:forEach items="${requestScope.list1 }" var="list1" varStatus="no" begin="0" end="9">
					<a href="/Star_Planner/board/boardList.do?id=${list1.singer.singer_name }&page=1">${no.count}. ${list1.singer.singer_name }</a>
					<br>
				</c:forEach>
			</td>
			<td width="200">
				<c:forEach items="${requestScope.list2 }" var="list2" varStatus="no" begin="0" end="9">
					<a href="/Star_Planner/board/boardView.do?id=${list2.singer_name }&no=${list2.board_no }&page=1">${no.count}. (${list2.singer_name })${list2.board_title }</a>
					<br>
				</c:forEach>
			</td>
			<td width="200">
				<c:forEach items="${requestScope.list3 }" var="list3" varStatus="no" begin="0" end="9">
					<a href="/Star_Planner/board/boardView.do?id=${list3.singer_name }&no=${list3.board_no }&page=1">${no.count}. (${list3.singer_name })${list3.board_title }</a>
					<br>
				</c:forEach>
			</td>
			<td width="200">
				<c:forEach items="${requestScope.list4 }" var="list3" varStatus="no" begin="0" end="9">
					<a href="/Star_Planner/board/boardList.do?id=${list3.singer_name }&page=1">${no.count}. ${list3.singer_name }</a>
					<br>
				</c:forEach>
			</td>
		</tr>
		<tr height="50"></tr>
		<tr align="center">
			<td class="title">남자그룹</td>
			<td class="title">여자그룹</td>
			<td class="title">남자솔로</td>
			<td class="title">여자솔로</td>
		</tr>
		<tr align="center">
			<td width="200">
				<c:forEach items="${requestScope.singer.mGroup }" var="singer" varStatus="cnt">
					<a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a>
					<c:if test="${cnt.count%2==0 }">
						<br>
					</c:if>
				</c:forEach>
			</td>
			<td width="200">
				<c:forEach items="${requestScope.singer.fGroup }" var="singer">
					<a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a>
					<br>
				</c:forEach>
			</td>
			<td width="200">
				<c:forEach items="${requestScope.singer.mSolo }" var="singer">
					<a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a>
					<br>
				</c:forEach>
			</td>
			<td width="200">
				<c:forEach items="${requestScope.singer.fSolo }" var="singer">
					<a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a>
					<br>
				</c:forEach>
			</td>
		</tr>
	</table>
</div>
	



</body>
</html>