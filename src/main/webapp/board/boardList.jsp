<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
@font-face {
	font-family: 'NotoSansKR';
	src: url('font/NotoSansKR-Black.otf') format('opentype')
}

@font-face {
	font-family: 'J송명';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/JSongMyung-Regular-KO.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: '교보손글씨';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/KyoboHandwriting2020A.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: '빙그레싸만코체';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/BinggraeSamanco-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: '주아체';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: '한림고딕체';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2204@1.0/HallymGothic-Regular.woff2')
		format('woff2');
	font-weight: 400;
	font-style: normal;
}

@font-face {
	font-family: '둥근모꼴체';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
.boardWrite {
	float: hidden;
}

.boardSearch{
	text-align: center;
}

#boardWriteBtn {
	float: right;
}

#b_content {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body>
	<div style="background-color: gray; height: 150px">HEADER</div>
	<div style="background-color: darkgray; height: 50px">영화/드라마 게시판</div>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성 시간</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${not empty board}">
				<c:forEach var="board" items="${board}">
					<tr>
						<td>${board.b_seq}</td>
						<td><a href="/selectBoardContents.board?b_seq=${board.b_seq}">${board.b_title}</td>
						<td id="b_content">${board.b_content}</td>
						<td>${board.b_writer}</td>
						<td>${board.b_write_date}</td>
						<td>${board.b_view_count}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">출력할 글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<hr>
	<div class="insertBoardContents">
		<a href="/board/insertBoardContents.jsp"><button type="button"
				id="insertBoardContentsBtn">글쓰기</button></a>
	</div>
	<hr>
	<div colspan="5" align="center">${navi }</div>
	<hr>
	<form action="/boardListSearch.board" method="post">
		<div class="boardListSearch">
			<select id="boardSearchOption" name="boardSearchOption">
				<option value="b_title">제목</option>
				<option value="b_writer">작성자</option>
				<option value="b_content">내용</option>
			</select> <input type="text" id="boardSearchWord" name="boardSearchWord">
			<button>검색</button>
		</div>

	</form>
	<hr>
</body>
</html>