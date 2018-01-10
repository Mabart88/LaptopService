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
<c:if test="${not empty logged}">Zalogowany jako ${logged.getFirstName() } ${logged.getLastName() } <a href="logout">Wyloguj</a><br> </c:if>
<c:if test="${logged.isAdmin() }"><a href="admin/users">Panel administratora<br></a></c:if>
Witamy w serwisie :)<br>
<a href="login">Logowanie</a>
<a href="register">Rejestracja</a>
${info }
</body>
</html>