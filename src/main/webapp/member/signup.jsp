<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
* {
	box-sizing: border-box;
}



.signupForm {
	width: 550px;
	margin: auto;
}

.joinForm {
	float: left;
	width: 420px;
	margin: auto;
	display: inline-block;
	margin: auto;
}

.body {
	margin: auto;
	display: flex;
	overflow: hidden;
}

/* .body>div {
	overflow: hidden;
} */
.body>div>.subject {
	text-align: right;
	width: 20%;
	margin-right: 10px
}

input {
	width: 300px;
	height: 30px;
}

#email {
	width: 179px;
}

.header {
	text-align: center;
	height: 80px;
}

.footer {
	margin-top: 10px;
	text-align: center;
}

#duplResult {
	margin-left: 10px;
}

#result {
	margin-left: 10px;
}

.selectOption {
	height: 30px;
}
*{color: black;}
.requiredField{color: red;}


#result, #duplResult {
	margin: 0
}
.id,.nickname,.pw,.pwcheck,.name,.phone,.email,.postcode,.address1,.address2{margin:7px 0}
.margin_top,#result{margin-top: 5px;}
</style>
</head>

<body>
	<form action="/signup.member" method="post" id="frm">
		<div class="signupForm">
			<div class="header">logo</div>
			<div class="body">
				<div class="joinForm">
					<div class="id">
						<span>아이디<span class="requiredField">*<span></span>
								<div class="margin_top">
									<input type="text" name="id" id="id"
										placeholder="6~20자 영문 소문자, 숫자, 특수기호(_)">&nbsp&nbsp<input
										type="button" id="duplCheckID" value="중복확인"
										style="width: 70px;">
								</div>
					</div>
					<div class="nickname">
						<span>닉네임<span class="requiredField">*<span></span>
								<div class="margin_top"> 
									<input type="text" name="nickname" id="nickname"
										placeholder="2~8자 영문 대 소문자, 한글">&nbsp&nbsp<input
										type="button" id="duplCheckNickname" value="중복확인"
										style="width: 70px;">
									<div id="duplResult"></div>
								</div>
					</div>
					<div class=pw>
						<span>패스워드<span class="requiredField">*<span></span>
								<div class="margin_top">
									<input type="password" name="pw" id="pw"
										placeholder="8~20자 영문 대 소문자, 숫자, 특수문자(~!@#$%)">
								</div>
					</div>
					<div class="pwcheck">
						<span>패스워드 확인</span>
						<div class="margin_top">
							<input type="password" id="checkpw">
							<div id="result">비번체크</div>
						</div>
					</div>
					<div class="name">
						<span>이름<span class="requiredField">*<span></span>
								<div class="margin_top">
									<input type="text" name="name" id="name" placeholder="2~5자 한글">
								</div>
					</div>
					<div class="phone">
						<span>전화번호<span class="requiredField">*<span></span>
								<div class="margin_top">
									<input type="text" name="phone" id="phone" placeholder="숫자만 입력">
								</div>
					</div>
					<div class="email">
						<span>이메일<span class="requiredField">*<span></span>
								<div class="margin_top">
									<input type="text" name="email" id="email"
										placeholder="영어 대 소문자, 숫자"> @ <select
										id="emailAddress" name="emailAddress" class="selectOption">
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
									</select>
								</div>
					</div>
					<div class="postcode">
						<span>우편번호</span>
						<div class="margin_top">
							<input type="text" name="postcode" id="postcode"
								placeholder="우편번호">&nbsp&nbsp<input type="button"
								onclick="postcode()" value="우편번호 찾기" id="btnsearch"
								style="width: 100px;">
						</div>
					</div>
					<div class="address1">
						<span>주소</span>
						<div class="margin_top">
							<input type="text" name="address1" id="address1" placeholder="주소">
						</div>
					</div>
					<div class="address2">
						<span>상세주소</span>
						<div class="margin_top">
							<input type="text" name="address2" id="address2"
								placeholder="상세주소">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div>
				<a href=/index.jsp><button id=signup>회원가입</button></a>&nbsp&nbsp&nbsp<a
					href=/index.jsp><button type="button">뒤로 가기</button></a>&nbsp&nbsp
				<button type="reset">다시 입력</button>
			</div>
		</div>

	</form>
	<script>
		// 우편번호
		$("#btnsearch")
				.on(
						"click",
						function() {

							new daum.Postcode(
									{
										oncomplete : function(data) {

											document.getElementById('postcode').value = data.zonecode;
											document.getElementById("address1").value = data.jibunAddress;

										}
									}).open();

						})

		$("#pw,#checkpw").on("input", function() {
			if (!($("#pw").val() == $("#checkpw").val())) {
				$("#result").text("패스워드가 일치하지 않습니다.");
				$("#result").css("color", "red");
				pwCheck = false;
			} else {
				$("#result").text("패스워드가 일치합니다.");
				$("#result").css("color", "black");
				pwCheck = true;
			}
		})

		$("#id").on("input", function() {
			idCheck = false;
		})

		$("#duplCheckID").on(
				"click",
				function() {
					let id = $("#id").val();
					if (id == "") {
						alert("아이디를 먼저 입력하세요.");
						$("#id").focus();
						return;
					}
					window.open("/idDuplCheck.member?id=" + id, "",
							"width=300,height=200");

				})
		$("#nickname").on("input", function() {
			nicknameCheck = false;
		})

		$("#duplCheckNickname").on("click", function() {
			let nickname = $("#nickname").val();
			if (nickname == "") {
				alert("닉네임을 먼저 입력하세요.");
				$("#nickname").focus();
				return;
			}

			$.ajax({
				url : "/nicknameDuplCheck.member",
				data : {
					"nickname" : nickname
				}
			}).done(function(resp) {
				if (resp == "true") { // 닉네임이 이미 존재하므로 사용할 수 없는 경우
					$("#duplResult").html("이미 사용중인 닉네임입니다.");
				} else { // 닉네임이 존재하지 않으므로 사용할 수 있는 경우
					$("#duplResult").html("사용 가능한 닉네임입니다.");
					nicknameCheck = true;

				}

			})

		})

		$("#frm").on(
				"submit",
				function() {

					if (!idCheck) {
						alert("아이디 중복체크를 먼저 수행해주세요.");
						return false;
					}
					if (!nicknameCheck) {
						alert("닉네임 중복체크를 먼저 수행해주세요.");
						return false;
					}
					if (!pwCheck) {
						alert("두 패스워드가 일치하지 않습니다.");
						return false;
					}

					if ($("#id").val() == "" || $("#pw").val() == ""
							|| $("#name").val() == "") {
						alert("아이디, 패스워드, 이름은 필수입력값입니다.");
						return false;
					}

					let idRegex = /^[a-z0-9_]{6,20}$/; //6~20자의 영문 소문자, 숫자와 특수기호(_) 가능
					let nicknameRegex = /^[가-힣a-zA-Z]{2,8}$/; //2~8자 한글,영문 대 소문자 가능
					let pwRegex = /^[A-Za-z0-9~!@#$%]{8,20}$/; //8~20자 영문 대 소문자, 숫자, 특수문자(~!@#$%) 가능
					let nameRegex = /^[가-힣]{2,5}$/; // 한글 2~5자
					let phoneRegex = /^01\d\d{3,4}\d{4}$/; //010으로 시작하고 숫자만 입력
					let emailRegex = /^[a-zA-Z0-9]{1,20}$/; //숫자,영어 대 소문자 가능

					if ($("#id").val() != "") {
						if (!idRegex.test($("#id").val())) {
							alert("아이디 형식을 확인해주세요.");
							return false;
						}
					}
					if ($("#nickname").val() != "") {
						if (!nicknameRegex.test($("#nickname").val())) {
							alert("닉네임 형식을 확인해주세요.");
							return false;
						}
					}
					if ($("#pw").val() != "") {
						if (!pwRegex.test($("#pw").val())) {
							alert("패스워드 형식을 확인해주세요.");
							return false;
						}
					}
					if ($("#name").val() != "") {
						if (!nameRegex.test($("#name").val())) {
							alert("이름 형식을 확인해주세요.");
							return false;
						}
					}
					if ($("#phone").val() != "") {
						if (!phoneRegex.test($("#phone").val())) {
							alert("전화번호 형식을 확인해주세요.");
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