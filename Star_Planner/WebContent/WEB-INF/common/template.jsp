<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template</title>
<style type="text/css">

 
.body{
	width: 100%;
}
.innerBody{
	width: 80%;
	min-width: 800px;
	text-align: center;
}
.gallery{
	color: #5B79C8;
}
.galleryName{
	color: #5D5D5D;
}
.btn{
	width: 50%;
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

<section>
		<tiles:insertAttribute name="body"/> 
</section>	

</body>
</html>