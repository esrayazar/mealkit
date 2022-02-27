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
					<button class="btn" onclick="backToRegister()">flip it to register</button>
					
				</div>



				<div class="card-back">
						
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
							<form:label path="password">Password</form:label>
							<form:errors path="password" class="text-danger" />
							<form:input path="password" type="password" />
						</p>
						<p>
							<form:label path="confirm_password">Confirm Password</form:label>
							<form:errors path="confirm_password" class="text-danger" />
							<form:input path="confirm_password" type="password" />
						</p>
						<input class="btn" type="submit" value="Submit" />
					</form:form>
						<input class="btn" type="submit" value="I have an account"
						onclick="openRegister()" />
				</div>
					
					
				</div>
			</div>
		</div>

	
	
	<script src="/js/flip.js"></script>
	
	
	
</body>
</html>