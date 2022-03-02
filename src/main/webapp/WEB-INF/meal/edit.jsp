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
		<h1>User's profile</h1>
		<p>Name: ${EditOne.firstName}</p>
		<p>email: ${EditOne.email}</p>
</body>
</html>