<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Home | RedSocial</title>
</head>
<body>
	<div class="container">
		<header class="text-white py-1 row rounded-bottom sticky-top ">
			<h2 style="margin-left: 15px;" class="col-9 fw-bold">
				Welcome <a href="/profile/${user.getId() }" class="text-decoration-none text-white"><c:out
						value="${user.getName().concat(' ').concat(user.getLastName())}"></c:out></a>
			</h2>
			<div class="col-2">
				<ul class="list-unstyled row mt-2 h5 fw-bold">
					<li class="col-5"><a href="/home"
						class="text-decoration-none text-muted"> Home </a></li>
					<li class="col-6"><a href="/logout"
						class="links text-decoration-none"> Logout </a></li>
				</ul>
			</div>
		</header>
		<div>
			<div class="py-4 container mx-auto contenedor">

				<div>
					<div class="mt-2">
						<h2 class="mt-2">New Post</h2>
						<div class="${claseError }">
							<form:errors path="post.*" class="text-white" />
						</div>
						<form:form method="POST" action="/post/new" modelAttribute="post">


							<div class="form-group purple-border mb-3">
								<form:textarea path="contenido" class="form-control textocomentario" rows="3" />
							</div>
							<form:button class="btn btn-primary">Postear</form:button>
						</form:form>
					</div>
				</div>
				<hr class="mx-auto divisor">
				<h3 class="h2 fw-bold">Publicaciones</h3>
				<c:forEach items="${posts }" var="post" varStatus="loop">
					<div class="border p-3 m-3 post bg-white rounded">
						<div class="row">
							<p class="col-11">
								Post #<a href="/post/${post.getId() }"><c:out
										value="${post.getId() }"></c:out></a>
							</p>

							<c:choose>
								<c:when test="${ post.author.id == user.id }">
									<div class="col-1">
										<form class="delete-form" action="/post/delete/${post.getId()}" method="POST">
											<input type="hidden" name="_method" value="DELETE">
											<button class="btn btn-danger">
												<img alt="trashcan icon svg" src="/svg/trash.svg" id="eliminar">
											</button>
										</form>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-1">
										<form class="delete-form" action="/post/delete/${post.getId()}" method="POST">
											<input type="hidden" name="_method" value="DELETE">
											<button class="btn btn-danger" disabled>
												<img alt="trashcan icon svg" src="/svg/trash.svg" id="eliminar">
											</button>
										</form>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<p>
							<fmt:formatDate value="${post.getCreatedAt() }" type="both"
								dateStyle="short" timeStyle="short" />
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
			class="text-center py-2 bg-secondary bg-gradient text-white rounded-top mx-auto">
			<div>© 2023 - Diego Aguirre</div>
		</footer>
	</div>
</body>
</html>