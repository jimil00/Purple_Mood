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
boardbpx.
.duplCheckContainer{
	width: 100%;
	height: 90vh;
	/*    브라우저의 90퍼센트 */
}

table>* {
	text-align: center;
}

.result {
	height: 70%
}

.duplCheckContainer{overflow: hidden;}
.result{float: left}
</style>

</head>
<body>
	<div class="duplCheckContainer">
		<div>
			조회 결과
		</div>
		<c:choose>
			<c:when test="${result}">
				<div class="result">
					이미 사용 중인 ID 입니다.
				</div>
				<div>
					<button id="close">닫기</button>
					<script>
						$("#close").on("click", function() {
							opener.$("#id").val("");
							window.close();
						})
					</script>
				</div>
			</c:when>
			<c:otherwise>
				<div class="result">
					${id}"<br>사용할 수 있는 ID 입니다.
				</div>
				<tr>
					<div><button id="use">사용</button>
						<button id="cancle">취소</button> <script>
							// 	//parent창에서 idcheck라는 변수를 만들어 opener = window : parent window
							// 	//signup에서 let idcheck하면 지역변수 된다 
							// 	//idcheck->window.idcheck(public같은 것)
							// 	//popup창 window

							$("#use").on("click", function() {
								opener.idCheck = true;
								window.close();
							})
							
							$("#cancle").on("click", function() {
								opener.$("#id").val("");
								window.close();
							})
						</script>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>