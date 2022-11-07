<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>


</head>
<body>
   <form action="/updateContents.board?b_seq=${dto.b_seq}" method="post">
      <table border="1" width="500" align="center">
         <tr>
            <td width="30%">${dto.b_category}
            <td width="70%" colspan="2"><input type="text" id="b_title"
               name="b_title" value="${dto.b_title }" size="129" readonly></td>
         </tr>
         <tr>
            <td width="50%">${dto.b_writer}
            <td width="30%" align="center"><fmt:formatDate
                  value="${dto.b_write_date}" pattern="yyyy-MM-dd HH:mm:ss" />
            <td width="20%" align="center">${dto.b_view_count }
         <tr>

         <td colspan="3"><textarea id="b_content" name="b_content"
               cols="131" rows="15" readonly>${dto.b_content }</textarea></td>
         </tr>



      </table>
   </form>

   <form action="/insertBoardComment.boardcomment" method="post">
      <table border="1" width="950" align="center">
         <input type="hidden" id="b_seq" name="b_seq" value="${dto.b_seq }">
         <tr>
<%--             <td id="bcm_writer" name="bcm_writer" width="100" align="center">${loginID } --%>
            <td><input type="text" id="bcm_content" name="bcm_content"
               placeholder="내용을 입력해주세요." size="105">
            <td align="center"><button id="insertBoardComment">댓글
                  작성</button>
         </tr>

      </table>
   </form>


</body>
</html>