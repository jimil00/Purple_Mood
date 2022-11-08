<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignIn</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
<style>
        * {
            box-sizing: border-box;
        }
        /* body{
            background-color: #39065A;
        } */

        div {
            /* border: 1px solid black; */
        }
        .container{
            border: 1px solid black;
            border-radius: 5px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            padding: 50px;
        }

        .logo{
            margin-bottom: 31px;
        }
        #logoimg{
            width: 200px;
            height: 100px;
            position: relative;
            left: 50%;
            transform: translateX(-55%);
        }
        
        .logintextbox{
            padding: 0px;
            text-align: center;
            
        }
        .idtextbox,.pwtextbox{
            height: 50px;
            border: 1px solid black;
            border-radius: 5px;
        }
        .logintext{
            width: 90%;
            height: 100%;
            border: none;
        }
        
        .loginbtn,.signupbox{
            height: 50px;
            text-align: center;
        }
        #loginbtn{
            width: 250px;
            height: 30px;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }
        .signupbox,.loginbtnbox,.loginbox{
            margin-top: 10px;
        }
        .signup{
            line-height: 50px;
        }
       
        a{
            text-decoration: none;
            color: black;
        }
        button{
            border: none;
            border-radius: 5px;
        }
        </style>
</head>
<body>
  <form action="/signin.member" method="post">
    <div class="container w-50" style="min-width:350px;max-width: 400px;">
        <div class="logo row">
            <img src="" id="logoimg" alt="">
        </div>
        <div class="loginbox row">
            <div class="logintextbox col-12">
                <div class="col-12 idtextbox">
                    <i class="fa-solid fa-user icon"></i>
                    <input type="text" name="id" class="logintext" placeholder="아이디">
                </div>
                <div class="col-12 pwtextbox">
                    <span><i class="fa-solid fa-unlock-keyhole icon"></i></span>
                    <input type="text" name="pw" class="logintext" placeholder="비밀번호">
                </div>
            </div>
        </div>
        <div class="row loginbtnbox">
             <div class="loginbtn col-12">
                <button id="loginbtn">로그인</button>
            </div>
        </div>
        </form>
        <div class="signupbox row">
            <div class="col-12"><a href="/member/signup.jsp" class="signup">회원가입</a> | <a href="#">아이디&비밀번호찾기</a></div>
        </div>
    </div>
</body>
</html>