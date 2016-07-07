<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template</title>
<style type="text/css">
.menu{
	background-color:skyblue;
	text-align:center;
	padding: 40px;
}
.body{
	padding-top: 15px;
	min-height:400px;
}
body{
	width: 80%;
	margin: 0px auto;
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

<header class="menu">
		<tiles:insertAttribute name="menu"/> <!-- name 속성에 put-attribute태그의 name 속성값을 호출 -->
</header>		 

<section class="body">
		<tiles:insertAttribute name="body"/> 
</section>	

</body>
</html>