<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Admin Portal</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body
	style="margin: 90px; display: flex; flex-wrap: wrap; justify-content: center; height: 648px; align-items: center; background-image: url('https://thumbs.dreamstime.com/b/prescription-pills-electronic-tablet-prescription-pills-strewn-electronic-table-opened-to-186616119.jpg'); height: 10vh;">
	<div style="width: 100%;">
		<div
			style="margin-bottom: 15px; width: 100%; display: flex; flex-wrap: wrap; justify-content: start;">
			<form action="/navigate.htm" method="get" style="width: 35%">
				<button type="submit" class="btn" name="page" value="ManageUsers"
					style="width: 71%; background-color: #534530; color:#ffffff">MANAGE
					USERS</button>
			</form>
		</div>
		<div style="width: 100%;">
			<form action="/navigate.htm" method="get"
				style="display: flex; flex-wrap: wrap; justify-content: start;">
				<button type="submit" class="btn" name="page" value="ManageStocks"
					style="width: 25%; background-color: #C87C0C; color:#ffffff">MANAGE STOCKS</button>
			</form>
		</div>
		<div style="display: flex;justify-content: start; flex-wrap: wrap; margin-top: 15px; width: 35%">
		<form action="/" method="get">
				<button class="btn btn-dark btn-large" style="width: 16.5em">LOG OUT</button>
			</form>
		</div>
	</div>
</body>
</html>