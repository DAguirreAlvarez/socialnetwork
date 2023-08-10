<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css" type="text/css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
<title>Register | Login</title>
</head>
<body>
	<div class="container">
		<header class="text-white py-1 row rounded-bottom sticky-top">
			<div class="col-8">
				<h1 style="margin-left: 15px;" class="col-9 fw-bold">Red Social</h1>
			</div>
			<div class="col-4 ">
				
			</div>
		</header>
		<div class="py-4 container mx-auto contenedor row">
			<div class="col-5">
				<h2>Register!</h2>
				<div>
					<form:errors path="user.*" class="text-danger" />
				</div>
				<form:form method="post" action="/register" modelAttribute="user">
					<div>
						<form:label path="name">Name:</form:label>
						<form:input path="name" class="form-control" />
					</div>
					<div>
						<form:label path="lastName">Last Name:</form:label>
						<form:input path="lastName" class="form-control" />
					</div>
					<div>
						<form:label path="email">Email:</form:label>
						<form:input path="email" class="form-control" />
					</div>

					<div>
						<form:label path="password">Password:</form:label>
						<form:input path="password" class="form-control" type="password" />
					</div>
					<div>
						<form:label path="passwordConfirmation">Password Confirmation:</form:label>
						<form:input path="passwordConfirmation" class="form-control"
							type="password" />
					</div>
					<form:button class="btn btn-secondary mt-4">Register</form:button>


				</form:form>
				<div>
					<p class="${clases }">
						<c:out value="${successRegister }"></c:out>
					</p>
				</div>
			</div>

			<div class="col-5">
				<h2>Login</h2>
				<div>
					<form:errors path="loginUser.*" class="text-danger"/>
				</div>
				<form:form modelAttribute="loginUser" method="POST" action="/login">
					<div>
						<form:label path="email" >Email: </form:label>
						<form:input path="email" class="form-control"/>
					</div>
					<div>
						<form:label path="password">Password: </form:label>
						<form:input path="password" type="password" class="form-control"/>
					</div>
					<form:button class="btn btn-secondary mt-3">Login</form:button>
				</form:form>
				
			</div>
		</div>
		<footer
			class="text-center py-2 bg-secondary bg-gradient text-white rounded-top container">
			<div>© 2023 - Diego Aguirre</div>
		</footer>
	</div>
</body>
</html>