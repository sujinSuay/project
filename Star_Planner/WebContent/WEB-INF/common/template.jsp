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
	/* background: -webkit-linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%, rgba(66, 245, 189, 0.4) 100%);
	background: linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%, rgba(66, 245, 189, 0.4) 100%);
	color: rgba(0, 0, 0, 0.6);
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