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
			<form action="/updateMedicine.htm" method="post" class="d-flex"
				style="display: flex; flex-wrap: wrap; justify-content: center;">
				<label style="width: 100%;"><b>Medicine name</b></label> <span
					style="width: 100%; margin-bottom: 15px; background-color: #cecccc">${MedicineData.getMedicineName()}</span>
				<label style="width: 100%;"><b>Description</b></label> <input type="text"
					name="description" style="width: 100%; margin-bottom: 15px; background-color: #FAF3E5"
					value="${MedicineData.getMedicineDescription()}" pattern="[A-Za-z]+" maxlength="45"/> <label
					style="width: 100%;"><b>Price</label></b><input type="text"
					name="price" value="${MedicineData.getPrice()}"
					style="width: 100%; margin-bottom: 15px; background-color: #FAF3E5" pattern="[0-9\.]+" maxlength="10"/>  <input type="hidden" name="name"
					value="${MedicineData.getMedicineName()}" />
				<button types="submit" class="btn btn-secondary" style="width: 100%">UPDATE</button>
			</form>
			<div
				style="display: flex; justify-content: start; flex-wrap: wrap; margin-top: 15px;">
				<form action="/" method="get">
					<button class="btn btn-dark" name="page"
						value="SearchResultMedicine" style="width: 21.5em">LOG OUT</button>
				</form>
			</div>
		</div>
</body>
</html>