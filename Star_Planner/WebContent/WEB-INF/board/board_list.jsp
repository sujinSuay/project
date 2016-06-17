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
<h2>게시판</h2>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>공지일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.list }" var="notice">
			<tr>
				<td>${notice.no }</td>
				<td>
					<a href="${initParam.rootPath }/controller?command=noticeView&no=${notice.no}&page=${paging.page}">
						${notice.wholeTitle }
					</a>
				</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.writeDate }"/></td>
				<td>${notice.viewCount }</td>
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