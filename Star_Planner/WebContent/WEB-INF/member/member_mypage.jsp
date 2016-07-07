<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.td{
	font-weight: bold;
	padding-left: 10px;
	padding-right: 10px;
	padding-bottom: 5px;
	width: 12%;
}
</style>
</head>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
<body>
	<h2>회원정보</h2>

	<div id="member_info">
		<table>
			<tr>
				<td class="td">회원 아이디</td>
				<td class="info">${requestScope.member.m_id }</td>
				<td class="td">선호가수</td>
				<td class="info">${requestScope.member.favorite }</td>
			</tr>
			<tr>
				<td class="td">회원 이름</td>
				<td class="info">${requestScope.member.name }</td>
				<td class="td">성별</td>
				<td class="info">${requestScope.member.gender}</td>
			</tr>
			<tr>
				<td class="td">주소</td>
				<td class="info">${requestScope.member.address }</td>
				<td class="td"></td>
				<td class="info"><input type="button" id="modify" value="정보변경"
					onclick="location.href='modifyForm.do'"></td>
			</tr>
			<tr>
				<td class="td">생년월일</td>
				<td class="info">${requestScope.member.social_no }</td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<c:if test="${sessionScope.groupId>10 || sessionScope.groupId == 0 || sessionScope.groupId == 1}">
		<h2>스케쥴</h2>
		<jsp:include page="/WEB-INF/member/member_mypage_manager.jsp" />
	</c:if>
	<h2>내가쓴 게시글</h2>
	<jsp:include page="/WEB-INF/member/member_mypage_board_list.jsp" />
	<h2>내가쓴 댓글</h2>
	<jsp:include page="/WEB-INF/member/member_mypage_comment_list.jsp" />

</body>
</html>