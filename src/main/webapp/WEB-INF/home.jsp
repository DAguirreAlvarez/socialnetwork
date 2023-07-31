<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
<title>Home | RedSocial</title>
</head>
<body>
	<div class="container">
		<header class="bg-info text-white py-1 row rounded-bottom">
			<h2 style="margin-left: 15px;" class="col-9">
				Welcome
				<a href="#" class="text-decoration-none text-white"><c:out
					value="${user.getName().concat(' ').concat(user.getLastName())}"></c:out></a>
			</h2>
			<div class="col-2">
				<ul class="list-unstyled row mt-2 h5">
					<li class="col-5"><a href="/home"
						class="text-decoration-none text-muted"> Home </a></li>
					<li class="col-6"><a href="/logout"
						class="text-dark text-decoration-none"> Logout </a></li>
				</ul>
			</div>
		</header>
		<div>
			<div class="py-3 bg-light container mx-auto">
				<h3 class="h2 fw-bold">Publicaciones</h3>
				
				<div>
					<div class="mt-3">
						<h2 class="mt-2">New Post</h2>
						<form:form method="POST" action="/post/new" modelAttribute="post">
							

							<div class="form-group purple-border mb-3">
								<form:textarea path="contenido" class="form-control" rows="3" />
							</div>
							<form:button class="btn btn-primary">Postear</form:button>
						</form:form>
					</div>
				</div>
				<hr class="w-75 mx-auto">
				<c:forEach items="${posts }" var="post" varStatus="loop">
					<div class="border p-3 m-3 w-75 bg-white">
						<div class="row">
							<p class="col-10">
								Post #<c:out value="${post.getId() }"></c:out>
							</p>
							<div class="col-1">
								<form class="delete-form " action="/post/delete/${post.getId()}" method="POST">
									<input type="hidden" name="_method" value="DELETE">
									<button class="btn btn-danger">Delete</button>
								</form>
							</div>
						</div>
						<p>
							<fmt:formatDate value="${post.getCreatedAt() }" type = "both" dateStyle = "short" timeStyle = "short"/>
						</p>
						<p class="h5 fw-bold">
							<c:out
								value="${post.getAuthor().getName().concat(' ').concat(post.getAuthor().getLastName()) }"></c:out>
						</p>
						<p class="p-3">
							<c:out value="${post.getContenido() }"></c:out>
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
		<footer
			class="text-center py-2 bg-secondary bg-gradient text-white rounded-top mx-auto container">
			<div>© 2023 - Diego Aguirre</div>
		</footer>
	</div>
</body>
</html>