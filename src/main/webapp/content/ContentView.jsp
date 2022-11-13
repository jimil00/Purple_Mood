<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>콘텐츠 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<style>
* {
	box-sizing: border-box;
	color: grey;
}

.container-fluid {
	background-color: #03001e;
}
/* background:linear-gradient(#03001e,50%,#7303c0,#ec38bc,#fdeff9);  border:1px solid grey;*/
#logo {
	background-color: #7303c0,;
	height: 150px;
}

.poster {
	height: fit-content;
}

.poster>img {
	max-height: 350px;
}

.ott_icon {
	max-height: 50px;
}

.ott_icon>img {
	max-height: 50px;
}

#review_textbox {
	height: 200px;
}

.rv_input {
	width: 90%;
}

#rv_inputbox {
	width: 100%;
}
</style>
<body>

	<div class="container-fluid text-center">
		<div class="row">
			<div class="col-12" id="logo">
				<img src="">퍼플무드 로고 이미지
			</div>
		</div>

		<c:choose>
			<c:when test="${not empty mv_detail}">
				<div class="row">
					<div class="poster col-sm-3 p-2">
						<img src="${mv_detail.getMv_poster_path()}" class="img-fluid"
							alt="...">
						<div id="like_icon ">
							<i class="bi bi-hand-thumbs-up">${mv_detail.getMv_like()}</i>
							<!-- <i class="bi bi-hand-thumbs-up-fill">클릭이벤트</i> -->
						</div>
					</div>

					<div class="col-sm-9">
						<div class="row">
							<div class="title col-12 col-sm-7">
								<p class="fs-3">${mv_detail.getMv_title()}</p>
							</div>
							<div class="ott_icon col-12 col-sm-5">
								<img src="$" class="img-fluid" alt="...">
							</div>

							<div class="info col-12">
								<div>
									<span>장르:</span> <span>${mv_detail.getMv_genre()}</span>
								</div>
								<div>
									<span>출시년도:</span> <span>${mv_detail.getMv_release_date()}</span>
								</div>
								<div>
									<span>상영시간:</span> <span>${mv_detail.getMv_runtime()}</span>
								</div>
								<div>
									<span>평점:</span> <span>${mv_detail.getMv_vote_average()}</span>
								</div>
							</div>
							<div class="overview col-12">
								<br>
								<p>줄거리</p>
								<p>${mv_detail.getMv_overview()}</p>
							</div>
						</div>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<!-- 드라마 정보 출력 -->
				<div class="row">
					<div class="poster col-sm-3 p-2">
						<img src="${dr_detail.getDr_poster_path()}" class="img-fluid"
							alt="...">
						<div id="like_icon ">
							<i class="bi bi-hand-thumbs-up">${mv_detail.getMv_like()}</i>
							<!-- <i class="bi bi-hand-thumbs-up-fill">클릭이벤트</i> -->
						</div>
					</div>

					<div class="col-sm-9">
						<div class="row">
							<div class="title col-12 col-sm-7">
								<p class="fs-3">${dr_detail.getDr_title()}</p>
							</div>
							<div class="ott_icon col-12 col-sm-5">
								<img src="C:\Users\SOX\Desktop\넷플릭스 전체 로고_투명바탕.png"
									class="otticon img-fluid" alt="...">
							</div>

							<div class="info col-12">
								<div>
									<span>장르:</span> <span>${dr_detail.getDr_genre()}</span>
								</div>
								<div>
									<span>방영날짜:</span> <span>${dr_detail.getDr_first_air_date()}</span>
								</div>
								<div>
									<span>평점:</span> <span>${dr_detail.getDr_vote_average()}</span>
								</div>
							</div>
							<div class="overview col-12">
								<br>
								<p>줄거리</p>
								<p>${dr_detail.getDr_overview()}</p>
							</div>
						</div>
			</c:otherwise>
		</c:choose>

		<!-- </div>
            </div> -->

		<div class="col-12 review_box">
			<div id="rv_outputbox">
				<div id="review_textbox">
					<div>감상평 출력될 부분</div>
					<div id="review_text"></div>
					<div id="review_date">2022년 9월 25일</div>
				</div>

			</div>
			<div id="rv_inputbox">
				여기가 감상평 입력될 부분 ↓
				<input type="text" class="rv_input" name="rv_input"
					placeholder="감상평을 입력하세요">
				<button id="rv_inputbtn">입력</button>
			</div>
		</div>
	</div>
	</div>
	</div>
	<script>
        //댓글 입력시 출력
        $("#rv_inputbtn").on("click", function(){
          let input=$(".rv_input").val();
            let div=$("<div>");
                div.append(input);
            $("#review_text").append(div); 

        })
        
      //ott 아이콘 출력 이벤트
      
        
        
	//좋아요 버튼 이벤트(우선 순위 중하)
        $("#bi").click(function() {
        	
        	//좋아요 예시
        		$.ajax({
        	      url: '/board/like',
        	      type: 'POST',
        	      data: { 'b_number': b_number, 'm_id': m_id },
        	      success: function (data) {
        	          if (data == 1) {
        	              $("#likeimg").attr("src", "/resources/img/좋아요후.png");
        	              location.reload();
        	          } else {
        	              $("#likeimg").attr("src", "/resources/img/좋아요전.png");
        	              location.reload();
        	          }
        	      }, error: function () {
        	          $("#likeimg").attr("src", "/resources/img/좋아요후.png");
        	          console.log('오타 찾으세요')
        	      }

        	  });
       //수정 중
      </script>
</body>
</html>