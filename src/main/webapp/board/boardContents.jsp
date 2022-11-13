<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
@font-face {
	font-family: 'NotoSansKR';
	src: url('font/NotoSansKR-Black.otf') format('opentype')
}

@font-face {
	font-family: 'J송명';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/JSongMyung-Regular-KO.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: '교보손글씨';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/KyoboHandwriting2020A.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: '빙그레싸만코체';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/BinggraeSamanco-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: '주아체';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: '한림고딕체';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2204@1.0/HallymGothic-Regular.woff2')
		format('woff2');
	font-weight: 400;
	font-style: normal;
}

@font-face {
	font-family: '둥근모꼴체';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function() {
		$("#modifyBoardContent").on(
				"click",
				function() {
					$("#b_title,#b_content").removeAttr("readonly");

					$("#toList,#updateBoardContent,#deleteBoardContent").css(
							"display", "none");
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
		$(".updateBoardComment").on(
				"click",
				function() {
					$(".bcm_content").removeAttr("readonly");

					$(".updateBoardComment,.deleteBoardComment").css("display",
							"none");
					// 		$("#title,#contents").attr("contenteditable","true");

					let btnUpdateBComment = $("<button>");
					btnUpdateBComment.text("수정완료");
					btnUpdateBComment.addClass("btn");

					btnUpdateBComment.addClass("updcmbtn");

					btnUpdateBComment.css("margin-right", "5px");

					let btnCancelBCommentU = $("<button>");
					btnCancelBCommentU.attr("type", "button");
					btnCancelBCommentU.text("취소");
					btnCancelBCommentU.addClass("btn");
					btnCancelBCommentU.on("click", function() {
						location.reload();
					});

					$(".cbtns").append(btnUpdateBComment);
					$(".cbtns").append(btnCancelBCommentU);

				})
		$(document).on(
				"click",
				".updcmbtn",
				function() {
					let bcm_seq = $(this).closest("tr").find(".bcm_content")
							.attr("bcm_seq");
					let bcm_content = $(this).closest("tr")
							.find(".bcm_content").val();
					console.log(bcm_seq + ":" + bcm_content);
					$.ajax({
						url : "/updateBoardComment.boardcomment",
						datatype : "post",
						data : {
							"bcm_seq" : bcm_seq,
							"bcm_content" : bcm_content
						}
					}).done(function(res) {
						location.reload();
					})

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
					name="b_title" value="${dto.b_title }" size="129" readonly>
				</td>
			</tr>
			<tr>
				<td width="50%">${dto.b_writer}
				<td width="30%" align="center">${dto.b_write_date}
				<td width="20%" align="center">${dto.b_view_count }
			<tr>

				<td colspan="3">
					<div id="b_content" name="b_content" cols="131" rows="15" readonly>${dto.b_content }</div>
				</td>
			</tr>
			<c:choose>
				<c:when test="${loginNickname == dto.b_writer}">

					<tr>
						<td class="btns" colspan="3" align="right"><input
							type="button" class="btn" id="updateBoardContents"
							name="updateBoardContents" value="수정하기"> &nbsp <a
							href="/deleteBoardContents.board?b_seq=${dto.b_seq }"> <input
								type="button" class="btn" id="deleteBoardContents"
								name="deleteBoardContents" value="삭제하기">
						</a> &nbsp <a href="/boardList.board"> <input type="button"
								id="toList" name="toList" value="목록으로">
						</a>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td><a href="#" id="insertBoardComplain">신고</a></td>


						<td class="btns" colspan="3" align="right"><a
							href="/boardList.board?cpage=${boardPage }"> <input
								type="button" id="back" name="back" value="목록으로">
						</a>
					</tr>
				</c:otherwise>
			</c:choose>




		</table>
	</form>

	<table border="1" width="950" align="center">
		<input id="b_seq" name="b_seq" value="${dto.b_seq }">

		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="10" height="100" align="center">댓글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="comment" items="${list}">
					<tr>
						<input class="bcm_seq" name="bcm_seq" value="${comment.bcm_seq }">
						<td width="100" class="bcm_writer">${comment.bcm_writer }
						<td width="850" align="center" class="bcm_write_date"
							name="bcm_write_date">${comment.bcm_write_date }
					</tr>
					<tr>
						<td><input type="text" class="bcm_content" name="bcm_content"
							size="105" value="${comment.bcm_content }"
							bcm_seq="${comment.bcm_seq }" readonly></td>
						<c:choose>
							<c:when test="${loginNickname == comment.bcm_writer}">
								<td class="cbtns" align="center"><input type="button"
									class="updateBoardComment" name="updateBoardComment"
									value="댓글수정"> &nbsp <a
									href="/deleteBoardComment.boardcomment?bcm_seq=${comment.bcm_seq }&b_seq=${dto.b_seq}">
										<button type="button" class="deleteBoardComment"
											name="deleteBoardComment">댓글삭제</button>
								</a></td>
							</c:when>
							<c:otherwise>
								<td><a
									href="insertBoardCommentComplain.boardcommentcomplain">신고</a></td>
							</c:otherwise>
						</c:choose>
					</tr>

				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<form action="/insertBoardComment.boardcomment" method="post">
		<table border="1" width="950" align="center">
			<input type="hidden" id="b_seq" name="b_seq" value="${dto.b_seq }">
			<tr>
				<td id="bcm_writer" name="bcm_writer" width="100" align="center">${loginNickname }
				<td><input type="text" id="insertBcm_content"
					name="insertBcm_content" placeholder="내용을 입력해주세요." size="105">
				<td align="center">
					<button id="insertBoardComment">댓글 작성</button>
			</tr>

		</table>
	</form>

	<script>
		$("#insertBoardComplain").on("click", function() {
			if (confirm("${dto.b_writer}님의 글 ${dto.b_title}을 신고하시겠습니까?")) {
				$.ajax({
					url : "/insertBoardComplain.boardcomplain",
					datatype : "post",
					data : {
						"b_seq" : "${dto.b_seq }",
						"b_writer" : "${dto.b_writer}",
						"b_title" : "${dto.b_title}",
						"b_content" : "${dto.b_content}"
					}
				})
			}

		})
	</script>
</body>
</html>
