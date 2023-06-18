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
 
+ **API**
  + 카카오 우편
  + Summer Note
  + TMDB

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

+ **TMDB API를 활용한 콘텐츠 데이터 크롤링**
  + 영화, 드라마 정보 총 500개 이상 수집 및 저장

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
+ [TMDB API를 활용한 콘텐츠 데이터 크롤링](#TMDB-API를-활용한-콘텐츠-데이터-크롤링---담당)
+ 서버 구축 및 DB 관리
+ 회의록 작성
+ [관리자 페이지](#관리자-페이지---담당)


## 프로젝트 설명

### [TMDB API를 활용한 콘텐츠 데이터 크롤링] - 담당

```
package contentsData;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class MovieNetflix_1 {
	public static void main(String[] args) {

		// 파싱한 데이터를 저장할 변수 (첫번째 파싱)
		String firstParsing = "";

		try {

			for(int pageCount=1; pageCount<=10; pageCount++) {

				URL firstURL = new URL("https://api.themoviedb.org/3/discover/movie?api_key=4b5fa5612cda62f4af304556025d6fc5&language=ko&region=KR&sort_by=popularity.desc&include_adult=ture&include_video=false&page="+pageCount+"&with_watch_providers=8&watch_region=KR&with_watch_monetization_types=flatrate");
				BufferedReader bf1;
				bf1 = new BufferedReader(new InputStreamReader(firstURL.openStream(), "UTF-8"));
				firstParsing = bf1.readLine();

				JSONParser jsonParser = new JSONParser();
				JSONObject firstAllData = (JSONObject)jsonParser.parse(firstParsing);
				System.out.println(firstAllData); // 첫번째 파싱 전체 데이터 출력

				JSONArray resultsList = (JSONArray) firstAllData.get("results"); // 첫번째 파싱 전체 데이터의 results 배열 추출
				System.out.println(resultsList.size()); // results 배열의 size 출력

				// 추출한 데이터를 저장할 배열 생성
				ArrayList <String> id = new ArrayList<>(); 
				ArrayList <String> title = new ArrayList<>(); 
				ArrayList <String> release_date = new ArrayList<>(); 
				ArrayList <String> vote_average = new ArrayList<>(); 
				ArrayList <String> poster_path = new ArrayList<>(); 
				ArrayList <String> overview = new ArrayList<>(); 

				// results 배열에서 원하는 데이터 각 list에 저장
				for(int i=0; i<resultsList.size(); i++) {

					JSONObject contents = (JSONObject) resultsList.get(i);

					id.add(contents.get("id").toString());
					title.add(contents.get("title").toString());
					release_date.add(contents.get("release_date").toString());
					vote_average.add(contents.get("vote_average").toString());
					poster_path.add("https://www.themoviedb.org/t/p/original" + contents.get("poster_path").toString());
					overview.add(contents.get("overview").toString());

				}

				// 파싱한 데이터를 저장할 변수 (두번째 파싱)
				String secondParsing = "";

				// 추출한 데이터를 저장할 배열 생성
				List <String> genre= new ArrayList<>(); 
				List <Object> runtime= new ArrayList<>(); 

				for(int j=0; j<resultsList.size(); j++) {

					URL secondURL = new URL("https://api.themoviedb.org/3/movie/"+id.get(j)+"?api_key=4b5fa5612cda62f4af304556025d6fc5&language=ko");
					BufferedReader bf2;
					bf2 = new BufferedReader(new InputStreamReader(secondURL.openStream(), "UTF-8"));
					secondParsing = bf2.readLine();

					JSONParser jsonParser2 = new JSONParser();
					JSONObject secondAllData = (JSONObject)jsonParser2.parse(secondParsing);

					JSONArray genresList = (JSONArray) secondAllData.get("genres"); // 두번째 파싱 전체 데이터의 genres 배열 추출
					JSONObject genres = (JSONObject) genresList.get(0); // genres 배열 중 제일 첫번째 값만 담기
					genre.add(genres.get("name").toString()); // 제일 첫번째 값의 name값만 담기

					Object runtimeObject = secondAllData.get("runtime"); // 두번째 파싱 전체 데이터의 runtime 객체 추출
					runtime.add(runtimeObject); // 추출한 runtime 데이터 배열에 담기
				}

				// DB 접속
				Class.forName("oracle.jdbc.driver.OracleDriver"); 

				String dbURL = "jdbc:oracle:thin:@localhost:1521:xe"; 
				String dbID = "pm";
				String dbPW = "pm";
				Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);

				String sql = "insert into movie values(?,?,?,?,?,?,'Y',DEFAULT,DEFAULT,DEFAULT,DEFAULT,?,?)";

				for (int k=0 ; k<resultsList.size(); k++) {
					PreparedStatement pstat = con.prepareStatement(sql);
					pstat.setString(1, id.get(k));
					pstat.setString(2, title.get(k));
					pstat.setString(3, genre.get(k));
					pstat.setString(4, release_date.get(k));
					pstat.setString(5, vote_average.get(k));
					pstat.setObject(6, runtime.get(k) + "분");
					pstat.setString(7, poster_path.get(k));
					pstat.setString(8, overview.get(k));

					int result = pstat.executeUpdate();

					if(result > 0 ) {
						System.out.println("입력 성공");
					}else {
						System.out.println("입력 실패");
					}

				}
				con.commit();
				con.close();

			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

```
+ **영화, 드라마 정보 총 500개 이상 수집 및 저장**
  
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
