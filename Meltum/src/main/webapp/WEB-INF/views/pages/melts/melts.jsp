<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Boutique</title>
<link href="<c:url value="/resources/css/shop.css" />" rel="stylesheet">
</head>
<body>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<p class="lead">Meltum</p>
				<div class="list-group">
					<!-- Button modal for add melt -->
					<a href="#" class="list-group-item" data-toggle="modal" data-target="#modalAddMelt">Ajouter un melt</a>
				</div>
			</div>
			<div class="col-md-9"></div>
		</div>
		<%@ include file="modalAddMelt.jsp"%>
	</div>
</body>
</html>
