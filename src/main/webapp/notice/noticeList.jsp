<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
.noticeWrite {
	float: hidden;
}

.noticeSearch {
	text-align: center;
}

#noticeWriteBtn {
	float: right;
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

.noticeTitle {
	heigth: 50px;
	text-align: center;
	line-height: 45px;
	font-size: 40px;
	font-weight: bold;
	color: white;
	text-decoration: underline;
	text-decoration-thickness: 3px;
	text-underline-position: under;
}

.noticeTitle, .theader, .content, #insertNoticeContentsBtn,
	.noticeListSearch, .noticeListSearch, .navi *, .noticeListSearch * {
	font-family: 'DungGeunMo';
}

.noticeContainer {
	width: 50%;
	margin: 20px auto;
	background-color: white;
	text-decoration: none !important;
	border-radius: 7px;
}

.notice {
	overflow: hidden;
	text-decoration: none !important;
	border-radius: 7px;
}

.notice {
	border-top: 3.5px solid #7303c0;
	border-bottom: 3.5px solid #7303c0;
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

.noticeListSearch {
	margin-top: 10px;
	margin-bottom: -5px;
}

a {
	text-decoration: none;
}

.content *, .theader>div {
	color: #03001e;
}

#insertNoticeContentsBtn {
	width: 100px;
	height: 30px;
}

.noticeListSearch button {
	width: 70px;
	height: 30px;
}

#noticeSearchWord {
	width: 170px;
	height: 23px;
}

#noticeSearchOption {
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
			<div class="noticeTitle col-12">공지사항</div>
		</div>
		<div class="row">
			<div class="noticeContainer" style="min-width: 350px;">
				<div class="row">
					<div class="notice col-12">
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
							<c:when test="${not empty notice}">
								<c:forEach var="notice" items="${notice}">
									<div class="row">
										<div class="content col-12">
											<div class="row">
												<div class="contentTitle col-12">
													<a
														href="/selectNoticeContents.notice?n_seq=${notice.n_seq}"
														style="text-decoration: none">${notice.n_title}</a>
												</div>
											</div>
											<div class="row">
												<div class="contentWriter col-12">${notice.n_writer}</div>
											</div>
											<div class="row">
												<div class="contentWriteTime col-12">${notice.n_write_date}</div>
											</div>
											<div class="row">
												<div class="contentViewCount col-12">${notice.n_view_count}</div>
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
							<a href="/notice/insertNoticeContents.jsp"><button
									type="button" id="insertNoticeContentsBtn">글쓰기</button></a>
						</div>
						<hr>
						<div align="center" class="navi">
							<a href="noticeList.notice?cpage=1"><button type="button">처음으로</button></a>
							${navi} <a href="noticeList.notice?cpage=${endNavi}"><button
									type="button">끝으로</button></a>
						</div>
						<hr>
						<form action="/noticeListSearch.board" method="post">
							<div class="row">
								<div class="noticeListSearch col-12">
									<select id="noticeSearchOption" name="noticeSearchOption">
										<option value="post">공지</option>
										<option value="event">이벤트</option>
										<option value="FAQ">FAQ</option>
									</select> <input type="text" id="noticeSearchWord"
										name="noticeSearchWord">
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