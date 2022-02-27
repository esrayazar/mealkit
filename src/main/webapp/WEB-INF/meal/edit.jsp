<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
</head>
<body>
		<form:form action="/update/${EditOne.id}" method="put" modelAttribute="Edit">
		<p>
			<form:label path="firstName">Name:</form:label>
			<form:errors path="firstName" class="text-danger"/>
			<form:input path="firstName" value="${EditOne.firstName}"/>
		</p>
		<p>
			<form:label path="email">Email:</form:label>
			<form:errors path="email" class="text-danger"/>
			<form:input path="email" value="${EditOne.email}"/>
		</p>
		
			<input class="btn" type="submit" value="Submit" />
	</form:form>
	
</body>
</html>