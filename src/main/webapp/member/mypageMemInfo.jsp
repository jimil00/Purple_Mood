<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
* {
	box-sizing: border-box;
}

/*    div {border: 1px solid black;} */
.mypage {
	width: 700px;
	margin: auto;
}

.body>div {
	width: 100%;
	overflow: hidden;
}

.body>div>* {
	float: left;
}

.body>div>.subject {
	text-align: right;
	width: 20%;
	margin-right: 10px
}

input {
	width: 250px;
}

.header {
	text-align: center;
}

.footer {
	margin-top: 10px;
	text-align: center;
}

.btn {
	width: 100px;
	height: 30px;
}
</style>
<script>
	$(function() {
		//    window.onload와 같다
		$("#modify").on("click", function() {
			$("input").removeAttr("readonly");

			$("#toHome,#modify").css("display", "none");
			let btnModify = $("<button>");
			btnModify.text("수정완료");
			btnModify.addClass("btn")
			btnModify.css("margin-right", "5px")

			let btnCancel = $("<button>");
			btnCancel.attr("type", "button");
			btnCancel.text("취소");
			btnCancel.addClass("btn")
			btnCancel.on("click", function() {
				location.reload();
			});

			$("#btns").append(btnModify);
			$("#btns").append(btnCancel);

		})
	})
</script>
</head>
<body>
	<form action="/updateMemInfo.member" method="post">
		<div class="mypage">
			<div class="header">
				<div>회원 정보</div>
				<div class="body">
					<div class="id">
						<div class="subject">아이디</div>
						<div>
							<input type="text" name="id" id="id" value="${dto.id }" disabled>
							<!--                      readonly 더 강력한 것은 disabled submit도 안된다. -->
							<!--                      input value "" 꼭 더블쿼테이션 주소같은 경우 띄워쓰기 하면 끊길 수 있다 -->
						</div>
					</div>
					<div>*5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능</div>
					<div class="nickName">
						<div class="subject">닉네임</div>
						<div>
							<input type="text" name="nickName" id="nickName"
								readonly="readonly"><input type="button"
								id="duplCheckNickName" value="중복확인" style="width: 70px;">
						</div>
						<div id="duplCheckNickName"></div>
						<div>*2~8자 한글,영어 대 소문자,특수문자(~!^*&)가능</div>
					</div>

					<div class=pw>
						<div class="subject">패스워드</div>
						<div>
							<input type="password" name="pw" id="pw" value="${dto.pw }"
								readonly>
						</div>
						<div>*8~16자 영문 대 소문자, 숫자, 특수문자(~!^*&)를 사용</div>
					</div>
					<div class="pwcheck">
						<div class="subject">패스워드 확인</div>
						<div>
							<input type="password" id="checkpw" value="${dto.pw }" readonly>
						</div>
						<div id="result"></div>
					</div>
					<div class="name">
						<div class="subject">이름</div>
						<div>
							<input type="text" name="name" id="name" value="${dto.name }"
								readonly>
						</div>
						<div>*2~5자</div>
					</div>
					<div class="phone">
						<div class="subject">전화번호</div>
						<div>
							<input type="text" name="phone" id="phone" value="${dto.phone }"
								readonly>
						</div>
						<div>*010으로 시작하고 숫자만 입력</div>
					</div>
					<div class="email">
						<div class="subject">이메일</div>
						<div>
							<input type="text" name="email" id="email" value="${dto.email }"
								readonly>
						</div>
						<div>*숫자,영어 대 소문자 가능</div>
					</div>
					<div class="postcode">
						<div class="subject">우편번호</div>
						<div>
							<input type="text" name="postcode" id="postcode"
								placeholder="우편번호" value="${dto.postcode }" readonly>&nbsp
							<input type="button" onclick="postcode()" value="우편번호 찾기"
								id="btnsearch" style="width: 100px;">
						</div>
					</div>
					<div class="address1">
						<div class="subject">주소1</div>
						<div>
							<input type="text" name="address1" id="address1" placeholder="주소"
								value="${dto.address1 }" readonly>
						</div>
					</div>
					<div class="address2">
						<div class="subject">주소2</div>
						<div>
							<input type="text" name="address2" id="address2"
								placeholder="상세주소" value="${dto.address2 }" readonly>
						</div>
					</div>
				</div>
				<div class="footer">
					<div id="btns">
						<input type="button" class="btn" id="modify" value="수정하기">
						&nbsp <a href="/index.jsp"><input type="button" class="btn"
							id="back" value="홈으로"></a>
					</div>
				</div>
			</div>
	</form>
	<script>
		$("#duplCheckNickName").on("click", function() {
			let nickName = $("#nickName").val();
			if (nickName == "") {
				alert("닉네임을 먼저 입력하세요.");
				$("#nickName").focus();
				return;
			}
			$.ajax({
				url : "/nicknameDuplCheck.member",
				data : {
					"nickname" : nickname
				}
			}).done(function(resp) {
				if (resp == "true") { // 아이디가 이미 존재하므로 사용할 수 없는 경우
					$("#duplResult").html("이미 사용중인 ID 입니다.");
				} else { // 아이디가 존재하지 않으므로 사용할 수 있는 경우
					$("#duplResult").html("사용 가능한 ID 입니다.");
				}
			})

		})

		$("#pw,#checkpw").on("input", function() {
			if (!($("#pw").val() == $("#checkpw").val())) {

				$("#result").text("패스워드가 일치하지 않습니다.");
				pwCheck = false;
			} else {
				$("#result").text("패스워드가 일치합니다.");
				pwCheck = true;
			}
		})

		document.getElementById("btnsearch").onclick = function() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address1").value = data.jibunAddress;

						}
					}).open();
		}

		$("form").submit(function() {

			if (!pwCheck) {
				alert("두 패스워드가 일치하지 않습니다.");
				return false;
			}

			let idRegex = /^[a-z\d\_\-]{5,20}$/; // 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능
			let pwRegex = /^[a-zA-Z\d\~\!\^\*\&]{8,16}$/; //8~16자 영문 대 소문자, 숫자, 특수문자(~!^*&)를 사용
			let nameRegex = /^[가-힣]{2,5}$/; // 2~5자
			let phoneRegex = /^010[\d]{4}[\d]{4}&/; //010으로 시작하고 숫자만 입력
			let emailRegex = /^[\da-zA-Z]$/; //숫자,영어 대 소문자 가능
			let nickNameRegex = /^[가-힣]{2,8}/; //2~10자 한글만 가능

			if ($("#pw").val() != "") {
				if (!pwRegex.test($("#pw").val())) {
					alert("패스워드 형식을 확인해주세요.");
					return false;
				}
			}
			if ($("#phone").val() != "") {
				if (!phoneRegex.test($("#phone").val())) {
					alert("전화번호 형식을 확인해주세요.");
					return false;
				}
			}
			if ($("#name").val() != "") {
				if (!nameRegex.test($("#name").val())) {
					alert("이름 형식을 확인해주세요.");
					return false;
				}
			}
			if ($("#email").val() != "") {
				if (!emailRegex.test($("#email").val())) {
					alert("이메일 형식을 확인해주세요.");
					return false;
				}
			}

		})
	</script>

</body>
</html>