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
				$("#likes").html(obj)
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
	padding: 10px;
}
#title{
	text-align: left;
	float: left;
	color: #8C8C8C;
}
#title_info{
	text-align: left;
	float: left;
	font-weight: bold;
}
.info{
	text-align: left;
	float: left;
}
#date{
	text-align: right;
}
#separator{
	text-align: left;
	float: left;
	color: #8C8C8C;
}
#content_input{
	width: 100%;
}
</style>
</head>

<body>
<h2>${param.id } 갤러리</h2>
<section id="board_section">
	<header id="board_header">
		<div><dl><dt id="title">제목</dt><dd id="title_info">${requestScope.board.board_title }</dd><dd id="date"><fmt:formatDate value="${requestScope.board.board_date}" pattern="yyyy-MM-dd HH:mm:ss"/></dd></dl></div>
		<div>
			<dl>
				<dt id="title">글쓴이</dt><dd class="info">${requestScope.board.m_id }</dd><dt id="separator">&nbsp;&nbsp;|&nbsp;&nbsp;</dt>
				<dt id="title">조회수</dt><dd class="info">${ requestScope.board.board_hits}</dd><dt id="separator">&nbsp;&nbsp;|&nbsp;&nbsp;</dt>
				<dt id="title">좋아요</dt><dd id="likes" class="info">${ requestScope.board.board_likes}</dd>
			</dl>
		</div>
	</header>
	<article id="content">
		<div id="upfile">
			<c:forEach items="${requestScope.file_names }" var="file">
				<c:if test="${file != null || file !=' ' }">
					<img width="50%" height="50%" src="/Star_Planner/uploadFile/${file}">
				</c:if>
			</c:forEach>
		</div>
		${requestScope.board.board_content }
	</article>
	<a href="/Star_Planner/board/boardModifyForm.do?id=${param.id }&no=${requestScope.board.board_no}&page=${param.page}">공지사항수정</a>&nbsp;&nbsp;&nbsp;
	<a href="/Star_Planner/board/boardRemove.do?id=${param.id }&no=${requestScope.board.board_no}&page=${param.page}">공지사항삭제</a>&nbsp;&nbsp;&nbsp;
	<input type="button" id="likeBtn" value="좋아요">
</section>

<p>


<!--  댓글 부분 -->


<jsp:include page="/WEB-INF/board/comment.jsp"  flush="true">
                    <jsp:param name="m_id" value="${requestScope.board.m_id}"/>
                    <jsp:param name="board_no" value="${requestScope.board.board_no}"/>
                     <jsp:param name="list_comment" value="${requestScope.list_comment}"/>
</jsp:include>




<!--  게시글 list -->

<%--   <jsp:include page="/WEB-INF/board/board_list.jsp"  flush="true"> --%>
    <jsp:include page="/WEB-INF/board/board_list.jsp"  flush="true">
                    <jsp:param name="list" value="${requestScope.list}"/>
             	   <jsp:param name="paging" value="${requestScope.paging}"/>
</jsp:include>

</body>
</html>