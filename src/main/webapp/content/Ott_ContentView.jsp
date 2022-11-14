<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
</head>
<style>
    .container-fluid {
	font-family: 'DungGeunMo';
	color: grey;
	background-color: #03001e;
}
    .header{height:150px;}

    .logo{height:100px;}
    
    .ott_logo>img{width:250px;}
    
    .postimg {width:200px;}
    
    .list_title{text-align:left;}
    
</style>
<body>
    <div class="container-fluid text-center">
     <form action="/ott_search.content">
        <div class="header row">
          <div class="logo col-8">퍼플무드 이미지</div>
          <div class="col-4">
            <input type="text" name="ott_searchtext" placeholder="해당 Ott내 검색">
            <i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i>
          </div>
        </div>
        </form>
	
	<!-- ott별로 출력하는 페이지 -->
	<c:choose>
		<c:when test="${not empty dr_date_n}">
		
        <div class="ott_logo col-12">
            <img src="/img/netbf.png">
        </div>
        <hr>
		<div class="list_title">
					드라마 검색 결과<span> ${dr_date_n.size()}개</span>
				</div>
		<hr>
		    <!-- 드라마 캐러셀 --> 
		<div class="poster1">
          <div>
            <div id="carouselExampleControls" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                  <c:forEach var="d" items="${dr_date_n}" begin="0" end="5"
                        step="1">
                        <a href="#"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_date_n}"  begin="6" end="11"
                        step="1">
                        <a href="#"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_date_n}"  begin="12" end="17"
                        step="1">
                        <a href="#"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
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
		
		
		
		
       <!--  <div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
            <c:set var="i" value="0" />
            <c:set var="j" value="1" />
            <c:forEach var="d" items="${dr_date_n}">			
                      <c:if test="${i%j == 0 }">
              <div class="col">
              </c:if>
      
                <div class="card">
                  <a href="/detailDr.content?dr_id=${d.dr_id}">
                  
                  <div class="poster">  
                    <img src="${d.dr_poster_path}" class="card-img-top" alt="...">
                  </div>
                  </a>
                </div>
                <c:if test="${i%j == j-1 }">
              </div>
              </c:if>
              <c:set var="i" value="${i+1 }" />
            </c:forEach>
             </div>
            
                </c:when>
          </c:choose>--> 
          
    
          
          
         
       <c:choose>
		<c:when test="${not empty mv_date_n}">
             	<hr>
					<div class="list_title pt-2">
						영화 검색 결과 <span> ${mv_date_n.size()}개</span>
					</div>
				<hr>
				
<!-- 영화 캐러셀 --> 
 <div class="poster1">
          <div>
            <div id="carouselExampleControls" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                 <c:forEach var="m" items="${mv_date_n}" begin="0" end="5"
                        step="1">
                        <a href="#"><img src="${m.mv_poster_path}"class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_date_n}"  begin="6" end="11"
                        step="1">
                        <a href="#"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_date_n}"  begin="12" end="17"
                        step="1">
                        <a href="#"><img src="${m.mv_poster_path}"class="postimg"></a>
                      </c:forEach>
                </div>
              </div>
          	<button class="carousel-control-prev postLRbtn" type="button"
				data-bs-target="#carouselExampleControls4" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
			</button>
				<button class="carousel-control-next postLRbtn" type="button"
					data-bs-target="#carouselExampleControls4" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden ">Next</span>
				</button>
            </div>
          </div>
        </div>         
				
				
         <!-- <div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
            <c:set var="i" value="0" />
            <c:set var="j" value="1" />
            <c:forEach var="m" items="${mv_date_n}">			
                      <c:if test="${i%j == 0 }">
              <div class="col">
              </c:if>
      
                <div class="card">
                  <a href="/detailMv.content?mv_id=${m.mv_id}">
                  
                  <div class="poster">  
                    <img src="${m.mv_poster_path}" class="card-img-top" alt="...">
                  </div>
                  </a>
                </div>
                <c:if test="${i%j == j-1 }">
              </div>
              </c:if>
              <c:set var="i" value="${i+1 }" />
            </c:forEach>
            </div>
            </div>
          </c:when>
          </c:choose> --> 

<!-- 디즈니 플러스 -->
	<c:choose>
		<c:when test="${not empty dr_date_d}">
		
        <div class="ott_logo col-12">
            <img src="/img/disbf.png">
        </div>
        <hr>
		<div class="list_title">
					드라마 검색 결과<span> ${dr_date_d.size()}개</span>
				</div>
		<hr>
        <div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
            <c:set var="i" value="0" />
            <c:set var="j" value="1" />
            <c:forEach var="d" items="${dr_date_d}">			
                      <c:if test="${i%j == 0 }">
              <div class="col">
              </c:if>
      
                <div class="card">
                  <a href="/detailDr.content?dr_id=${d.dr_id}">
                  
                  <div class="poster">  
                    <img src="${d.dr_poster_path}" class="card-img-top" alt="...">
                  </div>
                  </a>
                </div>
                <c:if test="${i%j == j-1 }">
              </div>
              </c:if>
              <c:set var="i" value="${i+1 }" />
            </c:forEach>
             </div>
            
                </c:when>
          </c:choose>
          
         <c:choose>
		<c:when test="${not empty mv_date_d}">
             	<hr>
					<div class="list_title pt-2">
						영화 검색 결과 <span> ${mv_date_d.size()}개</span>
					</div>
				<hr>
             <div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
            <c:set var="i" value="0" />
            <c:set var="j" value="1" />
            <c:forEach var="m" items="${mv_date_d}">			
                      <c:if test="${i%j == 0 }">
              <div class="col">
              </c:if>
      
                <div class="card">
                  <a href="/detailMv.content?mv_id=${m.mv_id}">
                  
                  <div class="poster">  
                    <img src="${m.mv_poster_path}" class="card-img-top" alt="...">
                  </div>
                  </a>
                </div>
                <c:if test="${i%j == j-1 }">
              </div>
              </c:if>
              <c:set var="i" value="${i+1 }" />
            </c:forEach>
            </div>
            </div>
          </c:when>
          </c:choose>

<!-- 웨이브 -->
         <c:choose>
		<c:when test="${not empty dr_date_wv}">
		
        <div class="ott_logo col-12">
            <img src="/img/wavbf.png">
        </div>
        <hr>
		<div class="list_title">
					드라마 검색 결과<span> ${dr_date_wv.size()}개</span>
				</div>
		<hr>
        <div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
            <c:set var="i" value="0" />
            <c:set var="j" value="1" />
            <c:forEach var="d" items="${dr_date_wv}">			
                      <c:if test="${i%j == 0 }">
              <div class="col">
              </c:if>
      
                <div class="card">
                  <a href="/detailDr.content?dr_id=${d.dr_id}">
                  
                  <div class="poster">  
                    <img src="${d.dr_poster_path}" class="card-img-top" alt="...">
                  </div>
                  </a>
                </div>
                <c:if test="${i%j == j-1 }">
              </div>
              </c:if>
              <c:set var="i" value="${i+1 }" />
            </c:forEach>
             </div>
            
                </c:when>
          </c:choose>
          
         <c:choose>
		<c:when test="${not empty mv_date_wv}">
             	<hr>
					<div class="list_title pt-2">
						영화 검색 결과 <span> ${mv_date_wv.size()}개</span>
					</div>
				<hr>
             <div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
            <c:set var="i" value="0" />
            <c:set var="j" value="1" />
            <c:forEach var="m" items="${mv_date_wv}">			
                      <c:if test="${i%j == 0 }">
              <div class="col">
              </c:if>
      
                <div class="card">
                    <a href="/detailMv.content?mv_id=${m.mv_id}">
                  
                  <div class="poster">  
                    <img src="${m.mv_poster_path}" class="card-img-top" alt="...">
                  </div>
                  </a>
                </div>
                <c:if test="${i%j == j-1 }">
              </div>
              </c:if>
              <c:set var="i" value="${i+1 }" />
            </c:forEach>
            </div>
            </div>
          </c:when>
          </c:choose>
          
<!-- 왓챠 -->
 	<c:choose>
		<c:when test="${not empty dr_date_wc}">
		
        <div class="ott_logo col-12">
            <img src="/img/watbf.png">
        </div>
        <hr>
		<div class="list_title">
					드라마 검색 결과<span> ${dr_date_wc.size()}개</span>
				</div>
		<hr>
        <div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
            <c:set var="i" value="0" />
            <c:set var="j" value="1" />
            <c:forEach var="d" items="${dr_date_wc}">			
                      <c:if test="${i%j == 0 }">
              <div class="col">
              </c:if>
      
                <div class="card">
                  <a href="/detailDr.content?dr_id=${d.dr_id}">
                  
                  <div class="poster">  
                    <img src="${d.dr_poster_path}" class="card-img-top" alt="...">
                  </div>
                  </a>
                </div>
                <c:if test="${i%j == j-1 }">
              </div>
              </c:if>
              <c:set var="i" value="${i+1 }" />
            </c:forEach>
             </div>
            
                </c:when>
          </c:choose>
          
         <c:choose>
		<c:when test="${not empty mv_date_wc}">
             	<hr>
					<div class="list_title pt-2">
						영화 검색 결과 <span> ${mv_date_wc.size()}개</span>
					</div>
				<hr>
             <div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
            <c:set var="i" value="0" />
            <c:set var="j" value="1" />
            <c:forEach var="m" items="${mv_date_wc}">			
                      <c:if test="${i%j == 0 }">
              <div class="col">
              </c:if>
      
                <div class="card">
         			<a href="/detailMv.content?mv_id=${m.mv_id}">
                  
                  <div class="poster">  
                    <img src="${m.mv_poster_path}" class="card-img-top" alt="...">
                  </div>
                  </a>
                </div>
                <c:if test="${i%j == j-1 }">
              </div>
              </c:if>
              <c:set var="i" value="${i+1 }" />
            </c:forEach>
            </div>
            </div>
          </c:when>
          </c:choose>


      </div>
</body>
</html>