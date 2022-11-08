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
<script>
	$(function() {
		$("#modifyBoardContent").on("click", function() {
			$("#b_title,#b_content").removeAttr("readonly");

			$("#toList,#updateBoardContent,#deleteBoardContent").css("display", "none");
			// 		$("#title,#contents").attr("contenteditable","true");

			let btnUpdateBContent = $("<button>");
			btnUpdateBContent.text("수정완료");
			btnUpdateBContent.addClass("btn")
			btnUpdateBContent.css("margin-right", "5px")

			let btnCancelBContentU = $("<button>");
			btnCancelBContentU.attr("type", "button");
			btnCancelBContentU.text("취소");
			btnCancelBContentU.addClass("btn")
			btnCancelBContentU.on("click", function() {
				location.reload();
			});

			$(".btns").append(btnUpdateBContent);
			$(".btns").append(btnCancelBContentU);

		})
		$(".modifyBoardComment").on("click", function() {
			$(".bcm_content").removeAttr("readonly");

			$(".modifyBoardComment,.deleteBoardComment").css("display", "none");
			// 		$("#title,#contents").attr("contenteditable","true");

			let btnModifyBComment = $("<button>");
			btnModifyBComment.text("수정완료");
			btnModifyBComment.addClass("btn")
			btnModifyBComment.css("margin-right", "5px")

			let btnCancelBCommentM = $("<button>");
			btnCancelBCommentM.attr("type", "button");
			btnCancelBCommentM.text("취소");
			btnCancelBCommentM.addClass("btn")
			btnCancelBCommentM.on("click", function() {
				location.reload();
			});

			$(".cbtns").append(btnModifyBComment);
			$(".cbtns").append(btnCancelBCommentM);

		})

	})
</script>


</head>
<body>
   <form action="/updateContent.board?b_seq=${dto.b_seq}" method="post">
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
         <c:choose>
            <c:when test="${loginNickname == dto.b_writer}">

               <tr>
                  <td class="btns" colspan="3" align="right"><input
                     type="button" class="btn" id="updateBoardContent"
                     name="updateBoardContent" value="수정하기"> &nbsp <a
                     href="/deleteBoardContent.board?b_seq=${dto.b_seq }"><input
                        type="button" class="btn" id="deleteBoardContent"
                        name="deleteBoardContent" value="삭제하기"></a> &nbsp <a
                     href="/boardList.board"><input
                        type="button" id="toList" name="toList" value="목록으로"></a>
               </tr>
            </c:when>
            <c:otherwise>
               <tr>
                  <td class="btns" colspan="3" align="right"><a
                     href="/boardList.board?cpage=${boardPage }"><input
                        type="button" id="back" name="back" value="목록으로"></a>
               </tr>
            </c:otherwise>
         </c:choose>
         



      </table>
   </form>


   
<form action="/updateBoardComment.boardcomment" method="post">
		<table border="1" width="950" align="center">
			<input type=hidden id="b_seq" name="b_seq" value="${dto.b_seq }">

			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="10" height="100" align="center">댓글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="comment" items="${list}">
						<tr>
							<input type=hidden class="bcm_seq" name="bcm_seq" value="${comment.bcm_seq }">
							<td width="100" " class="bcm_writer">${comment.bcm_writer }
							<td width="850" align="center" class="bcm_write_date"><fmt:formatDate
									value="${comment.bcm_write_date }" pattern="yyyy-MM-dd HH:mm:ss" />
						</tr>
						<tr>
							<td><input type="text" class="bcm_content"
								name="bcm_content" size="105" value="${comment.bcm_content }" readonly>
							<c:choose>
								<c:when test="${loginNickname == comment.bcm_writer}">


								<td class="cbtns" align="center"><input type="button" class="updateBoardComment"
											name="updateBoardComment" value="댓글수정">
											&nbsp <a
											href="/deleteBoardComment.boardcomment?bcm_seq=${comment.bcm_seq }&b_seq=${dto.b_seq}"><button
													type="button" class="deleteBoardComment" name="deleteBoardComment">댓글삭제</button></a>
						</tr>
						</c:when>
			</c:choose>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	</form>
   <form action="/insertBoardComment.boardcomment" method="post">
      <table border="1" width="950" align="center">
         <input type="hidden" id="b_seq" name="b_seq" value="${dto.b_seq }">
         <tr>
            <td id="bcm_writer" name="bcm_writer" width="100" align="center">${loginNickname }
            <td><input type="text" id="bcm_content" name="bcm_content"
               placeholder="내용을 입력해주세요." size="105">
            <td align="center"><button id="insertBoardComment">댓글
                  작성</button>
         </tr>

      </table>
   </form>
</body>
</html>