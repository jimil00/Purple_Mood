<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>summernoteselect</title>
            <!-- include libraries(jQuery, bootstrap) -->
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

            <!-- include summernote css/js -->
            <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-en-US.js"></script>

            <style>
                @font-face {
                    font-family: 'NotoSansKR';
                    src: url('font/NotoSansKR-Black.otf') format('opentype')
                }

                @font-face {
                    font-family: 'J송명';
                    src:
                        url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/JSongMyung-Regular-KO.woff2') format('woff2');
                    font-weight: normal;
                    font-style: normal;
                }

                @font-face {
                    font-family: '교보손글씨';
                    src:
                        url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/KyoboHandwriting2020A.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;
                }

                @font-face {
                    font-family: '빙그레싸만코체';
                    src:
                        url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/BinggraeSamanco-Bold.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;
                }

                @font-face {
                    font-family: '주아체';
                    src:
                        url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;
                }

                @font-face {
                    font-family: '한림고딕체';
                    src:
                        url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2204@1.0/HallymGothic-Regular.woff2') format('woff2');
                    font-weight: 400;
                    font-style: normal;
                }

                @font-face {
                    font-family: '둥근모꼴체';
                    src:
                        url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;
                }

                * {
                    box-sizing: border-box;
                }

                div {
                    border: 1px solid black;
                }

                .b_contents,
                .bcm_contents {
                    overflow: hidden;
                }
            </style>
            <script>


                $(function () {

                    $(".updateBoardComment").on("click", function () {
                        $(this).closest(".boardComment").find(".bcm_content").attr("contenteditable","true");;

                        $(this).closest(".boardComment").find(".updateBoardComment,.deleteBoardComment").css("display", "none");

                        let btnUpdateBComment = $("<button>");
                        btnUpdateBComment.text("수정완료");
                        btnUpdateBComment.addClass("btn");
                        btnUpdateBComment.attr("type", "button");


                        btnUpdateBComment.addClass("updcmbtn");


                        btnUpdateBComment.css("margin-right", "5px");

                        let btnCancelBCommentU = $("<button>");
                        btnCancelBCommentU.attr("type", "button");
                        btnCancelBCommentU.text("취소");
                        btnCancelBCommentU.addClass("btn");
                        btnCancelBCommentU.on("click", function () {
                            location.reload();
                        });

                        $(this).closest(".cbtns").append(btnUpdateBComment);
                        $(this).closest(".cbtns").append(btnCancelBCommentU);

                    })
                    $(document).on("click", ".updcmbtn", function () {
                        let bcm_seq = $(this).closest(".boardComment").find(".bcm_content").attr("bcm_seq");
                        let bcm_content = $(this).closest(".boardComment").find(".bcm_content").html();
                        console.log(bcm_seq + ":" + bcm_content);
                        $.ajax({
                            url: "/updateBoardComment.boardcomment",
                            datatype: "post",
                            data: {
                                "bcm_seq": bcm_seq,
                                "bcm_content": bcm_content
                            }
                        }).done(function (res) {
                            location.reload();
                        })

                    })

                })
            </script>
        </head>

        <body>
            <div class="container">
                <div class="b_contents">
                    <div class="row b_contents_header1">
                        <div class="col-lg-4 col-md-4 col-sm-4">${dto.b_category}</div>
                        <div class="col-lg-8 col-md-8 col-sm-8" id="b_title" name="b_title" size="129"
                            contenteditable="false"> ${dto.b_title }</div>
                    </div>
                    <div class="row b_contents_header2">
                        <div class="col-lg-6 col-md-6 col-sm-6">${dto.b_writer}</div>
                        <div class="col-lg-4 col-md-4 col-sm-4">${dto.b_write_date}</div>
                        <div class="col-lg-2 col-md-2 col-sm-1">${dto.b_view_count }</div>
                    </div>

                    <div class="row b_contents_body">
                        <div class="col-lg-12 col-md-12 col-sm-12" id="summernote" name="b_content" cols="131" rows="15"
                            contenteditable="false">${dto.b_content }
                        </div>
                    </div>
                    <div class="row b_contents_footer">
                        <c:choose>
                            <c:when test="${loginNickname == dto.b_writer}">
                                <div class="btns col-lg-12 col-md-12 col-sm-12">
                                    <a href="/beforeUpdateBoardContents.board?b_seq=${dto.b_seq }"><button type="button"
                                            id="updateBoardContents" name="updateBoardContents">수정하기</button></a>&nbsp
                                    <a href="/deleteBoardContents.board?b_seq=${dto.b_seq }"><button type="button"
                                            class="btn" id="deleteBoardContents"
                                            name="deleteBoardContents">삭제하기</button></a> &nbsp
                                    <a href="/boardList.board"><button type="button" id="toList"
                                            name="toList">목록으로</button></a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <a href="#" id="insertBoardComplain">신고</a>
                                </div>
                                <div class="btns col-lg-6 col-md-6 col-sm-6">
                                    <a href="/boardList.board?cpage=${boardPage }"><button type="button" id="back"
                                            name="back">목록으로</button></a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="bcm_contents">
                    <input type="hidden" id="b_seq" name="b_seq" value="${dto.b_seq }">
                    <c:choose>
                        <c:when test="${empty list}">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    댓글이 없습니다.
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="comment" items="${list}">
                                <div class="row">
                                    <input type="hidden" class="bcm_seq" name="bcm_seq" value="${comment.bcm_seq }">
                                    <div class="bcm_writer col-lg-6 col-md-6 col-sm-6">${comment.bcm_writer }</div>
                                    <div class="bcm_write_date col-lg-6 col-md-6 col-sm-6" name="bcm_write_date">
                                        ${comment.bcm_write_date }</div>
                                </div>
                                <div class="row boardComment">
                                    <div class="bcm_content col-lg-9 col-md-9 col-sm-9" name="bcm_content" size="105"
                                        bcm_seq="${comment.bcm_seq }" contenteditable="false">${comment.bcm_content }
                                    </div>
                                    <c:choose>
                                        <c:when test="${loginNickname == comment.bcm_writer}">
                                            <div class="cbtns col-lg-3 col-md-3 col-sm-3">
                                                <button type="button" class="updateBoardComment"
                                                    name="updateBoardComment">댓글수정</button>&nbsp
                                                <a
                                                    href="/deleteBoardComment.boardcomment?bcm_seq=${comment.bcm_seq }&b_seq=${dto.b_seq}">
                                                    <button type="button" class="deleteBoardComment"
                                                        name="deleteBoardComment">댓글삭제</button>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-lg-3 col-md-3 col-sm-3"><a
                                                    href="insertBoardCommentComplain.boardcommentcomplain">신고</a></div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                        <div class="row insertBcm">
                            <input type="hidden" id="b_seq" name="b_seq" value="${dto.b_seq }">
                            <div class="col-lg-9 col-md-9 col-sm-9" class=>
                                <input type="text" id="insertBcm_content" name="insertBcm_content"
                                    placeholder="내용을 입력하세요." style="border:none; width:100%;">
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3"><button id="insertBoardComment">댓글작성</button></div>
                        </div>
                </div>
                <script>
                    $("#insertBoardComplain").on("click", function () {
                        if (confirm("${dto.b_writer}님의 글 ${dto.b_title}을 신고하시겠습니까?")) {
                            $.ajax({
                                url: "/insertBoardComplain.boardcomplain",
                                datatype: "post",
                                data: {
                                    "b_seq": "${dto.b_seq }",
                                    "b_writer": "${dto.b_writer}",
                                    "b_title": "${dto.b_title}",
                                    "b_content": '${dto.b_content}'
                                }
                            })
                        }
                    });
                    $("#insertBoardCommentComplain").on("click", function () {
                        if (confirm("${comment.bcm_writer}님의 댓글을 신고하시겠습니까?")) {
                            $.ajax({
                                url: "/insertBoardCommentComplain.boardcommentcomplain",
                                datatype: "post",
                                data: {
                                    "bcm_seq": "${comment.bcm_seq }",
                                    "bcm_writer": "${comment.bcm_writer}",
                                    "bcm_content": "${comment.bcm_content}",
                                    "b_seq": "${dto.b_seq}"
                                }
                            })
                        }
                    });
                    $("#insertBoardComment").on("click", function(){
                    	var bcm_content = $("#insertBcm_content").val();
                        var b_seq = $("#b_seq").val();
                        $.ajax({
                            url: "/insertBoardComment.boardcomment",
                            type: "post",
                            data: {
                                "bcm_content": bcm_content,
                                "b_seq" : b_seq
                            }
                         })
                        location.href="/selectBoardContents.board?b_seq="+b_seq;
                        });
                </script>
        </body>

        </html>