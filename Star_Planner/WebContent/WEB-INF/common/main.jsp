<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>

<c:forEach var="link" items="${requestScope.list }" varStatus="status">

	<iframe width="350" height="300" src="${link }" frameborder="0" allowfullscreen></iframe>
&nbsp; &nbsp;
		<c:if test="${status.count}==3">
			<br><br>
		</c:if>
</c:forEach>


<!-- https://www.youtube.com/embed/nrlh9RfbweE
https://www.youtube.com/embed/FjWMQyZXm20
https://www.youtube.com/embed/hth1VQNPtj0
https://www.youtube.com/embed/BbQG-S4mU0U
https://www.youtube.com/embed/c7rCyll5AeY
https://www.youtube.com/embed/c7rCyll5AeY?list=RDc7rCyll5AeY -->




</body>
</html>