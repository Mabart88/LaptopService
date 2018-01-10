<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@	page isELIgnored="false"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
		$("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
	});
</script>
</head>
<body>
	<form:form method="post" modelAttribute="laptop">
	Marka: <form:input path="brand" />
		<form:errors path="brand" />
		<br>
	Model: <form:input path="model" />
		<form:errors path="model" />
		<br>
	Numer seryjny: <form:input path="serialNumber" />
		<form:errors path="serialNumber" />
		<br>
	Data zakupu: <form:input id="datepicker" path="purchaseDate" />
		<input type="submit" value="Dodaj">
		


		${dateError }
		<form:errors path="*" />
	</form:form>

</body>
</html>