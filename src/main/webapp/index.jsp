<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css"
	rel="stylesheet" />
<style>
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

/* div {
	border: 1px solid black;
} */

/* header */
.header {
	height: 100px;
	background-color: #03001e;
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

#menuicon:hover {
	cursor: pointer;
}

/* content */
.bannerslide {
	position: relatvie;
	left: 30%;
}

.bannerimg {
	width: 95%;
}

/* ott버튼 */
.ottboxsec {
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: center;
}

#watchabtn {
	display: inline-block;
	padding: 25px 30px;
	margin: 40px 0;
	transition: 0.5s;
	margin-right: 50px;
}

#watchabtn:hover {
	background: #ff0559;
	color: #050801;
	box-shadow: 0 0 5px #ff0559, 0 0 25px #ff0559, 0 0 50px #ff0559, 0 0
		200px #ff0559;
	-webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

#wavvebtn {
	display: inline-block;
	padding: 25px 30px;
	margin: 40px 0;
	transition: 0.5s;
	margin-right: 50px;
}

#wavvebtn:hover {
	background: #022ca4;
	color: #050801;
	box-shadow: 0 0 5px #022ca4, 0 0 25px #022ca4, 0 0 50px #022ca4, 0 0
		200px #022ca4;
	-webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

#netbtn {
	display: inline-block;
	padding: 25px 30px;
	margin: 40px 0;
	transition: 0.5s;
	margin-right: 50px;
}

#netbtn:hover {
	background: #ed1c24;
	box-shadow: 0 0 5px #ed1c24, 0 0 25px #ed1c24, 0 0 50px #ed1c24, 0 0
		200px #ed1c24;
	-webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

#disneybtn {
	display: inline-block;
	padding: 25px 30px;
	margin: 40px 0;
	transition: 0.5s;
	margin-right: 50px;
}

#disneybtn:hover {
	background: #3bdce4;
	box-shadow: 0 0 5px #3bdce4, 0 0 25px #3bdce4, 0 0 50px #3bdce4, 0 0
		200px #3bdce4;
	-webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

.ottimg {
	width: 200px;
	height: 60px;
}

@media ( max-width : 600px) {
	.ottimg {
		width: 150px;
		height: 50px;
	}
}
/* 영화 포스터 */
.titlename {
	padding-left: 3%;
}

.imgbox {
	text-align: center;
}

.postimg {
	width: 15%;
	border-radius: 5px;
}

.postimg:hover {
	transform: scale(1.01);
}

#carouselExampleControls, #carouselExampleControls2 {
	padding-top: 20px;
	padding-bottom: 50px;
}

.postLRbtn {
	width: 50px;
	height: 90%
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
	width: 150px;
	height: 150px;
	border-radius: 70%;
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
}

#logoutBtn {
	font-size: larger;
}

.menulink {
	font-size: x-large;
	margin-bottom: 50px;
	margin-top: 50px;
}

.menulink:hover, #searchbtn:hover {
	color: #c4c4c4;
}

#colsebtn {
	border: none;
	color: white;
	background-color: #03001e;
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
</style>

</head>
<body>

	<div class="containers">
		<div class="row header fixed-top">
			<div class="col-12 col-md-7 col-lg-8" id="logo">
				<img src="" />
			</div>
			<div class="col-8 col-md-4 col-lg-3 searchbox">
				<input type="text" class="searchboxin" id="searchtext"
					onkeyup="enterkey()" name="searchtext" /> <a
					href="/search.content?searchtext=" +searchtext>
					<i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i></a>
			</div>
			<script>
	
			function enterkey() { //검색창에 마우스 올린 후 엔터 누르면 바로 넘어가게 만드는 함수
				if (window.event.keyCode == 13) {
			location.href="/search.content?searchtext="+$("#searchtext").val(); 
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

		<div class="row content">
			<div class="bannersec">
				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-bs-ride="carousel">
					<div
						class="carousel-indicators col-12 d-none d-md-block bannerslide">
						<button type="button" data-bs-target="#carouselExampleFade"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleFade"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleFade"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/img/banner (4).png" class="d-block m-auto bannerimg">
						</div>
						<div class="carousel-item">
							<img src="/img/banner (5).png" class="d-block m-auto bannerimg">
						</div>
						<div class="carousel-item">
							<img src="/img/banner (6).png" class="d-block m-auto bannerimg">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="ottboxsec">
				<div class="row ">
					<div class="col-6 col-lg-3">
						<a href="/disney.content" id="disneybtn"> <img src="/img/disbf.png"
							id="disney" class="ottimg">
						</a>
					</div>
					<div class="col-6 col-lg-3">
						<a href="/wavve.content" id="wavvebtn"> <img src="/img/wavbf.png"
							id="wavve" class="ottimg">
						</a>
					</div>
					<div class="col-6 col-lg-3">
						<a href="/netflix.content" id="netbtn"> <img src="/img/netbf.png"
							id="netflix" class="ottimg">
						</a>
					</div>
					<div class="col-6 col-lg-3">
						<a href="/watcha.content" id="watchabtn"> <img src="/img/watbf.png"
							id="watcha" class="ottimg">
						</a>
					</div>
					<script>
						$("#watchabtn").on("mouseover", function() {
							$("#watcha").attr("src", "/img/wataf.png");
						});
						$("#watchabtn").on("mouseout", function() {
							$("#watcha").attr("src", "/img/watbf.png");
						});
						$("#wavvebtn").on("mouseover", function() {
							$("#wavve").attr("src", "/img/wavat.png");
						});
						$("#wavvebtn").on("mouseout", function() {
							$("#wavve").attr("src", "/img/wavbf.png");
						});
						$("#netbtn").on("mouseover", function() {
							$("#netflix").attr("src", "/img/netat.png");
						});
						$("#netbtn").on("mouseout", function() {
							$("#netflix").attr("src", "/img/netbf.png");
						});
						$("#disneybtn").on("mouseover", function() {
							$("#disney").attr("src", "/img/disat.png");
						});
						$("#disneybtn").on("mouseout", function() {
							$("#disney").attr("src", "/img/disbf.png");
						});
					</script>
				</div>
			</div>
			<div class="poster1">
				<div class="col-12 fs-3 titlename">인기 영화</div>
				<div>
					<div id="carouselExampleControls" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item imgbox active">
								<a href="#"><img src="" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
							</div>
							<div class="carousel-item imgbox">
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/2.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/3.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/4.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/5.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
							</div>
							<div class="carousel-item imgbox">
								<a href="#"><img src="/img/5.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/4.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/3.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/2.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/5.jpg" class="postimg" alt="..."></a>
							</div>
						</div>
						<button class="carousel-control-prev postLRbtn" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next postLRbtn" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden ">Next</span>
						</button>
					</div>
				</div>
			</div>
			<div class="poster2">
				<div class="col-12 fs-3 titlename">최신영화</div>
				<div>
					<div id="carouselExampleControls2" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item imgbox active">
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
							</div>
							<div class="carousel-item imgbox">
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/2.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/3.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/4.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/5.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
							</div>
							<div class="carousel-item imgbox">
								<a href="#"><img src="/img/5.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/4.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/3.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/2.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/1.jpg" class="postimg" alt="..."></a>
								<a href="#"><img src="/img/5.jpg" class="postimg" alt="..."></a>
							</div>
						</div>
						<button class="carousel-control-prev postLRbtn" type="button"
							data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next postLRbtn" type="button"
							data-bs-target="#carouselExampleControls2" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden ">Next</span>
						</button>
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
	</div>

	<c:choose>
		<c:when test="${loginID!=null}">
			<!-- 로그인 -->
			<div class="offcanvas offcanvas-end" data-bs-scroll="true"
				tabindex="-1" id="offcanvasWithBothOptions"
				aria-labelledby="offcanvasWithBothOptionsLabel">
				<div class="offcanvas-header">
					<button type="button" data-bs-dismiss="offcanvas" id="colsebtn"
						aria-label="Close">
						<i class="fa-solid fa-xmark fa-xl"></i>
					</button>
				</div>
				<div class="offcanvas-body">
					<div class="profilebox" id="Btn" style="background: #BDBDBD;"></div>
					<button type="button" id="profileBtn">
						<i class="fa-solid fa-pen"></i>
					</button>
					<div class="profiletext">${loginNickname }</div>
					<div class="profiletext">

						<a href="/mypageMemInfo.member"><button>마이페이지</button></a>

					</div>
					<a href="/boardList.board">
						<div class="menulink">영화 드라마 게시판</div>
					</a> <a href="#">
						<div class="menulink">자유게시판</div>
					</a> <a href="#">
						<div class="menulink">공지사항</div>
					</a>
					<button type="button" id="logoutBtn">로그아웃</button>
				</div>
				<script>
					$("#profileBtn").on(
							"click",
							function() {
								window.open("/profile.jsp", "",
										"width=400,height=300");
							})
					$("#logoutBtn").on("click", function() {
						location.href = "/logout.member";
					})
					$("#mypageBtn").on("click", function() {
						location.href = "/member/mypageMemInfo.jsp";
					})
				</script>
			</div>
		</c:when>
		<c:otherwise>
			<!-- 비로그인  -->
			<div class="offcanvas offcanvas-end" data-bs-scroll="true"
				tabindex="-1" id="offcanvasWithBothOptions"
				aria-labelledby="offcanvasWithBothOptionsLabel">
				<div class="offcanvas-header">
					<button type="button" data-bs-dismiss="offcanvas" id="colsebtn"
						aria-label="Close">
						<i class="fa-solid fa-xmark fa-xl"></i>
					</button>
				</div>
				<div class="offcanvas-body">
					<div class="profilebox" style="background: #BDBDBD;"></div>
					<div class="profiletext">익명의 누군가</div>
					<div class="profiletext">
						<a href="/member/signin.jsp"><button id="signinBtn">로그인</button></a>
					</div>
					<a href="#">
						<div class="menulink">영화 드라마 게시판</div>
					</a> <a href="#">
						<div class="menulink">자유게시판</div>
					</a> <a href="#">
						<div class="menulink">공지사항</div>
					</a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>