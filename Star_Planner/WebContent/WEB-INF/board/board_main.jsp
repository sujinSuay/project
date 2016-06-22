<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_main</title>
<script type="text/javascript" src="/jQuery_class/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#searchBtn").on("click",function(){
		$.ajax({
			"url":"/Star_Planner/board/searchSinger.do",
			"type":"post",
			"data":"keyword="+$("#keyword").val(),//요청파라미터 두가지방식 다됨 - queryString(n=v&n=v) || Javascript객체{n:v,n:v}
			"dataType":"text",//응답 데이터의 타입 지정: text가 default
			"success":function(txt){
				//매개변수: 1.응답데이터, 2.응답상태 메세지, 3.XMLHttpRequest - 3가지 모두 생략가능
				$("#searchResult").html(txt);
				//$("#layer").html(txt);//갱신
			},
			"error":function(xhr, status, errorMsg){
				//매개변수: 1.XMLhttpRequest, 2.응답메세지(jQuery) - success||error, 3.HTTP 응답 메세지 - 모두 생략가능
				alert("오류 발생 - "+status+","+errorMsg);
			},
			"beforeSend":function(){
				if(!$("#keyword").val()){
					alert("조회할 가수 입력");
					$("#keyword").focus();
					return false;
				};
			}
		});
	});
});
</script>

</head>
<body>

<table>
	<tr align="center">
		<td colspan="4">
			<select name="prefix">
				<c:forEach items="${requestScope.codeList }" var="code">
					<option ${code.codeName == param.prefix?'selected="selected"':'' }>${code.codeName }</option>
				</c:forEach>
			</select>
			<input type="text" id="keyword" size="20">
			<input type="button" id="searchBtn" value="검색">
		</td>
	</tr>
	<tr>
		<td colspan="4">
			XX님 선호 가수 리스트:
			<c:forEach items="${requestScope.favoriteList }" var="favorite">
				<a href="board_list.do">${favorite.Name }</a>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			검색된 가수: <a href="board/boardList.do?id=twice&page=1">#twice 이동Test</a><br>
			<div id="searchResult"></div>
			<p>
		</td>
	</tr>
	
	<tr>
		<td align="center">남자그룹</td>
		<td align="center">여자그룹</td>
		<td align="center">남자솔로</td>
		<td align="center">여자솔로</td>
	</tr>
	<tr>
		<td width="200">남자그룹 리스트</td>
		<td width="200">여자가수 리스트</td>
		<td width="200">남자솔로 리스트</td>
		<td width="200">여자솔로 리스트</td>
	</tr>
</table>

</body>
</html>