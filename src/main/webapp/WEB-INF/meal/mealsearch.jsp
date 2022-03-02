<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/mealsearch.css" rel="stylesheet" type="text/css">
<title>Search by Meal Type</title>
</head>
<body>
<c:choose>
<c:when test="${noresult}">
<h4>No Result :(</h4>
</c:when>
<c:when test="${display eq 'byname'}">
<c:forEach items="${apiMeals.meals}" var="meal">
	<div class="row">
	<h2>Directions for ${meal.strMeal}:</h2> 
	
	${meal.strDrinkAlternate}
	${meal.strCategory}
	${meal.strArea}
	${meal.strInstructions}

	<a class="youtube" href="${meal.strYoutube}" target="_blank">Watch on YouTube</a>
	<iframe width="420" height="315"
src="https://www.youtube.com/embed/${meal.strYoutubeVideoID}">
</iframe>
	

	</div>
	</c:forEach>
</c:when>
<c:otherwise>
<c:forEach items="${apiMeals.meals}" var="meal">
<h1>${meal.strMeal}</h1>
		<img src="${meal.strMealThumb}"><br>
		<a class="seeMeal" href="/getMeal/${meal.idMeal}">See Meal</a>
</c:forEach>
</c:otherwise>
</c:choose>


</body>
</html>