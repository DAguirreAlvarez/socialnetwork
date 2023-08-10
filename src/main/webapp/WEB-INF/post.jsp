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
<title>Post Comment | RedSocial</title>
</head>
<body>
	<div class="container">
		<header class="text-white py-1 row rounded-bottom sticky-top ">
			<h2 class="col-9 fw-bold">
				Welcome <a href="#" class="text-decoration-none text-white"><c:out
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
		<div class="py-4 container mx-auto contenedor">
			<h1>Post</h1>
			<div class="border p-3 m-3 w-75 bg-white rounded">
				<div class="row">
					<p class="col-10">
						Post #
						<c:out value="${post.getId() }"></c:out>
					</p>
				</div>
				<p class="h5 fw-bold">
					<c:out
						value="${post.getAuthor().getName().concat(' ').concat(post.getAuthor().getLastName()) }"></c:out>
				</p>
					<p class=" my-1">
								<fmt:formatDate value="${post.getCreatedAt() }" type="both"
									dateStyle="short" timeStyle="short" />
							</p>
				<p class="p-3">
					<c:out value="${post.getContenido() }"></c:out>
				</p>
			</div>
			<div id="comentarios" class=" w-50 rounded">
				<c:forEach items="${comentarios }" var="comentario">
					<div class="comentario rounded container m-3">
						<div class="info-persona rounded">
							<p class="my-0 py-0 px-1"><c:out value="${comentario.getAuthor().getName().concat(' ').concat(comentario.getAuthor().getLastName()) }"></c:out> </p>
							<p class="px-1 my-0 py-0">
								<fmt:formatDate value="${comentario.getCreatedAt() }" type="both"
									dateStyle="short" timeStyle="short" />
							</p>
						</div>
						<p class="px-3 mt-2 mb-1">
								<c:out value="${comentario.getContenido() }"></c:out>
							</p>
					</div>
				</c:forEach>
			</div>
			<div class="m-3">
			<div class="${claseError }">
							<form:errors path="comentario.*" class="text-white" />
						</div>
				<form:form method="POST" action="/post/${post.getId() }" modelAttribute="comentario">
					<div class="form-group purple-border w-75 mb-3">
						<form:textarea path="contenido" class="form-control textocomentario" rows="3"/>
					</div>
					<form:button class="btn btn-primary">Comentar</form:button>
				</form:form>
			</div>
		</div>
		<footer
			class="text-center py-2 bg-secondary bg-gradient text-white rounded-top ">
			<div>© 2023 - Diego Aguirre</div>
		</footer>
	</div>
</body>
</html>