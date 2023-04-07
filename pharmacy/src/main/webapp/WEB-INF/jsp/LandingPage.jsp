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
<style>
@
use postcss-preset-env {
	stage: 0;
}

/* helpers/align.css */
.align {
	display: grid;
	place-items: start;
}

/* helpers/grid.css */
:root { -
	-gridMaxWidth: 24em; -
	-gridWidth: 90%;
}

.grid {
	inline-size: var(- -gridWidth);
	margin-inline: auto;
	max-inline-size: var(- -gridMaxWidth);
}

/* helpers/icon.css */
.icon {
	block-size: 1.25em;
	display: inline;
	inline-size: 1.25em;
	line-height: 1.25em;
	margin-right: 0.625em;
	text-align: center;
	vertical-align: middle;
}

.icon--info {
	background-color: #e5e5e5;
	border-radius: 100%;
}

/* layout/base.css */
:root { -
	-bodyBackgroundColor: #eaeaea; -
	-bodyColor: #999; -
	-bodyFontFamily: 'Helvetica', 'Arial'; -
	-bodyFontFamilyFallback: sans-serif; -
	-bodyFontSize: 0.875rem; -
	-bodyFontWeight: 400; -
	-bodyLineHeight: 1.5;
}

*, *::before, *::after {
	box-sizing: inherit;
}

html {
	box-sizing: border-box;
}

body {
	background-color: var(- -bodyBackgroundColor);
	font-family: var(- -bodyFontFamily), var(- -bodyFontFamilyFallback);
	font-size: var(- -bodyFontSize);
	font-weight: var(- -bodyFontWeight);
	line-height: var(- -bodyLineHeight);
	margin: 0;
	min-block-size: 100vh;
}

/* modules/anchor.css */
:root { -
	-anchorColor: inherit; -
	-anchorHoverColor: #1dabb8;
}

a {
	color: var(- -anchorColor);
	text-decoration: none;
	transition: color 0.3s;
}

a:hover {
	color: var(- -anchorHoverColor);
}

/* modules/form.css */
fieldset {
	border: none;
	margin: 0;
}

input {
	appearance: none;
	border: none;
	font: inherit;
	margin: 0;
	outline: none;
	padding: 0;
	margin-bottom: 10px;
}

input[type='submit'] {
	cursor: pointer;
}

.form input[type='text'], .form input[type='password'] {
	inline-size: 100%;
}

/* modules/login.css */
:root { -
	-loginBorderRadius: 5em; -
	-loginHeaderBackgroundColor: #282830; -
	-loginInputBorderRadius: 0.25em;
}

.login__header {
	background-color: var(- -loginHeaderBackgroundColor);
	border-top-left-radius: var(- -loginBorderRadius);
	border-top-right-radius: var(- -loginBorderRadius);
	color: #fff;
	padding: 1.5em;
	text-align: center;
	text-transform: uppercase;
}

.login__title {
	font-size: 1rem;
	margin: 0;
}

.login__body {
	background-color: #EAF9FA;
	padding: 1.5em;
	position: relative;
}

.login__body::before {
	background-color: #fff;
	content: '';
	height: 0.5em;
	left: 50%;
	margin-left: -0.25em;
	margin-top: -0.25em;
	position: absolute;
	top: 0;
	transform: rotate(45deg);
	width: 0.5em;
}

.login input[type='text'], .login input[type='password'] {
	border: 0.0625em solid #e5e5e5;
	padding: 1em 1.25em;
}

.login input[type='text'] {
	border-top-left-radius: var(- -loginInputBorderRadius);
	border-top-right-radius: var(- -loginInputBorderRadius);
}

.login input[type='password'] {
	border-bottom-left-radius: var(- -loginInputBorderRadius);
	border-bottom-right-radius: var(- -loginInputBorderRadius);
	border-top: 0;
}

.login input[type='submit'] {
	background-color: #1dabb8;
	border-radius: var(- -loginInputBorderRadius);
	color: #fff;
	font-weight: 700;
	order: 1;
	padding: 0.75em 1.25em;
	transition: background-color 0.3s;
}

.login input[type='submit']:focus, .login input[type='submit']:hover {
	background-color: #198d98;
}

.login__footer {
	align-items: center;
	background-color: #EAF9FA;
	border-bottom-left-radius: var(- -loginBorderRadius);
	border-bottom-right-radius: var(- -loginBorderRadius);
	display: flex;
	justify-content: space-between;
	padding-bottom: 1.5em;
	padding-left: 1.5em;
	padding-right: 1.5em;
}

.login__footer p {
	margin: 90;
}
</style>
</head>
<body class="align" style="background-image: url('https://images.unsplash.com/photo-1585435557343-3b092031a831?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhhcm1hY3l8ZW58MHx8MHx8&w=1000&q=80'); width: 28em;">
	<script type="text/javascript">
		function preventBack() {
			window.history.forward();
		}
		setTimeout("preventBack()", 0);
		window.onunload = function() {
			null
		};
	</script>
	<div class="grid">

		<form action="/login.htm" method="post" class="form login">

			<header class="login__header">
				<h3 class="login__title">Pharmacy Management System</h3>
			</header>

			<div class="login__body">

				<div class="form__field" style="margin-bottom: 15px">
					<input type="text" placeholder="Username" required name="username" pattern="[A-Za-z0-9]+" maxlength="30">
				</div>
				
				<div class="form__field">
					<input type="password" placeholder="Password" required
						name="password" pattern="[A-Za-z0-9]+" maxlength="30">
				</div>

			</div>

			<footer class="login__footer">
				<input type="submit" value="Login">
				
				

				<p>
					<span class="icon icon--info">?<a href="/register.htm"></span>Sign
						up</a>
				</p>
			</footer>

		</form>

	</div>

</body>
</html>