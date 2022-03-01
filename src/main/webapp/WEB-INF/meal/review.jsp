<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/review.css" rel="stylesheet" type="text/css">
<title>Review</title>
</head>
<body>


<div>
	Meal: <c:out value="${mealId.strMeal}"></c:out><br>
	Ingredients: <c:out value="${mealId.strIngredient1}"></c:out><br/>
	Category: <c:out value="${mealId.strCategory}"></c:out><br>
	Nationality food: <c:out value="${mealId.strArea}"></c:out><br>
	<%-- Instructions: <c:out value="${mealId.strInstructions}"></c:out><br> --%>
	<img src="${mealId.strMealThumb}" height="128" width="128"> <br>
	Tags: <c:out value="${mealId.strTags}"></c:out><br>
	<iframe width="420" height="315"
		src="https://www.youtube.com/embed/${mealId.strYoutubeVideoID}">
	</iframe>
	<a href="${mealId.strYoutube}" target="_blank">Watch on YouTube</a><br/>
	Ingredients: ${mealId.strIngredient1}, ${mealId.strIngredient2}, ${mealId.strIngredient3}, ${mealId.strIngredient4}<br>
	Reference: <c:out value="${mealId.strSource}"></c:out><br>
</div>


<h1>Review</h1>
	<form:form action="/createReviews" method="post" modelAttribute="PostAReview">
		<form:input path="reviewedBy" type="hidden" value="${userId}"/>
		<form:input path="reviewedMeal" type="hidden" value="${mealId.id}"/>
		<form:label path="review"></form:label>
		<form:errors path="review"/>
		<form:textarea path="review"/>
		<input type="submit" value="Post review"/>
	</form:form>
	
</body>
</html>