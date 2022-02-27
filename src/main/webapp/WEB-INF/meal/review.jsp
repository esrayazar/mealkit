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
</head>
<body>
<h1>Review</h1>
	<form:form action="/createReviews" method="post" modelAttribute="PostAReview">
		<form:label path="review"></form:label>
		<form:errors path="review"/>
		<form:textarea path="review"/>
		<input type="submit" value="Post review"/>
	</form:form>
</body>
</html>