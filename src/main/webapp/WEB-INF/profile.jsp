<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
<title>Profile | <c:out value="${user.getName().concat(' ').concat(user.getLastName())}"></c:out></title>
</head>
<body>
	<div class="container">
		<header class="text-white py-1 row rounded-bottom sticky-top ">
			<h2 class="col-9 fw-bold">
				Welcome <a href="/profile/${user.getId() }" class="text-decoration-none text-white"><c:out
						value="${user.getName().concat(' ').concat(user.getLastName())}"></c:out></a>
			</h2>
			<div class="col-2">
				<ul class="list-unstyled row mt-2 h5 fw-bold">
					<li class="col-5"><a href="/home"
						class="text-decoration-none links"> Home </a></li>
					<li class="col-6"><a href="/logout"
						class="text-decoration-none links"> Logout </a></li>
				</ul>
			</div>
		</header>
		<div class="contenedor">
			<div class="row mx-1">
				<div class="col-2 bg-secondary">
					<h3>Amigos</h3>
				</div>
				<div class="col-10">
					<h3 class="h2">Posts</h3>
					<div class="w-75 bg-light border rounded p-2">
						<c:forEach items="${publicaciones }" var="post">
							<p>
							<fmt:formatDate value="${post.getCreatedAt() }" type="both"
								dateStyle="short" timeStyle="short" />
						</p>
							<p class="h5 fw-bold">
							<c:out
								value="${post.getAuthor().getName().concat(' ').concat(post.getAuthor().getLastName()) }"></c:out>
							</p>
							<p>
								<c:out value="${post.getContenido() }"></c:out>
							</p>
							<p class="text-end">
								<a href="/post/${post.getId() }" class="btn btn-primary">
									Comentarios
								</a>
							</p>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		<footer class="text-center py-2 bg-secondary bg-gradient text-white rounded-top row">
			<div>© 2023 - Diego Aguirre</div>
		</footer>
	</div>
</body>
</html>