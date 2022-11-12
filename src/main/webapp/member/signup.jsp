<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
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
* {box-sizing: border-box;font-family: 'DungGeunMo';margin: auto; background-color: black; color: white;}
.signupForm {/* width: 550px; */margin: auto;}
.joinForm {float: left;/* width: 430px; */margin: auto;display: inline-block;/* margin-right: 15px; */}
.body {margin: auto;display: flex;overflow: hidden;}
/* .body>div {overflow: hidden;} */
/* .body>div>.subject {text-align: right;width: 20%;margin-right: 10px} */
input {width: 400px;height: 30px;}
#email {width: 281px;}
.header {text-align: center;height: 80px;}
/* #duplResult {margin-left: 10px;}
#result {margin-left: 10px;} */
.selectOption {	height: 30px;}
* {color: white;}
.requiredField {color: red;}
#result, #duplResult {margin: 0;}
.id, .nickname, .pw, .pwcheck, .name, .phone, .email, .postcode,.address1, .address2, .margin_top, #result, #duplResultID,#duplResultNickname {margin: 15px 0;}
.footer {margin-top: 10px;text-align: center;}
#duplCheckID, #duplCheckNickname {width: 100px;}
.btns button {height: 30px;width: 92px;}
.footer {/* position: relative;left: -20px; */margin: auto;}
.btns {width: 100%;margin-top: 10px;	text-align: center;}
/* div {border: 1px solid black;} */


a{
    position: relative;
    display: inline-block;
    padding: 25px 30px;
   /*  margin: 40px 0; */
    margin:auto;
    color: #03e9f4;
    text-decoration: none;
    text-transform: uppercase;
    transition: 0.5s;
    letter-spacing: 4px;
    overflow: hidden;
   /*  margin-right: 10px; */
    height: 30px;width: 150px;
    width: 140px;
   
}
a:hover{
    background: #03e9f4;
    color: #050801;
    box-shadow: 0 0 5px #03e9f4,
                0 0 25px #03e9f4,
                0 0 50px #03e9f4,
                0 0 200px #03e9f4;
     -webkit-box-reflect:below 1px linear-gradient(transparent, #0005);
}
a:nth-child(1){
    filter: hue-rotate(270deg);
}
a:nth-child(2){
    filter: hue-rotate(110deg);
}
a span{
    position: absolute;
    display: block;
}
a span:nth-child(1){
    top: 0;
    left: 0;
    width: 100%;
    height: 2px;
    background: linear-gradient(90deg,transparent,#03e9f4);
    animation: animate1 1s linear infinite;
}
@keyframes animate1{
    0%{
        left: -100%;
    }
    50%,100%{
        left: 100%;
    }
}
a span:nth-child(2){
    top: -100%;
    right: 0;
    width: 2px;
    height: 100%;
    background: linear-gradient(180deg,transparent,#03e9f4);
    animation: animate2 1s linear infinite;
    animation-delay: 0.25s;
}
@keyframes animate2{
    0%{
        top: -100%;
    }
    50%,100%{
        top: 100%;
    }
}
a span:nth-child(3){
    bottom: 0;
    right: 0;
    width: 100%;
    height: 2px;
    background: linear-gradient(270deg,transparent,#03e9f4);
    animation: animate3 1s linear infinite;
    animation-delay: 0.50s;
}
@keyframes animate3{
    0%{
        right: -100%;
    }
    50%,100%{
        right: 100%;
    }
}


a span:nth-child(4){
    bottom: -100%;
    left: 0;
    width: 2px;
    height: 100%;
    background: linear-gradient(360deg,transparent,#03e9f4);
    animation: animate4 1s linear infinite;
    animation-delay: 0.75s;
}
@keyframes animate4{
    0%{
        bottom: -100%;
    }
    50%,100%{
        bottom: 100%;
    }
}
</style>
</head>

<body>
	<form action="/signup.member" method="post" id="frm">
		<div class="container signupForm col-12" style="min-width: 350px;">
			<div class="header col-12">logo</div>
			<div class="body col-12 ">
				<div class="joinForm col-12">
					<div class="id col-12">
						<span>아이디<span class="requiredField">*<span></span>
								<div class="margin_top col-12">
									<input type="text" name="id" id="id">
									<div id="duplResultID"></div>
								</div>
					</div>
					<div class="nickname col-12">
						<span>닉네임<span class="requiredField">*<span></span>
								<div class="margin_top col-12">
									<input type="text" name="nickname" id="nickname"
										placeholder="2~8자 영문 대 소문자,한글">
									<div id="duplResultNickname"></div>
								</div>
					</div>
					<div class="pw col-12">
						<span>패스워드<span class="requiredField">*<span></span>
								<div class="margin_top col-12">
									<input type="password" name="pw" id="pw"
										placeholder="8~20자 영문 대 소문자,숫자,특수문자(~!@#$%)">
								</div>
					</div>
					<div class="pwcheck col-12">
						<span>패스워드 확인</span>
						<div class="margin_top col-12">
							<input type="password" id="checkpw">
							<div id="result"></div>
						</div>
					</div>
					<div class="name col-12">
						<span>이름<span class="requiredField">*<span></span>
								<div class="margin_top col-12">
									<input type="text" name="name" id="name" placeholder="2~5자 한글">
								</div>
					</div>
					<div class="phone col-12">
						<span>전화번호<span class="requiredField">*<span></span>
								<div class="margin_top col-12">
									<input type="text" name="phone" id="phone" placeholder="숫자만 입력">
								</div>
					</div>
					<div class="email col-12">
						<span>이메일<span class="requiredField">*<span></span>
								<div class="margin_top col-12">
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
					<div class="postcode col-12">
						<div class="col-12">
							<span>우편번호</span>&nbsp&nbsp
							<!-- <input type="button"
								onclick="postcode()" value="우편번호 찾기" id="btnsearch"
								style="width: 100px;"> -->
								<a href="#" id="btnsearch">
							        <span></span>
							        <span></span>
							        <span></span>
							        <span></span>
							        우편번호 찾기
							    </a>
						</div>
						<div class="margin_top col-12">
							<input type="text" name="postcode" id="postcode"
								placeholder="우편번호">
						</div>
					</div>
					<div class="address1 col-12">
						<span>주소</span>
						<div class="margin_top col-12">
							<input type="text" name="address1" id="address1" placeholder="주소">
						</div>
					</div>
					<div class="address2 col-12">
						<span>상세주소</span>
						<div class="margin_top col-12">
							<input type="text" name="address2" id="address2"
								placeholder="상세주소">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer col-12">
			<div class="btns">
				<!-- <a href=/index.jsp><button id=signup>회원가입</button></a>&nbsp&nbsp<a
					href=/index.jsp><button type="button">뒤로 가기</button></a>&nbsp
				<button type="reset">다시 입력</button> -->
				<a href="/index.jsp">
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			        회원가입
			    </a>
			    <a href="/index.jsp">
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			        뒤로가기
			    </a>
			    <a href="#">
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			        다시입력
			    </a>
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
				$("#result").css("color", "blue");
				pwCheck = true;
			}
		})

		$("#id").on("input", function() { // 한 글자 쓸 때마다 ajax가 나간다(쏴라)
			idCheck = false;
			let id = $("#id").val();
			$.ajax({
				url : "/idDuplCheck.member",
				data : {
					"id" : id
				}
			}).done(function(resp) {
				if (resp == "true") { // 아이디가 이미 존재하므로 사용할 수 없는 경우
					$("#duplResultID").html("중복된 ID 입니다.");
					$("#duplResultID").css("color", "red");
				} else { // 아이디가 존재하지 않으므로 사용할 수 있는 경우
					$("#duplResultID").html("중복되지 않은 ID 입니다.");
					$("#duplResultID").css("color", "blue");
					idCheck = true;
				}
			})
		})

		$("#nickname").on("input", function() {
			nicknameCheck = false;
			let nickname = $("#nickname").val();

			$.ajax({
				url : "/nicknameDuplCheck.member",
				data : {
					"nickname" : nickname
				}
			}).done(function(resp) {
				if (resp == "true") { // 닉네임이 이미 존재하므로 사용할 수 없는 경우
					$("#duplResultNickname").html("중복된 닉네임입니다.");
					$("#duplResultNickname").css("color", "red");
				} else { // 닉네임이 존재하지 않으므로 사용할 수 있는 경우
					$("#duplResultNickname").html("중복되지 않은 닉네임입니다.");
					$("#duplResultNickname").css("color", "blue");
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