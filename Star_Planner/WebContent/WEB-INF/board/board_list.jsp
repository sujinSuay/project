<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
<script type="text/javascript">
	var stripe = function() {
		/* var tables = document.getElementsByTagName("table"); */
		var tables = document.getElementsByName("listTable");

		for(var x=0;x!=tables.length;x++){
			var table = tables[x];
			if (! table) { return; }
			
			var tbodies = table.getElementsByTagName("tbody");
			
			for (var h = 0; h < tbodies.length; h++) {
				var even = true;
				var trs = tbodies[h].getElementsByTagName("tr");
				
				for (var i = 0; i < trs.length; i++) {
					trs[i].onmouseover=function(){
						this.className += " ruled"; return false
					}
					trs[i].onmouseout=function(){
						this.className = this.className.replace("ruled", ""); return false
					}
				}
			}
		}
	}

	window.onload = stripe;
</script>
<style type="text/css">
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
tbody tr.ruled td{
		color: #000;
		background-color: #C6E3FF; 
		font-weight: bold;
		border-color: #3292FC;
}
</style>
</head>
<body>
	<h2 align="left"><span class="galleryName">${param.id }</span> <span class="gallery">갤러리</span></h2>
	<div style="min-height: 480px; width: 100%;">
		<table name="listTable" style="width: 100%;">
			<thead>
				<tr>
					<th width="10%">번호</th>
					<th width="52%">제목</th>
					<th width="13%">글쓴이</th>
					<th width="15%">날짜</th>
					<th width="5%">조회</th>
					<th width="5%">추천</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${requestScope.list }" var="board" varStatus="no">
					<c:choose>
						<c:when test="${no.count%2 == 0 }">
							<tr>
								<td class="specalt list">${board.board_writer_type}&nbsp;${board.board_no }</td>
								<td align="left" class="alt list">
									<a href="/Star_Planner/board/boardView.do?id=${param.id}&no=${board.board_no}&page=${paging.page}">
										<c:choose>
											<c:when test="${board.board_link == 'noData,noData,noData,'}">
												<img src="/Star_Planner/img/noImgAlt.png"/>
											</c:when>
											<c:otherwise>
												<img src="/Star_Planner/img/Img.png"/>
											</c:otherwise>
										</c:choose>
										${board.board_title }
									</a>
								</td>
								<td class="alt list">${board.m_id }</td>
								<td class="alt list"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_date }"/></td>
								<td class="alt list">${board.board_hits }</td>
								<td class="alt list">${board.board_likes }</td>
							</tr>	
						</c:when>
						<c:otherwise>
							<tr>
								<td class="spec list">${board.board_writer_type}&nbsp;${board.board_no }</td>
								<td align="left" class="list">
									<a href="/Star_Planner/board/boardView.do?id=${param.id}&no=${board.board_no}&page=${paging.page}">
										<c:choose>
											<c:when test="${board.board_link == 'noData,noData,noData,'}">
												<img src="/Star_Planner/img/noImg.png"/>
											</c:when>
											<c:otherwise>
												<img src="/Star_Planner/img/Img.png"/>
											</c:otherwise>
										</c:choose>
										${board.board_title }
									</a>
								</td>
								<td class="list">${board.m_id }</td>
								<td class="list"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_date }"/></td>
								<td class="list">${board.board_hits }</td>
								<td class="list">${board.board_likes }</td>
							</tr>	
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
	</div>
		
		<div style="width: 100%; padding-top: 20px; padding-bottom: 30px;">
			<a href="/Star_Planner/board/boardList.do?id=${param.id }&page=1" style="float: left; padding-left: 30px;"><img src="/Star_Planner/img/btn_list_all_on.png"/></a>
			<c:if test="${sessionScope.loginId != null }">
				<a href="/Star_Planner/board/boardWriterForm.do?id=${param.id }" style="float: right; padding-right: 30px;"><img src="/Star_Planner/img/btn_write.gif"/></a>
			</c:if>
		</div>

<%--페이징 처리 --%>
<br>
<%--◀이전 페이지 그룹 처리 --%>
<div align="center">
	<c:choose>
		<c:when test="${requestScope.paging.previousPageGroup }">
			<a href="/Star_Planner/board/boardList.do?id=${param.id}&page=${requestScope.paging.beginPage - 1}">◀</a>
		</c:when>
		<c:otherwise>◀</c:otherwise>
	</c:choose>
	<%--페이지 처리 --%>
	<c:forEach begin="${requestScope.paging.beginPage }" end="${requestScope.paging.endPage }" var="page">
	&nbsp;
		<c:choose>
			<c:when test="${page == requestScope.paging.page }">[${page }]</c:when>
			<c:otherwise>
				<a href="/Star_Planner/board/boardList.do?id=${param.id}&page=${page }">${page }</a>
			</c:otherwise>
		</c:choose>
	&nbsp;
	</c:forEach>
	<%--다음 페이지 그룹 처리 ▶--%>
	<c:choose>
		<c:when test="${requestScope.paging.nextPageGroup }">
			<a href="/Star_Planner/board/boardList.do?id=${param.id}&page=${requestScope.paging.endPage + 1}">▶</a>
		</c:when>
		<c:otherwise>▶</c:otherwise>
	</c:choose>
</div>

</body>
</html>