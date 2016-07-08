<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#inactiveSubmit").on("click",function(){
		if(confirm("정말 탈퇴하시겠습니까?")){
			$.ajax({
				"url":"/Star_Planner/member/inactiveMember.do",
				"type":"POST",
				"data":"m_id=${sessionScope.loginId}&password="+$("#password").val()+"",
				"dataType":"text", 
				"success":function(txt){
					if(txt=='false'){
						/* $("#id_er").text("중복된 아이디입니다."); */
						$("#password_er").html("<span style='color: red;'>패스워드가 틀렸습니다.</span>");
						$("#password").focus();
						
					}else{
						alert("탈퇴되었습니다.")
						window.location.href="/Star_Planner/member/logout.do";
					}
				},
				"error":function(xhr,status,errorMsg){
					alert("오류발생" + status+ ", " + errorMsg);
				},
				"beforeSend":function(){
					if($("#password").val()==""){
						$("#password_er").html("<span style='color:red;'>패스워드를 입력해 주세요<span>");
						return false;
					}	
				}
			});
		} else{
			window.location.href="/Star_Planner/member/mypage.do";
		}
	});
});
</script>
</head>
<body>
	<div id="inactiveMemberDiv" align="center">
		<br><br>
		삭제하려면 비밀번호를 입력해 주세요
		<div id="inactiveMember">
			<table>
				<tr>
					<td>회원아이디</td>
					<td>${sessionScope.loginId }</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" id="password" size="10"></td>
				</tr>
				<tr>
					<td colspan="2" id="password_er">
					</td>
				</tr>
			</table>
			<input type="button" id="inactiveSubmit" value="탈퇴">
		</div>	
	</div>
</body>
</html>