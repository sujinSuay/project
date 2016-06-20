<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">

		$(document).ready(function(){

			$.ajax({
					"url" :  "/Star_Planner/comment/selectComment.do", 
					"type" : "post",
					"dataType" : "json",
					"success" : function(list){
						alert("성공");
						alert(list);
						
						for(var i=0; i<list.length; i++){
							
								alert(list[i].comment_content);
								var table = document.getEle
								
						}
						
					}, "error" : function(xhr, status, errorMsg){
            			alert("오류발생  " + status + errorMsg);
            		},
            		"beforeSend" : function(){
            			
            		}
			});
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
			<tbody>
			
				<tr class="reply_line" id="reply_line">
					<!--  user_layer에 사용자 정보 나타나도록 하기 -->
					<td class="user_layer" user_id="user_id" user_name="user_name" style="cursor:pointer;">
					<span title="user_name">user_name</span>
					</td>
					<td class="reply">
					<span>
					<!-- 댓글 내용 -->
					</span>
					</td>
					<td>등록날자</td>
					<td rowspan="2" class="comment_delete">삭제버튼</td>
					</tr>
					
			</tbody>
</table>
</div>


</body>
</html>