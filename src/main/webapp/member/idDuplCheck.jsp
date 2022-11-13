<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
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
</style>
</head>
<body>
	<table border=1>
		<tr>
			<th>조회 결과
		</tr>
		<c:choose>
			<c:when test="${result}">
				<tr>
					<td class="result">이미 사용 중인 ID 입니다.
				</tr>
				<tr>
					<td>
						<button id="close">닫기</button>
						<script>
							document.getElementById("close").onclick = function() {
								opener.document.getElementById("id").value = "";
								window.close();
							}
						</script>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td class="result">
						"${id}"<br>사용할 수 있는 ID 입니다.
				</tr>
				<tr>
					<td>
						<button id="use">사용</button>
						<button id="cancel">취소</button>
						<script>
							document.getElementById("use").onclick = function() {
								opener.idCheck = true;
								//                         parent창에서 idcheck라는 변수를 만들어 opener = window : parent window
								//                         signup에서 let idcheck하면 지역변수 된다 
								//                         idcheck->window.idcheck(public같은 것)
								window.close();
								//                         popup창 window
							}
							document.getElementById("cancel").onclick = function() {
								//                   팝업창에서 상위 브라우저 주소를 가지고 있다.
								opener.document.getElementById("id").value = "";
								window.close();
							}
						</script>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>