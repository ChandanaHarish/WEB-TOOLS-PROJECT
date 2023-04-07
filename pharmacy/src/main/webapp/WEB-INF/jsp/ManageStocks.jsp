<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Stocks</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
	justify-content: start;
	flex-wrap: wrap;
}

.selected {
	background-color: #FF8C76;
}
</style>
<script type="text/javascript">
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
<body
	style="margin: 90px; display: flex; flex-wrap: wrap; justify-content: start; height: 648px; align-items: start; background-image: url('https://thumbs.dreamstime.com/b/prescription-pills-electronic-tablet-prescription-pills-strewn-electronic-table-opened-to-186616119.jpg'); height: 10vh;">
	<div style="width: 100%;">
		<div
			style="margin-bottom: 15px; width: 100%; display: flex; flex-wrap: wrap; justify-content: start;">
			<form action="/navigate.htm" method="get" style="width: 35%">
				<button type="submit" class="btn" name="page" value="ManageMedicine"
					style="width: 71%; background-color: #534530; color:#ffffff">MANAGE MEDICINES
					</button>
			</form>
		</div>
		<div style="width: 100%;">
			<form action="/navigate.htm" method="get"
				style="display: flex; flex-wrap: wrap; justify-content: start;">
				<button type="submit" class="btn" name="page"
					value="ManagePersonalCare"
					style="width: 25%; background-color: #C87C0C; color: #ffffff">MANAGE PERSONAL CARE
					</button>
			</form>
		</div>
		<div
			style="display: flex; justify-content: start; flex-wrap: wrap; margin-top: 15px;">
			<form action="/navigate.htm" method="get">
				<button class="btn btn-dark" name="page" value="AdminDashboard" style="width: 16.5em">
					BACK</button>
			</form>
		</div>
	</div>
</body>
</html>