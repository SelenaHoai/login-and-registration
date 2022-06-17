<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login & Registration</title>
<!-- CSS Link -->
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/app.js"></script>
	
<!-- <!-- Bootstrap Link -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-4">
		<h1>Welcome!</h1>
		<p>Join our growing community</p>
		<div class="mainWrapper">
			<div class="register">
				<h2 class="text-center">Register</h2>
				<form:form action="/register" method='POST' modelAttribute="newUser">		
				 <div class="d-flex justify-content-between mt-3">
					<form:label path="userName">Username: </form:label>
					<form:input type="text" path="userName"/>
				</div>
				<div>
					<form:errors class="text-danger" path="userName"/>
				</div>
				 <div class="d-flex justify-content-between mt-2">
					<form:label path="email">Email: </form:label>
					<form:input type="text" path="email"/>
				</div>
				<div>
					<form:errors class="text-danger" path="email"/>
				</div>
				 <div class="d-flex justify-content-between mt-2">
					<form:label path="password">Password: </form:label>
					<form:input type="password" path="password"/>
				</div>
				<div>
					<form:errors class="text-danger" path="password"/>
				</div>
				 <div class="d-flex justify-content-between mt-2">
					<form:label path="confirm">Confirm Password: </form:label>
					<form:input type="password" path="confirm"/>
				</div class="mb-3">
					<form:errors class="text-danger" path="confirm"/>	
				<div>
				</div>							
				<input type="submit" value="Register" class="btn btn-outline-primary"/>
				</form:form>
			</div>
			<div class="login">
			<h2 class="text-center">Login</h2>
			<form:form action="/login" method='POST' modelAttribute="newLogin">			
			 <div class="d-flex justify-content-between mt-3">
				<form:label path="email">Email: </form:label>
				<form:input type="text" path="email"/>
			</div>
				<form:errors class="text-danger" path="email"/>			
			<div>
			</div>
			 <div class="d-flex justify-content-between mt-2">
				<form:label path="password">Password: </form:label>
				<form:input type="password" path="password"/>
			</div>
			<div class="mb-3">
				<form:errors class="text-danger" path="password"/>
			</div>
			<input type="submit" value="Login" class="btn btn-outline-success"/>
			</form:form>			
			</div>
		</div>
		<h3 class="text-danger"><c:out value="${error}"/></h3>
	</div>

</body>
</html>