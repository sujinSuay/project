<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template</title>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
header{
	background-color:skyblue;
	text-align:center;
	padding: 40px;
}

section{
	padding: 15px;
	min-height:400px;
}
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