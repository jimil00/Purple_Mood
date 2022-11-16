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
	margin-bottom: 50px;
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
	border-top: 5px solid #7303c0;
	border-bottom: 5px solid #7303c0;
}

.theader {
	float: left;
	width: 100%;
	height: 35px;
	font-size: 16.5px;
}

.theader>div {
	float: left;
	width: 20%;
	height: 100%;
	line-height: 38.5px;
	font-weight: bold;
}

.content {
	overflow: hidden;
	color: #03001e;
}

.contentCategory {
	float: left;
	width: 20%;
}

.contentTitle {
	float: left;
	width: 20%;
}

.contentWriter {
	float: left;
	width: 20%;
}

.contentWriteTime {
	float: left;
	width: 20%;
}

.contentViewCount {
	float: left;
	width: 20%;
}

.boardListSearch {
	margin-top: 10px;
	margin-bottom: -5px;
}

* {
	box-sizing: border-box;
}

body {
	background-color: #03001e;
}

.containers {
	overflow: hidden;
	color: white;
}

@font-face {
	font-family: 'DungGeunMo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
/* div {
	border: 1px solid black;
} */

/* header */
.header {
	height: 100px;
	background-color: #03001e;
	margin-bottom: 20px;
}

#logo, #titleimg {
	height: 100%;
}

#titleimg:hover {
	cursor: pointer;
}

@media ( max-width :767px) {
	#logo {
		height: 60%;
	}
	#titleimg {
		height: 100%;
	}
}

.searchbox {
	text-align: right;
}

.searchboxin {
	position: relative;
	top: 10%;
}

#searchtext {
	width: 90%;
}

.menuicon {
	text-align: center;
}

#menuicon {
	position: relative;
	top: 8%;
}

#menuicon:hover {
	cursor: pointer;
}

/* footer */
.footer {
	padding-top: 50px;
	padding-bottom: 50px;
	position: relative;
	left: 5%;
	padding-bottom: 50px;
}

.footerAtag {
	padding-top: 30px;
	padding-bottom: 20px;
}

.footerAtag>a {
	font-family: 'DungGeunMo';
	font-size: large;
}

.footerAtag>a:hover {
	color: #ec38bc;
}

.footerImpormation {
	font-size: smaller;
}

.footerIcon {
	padding-top: 10px;
	height: 50px;
	line-height: 50px;
}

.fa-brands:hover {
	cursor: pointer;
}

.snsIcon {
	padding-right: 20px;
	padding-left: 10px;
}

/* menu */
.offcanvas {
	height: 800px;
	background-color: #03001e;
}

.offcanvas-body {
	text-align: center;
}

.profilebox {
	width: 170px;
	height: 150px;
	overflow: hidden;
	position: relative;
	left: 30%;
	margin-bottom: 20px;
	margin-top: 30px;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profiletext {
	font-size: larger;
	margin-bottom: 10px;
	color: white;
	font-family: 'DungGeunMo';
}

#profileimg {
	height: 100%;
}

#logoutBtn {
	font-size: larger;
	font-family: 'DungGeunMo';
}

.menulink {
	font-size: x-large;
	margin-bottom: 50px;
	margin-top: 50px;
	font-family: 'DungGeunMo';
}

.menulink:hover, #searchbtn:hover {
	color: #c4c4c4;
	cursor: pointer;
}

#colsebtn {
	border: none;
	color: white;
	background-color: #03001e;
}

#linksec {
	padding-top: 50px;;
	padding-bottom: 50px;;
}

#logoutsec {
	padding-top: 50px;;
	padding-bottom: 50px;;
}

a {
	color: white;
	text-decoration: none;
}

button {
	border: none;
	border-radius: 5px;
}

hr.hr {
	width: 90%
}

* {
	color: black;
}
</style>
</head>
<body>
	<div class="containers">
		<div class="row header fixed-top">
			<div class="col-12 col-md-7 col-lg-8" id="logo">
				<img src="/img/title.png" id="titleimg">
			</div>
			<div class="col-8 col-md-4 col-lg-3 searchbox">
				<input type="text" class="searchboxin" id="searchtext"
					onkeyup="enterkey()" name="searchtext" /> <i
					class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i></a>
			</div>
			<script>
				$("#titleimg").on("click", function() {
					location.href = "/main";
				})

				$("#searchbtn").on(
						"click",
						function() {
							location.href = "/search.content?searchtext="
									+ $("#searchtext").val();
							;
						})

				function enterkey() { //검색창에 마우스 올린 후 엔터 누르면 바로 넘어가게 만드는 함수
					if (window.event.keyCode == 13) {
						location.href = "/search.content?searchtext="
								+ $("#searchtext").val();
					}
				}
			</script>

			<div class="col-4 col-md-1 col-lg-1 menuicon">
				<i class="fas fa-bars fa-2x" id="menuicon"
					data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasWithBothOptions"
					aria-controls="offcanvasWithBothOptions"></i>
			</div>
		</div>
		<div class="row header"></div>
		<div class="container col-12" style="min-width: 350px;">
			<div class="row"></div>
			<div class="row">
				<div class="boardTitle col-12">영화/드라마 게시판</div>
			</div>
			<div class="row">
				<div class="boardContainer" style="min-width: 350px;">
					<div class="row">
						<div class="board col-12">
							<div class="row">
								<div class="theader col-12" style="">
									<div class="row">
										<div class="col-12">카테고리</div>
									</div>
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
													<div class="contentCategory col-12">${board.b_category}</div>
												</div>
												<div class="row">
													<div class="contentTitle col-12">
														<a href="/selectBoardContents.board?b_seq=${board.b_seq}"
															style="text-decoration: none">${board.b_title}</a>
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
								<!-- <a href="boardList.board?cpage=1"><button type="button">처음으로</button></a> -->
								${navi}
								<!--<a href="boardList.board?cpage=${endNavi}">
								<button type="button">끝으로</button> -->
								</a>
							</div>
							<hr>
							<form action="/boardListSearch.board?cpage=1" method="post">
								<div class="row">
									<div class="boardListSearch col-12">
										<select id="boardSearchOption" name="boardSearchOption">
											<option value="b_title">제목</option>
											<option value="b_writer_nn">작성자</option>
											<option value="b_content">내용</option>
										</select> <input type="text" id="boardSearchWord"
											name="boardSearchWord">
										<button>검색</button>
									</div>
									<br>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row footer">
				<hr class="hr">
				<div class="col-12 footerAtag">
					<a href="#">회사소개</a> &nbsp&nbsp <a href="#">고객센터</a> &nbsp&nbsp <a
						href="#">이용약관</a> &nbsp&nbsp <a href="#">개인정보 처리방침</a>
				</div>
				<div class="col-12 footerImpormation">(주)퍼플무드 | 대표이사 : 성태조</div>
				<div class="col-12 footerImpormation">이메일 주소 :
					purpleMood@purplemood.com</div>
				<div class="col-12 footerImpormation">사업자등록번호 : 000-00-000</div>
				<div class="col-12 footerImpormation">통신판매업 신고번호 : 제
					2022-서울중구-301e호</div>
				<div class="col-12 footerImpormation">주소 : 대한민국 서울특별시 중구 남대문로
					120, 대일빌딩 3층</div>
				<div class="col-12 footerIcon">
					<span class="snsIcon"><i
						class="fa-brands fa-instagram fa-2xl"></i></span> <span class="snsIcon"><i
						class="fa-brands fa-twitter fa-2xl"></i></span> <span class="snsIcon">
						<i class="fa-brands fa-facebook fa-2xl"></i>
					</span>
				</div>
			</div>
</body>
</html>