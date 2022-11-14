<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Summernoteinsert</title>

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

* {
	box-sizing: border-box;
}

body {
	background-color: #03001e;
}

.container {
	margin: auto;
}

.header {
	font-family: '둥근모꼴체';
	color: #03001e;
}

.headerTitle {
	color: #fdeff9;
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
            callbacks: {
                onImageUpload: function (image) {
                    console.log("works")
                    data = new FormData();
                    data.append("image", image[0]);

                    $.ajax({
                        data: data,
                        type: "post",
                        url: "/imageupload.boardfile",
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (url) {
                            console.log(url)
                            var image = $('<img>').attr('src', url);
                            $("#summernote").summernote("insertNode", image[0]);
                        },
                        error: function (a, b, c) {
                            console.log(a);
                            console.log(b);
                            console.log(c);
                        }
                    });
                }
            }
        });

        $('#insertBoardContents').on('click', function () {
            saveContent();


        });
        function saveContent() {

            //값 가져오기
            var summernoteContent = $('#summernote').summernote('code');        //썸머노트(설명)
            console.log("summernoteContent : " + summernoteContent);
            var n_category = $("#n_category").val();
            var n_title = $("#n_title").val();

            $.ajax({
                url: "/insertNoticeContents.notice",
                type: "post",
                data: {
                    "n_category": n_category,
                    "n_title": n_title,
                    "n_content": summernoteContent
                },success: function (data) {
                 var n_seq = data;
                 location.href="/selectNoticeContents.notice?n_seq="+n_seq;
             }
            });
        };
    });
    </script>
</head>

<body>
	<div class="container">
		<div class="insertNoticeContents">
			<div class="row header">
				<div class="category">
					<div class="headerTitle">카테고리</div>
					<div>
						<select id="n_category" name="n_category">
							<option value="post">공지</option>
							<option value="event">이벤트</option>
							<option value="FAQ">FAQ</option>
						</select>
					</div>
				</div>
				<div class="title">
					<div class="headerTitle">제목</div>
					<div>
						<input type="text" id="b_title" name="b_title"
							placeholder="제목을 입력하세요." style="border: none;">
					</div>
				</div>
			</div>
			<div class="row body">
				<div class="col-lg-12 col-md-12 col-sm-12" id="summernote"
					name="b_content"></div>
			</div>
			<div class="row footer">
				<div class="btns col-lg-12 col-md-12 col-sm-12">
					<button type="button" class="btn" id="insertBoardContents"
						name="insertBoardContents">작성하기</button>
					&nbsp <a href="/boardList.board"><button type="button"
							id="toList" name="toList">목록으로</button></a>
				</div>
			</div>
		</div>
	</div>
</body>

</html>