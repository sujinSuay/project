<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

		$(document).ready(function(){
			
			var count;
			
			$('#register').on("click",function(){
			
		
				$.ajax({
					
					type: "post",
					url : "/Star_Planner/comment/insertComment.do",
					data : {"comment_content" : $('#content_input') .val(),
									"m_id" : "${requestScope.board.m_id}",
									"board_no" : "${requestScope.board.board_no} "},
					dataType : "json",
					"success" : function(comment){
			
						//추가된 내용을 table에 추가 -> insertComment의 반환형은 comment
										$('#reply_line').append(
												"<tr><td id='user_layer' style='cursor:pointer;''><span>" +comment.comment_id +',' +comment.m_id + '</span></td> <td class="content"><span>' 
												+comment.comment_content +'</span></td><td>'+comment.comment_date+'</td><td><button class="delete_comment">삭제</button><button class="modify_comment">수정</button></td></tr>');
						
						//textarea를 clear
						$('#content_input').val("");
						
						count++;
						$('#comment_count').text(count);	
						
					}, "error" : function(xhr, status, errorMsg){
            			alert("오류발생  " + status + errorMsg);
            		},
            		"beforeSend" : function(){
            		
            		}
			
					
				}) //end of ajax
			}); //end of register button
			
			
			//삭제버튼을 생성한 부모에 대한 이벤트를 줘야 한다. delete_comment
			$('#reply_line').on("click", '.delete_comment',function(){  //#reply_line 의 자식 중에서 class가 'delete_comment'인것에 적용

				var parent=this;
				
				var txt = 	$(this).closest('tr').text();
				var txt2 = txt.split(',');
				
				var comment_id = txt2[0];
			
				$.ajax({
					
					type: "post",
					url : "/Star_Planner/comment/deleteComment.do",
					data : {"comment_id" : comment_id},
					"success" : function(){
					
						
						$(parent).closest("tr").remove();
										
						count--;
						$('#comment_count').text(count);
						
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
				
				var txt = 	$(this).closest('tr').text();
				
				var txt2 = txt.split(',');

				var comment_id = txt2[0];
				
				var context_area = $(parent).parent().parent().find('.content');
				var add_text = "<textarea class='modify' rows='30' cols='50'>"+ context_area.text()+"</textarea><button class='modify_register'>등록</button>";
				context_area.html(add_text);
		
			}); //end of delete
			
			$("#reply_line").on("click", '.modify_register', function(){
				
				
				var parent=this;
				var txt = 	$(this).closest('tr').text();
				var txt2 = txt.split(','); //comment_id 값 
	
				var comment_id = txt2[0]; 
				
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
			
			
		}); //end of document




</script>

<body>

<br>
<!--댓글 상단 -->
						<div class="comment" id="comment">
							<!--  댓글 제목 -->
							<div class="comment_title"> 	
								<img src="http://nstatic.dcinside.com/dgn/gallery/images/title_re.gif" /><span id="comment_count">${requestScope.comment_count }</span>
							</div>
						</div>


<!-- 댓글 목록 구간 -->
            <div class="comment_list" id="comment_list" >

<!--  댓글 목록 테이블 -->
			<table  class= "comment_table"  id="comment_table" 	border="1">
	
			<colgroup> 	<!-- <col>태그의 수만큼 가로 칸 (열) 이 생성 -->
						<col width="150" />
						<col width="700" />
						<col width="150" />
						<col width="50" />
			</colgroup>
			<tr><td><span>등록 아이디</span></td> 
			<td><span>댓글 내용</span></td>
			<td>등록 날짜</td>
			<td>  </td></tr>
			
			<tbody class="reply_line" id="reply_line">
			
			<c:forEach var="comment"  items="${requestScope.list_comment}" varStatus="status">
				<tr><td style='cursor:pointer;''><span>${comment.comment_id}, ${comment.m_id}</span></td> <td class="content"><span>
				${comment.comment_content }</span></td><td>${comment.comment_date }</td><td><button class="delete_comment">삭제</button><button class="modify_comment">수정</button></td></tr>
			</c:forEach>	

			</tbody>
				<!--  댓글 등록 form -->
		
			<tr><td><span>${requestScope.board.m_id}</span></td> <!-- request에 있는 로그인된 회원 아이디를 출력해서 보여주도록 --> 
			<td><textarea id="content_input"  rows="5" cols="40"></textarea></td>
			<td></td>
			<td><button id="register">댓글등록</button> </td></tr>
</table>
</div>


</body>
</html>