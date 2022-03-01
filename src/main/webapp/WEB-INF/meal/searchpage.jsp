<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/searchpage.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>

<div class="col">

<c:forEach items="${apiData.meals}" var="meal">
<h1>${meal.strMeal}</h1>
		<img src="${meal.strMealThumb}">
		<a href="/getMeal/${meal.idMeal}">Check this meal out!</a>
</c:forEach>
		
		
		
		
		


		
</div>
</body>
</html>