<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
<head>
<meta charset="UTF-8">
<title>userLogin</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	text-align: center;
}

form {
	text-align: center;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
}

.main {
	position: relative;
	bottom: 25px;
	font-weight: bold;
}

.border {
	margin: 0 auto;
	width: 380px;
	height: 440px;
	border: 1px solid #000;
	border-radius: 10%;
}

.border2 {
	margin: 0 auto;
	width: 230px;
	height: 350px;
	border: 1px solid #000;
	border-radius: 10%;
}

img {
	width: 150px;
	height: 150px;
}

#checkB {
	display: flex;
	flex-flow: row;
}

input {
	
}
#lo{
	
}

#IPvalue {
	font-family: 'Cafe24Ssurround';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

button {
	width: 150px;
	height: 40px;
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #212529;
	color: #fff;
	margin-top: 20px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}
</style>
</head>
<body>
	<div class="loginDeniedAlert">
		<h2>
			<c:out value="${error }" />
		</h2>
		<h2>
			<c:out value="${logout }" />
		</h2>
	</div>
	<form action="/login" method="post">
		<div class="border">
			<img src="/resources/css/image/mainIcon.png" />
			<div class="main">
				<h1 class="IPvalue">로그인</h1>
				<div>
					<label class="IPvalue" for="cid">아이디</label><br /> <input
						type="text" id="cid" name="username" />
				</div>
				<br />
				<div>
					<label class="IPvalue" for="password">비밀번호</label><br /> <input
						type="password" id="password" name="password" />
				</div>
				<br />
				<!-- 체크하면 7일간 로그인 유지됨 -->
				<label class="lo"><input type="checkbox"  name="remember-me">로그인 상태 유지 </label><br/>
				<button type="submit" value="LOGIN">로그인</button>
					<input type="hidden"
					name="${_csrf.parameterName }" value="${_csrf.token }" />
					
			</div>
		</div>
	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#logoutBtn").on("click", function() {
				location.href = "user/userLogout";
			})

			$("#registerBtn").on("click", function() {
				location.href = "user/userJoin";
			})
			$("#findpwBtn").on("click", function() {
				location.href = "user/findpw";
			})

			$("#userUpdateBtn").on("click", function() {
				location.href = "user/userModify";
			})

			$("#usererDeleteBtn").on("click", function() {
				location.href = "user/userDelete";
			})

		})
	</script>
</body>
</html>
