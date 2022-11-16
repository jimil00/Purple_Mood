<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 드라마 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
@font-face {
   font-family: 'DungGeunMo';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}
.boardWrite {
   float: hidden;
}

.boardSearch {
   text-align: center;
}

#boardWriteBtn {
   float: right;
}

#b_content {
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}

* {
   text-align: center;
}

body {
   background-color: #03001e;
}

.header {
   height: 100px;
   color: white;
}

.boardTitle {
	heigth: 50px;
	text-align: center;
	line-height: 45px;
	font-size: 40px;
	font-weight: bold;
	color: white;
	text-decoration: underline;
	text-decoration-thickness: 3px;
	text-underline-position: under;
	margin-bottom:50px;
}

.boardTitle, .theader, .content, #insertBoardContentsBtn,
   .boardListSearch, .boardListSearch, .navi *, .boardListSearch * {
   font-family: 'DungGeunMo';
}

.boardContainer {
   width: 50%;
   margin: 20px auto;
   background-color: white;
   text-decoration: none !important;
   border-radius: 7px;
}

.board {
   overflow: hidden;
   text-decoration: none !important;
   border-radius: 7px;
}

.board {
	border-top: 7px solid #7303c0;
	border-bottom: 7px solid #7303c0;
}

.theader {
	float: left;
	width: 100%;
	height: 35px;
	font-size: 19px;
}

.theader>div {
	float: left;
	width: 24.6%;
	height: 100%;
	line-height: 38.5px;
	font-weight: bold;
}

.content {
   overflow: hidden;
   color: #03001e;
}

.contentTitle {
	float: left;
	width: 24.6%;
}

.contentWriter {
	float: left;
	width: 24.6%;
}

.contentWriteTime {
	float: left;
	width: 24.6%;
}

.contentViewCount {
	float: left;
	width: 24.6%;
}

.boardListSearch {
   margin-top: 10px;
   margin-bottom: -5px;
}

a {
   text-decoration: none;
}

.content *, .theader>div {
   color: #03001e;
}

#insertBoardContentsBtn {
   width: 100px;
   height: 30px;
}

.boardListSearch button {
   width: 70px;
   height: 30px;
}

#boardSearchWord {
   width: 170px;
   height: 23px;
}

#boardSearchOption {
   width: 70px;
   height: 30px;
}

.navi * {
   color: #03001e;
   text-decoration: none;
}
</style>
</head>
<body>
	<div class="container col-12" style="min-width: 350px;">
		<div class="row">
			<div class="header col-12">logo</div>
		</div>
		<div class="row">
			<div class="boardTitle col-12">영화/드라마 게시판</div>
		</div>
		<div class="row">
			<div class="boardContainer" style="min-width: 350px;">
				<div class="row">
					<div class="board col-12">
						<div class="row">
							<div class="theader col-12">
								<div class="row">
									<div class="col-12">제목</div>
								</div>
								<div class="row">
									<div class="col-12">작성자</div>
								</div>
								<div class="row">
									<div class="col-12">작성 시간</div>
								</div>
								<div class="row">
									<div class="col-12">조회수</div>
								</div>
							</div>
						</div>
						<hr class="hr">
						<c:choose>
							<c:when test="${not empty board}">
								<c:forEach var="board" items="${board}">
									<div class="row">
										<div class="content col-12">
											<div class="row">
												<div class="contentTitle col-12">
													<a href="/selectBoardContents.board?b_seq=${board.b_seq}"
														 style="text-decoration: none">
														 <div id="b_title">${board.b_title}</div>
														 													<script>
                            						$("#b_title").text($("#b_title").html());
                            						</script></a>

												</div>
											</div>
											<div class="row">
												<div class="contentWriter col-12">${board.b_writer_nn}</div>
											</div>
											<div class="row">
												<div class="contentWriteTime col-12">${board.b_write_date}</div>
											</div>
											<div class="row">
												<div class="contentViewCount col-12">${board.b_view_count}</div>
											</div>
										</div>
									</div>
									<hr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div>
									<div colspan="6" style="font-family: 'DungGeunMo';">출력할
										글이 없습니다.</div>
								</div>
								<hr>
							</c:otherwise>
						</c:choose>
						<div class="insertBoardContents">
							<a href="/board/insertBoardContents.jsp"><button
									type="button" id="insertBoardContentsBtn">글쓰기</button></a>
						</div>
						<hr>
						<div align="center" class="navi">
<!-- 							<a href="/boardList.board?cpage=1"><button type="button">처음으로</button></a> -->
<%-- 							${navi} <a href="boardList.board?cpage=${endNavi}"><button --%>
<!-- 									type="button">끝으로</button></a> -->
										${navi }
						
						</div>
						<hr>
						<form action="/boardSearchList.board?cpage=1" method="post">
							<div class="row">
								<div class="boardSearchList col-12">
									<select id="boardSearchOption" name="boardSearchOption">
										<option value="b_title">제목</option>
										<option value="b_writer_nn">작성자</option>
										<option value="b_content">내용</option>
									</select> <input type="text" id="boardSearchWord" name="boardSearchWord">
									<button>검색</button>
								</div>
								<br>
							</div>
						</form>
					</div>
				</div>
			</div>
</body>
</html>