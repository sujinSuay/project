<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_register</title>
<style type="text/css">
select{
	width: 70px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#form").on("submit",function(){
		var flag = true;
		var maxSize  = 5 * 1024 * 1024    //30MB
        var fileSize = 0;

		// 브라우저 확인
		var browser=navigator.appName;
		
		// 익스플로러일 경우
		if (browser=="Microsoft Internet Explorer")
		{
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile( file.value ).size;
		}
		// 익스플로러가 아닐경우
		else
		{
			fileSize = file.files[0].size;
		}
		alert("파일사이즈 : "+ fileSize +", 최대파일사이즈 : 5MB");
	    if(fileSize > maxSize)
	    {
	        alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.    ");
	        flag = false;
	    }
	    if(!flag) return false;
	});
});
</script>
</head>
<body>
<%-- <c:if test="${not empty requestScope.errorList }">
	<ul id="error">
		<c:forEach items="${requestScope.errorList }" var="error">
			<li>${error }</li>
		</c:forEach>
	</ul>
</c:if> --%>
<form action="/Star_Planner/board/boardWriter.do" method="post" id="form" enctype="multipart/form-data">
<input type="hidden" name="id" value="${param.id }">
<table>
	<tr>
		<td>
			<%-- <select name="prefix">
				<c:forEach items="${requestScope.codeList }" var="code">
					<option ${code.codeName == param.prefix?'selected="selected"':'' }>${code.codeName }</option>
				</c:forEach>
			</select> --%>
			<input type="text" name="board_title" size="70" placeholder="제목" value="${param.board_title }" required="required">
		</td>
	</tr>
	<tr>
		<td>
			<input type="file" name="upfile">
			<input type="file" name="upfile">
			<input type="file" name="upfile">
		</td>
	</tr>
	<tr>
		<td>
			<textarea rows="20" cols="100" name="board_content" required="required">${param.board_content }</textarea>
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="submit" value="저장">&nbsp;
			<input type="reset" value="초기화">&nbsp;
			<a href="/Star_Planner/board/boardList.do?id=${param.id }&page=1">취소</a>
		</td>
	</tr>	
</table>
</form>
</body>
</html>