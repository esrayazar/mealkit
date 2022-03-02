<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/profile.css" rel="stylesheet" type="text/css">
<title>Profile</title>
</head>
<a href="/">Home</a>

 <a href="/profile/${pUser.id}/edit">Edit</a>  
 <%-- <form action="/profile/${pUser.id}/edit" method="post">
    <input type="hidden" name="_method" value="put">
    <input type="submit" value="edit">
</form>  --%>

<form action="/delete/${pUser.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Delete">
</form>

<body>
	<h1>User's profile</h1>
	<h2>Name: ${pUser.firstName}</h2>
	<h2>Email: ${pUser.email}</h2>


<h1>User's reviews</h1>
<c:forEach items="${pUser.reviews}" var="review">
<c:out value="${review.review}"></c:out>
<c:if test="${review.reviewedBy.id eq pUser.id}">
                        (<a href="/edit/${review.id}/review">Edit</a>)
                        
    <form action="/delete/${review.id}/review" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Delete">
</form>
               <!--  (<a href="">Delete</a>)<br> -->
</c:if>

</c:forEach>
	
</body>
</html>