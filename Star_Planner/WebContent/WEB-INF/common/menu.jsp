<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="/Star_Planner/main/home.do">main</a>  &nbsp; &nbsp; &nbsp; &nbsp;
<a href="/Star_Planner/schedule_main.do">schedule</a> &nbsp; &nbsp; &nbsp; &nbsp;
<c:if test="${sessionScope.loginId != null && sessionScope.groupId != 2}">
	<a href="/Star_Planner/schedule/scheduleRegisterForm.do">schedule 등록</a> &nbsp; &nbsp; &nbsp; &nbsp;
</c:if>

<a href="/Star_Planner/board/boardMain.do">board</a> &nbsp; &nbsp; &nbsp; &nbsp;

<c:if test="${sessionScope.loginId=='master' }">
<a href="/Star_Planner/admin/adminMain.do">관리자설정</a>&nbsp; &nbsp; 
</c:if>

<c:choose>
	<c:when test="${sessionScope.loginId == null }">
		<a href="/Star_Planner/member_login.do">login</a> &nbsp; &nbsp; &nbsp; &nbsp;
		로그인을 해주세요!
	</c:when>
	<c:otherwise>
		<a href="/Star_Planner/member/mypage.do">mypage</a> &nbsp; &nbsp; &nbsp; &nbsp;
		<a href="/Star_Planner/member_logout.do">logout</a> &nbsp; &nbsp; &nbsp; &nbsp;
		${sessionScope.loginId }님 환영합니다.
	</c:otherwise>
</c:choose> 


