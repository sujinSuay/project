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
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#fileDelete").on("click",function(){
		var file = $("#upfile").val();
		document.getElementById(file).remove();
		$(this).remove();
		$("#upfile").val(null);
	});
});
</script>
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
<input type="hidden" name="page" value="${param.page }">
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
			<div id="upfileList">
				<c:forEach items="${requestScope.file_names }" var="file">
					<div id="${file }blcok">
						<c:if test="${file != null ||file !='' }">
							<img width="20%" height="20%" id="${file}" src="/Star_Planner/uploadFile/${file}">
							<input type="button" id="fileDelete" value="삭제">
							<input type="hidden" id="upfile" name="upfile" value='${file}'>
						</c:if>
					</div>
				</c:forEach>
			</div>
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