<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body  >




	<c:forEach var="link" items="${requestScope.list }" varStatus="status">
			<c:if test="${status.index == 0 || status.index == 1 || status.index == 2}">
				<iframe width="420" height="250" src="${link.link_address }" scrolling=no></iframe>
			</c:if>
	</c:forEach>
	
	<br><br>
	
	<table>
	<tr>
	
	<c:forEach  var="link" items="${requestScope.list }" varStatus="status"> 
			<c:if test="${status.index == 3 || status.index == 4 || status.index == 5 || status.index == 6}">
			<td><a href="https://search.naver.com/search.naver?where=nexearch&query=${link.file_name }" target=_blank><img class="content" width="320px" height="370px" src="${link.link_address }"></a></td>
			</c:if>
	</c:forEach>
	</tr>
	<tr>
	<c:forEach  var="link" items="${requestScope.list }" varStatus="status"> 
			<c:if test="${status.index == 3 || status.index == 4 || status.index == 5 || status.index == 6}">
			<td>태그: ${link.file_name }</td>
			</c:if>
	</c:forEach>
</tr>	
	
</table>



</body>
</html>