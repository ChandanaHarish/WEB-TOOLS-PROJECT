<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="container" style="justity-content: start">
	<div class="bodyContainer" style="justity-content: start">
	<div style="justity-content: start">
	<form action="/updateUser.htm" method="post" class="d-flex">
 		<p>FirstName</p>
		<input type="text" pattern="[A-Za-z]+" maxlength="45" style="background-color: #FAF3E5" name="firstname" value="${userData.getFirstname()}" />
		<p>Lastname</p>
		<input type="text" pattern="[A-Za-z]+" maxlength="45" style="background-color: #FAF3E5" name="lastname" value="${userData.getLastname()}" />
		<p>Password</p>
		<input type="hidden" name="username" pattern="[A-Za-z0-9]+" maxlength="45" value="${userData.getUsername()}" />
		<input type="text" pattern="[A-Za-z0-9]+" maxlength="45" style="background-color: #FAF3E5" name="password" value="${userData.getPassword()}" />
		<p>Address</p>
		<input type="text" pattern="[A-Za-z0-9 ]+" maxlength="45"style="background-color: #FAF3E5" name="address" value="${userData.getAddress()}" />
		<p>Age</p>
		<input type="text" pattern="[0-9]+" maxlength="3"style="background-color: #FAF3E5" name="age" value="${userData.getAge()}" /> 
		<p>Role</p>
			<input type="text" style="background-color: #FAF3E5" name="role" value="${userData.getRole()}" />
			<div><button type="submit" class="btn btn-secondary" style="margin-top: 15px; background-color: #808B96; color: #fff; width: 9em; height: 2.5em">UPDATE</button></div>
	</form>
	<div
		style="display: flex; justify-content: start; flex-wrap: wrap; margin-top: 15px; width: 100%">
		<form action="/" method="get">
			<button style="background-color: #000000; color: #fff; width: 9em; height: 2.5em" name="page"
				value="SearchResultMedicine">LOG OUT</button>
		</form>
	</div>
</body>
</html>