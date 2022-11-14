<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
* {
	box-sizing: border-box;
	text-align: center;
}

div {
	border: 1px solid;
}

.container {
	margin: auto;
	padding: 10px;
}

.header {
	height: 100px;
	line-height: 100px;
	background-color: #431e5c60;
	font-size: x-large;
	font-weight: bold;
}

.navi {
	background-color: #58257920;
}

.title, .meg {
	height: 40px;
	line-height: 40px;
}

.contentTitles {
	overflow: hidden;
	background-color: #431e5c60;
}

.contentTitle {
	float: left;
	border: 1px solid;
}

.contents {
	overflow: hidden;
}

.content {
	float: left;
	border: 1px solid;
	height: 50px;
	word-break: break-all
}

button {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">관리자페이지</div>
		<div class="navi">
			<ul class="nav nav-tabs">
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black;">회원관리</a>
					<ul class="dropdown-menu">
						<li id="memberAllOutputLi"><a class="dropdown-item" href="#"> <strong>전체조회</strong>
						</a></li>
						<li id="memberRatingOutputLi"><a class="dropdown-item" href="#"> <strong>등급별조회</strong>
						</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black;">콘텐츠관리</a>
					<ul class="dropdown-menu">
						<li><strong>콘텐츠별조회</strong></li>
						<li id="MovieOutputLi"><a class="dropdown-item" href="#">-영화조회</a></li>
						<li id="DramaOutputLi"><a class="dropdown-item" href="#">-드라마조회</a></li>
						<li><strong>OTT별조회</strong></li>
						<li><a class="dropdown-item" href="#">-넷플릭스</a></li>
						<li><a class="dropdown-item" href="#">-웨이브</a></li>
						<li><a class="dropdown-item" href="#">-디즈니</a></li>
						<li><a class="dropdown-item" href="#">-왓챠</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black;">게시판관리</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#"> <strong>신고게시글조회</strong>
						</a></li>
						<li><a class="dropdown-item" href="#"> <strong>신고댓글조회</strong>
						</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="main">
			<div class="memberAllOutput">
				<div class="title">회원관리 > 전체조회</div>
				<div class="contentTitles">
					<div class="contentTitle" style="width: 10%;">아이디</div>
					<div class="contentTitle" style="width: 10%;">닉네임</div>
					<div class="contentTitle" style="width: 7%;">이름</div>
					<div class="contentTitle" style="width: 9%;">전화번호</div>
					<div class="contentTitle" style="width: 15%;">이메일</div>
					<div class="contentTitle" style="width: 7%;">우편번호</div>
					<div class="contentTitle" style="width: 20%;">주소</div>
					<div class="contentTitle" style="width: 15%;">상세주소</div>
					<div class="contentTitle" style="width: 7%;">가입일</div>
				</div>

				<!-- 관리자페이지 버튼이랑 JSP 연결하고 forEach 로 회원 전체 정보 출력할 것 -->
				<div class="contents">
					<div class="content" style="width: 10%;">wlalswlals</div>
					<div class="content" style="width: 10%;">짐</div>
					<div class="content" style="width: 7%;">강지민</div>
					<div class="content" style="width: 9%;">01056027047</div>
					<div class="content" style="width: 15%;">wlalswlals@naver.com</div>
					<div class="content" style="width: 7%;">1234567</div>
					<div class="content" style="width: 20%;">서울특별시 강북구 4.19로 23-1</div>
					<div class="content" style="width: 15%;">무슨빌리지 301호</div>
					<div class="content" style="width: 7%;">2022-11-10 PM21:19</div>
				</div>
				<div class="contents">
					<div class="content" style="width: 10%;">wlalswlals</div>
					<div class="content" style="width: 10%;">짐</div>
					<div class="content" style="width: 7%;">강지민</div>
					<div class="content" style="width: 9%;">01056027047</div>
					<div class="content" style="width: 15%;">wlalswlals@naver.com</div>
					<div class="content" style="width: 7%;">1234567</div>
					<div class="content" style="width: 20%;">서울특별시 강북구 4.19로 23-1</div>
					<div class="content" style="width: 15%;">무슨빌리지 301호</div>
					<div class="content" style="width: 7%;">2022-11-10 PM21:19</div>
				</div>
			</div>
		</div>
		<script>
		
		// 회원 전체 조회
		$("#memberAllOutputLi").on("click", function() {
			location.reload();
		});
			// 회원 등급별 조회
			$("#memberRatingOutputLi").on("click", function() {
				alert("준비 중입니다.");
			});
		
			// 영화 전체 조회
			$("#MovieOutputLi").on("click", function() {

				$(".memberAllOutput").hide();

				$.ajax({
					url : "/MovieAllOutput.ajax",
					type : "post",
					dataType : "json"

				}).done(function(resp) {

					let div = $("<div>");
					div.append("콘텐츠관리 > 콘텐츠별조회 > 영화조회");
					$(".main").append(div);

					let contentTitles = $("<div>");
					contentTitles.addClass("contentTitles");
					$(".main").append(contentTitles);

					let id = $("<div>");
					id.append("아이디");
					id.addClass("contentTitle");
					id.css("width", "10%");
					$(".contentTitles").append(id);

					let title = $("<div>");
					title.append("제목");
					title.addClass("contentTitle");
					title.attr("id", "id");
					title.css("width", "45%");
					$(".contentTitles").append(title);

					let genre = $("<div>");
					genre.append("장르");
					genre.addClass("contentTitle");
					genre.css("width", "7%");
					$(".contentTitles").append(genre);

					let ottNF = $("<div>");
					ottNF.append("넷플릭스");
					ottNF.addClass("contentTitle");
					ottNF.attr("id", "name");
					ottNF.css("width", "7%");
					$(".contentTitles").append(ottNF);

					let ottWV = $("<div>");
					ottWV.append("웨이브");
					ottWV.addClass("contentTitle");
					ottWV.attr("id", "phone");
					ottWV.css("width", "7%");
					$(".contentTitles").append(ottWV);

					let ottDZ = $("<div>");
					ottDZ.append("디즈니");
					ottDZ.addClass("contentTitle");
					ottDZ.attr("id", "email");
					ottDZ.css("width", "7%");
					$(".contentTitles").append(ottDZ);

					let ottWC = $("<div>");
					ottWC.append("왓챠");
					ottWC.addClass("contentTitle");
					ottWC.attr("id", "email");
					ottWC.css("width", "7%");
					$(".contentTitles").append(ottWC);

					let deleteBtn = $("<div>");
					deleteBtn.append("삭제");
					deleteBtn.addClass("contentTitle");
					deleteBtn.css("width", "5%");
					$(".contentTitles").append(deleteBtn);

					let updateBtn = $("<div>");
					updateBtn.append("수정");
					updateBtn.addClass("contentTitle");
					updateBtn.css("width", "5%");
					$(".contentTitles").append(updateBtn);

					for (var i = 0; i < resp.length; i++) {

						let contents = $("<div>");
						contents.addClass("contents" + i);
						contents.css("overflow", "hidden");
						$(".main").append(contents);

						let mv_id = $("<div>");
						mv_id.append(resp[i].mv_id);
						mv_id.addClass("content" + i);
						mv_id.css("width", "10%");
						mv_id.css("float","left");
						mv_id.css("border","1px solid");
						mv_id.css("height","50px");
						mv_id.css("word-break","break-all");
						$(".contents" + i).append(mv_id);

						let mv_title = $("<div>");
						mv_title.append(resp[i].mv_title);
						mv_title.addClass("content");
						mv_title.css("width", "45%");
						$(".contents" + i).append(mv_title);

						let mv_genre = $("<div>");
						mv_genre.append(resp[i].mv_genre);
						mv_genre.addClass("content");
						mv_genre.css("width", "7%");
						$(".contents" + i).append(mv_genre);

						let mv_ottNF = $("<div>");
						mv_ottNF.append(resp[i].mv_ottNF);
						mv_ottNF.addClass("content");
						mv_ottNF.css("width", "7%");
						$(".contents" + i).append(mv_ottNF);

						let mv_ottWV = $("<div>");
						mv_ottWV.append(resp[i].mv_ottWV);
						mv_ottWV.addClass("content");
						mv_ottWV.css("width", "7%");
						$(".contents" + i).append(mv_ottWV);

						let mv_ottDZ = $("<div>");
						mv_ottDZ.append(resp[i].mv_ottDZ);
						mv_ottDZ.addClass("content");
						mv_ottDZ.css("width", "7%");
						$(".contents" + i).append(mv_ottDZ);

						let mv_ottWC = $("<div>");
						mv_ottWC.append(resp[i].mv_ottWC);
						mv_ottWC.addClass("content");
						mv_ottWC.css("width", "7%");
						$(".contents" + i).append(mv_ottWC);

						let deleteBtn = $("<button>");
						deleteBtn.append("삭제");
						deleteBtn.addClass("button");
						deleteBtn.attr("id", "deleteBtn" + i);
						deleteBtn.css("width", "5%");
						$(".contents" + i).append(deleteBtn);

						let updateBtn = $("<button>");
						updateBtn.append("수정");
						updateBtn.addClass("button");
						updateBtn.attr("id", "updateBtn" + i);
						updateBtn.css("width", "5%");
						$(".contents" + i).append(updateBtn);

						(function(i) {
							$("#deleteBtn" + i).on("click", function() {
								if (confirm("해당 콘텐츠를 삭제하시겠습니까?")) {
									$.ajax({
										url : "/MovieDelete.ajax",
										type : "post",
										dataType : "json",
										data : {
											"mv_id" : $(".content" + i).html()
										}
									});
									alert($(".content" + i).html()+"번의 콘텐츠가 삭제되었습니다.");
									$(".contents" + i).hide();
								} else {
									alert("취소되었습니다.");
								}
							});
						})(i);

						$("#updateBtn" + i).on("click", function() {
							if (confirm("해당 콘텐츠를 수정하시겠습니까?")) {

								//location.href = "delete.board?seq=${list[0].seq }";
								alert("준비 중입니다.");

							} else {
								alert("취소되었습니다.");
							}
						});
					}
				});
			});
			
			// 클릭이벤트 중복 방지
			$("#MovieOutputLi").click(function() {
				$("#MovieOutputLi").off("click");
			});
			
			
		</script>
</body>
</html>