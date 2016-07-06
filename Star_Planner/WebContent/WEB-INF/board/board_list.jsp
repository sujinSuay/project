<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    width: 100%;
    margin-bottom: 20px;
}
</style>
</head>
<body>
<div class="body" align="center">
	<div class="innerBody">
		<h2 align="left"><span class="galleryName">${param.id }</span> <span class="gallery">갤러리</span></h2>
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
						<td width="10%">${board.board_writer_type}&nbsp;${board.board_no }</td>
						<td align="left" width="50%">
							<a href="/Star_Planner/board/boardView.do?id=${param.id}&no=${board.board_no}&page=${paging.page}">
								${board.board_title }
							</a>
						</td>
						<td width="10%"><%--  --%>${board.m_id }</td>
						<td width="20%"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_date }"/></td>
						<td width="5%">${board.board_hits }</td>
						<td width="5%">${board.board_likes }</td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
		<div style="width: 100%">
			<a href="/Star_Planner/board/boardList.do?id=${param.id }&page=1" style="float: left;">전체보기</a>
			<c:if test="${sessionScope.loginId != null }">
				<a href="/Star_Planner/board/boardWriterForm.do?id=${param.id }" style="float: right;">글쓰기</a>
			</c:if>
		</div>
	</div>
</div>

<%--페이징 처리 --%>
<br>
<%--◀이전 페이지 그룹 처리 --%>
<div align="center">
	<c:choose>
		<c:when test="${requestScope.paging.previousPageGroup }">
			<a href="/Star_Planner/board/boardList.do?id=${param.id}&page=${requestScope.paging.beginPage - 1}">◀</a>
		</c:when>
		<c:otherwise>◀</c:otherwise>
	</c:choose>
	<%--페이지 처리 --%>
	<c:forEach begin="${requestScope.paging.beginPage }" end="${requestScope.paging.endPage }" var="page">
	&nbsp;
		<c:choose>
			<c:when test="${page == requestScope.paging.page }">[${page }]</c:when>
			<c:otherwise>
				<a href="/Star_Planner/board/boardList.do?id=${param.id}&page=${page }">${page }</a>
			</c:otherwise>
		</c:choose>
	&nbsp;
	</c:forEach>
	<%--다음 페이지 그룹 처리 ▶--%>
	<c:choose>
		<c:when test="${requestScope.paging.nextPageGroup }">
			<a href="/Star_Planner/board/boardList.do?id=${param.id}&page=${requestScope.paging.endPage + 1}">▶</a>
		</c:when>
		<c:otherwise>▶</c:otherwise>
	</c:choose>
</div>

</body>
</html>