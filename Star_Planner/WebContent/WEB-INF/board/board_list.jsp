<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
</head>
<body>
<h2>선택된 가수의 게시판</h2>
<form action="/Star_Planner/board/NoticeWriterForm.do" method="post">왜안되 시발<input type="submit" value="test"></form>
<a href="board_detail.do">insert</a>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th>조회</th>
			<th>추천</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.list }" var="notice">
			<tr>
				<td>${notice.no }</td>
				<td>
					<%-- <a href="${initParam.rootPath }/controller?command=noticeView&no=${notice.no}&page=${paging.page}">
						${notice.wholeTitle }
					</a> --%>
					<a href="board_detail.do?no=${notice.no}&page=${paging.page}">
						${notice.Title }
					</a>
				</td>
				<td>${notice.writer }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.writeDate }"/></td>
				<td>${notice.hit }</td>
				<td>${notice.like }</td>
			</tr>	
		</c:forEach>
	</tbody>
</table>
<%--페이징 처리 --%>
<p>
<%--◀이전 페이지 그룹 처리 --%>
<c:choose>
	<c:when test="${requestScope.paging.previousPageGroup }">
		<a href="${initParam.rootPath }/controller?command=noticeList&page=${requestScope.paging.beginPage - 1}">
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
			<a href="${initParam.rootPath }/controller?command=noticeList&page=${page }">
				${page }
			</a>
		</c:otherwise>
	</c:choose>
&nbsp;&nbsp;
</c:forEach>
<%--다음 페이지 그룹 처리 ▶--%>
<c:choose>
	<c:when test="${requestScope.paging.nextPageGroup }">
		<a href="${initParam.rootPath }/controller?command=noticeList&page=${requestScope.paging.endPage + 1}">
		▶
		</a>
	</c:when>
	<c:otherwise>▶</c:otherwise>
</c:choose>
</p>
</body>
</html>