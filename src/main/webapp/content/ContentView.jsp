<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<title>콘텐츠 상세 페이지</title>
<style>
*{color:white; border:1px solid black;}

.container-fluid{ background:linear-gradient(#03001e,50%,#7303c0,#ec38bc,#fdeff9); }
#logo{height:230px;}
#poster{max-height: 400px;}
#poster>img{max-height: 400px;}
#ott_icon{max-height: 50px;}
#ott_icon>img{max-height: 50px;}
</style>
<body>
  
    <div class="container-fluid text-center">
      <div class="row"> 
        <div class="col-12" id="logo">
            <img src="">퍼플무드 로고 이미지</div>
        </div>
        <div class="row">
          <div class="colspan col-sm-3" id="poster">
            <img src="아케인_포스터.jpeg" class="img-fluid pt-5" alt="...">
          </div>
          <div class="col-sm-9">
            <div class="row">

              <div class="col-6 col-sm-7">
                <p class="fs-3">아케인(ARCANE)</p>
              </div>
              <div class="col-6 col-sm-5" id="ott_icon">
              <img src="넷플릭스 전체 로고_투명바탕.png" class="img-fluid" alt="...">
              </div>

              <div class="col-12" id="info">
                <p>장르:</p> <p>액션</p>
                <p>출시년도:</p> <p>2021</p> 
                <p>평점(imdb 기준):</p> <p>9.4</p>
              </div>
              <div class="col-12"id="summary">
                <p>줄거리</p> 
                 <p>지상 도시 필트오버와 그 아래의 지하 도시 자운. <br>
                  극심하게 반목하는 두 쌍둥이 도시에서, 두 자매가 서로 반대편에 서서 싸우기에 이른다. 
                  <br> 마법 기술과 신념의 충돌 속에서 전쟁이 시작된다.</p> </div>
              </div>

            </div>
            
          </div>
          <div class="col-12 comment_box">
            <div id="cm_outputbox">
             <div id="comment>좋아요</div>
         <div id=" comment_date">2022년 9월 25일</div> 
         </div>
         <input type="text" id="cm_inputbox" placeholder="감상평을 입력하세요">
         <button id="cm_inputbtn">입력</button>  
         </div>
        </div>
      </div>
</body>
</html>