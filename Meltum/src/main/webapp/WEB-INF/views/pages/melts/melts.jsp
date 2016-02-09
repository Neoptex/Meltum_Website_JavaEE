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
			<div class="col-md-9">
				<c:forEach items="${melts}" var="melt">
					<div class="col-md-4">
						<div class="thumbnail">
							<div class="caption">
								<h4 class="pull-right">-(reduction)%</h4>
								<h4>
									<a href="#">${melt.name}</a>
								</h4>
								<p>${melt.description}</p>
							</div>
							<div class="btn-group btn-group-justified" role="group">
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalEditMelt${melt.id}">Modifier</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalRemoveMelt${melt.id}">Supprimer</button>
								</div>
							</div>
						</div>
					</div>
					<%@ include file="modalEditMelt.jsp"%>
					<%@ include file="modalRemoveMelt.jsp"%>
				</c:forEach>
			</div>
		</div>
		<%@ include file="modalAddMelt.jsp"%>
	</div>
</body>
</html>
