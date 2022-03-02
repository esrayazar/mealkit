<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Home</title>
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
<link href="/css/details.css" rel="stylesheet" type="text/css">
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





	<div class="container" style="padding-top: 10%;">
		<div class="row text-center">
			<h3>Hungry yet?</h3>
			<a href="/details"><button class="randommeal col-4 mx-auto"
					id="meal">Try a different meal!</button></a>
		</div>
		<hr>
		<div class="row">
			<h3>${meal.strMeal}</h3>
			<p>
				<strong>Category:</strong> ${meal.strCategory} <strong>Area:</strong>
				${meal.strArea}
			</p>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<div class="row">
					<img src="${meal.strMealThumb}" width=256 height=256>
				</div>
				<div class="row">Liked by ${meal.likers.size()} User(s)</div>
				<div class="row">Favorite by ${meal.favorites.size()} User(s)</div>
				<div class="row">
					<div class="col">
						<c:choose>
							<c:when test="${meal.likers.contains(user)}">
								<a href="/${meal.idMeal}/unlike"><i
									class="fa-regular fa-thumbs-down fa-2x"></i> </a>
							</c:when>
							<c:otherwise>
								<a href="/${meal.idMeal}/like"><i
									class="fa-regular fa-thumbs-up fa-2x"></i> </a>

							</c:otherwise>
						</c:choose>
					</div>
					<div class="col">
						<c:choose>
							<c:when test="${meal.favorites.contains(user)}">
								<a href="/${meal.idMeal}/removeFavorite"> <i
									class="fa-solid fa-heart fa-2x"></i>
								</a>
							</c:when>
							<c:otherwise>
								<a href="/${meal.idMeal}/addFavorites"> <i
									class="fa-regular fa-heart fa-2x"></i>
								</a>

							</c:otherwise>
						</c:choose>
					</div>
					<div class="col">
					<a href="/addReview/${meal.idMeal}"><i
						class="fa-solid fa-comments fa-2x"></i></a>
					</div>
					

				</div>



			</div>
			<div class="col">
				<h3>Ingredients:</h3>
				<ul>
				<c:if test="${not empty meal.strMeasure1.trim()}">
				<li>${meal.strMeasure1} ${meal.strIngredient1}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure2.trim()}">
				<li>${meal.strMeasure2} ${meal.strIngredient2}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure3.trim()}">
				<li>${meal.strMeasure3} ${meal.strIngredient3}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure4.trim()}">
				<li>${meal.strMeasure4} ${meal.strIngredient4}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure5.trim()}">
				<li>${meal.strMeasure5} ${meal.strIngredient5}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure6.trim()}">
				<li>${meal.strMeasure6} ${meal.strIngredient6}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure7.trim()}">
				<li>${meal.strMeasure7} ${meal.strIngredient7}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure8.trim()}">
				<li>${meal.strMeasure8} ${meal.strIngredient8}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure9.trim()}">
				<li>${meal.strMeasure9} ${meal.strIngredient9}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure10.trim()}">
				<li>${meal.strMeasure10} ${meal.strIngredient10}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure11.trim()}">
				<li>${meal.strMeasure11} ${meal.strIngredient11}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure12.trim()}">
				<li>${meal.strMeasure12} ${meal.strIngredient12}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure13.trim()}">
				<li>${meal.strMeasure13} ${meal.strIngredient13}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure14.trim()}">
				<li>${meal.strMeasure14} ${meal.strIngredient14}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure15.trim()}">
				<li>${meal.strMeasure15} ${meal.strIngredient15}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure16.trim()}">
				<li>${meal.strMeasure16} ${meal.strIngredient16}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure17.trim()}">
				<li>${meal.strMeasure17} ${meal.strIngredient17}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure18.trim()}">
				<li>${meal.strMeasure18} ${meal.strIngredient18}</li>
				</c:if>
				 <c:if test="${not empty meal.strMeasure19.trim()}">
				<li>${meal.strMeasure19} ${meal.strIngredient19}</li>
				</c:if>
				<c:if test="${not empty meal.strMeasure20.trim()}">
				<li>${meal.strMeasure20} ${meal.strIngredient20}</li>
				</c:if>
				</ul>
			</div>
		</div>
<hr>
<div class="row">
<h3>How to prepare: </h3>
</div>
		<div class="row">
		<div class="col-sm-5 text-center">
			<iframe width="420" height="315"
				src="https://www.youtube.com/embed/${meal.strYoutubeVideoID}">
			</iframe>
			<a href="${meal.strYoutube}" target="_blank">Watch on YouTube</a>
		</div>
		<div class="col"><strong>Instructions:</strong> ${meal.strInstructions}</div>
		</div>





		





	</div>

<hr>
<div class="footer">-</div>




	<!-- Meal image -->

	<!-- End of Image -->

	<!-- This is for embedded Youtube videos -->










	<script src="/js/home.js"></script>
</body>
</html>