<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Customer Portal</title>
<style>
.bodyContainer {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}

.selected {
	background-color: #DFDFDE;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	function tableRowClick(element, medicineID, medicineName, medicineDescription, price) {
		document.getElementById("ErrorSubmitText").hidden = true;
		$(element).addClass('selected').siblings().removeClass('selected');
		ele = document.getElementById("hiddenSubmitInput");
		var obj = {};
		obj.medicineID = medicineID;
		obj.medicineName = medicineName;
		obj.medicineDescription = medicineDescription;
		obj.price = price;
		ele.value = JSON.stringify(obj);
	};

	function onMedicineSelect() {
		ele = document.getElementById("hiddenSubmitInput");
		if (null != ele.value && ele.value !== "") {
			document.getElementById("ErrorSubmitText").hidden = true;

			document.getElementById("submitForm").submit();
		} else {
			document.getElementById("ErrorSubmitText").hidden = false;
		}
	};
</script>
</head>
<body
	style="margin: 15px; display: flex; flex-wrap: wrap; justify-content: center; height: 648px; align-items: center;">
	<div
		style="width: 100%; display: flex; flex-wrap: wrap; justify-content: center;">
		<h2 style="width: 100%; text-align: center;">PLACE ORDER</h2>
		<br />
		<h6 style="width: 100%; text-align: start;"><i>Select Medicine</i></h6>
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
		<form action="/choosePersonalCare.htm" method="post" id="submitForm">
			<input type="hidden" name="selectedRow" id="hiddenSubmitInput" />
		</form>
		<div>
			<button type="button" class="btn btn-secondary mb-3 col-auto"
				onclick="onMedicineSelect()">SELECT MEDICINE</button>
		</div>
		<div id="ErrorSubmitText" hidden=true
			style="width: 100%; text-align: center;">
			<p class="text-danger">Select a row</p>
		</div>
	</div>
	<div
		style="display: flex; justify-content: center; flex-wrap: wrap; margin-top: 25px;">
		<form action="/" method="get">
			<button class="btn btn-dark" name="page"
				value="SearchResultMedicine" style="width: 10em">LOG OUT</button>
		</form>
	</div>
</body>
</html>