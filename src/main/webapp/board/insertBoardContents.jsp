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
   $(document).ready(function() {
      // var fontList = ['굴림', '맑은고딕', '돋움', '바탕', 'J송명', '교보손글씨', '빙그레싸만코체', '주아체', '한림고딕체', '둥근모꼴체', 'NotoSansKR', 'Arial', 'Courier New', 'Verdana', 'Times New Roamn'];
      $('#summernote').summernote({
         callbacks : {
            onImageUpload : function(image) {
               console.log("works")
               data = new FormData();
               data.append("image", image);

               $.ajax({
                  data : data,
                  type : "post",
                  enctype : "multipart/form-data",
                  url : "/imageupload.boardfile",
                  cache : false,
                  contentType : false,
                  processData : false,
                  success : function(url) {
                     console.log(url)
                     var image = $('<img>').attr('src', url);
                     $("#summernote").summernote("insertNode", image[0]);
                  },
                  error : function(a, b, c) {
                     console.log(a);
                     console.log(b);
                     console.log(c);
                  }
               });
            }
         }
      });

   });
</script>
</head>

<body>

   <form action="/insertBoardContents.board" method="post">
      <table id="insertBoardContents">
         <tr class="category">
            <td><select id="b_category" name="b_category">
                  <option selected value="movie">영화</option>
                  <option value="drama">드라마</option>
                  <option value="onAir">실시간</option>
                  <option value="review">후기</option>
            </select>
         </tr>

         <tr>
            <td>제목</td>
            <td><input type="text" id="b_title" name="b_title"
               placeholder="제목을 입력하세요."></td>
         </tr>

         <tr>
            <td colspan="2"><textarea id="summernote" name="content"></textarea>
            </td>
         </tr>
         <tr>
            <td colspan="2" align="right"><input type="submit" value="작성">
               <a href="/boardList.board"><input type="button"
                  id="toBoardList" value="목록으로"></a></td>
         </tr>
      </table>
   </form>

</body>

</html>