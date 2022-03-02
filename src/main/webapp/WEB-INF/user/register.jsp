<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<script src="/js/flip.js"></script>
</head>
<body>
	<div class="container">
		<div class="card">
			<div class="box" id="card">
				<div class="card-front">
					<a href="/login">Already have an account? Sign up</a>
					<form:form action="/register" method="post"
						modelAttribute="registration">
						<p>
							<form:label path="firstName">Name:</form:label>
							<form:errors path="firstName" class="text-danger" />
							<form:input path="firstName" />
						</p>
						<p>
							<form:label path="email">Email:</form:label>
							<form:errors path="email" class="text-danger" />
							<form:input path="email" />
						</p>
						<p>
							<form:label path="password">Password:</form:label>
							<form:errors path="password" class="text-danger" />
							<form:input path="password" type="password" />
						</p>
						<p>
							<form:label path="confirm_password">Confirm Password:</form:label>
							<form:errors path="confirm_password" class="text-danger" />
							<form:input path="confirm_password" type="password" />
						</p>
						<input class="btn" type="submit" value="Submit" />
						
					</form:form>

					<input class="btn" type="button" value="I have an account!"
						onclick="openRegister()" />
							<h3>Sign in with social media</h3>
	<a href="">Facebook</a>
	<a href="">Instagram</a>
	<a href="">Twitter</a>
				</div>
				
				<div class="card-back">

					<h2>Log In</h2>
					<form action="/login" method="post">
						<p class="text-danger">
							<c:out value="${error}" />
						</p>
						<p>
							<label>Email:</label> <input name="email" />
						</p>
						<p>
							<label>Password:</label> <input name="password" type="password" />
						</p>
						<button class="btn-signin" type="submit">Sign in</button>
					</form>
					<button class="btn" onclick="openLogin()">I am new here</button>

				</div>
			</div>
		</div>
	</div>

	



</body>
</html>