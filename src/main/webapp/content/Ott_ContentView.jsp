<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    !DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
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
    
    .ott_logo>img{width:200px;}
</style>
<body>
    <div class="container-fluid text-center">
        <div class="header row">
          <div class="logo col-8">퍼플무드 이미지</div>
          <div class="col-4">
            <input type="text" name="net_searchtext">
            <i class="fa-solid fa-magnifying-glass searchboxin" id="searchbtn"></i>
          </div>
        </div>

        <div class="ott_logo col-12">
            <img src="넷플릭스 전체 로고_투명바탕.png">
        </div>
	
	<c:choose>
		<c:when test="${not empty dr_list}">
        <div class="row row-cols-2 row-cols-md-6 g-4 m-auto p-3">
            <c:set var="i" value="0" />
            <c:set var="j" value="1" />
            <c:forEach var="d" items="${dr_list}">			
                      <c:if test="${i%j == 0 }">
              <div class="col">
              </c:if>
      
                <div class="card">
                  <a href="/detailDr.content?dr_id=${d.dr_id}">
                  
                  <div class="poster">  
                    <img src="${d.dr_poster_path}" class="card-img-top" alt="...">
                  </div>
                      <p class="card-text">${d.dr_title}</p>
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