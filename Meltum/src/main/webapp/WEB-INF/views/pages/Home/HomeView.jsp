<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Page d'accueil</title>
</head>
<body>
	<%@ include file="HomePartialView/ErrorPartialView.jsp"%>
	<div class="container-fluid">
		<div class="row" style="background-color: #303672">
			<img src="<c:url value="/resources/css/Home/Images/Meltum.jpg" />" class="img-responsive" style="max-height: 900px; margin: auto">
		</div>
		<div class="row" style="background-color: #484367">
			<img src="<c:url value="/resources/css/Home/Images/Meltum1.jpg" />" class="img-responsive" style="max-height: 400px; margin: auto">
		</div>
		<div class="row" style="background-color: #5F669D">
			<img src="<c:url value="/resources/css/Home/Images/Meltum2.jpg" />" class="img-responsive" style="max-height: 300px; margin: auto">
		</div>
		<div class="row" style="background-color: #484367">
			<img src="<c:url value="/resources/css/Home/Images/Meltum3.jpg" />" class="img-responsive" style="max-height: 500px; margin: auto">
		</div>
		<div class="row" style="background-color: #303672">
			<img src="<c:url value="/resources/css/Home/Images/MeltumTitre.png" />" class="img-responsive" style="max-height: 500px; margin: auto" />
		</div>
		<div class="row" style="background-color: #303672">
			<img src="<c:url value="/resources/css/Home/Images/EquipeMeltum.PNG" />" class="img-responsive" style="max-height: 500px; margin: auto"> <br> <br>
		</div>
	</div>
</body>
<script>
	var error = "${error}";
	if (error != null) {
		$("#myModal").modal('show');
	}
</script>
</html>