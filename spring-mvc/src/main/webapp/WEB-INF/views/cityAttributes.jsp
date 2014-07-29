<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Plane Shootout - City attributes</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

</head>
<body class="container">
	<h1>Plane Shootout - CIty attributes</h1>

<div class="row">
 <div class="col-md-1"></div>
 <div class="col-md-10">
	 	<form role="form" action="/smvc/planes/addCity?step=cityAttributes"
			method="POST">
			<select name="type">
				<c:forEach var="pt" items="${planeTypes}">
					<option value="${pt}">${pt}</option>
				</c:forEach>
			</select> <input name="likelihood" type="number" /> <br> <input
				name="firePower" type="number" /> <br> <br>
			<button type="submit">SET PLANE TYPE</button>
		</form>
	
		<form role="form" action="/smvc/planes/addCity?step=done" method="POST">
			<button type="submit">FINALIZE CITY</button>
		</form>
	</div>
 <div class="col-md-1"></div>
</div>

	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
