
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 전용 페이지</title>
<style type="text/css">
#board_section {
   min-width: 800px;
   border: 1px solid gray;
}

#board_header {
   background-color: #F6F6F6;
}

#content {
   min-height: 300px; /*최소 높이 300px*/
   height: auto; /*자동으로 늘어나기*/
   padding: 10px;
}

#title {
   text-align: left;
   float: left;
   color: #8C8C8C;
}

#title_info {
   text-align: left;
   float: left;
   font-weight: bold;
}

#info {
   text-align: left;
   float: left;
}

#date {
   text-align: right;
}

#separator {
   text-align: left;
   float: left;
   color: #8C8C8C;
}

/* table 스타일 처리  */
table, td, th {
   border: 1px solid gray;
}

table {
   border-collapse: collapse;
   min-width: 800px;
}

th, td {
   padding: 5px;
}
</style>


</head>
<body>

   <div id="title_info">
      <table>
         <tr>
            <td>
               <h2>관리자 권한 부여</h2> <br>
               <div>
                  <dl>
                     <dt id=title>관리자 권한 부여
                     <dd id="title_info"></dd>
                  </dl>
                  <table id="title_info">
                     <tr>

                        <td align="center">아이디</td>
                        <td align="center"><input type="button" name="register"
                           value="등록"></td>
                     </tr>
                     <tr>
                        <td align="center">아이디</td>
                        <td align="center"><input type="button" name="register"
                           value="등록"></td>
                     </tr>
                     <tr>
                        <td align="center">아이디</td>
                        <td align="center"><input type="button" name="register"
                           value="등록"></td>
                     </tr>
                  </table>
               </div>
            </td>
         </tr>
      </table>
   </div>
   <div id="title_info">
      <table>
         <tr>
            <td>
               <h2>관리자 리스트</h2> <br>
               <div>
                  <dl>
                     <dt id=title>관리자 권한 부여
                  </dl>
                  <table>
                     <tr>
                        <td align="center">아이디</td>
                        <td align="center"><input type="button" name=""
                           value="권한취소"></td>
                     </tr>
                     <tr>
                        <td align="center">아이디</td>
                        <td align="center"><input type="button" name=""
                           value="권한취소"></td>
                     </tr>
                     <tr>
                        <td align="center">아이디</td>
                        <td align="center"><input type="button" name=""
                           value="권한취소"></td>
                     </tr>
                  </table>
               </div>
      </table>
   </div>
   <div id="title_info">
      <table>
         <tr>
            <td>
               <h2>매니저 권한부여</h2> <br> 매니저 신청자
               <table>
                  <tr>
                     <td align="center">sm01</td>
                     <td align="center"><input type="button" name="" value="수락"></td>
                  </tr>
                  <tr>
                     <td align="center">YG02</td>
                     <td align="center"><input type="button" name="" value="수락"></td>
                  </tr>
                  <tr>
                     <td align="center">JYP03</td>
                     <td align="center"><input type="button" name="" value="수락"></td>
                  </tr>
               </table>
            </td>
         </tr>
      </table>
   </div>
   <div id="title_info">
      <table>
         <tr>
            <td>
               <h2>가수등록</h2> <br> 가수이름<input type="text" name="singer_name"
               value="가수이름"> <br> 가수분류 <br> <!-- 카테고리 --> 가수회사 <br>
               <!-- 카테고리 -->
               <h2>가수 리스트</h2> <br>
               <table>
                  <tr>
                     <td align="center">회사</td>
                     <td align="center">분류</td>
                     <td align="center">이름</td>
                  </tr>
                  <tr>
                     <td align="center">JYP</td>
                     <!-- db -->
                     <td align="center">여자그룹</td>
                     <!-- db -->
                     <td align="center">트와이스</td>
                     <!-- db -->
                  </tr>
               </table>
            </td>
         </tr>
      </table>
   </div>
   <div id="title_info">
      <table>
         <tr>
            <td>
               <h2>회사등록</h2> <br> 회사이름 <input type="text" name=""
               value="회사이름"> <br> <input type="button" name=""
               value="등록"> <br>
            </td>
         </tr>
      </table>
   </div>
   <div >
      <table>
         <tr>
            <td>
               <h2>회사 리스트</h2>
               <table>
                  <tr>
                     <td align="center">회사이름</td>
                  </tr>
                  <tr>
                     <td align="center">JYP</td>
                     <!-- DB -->
                  </tr>
               </table>
            </td>
         </tr>
      </table>
   </div>
   <div id="title_info">
      <table>
         <tr>
            <td>
               <h2>메인페이지 링크 등록</h2> 
               1번링크<br>
                2번링크<br> 
                <input type="button" name="" value="등록">
            </td>
         </tr>
      </table>
   </div>
</body>
</html>