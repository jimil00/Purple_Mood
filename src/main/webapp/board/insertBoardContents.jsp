<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SummernoteTest</title>

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

#insertBoardContents {
	margin: auto;
}
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

	<form action="insertBoardContents.board" method="post" enctype="multipart/form-data">
		<table id="insertBoardContents">
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" name="title" placeholder="제목을 입력하세요."></td>
			</tr>
			<tr>
				<td>파일</td>
				<td><button id="fileAdd" type=button>파일 첨부</button></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="summernote" name="editordata"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="작성"><input type="button" id="toBoardList" value="목록으로">
				</td>
			</tr>
		</table>
	</form>
	<script>
	
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
		
		let delBtn = $("<a>");
		delBtn.html("x");
		delBtn.on("click",function(){
			$(this).parent().remove();
		});
		
		fileDiv.append(inputFile);
		fileDiv.append(delBtn);
		
		$("#fileAdd").after(fileDiv);
	})
	</script>
</body>

</html>