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
	<a href="">Sign up</a> |
	<a href="">Sign in</a>
	<hr>
	<div class="container">
		<div class="row">
			<form action="/searchByCountry" method="get">
				<select name="country">
					<c:forEach items="${apiAreas.areas}" var="area">
						<option value="${area.strArea}">${area.strArea}</option>
					</c:forEach>

				</select>
				<button type="submit">SUBMIT</button>
			</form>
		</div>


		<div class="row text-center">
			<h3>Feeling hungry?</h3>

			<a href="/details"><button id="meal">Get a
					random meal</button></a>

		</div>

		<div class="row">
		<h3>${meal.strMeal}</h3>
		</div>
		<div class="row">
		<c:if test="${not empty meal.strMeal}">
		strMeal: ${meal.strMeal} <br/>
		</c:if>
		
		strDrinkAlternate: ${meal.strDrinkAlternate} <br/>
		strCategory: ${meal.strCategory} <br/>
		strArea: ${meal.strArea} <br/>
	 	strInstructions: ${meal.strInstructions} <br/>
	 	
	 	<!-- Meal image -->
	 	<img src="${meal.strMealThumb}" height="128" width="128"> <br/>
	 	<!-- End of Image -->
		strTags: ${meal.strTags} <br/>
		<!-- This is for embedded Youtube videos -->
		<iframe width="420" height="315"
					src="https://www.youtube.com/embed/${meal.strYoutubeVideoID}">
		</iframe>
		
		<a href="${meal.strYoutube}" target="_blank">Watch on YouTube</a><br/>
		<!-- End of Youtube -->
	 strIngredient1: ${meal.strIngredient1} <br/>
	 strIngredient2: ${meal.strIngredient2} <br/>
	 strIngredient3: ${meal.strIngredient3} <br/>
	 strIngredient4: ${meal.strIngredient4} <br/>
	 strIngredient5: ${meal.strIngredient5} <br/>
	 strIngredient6: ${meal.strIngredient6} <br/>
	 strIngredient7: ${meal.strIngredient7} <br/>
	 strIngredient8: ${meal.strIngredient8} <br/>
	 strIngredient9: ${meal.strIngredient9} <br/>
	 strIngredient10: ${meal.strIngredient10} <br/>
	 strIngredient11: ${meal.strIngredient11} <br/>
	 strIngredient12: ${meal.strIngredient12} <br/>
	 strIngredient13: ${meal.strIngredient13} <br/>
	 strIngredient14: ${meal.strIngredient14} <br/>
	 strIngredient15: ${meal.strIngredient15} <br/>
	 strIngredient16: ${meal.strIngredient16} <br/>
	 strIngredient17: ${meal.strIngredient17} <br/>
	 strIngredient18: ${meal.strIngredient18} <br/>
	 strIngredient19: ${meal.strIngredient19} <br/>
	 strIngredient20: ${meal.strIngredient20} <br/>
	 strMeasure1: ${meal.strMeasure1} <br/>
	 strMeasure2: ${meal.strMeasure2} <br/>
	 strMeasure3: ${meal.strMeasure3} <br/>
	 strMeasure4: ${meal.strMeasure4} <br/>
	 strMeasure5: ${meal.strMeasure5} <br/>
	 strMeasure6: ${meal.strMeasure6} <br/>
	 strMeasure7: ${meal.strMeasure7} <br/>
	 strMeasure8: ${meal.strMeasure8} <br/>
	 strMeasure9: ${meal.strMeasure9} <br/>
	 strMeasure10: ${meal.strMeasure10} <br/>
	 strMeasure11: ${meal.strMeasure11} <br/>
	 strMeasure12: ${meal.strMeasure12} <br/>
	 strMeasure13: ${meal.strMeasure13} <br/>
	 strMeasure14: ${meal.strMeasure14} <br/>
	 strMeasure15: ${meal.strMeasure15} <br/>
	 strMeasure16: ${meal.strMeasure16} <br/>
	 strMeasure17: ${meal.strMeasure17} <br/>
	 strMeasure18: ${meal.strMeasure18} <br/>
	 strMeasure19: ${meal.strMeasure19} <br/>
	 strMeasure20: ${meal.strMeasure20} <br/>
	 strSource: ${meal.strSource} <br/>
	 strImageSource: ${meal.strImageSource} <br/>
	 strCreativeCommonsConfirmed: ${meal.strCreativeCommonsConfirmed} <br/>
	dateModified: ${meal.dateModified} <br/>
		</div>
		
		
		
		
		
		
		<div class="row">
			<c:choose>
				<c:when test="${meal.likers.contains(user)}">
					<a href="/${meal.idMeal}/unlike">Unlike<i
						class="fa-regular fa-thumbs-down fa-2x"></i>
					</a>
				</c:when>
				<c:otherwise>
					<a href="/${meal.idMeal}/like">Like<i
						class="fa-regular fa-thumbs-up fa-2x"></i>
					</a>

				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="row">
			<c:choose>
				<c:when test="${meal.favorites.contains(user)}">
					<a href="/${meal.idMeal}/removeFavorite">Remove From Favorites
					<i class="fa-regular fa-heart fa-2x"></i>
					</a>
				</c:when>
				<c:otherwise>
					<a href="/${meal.idMeal}/addFavorites">Add To Favorites
						<i class="fa-solid fa-heart fa-2x"></i>
					</a>

				</c:otherwise>
			</c:choose>
		</div>

	</div>
	
	<div class="row">
	Liked by ${meal.likers.size()} User(s)
	</div>
	<div class="row">
	Favorited by ${meal.favorites.size()} User(s)
	</div>
	

	<script src="/js/home.js"></script>
</body>
</html>