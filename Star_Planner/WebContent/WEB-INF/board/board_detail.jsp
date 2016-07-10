<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.board.board_title } - ${param.id } 갤러리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#likeBtn").on("click",function(){
		$.ajax({
			"url":"/Star_Planner/board/boardLike.do",
			"type":"post",
			"data": {"no":"${param.no}","likes":$("#likes").text()},
			"dataType":"json",
			"success":function(obj){
				$(".likes").html(obj)
			},
			"error":function(xhr, status, errorMsg){
				alert("오류 발생 - "+status+","+errorMsg);
			},
		});
	});
});
</script>
<style type="text/css">
#board_section{
	min-width: 800px;
	border:1px solid gray;
}
#board_header{
	background-color: #F6F6F6;
}
#content{
	min-height:300px;/*최소 높이 300px*/
	height:auto;/*자동으로 늘어나기*/
	width: 100%;
	min-height: 400px;
	text-align: left;
	padding: 20px;
}
#title{
	text-align: left;
	float: left;
	
}
.info{
	text-align: left;
	float: left;
}
</style>
</head>

<body>
	<h2 align="left"><span class="galleryName">${param.id }</span> <span class="gallery">갤러리</span></h2>
	<section id="board_section">
		<header id="board_header">
			<div style="background-color: #F6F6F6; padding: 20px;">
				<span style="float: left; padding-right: 30px; color: #8C8C8C;">제목</span><span style="font-weight: bold;">${requestScope.board.board_title }</span>
				<span style="float: right; color: #747474;"><fmt:formatDate value="${requestScope.board.board_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
				<br><br>
				<div style="float: left;"><span style="padding-right: 15px; color: #8C8C8C;">글쓴이</span>${requestScope.board.m_id }<span style="padding-left: 15px; padding-right: 15px; color: #8C8C8C;">|</span></div>
				<div style="float: left;"><span style="padding-right: 15px; color: #8C8C8C;">조회수</span>${requestScope.board.board_hits }<span style="padding-left: 15px; padding-right: 15px; color: #8C8C8C;">|</span></div>
				<div style="float: left;"><span style="padding-right: 15px; color: #8C8C8C;">좋아요</span><span id="likes" class="likes">${requestScope.board.board_likes }</span></div>
				<br>
			</div>
		</header>
		<article id="content">
			<div id="upfile">
				<c:forEach items="${requestScope.file_names }" var="file">
					<c:if test="${file != 'noData' }">
						<img width="50%" height="50%" src="/Star_Planner/uploadFile/${file}">
					</c:if>
				</c:forEach>
			</div>
			${requestScope.board.board_content }
		</article>
		<div align="right">
			<c:if test="${(sessionScope.loginId == requestScope.board.m_id) || (sessionScope.groupId == 0) || (sessionScope.groupId == 1)}">
				<a href="/Star_Planner/board/boardModifyForm.do?id=${param.id }&no=${requestScope.board.board_no}&page=${param.page}"><img src="/Star_Planner/img/btn_d_correct.gif"/></a>&nbsp;&nbsp;&nbsp;
				<a href="/Star_Planner/board/boardRemove.do?id=${param.id }&no=${requestScope.board.board_no}&page=${param.page}"><img src="/Star_Planner/img/btn_d_del.gif"/></a>&nbsp;&nbsp;&nbsp;	
			</c:if>
		</div>
		<div align="center" style="padding-bottom: 15px;">
			<button id="likeBtn" style="background: url('/Star_Planner/img/facebook_like_button_big.jpg') center; width: 100px; height: 44px; background-repeat: no-repeat; text-align: right; border-radius: 5px; ">
				<span class="likes" style="padding-right: 18px;">${requestScope.board.board_likes }</span>
			</button>
		</div>
	</section>
	<!--  댓글 부분 -->
	<jsp:include page="/WEB-INF/board/comment.jsp"  flush="true">
		<jsp:param name="m_id" value="${requestScope.board.m_id}"/>
		<jsp:param name="board_no" value="${requestScope.board.board_no}"/>
		<jsp:param name="list_comment" value="${requestScope.list_comment}"/>
	</jsp:include>

<p>

<!--  게시글 list -->

<%--   <jsp:include page="/WEB-INF/board/board_list.jsp"  flush="true"> --%>
<jsp:include page="/WEB-INF/board/board_list.jsp"  flush="true">
	<jsp:param name="list" value="${requestScope.list}"/>
	<jsp:param name="paging" value="${requestScope.paging}"/>
</jsp:include>

</body>
</html>