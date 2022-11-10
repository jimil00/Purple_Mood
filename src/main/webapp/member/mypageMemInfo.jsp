<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
@font-face {
	font-family: 'DungGeunMo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	box-sizing: border-box;
	font-family: 'DungGeunMo';
}

* {
	box-sizing: border-box;
}

/* .body>div {
	width: 100%;
	overflow: hidden;
} */
.body>div>* {
	float: left;
}

.body {
	margin: auto;
	display: flex;
	overflow: hidden;
}
/* .body>div>.subject {
	text-align: right;
	width: 20%;
	margin-right: 10px
}
 */
input {
	width: 300px;
	height: 30px;
}

.header {
	text-align: center;
	height: 80px;
}

.footer {
	margin-top: 10px;
	text-align: center;
}

.btn {
	width: 100px;
	height: 30px;
}

.mypage {
	width: 550px;
	margin: auto;
}

.modifyForm {
	float: left;
	width: 430px;
	margin: auto;
	display: inline-block;
	margin: auto;
	margin-right: 15px;
}

.btns button {
	height: 30px;
	width: 92px;
	margin-left: 100px;
}

/* .footer {
	width: 400px;
	margin: auto;
} */
.btns {
	width: 100%;
	margin-top: 15px;
	text-align: center;
	margin-top: 15px;
}

#email {
	width: 179px;
}

/* div {
	border: 1px solid black;
} */
* {
	color: black;
}

.requiredField {
	color: red;
}

/* #result, #duplResult {
	margin: 0;
} */
.id, .nickName, .pw, .pwcheck, .name, .phone, .email, .postcode,
	.address1, .address2, .margin_top, #result, #duplResult {
	margin: 5px 0;
}

/* .footer {
	margin-top: 15px;
	text-align: center;
	margin: auto;
} */
#duplCheckID, #duplCheckNickname {
	width: 100px;
}

.selectOption {
	height: 30px;
}

.footer {
	position: relative;
	left: -57px;
}
</style>
<script>
	$(
			function() {
				//    window.onload와 같다
				$("#modify").on(
						"click",
						function() {
							$("#modify").closest("div").closest("div").css(
									"position", "relative")
									.css("left", "-10px");
							;

							$("input").removeAttr("readonly");

							$("#modify").css("display", "none");
							let btnModify = $("<button>");
							btnModify.text("수정완료");
							btnModify.addClass("btn")

							btnModify.css("width", "90px");
							btnModify.css("margin-right", "5px")

							let btnCancel = $("<button>");
							btnCancel.attr("type", "button");
							btnCancel.text("취소");
							btnCancel.addClass("btn");
							btnCancel.css("width", "90px");

							btnCancel.on("click", function() {
								location.reload();
							});
							$("#btns").append(btnModify);
							$("#btns").append(" ");
							$("#btns").append(btnCancel);

						})
			})
</script>
</head>
<body>
	<form action="/updateMemInfo.member" method="post">
		<div class="mypage col-12" style="min-width: 350px;">
			<div class="header col-12">회원정보수정</div>
			<div class="body col-12">
				<div class="modifyForm col-12">
					<div class="id col-12">
						<span>아이디<span class="requiredField">*<span></span>
								<div class="margin_top col-12">
									<input type="text" name="id" id="id" value="${dto.id }"
										disabled>
									<!-- readonly 더 강력한 것은 disabled submit도 안된다. -->
									<!-- input value "" 꼭 더블쿼테이션 주소같은 경우 띄워쓰기 하면 끊길 수 있다 -->
								</div>
					</div>
					<div class="nickName col-12">
						<span>닉네임<span class="requiredField">*<span></span>
								<div class="margin_top col-12">
									<input type="text" name="nickname" id="nickname"
										placeholder="2~8자 영문 대 소문자,한글" readonly="readonly">
									<div id="duplResultNickName col-12"></div>
								</div>
					</div>
					<div class="pw col-12">
						<span>패스워드<span class="requiredField">*<span></span>
								<div class="margin_top col-12">
									<input type="password" name="pw" id="pw"
										placeholder="8~20자 영문 대 소문자,숫자,특수문자(~!@#$%)" readonly>
								</div>
					</div>
					<div class="pwcheck col-12">
						<span>패스워드 확인</span>
						<div class="margin_top col-12">
							<div>
								<input type="password" id="checkpw" readonly>
								<div id="result col-12"></div>
							</div>
						</div>
						<div class="name col-12">
							<span>이름<span class="requiredField">*<span></span>
									<div class="margin_top col-12">
										<input type="text" name="name" id="name" placeholder="2~5자 한글"
											value="${dto.name }" readonly>
									</div>
						</div>
						<div class="phone col-12">
							<span>전화번호<span class="requiredField">*<span></span>
									<div class="margin_top col-12">
										<input type="text" name="phone" id="phone"
											placeholder="숫자만 입력" value="${dto.phone }" readonly>
									</div>
						</div>
						<div class="email col-12">
							<span>이메일<span class="requiredField">*<span></span>
									<div class="margin_top col-12">
										<div>
											<input type="text" name="email" id="email"
												value="${dto.email}" placeholder="영어 대 소문자,숫자" readonly>
											@ <select id="emailAddress" name="emailAddress"
												class="selectOption">
												<option value="gmail.com">gmail.com</option>
												<option value="naver.com">naver.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="nate.com">nate.com</option>
											</select>
										</div>
									</div>
									<div class="postcode col-12">
										<span>우편번호</span>
										<div class="margin_top col-12">
											<input type="text" name="postcode" id="postcode"
												placeholder="우편번호" value="${dto.postcode }" readonly>&nbsp&nbsp
											<input type="button" onclick="postcode()" value="우편번호 찾기"
												id="btnsearch" style="width: 100px;">
										</div>
									</div>
									<div class="address1 col-12">
										<span>주소</span>
										<div class="margin_top col-12">
											<input type="text" name="address1" id="address1"
												placeholder="주소" value="${dto.address1 }" readonly>
										</div>
									</div>
									<div class="address2 col-12">
										<span>상세주소</span>
										<div class="margin_top col-12">
											<input type="text" name="address2" id="address2"
												placeholder="상세주소" value="${dto.address2 }" readonly>
										</div>
									</div>
						</div>
						<div class="footer col-12">
							<div id="btns">
								<input type="button" class="btn" id="modify" value="수정하기">
								&nbsp&nbsp<a href="/index.jsp"><input type="button"
									class="btn" id="back" value="홈으로"></a>&nbsp
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script>
		$("#nickname").on("input", function() {
			nicknameCheck = false;
		})

		$("#nickname").on("input", function() {
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
					$("#duplResultNickName").html("이미 사용중인 닉네임입니다.");
					$("#duplResultNickName").css("color", "red");
				} else { // 닉네임이 존재하지 않으므로 사용할 수 있는 경우
					$("#duplResultNickName").html("사용 가능한 닉네임입니다.");
					$("#duplResultNickName").css("color", "blue");
					nicknameCheck = true;
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

			let idRegex = /^[a-z0-9_]{6,20}$/; //6~20자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능
			let nicknameRegex = /^[가-힣a-zA-Z]{2,8}$/; //2~8자 한글만 가능
			let pwRegex = /^[A-Za-z0-9~!@#$%]{8,20}$/; //8~20자 영문 대 소문자, 숫자, 특수문자(~!^*&)를 사용
			let nameRegex = /^[가-힣]{2,5}$/; // 한글 2~5자
			let phoneRegex = /^01\d\d{3,4}\d{4}$/; //010으로 시작하고 숫자만 입력
			let emailRegex = /^[a-zA-Z0-9]{1,20}$/; //숫자,영어 대 소문자 가능

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