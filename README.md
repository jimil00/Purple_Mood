# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232249793-c01b8d9a-70cb-40e6-bf7f-587b9d812a93.jpg" width="200" height=""></div><br>퍼플 무드
> 퍼플 무드는 넷플릭스, 디즈니플러스, 왓챠, 웨이브 등 주요 OTT의 콘텐츠를 통합 검색할 수 있으며, 자유로운 커뮤니티의 기능을 가진 웹사이트입니다.

## 개요
> 개발 기간: 2022년 10월 31일~2022년 11월 18일<br>
개발 인원: 5명

## 목차

[1. 개발환경](#개발환경)   
[3. 구현 기능](#구현-기능)   
[4. 담당 역할](#담당-역할)   
[5. 프로젝트 설명](#프로젝트-설명)

## 개발환경

+ **Back-End**
  + JDK 11
  + OracleDB(ojdbc8)
  
+ **Front-End**
  + HTML5
  + CSS
  + JavaScript
  + jQuery
  + JSP
  + Ajax

+ **Web Server & WAS**
  + AWS EC2(Windows)
  + Apache-Tomcat 8.5

+ **Framework & Library**
  + BootStrap
  + Gson
  + Json
  + JSTL

+ **Tools & ETC**
  + Eclipse
  + VSCode
  + SQL Developer
  + GitHub
  + SourceTree
  + GoogleDrive
  + Discord
  + Zoom
  
## 구현 기능

+ **TMDB API를 활용한 크롤링**
  + 영화, 드라마 정보 총 500개 이상 수집

+ **로그인 및 회원가입**
  + 로그인/로그아웃 
  + 회원가입(카카오 우편 API 사용)

+ **메인 페이지** 
  + 인기순, 최신순 콘텐츠 출력 
  + OTT 카테고리 버튼(넷플릭스, 디즈니플러스, 왓챠, 웨이브)
  + 검색창

+ **마이 페이지**
  + 회원 정보 수정
  + 내가 작성한 글, 댓글 출력

+ **OTT별 콘텐츠 페이지**
  + 각 OTT에 해당하는 콘텐츠 출력
  + 제목 검색 시 해당 OTT의 검색 결과 출력

+ **통합 검색 페이지**
  + 제목 검색 시 모든 OTT의 검색 결과 출력

+ **콘텐츠 상세 페이지**
  + 콘텐츠의 제목, 개봉일, 평점, 포스터, 줄거리, 장르, 상영시간 출력
  + 해당 OTT 사이트 이동 버튼

+ **영화/드라마 게시판**
  + 게시글 작성, 출력, 수정, 삭제 
  + Summer Note API를 활용한 이미지 입력, 저장, 출력
  + 게시글 카테고리화
  + 게시판 내 댓글(작성, 출력, 수정, 삭제)
  + 게시글, 댓글 신고 
  
+ **관리자 페이지**
  + 회원 전체 출력 및 삭제 
  + 콘텐츠 전체 출력 및 삭제 
  + 신고된 게시글, 댓글 출력 및 삭제 


## 담당 역할
+ TMDB API를 활용한 콘텐츠 데이터 크롤링
+ 서버 구축 및 DB 관리
+ 회의록 작성
+ [관리자 페이지](#관리자-페이지---담당)


## 프로젝트 설명

### [로그인 및 회원가입]
# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232251978-75993a40-09b4-47a9-876e-19c25599ca37.png" width="" height=""></div>

### [메인 페이지]
# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232252074-e98ee0e7-b5c7-4ffa-822a-9b21e459727e.gif" width="" height=""></div>

### [마이 페이지]
# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232701813-560213fc-7937-4a70-889d-7be3b8c10028.gif" width="" height=""></div>

### [OTT별 콘텐츠 페이지] 
# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232252297-2be05a12-90cb-4efd-b94f-f4cd0ba56c95.png" width="" height=""></div>
# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232252308-42b2db66-4a92-4261-b05d-97f6c77e5afb.png" width="" height=""></div>

### [통합 검색 페이지]
# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232253093-7d12f94f-791a-4353-bb99-543136786e3f.gif" width="" height=""></div>

### [콘텐츠 상세 페이지] 
# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232253063-6445a310-5f2f-4ebb-8656-925a69db736d.png" width="" height=""></div>

### [영화/드라마 게시판] 
# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232700971-4de08621-ed60-4ad7-8886-8154b55f85e3.png" width="" height=""></div>
# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232702409-325d119f-643d-4961-ae83-0a00514ddc69.gif" width="" height=""></div>

### [관리자 페이지] - 담당
# <div align=center><img src="https://user-images.githubusercontent.com/104720372/232703610-a8480f4f-693f-4593-87a9-309435a1baa2.gif" width="" height=""></div>

+ **메뉴 카테고리화**
+ **회원 전체 출력 및 삭제**
+ **콘텐츠 전체 출력 및 삭제**
  + 영화, 드라마별 조회
+ **신고된 게시글과 댓글 출력 및 삭제**
  + 게시글, 댓글별 조회
  + 신고된 게시글 및 댓글 삭제 시 관리자 페이지 내에 관련된 데이터 함께 삭제(같은 게시글 및 댓글에 대한 여러 신고가 접수될 경우, 남아있는 데이터 처리를 위한 기능)
