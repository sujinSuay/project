<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_join</title>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
   var ckflag=false;
   $(document).ready(function() {
      $("#tem_group").on("change",function(){
         if($(this).val()=="기타"){ 
            $("#tem_group2").show();
         }
         else{
            $("#tem_group2").hide();
         }
      });
      
      $("#manager").hide();
      $("#searchBtn").on("click",function(){
         $.ajax({
            "url":"/Star_Planner/member/searchSinger.do",
            "type":"post",
            "data":"keyword="+$("#keyword").val(),
            "dataType":"json",
            "success":function(singer){
               $("#favoriteResult").html("검색된 가수:&nbsp;&nbsp;")
               if(singer == null){
                  $("#favorite").append("조건에 일치하는 가수가 없습니다.");
               }else{
                  for (var i = 0; i < singer.length; i++) {
                     $("#favoriteResult").append("<input type='button' style='background-color: #F6F6F6; border-radius: 5px; height: 30px; font-weight: bold; color: #505050' value='"+singer[i].singer_name+"' onclick='addFavorite(&quot;"+singer[i].singer_name+"&quot;,"+singer[i].singer_id+")'> &nbsp;&nbsp;");
                  }
               }
            },
            "error":function(xhr, status, errorMsg){
               alert("오류 발생 - "+status+","+errorMsg);
            },
            "beforeSend":function(){
               if(!$("#keyword").val()){
                  alert("조회할 가수 입력");
                  $("#keyword").focus();
                  return false;
               };
            }
         });
      });
      $("#m_id").on("keyup",function(){
         if($("#m_id").val().length>5){
            window.ckflag=checkId();
         }
      });
      $("#social_no2").on("blur",function(){
         window.ckflag=checkSocial_no();
      });
      $(":input:radio[name=group_id]").on("click",function(){
         if($(":input:radio[name=group_id]:checked").val()==3){
            $("#favorite_tr").hide();
            $("#manager").show();
         }else{
            $("#favorite_tr").show();
            $("#manager").hide();
         }
      });
      $("#form").on("submit",function(){
         var flag=true;
         
         if (!$("#m_id").val()) {
            $("#id_er").text("아이디를 입력해주세요");
            $("#m_id").focus();
            flag=false;
         }else if($("#m_id").val().length<6){
            $("#id_er").text("아이디를 6글자이상 입력해주세요");
            $("#m_id").focus();
            flag=false;
         }else {$("#id_er").text("");}
         
         if (!$("#name").val()){
            $("#name_er").text("이름을 입력해주세요");
            $("#name").focus();
            flag=false;
         }else{$("#name_er").text("");}
         
         if (!$("#password").val()){
            $("#password_er").text("Password를 입력해주세요");
            $("#password").focus();
            flag=false;
         }else{$("#password_er").text("");}
         
         if($("#password").val()!=$("#passwordCK").val()){
            $("#passwordCK_er").text("패스워드가 서로 다릅니다");
            $("#password").focus();
            flag=false;
         }else{$("#passwordCK_er").text("");}
         
         if(!$(":input:radio[name=gender]:checked").val()){
            $("#gender_er").text("성별을 선택해 주세요");
            flag=false;
         }else{$("#gender_er").text("");}
         
         if(!$("#address2").val()){
            $("#address_er").text("주소를 입력해 주세요");
            $("#address").focus();
            flag=false;
         }else{$("#address_er").text("");}
         
         if(!$("#social_no1").val()){
            $("#social_no_er").text("주민번호를 입력해주세요");
            $("#social_no1").focus();
            flag=false;
         }else{$("#social_no_er").text("");}
         
         if(!$("#social_no2").val()){
            $("#social_no_er").text("주민번호를 입력해주세요");
            $("#social_no2").focus();
            flag=false;
         }else{$("#social_no_er").text("");}
         
         if(!$("#phone").val()){
            $("#phone_er").text("전화번호를 입력해주세요");
            $("#phone").focus();
            flag=false;
         }else{$("#phone").text("");}
         
         if(!$("#email").val()){
            $("#email_er").text("이메일을 입력해주세요");
            $("#email").focus();
            flag=false;
         }else{$("#email").text("");}
         
         /* alert($("#tem_group").find("option:selected").val() + "/" + $("#tem_group2").val() ); */
         if($("#tem_group").find("option:selected").val()=='기타' && !$("#tem_group2").val()){
            $("#tem_group_er").text("회사를 입력해 주세요");
            $("#tem_group2").focus();
            flag=false;
         }else{$("#tem_group_er").text("");} 
            
         /* alert(!flag + " / " + !window.ckflag); */
         if(!flag || !window.ckflag){
            return false;
         }
         if($(":input:radio[name=group_id]:checked").val()==3){
            alert("매니저로 가입이 되셨습니다. 승인전까지는 일반회원으로 사용하실수 있습니다.");
         }else alert("회원가입을 환영합니다.");
      });
      $("#favoriteList").on("click","td",function(){
         var id=this.getAttribute("id");
         $(this).remove();
         $.ajax({
            "url":"/Star_Planner/member/minusSingerFavorite.do",
            "type":"post",
            "data":"singer_id="+id,
            "dataType":"text",
            "success":function(){
            },
            "error":function(xhr, status, errorMsg){
               alert("오류 발생 - "+status+","+errorMsg);
            },
            "beforeSend":function(){
            }
         });
      });
   });
   function addFavorite(singer_name,singer_id){
      
      if(document.getElementById(singer_id) == null){
         $.ajax({
            "url":"/Star_Planner/member/plusSingerFavorite.do",
            "type":"post",
            "data":"singer_id="+singer_id,
            "dataType":"text",
            "success":function(){
            },
            "error":function(xhr, status, errorMsg){
               alert("오류 발생 - "+status+","+errorMsg);
            },
            "beforeSend":function(){
            }
         });
         var td = document.createElement("td");
         td.setAttribute("id",singer_id);
         td.innerHTML=singer_name+"<input type='hidden' value='"+singer_name+"' name='favorite'>";
         $("#favoriteList").append(td);
      }else {
         alert("이미 선택하셨습니다");
      }
   };
   function checkSocial_no(){
      $.ajax({
         "url":"/Star_Planner/member/checkSocial_no.do",
         "type":"POST",
         "data":"social_nos="+$("#social_no1").val()+"," + $("#social_no2").val(),
         "dataType":"text", 
         "success":function(txt){
            if(txt=='numberFormat'){
               $("#social_no_er").html("<span style='color: red;'>잘못된 주민번호 입니다.</span>");
               $("#social_no").focus();
               window.ckflag=false;
            }else if(txt=='true'){
               $("#social_no_er").html("<span style='color: red;'>이미 가입한 회원입니다.</span>");
               $("#social_no1").focus();
               window.ckflag=false;
            }else{
               $("#social_no_er").text("가입가능한 주민번호입니다.");
               window.ckflag=true;
            }
         },
         "error":function(xhr,status,errorMsg){
            alert("오류발생" + status+ ", " + errorMsg);
         },
         "beforeSend":function(){
            if($("#social_no1").val().length<6 || $("#social_no2").val().length<6){
               $("#social_no_er").html("<span style='color: red;'>잘못된 주민번호 입니다.</span>");
               return false;
            }
         }
      });
   }
   function checkId(){
      $.ajax({
         "url":"/Star_Planner/member/checkId.do",
         "type":"POST",
         "data":"m_id="+$("#m_id").val(),
         "dataType":"text", 
         "success":function(txt){
            if(txt=='true'){
               /* $("#id_er").text("중복된 아이디입니다."); */
               $("#id_er").html("<span style='color: red;'>중복된 아이디 입니다.</span>");
               $("#m_id").focus();
               window.ckflag=false;
            }else{
               $("#id_er").text("사용가능한 아이디입니다.");
               window.ckflag=true;
            }
         },
         "error":function(xhr,status,errorMsg){
            alert("오류발생" + status+ ", " + errorMsg);
         },
         "beforeSend":function(){
            /* if($("#m_id").val().length<5){
               $("#id_er").text("6글자 이상 입력해 주세요");
               $("#m_id").focus();
               return false;
            } */
         }
      });
   }
   function execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = ''; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수

                  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     fullAddr = data.roadAddress;

                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     fullAddr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                  if (data.userSelectedType === 'R') {
                     //법정동명이 있을 경우 추가한다.
                     if (data.bname !== '') {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                           + ')' : '');
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('address').value = fullAddr;

                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById('address2').focus();
               }
            }).open();
   }
   $(document).keydown(function(e){
      if(e.target.nodeName == "INPUT"){
         if(e.keyCode == 13){
            return false;
         }
      }
   });
</script>
<style type="text/css">
#joinForm input[type=number]::-webkit-inner-spin-button,input[type=number]::-webkit-inner-spin-button{
	-webkit-appearance: none;
	margin:0;
}

</style>
</head>
<body>
   <div class="joinForm" style="margin: 0px auto; width: 50%; padding-left: 25%;">
      <h2>회원가입</h2>
      <form id="form" method="post" action="/Star_Planner/member/join.do">
         <table>
            <tr>
               <td colspan="2"><label><input type="radio"
                     id="group_id1" name="group_id" value='3'>매니져</label> <label><input
                     type="radio" id="group_id2" name="group_id" value="2"
                     checked="checked">일반회원</label></td>
               <td><span id="group_er" style="color: red;"></span></td>
               <td></td>
            </tr>
            <tr>
               <td>아이디</td>
               <td><input type="text" id="m_id" name="m_id"
                  value="${requestScope.id }"></td>
               <td><span id="id_er" style="color: red;"></span>
               <td>
            </tr>
            <tr>
               <td>이름</td>
               <td><input type="text" id="name" name="name"
                  value="${requestScope.name }"></td>
               <td><span id="name_er" style="color: red;"></span>
               <td>
            </tr>
            <tr>
               <td>비밀번호</td>
               <td><input type="password" name="password" id="password"></td>
               <td><span id="password_er" style="color: red;"></span>
               <td>
            </tr>
            <tr>
               <td>비밀번호확인</td>
               <td><input type="password" name="passwordCK" id="passwordCK"></td>
               <td><span id="passwordCK_er" style="color: red;"></span>
               <td>
            </tr>
            <tr>
               <td>이메일</td>
               <td><input type="email" name="email" id="email"></td>
               <td><span id="email_er" style="color: red;"></span>
               <td>
            </tr>
            <tr>
               <td>연락번호</td>
               <td><input type="number" name="phone" id="phone"></td>
               <td><span id="phone_er" style="color: red;"></span>
               <td>
            </tr>
            <tr>
               <td>성별</td>
               <td><label><input type="radio" id="gender1"
                     name="gender" value='남' checked="checked">남자</label> <label><input
                     type="radio" id="gender2" name="gender" value="여">여자</label></td>
               <td><span id="gender_er"></span></td>
            </tr>
            <tr>
               <td colspan="2">
                  <input type="text" name="member_address" id="postcode" placeholder="우편번호" onclick="execDaumPostcode()" readonly="readonly">
                  <button type="button" onclick="execDaumPostcode()" style="background: url('/Star_Planner/img/btn_address.png') center; width: 78px; height: 30px; background-repeat: no-repeat; border-radius: 5px;"></button>
               </td>
               <td></td>
            </tr>
            <tr>
               <td colspan="2">
                  <input type="text" id="address" name="member_address" placeholder="주소" onclick="execDaumPostcode()" readonly="readonly">
                  <input type="text" id="address2" name="member_address" placeholder="상세주소">
               </td>
               <td><span id="address_er" style="color: red;"></span></td>
            </tr>
            <tr>
               <td>주민번호</td>
               <td><input type="text" id="social_no1" name="social_no" maxlength="6" size="6">-<input type="password" id="social_no2" name="social_no" maxlength="7" size="7"></td>
               <td><span id="social_no_er" style="color: red;"></span></td>
               <td></td>
            </tr>
            <tr id="manager">
               <td>소속사</td>
               <td colspan="2">
                  <select name="tem_group" id="tem_group">
                     <c:forEach items="${requestScope.groupList }" var="groupName">
                        <option value="${groupName }">${groupName }</option>
                     </c:forEach>
                     <option value="기타">직접입력</option>
                  </select>
                  <input type="text" name="tem_group2" id="tem_group2" style="display: none;">
               </td>
               <td><span id="tem_group_er"></span></td>
            </tr>
         </table>
         <div id="favorite_tr" style="padding-bottom: 30px;">
            <table style="min-height: 70px;">
               <tr>
                  <td><input type="text" size="10" id="keyword"></td>
                  <td><input type="button" id="searchBtn" value="선호가수 검색" style="background-color: #F6F6F6; border-radius: 5px; width: 110px; height: 30px; font-weight: bold; color: #505050"></td>
                  <td><span id="favoriteResult"></span></td>
               </tr>
            </table>
            <table>
               <tr id="favoriteList" style="min-height: 40px;">
               </tr>
            </table>
         </div>
         <table>
			<tr>
				<td colspan="2">
					<button type="submit" id="checkForm" style="background: url('/Star_Planner/img/btn_register.png') center; width: 78px; height: 30px; background-repeat: no-repeat; border-radius: 5px; margin-right: 80px;"></button>
					<button type="reset" id="checkForm" style="background: url('/Star_Planner/img/btn_reset.png') center; width: 78px; height: 30px; background-repeat: no-repeat; border-radius: 5px;"></button>
				</td>
            </tr>
         </table>
      </form>
   </div>
</body>
</html>