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
</head>
<body>
	<table>
		<tr>
			<td>Imię i nazwisko</td>
			<td>Email</td>
			<td>Uprawnienia serwisanta</td>
			<td>Usuwanie</td>
		</tr>
		<c:forEach items="${users }" var="user">
			<tr>
				<td>${user.firstName } ${user.lastName }</td>
				<td>${user.email }</td>
				<td><a href="makeRepairman/${user.id }">Zmień uprawnienia</a></td>
				<td><a href="delete/${user.id }">Usuń</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>