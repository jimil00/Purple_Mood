<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
.boardWrite {
   float: hidden;
}

.boardSearch {
   text-align: center;
}

#boardWriteBtn {
   float: right;
}
</style>
</head>
<body>
   <div style="background-color: gray; height: 150px">HEADER</div>
   <div style="background-color: darkgray; height: 50px">영화/드라마 게시판</div>
   <table border="1">
      <tr>
         <th>제목</th>
         <th>작성자</th>
         <th>작성 시간</th>
         <th>조회수</th>
      </tr>
      <c:choose>
         <c:when test="${not empty list}">
            <c:forEach var="board" items="${list}">
               <tr>
                  <td><a href="/selectBoardContents.board?b_seq=${board.b_seq}">${board.b_title}</td>
                  <td>${board.b_writer}</td>
                  <td>${board.b_write_date}</td>
                  <td>${board.b_view_count}</td>
               </tr>
            </c:forEach>
         </c:when>
         <c:otherwise>
            <tr>
               <td colspan="6">출력할 글이 없습니다.</td>
            </tr>
         </c:otherwise>
      </c:choose>
   </table>
   <hr>
   <div class="insertBoardContents">
      <a href="/board/insertBoardContents.jsp"><button type="button"
            id="insertBoardContentsBtn">글쓰기</button></a>
   </div>
      <hr>
			<div colspan="5" align="center">
				${navi }
			</div>
   <hr>
   <form action="/boardListSearch.board" method="post">
      <div class="boardListSearch">
         <select id="boardSearchOption" name="boardSearchOption">
            <option value="b_title">제목</option>
            <option value="b_writer">작성자</option>
            <option value="b_content">내용</option>
         </select> <input type="text" id="boardSearchWord" name="boardSearchWord">
         <button>검색</button>
            </div>
         
   </form>
   <hr>
</body>
</html>