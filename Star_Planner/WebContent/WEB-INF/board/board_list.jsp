<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
<style type="text/css">
/* table 스타일 처리  */
table, td, th {    
    border: 1px solid gray;
}
table {
    border-collapse: collapse;
    min-width: 800px;
}
th, td {
    padding: 5px;
}
</style>
</head>
<body>
<h2>${param.id } 갤러리</h2>
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
	<tbody align="center">
		<c:forEach items="${requestScope.list }" var="board">
			<tr>
				<td>${board.board_no }</td>
				<td align="left">
					<a href="/Star_Planner/board/boardView.do?id=${param.id}&no=${board.board_no}&page=${paging.page}">
						${board.board_title }
					</a>
				</td>
				<td>${board.m_id }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_date }"/></td>
				<td>${board.board_hits }</td>
				<td>${board.board_likes }</td>
			</tr>	
		</c:forEach>
	</tbody>
</table>
<p>
<!-- 글쓰기 -->
<c:if test="${sessionScope.loginId != null }">
	<a href="/Star_Planner/board/boardWriterForm.do?id=${param.id }">글쓰기</a>
</c:if>


<%--페이징 처리 --%>
<p>
<%--◀이전 페이지 그룹 처리 --%>
<c:choose>
	<c:when test="${requestScope.paging.previousPageGroup }">
		<a href="/Star_Planner/board/boardList.do?id=${param.id}&page=${requestScope.paging.beginPage - 1}">
		◀
		</a>
	</c:when>
	<c:otherwise>◀</c:otherwise>
</c:choose>
<%--페이지 처리 --%>
<c:forEach begin="${requestScope.paging.beginPage }" end="${requestScope.paging.endPage }" var="page">
	<c:choose>
		<c:when test="${page == requestScope.paging.page }">
		 [${page }]
		</c:when>
		<c:otherwise>
			<a href="/Star_Planner/board/boardList.do?id=${param.id}&page=${page }">
				${page }
			</a>
		</c:otherwise>
	</c:choose>
&nbsp;&nbsp;
</c:forEach>
<%--다음 페이지 그룹 처리 ▶--%>
<c:choose>
	<c:when test="${requestScope.paging.nextPageGroup }">
		<a href="/Star_Planner/board/boardList.do?id=${param.id}&page=${requestScope.paging.endPage + 1}">
		▶
		</a>
	</c:when>
	<c:otherwise>▶</c:otherwise>
</c:choose>
</p>
</body>
</html>