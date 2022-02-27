<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<a href="/">Home</a> | <a href="/profile/${pUser.id}/edit">Edit</a>  
<%-- <a href="/delete/${pUser.id}">Delete</a> --%>

<form action="/delete/${pUser.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Delete">
</form>

<body>
	<h1>User's profile</h1>
	<h2>Age: ${pUser.firstName}</h2>
	<h2>Email: ${pUser.email}</h2>

	
</body>
</html>