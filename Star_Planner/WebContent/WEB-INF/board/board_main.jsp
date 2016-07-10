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
				$("#searchResult").html("")
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
.bold_text{
	font-weight: bold;
}
table {
    min-width: 800px;
    width: 100%;
}
td{
	padding-bottom: 10px;
	vertical-align: top;
}
#search .blue_window{
	display:-moz-inline-block;
	display:-moz-inline-box;
	display:inline-block;
	width:358px;
	height:26px;
	border:7px solid #4165CF;
	background-color:#fff
	}
#search .input_text{
	width:323px;
	height:17px;
	border:0 none;
	font-weight:bold;
	font-size:14px;
	color:#000;*ime-mode:active;
	outline:none
}
</style>
</head>
<body>
<table>
	<tr align="center">
		<td colspan="4" id="search">
			<span class="blue_window"><input type="text" id="keyword" size="20" class="input_text"></span>
			<input type="image" id="searchBtn" src="/Star_Planner/img/btn_d_search.png" style="vertical-align: middle;">
		</td>
	</tr>
	<tr>
		<td colspan="4" style="padding-left: 20px;">
			<c:if test="${sessionScope.loginId != null }">
				${sessionScope.loginId }님 선호 가수 리스트:&nbsp;&nbsp;
				<c:forEach items="${requestScope.favorite }" var="favorite">
					<a href="/Star_Planner/board/boardList.do?id=${favorite }&page=1" class="bold_text">${favorite }</a>&nbsp;&nbsp;&nbsp;
				</c:forEach>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4" style="padding-left: 20px;">
			<span style="float: left; padding-left: 80px;">검색된 가수:&nbsp;&nbsp;</span>
			<div id="searchResult" class="bold_text" style="min-height: 20px;"></div><br><br>
		</td>
	</tr>
	<tr align="center">
		<td class="bold_text" width="200">일간 검색 순위</td>
		<td class="bold_text" width="200">조회수 많은 게시글</td>
		<td class="bold_text" width="200">좋아요 많은 게시글</td>
		<td class="bold_text" width="200">팔로워 많은순</td>
	</tr>
	<tr align="center">
		<td align="left" style="padding-left: 80px;">
			<c:forEach items="${requestScope.list1 }" var="list1" varStatus="no" begin="0" end="9">
				<a href="/Star_Planner/board/boardList.do?id=${list1.singer.singer_name }&page=1"><span style="font-weight: bold;">${no.count}.</span> ${list1.singer.singer_name }</a>
				<br>
			</c:forEach>
		</td>
		<td align="left" style="padding-left: 25px;">
			<c:forEach items="${requestScope.list2 }" var="list2" varStatus="no" begin="0" end="9">
				<a href="/Star_Planner/board/boardView.do?id=${list2.singer_name }&no=${list2.board_no }&page=1"><span style="font-weight: bold;">${no.count}.</span> (${list2.singer_name })${list2.board_title }</a>
				<br>
			</c:forEach>
		</td>
		<td align="left" style="padding-left: 25px;">
			<c:forEach items="${requestScope.list3 }" var="list3" varStatus="no" begin="0" end="9">
				<a href="/Star_Planner/board/boardView.do?id=${list3.singer_name }&no=${list3.board_no }&page=1"><span style="font-weight: bold;">${no.count}.</span> (${list3.singer_name })${list3.board_title }</a>
				<br>
			</c:forEach>
		</td>
		<td align="left" style="padding-left: 80px;">
			<c:forEach items="${requestScope.list4 }" var="list3" varStatus="no" begin="0" end="9">
				<a href="/Star_Planner/board/boardList.do?id=${list3.singer_name }&page=1"><span style="font-weight: bold;">${no.count}.</span> ${list3.singer_name }</a>
				<br>
			</c:forEach>
		</td>
	</tr>
	<tr height="50"></tr>
	<tr align="center">
		<td class="bold_text">남자그룹</td>
		<td class="bold_text">여자그룹</td>
		<td class="bold_text">남자솔로</td>
		<td class="bold_text">여자솔로</td>
	</tr>
	<tr>
		<td style="padding-left: 35px; padding-right: 35px;">
			<c:forEach items="${requestScope.singer.mGroup }" var="singer" varStatus="cnt">
				<c:choose>
					<c:when test="${cnt.count%2==0 }">
						<div style="width: 50%; float: left;" align="center"><a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a></div>
						<br>
					</c:when>
					<c:otherwise>
						<div style="width: 50%; float: left;" align="center"><a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a></div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</td>
		<td style="padding-left: 35px; padding-right: 35px;">
			<c:forEach items="${requestScope.singer.fGroup }" var="singer" varStatus="cnt">
				<c:choose>
					<c:when test="${cnt.count%2==0 }">
						<div style="width: 50%; float: left;" align="center"><a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a></div>
						<br>
					</c:when>
					<c:otherwise>
						<div style="width: 50%; float: left;" align="center"><a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a></div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</td>
		<td style="padding-left: 35px; padding-right: 35px;">
			<c:forEach items="${requestScope.singer.mSolo }" var="singer" varStatus="cnt">
				<c:choose>
					<c:when test="${cnt.count%2==0 }">
						<div style="width: 50%; float: left;" align="center"><a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a></div>
						<br>
					</c:when>
					<c:otherwise>
						<div style="width: 50%; float: left;" align="center"><a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a></div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</td>
		<td style="padding-left: 35px; padding-right: 35px;">
			<c:forEach items="${requestScope.singer.fSolo }" var="singer" varStatus="cnt">
				<c:choose>
					<c:when test="${cnt.count%2==0 }">
						<div style="width: 50%; float: left;" align="center"><a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a></div>
						<br>
					</c:when>
					<c:otherwise>
						<div style="width: 50%; float: left;" align="center"><a href="/Star_Planner/board/boardList.do?id=${singer.singer_name }&page=1">${singer.singer_name }</a></div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</td>
	</tr>
</table>
	



</body>
</html>