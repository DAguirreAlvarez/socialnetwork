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
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
<title>Crear Publicacion | RedSocial</title>
</head>
<body>
	<div class="container">
	<header class="bg-info text-white py-1 row rounded-bottom">
			<h2 style="margin-left:15px;" class="col-9">Welcome <c:out value="${user.getName().concat(' ').concat(user.getLastName())}"></c:out> </h2>
			<div class="col-2">
				<ul class="list-unstyled row mt-2 h5">
					<li class="col-5"><a href="/home" class="text-decoration-none text-muted"> Home </a></li>
					<li class="col-6">
						<a href="/logout" class="text-dark text-decoration-none">
							Logout
						</a>
					</li >
				</ul>
			</div>	
		</header>
		<div class="mt-3">
			<h2 class="mt-2">New Post</h2>
			<form:form method="POST" action="/post/new" modelAttribute="post">
				<p>
					<form:label path="contenido">Post</form:label>
				</p>

				<div class="form-group purple-border mb-3">
					<form:textarea path="contenido" class="form-control" rows="3"/>
				</div> 
				<form:button class="btn btn-primary">Postear</form:button>
			</form:form>
		</div>
	</div>
</body>
</html>

