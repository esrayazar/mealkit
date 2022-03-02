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
<link href="/css/edit.css" rel="stylesheet" type="text/css">
<title>Edit</title>
</head>
<body>

<h1>Review</h1>
	<form:form action="/update/${review.id}/review" method="post" modelAttribute="Edit">
		<form:input path="reviewedBy" type="hidden" value="${review.reviewedBy.id}"/>
		<form:input path="reviewedMeal" type="hidden" value="${review.reviewedMeal.id}"/>
		<form:label path="review"></form:label>
		<form:errors path="review"/>
		<form:textarea id="myTextArea" path="review" value="${review.review}"/>
		<input type="submit" value="Post review"/>
	</form:form>
	
	<script>
  
     document.getElementById("myTextArea").value = "${review.review}";
</script>
</body>
</html>