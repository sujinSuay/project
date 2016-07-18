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

.titleText{
  text-decoration: none;
  -webkit-transform: perspective(2.5em) rotateX(15deg) scaleY(0.8);
  -moz-transform: perspective(2.5em) rotateX(15deg) scaleY(0.8);
  -ms-transform: perspective(2.5em) rotateX(15deg) scaleY(0.8);
  -o-transform: perspective(2.5em) rotateX(15deg) scaleY(0.8);
  transform: perspective(2.5em) rotateX(15deg) scaleY(0.8);
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  transition: all 0.5s;
  display: inline-block;
  text-align: center;
  text-transform: uppercase;
  font-size: 75px;
  font-weight: 700;
  font-family: 'Exo 2';
  line-height: 0.8;
  
  text-shadow: 0 -1px 15px rgba(0, 0, 0, 0.9), 0 1px 0 #67999F, 0 3px 0 #6799AF, 0 5px 0 #6799B8, 0 7px 0 #6799C8, 0 9px 0 #6799CA, 0 6px 50px rgba(252, 223, 92, 0.8);
}
.titleText:first-line {
  font-size: 0.8em;
}
.titleText:hover {
  -webkit-transform: perspective(8em) rotateX(11deg) scale(1.2);
  -moz-transform: perspective(8em) rotateX(11deg) scale(1.2);
  -ms-transform: perspective(8em) rotateX(11deg) scale(1.2);
  -o-transform: perspective(8em) rotateX(11deg) scale(1.2);
  transform: perspective(8em) rotateX(11deg) scale(1.2);
  text-shadow: 0 -1px 15px black, 0 1px 0 #67999F, 0 2px 0 #6799AF, 0 0px 0 #6799B8, 0 1px 0 #6799C8, 0 2px 0 #6799CA, 0 2px 30px rgba(252, 223, 92, 0.6);
}

</style>

<ul class="menu">
	<div align="center" style="padding-top: 20px; padding-bottom: 16px; font-size: 40px; float: none; color: white;"><span class="titleText">Plan  Daiso</span></div>
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
			<li style="float: right;"><a href="/Star_Planner/member/beforeJoin.do" style="border-left: none; border-right: none;">회원가입</a></li>
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
