<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 메인 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<style>
.container-fluid {
	color: grey;
	background-color: #03001e;
}

<!--
background:linear-gradient(#03001e, 50 %, #7303c0, #ec38bc, #fdeff9) ; *
	/-->
    #header {
	height: 100px;
}

.list_title {
	padding: 10px;
}

.searchbar {
	background-color: grey;
}

#searchtext {
	width: 100%
}

;
#searchbtn {
	width: 100%
}

;
#logo {
	color: white;
}

.list_title {
	text-align: left;
}

ul {
	overflow: hidden;
	background-color: #03001e;
	list-style: none;
}

ul>li {
	background-color: #03001e;
	width: 233px;
	height: 338px;
}

li>a>img {
	width: 200px;
	height: 280px;
	transition: all 0.2s linear;
}

li>a:hover {
	color: #7303c0
}

a {
	text-decoration: none;
	color: grey
}

li:hover {
	transform: scale(1.2);
	color: #7303c0
}

li:hover img {
	transform: scale(1.2);
}

span>img {
	width: 45px;
	position: relative;
	bottom: 60%;
	left: 80%;
}
</style>
<body>
	<div class="container-fluid text-center">

		<!--form으로 검색결과 넘겨주기-->
		<form action="/search.content">
			<div class="row" id="header">
				<div class="col-sm-12">
					<div id="logo">퍼플무드(로고 이미지 추가)</div>
				</div>
			</div>

			<div class="row" id="searchbar">
				<div class="col-10 col-md-10 col-lg-11">
					<input type="text" id="searchtext" name="searchtext"
						placeholder="검색어를 입력해주세요.">
				</div>
				<div class="col-2 col-md-2 col-lg-1">
					<button class="col" id="searchbtn">검색</button>
				</div>
		</form>
		<!--검색 결과 출력-->
		<c:choose>
			<c:when test="${not empty mv_list}">
				<div class="row" id="movie_bar">
					<hr>
					<div class="list_title pt-2">
						영화 검색 결과 <span> ${mv_list.size()}개</span>
					</div>
					<hr>
					<div class="row">
						<ul class="list-group list-group-horizontal">
							<c:forEach var="m" items="${mv_list}">
								<li
									class="mv_search list-group-item-#03001e col-6 col-sm-4 col-md-2"><a
										href="/detailMv.content?mv_id=${m.mv_id}">
										<img src="${m.mv_poster_path}">
										<p>${m.mv_title}</p>
									</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<hr>
				<div class="list_title pt-2">영화</div>
				<hr>
				<div>검색 결과가 없습니다.</div>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${not empty dr_list}">
				<div class="row" id="drama_bar">
					<hr>
					<div class="list_title">
						드라마 검색 결과<span> ${dr_list.size()}개</span>
					</div>
					<hr>
					<div class="row">
						<ul class="list-group list-group-horizontal">
							<c:forEach var="d" items="${dr_list}">
								<li
									class="mv_search list-group-item-#03001e col-6 col-sm-4 col-md-2"><a
										href="/detailDr.content?dr_id=${d.dr_id}">
										<img src="${d.dr_poster_path}">
										<p>${d.dr_title}</p>
									</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<hr>
				<div class="list_title">드라마</div>
				<hr>
				<div>검색 결과가 없습니다.</div>
			</c:otherwise>
		</c:choose>

	</div>
	<script>
 $(function(){
	 
console.log($(".mv_search").length);

	 });
</script>
</body>
</html>