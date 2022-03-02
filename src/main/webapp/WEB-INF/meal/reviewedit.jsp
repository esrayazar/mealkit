<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Edit your Reviews</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="/js/home.js"></script>
<link href="/css/edit.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid justify-content-end">
			<c:choose>
			<c:when test="${not empty user}">
			<a class="navbar-brand"
				href="/profile/${user.id}">MyMealKit</a>
			</c:when>
			<c:otherwise>
			<a class="navbar-brand"
				href="/">MyMealKit</a>
			</c:otherwise>
			</c:choose>
			
				
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarBasic"
				aria-controls="navbarBasic" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse show" id="navbarBasic">
				<ul class="navbar-nav me-auto mb-2 mb-xl-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/">Home</a></li>

					<li class="nav-item form-control">
						<form action="/searchByCountry" method="get">
							<select name="country">
								<c:forEach items="${apiAreas.areas}" var="area">
									<option value="${area.strArea}">${area.strArea}</option>
								</c:forEach>

							</select>
							<button class="btn" type="submit">Get Meal List</button>
						</form>

					</li>
				</ul>
			</div>
			<div class="collapse navbar-collapse show">
				<form action="/search" method="get">
					<input name="term"> <select name="by">
						<option value="name">by food name</option>
						<option value="ing">by ingredients</option>
					</select>
					<button class="search" type="submit">Search</button>
				</form>
			</div>
			<div class="collapse navbar-collapse show" id="navbarBasic2">
				<ul class="navbar-nav me-auto mb-2 mb-xl-0">

					<c:if test="${empty user}">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="/register">Sign up</a></li>
						<li class="nav-item"><a
							class="nav-link .text-decoration-underline" href="/login">Sign
								in</a></li>
					</c:if>
					<c:if test="${not empty user}">
						<li class="nav-item"><a class="nav-link "
							href="/profile/${user.id}">(${user.firstName})</a>
						<li class="nav-item"><a class="nav-link " href="/logout">Logout</a>
						</li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>

<div class="wrapper"></div>
<h1>My Review:</h1>
	<form:form action="/update/${review.id}/review" method="post" modelAttribute="Edit">
		<form:input path="reviewedBy" type="hidden" value="${review.reviewedBy.id}"/>
		<form:input path="reviewedMeal" type="hidden" value="${review.reviewedMeal.id}"/>
		<form:label path="review"></form:label>
		<form:errors path="review"/>
		<form:textarea id="myTextArea" path="review" value="${review.review}"/><br>
		<input type="submit" value="Post review"/>
	</form:form>
	
	<script>
  
     document.getElementById("myTextArea").value = "${review.review}";
</script>
</div>
</body>
</html>