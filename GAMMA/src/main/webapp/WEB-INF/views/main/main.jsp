<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/styles.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/styles.css" />
<style>
 .proImg{
 text-align:center;
 }
 .imgPro{
 width: 150px;
	height: 150px;
	padding:0;
	margin:0;
 }
 .uid{
 	 position: relative;
 	 top:10px;
	font-weight:bold;
	color:white;
 }
</style>
</head>
<body>
    <div class="display">
      <!-- side-bar -->
      <div class="side-bar">
        <!-- logo -->
        <div class="side-bar__row">
          <!-- 클릭하면 main화면으로 돌아오도록 a 태그 수정 -->
          <span
            ><a href="#"><img src="/resources/css/image/logo.png" /></a
          ></span>
        </div>
        <!-- search -->
        <div class="side-bar__row">
          <form action="#" method="get">
            <input type="text" placeholder="   Search Game" />
            <!-- origin처럼 버튼 숨겼음, enter 치면 검색됨 -->
            <input type="submit" value="" />
          </form>
        </div>
        <!-- category -->
        <div class="side-bar__row">
          <span><a href="#">게임 스토어</a></span>
          <span><a href="#">라이브러리</a></span>
        </div>
        <!-- qna -->
        <div class="side-bar__row">
          <span><a href="#">Q&A</a></span>
          &nbsp;&nbsp;|&nbsp;&nbsp;
          <span><a href="#">자주하는 질문</a></span>
        </div>
        <!-- about user -->
        <div class="side-bar__row">
          <!-- c:if로 로그인 전에는 회원가입+로그인 / 로그인 후에는 프로필 -->
         <c:if test="${member == null }">
          <span><a href="#" class="loginA"  onclick="openLogin">로그인</a></span>
          <span><a href="#" class="joinA"  onclick="openJoin">가입하기</a></span>
          
          </c:if>
          <c:if test="${member != null }">
          <div class="proImg">
          <div>
          <p class="uId">${member.nickname }(${member.cid  })</p>
          </div>
          <img class="imgPro" src="/resources/css/image/chaIcon.png"/>
          
          <div>
   				<a href="/user/userGet">유저정보창</a>
   				<a href="/user/userDelete">탈퇴창</a>
   				</div>
          </div>
   				
        </c:if>
        </div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
            <!-- 여기에 각자 content 붙여넣기 -->
          </div>
        </div>
        <div class="footer">
          <div class="footer-info">
            <div>CREATORS&nbsp;&nbsp;김영훈, 김지우, 조훈현, 최재인</div>
            <div>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
            <div>
              CONTACT&nbsp;&nbsp;<a href="https://github.com/GITJIWOO"
                >https://github.com/GITJIWOO</a
              >
            </div>
          </div>
          <div class="footer-copyright">
            <div>Copyright © GAMMA All right reserved.</div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".loginA").on("click", function() {
			location.href = "/user/userLogin";
		})
		$(".joinA").on("click", function() {
			location.href = "/user/userJoin";
		})
	});
    
    </script>
</body>
</html>