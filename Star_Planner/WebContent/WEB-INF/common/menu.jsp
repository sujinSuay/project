<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<link rel="stylesheet" href="/Star_Planner/style/dropdownmenu/style.css" media="screen">
<style type="text/css">
.menu header{
 	background-color:#b6b6b6; 
	text-align:center;
	padding: 40px;
}

.menu section{
	padding: 15px;
	min-height:400px;
}
/* html, body { margin: 0; padding: 0; } */
ul.menu { margin: 50px auto 0 auto; width:900px;}
/* .loginForm{
margin-left:43%;
margin-top:5%;
}  */
.joinForm{
margin-left:43%;
margin-top:5%;
} 
.menuBtn{
width:300px;
}
a { text-decoration:none }

a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:hover {text-decoration: none; color: blue;}
</style>

<ul class="menu">
	<li class="menuBtn"><a href="/Star_Planner/main/home.do">Main</a></li>
	<li class="menuBtn"><a href="/Star_Planner/board_main.do">게시판</a></li>
	<li class="menuBtn"><a href="#">Schedule</a>
		<ul>
			<li><a href="/Star_Planner/schedule/scheduleMain.do" class="documents">Schedule</a></li>
			<c:if test="${sessionScope.loginId != null && sessionScope.groupId != 2 && sessionScope.groupId != 3}">
				<li><a href="/Star_Planner/schedule/scheduleRegisterForm.do" class="documents">스케쥴등록</a></li>
			</c:if>
		</ul>
	</li>
	<c:choose>
		<c:when test="${sessionScope.loginId == null }">
			<li class="menuBtn"><a href="/Star_Planner/member_login.do">로그인</a>
		</c:when>
		<c:otherwise>
			<li class="menuBtn"><a href="#">마이페이지</a>
				<ul>
					<li><a href="/Star_Planner/member/mypage.do" class="documents">내정보</a></li>
					<c:if test="${sessionScope.groupId==0 || sessionScope.groupId==1 }">
						<li><a href="/Star_Planner/admin/adminMain.do" class="signout">관리자설정</a></li>
					</c:if>
					<li><a href="/Star_Planner/member_logout.do" class="signout">Sign Out</a></li>
				</ul>
			</li>
		</c:otherwise>
	</c:choose>
</ul>

