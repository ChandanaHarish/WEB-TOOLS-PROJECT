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
	<form style="width: 100%;" class="bodyContainer"
		action="/createOrder.htm" method="post">
		<table class="table" style="width: 100%; background-color: #EFEBE4" id="myTable">
			<thead>
				<tr>
					<th scope="col" style="text-align: center;">Personal Care Name</th>
					<th scope="col" style="text-align: center;">Personal Care Price</th>
					<th scope="col" style="text-align: center;">Checkbox</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="personalcare" items="${PersonalCareData}">
					<tr>
						<td style="text-align: center;">${personalcare.getPersonalCareName()}</td>
						<td style="text-align: center;">${personalcare.getPersonalCarePrice()}</td>
						<td style="text-align: center;"><input type="checkbox"
							name="PersonalCareCheckbox" id="${personalcare.getPcID()}"
							value="${personalcare.getPersonalCareName()}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="submit" class="btn btn-secondary mb-3 col-auto">FINALIZE ORDER
			</button>
	</form>
	<div
		style="display: flex; justify-content: start; flex-wrap: wrap; margin-top: 2px;">
		<form action="/" method="get">
			<button class="btn btn-dark" name="page"
				value="SearchResultMedicine" style="width: 9em">LOG OUT</button>
		</form>
	</div>
</body>
</html>