<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	


	
	//검색버튼 이벤트
	$('#search').on("click", function(){
	
		
		$.ajax({
			type: "post",
			data : {"id" : $('#admin_id').val()} ,
			url : "/Star_Planner/admin/selectById.do",
			dataType : "json",
			"success" : function(member){
				
				if(member.name==null){
					$('#result_search').html('입력하신 아이디는 존재 하지 않습니다');
				}else if(member.group_id==1){
					$('#result_search').html('이미 관리자 입니다');
				}else if(member.group_id==0){
					$('#result_search').html('마스터 계정은 수정 불가합니다');
				}
				else{
			
					$('#result_search').html('<span id="input_name">' + member.m_id+'</span>' + '<input type="button" class="register_admin" value="등록"/>');
				}
				
			}, "error" : function(xhr, status, errorMsg){
				
				alert("오류발생  " + status + errorMsg);
			
			},
			"beforeSend" : function(){
			
				if($('#admin_id').val()==''){
					alert("아이디를 입력해주세요");
					return false;
				}
			
			}
		}); //end of ajax
		
	}); // end of search button
	
 	$('#result_search').on("click", ".register_admin" , function(){

 		var text = $('#admin_id').val();
 		
 		$.ajax({
			type: "post",
			data : {"id" : $('#admin_id').val()} ,
			url : "/Star_Planner/admin/register.do",
			dataType : "json",
			"success" : function(list){
		
				$('#admin_id').empty();
				$('#result_admin').empty();
				
				for(var i=0; i<list.length; i++){
					$('#result_admin').append('<tr><td class="m_id">'+ list[i].m_id + '</td><td>' 
							+ list[i].name + '</td><td>' + list[i].phone+'</td><td><input type="button" class="delete" value="삭제"/></td></tr>');
					
				}  
				
			}, "error" : function(xhr, status, errorMsg){
				
				alert("오류발생  " + status + errorMsg);
			
			},
			"beforeSend" : function(){
			
				if($('#admin_id').val()==''){
					alert("아이디를 입력해주세요");
					return false;
				}
			
			}
		}); //end of ajax 
		
	});
	 
	
	//삭제 버튼
	$('#result_admin').on('click','.delete', function(){
	
		var parent = this;
		var text =$(parent).parent().parent().find('.m_id');
	
		var m_id = text.text();
		alert(m_id);
		
		
		$.ajax({
			type: "post",
			data : {"m_id" : m_id} ,
			url : "/Star_Planner/admin/delete.do",
			dataType : "json",
			"success" : function(list){
			
				//관리자 결과 테이블의 내용을 삭제
			$('#result_admin').empty();
			
				for(var i=0; i<list.length; i++){
					$('#result_admin').append('<tr><td class="m_id">'+ list[i].m_id + '</td><td>' 
							+ list[i].name + '</td><td>' + list[i].phone+'</td><td><input type="button" class="delete" value="삭제"/></td></tr>');
				}  
				
				
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){
			
			}
		}); //end of ajax 
		
	}); // end of delete button
	
	
	//매니저 등록
	$('#result_manager').on('click','.register_manager', function(){
	
		var parent = this;
		var text =$(parent).parent().parent().find('.m_id');
	
		var m_id = text.text();
	
	/* 	$.ajax({
			type: "post",
			data : {"m_id" : m_id} ,
			url : "/Star_Planner/member/insertManager.do",
			dataType : "json",
			"success" : function(list){
			
				//매니저 테이블의 내용을 삭제
			$('#result_manager').empty();
			
				for(var i=0; i<list.length; i++){
					$('#result_manager').append('<tr><td class="m_id">'+ list[i].m_id + '</td><td>' 
							+ list[i].name + '</td><td>' + list[i].phone+'</td><td><input type="button" class="delete" value="등록"/></td></tr>');
				}  
				
				
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){
			
			}
		}); //end of ajax  */
		
	}); // end of delete button
	
	
	//가수 등록 - register_singer_btn
	$('#register_singer_btn').on("click", function(){
			
			var singer_name = $('#singer_name').val();
			var singer_type = $('#singerType').val();
			var singer_company = $('#singerCompany').val();
			var singer_link = $('#singer_link').val();
			var singer_tag = $('#singer_tag').val();
		
	 	$.ajax({
			type: "post",
			data : {'singer_name': singer_name,
						'singer_type' : singer_type,
						'singer_company' :singer_company,
						'singer_link' : singer_link,
						'singer_tag' : singer_tag} ,
			url : "/Star_Planner/admin/insertSinger.do",
			dataType : "json",
			"success" : function(){
			
					alert('등록되었습니다');
			
				
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){
				
			// singer_name  singer_type   singer_company singer_link singer_tag
			if(singer_name==''){
				$('#result_singer_register').html('가수 이름을 입력해주세요');
				return false;
			}else if(singer_tag==''){
				$('#result_singer_register').html('가수 태그를 입력해주세요');
				return false;
			}else if(singer_link==''){
				$('#result_singer_register').html('가수 링크를 입력해주세요');
				return false;
			}else if(singer_type=='가수 분류'){
				$('#result_singer_register').html('가수 분류를 선택해주세요');
				return false;
			}else if(singer_company=='회사 분류'){
				$('#result_singer_register').html('회사 분류를 선택해주세요.');
				return false;
			}
		}
			
		}); //end of ajax 
		
	}); //end of 가수 등록 버튼
	
	//회사등록 버튼 - register_com_btn
	$('#register_com_btn').on("click", function(){
	
		var group_name = $('#com_input').val();
		var group_address = $('#name_input').val();
		var group_phone = $('#phone_input').val();
		var  group_link = $('#address_input').val();
		
		$.ajax({
			
			type: "post",
			data : { "group_name" : group_name,
							"group_address" : group_address,
							"group_phone" : group_phone,
							"group_link" : group_link
							},
			url : "/Star_Planner/admin/insertCompany.do",
			dataType : "json",
			"success" : function(){
		
				alert('성공');
				
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){

				if(group_name==''){
					$('#result_company_register').html('회사 이름을 입력해주세요');
					return false;
				}else if(group_address==''){
					$('#result_company_register').html('회사 주소를 입력해주세요');
					return false;
				}else if(group_phone==''){
					$('#result_company_register').html('회사 전화번호를 를 입력해주세요');
					return false;
				}else if(group_link==''){
					$('#result_company_register').html('회사 링크를 입력해주세요');
					return false;
				}
		}
		}); //end of ajax
		
	}); //end of 회사 등록 버튼 -register_com_btn
	
	
});
</script>

<head>
<meta charset="UTF-8">
<style type="text/css">

/*  id에 값을 적용 시킬때는 #으로 하고 class에 style을 적용 시킬떄는 .을 사용 */
 .layout-left {
        width: 46%;
        height : 500px;
        padding: 10px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
      }
 .layout-right { 
        width: 46%;
         height : 500px;
        padding: 10px;
        margin-bottom: 20px;
        float: right;
        border: 1px solid #bcbcbc;
      }
  
      
  .layout-down-left{
  		 width: 30%;
         height : 500px;
        padding: 10px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
  
  }
  
    .layout-down-center{
  		 width: 30%;
         height : 500px;
        padding: 10px;
        margin-bottom: 20px;
        margin-left : 30px;
        float: left;
        border: 1px solid #bcbcbc;
  
  }
  
    .layout-down-rigth{
  		 width: 30%;
         height : 500px;
        padding: 10px;
        margin-bottom: 20px;
        float: right;
        border: 1px solid #bcbcbc;
  
  }

/* table 스타일 처리  */
table, td, th {
   border: 1px solid gray;
}


table {
   border-collapse: collapse;
   min-width: 60px;
}


</style>


</head>
<body>

<div class="layout-left">

<h2>관리자 권한 부여</h2> <br>

<input type="text" id="admin_id">&nbsp;&nbsp;<input type="button" value="검색" id="search"/>
<br>

<div id="result_search" >
</div>
<br>

<table>
<tr>
	<td>아이디</td> 
	<td>이름</td>
	<td>전화번호</td>
	<td></td>
</tr>

<tbody  id="result_admin">
<c:forEach var="admin" items="${requestScope.list_admin }">
		<tr>
		<td class="m_id">${admin.m_id} </td>
		<td>${admin.name}</td>
		<td>${admin.phone}</td>
		<td><input type="button" class="delete" value="삭제"/></td>
		</tr>
</c:forEach>

</tbody>
</table>
 
</div>

<div class="layout-right">
		<h2>매니저  등록 관리 </h2> 
		<br>
		<table>
			<tr>
				<td>아이디</td> 
				<td>이름</td>
				<td>전화번호</td>
				<td></td>
			</tr>

			<tbody  id="result_manager">
			<c:forEach var="manager" items="${requestScope.list_manager }">
				<tr>
					<td class="m_id">${manager.m_id} </td>
					<td>${manager.name}</td>
					<td>${manager.phone}</td>
					<td><input type="button" class="register_manager" value="등록"/>
							<input type="button" class="deny_manager" value="거절"/></td>
				</tr>
			</c:forEach>
			
			</tbody>
		</table>
	</div>
	
	<div class="layout-down-left">
	<h2>가수등록</h2>
	<table>
	<tr>
		<td>가수 이름</td><td><input type="text" id="singer_name"/></td></tr>
		<tr>
		<td>가수 분류</td>
		<td>
					<select name="singerType" id="singerType" >
					<option>가수 분류</option>
					<c:forEach var="type" items="${requestScope.list_singerType }">
					<option value="${type}">
						${type}
					</option>
					</c:forEach>
					</select>
		</td> </tr>
		<tr>	<td>가수 회사</td>
		<td>
					<select name="singerCompany" id="singerCompany" >
					<option>회사 분류</option>
					<c:forEach var="type" items="${requestScope.list_singerCompany }">
					<option value="${type}">
						${type}
					</option>
					</c:forEach>
					</select>		
		
		</td></tr>
		<tr><td>정보링크</td><td><input type="text" id="singer_link"/></td></tr>
		<tr><td>검색태그</td><td><input type="text" id="singer_tag"/></td></tr>

	</table>
	
	<input type="button" id="register_singer_btn" value="등록"/> 
	<div id="result_singer_register"></div>
	
	</div>
	
	<div class="layout-down-center">
	<h2>회사등록</h2>
	<table>
	<tr>
		<td>회사이름</td>
		<td><input type="text" id="com_input"/></td>
	</tr>
	<tr>
		<td>회사주소</td>
		<td><input type="text" id="name_input"/></td>
	</tr>
	<tr>
		<td>회사전화번호</td>
		<td><input type="text" id="phone_input"/></td>
	</tr>
	<tr>
		<td>회사링크</td>
		<td><input type="text" id="address_input"/></td>
	</tr>
	
	</table>
	
	<input type="button" id="register_com_btn" value="등록"/> 
	<div id="result_company_register"></div>
	</div>
	
	
<div class="layout-down-rigth">
	<h2>메인페이지 링크 등록</h2>
	<table>
		<tr>
			<td>1번 링크</td>
			<td><input type="text" id="link1_input"/>
			<input type="button" id="link1_register_btn" value="등록"/>
			<input type="button" id="link1_modify_btn" value="수정"/>
			<input type="button" id="link1_delete_btn" value="삭제"/></td>
		</tr>
		<tr>
			<td>2번 링크</td>
			<td><input type="text" id="link2_input"/><input type="button" id="link2_btn"/></td>
		</tr>
		<tr>
			<td>3번 링크</td>
			<td><input type="text" id="link3_input"/><input type="button" id="link3_btn"/></td>
		</tr>	
		<tr>
			<td>4번 링크</td>
		<td><input type="text" id="link4_input"/><input type="button" id="link4_btn"/></td>
		</tr>	
		<tr>
			<td>5번 링크</td>
			<td><input type="text" id="link5_input"/><input type="button" id="link5_btn"/></td>
		</tr>	
		<tr>
			<td>6번 링크</td>
			<td><input type="text" id="link6_input"/><input type="button" id="link6_btn"/></td>
		</tr>	
	
	</table>
	
	</div>  
	
</body>
</html>