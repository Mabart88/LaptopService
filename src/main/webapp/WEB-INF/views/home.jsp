<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@	page isELIgnored="false"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Hammer Time</title>

<!-- Bootstrap core CSS -->
<link href="../../../../dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="jumbotron.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
	integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"
	integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4"
	crossorigin="anonymous"></script>
</head>

<body>

	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
	<a class="navbar-brand" href="/LaptopService/">Hammer Time</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarsExampleDefault"
		aria-controls="navbarsExampleDefault" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarsExampleDefault">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="/LaptopService/">Strona
					główna <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="/LaptopService/repair/status">Sprawdź
					stan naprawy</a></li>
					<li class="nav-item"><a class="nav-link" href="/LaptopService/about">O nas</a></li>
			<c:if test="${not empty logged}">
				<li class="nav-item"><a class="nav-link" href="/LaptopService/account">Twoje
						Konto</a></li>
			</c:if>
			<c:if test="${logged.isAdmin() }">
				<li class="nav-item"><a class="nav-link" href="/LaptopService/admin/users">
						Panel administratora
				</a></li>
			</c:if>
			<c:if test="${logged.isRepairman() }">
				<li class="nav-item"><a class="nav-link" href="/LaptopService/repair/all">Panel
						serwisanta
				</a></li>
			</c:if>

		</ul>

		<c:if test="${not empty logged}">
			<form class="form-inline my-2 my-lg-0" action="/LaptopService/logout">
				<span style="color: red">Zalogowany jako
					${logged.getFirstName() } ${logged.getLastName() } </span><span
					style="width: 20;"> &emsp;</span>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Wyloguj
					się</button>
			</form>

		</c:if>
		<c:if test="${empty logged}">
			<form class="form-inline my-2 my-lg-0" action="/LaptopService/login">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Zaloguj
					się</button>
			</form>
			&emsp;
			<form class="form-inline my-2 my-lg-0" action="/LaptopService/register">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Zarejestruj
					się</button>
			</form>
		</c:if>
	</div>
	</nav>

	<main role="main"> <!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<h1>Witamy na stronie naszego serwisu.</h1>
			<p>Laptop nie działa? Jesteś w odpowiednim miejscu. Jesteśmy w
				stanie pomóc ci z każdym problemem. Posiadamy autoryzację wielu
				producentów.</p>
			<p>
				<a class="btn btn-primary btn-lg" href="/LaptopService/about" role="button">O
					nas</a>
					<c:if test="${not empty logged }">
					<a class="btn btn-primary btn-lg" href="/LaptopService/registerLaptop" role="button">Zgłoś sprzęt do naprawy</a>
					</c:if>
					<c:if test="${empty logged }">
					<a class="btn btn-primary btn-lg" href="/LaptopService/login" role="button">Zaloguj się aby zgłosić sprzęt do naprawy</a>
					</c:if>
			</p>
		</div>
	</div>

	<div class="container">
		<img
			src="https://us.123rf.com/450wm/zimmytws/zimmytws1508/zimmytws150800027/44198967-person-hitting-a-laptop-screen-with-a-hammer-in-frustration.jpg?ver=6">

	</div>
	<!-- /container --> </main>

	<footer class="container">
	<p>&copy; Hammer Time 2018</p>
	</footer>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="../../../../assets/js/vendor/popper.min.js"></script>
	<script src="../../../../dist/js/bootstrap.min.js"></script>
</body>
</html>
