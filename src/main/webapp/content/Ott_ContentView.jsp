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
@font-face {
	font-family: 'DungGeunMo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
    .container-fluid {
	font-family: 'DungGeunMo';
	color: grey;
	background-color: #03001e;
}
    .header{}

    .logo{text-align:left;height:100px;}
    #titleimg{height:100px;}
    
    .ott_logo>a>img{width:250px;margin:30px;}
    
    .postimg {width:200px;}
    
    .list_title{font-weight: bold;}
    
    
    
</style>
<body>
    <div class="container-fluid text-center">
    
	<!-- ott별로 출력하는 페이지 -->

	<c:choose>
		<c:when test="${not empty dr_date_n and not empty mv_date_n}">
		
	<form action="/n_search.content">
        <div class="header row">
         <div class="logo col-9"><a href="/main"><img src="/img/title.png" id="titleimg"></a></div>
          <div class="col-3">
            <input type="text" name="n_searchtext" placeholder="넷플릭스 내 검색">
            <i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i>
          </div>
        </div>
        </form>
        
        <div class="ott_logo col-12">
           <a href="/netflix.content"><img src="/img/netbf.png"></a>
        </div>
        <hr>
        </c:when>
        </c:choose>
        
         <c:choose>
		<c:when test="${not empty mv_date_n}">
		

					<div class="list_title pt-2">
						영화<!-- <span> ${mv_date_n.size()}개</span>-->
					</div>
				<hr>
				
<!-- 영화 캐러셀 --> 
 <div class="poster1">
 <div class="col-12 fs-3 titlename">최신작</div>
  <hr>
          <div>
            <div id="carouselExampleControls1" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                 <c:forEach var="m" items="${mv_date_n}" begin="0" end="5"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_date_n}"  begin="6" end="11"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_date_n}"  begin="12" end="17"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
              </div>
          	<button class="carousel-control-prev postLRbtn" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
			</button>
				<button class="carousel-control-next postLRbtn" type="button"
					data-bs-target="#carouselExampleControls1" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden ">Next</span>
				</button>
            </div>
          </div>
        </div>       
      
         <div class="poster2">  
         <hr>
 <div class="col-12 fs-3 titlename">인기순</div>
   	<hr>
          <div>
            <div id="carouselExampleControls2" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                 <c:forEach var="m" items="${mv_avg_n}" begin="0" end="5"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_avg_n}"  begin="6" end="11"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_avg_n}"  begin="12" end="17"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
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
       
      </c:when>
        </c:choose>

	<!-- 드라마 리스트 -->	
	<c:choose>
		<c:when test="${not empty dr_date_n}">

	<hr>
		<div class="list_title">
					드라마<!-- <span> ${dr_date_n.size()}개</span>-->
				</div>
		<hr>
		
		    <!-- 드라마 캐러셀 --> 
		<div class="poster3">
		<div class="col-12 fs-3 titlename">최신작</div>
		  <hr>
          <div>
            <div id="carouselExampleControls3" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                  <c:forEach var="d" items="${dr_date_n}" begin="0" end="5"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_date_n}"  begin="6" end="11"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_date_n}"  begin="12" end="17"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
              </div>
              <button class="carousel-control-prev postLRbtn" type="button"
                data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next postLRbtn" type="button"
                data-bs-target="#carouselExampleControls3" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden ">Next</span>
              </button>
            </div>
          </div>
        </div>
        
         <div class="poster4">
           <hr>
		<div class="col-12 fs-3 titlename">인기순</div>
		  <hr>
          <div>
            <div id="carouselExampleControls4" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                  <c:forEach var="d" items="${dr_avg_n}" begin="0" end="5"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_avg_n}"  begin="6" end="11"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_avg_n}"  begin="12" end="17"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
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
  
        </c:when>
        </c:choose>
        
       

<!-- 디즈니 플러스 -->
		<c:choose>
		<c:when test="${not empty dr_date_d and not empty mv_date_d}">
		
		<form action="/d_search.content">
        	<div class="header row">
         	 <div class="logo col-8"><a href="/main"><img src="/img/title.png" id="titleimg"></a></div>
          	<div class="col-4">
            	<input type="text" name="d_searchtext" placeholder="디즈니플러스 내 검색">
            	<i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i>
          	</div>
        </div>
        </form>
        
           <div class="ott_logo col-12">
            <a href="/disney.content"><img src="/img/disbf.png"></a>
        </div>
        <hr>
        
        </c:when>
        </c:choose>
        
  <c:choose>
		<c:when test="${not empty mv_date_d}">

					<div class="list_title pt-2">
						영화 <!-- <span> ${mv_date_d.size()}개</span>-->
					</div>
				<hr>
				
				 <div class="poster1">
 <div class="col-12 fs-3 titlename">최신작</div>
   <hr>
          <div>
            <div id="carouselExampleControls1" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                 <c:forEach var="m" items="${mv_date_d}" begin="0" end="5"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_date_d}"  begin="6" end="11"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_date_d}"  begin="12" end="17"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
              </div>
          	<button class="carousel-control-prev postLRbtn" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
			</button>
				<button class="carousel-control-next postLRbtn" type="button"
					data-bs-target="#carouselExampleControls1" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden ">Next</span>
				</button>
            </div>
          </div>
        </div>  
         </c:when>
        </c:choose>     
        
        <c:choose>
		<c:when test="${not empty mv_avg_d}">
         <div class="poster2">
           <hr>
 <div class="col-12 fs-3 titlename">인기순</div>
   			<hr>
          <div>
            <div id="carouselExampleControls2" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                 <c:forEach var="m" items="${mv_avg_d}" begin="0" end="5"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_avg_d}"  begin="6" end="11"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_avg_d}"  begin="12" end="17"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
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
       
      </c:when>
        </c:choose>


	
       <!-- 드라마 리스트 -->	
	<c:choose>	
		<c:when test="${not empty dr_date_d}">
		<hr>
		<div class="list_title">
					드라마<!--  <span> ${dr_date_d.size()}개</span>-->
				</div>
		<hr>
		
		    <!-- 드라마 캐러셀 --> 
		<div class="poster3">
		<div class="col-12 fs-3 titlename">최신작</div>
		  <hr>
          <div>
            <div id="carouselExampleControls3" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                  <c:forEach var="d" items="${dr_date_d}" begin="0" end="5"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_date_d}"  begin="6" end="11"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_date_d}"  begin="12" end="17"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
              </div>
              <button class="carousel-control-prev postLRbtn" type="button"
                data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next postLRbtn" type="button"
                data-bs-target="#carouselExampleControls3" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden ">Next</span>
              </button>
            </div>
          </div>
        </div>
        
         <div class="poster54">
           <hr>
		<div class="col-12 fs-3 titlename">인기순</div>
		  <hr>
          <div>
            <div id="carouselExampleControls4" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                  <c:forEach var="d" items="${dr_avg_d}" begin="0" end="5"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_avg_d}"  begin="6" end="11"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_avg_d}"  begin="12" end="17"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
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
  
        </c:when>
        </c:choose>
          

<!-- 웨이브 -->

	<c:choose>
		<c:when test="${not empty dr_date_wv and not empty mv_date_wv}">
		
		<form action="/wv_search.content">
        	<div class="header row">
         	 <div class="logo col-8"><a href="/main"><img src="/img/title.png" id="titleimg"></a></div>
          	<div class="col-4">
            	<input type="text" name="wv_searchtext" placeholder="웨이브 내 검색">
            	<i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i>
          	</div>
        </div>
        </form>
           <div class="ott_logo col-12">
            <a href="/wavve.content"><img src="/img/wavbf.png"></a>
        </div>
        <hr>
        </c:when>
        </c:choose>
        
           <c:choose>
		<c:when test="${not empty mv_date_wv}">

					<div class="list_title pt-2">
						영화<!--  <span> ${mv_date_wv.size()}개</span>-->
					</div>
				<hr>
				
            <div class="poster1">
 <div class="col-12 fs-3 titlename">최신작</div>
   	<hr>
          <div>
            <div id="carouselExampleControls1" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                 <c:forEach var="m" items="${mv_date_wv}" begin="0" end="5"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_date_wv}"  begin="6" end="11"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_date_wv}"  begin="12" end="17"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
              </div>
          	<button class="carousel-control-prev postLRbtn" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
			</button>
				<button class="carousel-control-next postLRbtn" type="button"
					data-bs-target="#carouselExampleControls1" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden ">Next</span>
				</button>
            </div>
          </div>
        </div>      
        </c:when>
        </c:choose>  
        
          <c:choose>
		<c:when test="${not empty mv_avg_wv}">
         <div class="poster2">
           <hr>
 <div class="col-12 fs-3 titlename">인기순</div>
          <hr>
          <div>
            <div id="carouselExampleControls2" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                 <c:forEach var="m" items="${mv_avg_wv}" begin="0" end="5"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_avg_wv}"  begin="6" end="11"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_avg_wv}"  begin="12" end="17"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id}"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
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
       
      </c:when>
        </c:choose>
        
         <c:choose>
		<c:when test="${not empty dr_date_wv}">
		<hr>
		<div class="list_title">
					드라마<!--  <span> ${dr_date_wv.size()}개</span>-->
				</div>
		<hr>
		
       	<div class="poster3">
		<div class="col-12 fs-3 titlename">최신작</div>
		  <hr>
          <div>
            <div id="carouselExampleControls3" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                  <c:forEach var="d" items="${dr_date_wv}" begin="0" end="5"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_date_wv}"  begin="6" end="11"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_date_wv}"  begin="12" end="17"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
              </div>
              <button class="carousel-control-prev postLRbtn" type="button"
                data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next postLRbtn" type="button"
                data-bs-target="#carouselExampleControls3" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden ">Next</span>
              </button>
            </div>
          </div>
        </div>
        
         <div class="poster4">
           <hr>
		<div class="col-12 fs-3 titlename">인기순</div>
		  <hr>
          <div>
            <div id="carouselExampleControls4" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                  <c:forEach var="d" items="${dr_avg_wv}" begin="0" end="5"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_avg_wv}"  begin="6" end="11"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_avg_wv}"  begin="12" end="17"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
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
  
        </c:when>
        </c:choose>

        
<!-- 왓챠 -->
		<c:choose>
		<c:when test="${not empty dr_date_wc and not empty mv_date_wc}">
		
	<form action="/wc_search.content">
        <div class="header row">
          <div class="logo col-8"><a href="/main"><img src="/img/title.png" id="titleimg"></a></div>
          <div class="col-4">
            <input type="text" name="wc_searchtext" placeholder="왓챠 내 검색">
            <i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i>
          </div>
        </div>
        </form>    
        
        <div class="ott_logo col-12">
            <a href="/watcha.content"><img src="/img/watbf.png"></a>
        </div>
        <hr>
        </c:when>
        </c:choose>
        
        <c:choose>
		<c:when test="${not empty mv_date_wc}">

					<div class="list_title pt-2">
						영화<!-- <span> ${mv_date_wc.size()}개</span>-->
					</div>
				<hr>
				
             <div class="poster1">
 <div class="col-12 fs-3 titlename">최신작</div>
   <hr>
          <div>
            <div id="carouselExampleControls1" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                 <c:forEach var="m" items="${mv_date_wc}" begin="0" end="5"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_date_wc}"  begin="6" end="11"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_date_wc}"  begin="12" end="17"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
              </div>
          	<button class="carousel-control-prev postLRbtn" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
			</button>
				<button class="carousel-control-next postLRbtn" type="button"
					data-bs-target="#carouselExampleControls1" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden ">Next</span>
				</button>
            </div>
          </div>
        </div>       
        
         <div class="poster2">
           <hr>
 <div class="col-12 fs-3 titlename">인기순</div>
   			<hr>
          <div>
            <div id="carouselExampleControls2" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                 <c:forEach var="m" items="${mv_avg_wc}" begin="0" end="5"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_avg_wc}"  begin="6" end="11"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="m" items="${mv_avg_wc}"  begin="12" end="17"
                        step="1">
                        <a href="/detailMv.content?mv_id=${m.mv_id }"><img src="${m.mv_poster_path}" class="postimg"></a>
                      </c:forEach>
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
       
      </c:when>
        </c:choose>
        
        <c:choose>
		<c:when test="${not empty dr_date_wc}">
    <hr>
		<div class="list_title">
					드라마<!-- <span> ${dr_date_wc.size()}개</span>-->
				</div>
		<hr>
		
      	<div class="poster3">
		<div class="col-12 fs-3 titlename">최신작</div>
		  <hr>
          <div>
            <div id="carouselExampleControls3" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                  <c:forEach var="d" items="${dr_date_wc}" begin="0" end="5"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_date_wc}"  begin="6" end="11"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_date_wc}"  begin="12" end="17"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
              </div>
              <button class="carousel-control-prev postLRbtn" type="button"
                data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next postLRbtn" type="button"
                data-bs-target="#carouselExampleControls3" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden ">Next</span>
              </button>
            </div>
          </div>
        </div>
        
         <div class="poster4">
           <hr>
		<div class="col-12 fs-3 titlename">인기순</div>
		  <hr>
          <div>
            <div id="carouselExampleControls4" class="carousel slide"
              data-bs-ride="false">
              <div class="carousel-inner">
                <div class="carousel-item imgbox active">
                  <c:forEach var="d" items="${dr_avg_wc}" begin="0" end="5"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_avg_wc}"  begin="6" end="11"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
                      </c:forEach>
                </div>
                <div class="carousel-item imgbox">
                  <c:forEach var="d" items="${dr_avg_wc}"  begin="12" end="17"
                        step="1">
                        <a href="/detailDr.content?dr_id=${d.dr_id }"><img src="${d.dr_poster_path}" class="postimg"></a>
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
  
        </c:when>
        </c:choose>

         </div>
      </div>
</body>
</html>