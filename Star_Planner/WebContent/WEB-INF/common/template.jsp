<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template</title>
<style type="text/css">
header{
	background-color:skyblue;
	text-align:center;
	padding: 40px;
}

section{
	padding: 15px;
	min-height:400px;
	float:left;
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