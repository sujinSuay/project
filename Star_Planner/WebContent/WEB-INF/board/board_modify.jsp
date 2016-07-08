<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_modify</title>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#fileDelete1").on("click",function(){
		this.parentNode.innerHTML="";
		var i=document.createElement("input");
		i.setAttribute('type', 'file');
		i.setAttribute('name', 'upfile1');
		$("#file1_field").append(i);
	});
	
	$("#fileDelete2").on("click",function(){
		this.parentNode.innerHTML="";
		var i=document.createElement("input");
		i.setAttribute('type', 'file');
		i.setAttribute('name', 'upfile2');
		$("#file2_field").append(i);
	});
	
	$("#fileDelete3").on("click",function(){
		this.parentNode.innerHTML="";
		var i=document.createElement("input");
		i.setAttribute('type', 'file');
		i.setAttribute('name', 'upfile3');
		$("#file3_field").append(i);
	});
});
</script>
</head>
<body>

<form action="/Star_Planner/board/boardModify.do" method="post" enctype="multipart/form-data" style="width: 100%;">
<input type="hidden" name="id" value="${param.id }">
<input type="hidden" name="no" value="${param.no }">
<input type="hidden" name="page" value="${param.page }">
<table style="width: 100%;">
	<tr>
		<td>
			<input type="text" name="board_title" style="width: 50%;" placeholder="제목" value="${requestScope.board.board_title }">
		</td>
	</tr>
	<tr>
		<td>
			<div id="upfileList">
				<div id="file1_field" style="float: left; padding-right: 10px;">
					<c:choose>
						<c:when test="${requestScope.upfile1 != 'noData' }">
							<img width="20%" height="20%" id="fileImg1" src="/Star_Planner/uploadFile/${requestScope.upfile1}">
							<input type	="button" id="fileDelete1" value="삭제">
							<input type="hidden" name="upfile1_lo" value="${requestScope.upfile1 }">
						</c:when>
						<c:otherwise>
							<input type="file" name="upfile1">
						</c:otherwise>
					</c:choose>
				</div>
				<div id="file2_field" style="float: left; padding-right: 10px;">
					<c:choose>
						<c:when test="${requestScope.upfile2 != 'noData' }">
							<img width="20%" height="20%" id="fileImg2" src="/Star_Planner/uploadFile/${requestScope.upfile2}">
							<input type="button" id="fileDelete2" value="삭제">
							<input type="hidden" name="upfile2_lo" value="${requestScope.upfile2 }">
						</c:when>
						<c:otherwise>
							<input type="file" name="upfile2">
						</c:otherwise>
					</c:choose>
				</div>
				<div id="file3_field" style="float: left;">
					<c:choose>
						<c:when test="${requestScope.upfile3 != 'noData' }">
							<img width="20%" height="20%" id="fileImg3" src="/Star_Planner/uploadFile/${requestScope.upfile3}">
							<input type="button" id="fileDelete3" value="삭제">
							<input type="hidden" name="upfile3_lo" value="${requestScope.upfile3 }">
						</c:when>
						<c:otherwise>
							<input type="file" name="upfile3">
							<input type="hidden" name="upfile3_lo" value="noData">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<textarea rows="20" name="board_content" style="width: 100%;">${requestScope.board.board_content }</textarea>
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="image" src="/Star_Planner/img/btn_save.gif">&nbsp;
			<a href="/Star_Planner/board/boardView.do?id=${param.id}&no=${param.no}&page=${param.page}"><img src="/Star_Planner/img/btn_cancle.gif"/></a>
		</td>
	</tr>	
</table>
</form>
</body>
</html>