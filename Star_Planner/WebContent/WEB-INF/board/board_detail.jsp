<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.board.board_title } - ${param.id } 갤러리</title>
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
#info{
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

</style>
</head>

<body>
<p>${param.id } 갤러리</p>
<section id="board_section">
	<header id="board_header">
		<div><dl><dt id="title">제목</dt><dd id="title_info">${requestScope.board.board_title }</dd><dd id="date"><fmt:formatDate value="${requestScope.board.board_date}" pattern="yyyy-MM-dd HH:mm:ss"/></dd></dl></div>
		<div><dl><dt id="title">글쓴이</dt><dd id="info">${requestScope.board.m_id }</dd><dt id="separator">&nbsp;&nbsp;|&nbsp;&nbsp;</dt><dt id="title">조회수</dt><dd id="info">${ requestScope.board.board_hits}</dd><dt id="separator">&nbsp;&nbsp;|&nbsp;&nbsp;</dt><dt id="title">좋아요</dt><dd id="info">${ requestScope.board.board_likes}</dd></dl></div>
	</header>
	<article id="content">${requestScope.board.board_content }</article>
	<a href="/Star_Planner/board/boardModifyForm.do?id=${param.id }&no=${requestScope.board.board_no}&page=${param.page}">공지사항수정</a>&nbsp;&nbsp;&nbsp;
	<a href="/Star_Planner/board/boardRemove.do?id=${param.id }&no=${requestScope.board.board_no}&page=${param.page}">공지사항삭제</a>
</section>

</body>
</html>