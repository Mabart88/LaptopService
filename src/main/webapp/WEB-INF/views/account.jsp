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
			<li class="nav-item"><a class="nav-link" href="/LaptopService/">Strona
					główna </a></li>
			<li class="nav-item"><a class="nav-link"
				href="/LaptopService/repair/status">Sprawdź stan naprawy</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/LaptopService/about">O nas</a></li>
			<c:if test="${not empty logged}">
				<li class="nav-item active"><a class="nav-link"
					href="/LaptopService/account">Twoje Konto <span class="sr-only">(current)</span></a></li>
			</c:if>
			<c:if test="${logged.isAdmin() }">
				<li class="nav-item"><a class="nav-link"
					href="/LaptopService/admin/users"> Panel administratora<br>
				</a></li>
			</c:if>
			<c:if test="${logged.isRepairman() }">
				<li class="nav-item"><a class="nav-link"
					href="/LaptopService/repair/all">Panel serwisanta<br>
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
			<form class="form-inline my-2 my-lg-0"
				action="/LaptopService/register">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Zarejestruj
					się</button>
			</form>
		</c:if>
	</div>
	</nav>

	<main role="main"> <!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="table-responsive">

			<h2>Twoje naprawy</h2>
			<table class="table table-striped">
				<tr>
					<td>Numer naprawy</td>
					<td>Laptop</td>
					<td>Opis Usterki</td>
					<td>Status</td>
				</tr>
				<c:forEach items="${repairs }" var="repair">
					<tr>
						<td>${repair.id }</td>
						<td>${repair.laptop }</td>
						<td>${repair.description }</td>
						<td>${repair.getStatus() }</td>
					</tr>
					<c:if test="${repair.isFinished()==false }"></c:if>
				</c:forEach>
			</table>

		</div>
		<br>
		<div class="table-responsive">
			<h2>Twoje laptopy</h2>
			<table class="table table-striped">
				<tr>

					<td>Marka</td>
					<td>Model</td>
					<td>Numer seryjny</td>
					<td>Akcje</td>
				</tr>
				<c:forEach items="${laptops }" var="laptop">
					<tr>
						<c:set var="contains" value="false" />
						<c:forEach var="repair" items="${laptop.getRepairs()}">
						<c:if test="${repair.isFinished() }">
							
								<c:set var="contains" value="true" />
							
							</c:if>
						</c:forEach>
						<td>${laptop.brand }</td>
						<td>${laptop.model }</td>
						<td>${laptop.serialNumber}</td>
						<td><c:if test="${contains}">
								<a href="repair/${laptop.id }">Zgłoś do naprawy</a>
							</c:if> <a href="removeLaptop/${laptop.id }">Usuń</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<a class="btn btn-primary btn-lg" href="/LaptopService/registerLaptop"
			role="button">Zgłoś innego laptopa do naprawy</a>
	</div>
	</main>
</body>
</html>