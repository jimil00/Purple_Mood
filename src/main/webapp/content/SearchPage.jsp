<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 메인 페이지</title>
 <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  </head>
<style>
    .container{border:1px solid black; margin:auto;}
    #header{height:100px;}
    .list_title{padding:10px;}
    .searchbar{background-color: grey;}
    #searchtext{width:100%};
    #searchbtn{width:100%};
    #logo{color: white;}
    div>img{width:200px; height:280px;}
    span>img{width:45px; position:relative; bottom:60%; left:80%;}
</style>
<script>
  $("#searchbtn").on("click",function(){
  //  jsp 연결해서 디비에서 값 출력해야함.
    let searchrword=$("#searchinput").value;
  
  })
</script>
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
            <input type="text" id="searchtext" name="searchtext"  placeholder="검색어를 입력해주세요.">
          </div>
          <div class="col-2 col-md-2 col-lg-1">
      		<button class="col" id="searchbtn">검색</button>
          </div>

  </form>
<!--검색 결과 출력-->  
        <c:choose>
          <c:when test="${not empty mv_list}">
                <div class="row" id="movie_bar">
                <hr> <div class="list_title pt-2">영화 리스트</div><hr>
                     <c:forEach var="m" items="${mv_list}">
                 <div class="row">
                 <div class="mv_search col-6 col-sm-4 col-md-2"><input type="hidden" name="mv_seq" value=${mv_seq}><img src="${m.mv_img}"><p>${m.mv_title}</p></div>
                 <div class="mv_search col-6 col-sm-4 col-md-2"><img src="${m.mv_img}"><p>${m.mv_title}</p></div>
                 <div class="mv_search col-6 col-sm-4 col-md-2"><img src="${m.mv_img}"><p>${m.mv_title}</p></div>
                 <div class="mv_search col-6 col-sm-4 col-md-2"><img src="${m.mv_img}"><p>${m.mv_title}</p></div>
                 <div class="mv_search col-6 col-sm-4 col-md-2"><img src="${m.mv_img}"><p>${m.mv_title}</p></div>
                 <div class="mv_search col-6 col-sm-4 col-md-2"><img src="${m.mv_img}"><p>${m.mv_title}</p></div>
                 </div>
               </div>
           	</c:forEach>
          </c:when>
          <c:otherwise>
           <hr> <div class="list_title pt-2">영화 리스트</div><hr>
            <div>검색 결과가 없습니다.</div>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${not empty dr_list}">  
            <c:forEach var="d" items="dr_list">
              <div class="row" id="drama_bar">
                  <hr> <div class="list_title">드라마</div><hr>
                 <div class="row">
                 <div class="col-6 col-sm-4 col-md-2"><img src="">드라마 포스터 출력 예정</div>
                 <div class="col-6 col-sm-4 col-md-2"><img src="">드라마 포스터 출력 예정</div>
                 <div class="col-6 col-sm-4 col-md-2"><img src="">드라마 포스터 출력 예정</div>
                 <div class="col-6 col-sm-4 col-md-2"><img src="">드라마 포스터 출력 예정</div>
                 <div class="col-6 col-sm-4 col-md-2"><img src="">드라마 포스터 출력 예정</div>
                 <div class="col-6 col-sm-4 col-md-2"><img src="">드라마 포스터 출력 예정</div>
                 </div>
               </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
          <hr> <div class="list_title">드라마</div><hr>
            <div>검색 결과가 없습니다.</div>
          </c:otherwise>
        </c:choose>
</div>
</body>
</html>