<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 작성 페이지</title>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-en-US.js"></script>

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

.container {overflow: hidden;margin: auto;display: flex;}
.category {width: 10%;float: left;margin-top: 23px;margin-bottom: 20px;}
.title {width: 90%;float: left;margin-top: 20px;margin-bottom: 20px;}
#b_title {width: 45%;}
.file {height: 150px;}
.btns {overflow: hidden;}
.btns * {float: right;}

</style>
<script>
        $(document).ready(function () {
            // var fontList = ['굴림', '맑은고딕', '돋움', '바탕', 'J송명', '교보손글씨', '빙그레싸만코체', '주아체', '한림고딕체', '둥근모꼴체', 'NotoSansKR', 'Arial', 'Courier New', 'Verdana', 'Times New Roamn'];
            $('#summernote').summernote({
                lang: 'ko-KR',
                height: 400,
                placeholder: "내용을 입력해주세요.",
                fontNames: ['굴림', '맑은고딕', '돋움', '바탕', 'J송명', '교보손글씨', '빙그레싸만코체', '주아체', '한림고딕체', '둥근모꼴체', 'NotoSansKR', 'Arial', 'Courier New', 'Verdana', 'Times New Roamn'],
                // addDefaultFonts: false,
                fontNamesIgnoreCheck: ['굴림', '맑은고딕', '돋움', '바탕', 'J송명', '교보손글씨', '빙그레싸만코체', '주아체', '한림고딕체', '둥근모꼴체', 'NotoSansKR', 'Arial', 'Courier New', 'Verdana', 'Times New Roamn'],
                fontSizes: ['8', '10', '12', '14', '16', '18', '20', '22', '24', '26', '28', '30', '32', '34', '36', '38', '40'],
                toolbar: [
                    ['font', ['fontname', 'fontsize']],
                    ['fontstyle', ['bold', 'italic', 'underline', 'strikethrough', 'forecolor', 'backcolor', 'superscript', 'subscript', 'clear']],
                    ['style', ['style']],
                    ['paragraph', ['paragraph', 'height', 'ul', 'ol']],
                    ['insert', ['table', 'hr', 'link', 'picture', 'video']],
                    ['codeview'],
                ]


            });
            $('#summernote').summernote('fontName', '둥근모꼴체');
            $('#summernote').summernote('fontSize', 14);
        });
    </script>
</head>

<body>
	<div class="container">
		<form action="/insertBoardContents.board" id="insertBoardContents"
			method="post" enctype="multipart/form-data">
			<!-- <div class="insertBoardContents"> -->
			<div class="category">
				<select id="b_category" name="b_category">
					<option selected value="movie">영화</option>
					<option value="drama">드라마</option>
					<option value="onAir">실시간</option>
					<option value="review">후기</option>
				</select>
			</div>
			<div class="title">
				제목<input type="text" id="b_title" name="b_title"
					placeholder="제목을 입력하세요.">
			</div>
			<div class="file">
				파일
				<button id="fileAdd" type="button">파일 첨부</button>
			</div>
			<div class="editor">
				<textarea id="summernote" name="editordata"
					form="insertBoardContents"></textarea>
			</div>
			<div class="btns">
				<input type="submit" value="작성">
				<a href="/board/boardList.jsp"><input type="button" id="toBoardList" value="목록으로"></a>
			</div>
			<!-- </div> -->
		</form>
	</div>
	<script>
	
	/*$("select[name=b_category]").change(function(){
		console.log($(this).value());
		console.log($("select[name=b_category] option:selected").text());
	}) */
	
	
	let count = 0;
	$("#fileAdd").on("click",function(){
		if($("input[type=file]").length > 5){
			alert("파일은 최대 5개까지만 업로드 가능합니다.");
			return;
		}
		
		let fileDiv = $("<div>");
		
		let inputFile = $("<input>");
		inputFile.attr("type","file");
		inputFile.attr("name","file" + count++);
		inputFile.attr("onchange",checkFile(this));
		inputFile.attr("id","eachFile");
		
		let delBtn = $("<a>");
		delBtn.html("x");
		delBtn.on("click",function(){
			$(this).parent().remove();
		});
		
		fileDiv.append(inputFile);
		fileDiv.append(delBtn);
		
		$("#fileAdd").after(fileDiv);
	})
$("#eachFile").on("change", function checkFile(el){

	// files 로 해당 파일 정보 얻기.
	var file = el.files;

	// file[0].size 는 파일 용량 정보입니다.
	if(file[0].size > 1024 * 1024 * 2){
		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
		alert('2MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
	}

	// 체크를 통과했다면 종료.
	else return;

	// 체크에 걸리면 선택된 내용 취소 처리를 해야함.
	// 파일선택 폼의 내용은 스크립트로 컨트롤 할 수 없습니다.
	// 그래서 그냥 새로 폼을 새로 써주는 방식으로 초기화 합니다.
	// 이렇게 하면 간단 !?
	el.outerHTML = el.outerHTML;
})

	</script>
</body>

</html>