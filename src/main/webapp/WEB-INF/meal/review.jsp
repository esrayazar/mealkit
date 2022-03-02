<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Review</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"
	integrity="sha512-yFjZbTYRCJodnuyGlsKamNE/LlEaEAxSUDe5+u61mV8zzqJVFOH7TnULE2/PP/l5vKWpUNnF4VGVkXh3MjgLsg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
	<link href="/css/review.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid justify-content-end">
			<a class="navbar-brand"
				href="/profile/${not empty userId ? userId : user.id}">MyMealKit</a>
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

					<li class="nav-item"><a class="nav-link "
						href="/profile/${not empty userId ? userId : user.id}">(${user.firstName})</a>
					<li class="nav-item"><a class="nav-link " href="/logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>


<div class="top" style="padding-top: 10%;">
	<div class="mealname">
	<c:out value="${mealId.strMeal}"></c:out><br>
	</div>
	<%-- Instructions: <c:out value="${mealId.strInstructions}"></c:out><br> --%>
	<img src="${mealId.strMealThumb}" height="128" width="128"> <br>
	<iframe width="420" height="315"
		src="https://www.youtube.com/embed/${mealId.strYoutubeVideoID}">
	</iframe>
	<p><a href="${mealId.strYoutube}" target="_blank">Watch on YouTube</a></p>
	
	<p><strong>Nationality:</strong> <c:out value="${mealId.strArea}"></c:out></p>
	<p><strong>Ingredients:</strong> ${mealId.strIngredient1}, ${mealId.strIngredient2}, ${mealId.strIngredient3}, ${mealId.strIngredient4}</p>
	<p><strong>Instructions:</strong> <c:out value="${mealId.strInstructions}"></c:out></p>
	<p><strong>Reference: </strong><a href="${mealId.strSource}"><c:out value="${mealId.strSource}"></c:out></a></p>



<h1>Review</h1>
	<form:form action="/createReviews" method="post" modelAttribute="PostAReview">
		<form:input path="reviewedBy" type="hidden" value="${userId}"/>
		<form:input path="reviewedMeal" type="hidden" value="${mealId.id}"/>
		<form:label path="review"></form:label>
		<form:errors path="review"/>
		<form:textarea id="reviewArea" path="review"/><br>
		<input id="postButton" type="submit" value="Post review"/>
	</form:form>
	</div>
	
</body>
</html>