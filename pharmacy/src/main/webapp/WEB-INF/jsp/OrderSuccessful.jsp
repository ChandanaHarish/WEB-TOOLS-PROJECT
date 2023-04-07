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
<title>Insert title here</title>
<script>
	
</script>
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
</head>
<body class="container bodyContainer">
<h3 style="width :100%; text-align: center; color:#00000;">ORDER PLACED!</h3>
	<table class="table" style="width: 100%; background-color: #FAF3E5" id="myTable">
		<thead>
			<tr>
				<th scope="col" style="text-align: center;">Medicine Name</th>
				<th scope="col" style="text-align: center;">Total cost</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="text-align: center;">${order.getMedicineorder().getMedicineName()}</td>
				<td style="text-align: center;">${order.getTotalcost()}</td>
			</tr>
		</tbody>
	</table>


	<table class="table" style="width: 100%; background-color: #F4E5C5" id="myTable">
		<thead>
			<tr>
				<th scope="col" style="text-align: center;">Personal Care Name</th>
				<th scope="col" style="text-align: center;">Price of each
					unit</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="pc" items="${sessionScope.personalcare}">
				<tr>
					<td style="text-align: center;">${pc.getPersonalCareName()}</td>
					<td style="text-align: center;">${pc.getPersonalCarePrice()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form action="/" method="get"
		style="margin: 0px; padding: 0px;">
		<button type="submit" class="btn btn-dark" name="user"
			value="customer" style="width: 15em;">LOG OUT</button>
	</form>
</body>
</html>