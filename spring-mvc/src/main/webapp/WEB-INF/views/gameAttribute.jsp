<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>Plane Shootout - Routes </title>
</head>
<body>
	<h1>Plane Shootout - Routes</h1>
	<div class="row">
 <div class="col-md-1"></div>
 <div class="col-md-10">
	<form role="form" action="/smvc/planes/addGame?step=addRoutes"" method="POST">
		<h1>Planes</h1>
		<select name="plane">
			<c:forEach var="p" items="${planes}">
				<option value="${p.name}">${p.name}</option>
			</c:forEach>
		</select><br />
		<h1>Routes</h1>
		<select name="route">
			<c:forEach var="r" items="${routes}">
				<option value="${r.name}">${r.name}</option>
			</c:forEach>
		</select>
		<br>
		<button type="submit">Add Game</button>
	</form>
</div>
 <div class="col-md-1"></div>
</div>

</body>
</html>
