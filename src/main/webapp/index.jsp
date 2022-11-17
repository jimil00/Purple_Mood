<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>summernoteselect</title>

            <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
                crossorigin="anonymous" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css" rel="stylesheet">


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

                body {
                    background-color: #03001e;
                }

                div {
                    border: 1px solid black;
                }

                .container {
                    background-color: white;
                    width: 70vw;
                }

                .header {
                    border-bottom: 7px solid #7303c0;
                }

                .b_contents,
                .bcm_contents {
                    overflow: hidden;
                }
            </style>
            <script>


                $(function () {
                    $("#insertBoardComment").on("click", function () {

                        var bcm_content = $("#insertBcm_content").val();
                        var b_seq = $("#b_seq").val();
                        var b_title = $("#b_title").html();
                        $.ajax({
                            url: "/insertBoardComment.boardcomment",
                            type: "post",
                            data: {
                                "bcm_content": bcm_content,
                                "b_seq": b_seq,
                                "b_title": b_title
                            }
                        })
                        location.href = "/selectBoardContents.board?b_seq=" + b_seq;
                    });

                    $(".updateBoardComment").on("click", function () {
                        $(this).closest(".boardComment").find(".bcm_content").attr("contenteditable", "true");;

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
                        let bcm_seq = $(this).closest(".boardComment").find(".bcm_seq").val();
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
                    <div class="b_contents_header">
                        <div class="row b_contents_header1">
                            <div class="col-12">${dto.b_category}</div>
                        </div>
                        <div class="row b_contents_header2">
                            <div class="col-12 fs-4" id="b_title" name="b_title" contenteditable="false">${dto.b_title }
                            </div>
                            <script>
                                $("#b_title").text($("#b_title").html());
                            </script>
                        </div>
                        <div class="row b_contents_header2">
                            <div class="col-lg-8 col-md-8 col-sm-8 col-8 text-end">${dto.b_writer_nn}</div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-4">${dto.b_write_date}</div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-">조회수 &nbsp ${dto.b_view_count }</div>
                        </div>
                    </div>
                    <hr style="border: 10px solid #25003d">
                    <div class="row b_contents_body">
                        <div class="col-lg-12 col-md-12 col-sm-12 " id="summernote" name="b_content" cols="131"
                            rows="15" contenteditable="false">${dto.b_content }</div>
                    </div>
                    <div class="row b_contents_footer">
                        <c:choose>
                            <c:when test="${loginID == dto.b_writer_id}">
                                <div class="btns col-lg-12 col-md-12 col-sm-12 text-end">
                                    <a href="/beforeUpdateBoardContents.board?b_seq=${dto.b_seq }"><button type="button"
                                            id="updateBoardContents" name="updateBoardContents">수정하기</button></a>&nbsp
                                    <a href="/deleteBoardContents.board?b_seq=${dto.b_seq }"><button type="button"
                                            id="deleteBoardContents" name="deleteBoardContents">삭제하기</button></a>&nbsp
                                    <a href="/boardList.board?cpage=${boardPage }"><button type="button" id="toList"
                                            name="toList">목록으로</button></a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="complain col-12 text-start">
                                    <a href="#" id="insertBoardComplain">글신고</a>
                                    <script>
                                        $("#insertBoardComplain").on("click", function () {
                                            if (confirm("${dto.b_writer_nn}님의 글 ${dto.b_title}을 신고하시겠습니까?")) {
                                                $.ajax({
                                                    url: "/insertBoardComplain.boardcomplain",
                                                    datatype: "post",
                                                    data: {
                                                        "b_seq": "${dto.b_seq }",
                                                        "b_writer_id": "${dto.b_writer_id}",
                                                        "b_writer_nn": "${dto.b_writer_nn}",
                                                        "b_title": "${dto.b_title}",
                                                        "b_content": '${dto.b_content}'
                                                    }
                                                })
                                            }
                                        });

                                    </script>
                                </div>
                                <div class="btns col-12 text-end">
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
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                댓글이 없습니다.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="comment" items="${list}">
                                <div class="row boardCommentHeader">
                                    <div class="class col-12 text-end">
                                        <div class="bcm_writer_nn">${comment.bcm_writer_nn}</div><div class="bcm_write_date" name="bcm_write_date">${comment.bcm_write_date }</div>
                                    </div>
                                </div>
                                <div class="row boardComment">
                                    <input type="hidden" class="bcm_seq" name="bcm_seq" value="${comment.bcm_seq }">
                                    <input type="hidden" class="bcm_writer_id" name="bcm_writer_id"
                                        value="${comment.bcm_writer_id }">
                                    <div class="badge bg-primary text-wrap text-end" style="width: 6rem;">
                                        <div class="bcm_content col-12" name="bcm_content" size="105"
                                            contenteditable="false">${comment.bcm_content }</div>
                                    </div>
                                    <script>
                                        $(".bcm_content").text($(".bcm_content").html());
                                    </script>
                                    <c:choose>
                                        <c:when test="${loginID == comment.bcm_writer_id}">
                                            <div class="cbtns col-12 text-end">
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
                                            <div class="col-12 text-start"><a href="#"
                                                    id="insertBoardCommentComplain">신고</a></div>
                                            <script>
                                                let bcm_seq = $(this).closest(".boardComment").find(".bcm_seq").val();
                                                let bcm_writer_id = $(this).closest(".boardComment").find(".bcm_writer_id").val();
                                                let bcm_writer_nn = $(this).closest(".boardComment").find(".bcm_writer_nn").html();
                                                let bcm_content = $(this).closest(".boardComment").find(".bcm_content").html();
                                                let b_seq = $(this).closest(".bcm_contents").find(input).val();
                                                $("#insertBoardCommentComplain").on("click", function () {
                                                    let bcm_seq = $(this).closest(input).val()
                                                    if (confirm("${comment.bcm_writer_nn}님의 댓글을 신고하시겠습니까?")) {
                                                        $.ajax({
                                                            url: "/insertBoardCommentComplain.boardcommentcomplain",
                                                            datatype: "post",
                                                            data: {
                                                                "bcm_seq": bcm_seq,
                                                                "bcm_writer_id": bcm_writer_id,
                                                                "bcm_writer_nn": bcm_writer_nn,
                                                                "bcm_content": bcm_content,
                                                                "b_seq": b_seq
                                                            }
                                                        })
                                                    }
                                                });
                                            </script>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    <div class="row insertBcm">
                        <input type="hidden" id="b_seq" name="b_seq" value="${dto.b_seq }">
                        <div class="col-8 col-sm-8 col-md-9 col-lg-10">
                            <input type="text" id="insertBcm_content" name="insertBcm_content" placeholder="내용을 입력하세요."
                                maxlength="300" style="border:none; width:100%;">
                            <script>
                                $('#insertBcm_content').keyup(function () {
                                    let content = $(this).val();

                                    // 글자수 세기
                                    if (content.length == 0 || content == '') {
                                        $('.textCount').text('0자');
                                    } else {
                                        $('.textCount').text(content.length + '자');
                                    }

                                    // 글자수 제한
                                    if (content.length > 199) {
                                        // 199자 부터는 타이핑 되지 않도록
                                        $(this).val($(this).val().substring(0, 200));
                                        // 99자 넘으면 알림창 뜨도록
                                        alert('글자수는 199자까지 입력 가능합니다.');
                                    };
                                });
                            </script>
                        </div>
                        <div class="col-4 col-sm-4 col-md-3 col-lg-2 text-center"><button
                                id="insertBoardComment">댓글작성</button></div>
                    </div>
                </div>

        </body>

        </html>