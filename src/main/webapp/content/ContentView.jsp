<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>콘텐츠 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>

<style>
@font-face {
	font-family: 'DungGeunMo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@media screen and (max-width: 576px) { 
	.ott_icon {margin-bottom:20px; border-top:1px solid grey;}
	#basic_info{max-width:fit-content; word-break:keep-all;}
	.title>p{margin:15px;}
	
 } 
 
 
 @media all and (max-width: 1025px) { 
	.title>p{margin:15px;}
	
 } 

* { 
	box-sizing: border-box;
	color: grey;
}

.container{
	font-family: 'DungGeunMo';
	background-color: #03001e;
}
/* background:linear-gradient(#03001e,50%,#7303c0,#ec38bc,#fdeff9);  border:1px solid grey;*/
#logo {
	background-color: #7303c0,;
	text-align:left;
	height:100px;
}
 #titleimg{height:100px;}
 

 
.poster {
	/*height: fit-content;*/

}
.review_box{}

.poster>img {
	max-height:400px;}

.header-title{padding:20px;}

 
.info{overflow:hidden;}


.overview{height:100%;}

#ov_text{
height:100px; 
overflow-y:auto;
 -ms-overflow-style: none;
}

#ov_text::-webkit-scrollbar{
  display:none;
}
  

.ott_icon {
	margin-bottom:25px;
	max-height: 50px;
}

.ott_icon>a>img {
	padding:5px;
}
#rv_title{border:1px solid white;}

#review_textbox {
	height: 200px;
}

#rv_title{border:1px solid white;}

.rv_input {
	width: 90%;
	height:100%;
}


#rv_inputbox {
	width: 100%;
}

.review_blank{margin:50px;}

</style>
<body>
	<div class="container w-xl text-center">
		<div class="row">
			<div class="col-12" id="logo">
				<img src="/img/title.png" id="titleimg">
			</div>
			
		</div>

		<c:choose>
			<c:when test="${not empty mv_detail}">
				<div class="row p-5">
					<div class="poster col-md-3 p-2">
						<img src="${mv_detail.getMv_poster_path()}" class="img-fluid"
							alt="...">
						<!--  <div id="like_icon">
							<i class="bi bi-hand-thumbs-up">${mv_detail.getMv_like()}</i>
						</div>-->
					</div>

					<div class="col-md-9">
						<div class="header-title row">
							<div class="title col-12 col-lg-8">
								<p class="fs-3">${mv_detail.getMv_title()}</p>
							</div>
							
							<div class="ott_icon col-12 col-lg-4">
							
                      <!-- OTT아이콘 출력 -->
                        <c:if test="${mv_detail.getMv_ottNF() eq 'Y'.charAt(0)}">
                           <a href="https://www.netflix.com/kr/"><img src="/img/neticon.png" style="width: 70px; height: 70px;"></a>
                        </c:if>
                        <c:if test="${mv_detail.getMv_ottDZ() eq 'Y'.charAt(0)}">
                           <a href="https://www.disneyplus.com/ko-kr/home"><img src="/img/disicon.png" style="width: 50px; height: 50px;"></a>
                        </c:if>
                        <c:if test="${mv_detail.getMv_ottWV() eq 'Y'.charAt(0)}">
                           <a href="https://www.wavve.com/"><img src="/img/wavicon.png" style="width: 45px; height: 45px;"></a>
                        </c:if>
                        <c:if test="${mv_detail.getMv_ottWC() eq 'Y'.charAt(0)}">
                           <a href="https://watcha.com/"><img src="/img/waticon.png" style="width: 55px; height: 55px;"></a>
                        </c:if>
							</div>

							<div class="info col-12">
							<hr>
							<p id="basic_title">기본정보</p>
							<hr>
								<div id="basic_info">
									<span>장르:</span> <span>${mv_detail.getMv_genre()}</span>
								
									<span>/ 출시년도:</span> <span>${mv_detail.getMv_release_date()}</span>
								
									<span>/ 상영시간:</span> <span>${mv_detail.getMv_runtime()}</span>
								
									<span>/ 평점:</span> <span>${mv_detail.getMv_vote_average()}</span>
								</div>
							</div>
						
							<div class="overview col-12">
							<hr>
								<p id="ov_title">줄거리</p>
								<hr>
								<p id="ov_text">${mv_detail.getMv_overview()}</p>
							</div>
						</div>
		
			</c:when>
			<c:otherwise>
			
				<!-- 드라마 정보 출력 -->
				<div class="row p-5">
					<div class="poster col-sm-3 p-2">
						<img src="${dr_detail.getDr_poster_path()}" class="img-fluid"
							alt="...">
					</div>

					<div class="col-sm-9">
						<div class="header-title row p-2">
							<div class="title col-12 col-sm-8">
								<p class="fs-3">${dr_detail.getDr_title()}</p>
							</div>
							<div class="ott_icon col-12 col-sm-4">

                       <!-- OTT아이콘 출력 -->
                        <c:if test="${dr_detail.getDr_ottNF() eq 'Y'.charAt(0)}">
                           <a href="https://www.netflix.com/kr/"><img src="/img/neticon.png" style="width: 70px; height: 70px;"></a>
                        </c:if>
                        <c:if test="${dr_detail.getDr_ottDZ() eq 'Y'.charAt(0)}">
                           <a href="https://www.disneyplus.com/ko-kr/home"><img src="/img/disicon.png" style="width: 50px; height: 50px;"></a>
                        </c:if>
                        <c:if test="${dr_detail.getDr_ottWV() eq 'Y'.charAt(0)}">
                           <a href="https://www.wavve.com/"><img src="/img/wavicon.png" style="width: 45px; height: 45px;"></a>
                        </c:if>
                        <c:if test="${dr_detail.getDr_ottWC() eq 'Y'.charAt(0)}">
                           <a href="https://watcha.com/"><img src="/img/waticon.png" style="width: 55px; height: 55px;"></a>
                        </c:if>
							</div>
								<hr>
							<div class="info col-12">
							<p id="basic_title">기본정보</p>
							<hr>
								<div id="basic_info">
									<span>장르:</span> <span>${dr_detail.getDr_genre()}</span>
							
									<span>/ 방영날짜:</span> <span>${dr_detail.getDr_first_air_date()}</span>
								
									<span>/ 평점:</span> <span>${dr_detail.getDr_vote_average()}</span>
								</div>
							</div>
							<div class="overview col-12">
									<hr>
								<p id="ov_title">줄거리</p>
									<hr>
								<p id="ov_text">${dr_detail.getDr_overview()}</p>
							</div>
						</div>
			</c:otherwise>
		</c:choose>
			</div>
			
			<div>
         <button id="back">뒤로 가기</button>
 			</div>

     
    
         <script> 
        $("#back").on("click", function(){
        	window.history.back();
        	
        })
        

      </script>
</body>
</html>