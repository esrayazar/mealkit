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

<script>
	$(function (){
		$("#rating").rateYo({
			rating: 0,
			numStars: 5,
			maxValue: 5,
			halfStar: true,
			onChange: function (rating, rateYoInstance){
				$('rating').val(rating);
			}
		
		});
	});
</script>
<h1>Review</h1>
	<form:form action="/createReviews" method="post" modelAttribute="PostAReview">
		<form:label path="review"></form:label>
		<form:errors path="review"/>
		<form:textarea path="review"/>
		<input type="submit" value="Post review"/>
	</form:form>
</body>
</html>