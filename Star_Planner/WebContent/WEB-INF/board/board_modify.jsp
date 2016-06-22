<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_modify</title>
<style type="text/css">
select{
	width: 70px;
}

</style>
</head>
<body>
<c:if test="${not empty requestScope.errorList }">
	<ul id="error">
		<c:forEach items="${requestScope.errorList }" var="error">
			<li>${error }</li>
		</c:forEach>
	</ul>
</c:if>

<form action="/Star_Planner/board/boardModify.do" method="post">
<input type="hidden" name="id" value="${param.id }">
<input type="hidden" name="no" value="${param.no }">
<table>
	<tr>
		<td>
			<%-- <select name="prefix">
				<c:forEach items="${requestScope.codeList }" var="code">
					<option ${code.codeName == param.prefix?'selected="selected"':'' }>${code.codeName }</option>
				</c:forEach>
			</select> --%>
			<input type="text" name="board_title" size="70" placeholder="제목" value="${requestScope.board.board_title }">
		</td>
	</tr>
	<tr>
		<td>
			<textarea rows="20" cols="100" name="board_content">${requestScope.board.board_content }</textarea>
		</td>
	</tr>
	<tr>
		<td align="center"><input type="submit" value="저장"> <input type="reset" value="초기화"></td>
	</tr>	
</table>
</form>
</body>
</html>