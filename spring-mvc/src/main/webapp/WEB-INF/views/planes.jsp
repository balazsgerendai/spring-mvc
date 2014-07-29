<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Plane Shootout</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="/smvc/resources/js/planes.js"></script>
</head>
<body class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<h2>Cities</h2>
			<table class="table">
				<tr>
					<th>Name</th>
				</tr>
				<c:forEach var="c" items="${cities}">
					<tr>
						<td>${c.name}</td>
					</tr>
				</c:forEach>
			</table>
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Add City</h3>
				</div>
				<div class="panel-body">
					<form role="form" action="/smvc/planes/addCity?step=cityAttributes"
						method="POST">
						<table>
							<tr>
								<td>Name:</td>
								<td><input name="name" type="text"
									value="${sessionScope.cityForm.name}" /></td>
							</tr>
							<tr>
								<td><button type="submit">Add city</button></td>
							</tr>
						</table>


					</form>
				</div>
			</div>

			<h2>Planes</h2>
			<table class="table">
				<tr>
					<th>Name</th>
					<th>Type</th>
					<th>HP</th>
				</tr>
				<c:forEach var="p" items="${planes}">
					<tr>
						<td>${p.name}</td>
						<td>${p.type}</td>
						<td>${p.hp}</td>
					</tr>
				</c:forEach>
			</table>

			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Add plane</h3>
				</div>
				<div class="panel-body">
					<form role="form" action="/smvc/planes/addPlane" method="POST">
						<table>
							<tr>
								<td>Name:</td>
								<td><input name="name" type="text"
									value="${planeForm.name}" /></td>
							</tr>
							<tr>
								<td>Plane type</td>
								<td><select name="type">
										<c:forEach var="pt" items="${planeTypes}">
											<option value="${pt}">${pt}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>Plane Hp:</td>
								<td><input name="hp" type="number" value="${planeForm.hp}" /></td>
							</tr>
							<tr colspan="2">
								<td><button type="submit">ADD PLANE</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<h2>Routes</h2>
			<table class="table">
				<tr>
					<th>Name</th>
					<th>Start</th>
					<th>Goal</th>
					<th>Enroute Cities</th>
				</tr>
				<c:forEach var="r" items="${routes}">
					<tr>
						<td>${r.name}</td>
						<td>${r.start.name}</td>
						<td>${r.goal.name}</td>
						<td><c:forEach var="c" items="${r.enRouteCities }">
								<c:out value="${c.name }"></c:out>
							</c:forEach></td>
					</tr>
				</c:forEach>
			</table>
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Routes</h3>
				</div>
				<div class="panel-body">
					<form role="form" action="/smvc/planes/addRoute?step=routeCities"
						method="POST">
						<table>
							<tr>
								<td>Name</td>
								<td><input name="name" type="text"
									value="${routeForm.name}" /></td>
							</tr>
							<tr>
								<td>Start city</td>
								<td><select name="start">
										<c:forEach var="c" items="${cities}">
											<option value="${c.name}">${c.name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>Goal city</td>
								<td><select name="goal">
										<c:forEach var="c" items="${cities}">
											<option value="${c.name}">${c.name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td><button type="submit">ADD ROUTE</button></td>

							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Game</h3>
				</div>
				<div class="panel-body">
					<form role="form" action="/smvc/planes/addGame?step=addRoutes"
						method="POST">
						<table>
							<tr>
								<td>Name</td>
								<td><input name="name" type="text" /></td>
							</tr>
							<tr>
								<td><button type="submit">ADD GAME</button></td>

							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div id="gameDiv"></div>
	<button id="startGame">PLAY GAME</button>

</body>
</html>
