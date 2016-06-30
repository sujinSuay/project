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
		var group_name = $(parent).parent().parent().find('#singerCompany').val();
	
		
	$.ajax({
			type: "post",
			data : {"m_id" : m_id,
						"group_name" : group_name} ,
			url : "/Star_Planner/admin/insertManager.do",
			dataType : "json",
			"success" : function(list){
				window.location.reload(); //페이지 refresh
		
				
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){
			
				if(group_name=='회사 분류'){
					alert('회사를 선택해 주세요');
					return false;
				}

			}
		}); //end of ajax  
		
	}); // end of delete button
	
	
	//매니저 등록 거절
	$('#result_manager').on('click','.deny_manager', function(){
	
		var parent = this;
		var text =$(parent).parent().parent().find('.m_id');
	
		var m_id = text.text();
	
	$.ajax({
			type: "post",
			data : {"m_id" : m_id},
			url : "/Star_Planner/admin/denyManager.do",
			dataType : "json",
			"success" : function(list){
				window.location.reload(); //페이지 refresh
		
				
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){
			
			}
		}); //end of ajax  
		
	}); // end of deny button 매니저 등록 거절
	
	
	//가수 등록 - register_singer_btn
	$('#register_singer_btn').on("click", function(){
			
			var singer_name = $('#singer_name').val();
			var singer_type = $('#singerType').val();
			var singer_company = $('#singerCompanyType').val();
			var singer_link = $('#singer_link').val();
			var singer_tag = $('#singer_tag').val(); 
			
		alert(singer_company);
		
	 	$.ajax({
			type: "post",
			data : {'singer_name': singer_name,
						'singer_type' : singer_type,
						'singer_company' :singer_company,
						'singer_link' : singer_link,
						'singer_tag' : singer_tag} ,
			url : "/Star_Planner/admin/insertSinger.do",
			dataType : "json",
			"success" : function(list){
			
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
		
				window.location.reload(); //페이지 refresh
				
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
	
	
	///////////////////////링크처리
	//링크 등록
	$('#link_tbody').on("click" , '.link_register_btn' ,function(){
		 
		var parent = this;
		var get_count_td = $(parent).parent().parent().find( '.link_count').text();
		
		var get_count_split = get_count_td.split("번");
		var get_count = get_count_split[0];
		
		var input_text= $(parent).parent().parent().find( '.link_input').val();
		

$.ajax({
			type: "post",
			data : { "count" : get_count,
							"input" : input_text,
							},
			url : "/Star_Planner/admin/insertMainLink.do",
			dataType : "json",
			"success" : function(){
	
				window.location.reload(); //페이지 refresh
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){
					if(input_text==''){
						alert('링크를 입력해주세요');
						return false;
					}				
		}
		}); //end of ajax
		
		
		
	} );
	
	
	
	//링크 삭제
	$('#link_tbody').on("click" , '.link_delete_btn' ,function(){
		 
		var parent = this;
		var get_count_td = $(parent).parent().parent().find( '.link_count').text();
		var get_count_split = get_count_td.split("번");
		var get_count = get_count_split[0];

		var input_text_sapn= $(parent).parent().parent().find( '.link_input').text();
		alert(input_text_sapn);
		
		$.ajax({
			type: "post",
			data : { "count" : get_count 	},
			url : "/Star_Planner/admin/deleteMainLink.do",
			dataType : "json",
			"success" : function(){
		
				alert('삭제되었습니다');
				window.location.reload();
				
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){
							
		}
		}); //end of ajax
		
		
	} ); //end of 링크 삭제
	

	//링크 수정
	$('#link_tbody').on("click" , '.link_modify_btn' ,function(){
		 
		var parent = this;
		var get_count_td = $(parent).parent().parent().find( '.link_count').text();
		
		var get_count_split = get_count_td.split("번");
		var get_count = get_count_split[0];

		var input_text= $(parent).parent().parent().find( '.link_input').val();
	

		$(parent).parent().parent().find( '#input_td').html('<input type="text" class="link_input"/> <input type="button" class="link_register_btn" value="등록"/>');
		
	$.ajax({
			type: "post",
			data : { "count" : get_count,
							"input" : input_text
							},
			url : "/Star_Planner/admin/insertMainLink.do",
			dataType : "json",
			"success" : function(){
		
				window.location.reload();
				
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){
					if(input_text==''){
						alert('링크를 입력해주세요');
						return false;
					}				
		} 
		}); //end of ajax		
		
	} );
	
	//매니저 목록 조회 버튼 이벤트
	$('#selectManagerList').on("click", function(){
		
		var text = $('#managerCompany').val();

		
		$.ajax({
			type: "post",
			data : { "id" : text	},
			url : "/Star_Planner/admin/selectManagerByCompany.do",
			dataType : "json",
			"success" : function(list){
		
				
				$('#result_managerList').empty(); 
				
				for(var i=0; i<list.length; i++){
					
				var txt = 	'<tr><td class="m_id">' + list[i].m_id + 
							 		'</td><td>'+ list[i].name + '</td><td>' + list[i].phone + '</td><td>' +
							 		list[i].group_name + '</td></tr>';
					
			$('#result_managerList').append(txt);
				}
		
				
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){
			
						
		} 
		}); //end of ajax		
		
	}); //end of 매니저 목록 조회 버튼
	
	
	//가수 목록 조회 - 그룹 타입에 따른
	$('#selectSingerList').on("click", function(){
		
		var txt = $('#singerTypeList').val();
	
		$.ajax({
			type: "post",
			data : { "id" : txt	},
			url : "/Star_Planner/admin/selectSingerList.do",
			dataType : "json",
			"success" : function(list){
		
				$('#result_SingerList').empty(); 
				
				for(var i=0; i<list.length; i++){
					
				var txt = 	'<tr><td>' + list[i].type_name + 
							 		'</td><td>'+ list[i].singer_name + '</td><td>' + list[i].group_name + '</td><td>' +
							 		list[i].singer_favorite + '</td></tr>';
					
			$('#result_SingerList').append(txt);
				}
		
				
			}, "error" : function(xhr, status, errorMsg){
				alert("오류발생  " + status + errorMsg);
			},
			"beforeSend" : function(){
			
						
		} 
		}); //end of ajax		
		
	})
	
	
	
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
		<div style=" height: 150px; overflow-x: hidden; overflow-y: scroll;">
		<table>
			<tr>
				<td>아이디</td> 
				<td>이름</td>
				<td>전화번호</td>
				<td>요청회사</td>
				<td>소속사</td>
				<td></td>
			</tr>  
	
		
			<tbody  id="result_manager">
			<c:forEach var="manager" items="${requestScope.list_manager }">
				<tr>
					<td class="m_id">${manager.m_id}</td>
					<td>${manager.name}</td>
					<td>${manager.phone}</td>
					<td>${manager.tem_group }</td>
					<td>
							<select name="singerCompany" id="singerCompany" >
								<option>회사 분류</option>
								<c:forEach var="type" items="${requestScope.list_singerCompany }">
								<option value="${type}">
									${type}
								</option>
								</c:forEach>
							</select>		
					</td>
					<td><input type="button" class="register_manager" value="등록"/>
							<input type="button" class="deny_manager" value="거절"/></td>
				</tr>
			</c:forEach>
			
			</tbody>
		</table>
		</div>
		
<br>
<!-- 매니저 목록 조회 -->
<h4>매니저 목록 조회</h4>
						<select name="managerCompany" id="managerCompany" >
								<option>회사 분류</option>
								<c:forEach var="type" items="${requestScope.list_singerCompany }">
								<option value="${type}">
									${type}
								</option>
								</c:forEach>
							</select>	
		<input type="button" id="selectManagerList" value="조회"/>
							
<div style=" height: 100px; overflow-x: hidden; overflow-y: scroll;">
<table >
			<tr>
				<td>아이디</td> 
				<td>이름</td>
				<td>전화번호</td>
				<td>소속사</td>
			</tr>  	
			<tbody  id="result_managerList" >
		
			<c:forEach var="manager" items="${requestScope.list_managerAll }">
				<tr>
					<td class="m_id">${manager.m_id}</td>
					<td>${manager.name}</td>
					<td>${manager.phone}</td>
					<td>${manager.group_name }	</td>
				</tr>
			</c:forEach>
		
			</tbody>
		</table>
		</div>
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
					<select name="singerCompanyType" id="singerCompanyType" >
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
	
	<!--  가수 목록 조회 -->
<h3>가수 목록 조회</h3>
						<select name="singerTypeList" id="singerTypeList" >
								<option>가수분류</option>
								<c:forEach var="type" items="${requestScope.list_singerType }">
								<option value="${type}">
									${type}
								</option>
								</c:forEach>
							</select>	
		<input type="button" id="selectSingerList" value="조회"/>
							
<div style=" height: 150px; overflow-x: hidden; overflow-y: scroll;">
<table >
			<tr>
				<td>가수분류</td> 
				<td>가수이름</td>
				<td>소속사</td>
				<td>선호도</td>
			</tr>  	
		
			<tbody  id="result_SingerList" >
		
			<c:forEach var="singer" items="${requestScope.list_singerListAll }">
				<tr>
					<td >${singer.type_name}</td>
					<td>${singer.singer_name}</td>
					<td>${singer.group_name}</td>
					<td>${singer.singer_favorite}	</td>
				</tr>
			</c:forEach>
		
			</tbody>
		</table>
		</div>
	
	
	
	
	</div> <!--  end of 가수등록 -->
	
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
	
	<!--  회사 목록 조회 -->
	<h3>회사 목록 조회</h3>
	<div style=" height: 200px; overflow-x: hidden; overflow-y: scroll;">
	<table >
			<tr>
				<td>회사이름</td> 
				<td>회사주소</td>
				<td>회사 전화번호</td>
				<td>회사링크</td>
			</tr>  	
		
			<tbody  id="result_SingerList" >
		
			<c:forEach var="group" items="${requestScope.list_groupListAll }">
				<tr>
					<td >${group.group_name}</td>
					<td>${group.group_address}</td>
					<td>${group.group_phone}</td>
					<td>${group.group_link}	</td>
				</tr>
			</c:forEach>
		
			</tbody>
		</table>
		</div>
	
	
	</div>


	<div class="layout-down-rigth">
		<h2>메인페이지 링크 등록</h2>
		<div style="height: 400px; overflow-x: hidden; overflow-y: scroll;">
			<table style="height: 380px; word-break: break-all;">

				<tbody id="link_tbody">
					<c:forEach var="link" items="${requestScope.list_mainLink }" 	varStatus="status">
					
						<c:if test="${status.index==0 }">
						<tr><td></td><td><h4>동영상</h4></td></tr>
						</c:if>
					
						<c:if test="${status.index==3 }">
						<tr><td></td><td><h4>이미지</h4></td></tr>
						</c:if>
						
					<tr class="link_tr">
							<td class='link_count'>${status.count }번링크</td>
							<td id="input_td"><c:choose>
									<c:when test="${link eq '' || link eq null}">
										<input type="text" class="link_input" />
										<input type="button" class="link_register_btn" value="등록" />
									</c:when>

									<c:otherwise>
										<span class="link_input">${link }</span>
										<br>
										<input type="button" class="link_modify_btn" value="수정" />
										<input type="button" class="link_delete_btn" value="삭제" />
									</c:otherwise>
								</c:choose></td>

						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

	</div>

</body>
</html>