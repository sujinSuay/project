<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template</title>
<style type="text/css">
Body{
	width: 80%;
	margin: 0px auto;
	min-width: 1280px;
	font-family:"맑은 고딕",'malgun gothic',dotum,gulim;
	padding-bottom: 50px;
	/* background: -webkit-linear-gradient(45deg, rgba(230, 255, 255, 0.96) 0%, rgba(212, 244, 250, 0.2) 100%);
	background: linear-gradient(45deg, rgba(230, 255, 255, 0.6) 0%, rgba(212, 244, 250, 0.2) 100%);
	color: rgba(0, 0, 0, 1);
	font-family: "Roboto", sans-serif;
	font-size: 14px;
	line-height: 1.6em;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale; */
}
.gallery{
	color: #5B79C8;
}
.galleryName{
	color: #5D5D5D;
}
.gallery{
	color: #5B79C8;
}
.galleryName{
	color: #5D5D5D;
}
</style>

</head>
<body>

<header>
		<tiles:insertAttribute name="menu"/> <!-- name 속성에 put-attribute태그의 name 속성값을 호출 -->
</header>		 

<section class="body">
		<tiles:insertAttribute name="body"/> 
</section>	

</body>
</html>