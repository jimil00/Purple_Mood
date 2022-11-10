<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
*{ box-sizing:border-box; color:grey;}
.container-fluid{background-color:#03001e;}
/* background:linear-gradient(#03001e,50%,#7303c0,#ec38bc,#fdeff9);  border:1px solid grey;*/
#logo{background-color: #7303c0,; height:150px;}
.poster{height:fit-content;}
.poster>img{max-height: 350px;}
.ott_icon{max-height: 50px;}
.ott_icon>img{max-height: 50px;}
#review_textbox{height:200px;}
.rv_input{width:90%;}
#rv_inputbox{width:100%;}
</style>
<body>
  
    <div class="container-fluid text-center">
      <div class="row"> 
        <div class="col-12" id="logo">
            <img src="">퍼플무드 로고 이미지</div>
        </div>
           <div class="row">
            <div class="poster col-sm-3 p-2">
              <img src="아케인_포스터.jpeg" class="img-fluid" alt="...">
              <div id="like_icon ">
              <i class="bi bi-hand-thumbs-up">12,425(js)</i>
              <!-- <i class="bi bi-hand-thumbs-up-fill">클릭이벤트</i> -->
            </div>
            </div>
    
          <div class="col-sm-9">
        <c:choose>
          <c:when test="${dr_seq == null and mv_seq != null}"> 
            <div class="row">
              <div class="title col-12 col-sm-7">
                <p class="fs-3">${mv_title}아케인(ARCANE)</p>
              </div>
              <div class="ott_icon col-12 col-sm-5">
              <img src="넷플릭스 전체 로고_투명바탕.png" class="img-fluid" alt="...">
              </div>

              <div class="info col-12">
                <div><span>장르:</span> <span>${mv_genre} 판타지, 액션, 어드벤쳐</span></div>
                <div><span>출시년도:</span> <span>${mv_date} 2021</span></div> 
                <div><span>평점(imdb 기준):</span> <span>${mv_score} 9.4</span></div>
              </div>
              <div class="summary col-12">
                <br>
                <p>줄거리</p> 
                 <p>${mv_summary} 지상 도시 필트오버와 그 아래의 지하 도시 자운. <br>
                  극심하게 반목하는 두 쌍둥이 도시에서, 두 자매가 서로 반대편에 서서 싸우기에 이른다. 
                  <br> 마법 기술과 신념의 충돌 속에서 전쟁이 시작된다.</p> </div>
              </div>
           </c:when>
           <c:otherwise>
            <div class="row">

              <div class="title col-12 col-sm-7">
                <p class="fs-3">${dr_title}아케인(ARCANE)</p>
              </div>
              <div class="ott_icon col-12 col-sm-5">
              <img src="넷플릭스 전체 로고_투명바탕.png" class="img-fluid" alt="...">
              </div>

              <div class="info col-12">
                <div><span>장르:</span> <span>${dr_genre} 판타지, 액션, 어드벤쳐</span></div>
                <div><span>출시년도:</span> <span>${dr_date} 2021</span></div> 
                <div><span>평점(imdb 기준):</span> <span>${dr_score} 9.4</span></div>
              </div>
              <div class="summary col-12">
                <br>
                <p>줄거리</p> 
                 <p>${dr_summary}지상 도시 필트오버와 그 아래의 지하 도시 자운. <br>
                  극심하게 반목하는 두 쌍둥이 도시에서, 두 자매가 서로 반대편에 서서 싸우기에 이른다. 
                  <br> 마법 기술과 신념의 충돌 속에서 전쟁이 시작된다.</p> </div>
              </div>
            </div>
           </c:otherwise>
            </c:choose>
            </div>
       
          <div class="col-12 review_box">
            <div id="rv_outputbox">
         <div id="review_textbox">
          <div>감상평 출력될 부분</div>
          <div id="review_text"></div>
          <div id="review_date">2022년 9월 25일</div> 
         </div> 
         
         </div>
         <div id="rv_inputbox">여기가 감상평 입력될 부분 ↓
         <input type="text" class="rv_input" name="rv_input" placeholder="감상평을 입력하세요">
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

        $("#bi").click(function() {
          $("#bi").attr
        })//수정 중
      </script>
</body>
</html>