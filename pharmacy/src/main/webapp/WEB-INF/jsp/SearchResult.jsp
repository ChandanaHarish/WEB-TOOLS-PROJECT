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
<title>User Search</title>
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
	function onInputChange(e) {
	}

	function tableRowClick(element, id, fname, lname, uname, pwd, addr, role,
			age) {
		document.getElementById("ErrorDeleteText").hidden = true;
		document.getElementById("ErrorUpdateText").hidden = true;
		$(element).addClass('selected').siblings().removeClass('selected');
		ele = document.getElementById("hiddenDeleteInput");
		ele1 = document.getElementById("hiddenUpdateInput");
		var obj = {};
		obj.id = id;
		obj.firstname = fname;
		obj.lastname = lname;
		obj.username = uname;
		obj.password = pwd;
		obj.address = addr;
		obj.role = role;
		obj.age = age;
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
					<th scope="col">Username</th>
					<th scope="col">Firstname</th>
					<th scope="col">Lastname</th>
					<th scope="col">Age</th>
					<th scope="col">Address</th>
					<th scope="col">Role</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${searchResult}">
					<tr
						onclick="tableRowClick(this, '${user.getId()}','${user.getFirstname()}','${user.getLastname()}', '${user.getUsername()}', '${user.getPassword()}', '${user.getAddress()}', '${user.getRole()}', '${user.getAge()}')">
						<td>${user.getUsername()} </td>
						<td>${user.getFirstname()}</td>
						<td>${user.getLastname()} </td>
						<td>${user.getAge()} </td>
						<td>${user.getAddress()}</td>
						<td>${user.getRole()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form action="/deleteUser.htm" method="post" id="deleteForm">
			<input type="hidden" name="selectedRow" id="hiddenDeleteInput" />
		</form>
		<form action="/navigateToUpdateUser.htm" method="post" id="updateForm">
			<input type="hidden" name="selectedRow" id="hiddenUpdateInput" />
		</form>
		<div>
			<button type="button" class="btn btn-secondary mb-3 col-auto"
				onclick="onDelete()">DELETE USER</button>
				<button type="submit" class="btn btn-light mb-3 col-auto"
					onclick="onUpdate()">UPDATE USER</button>
			</form>
			<form action="/navigate.htm" method="get"
				style="margin: 0px; padding: 0px;">
				<button type="submit" class="btn btn-dark" name="page"
					value="ManageUsers" style="width: 100%;">BACK</button>
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