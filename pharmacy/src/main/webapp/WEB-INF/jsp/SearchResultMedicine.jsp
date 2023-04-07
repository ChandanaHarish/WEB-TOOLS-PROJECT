<%@page import="com.google.gson.GsonBuilder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.google.gson.Gson"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Pizza Search</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>
<style>
.bodyContainer {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}

.selected {
	background-color: #7E6B49;
}
</style>
<script type="text/javascript">
	function tableRowClick(element, medicineID, medicineName, medicineDescription, price) {
		document.getElementById("ErrorDeleteText").hidden = true;
		document.getElementById("ErrorUpdateText").hidden = true;
		$(element).addClass('selected').siblings().removeClass('selected');
		ele = document.getElementById("hiddenDeleteInput");
		ele1 = document.getElementById("hiddenUpdateInput");
		var obj = {};
		obj.medicineID = medicineID;
		obj.medicineName = medicineName;
		obj.medicineDescription = medicineDescription;
		obj.price = price;
		ele.value = JSON.stringify(obj);
		ele1.value = JSON.stringify(obj);
	};

	function onDelete() {
		ele = document.getElementById("hiddenDeleteInput");
		if (null != ele.value && ele.value !== "") {
			document.getElementById("ErrorDeleteText").hidden = true;

			document.getElementById("deleteForm").submit();
		} else {
			document.getElementById("ErrorDeleteText").hidden = false;
		}
	};
	function onUpdate() {
		ele = document.getElementById("hiddenUpdateInput");
		if (null != ele.value && ele.value !== "") {
			document.getElementById("ErrorUpdateText").hidden = true;
			document.getElementById("updateForm").submit();
		} else {
			document.getElementById("ErrorUpdateText").hidden = false;
		}
	};
</script>
</head>
<body class="container">
	<div class="bodyContainer">
		<table class="table" style="width: 100%; background-color: #EFEBE4" id="myTable">
			<thead>
				<tr>
					<th scope="col">Medicine Name</th>
					<th scope="col">Medicine Description</th>
					<th scope="col">Price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="medicine" items="${searchResult}">
					<tr
						onclick="tableRowClick(this, '${medicine.getMedicineID()}','${medicine.getMedicineName()}','${medicine.getMedicineDescription()}', '${medicine.getPrice()}')">
						<td>${medicine.getMedicineName()}</td>
						<td>${medicine.getMedicineDescription()}</td>
						<td>${medicine.getPrice()}</td>
					</tr>
				</c:forEach>
				</tbody>
		</table>
		<form action="/deleteMedicine.htm" method="post" id="deleteForm">
			<input type="hidden" name="selectedRow" id="hiddenDeleteInput" />
		</form>
		<form action="/navigateToUpdateMedicine.htm" method="post" id="updateForm">
			<input type="hidden" name="selectedRow" id="hiddenUpdateInput" />
		</form>
		<div>
			<button type="button" class="btn btn-secondary mb-3 col-auto"
				onclick="onDelete()">DELETE MEDICINE</button>
			<button type="button" class="btn btn-light mb-3 col-auto"
				onclick="onUpdate()">UPDATE MEDICINE</button>
			<form action="/navigate.htm" method="get"
				style="margin: 0px; padding: 0px;">
				<button type="submit" class="btn btn-dark" name="page"
					value="ManageMedicine" style="width: 100%;">BACK</button>
			</form>
		</div>
		<div id="ErrorDeleteText" hidden=true
			style="width: 100%; text-align: center;">
			<p class="text-danger">Select a row to delete</p>
		</div>
		<div id="ErrorUpdateText" hidden=true
			style="width: 100%; text-align: center;">
			<p class="text-danger">Select a row to update</p>
		</div>
	</div>
</body>
</html>