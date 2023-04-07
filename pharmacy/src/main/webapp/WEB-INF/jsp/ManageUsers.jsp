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
<title>Manage Users</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body
	style="display: flex; flex-wrap: wrap; justify-content: start; margin: 15px; background-image: url('https://thumbs.dreamstime.com/b/prescription-pills-electronic-tablet-prescription-pills-strewn-electronic-table-opened-to-186616119.jpg'); height: 10vh;">
	<div
		style="width: 100%; display: flex; justify-content: start; margin: 25px;">
		<div style="width: 50%;">
			<div style="display: flex; justify-content: start; color: #ffffff">
				<h3><i>Users</i></h3>
			</div>
			<form class="d-flex" action="/search.htm" method="post">
				<input class="form-control me-2" type="search"
					placeholder="Search with username" name="searchTerm"
					aria-label="Search" style="background-color: #F3E5CE">
				<button class="btn btn-secondary" type="submit" style="width: 80%">SEARCH USERS</button>
			</form>
			<!--  <p style="margin-top: 5px;">*Search empty to display all
				available users</p>-->
		</div>
	</div>
	<div>
		<p style = "color: #ffffff; margin: 3px;"><i>Add new users?</i></p>
		<div style="margin: 0px;">
			<form action="/addUser.htm" method="post" class="d-flex">
				<div class="container">
					<div class="row mb-3">
						<div class="col-12">
							<input type="text" class="form-control" id="firstName"
								name="firstname" placeholder="First Name" required pattern="[A-Za-z]+" maxlength="45" style="background-color: #F3E5CE">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-12">
							<input type="text" class="form-control" id="lastName"
								name="lastname" placeholder="Last Name" required pattern="[A-Za-z]+" maxlength="45" style="background-color: #F3E5CE">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-12">
							<input type="text" class="form-control" id="username"
								name="username" placeholder="User Name" required pattern="[A-Za-z0-9]+" maxlength="45" style="background-color: #F3E5CE">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-12">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Password" required pattern="[A-Za-z0-9]+" maxlength="45" style="background-color: #F3E5CE">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-12">
							<input type="text" class="form-control" id="age" required name="age"
								placeholder="Age" style="background-color: #F3E5CE" required pattern="[0-9]+" maxlength="2">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-12">
							<input type="text" class="form-control" id="address"
								name="address" placeholder="Address" style="background-color: #F3E5CE" pattern="[A-Za-z0-9 ]+" maxlength="45">
						</div>
					</div>
					<div class="col-12 mb-3">
						<label for="role" class="col-12" style="color: #ffffff"><i>Role</i></label> <select id="role"
							class="form-control col-12" name="role" style="background-color: #F3E5CE">
							<option selected>Choose role</option>
							<option>Admin</option>
							<option>Supplier</option>
							<option>Consumer</option>
						</select>
					</div>
					<div style="display: flex; justify-content: center;">
						<button type="submit" class="btn btn-secondary mb-3 "
							style="width: 100%">CREATE USER</button>
					</div>

				</div>
			</form>
			<form action="/navigate.htm" method="get"
				style="margin: 0px; padding: 0px; display: flex; justify-content: center;">
				<button type="submit" class="btn btn-dark" name="page"
					value="AdminDashboard" style="width: 100%;">BACK</button>
			</form>
		</div>
	</div>
</body>
</html>