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
<title>Manage Medicines</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body
	style="display: flex; flex-wrap: wrap; justify-content: start; margin: 15px; background-image: url('https://thumbs.dreamstime.com/b/prescription-pills-electronic-tablet-prescription-pills-strewn-electronic-table-opened-to-186616119.jpg')">
	<div
		style="width: 100%; display: flex; justify-content: start; margin: 25px;">
		<div style="width: 50%;">
			<!-- <div style="display: flex; justify-content: start;">
				<h3 style="color: #ffffff"><i>Search Medicines</i></h3>
			</div> -->
			<form class="d-flex" action="/searchMedicine.htm" method="post">
				<input class="form-control me-2" type="search" placeholder="Search medicines"
					name="searchTerm" aria-label="Search" style="background-color: #F3E5CE">
				<button class="btn btn-secondary" type="submit">SEARCH</button>
			</form>
		</div>
	</div>
	<div>
		<p style="color: #fff"><i>Add new Medicines?</i></p>
		<div style="margin: 5px;">
			<form action="/addMedicine.htm" method="post" class="d-flex">
				<div class="container">
					<div class="row mb-3">
						<div class="col-12">
							<input type="text" class="form-control" id="medicineName" name="medicineName"
								placeholder="Name" pattern="[A-Za-z]+" maxlength="45" style="background-color: #F3E5CE">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-12">
							<input type="text" class="form-control" id="medicineDescription"
								name="medicineDescription" placeholder="Description" pattern="[A-Za-z]+" maxlength="45" style="background-color: #F3E5CE">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-12">
							<input type="text" class="form-control" id="price" name="price"
								placeholder="Price" maxlength=10 pattern="[0-9\.]+" style="background-color: #F3E5CE">
						</div>
					</div>
					<div style="display: flex; justify-content: center;">
						<button type="submit" class="btn btn-secondary mb-3 "
							style="width: 80%">ADD MEDICINE</button>
					</div>

				</div>
			</form>
			<form action="/navigate.htm" method="get"
				style="margin: 0px; padding: 0px; display: flex; justify-content: center;">
				<button type="submit" class="btn btn-dark" name="page"
					value="ManageStocks" style="width: 80%;">BACK</button>
			</form>
		</div>
	</div>
</body>
</html>