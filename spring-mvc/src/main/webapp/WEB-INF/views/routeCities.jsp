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
	<form role="form" action="/smvc/planes/addRoute?step=routeCities" method="POST">
		<select name="city">
			<c:forEach var="c" items="${cities}">
				<option value="${c.name}">${c.name}</option>
			</c:forEach>
		</select>
		<br>
		<button type="submit">Add Route</button>
	</form>
	
	<form role="form" action="/smvc/planes/addRoute?step=done" method="POST">
		<button type="submit">Finalize Route</button>
	</form>
</div>
 <div class="col-md-1"></div>
</div>

</body>
</html>
