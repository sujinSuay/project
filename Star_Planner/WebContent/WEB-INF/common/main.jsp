<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<div align="center" style="min-width: 1280px;">
		<c:forEach var="link" items="${requestScope.list }" varStatus="status">
			<c:if test="${status.index == 0 || status.index == 1 || status.index == 2}">
				<c:if test="${link.link_address != null && link.link_address !='' }">
					<iframe width="420" height="250" src="${link.link_address }" scrolling=no allowfullscreen frameborder="0" ></iframe>
				</c:if>
			</c:if>
		</c:forEach>
		<br>
		<br>

		<table>
			<tr>
				<c:forEach var="link" items="${requestScope.list }"
					varStatus="status">
					<c:if test="${status.index == 3 || status.index == 4 || status.index == 5 || status.index == 6}">
						<td>
							<c:if test="${link.file_name != '' && link.file_name != null}">
								<a href="https://search.naver.com/search.naver?where=nexearch&query=${link.file_name }" target=_blank>
									<img class="content" width="350px" height="490px" src="${link.link_address }">
								</a>
							</c:if>
						</td>
					</c:if>
				</c:forEach>
			</tr>
			<%-- <tr>
				<c:forEach  var="link" items="${requestScope.list }" varStatus="status"> 
						<c:if test="${status.index == 3 || status.index == 4 || status.index == 5 || status.index == 6}">
						<td>태그: ${link.file_name }</td>
						</c:if>
				</c:forEach>
			</tr> --%>
		</table>
	</div>

</body>
</html>