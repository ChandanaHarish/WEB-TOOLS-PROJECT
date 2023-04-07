<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
</head>
<body
	style="display: flex; flex-wrap: wrap; justify-content: start; margin: 15px;">
	<div
		style="width: 100%; display: flex; justify-content: start; margin: 25px; flex-wrap: wrap;">
		<div style="width: 50%;">
			<form action="/updatePersonalCare.htm" method="post" class="d-flex"
				style="display: flex; flex-wrap: wrap; justify-content: start;">
				<label style="width: 100%;"><b>Personal Care name</b></label> <span
					style="width: 100%; margin-bottom: 15px; background-color: #cecccc">${PersonalCareData.getPersonalCareName()}</span>
				<label style="width: 100%;"><b>Quantity</b></label> <input type="text" style="width: 100%; margin-bottom: 15px; background-color: #FAF3E5" pattern="[0-9]+" maxlength="3"; 
					name="personalCareQuantity" value="${PersonalCareData.getPersonalCareQuantity()}" /> <label
					style="width: 100%;"><b>Price</b></label><input type="text" name="personalCarePrice" pattern="[0-9\.]+" maxlength="10"
					style="width: 100%; margin-bottom: 15px; background-color: #FAF3E5"
					value="${PersonalCareData.getPersonalCarePrice()}" /> <input type="hidden"
					name="personalCareName" value="${PersonalCareData.getPersonalCareName()}" />
				<button types="submit" class="btn btn-secondary" style="width: 100%">Update</button>
			</form>
			<div
				style="display: flex; justify-content: start; flex-wrap: wrap; margin-top: 15px;">
				<form action="/" method="get">
					<button class="btn btn-dark" name="page"
						value="SearchResultMedicine" style="width: 21.5em">Log out</button>
				</form>
			</div>
		</div>
</body>
</html>