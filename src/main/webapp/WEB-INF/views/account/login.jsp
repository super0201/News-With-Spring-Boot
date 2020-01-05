<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="/account/login">
		<input type="text" id="id" name="id" /> 
		<br>
		<input type="password" id="password" name="password" />
		<br>
		<button type="submit" class="btn btn-primary float-right">Click</button>
		<br>
	</form>
	<br>
	<br>
	${message}
</body>
</html>