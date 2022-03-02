<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/details.css" rel="stylesheet" type="text/css">
<title>Home</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"
	integrity="sha512-yFjZbTYRCJodnuyGlsKamNE/LlEaEAxSUDe5+u61mV8zzqJVFOH7TnULE2/PP/l5vKWpUNnF4VGVkXh3MjgLsg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>
	<a href="">Contact us</a> |
	<a href="/register">Sign up</a> |
	<a href="/login">Sign in</a>
	<hr>
	<div class="container">
		<div class="row">
			<form action="/searchByCountry" method="get">
				<select name="country">
					<c:forEach items="${apiAreas.areas}" var="area">
						<option value="${area.strArea}">${area.strArea}</option>
					</c:forEach>

				</select>
				<button class="" type="submit">SUBMIT</button>
			</form>
		</div>


		<div class="row text-center">
			<h3>Feeling hungry?</h3>

			<a href="/details"><button class="randommeal" id="meal">Get a
					random meal</button></a>

		</div>

		<div class="row">
		<h3>${meal.strMeal}</h3>
		</div>
		

		
		Drink Alternate: ${meal.strDrinkAlternate} <br/>
		Category: ${meal.strCategory} <br/>
		Area: ${meal.strArea} <br/>
	 	Instructions: ${meal.strInstructions} <br/>
	 	<div class="video"> 
	 		 		<iframe width="420" height="315"
					src="https://www.youtube.com/embed/${meal.strYoutubeVideoID}">
		</iframe>
		<a href="${meal.strYoutube}" target="_blank">Watch on YouTube</a>
			  <div class="list">
	 <h3>Ingredients:</h3>
	 ${meal.strMeasure1} ${meal.strIngredient1} <br/>
	 ${meal.strMeasure2} ${meal.strIngredient2} <br/>
	 ${meal.strMeasure3} ${meal.strIngredient3} <br/>
	 ${meal.strMeasure4} ${meal.strIngredient4} <br/>
	 ${meal.strMeasure5} ${meal.strIngredient5} <br/>
	 ${meal.strMeasure6} ${meal.strIngredient6} <br/>
	 ${meal.strMeasure7} ${meal.strIngredient7} <br/>
	 ${meal.strMeasure8} ${meal.strIngredient8} <br/>
	 ${meal.strMeasure9} ${meal.strIngredient9} <br/>
	 ${meal.strMeasure10} ${meal.strIngredient10} <br/>
	 ${meal.strMeasure11} ${meal.strIngredient11} <br/>
	 ${meal.strMeasure12} ${meal.strIngredient12} <br/>
	 ${meal.strMeasure13} ${meal.strIngredient13} <br/>
	 ${meal.strMeasure14} ${meal.strIngredient14} <br/>
	 ${meal.strMeasure15} ${meal.strIngredient15} <br/>
	 ${meal.strMeasure16} ${meal.strIngredient16} <br/>
	 ${meal.strMeasure17} ${meal.strIngredient17} <br/>
	 ${meal.strMeasure18} ${meal.strIngredient18} <br/>
	 ${meal.strMeasure19} ${meal.strIngredient19} <br/>
	 ${meal.strMeasure20} ${meal.strIngredient20} <br/>

	</div>
		</div>
	 	
	<div class="interact">
	 <div class="bottomrow">
	 	<div class="bottomrow">
	Liked by ${meal.likers.size()} User(s)
	</div>
	<div class="bottomrow">
	Favorited by ${meal.favorites.size()} User(s)
	</div>
			<c:choose>
				<c:when test="${meal.likers.contains(user)}">
					<a class="symbol" href="/${meal.idMeal}/unlike"><i
						class="fa-regular fa-thumbs-down fa-2x"></i>
					</a>
				</c:when>
				<c:otherwise>
					<a class="symbol" href="/${meal.idMeal}/like"><i
						class="fa-regular fa-thumbs-up fa-2x"></i>
					</a>

				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="bottomrow">
			<c:choose>
				<c:when test="${meal.favorites.contains(user)}">
					<a  class="symbol" href="/${meal.idMeal}/removeFavorite">
					<i class="fa-regular fa-heart fa-2x"></i>
					</a>
				</c:when>
				<c:otherwise>
					<a class="symbol" href="/${meal.idMeal}/addFavorites">
						<i class="fa-solid fa-heart fa-2x"></i>
					</a>

				</c:otherwise>
			</c:choose>
		</div>
		<div class="bottomrow">
			<a class="symbol" href="/addReview/${meal.idMeal}"><i  class="fa-solid fa-comments fa-2x"></i></a>
			
		</div>

	</div>
	
	 
	 
	 </div>	
	 
	 
	 
	 
	 	
	 	<!-- Meal image -->
	 	
	 	<!-- End of Image -->
		
		<!-- This is for embedded Youtube videos -->

		
		
		


		

	

	<script src="/js/home.js"></script>
</body>
</html>