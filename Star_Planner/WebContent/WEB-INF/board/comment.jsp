<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function printList(comment, m_id, groupId){

	var count =  comment.length;
	var family_id;
	var parent_m_id;
	$('#comment_count').text(count);	
	
	$('#reply_line').empty();
	for(var i=0; i<comment.length; i++){
		 
		var text ='';
		
		 if(comment[i].comment_check =="1"){
			text = "<tr><td style='cursor:pointer;'><input type='hidden'  class='comment_id' value='"+comment[i].comment_id+"'/><span id='reply_check'>└─→</span><span class='m_id'>"+comment[i].m_id + '</span></td> <td class="content"><span>'
				+comment[i].comment_content +'</span></td><td>'+comment[i].comment_date+'</td><td>';
		 }else{
			 text = "<tr><td style='cursor:pointer;'><input type='hidden'  class='comment_id' value='"+comment[i].comment_id+"''/><span id='reply_check'></span><span class='m_id'>"+comment[i].m_id + '</span></td> <td class="content"><span>' 
				+comment[i].comment_content +'</span></td><td>'+comment[i].comment_date+'</td><td>';
		 }
		
		if(m_id==comment[i].m_id){  //로그인 한 고객이 게시한 댓글 인 경우
			
				$('#reply_line').append(text + '<button class="reply_comment" style="width: 78px; height: 30px; background: url(\'/Star_Planner/img/btn_d_re.png\') center; background-repeat: no-repeat; border-radius: 5px;"></button><button class="modify_comment" style="width: 78px; height: 30px; background: url(\'/Star_Planner/img/btn_d_correct.gif\') center; background-repeat: no-repeat; border-radius: 5px;"></button><button class="delete_comment" style="width: 78px; height: 30px; background: url(\'/Star_Planner/img/btn_d_del.gif\') center; background-repeat: no-repeat; border-radius: 5px;"></button></td></tr>');
		
		}else{ //로그인 한 사람이 게시한 댓글이 아닌 경우
			$('#reply_line').append(text + '<button class="reply_comment" style="width: 78px; height: 30px; background: url(\'/Star_Planner/img/btn_d_re.png\'); background-repeat: no-repeat; border-radius: 5px;"></button></td></tr>');
			
			if(groupId ==1 || groupId==0){ //관리자가 로그인 한 경우
				text = text +  '<button class="delete_comment" style="width: 78px; height: 30px; background: url(\'/Star_Planner/img/btn_d_del.gif\') center; background-repeat: no-repeat; border-radius: 5px;"></button>';
			}
		
		} 
	}
	
}
		$(document).ready(function(){
			
			var parent_m_id;
			var m_id = '${sessionScope.loginId}';
			var comment_count  = '${requestScope.comment_count}';
			var groupId = '${sessionScope.groupId}';
		
			$('#register').on("click",function(){
				$.ajax({
					
					type: "post",
					url : "/Star_Planner/comment/insertComment.do",
					data : {"comment_content" : $('#content_input') .val(),
									"m_id" : "${sessionScope.loginId}",
									"board_no" : "${requestScope.board.board_no} "},
					dataType : "json",
					"success" : function(comment){
			
						printList(comment, m_id, groupId); //전체 리스트 출력
						 
						//textarea를 clear
						$('#content_input').val("");
					
						
					}, "error" : function(xhr, status, errorMsg){
            			alert("오류발생  " + status + errorMsg);
            		},
            		"beforeSend" : function(){
            			if(!$("#content_input").val()){
    						alert("내용을 입력하세요");
    						$("#content_input").focus();
    						return false;
    					};
            			
            		}
			
					
				}) //end of ajax
			}); //end of register button
			
			
			//삭제버튼을 생성한 부모에 대한 이벤트를 줘야 한다. delete_comment
			$('#reply_line').on("click", '.delete_comment',function(){  //#reply_line 의 자식 중에서 class가 'delete_comment'인것에 적용
				var m_id = '${sessionScope.loginId}';
				var parent=this;
				
				var txt = 	$(this).closest('tr').text();
				var txt2 = txt.split(',');
				 
				var txt3 = $(parent).parent().parent().find('.comment_id');
				var comment_id = txt3.val();
			
				$.ajax({
					
					type: "post",
					url : "/Star_Planner/comment/deleteComment.do",
					data : {"comment_id" : comment_id,
								"board_no" : "${requestScope.board.board_no} "},
					"success" : function(comment){
					
						printList(comment, m_id,groupId); //전체 리스트 출력
						
					}, "error" : function(xhr, status, errorMsg){
            			alert("오류발생  " + status + errorMsg);
            		},
            		"beforeSend" : function(){
            		
            		}
				
			}) //end of ajax
			}); //end of delete
			
			
			//#reply_line 의 자식 중에서 class가 'modify_comment'인것에 적용 '.'은 상위 노드를 의미
			$('#reply_line').on("click", '.modify_comment',function(){  
				
			
				var parent=this;
	
				var txt3 = $(parent).parent().parent().find('.comment_id');
				var comment_id = txt3.val();
				
				var context_area = $(parent).parent().parent().find('.content');
				var add_text = "<textarea class='modify' rows='3' style='width: 99%;'>"+ context_area.text()+'</textarea><button class="modify_register" style="width: 78px; height: 30px; background: url(\'/Star_Planner/img/btn_save.gif\') center; background-repeat: no-repeat; border-radius: 5px;"></button>';
				context_area.html(add_text);
		
			}); //end of delete
			
			$("#reply_line").on("click", '.modify_register', function(){
				
				
				var parent=this;
				
				
				var txt3 = $(parent).parent().parent().find('.comment_id');
				var comment_id = txt3.val();
	
				
				var context_area = $(parent).parent().parent().find('.modify');
				var new_context = context_area.val(); //textarea에 입력한 값을 가져와서 저장 
			
				$.ajax({
					
					type: "post",
					url : "/Star_Planner/comment/modifyComment.do",
					data : {"comment_id" : comment_id,
								"comment_content" : new_context},
					
						"success" : function(){
		
						//this=button= var parent 가 td에속해있으므로 parent인 td의 내용을 변경하도록 한다.
						$(parent).parent().html('<span>'+new_context+'</span>'); 
						
					}, "error" : function(xhr, status, errorMsg){
            			alert("오류발생  " + status + errorMsg);
            		},
            		"beforeSend" : function(){
            		
            		}
				
			}) //end of ajax 
				
			}); //end of modify_register button
			
		
			
			
			//댓글의 댓글을 등록버튼 클릭시 폼생성
				$('#reply_line').on("click", '.reply_comment',function(){  
				var comment_id = $(this).parent().parent().find('.comment_id').val();
				family_id = comment_id;
			
				parent_m_id = $(this).parent().parent().find('.m_id').text();
				
		
				var m_id = '${sessionScope.loginId}';
				var reply_form = '<tr><td><input type="hidden" id="reply_id" value="'+comment_id +'"</input><span> 답글/'+m_id+'</span></td><td style="padding-right: 7px;"><textarea id="reply_input"  rows="5" style="width: 100%;" >['+ parent_m_id+ ']    </textarea></td>'+
										'<td></td><td><button id="reply_register" style="width: 78px; height: 30px; background: url(\'/Star_Planner/img/btn_re_re.png\') center; background-repeat: no-repeat; border-radius: 5px;"></button><button id="reply_cancel" style="width: 78px; height: 30px; background: url(\'/Star_Planner/img/btn_cancle.gif\') center; background-repeat: no-repeat; border-radius: 5px;"></button></td></tr>';
										
				$(this).parent().parent().after(reply_form); //댓글의 댓글 등록 폼 생성
				
			}); //end of 댓글에 댓글을 등록
			
			
			//댓글 등록
			$('#reply_line').on('click', '#reply_register', function(){
				
	
				//입력 받은 댓글의 내용
				var reply_input = $(this).parent().parent().find('#reply_input').val();
				
				var reply_id = $(this).parent().parent().find('#reply_id').val();
			
				
		 $.ajax({
					
					type: "post",
					url : "/Star_Planner/comment/insertReply.do",
					data : {
									"family_id" : family_id,
									"comment_id" : reply_id,
									"comment_content" : reply_input,
									"m_id" : "${sessionScope.loginId}",
									"board_no" : "${requestScope.board.board_no} "},
					dataType : "json",
					"success" : function(comment){
			
						printList(comment,m_id,groupId);
						
					}, "error" : function(xhr, status, errorMsg){
            			alert("오류발생  " + status + errorMsg);
            		},
            		"beforeSend" : function(){
            			if(!$("#reply_input").val()){
    						alert("내용을 입력하세요");
    						$("#reply_input").focus();
    						return false;
    					};
            		}
				}) //end of ajax 
				
				
			});
			
			//댓글 등록 취소
			$('#reply_line').on('click', '#reply_cancel', function(){
				
				$(this).parent().parent().remove();
			});
			
			
		}); //end of document
</script>
 		

<body>

<br>
<!--댓글 상단 -->
	<div class="comment" id="comment">
		<!--  댓글 제목 -->
		<div class="comment_title">
			<img src="http://nstatic.dcinside.com/dgn/gallery/images/title_re.gif" />
			<span id="comment_count">${requestScope.comment_count }</span>
		</div>
	</div>


	<!-- 댓글 목록 구간 -->
            <div class="comment_list" id="comment_list" >

<!--  댓글 목록 테이블 -->
			<table class= "comment_table"  id="comment_table" 	border="1" style="min-width: 800px; width: 100%; ">
	
			<tr style="width: 10%;"><td><span>등록 아이디</span></td> 
			<td style="width: 55%;"><span>댓글 내용</span></td>
			<td style="width: 15%;">등록 날짜</td>
			<td style="width: 20%;">  </td></tr>
			
			<tbody class="reply_line" id="reply_line">
			
			<c:forEach var="comment"  items="${requestScope.list_comment}" varStatus="status">
			<tr>
			<c:choose>
			<c:when test="${comment.comment_check=='0' }">
			<td style='cursor:pointer;' ><input type="hidden"  class="comment_id" value="${comment.comment_id}"/><span class='m_id' >${comment.m_id}</span></td>
			</c:when>
			<c:otherwise>
			<td style='cursor:pointer;'><input type="hidden"  class="comment_id" value="${comment.comment_id}"/><span id="reply_check">└─→</span><span class="m_id">${comment.m_id}</span></td>
			</c:otherwise>
			</c:choose>
			
					<td class="content" align="left"><span>${comment.comment_content }</span></td>
					<td><fmt:formatDate value="${comment.comment_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>

					<c:choose>
						<c:when test="${sessionScope.loginId == comment.m_id}">
							<button class="reply_comment" style="width: 78px; height: 30px; background: url('/Star_Planner/img/btn_d_re.png') center; background-repeat: no-repeat; border-radius: 5px;"></button>
							<button class="modify_comment" style="width: 78px; height: 30px; background: url('/Star_Planner/img/btn_d_correct.gif') center; background-repeat: no-repeat; border-radius: 5px;"></button>
							<button class="delete_comment" style="width: 78px; height: 30px; background: url('/Star_Planner/img/btn_d_del.gif') center; background-repeat: no-repeat; border-radius: 5px;"></button>
						</c:when>
								<c:otherwise>
									
										<c:if test="${sessionScope.groupId ==0 || sessionScope.groupId ==1 }">
											<button class="delete_comment" style="width: 78px; height: 30px; background: url('/Star_Planner/img/btn_d_del.gif') center; background-repeat: no-repeat; border-radius: 5px;"></button>
										</c:if>
									

									<c:if test="${sessionScope.loginId!=null}">
										<button class="reply_comment" style="width: 78px; height: 30px; background: url('/Star_Planner/img/btn_d_re.png') center; background-repeat: no-repeat; border-radius: 5px;"></button>
									</c:if>
								</c:otherwise>
							</c:choose>
						
					</td>
				</tr>
			</c:forEach>	

			</tbody>
				<!--  댓글 등록 form -->
			<c:if test="${sessionScope.loginId != null }">
				<tr>
					<td><span>${sessionScope.loginId}</span></td> <!-- request에 있는 로그인된 회원 아이디를 출력해서 보여주도록 --> 
					<td style="padding-right: 7px;"><textarea id="content_input"  rows="5" style="width: 100%;"></textarea></td>
					<td></td>
					<td><button id="register" style="width: 78px; height: 30px; background: url('/Star_Planner/img/btn_re_write.png') center; background-repeat: no-repeat; border-radius: 5px;"></button></td>
				</tr>
			</c:if>
			
</table>
</div>


</body>
</html>