<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/home.css" rel="stylesheet" type="text/css">
<title>Home</title>
</head>
<body>
	<a href="">CONTACT US HERE</a> | <a href="/register">Sign up</a> | <a href="/login">Sign in</a> | <a href="/logout">Logout</a>
	<div>
	<form action="/search" method="get">
	<input name="term">
	 <select name="by"> 
	 <option value="name" >by food name</option>
	 <option value="ing" >by ingredients</option>
	</select>
	<button type= "submit">Search</button>
	</form>
	</div>
	
	<hr>
	<div class="container">
	<div class="row">
	<form action="/searchByCountry" method="get">
	<select name="country">
		<c:forEach items="${apiAreas.areas}" var="area">
		<option value="${area.strArea}">${area.strArea}</option>
		</c:forEach>
		
		</select>
		<button type ="submit">SUBMIT</button>
		</form>
	</div>
	

	
	<div class="row text-center">
		<h3>
			Feeling hungry?
		</h3>

		<a href="/details"><button id="meal">Get a random meal</button></a>

	</div>

	

</div>
	
	<script src="/js/home.js"></script>
</body>
</html>