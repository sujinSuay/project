<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/Star_Planner/css/style.css" media="screen">

<style type="text/css">
a { text-decoration:none }
a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:hover {text-decoration: underline; color: blue;}

ul.menu { margin: 50px auto 25px auto;}
</style>

<ul class="menu">
	<div align="center" style="padding: 20px;">스케줄 다이소</div>
	<li><a href="/Star_Planner/main/home.do" style="border-left: none;">메인</a></li>
	<li><a href="/Star_Planner/schedule/scheduleMain.do">일정</a>
		<c:if test="${sessionScope.loginId != null && sessionScope.groupId != 2 && sessionScope.groupId != 3}">
			<ul>
				<li><a href="/Star_Planner/schedule/scheduleRegisterForm.do" class="signout">일정 등록</a></li>
			</ul>
		</c:if>
	</li>
	<li><a href="/Star_Planner/board/boardMain.do" style="border-right: none;">게시판</a></li>
	<c:choose>
		<c:when test="${sessionScope.loginId == null }">
			<li style="float: right;"><a href="/Star_Planner/member_login.do" style="border-left: none; border-right: none;">로그인</a></li>
		</c:when>
		<c:otherwise>
			<li style="float: right;"><a href="/Star_Planner/member_logout.do" style="border-right: none;">로그아웃</a></li>
			<li style="float: right;"><a href="/Star_Planner/member/mypage.do" style="border-left: none;">마이페이지</a>
				<c:if test="${sessionScope.groupId==0 || sessionScope.groupId==1 }">
					<ul>
						<li><a href="/Star_Planner/admin/adminMain.do" class="signout">관리자 설정</a></li>
					</ul>
				</c:if>
			</li>
		</c:otherwise>
	</c:choose>
</ul>
