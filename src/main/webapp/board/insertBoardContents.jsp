<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Summernoteinsert</title>

<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-en-US.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet" />
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

.header, .footer {
	background-color: #03001e;
}

.header {
	font-family: '둥근모꼴체';
	color: #03001e;
}

.headerTitle {
	color: #fdeff9;
}

/* 추가한부분 */
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
	color: white;
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
	box-sizing: border-box;
}

.note-editor {
	background-color: white;
}

.editorBtn {
	margint-top: 15px;
	color: white;
	background-color: white;
}

#editor {
	background-color: white;
	color: black;
}

.note-toolbar * {
	color: black;
}
</style>

<script>
            $(document).ready(function () {
                // var fontList = ['굴림', '맑은고딕', '돋움', '바탕', 'J송명', '교보손글씨', '빙그레싸만코체', '주아체', '한림고딕체', '둥근모꼴체', 'NotoSansKR', 'Arial', 'Courier New', 'Verdana', 'Times New Roamn'];
                $('#summernote').summernote({
                    lang: 'ko-KR',
                    height: 400,
                    placeholder: "내용을 입력해주세요.",
                    fontNames: ['굴림', '맑은고딕', '돋움', '바탕', 'J송명', '교보손글씨', '빙그레싸만코체', '주아체', '한림고딕체', '둥근모꼴체', 'NotoSansKR', 'Arial', 'Courier New', 'Verdana', 'Times New Roamn'],
                    // addDefaultFonts: false,
                    fontNamesIgnoreCheck: ['굴림', '맑은고딕', '돋움', '바탕', 'J송명', '교보손글씨', '빙그레싸만코체', '주아체', '한림고딕체', '둥근모꼴체', 'NotoSansKR', 'Arial', 'Courier New', 'Verdana', 'Times New Roamn'],
                    callbacks: {
                        onImageUpload: function (image) {
                            console.log("works")
                            data = new FormData();
                            data.append("image", image[0]);

                            $.ajax({
                                data: data,
                                type: "post",
                                url: "/imageupload.board",
                                cache: false,
                                contentType: false,
                                processData: false,
                                success: function (url) {
                                    console.log(url)
                                    var image = $('<img>').attr('src', url);
                                    $("#summernote").summernote("insertNode", image[0]);
                                },
                                error: function (a, b, c) {
                                    console.log(a);
                                    console.log(b);
                                    console.log(c);
                                }
                            });
                        }
                    }
                });

                $('#summernote').summernote('fontName', '둥근모꼴체');

                $('#insertBoardContents').on('click', function () {
                    saveContent();


                });
                function saveContent() {

                    //값 가져오기
                    var summernoteContent = $('#summernote').summernote('code');        //썸머노트(설명)
                    console.log("summernoteContent : " + summernoteContent);
                    var b_category = $("#b_category").val();
                    var b_title = $("#b_title").val();

                    $.ajax({
                        url: "/insertBoardContents.board",
                        type: "post",
                        data: {
                            "b_category": b_category,
                            "b_title": b_title,
                            "b_content": summernoteContent
                        }, success: function (data) {
                            var b_seq = data;
                            location.href = "/selectBoardContents.board?b_seq=" + b_seq;
                        }
                    });
                };
            });
        </script>
</head>

<body>
	<div class="container w-xl">
		<div class="row header fixed-top">
			<div class="col-12 col-md-7 col-lg-8" id="logo">
				<img src="/img/title.png" id="titleimg">
			</div>
			<div class="col-8 col-md-4 col-lg-3 searchbox">
				<input type="text" class="searchboxin" id="searchtext" onkeyup="enterkey()" name="searchtext" /> <i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn" style="color: white;"></i></a>
			</div>
			<script>
                    $("#titleimg").on("click", function () {
                        location.href = "/main";
                    })

                    $("#searchbtn").on("click", function () {
                        location.href = "/search.content?searchtext=" + $("#searchtext").val();;
                    })

                    function enterkey() { //검색창에 마우스 올린 후 엔터 누르면 바로 넘어가게 만드는 함수
                        if (window.event.keyCode == 13) {
                            location.href = "/search.content?searchtext=" + $("#searchtext").val();
                        }
                    }

                </script>
			<div class="col-4 col-md-1 col-lg-1 menuicon">
				<i class="fas fa-bars fa-2x" id="menuicon" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions" style="color: white;"></i>
			</div>
		</div>
		<div class="row header"></div>
		<div class="row content"></div>
		<div class="insertBoardContents col-12">
			<div class="row header">
				<div class="category col-12">
					<div class="headerTitle">카테고리</div>
					<div>
						<select id="b_category" name="b_category">
							<option value="영화">영화</option>
							<option value="드라마">드라마</option>
							<option value="실시간">실시간</option>
							<option value="후기">후기</option>
						</select>
					</div>
				</div>
				<div class="title">
					<div class="headerTitle">제목</div>
					<div>
						<input type="text" id="b_title" name="b_title" placeholder="제목을 입력하세요." style="border: none; width: 100%;">
					</div>
				</div>
			</div>
			<div class="row body" id="editor">
				<div class="col-lg-12 col-md-12 col-sm-12" id="summernote" name="b_content"></div>
			</div>
			
		</div>
	</div>
	<div class="row footer">
		<hr class="hr">
		<div class="col-12 footerAtag">
			<a href="#">회사소개</a> &nbsp&nbsp <a href="#">고객센터</a> &nbsp&nbsp <a href="#">이용약관</a> &nbsp&nbsp <a href="#">개인정보 처리방침</a>
		</div>
		<div class="col-12 footerImpormation">(주)퍼플무드 | 대표이사 : 성태조</div>
		<div class="col-12 footerImpormation">이메일 주소 : purpleMood@purplemood.com</div>
		<div class="col-12 footerImpormation">사업자등록번호 : 000-00-000</div>
		<div class="col-12 footerImpormation">통신판매업 신고번호 : 제 2022-서울중구-301e호</div>
		<div class="col-12 footerImpormation">주소 : 대한민국 서울특별시 중구 남대문로 120, 대일빌딩 3층</div>
		<div class="col-12 footerIcon">
			<span class="snsIcon"><i class="fa-brands fa-instagram fa-2xl"></i></span> <span class="snsIcon"><i class="fa-brands fa-twitter fa-2xl"></i></span> <span class="snsIcon"> <i class="fa-brands fa-facebook fa-2xl"></i>
			</span>
		</div>
	</div>
	</div>

	<c:choose>
		<c:when test="${loginID!=null && loginID!='admin123'}">
			<!-- 로그인 -->
			<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
				<div class="offcanvas-header">
					<button type="button" data-bs-dismiss="offcanvas" id="colsebtn" aria-label="Close">
						<i class="fa-solid fa-xmark fa-xl"></i>
					</button>
				</div>
				<div class="offcanvas-body">
					<div class="profilebox" id="Btn" style="background: #BDBDBD;">
						<img src="/img/logo.png" id="profileimg">
					</div>
					<div class="profiletext">${loginNickname }</div>
					<div class="profiletext">
						<a href="/member/mypage.jsp">
							<button>마이페이지</button>
						</a>
					</div>
					<div id="linksec">
						<a href="/boardList.board?cpage=1">
							<div class="menulink">영화 드라마 게시판</div>
						</a>
					</div>
					<div id="logoutsec">
						<button type="button" id="logoutBtn">로그아웃</button>
					</div>
				</div>
				<script>
                        $("#logoutBtn").on("click", function () {
                            location.href = "/logout.member";
                        })
                    </script>
			</div>
		</c:when>
		<c:when test="${loginID!=null && loginID == 'admin123'}">
			<!-- 관리자 -->
			<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
				<div class="offcanvas-header">
					<button type="button" data-bs-dismiss="offcanvas" id="colsebtn" aria-label="Close">
						<i class="fa-solid fa-xmark fa-xl"></i>
					</button>
				</div>
				<div class="offcanvas-body">
					<div class="profilebox" id="Btn" style="background: #BDBDBD;">
						<img src="/img/logo.png" id="profileimg">
					</div>
					<div class="profiletext">${loginNickname }</div>
					<div class="profiletext">
						<a href="/memberOutput.manager">
							<button>관리자페이지</button>
						</a>
					</div>
					<div id="linksec">
						<a href="/boardList.board?cpage=1">
							<div class="menulink">영화 드라마 게시판</div>
						</a>
					</div>
					<div id="logoutsec">
						<button type="button" id="logoutBtn">로그아웃</button>
					</div>
				</div>
				<script>
                        $("#logoutBtn").on("click", function () {
                            location.href = "/logout.member";
                        })
                    </script>
			</div>
		</c:when>
	</c:choose>