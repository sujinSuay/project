<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="/Star_Planner/main.do">main</a>  &nbsp; &nbsp; &nbsp; &nbsp;
<a href="/Star_Planner/schedule_main.do">schedule</a> &nbsp; &nbsp; &nbsp; &nbsp;
<a href="/Star_Planner/board_main.do">board</a> &nbsp; &nbsp; &nbsp; &nbsp;
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

