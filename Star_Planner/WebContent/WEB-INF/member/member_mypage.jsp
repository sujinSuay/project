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
th {
	font: bold "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: #4f6b72;
	border-right: 1px solid #C1DAD7;
	border-bottom: 1px solid #C1DAD7;
	border-top: 1px solid #C1DAD7;
	letter-spacing: 2px;
	text-transform: uppercase;
	text-align: center;
	padding: 6px 6px 6px 12px;
	background: #E1EEF7 url(/Star_Planner/img/bg_header.jpg) no-repeat;
}

td.list {
	border-right: 1px solid #C1DAD7;
	border-bottom: 1px solid #C1DAD7;
	background: #fff;
	padding: 6px 6px 6px 12px;
	color: #4f6b72;
}

td.alt {
	background: #EBF7FF;
	color: #797268;
}

td.spec {
	border-left: 1px solid #C1DAD7;
	border-top: 0;
	background: #fff url(/Star_Planner/img/bullet1.gif) no-repeat;
	font: bold "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

td.specalt {
	border-left: 1px solid #C1DAD7;
	border-top: 0;
	background: #EBF7FF url(/Star_Planner/img/bullet2.png) no-repeat;
	font: bold "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: #797268;
}
</style>
</head>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
<body>
	<h2>회원정보</h2>

	<div id="member_info" style="padding-bottom: 30px;">
		<table>
			<tr>
				<td class="td" width="5%">회원 아이디</td>
				<td width="45%">${requestScope.member.m_id }</td>
				<td class="td" width="5%">선호가수</td>
				<td width="45%">${requestScope.member.favorite }</td>
			</tr>
			<tr>
				<td class="td">회원 이름</td>
				<td >${requestScope.member.name }</td>
				<td class="td">성별</td>
				<td >${requestScope.member.gender}</td>
			</tr>
			<tr>
				<td class="td">주소</td>
				<td >${requestScope.member.address }</td>
				<td align="right"></td>
				<td >
					<!-- <a href="#" onclick="location.href='modifyForm.do'" id="modify"><img src="/Star_Planner/img/btn_modify.png"/></a> -->
					<button id="modify" onclick="location.href='modifyForm.do'" style="background: url('/Star_Planner/img/btn_modify.png') center; width: 78px; height: 30px; background-repeat: no-repeat; border-radius: 5px;"></button>
					<button id="inactiveMemberForm" onclick="location.href='inactiveMemberForm.do'" style="background: url('/Star_Planner/img/btn_exit.png') center; width: 78px; height: 30px; background-repeat: no-repeat; float: right; border-radius: 5px;"></button>
				</td>
			</tr>
			<tr>
				<td class="td">생년월일</td>
				<td class="info">${requestScope.member.social_no.split('-')[0] }</td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<c:if test="${sessionScope.groupId>10 || sessionScope.groupId == 0 || sessionScope.groupId == 1}">
		<h2>일정</h2>
		<jsp:include page="/WEB-INF/member/member_mypage_manager.jsp" />
	</c:if>
	<h2>내가쓴 게시글</h2>
	<jsp:include page="/WEB-INF/member/member_mypage_board_list.jsp" />
	<h2>내가쓴 댓글</h2>
	<jsp:include page="/WEB-INF/member/member_mypage_comment_list.jsp" />

</body>
</html>