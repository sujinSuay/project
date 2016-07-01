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
	
	<c:choose>
		<c:when test="${status.index == 0 || status.index == 1 || status.index == 2}">
			<iframe width="420" height="250" src="${link }"   scrolling=no></iframe>
		</c:when>
		<c:otherwise>
			<img class="content" width="320px" height="400px" src="${link }">
		</c:otherwise>
	
		
		
		</c:choose>
	</c:forEach>

<!--    <img class="content" width="300px" src=" "> -->



</body>
</html>