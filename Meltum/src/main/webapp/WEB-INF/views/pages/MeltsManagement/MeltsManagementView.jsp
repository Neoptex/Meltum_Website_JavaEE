<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gestion des melts</title>
<link href="<c:url value="/resources/css/MeltsManagement.css" /> " rel="stylesheet">
<link href="<c:url value="/resources/Wickedpicker/stylesheets/wickedpicker.css" /> " rel="stylesheet">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/Wickedpicker/src/wickedpicker.js" /> "></script>
<script type="text/javascript" src="<c:url value="/resources/Parsey/parsley.min.js" /> "></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="page-header">
				<h1>
					Gestion des melts <small>(Réductions)</small>
				</h1>
			</div>
		</div>
		<div class="row">
			<!-- Menu filtre shop -->
			<div class="col-md-3">
				<div class="row">
					<button type="button" class="btn btn-success btn-lg btn-block" data-toggle="modal" data-target="#AddMelt">
						<i class="fa fa-plus fa-fw"></i> Ajouter un melt
					</button>
					<%@ include file="MeltsPartialView/AddMeltPartialView.jsp"%>
					<hr>
				</div>
				<div class="row">
					<ul class="nav nav-pills nav-stacked">
						<li class="${idShop == null ? 'active' : '' }"><a href="/Meltum/MeltsManagement">Tous les shops</a></li>
						<c:forEach items="${shops}" var="shop">
							<li class="${idShop == shop.id ? 'active' : '' }"><a href="/Meltum/MeltsManagement/${shop.id}">${shop.name}</a></li>
						</c:forEach>
					</ul>
					<hr>
				</div>
			</div>
			<!-- Liste des melts -->
			<div class="col-md-9">
				<c:forEach items="${melts}" var="melt" varStatus="loop">
					<%@ include file="MeltsPartialView/EditMeltPartialView.jsp"%>
					<%@ include file="MeltsPartialView/RemoveMeltPartialView.jsp"%>
					<%@ include file="MeltsPartialView/UploadMeltImagePartialView.jsp"%>
					<div class="panel panel-success">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-1">
									<c:choose>
										<c:when test="${melt.status == true}">
											<input type="checkbox" checked data-toggle="toggle" data-on="Activer" data-off="Désactiver" data-size="mini" data-onstyle="success" data-offstyle="danger" onchange="changeStatus('${melt.id}')">
										</c:when>
										<c:otherwise>
											<input type="checkbox" data-toggle="toggle" data-on="Activer" data-off="Désactiver" data-size="mini" data-onstyle="success" data-offstyle="danger" onchange="changeStatus('${melt.id}')">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-md-6">
									<h2 class="panel-title">
										&nbsp;&nbsp;&nbsp;&nbsp;${melt.name} <span class="text-info">${melt.hourMinuteMinTime} - ${melt.hourMinuteMaxTime}</span>
									</h2>
								</div>
								<div class="col-md-5">
									<div class="text-right">
										<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#UploadMeltImage${melt.id}">
											<i class="fa fa-cloud-upload"></i> Upload
										</button>
										<button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#EditMelt${melt.id}">
											<i class="fa fa-pencil fa-fw"></i> Modifier
										</button>
										<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#RemoveMelt${melt.id}">
											<i class="fa fa-trash fa-fw"></i> Supprimer
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">
								<!-- Image -->
								<div class="col-md-3">
									<c:choose>
										<c:when test="${empty melt.images}">
											<a href="#"><img class="img-responsive" src="http://placehold.it/250x250" alt=""></a>
										</c:when>
										<c:otherwise>
											<div id="carousel${melt.id}" class="carousel slide" data-ride="carousel">
												<!-- Indicators -->
												<ol class="carousel-indicators">
													<c:forEach items="${melt.images}" var="image" varStatus="loop">
														<c:choose>
															<c:when test="${loop.index eq 0}">
																<li data-target="#carousel${melt.id}" data-slide-to="0" class="active"></li>
															</c:when>
															<c:otherwise>
																<li data-target="#carousel${melt.id}" data-slide-to="${loop.index}"></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</ol>
												<div class="carousel-inner" role="listbox">
													<c:forEach items="${melt.images}" var="image" varStatus="loop">
														<c:choose>
															<c:when test="${loop.index eq 0}">
																<div class="item active">
																	<a href="#" data-toggle="modal" data-target="#modalUploadImageMelt${melt.id}"><img class="img-responsive" src='${imagesMeltsLink}${melt.id}/${image.id}' style="margin: auto"></a>
																</div>
															</c:when>
															<c:otherwise>
																<div class="item">
																	<a href="#" data-toggle="modal" data-target="#modalUploadImageMelt${melt.id}"><img class="img-responsive" src='${imagesMeltsLink}${melt.id}/${image.id}' style="margin: auto"></a>
																</div>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</div>
												<!-- Controls -->
												<a class="left carousel-control" href="#carousel${melt.id}" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
												</a> <a class="right carousel-control" href="#carousel${melt.id}" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
												</a>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<!-- Body du melt -->
								<div class="col-md-9">
									<blockquote style="border-left-color: #468847;">
										<c:forEach items="${melt.tags}" var="tag">
											<span class="label label-info">${tag}</span>
										</c:forEach>
										<p>Nombre de melt disponible : ${melt.nbrAvailable}</p>
										<h5>
											Prix conseillé :
											<del>${melt.priceInit}€</del>
										</h5>
										<p class="text-danger">Prix : ${melt.price}€</p>

										<p>${melt.description}</p>
									</blockquote>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function changeStatus(id) {
			 $.ajax({
			       url : '/Meltum/MeltsManagement/ChangeStatus/' + id,
			       type : 'POST'
			    });
		}
	</script>
</body>
</html>
