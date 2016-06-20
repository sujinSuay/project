<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_main</title>
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
			<input type="text" name="title" size="20" value="${param.title }">
			<input type="button" name="search" value="검색">
		</td>
	</tr>
	<tr>
		<td colspan="4">
			XX님 선호가수 리스트:
			<c:forEach items="${requestScope.favoriteList }" var="favorite">
				<a href="board_list.do">${favorite.Name }</a>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			검색된 가수: <a href="board_list.do?id='twice'">#twice 이동Test</a>
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