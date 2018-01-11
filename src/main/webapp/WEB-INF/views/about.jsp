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
			<li class="nav-item active"><a class="nav-link"
				href="/LaptopService/about">O nas <span class="sr-only">(current)</span></a></li>
			<c:if test="${not empty logged}">
				<li class="nav-item"><a class="nav-link"
					href="/LaptopService/account">Twoje Konto</a></li>
			</c:if>
			<c:if test="${logged.isAdmin() }">
				<li class="nav-item"><a class="nav-link"
					href="/LaptopService/admin/users"> Panel administratora </a></li>
			</c:if>
			<c:if test="${logged.isRepairman() }">
				<li class="nav-item"><a class="nav-link"
					href="/LaptopService/repair/all">Panel serwisanta </a></li>
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

		<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Morbi eget nibh ut nisi porta tincidunt. Nulla ac est id lorem tempor
			ullamcorper. Maecenas aliquet risus eu odio gravida, sit amet sodales
			metus viverra. Phasellus auctor, leo non suscipit varius, tortor
			lorem consectetur mauris, imperdiet consectetur diam nisl nec est.
			Integer ut nisl tristique, maximus orci vel, semper tortor. Integer
			sagittis vitae dolor ut aliquet. Sed sit amet nibh vel orci cursus
			elementum. Vestibulum sed purus orci. Integer nunc tortor, imperdiet
			eget vulputate eget, malesuada a diam. Suspendisse aliquam egestas
			rutrum. Donec ornare libero ac lorem iaculis, in pulvinar magna
			imperdiet. Phasellus consectetur sem justo, auctor iaculis tellus
			vulputate sollicitudin. Lorem ipsum dolor sit amet, consectetur
			adipiscing elit. Nunc scelerisque urna at ipsum imperdiet, vitae
			venenatis ante posuere. Vivamus egestas magna eu aliquet pharetra.</div>
		<br>
		<div>Donec sed dolor nisi. Aliquam ullamcorper, sem sit amet
			luctus scelerisque, eros erat aliquam magna, vitae elementum augue
			neque vitae sem. Morbi sed molestie ante. Nunc placerat sapien ac
			lorem volutpat fringilla. Phasellus a ornare velit. Sed et molestie
			ligula. Duis tristique felis in turpis malesuada, non tincidunt arcu
			venenatis. Vivamus sed odio vitae dolor ultrices commodo. Cras et
			urna lacus. Suspendisse at urna a eros rhoncus convallis et ut neque.
			Mauris a est arcu. Proin pharetra, massa venenatis pretium dignissim,
			odio purus rhoncus sapien, in facilisis arcu dui blandit nisi. Morbi
			leo dolor, sagittis vitae facilisis tempus, condimentum at nunc.
			Nulla facilisi. Proin vel risus eu tellus feugiat porttitor vitae sed
			mi. Praesent quis mollis enim.</div>
		<br>
		<div>Phasellus consectetur dapibus nisi vitae suscipit. Quisque
			in sem et ante tincidunt pellentesque. Sed sed posuere nisl. Fusce
			commodo pharetra massa, et bibendum mauris viverra ut. Praesent
			lectus velit, condimentum eu dolor quis, interdum convallis sem.
			Donec auctor eros quis sagittis rhoncus. Nulla sed tellus faucibus,
			sagittis diam non, vehicula odio. Pellentesque dignissim leo id
			sagittis placerat. Class aptent taciti sociosqu ad litora torquent
			per conubia nostra, per inceptos himenaeos. Etiam et efficitur quam,
			ut sollicitudin arcu. Nullam eget aliquam ligula. Duis ac mattis
			nibh, vel facilisis velit. Suspendisse commodo nec velit a rutrum.
			Vestibulum sed tincidunt mi, non faucibus dolor.</div>
		<br>
		<div>Aenean luctus maximus sem, maximus tempus ante placerat
			vel. Fusce elementum mauris quis tempor pretium. Proin scelerisque
			lacinia massa et pretium. Integer euismod nulla vitae arcu malesuada
			vestibulum. Praesent sed auctor libero. Ut luctus a eros non ornare.
			Nunc nec eros eu lacus scelerisque gravida vitae eu massa. Etiam
			congue magna enim.</div>
		<br>
		<div>Nullam at volutpat neque. Vivamus ultrices lorem at
			interdum sodales. Phasellus lacinia felis faucibus justo faucibus, ut
			dignissim metus posuere. Etiam vitae vulputate velit, eget faucibus
			tortor. Donec mi justo, vulputate in scelerisque nec, molestie et
			diam. Mauris egestas vehicula turpis, ultricies imperdiet dolor.
			Vestibulum id nunc dui.</div>
			<br>
			<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Morbi eget nibh ut nisi porta tincidunt. Nulla ac est id lorem tempor
			ullamcorper. Maecenas aliquet risus eu odio gravida, sit amet sodales
			metus viverra. Phasellus auctor, leo non suscipit varius, tortor
			lorem consectetur mauris, imperdiet consectetur diam nisl nec est.
			Integer ut nisl tristique, maximus orci vel, semper tortor. Integer
			sagittis vitae dolor ut aliquet. Sed sit amet nibh vel orci cursus
			elementum. Vestibulum sed purus orci. Integer nunc tortor, imperdiet
			eget vulputate eget, malesuada a diam. Suspendisse aliquam egestas
			rutrum. Donec ornare libero ac lorem iaculis, in pulvinar magna
			imperdiet. Phasellus consectetur sem justo, auctor iaculis tellus
			vulputate sollicitudin. Lorem ipsum dolor sit amet, consectetur
			adipiscing elit. Nunc scelerisque urna at ipsum imperdiet, vitae
			venenatis ante posuere. Vivamus egestas magna eu aliquet pharetra.</div>
		<br>
		<div>Donec sed dolor nisi. Aliquam ullamcorper, sem sit amet
			luctus scelerisque, eros erat aliquam magna, vitae elementum augue
			neque vitae sem. Morbi sed molestie ante. Nunc placerat sapien ac
			lorem volutpat fringilla. Phasellus a ornare velit. Sed et molestie
			ligula. Duis tristique felis in turpis malesuada, non tincidunt arcu
			venenatis. Vivamus sed odio vitae dolor ultrices commodo. Cras et
			urna lacus. Suspendisse at urna a eros rhoncus convallis et ut neque.
			Mauris a est arcu. Proin pharetra, massa venenatis pretium dignissim,
			odio purus rhoncus sapien, in facilisis arcu dui blandit nisi. Morbi
			leo dolor, sagittis vitae facilisis tempus, condimentum at nunc.
			Nulla facilisi. Proin vel risus eu tellus feugiat porttitor vitae sed
			mi. Praesent quis mollis enim.</div>
		<br>
		<div>Phasellus consectetur dapibus nisi vitae suscipit. Quisque
			in sem et ante tincidunt pellentesque. Sed sed posuere nisl. Fusce
			commodo pharetra massa, et bibendum mauris viverra ut. Praesent
			lectus velit, condimentum eu dolor quis, interdum convallis sem.
			Donec auctor eros quis sagittis rhoncus. Nulla sed tellus faucibus,
			sagittis diam non, vehicula odio. Pellentesque dignissim leo id
			sagittis placerat. Class aptent taciti sociosqu ad litora torquent
			per conubia nostra, per inceptos himenaeos. Etiam et efficitur quam,
			ut sollicitudin arcu. Nullam eget aliquam ligula. Duis ac mattis
			nibh, vel facilisis velit. Suspendisse commodo nec velit a rutrum.
			Vestibulum sed tincidunt mi, non faucibus dolor.</div>
		<br>
		<div>Aenean luctus maximus sem, maximus tempus ante placerat
			vel. Fusce elementum mauris quis tempor pretium. Proin scelerisque
			lacinia massa et pretium. Integer euismod nulla vitae arcu malesuada
			vestibulum. Praesent sed auctor libero. Ut luctus a eros non ornare.
			Nunc nec eros eu lacus scelerisque gravida vitae eu massa. Etiam
			congue magna enim.</div>
		<br>
		<div>Nullam at volutpat neque. Vivamus ultrices lorem at
			interdum sodales. Phasellus lacinia felis faucibus justo faucibus, ut
			dignissim metus posuere. Etiam vitae vulputate velit, eget faucibus
			tortor. Donec mi justo, vulputate in scelerisque nec, molestie et
			diam. Mauris egestas vehicula turpis, ultricies imperdiet dolor.
			Vestibulum id nunc dui.</div>
				<br>
			<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Morbi eget nibh ut nisi porta tincidunt. Nulla ac est id lorem tempor
			ullamcorper. Maecenas aliquet risus eu odio gravida, sit amet sodales
			metus viverra. Phasellus auctor, leo non suscipit varius, tortor
			lorem consectetur mauris, imperdiet consectetur diam nisl nec est.
			Integer ut nisl tristique, maximus orci vel, semper tortor. Integer
			sagittis vitae dolor ut aliquet. Sed sit amet nibh vel orci cursus
			elementum. Vestibulum sed purus orci. Integer nunc tortor, imperdiet
			eget vulputate eget, malesuada a diam. Suspendisse aliquam egestas
			rutrum. Donec ornare libero ac lorem iaculis, in pulvinar magna
			imperdiet. Phasellus consectetur sem justo, auctor iaculis tellus
			vulputate sollicitudin. Lorem ipsum dolor sit amet, consectetur
			adipiscing elit. Nunc scelerisque urna at ipsum imperdiet, vitae
			venenatis ante posuere. Vivamus egestas magna eu aliquet pharetra.</div>
		<br>
		<div>Donec sed dolor nisi. Aliquam ullamcorper, sem sit amet
			luctus scelerisque, eros erat aliquam magna, vitae elementum augue
			neque vitae sem. Morbi sed molestie ante. Nunc placerat sapien ac
			lorem volutpat fringilla. Phasellus a ornare velit. Sed et molestie
			ligula. Duis tristique felis in turpis malesuada, non tincidunt arcu
			venenatis. Vivamus sed odio vitae dolor ultrices commodo. Cras et
			urna lacus. Suspendisse at urna a eros rhoncus convallis et ut neque.
			Mauris a est arcu. Proin pharetra, massa venenatis pretium dignissim,
			odio purus rhoncus sapien, in facilisis arcu dui blandit nisi. Morbi
			leo dolor, sagittis vitae facilisis tempus, condimentum at nunc.
			Nulla facilisi. Proin vel risus eu tellus feugiat porttitor vitae sed
			mi. Praesent quis mollis enim.</div>
		<br>
		<div>Phasellus consectetur dapibus nisi vitae suscipit. Quisque
			in sem et ante tincidunt pellentesque. Sed sed posuere nisl. Fusce
			commodo pharetra massa, et bibendum mauris viverra ut. Praesent
			lectus velit, condimentum eu dolor quis, interdum convallis sem.
			Donec auctor eros quis sagittis rhoncus. Nulla sed tellus faucibus,
			sagittis diam non, vehicula odio. Pellentesque dignissim leo id
			sagittis placerat. Class aptent taciti sociosqu ad litora torquent
			per conubia nostra, per inceptos himenaeos. Etiam et efficitur quam,
			ut sollicitudin arcu. Nullam eget aliquam ligula. Duis ac mattis
			nibh, vel facilisis velit. Suspendisse commodo nec velit a rutrum.
			Vestibulum sed tincidunt mi, non faucibus dolor.</div>
		<br>
		<div>Aenean luctus maximus sem, maximus tempus ante placerat
			vel. Fusce elementum mauris quis tempor pretium. Proin scelerisque
			lacinia massa et pretium. Integer euismod nulla vitae arcu malesuada
			vestibulum. Praesent sed auctor libero. Ut luctus a eros non ornare.
			Nunc nec eros eu lacus scelerisque gravida vitae eu massa. Etiam
			congue magna enim.</div>
		<br>
		<div>Nullam at volutpat neque. Vivamus ultrices lorem at
			interdum sodales. Phasellus lacinia felis faucibus justo faucibus, ut
			dignissim metus posuere. Etiam vitae vulputate velit, eget faucibus
			tortor. Donec mi justo, vulputate in scelerisque nec, molestie et
			diam. Mauris egestas vehicula turpis, ultricies imperdiet dolor.
			Vestibulum id nunc dui.</div>
	</div>
	</main>
</body>
</html>