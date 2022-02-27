<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<title>Log in</title>
</head>
<body>

	<div class="container">
		<div class="card">
			<div class="box" id="card">
				<div class="card-front">
					<h2>Log In</h2>
					<form action="/login" method="post">
						<p class="valid">
							<c:out value="${error}" />
						</p>
						<p>
							<input name="email" class="input-box" placeholder="Enter your email"/>
						</p>
						<p>
							<input name="password" class="input-box" type="password" placeholder="Enter your password" />
						</p>
						<button class="btn">Submit</button>
					</form>
					<c:choose>
						<c:when test="${!login}">
							<button class="btn" onclick="openLogin()">I am new here</button>
						</c:when>
						<c:otherwise>
							<a class="btn" href="/register">I am new here</a>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
	</div>
	
	<script>
		var card = document.getElementById("card");
			function openRegister(){
				card.style.transform = "rotateY(-180deg)";
		}
			function openLogin(){
				card.style.transform = "rotateY(0deg)";
		}
	</script>

</body>
</html>