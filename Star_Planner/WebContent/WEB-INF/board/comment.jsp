<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

		$(document).ready(function(){
			
			var count = 0;

			$.ajax({
					"url" :  "/Star_Planner/comment/selectComment.do", 
					"type" : "post",
					"data" : {"board_no": 0},
					"dataType" : "json",
					"success" : function(list){
					
						count = list.length;
						$('#comment_count').text(count);
						for(var i=0; i<count; i++){
							
								$('#reply_line').append(
										"<tr><td id='user_layer' style='cursor:pointer;''><span>" +list[i].comment_id +','+ list[i].m_id + '</span></td> <td class="content"><span>' 
										+list[i].comment_content +'</span></td><td>'+list[i].comment_date+'</td><td><button class="delete_comment">삭제</button><button class="modify_comment">수정</button></td></tr>');
						}
						
					}, "error" : function(xhr, status, errorMsg){
            			alert("오류발생  " + status + errorMsg);
            		},
            		"beforeSend" : function(){
            			
            		}
			});  //end of ajax for select
			
			$('#register').on("click",function(){
				$.ajax({
					
					type: "post",
					url : "/Star_Planner/comment/insertComment.do",
					data : {"comment_content" : $('#content') .val() },
					dataType : "json",
					"success" : function(comment){
			
						//추가된 내용을 table에 추가 -> insertComment의 반환형은 comment
										$('#reply_line').append(
												"<tr><td id='user_layer' style='cursor:pointer;''><span>" +comment.comment_id +',' +comment.m_id + '</span></td> <td class="content"><span>' 
												+comment.comment_content +'</span></td><td>'+comment.comment_date+'</td><td><button class="delete_comment">삭제</button><button class="modify_comment">수정</button></td></tr>');
						
						//textarea를 clear
						$('#content').val("");
						
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
				alert('ddd');
				var txt = 	$(this).closest('tr').text();
				var txt2 = txt.split(',');
				alert(txt2[0]);  //comment_id 값 
				var comment_id = txt2[0];
			
				$.ajax({
					
					type: "post",
					url : "/Star_Planner/comment/deleteComment.do",
					data : {"comment_id" : comment_id},
					"success" : function(){
						alert('성공');
						
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
				
				alert('수정');
				var parent=this;
				
				var txt = 	$(this).closest('tr').text();
				var txt2 = txt.split(',');
				alert(txt2[0]);  //comment_id 값 
				var comment_id = txt2[0];
				
				var context_area = $(this).parent().parent().find('.content');
				context_area.html("<textarea id='modify'>"+ context_area.text()+"</textarea>");
		
				
					

				$.ajax({
					
					type: "post",
					url : "/Star_Planner/comment/modifyComment.do",
					data : {"comment_id" : comment_id},
					
						"success" : function(){
						alert('성공');
						$(aaa).closest("tr").remove();
										
						
					}, "error" : function(xhr, status, errorMsg){
            			alert("오류발생  " + status + errorMsg);
            		},
            		"beforeSend" : function(){
            		
            		}
				
			}) //end of ajax
			}); //end of delete
			
			
			
		}); //end of document




</script>


<meta charset="UTF-8">
<body>


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
	
	<!--  댓글 등록 form -->
			
			<tbody class="reply_line" id="reply_line">
	
			<tr><td><span>아이디</span></td> <!-- request에 있는 로그인된 회원 아이디를 출력해서 보여주도록 --> 
			<td><textarea id="content"></textarea></td>
			<td></td>
			<td><button id="register">댓글등록</button> </td></tr>
				
			</tbody>
</table>
</div>


</body>
</html>