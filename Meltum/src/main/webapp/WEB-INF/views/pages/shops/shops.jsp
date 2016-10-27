<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shops</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- MetisMenu CSS -->
<link href="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.css" />" rel="stylesheet">
<!-- Timeline CSS -->
<link href="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/css/timeline.css" />" rel="stylesheet">
<!-- Custom CSS -->
<link href="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" />" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="<c:url value="/resources/bower_components/morrisjs/morris.css" />" rel="stylesheet">
<!-- Custom Fonts -->
<link href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- Navigation -->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search..."> <span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div> <!-- /input-group -->
				</li>
				<li><a href="#" data-toggle="modal" onclick="initAutocomplete('0');" data-target="#modalAddEditShop0"><i class="fa fa-plus fa-fw"></i> Ajouter un shop</a>
				<li><a href="/Meltum/shops/diffusion"><i class="fa fa-edit fa-fw"></i> Zones de diffusion</a></li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="row">
			<!-- Modal error -->
			<c:if test="${not empty error}">
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header header-error">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title text-white">
									<span class="glyphicon glyphicon-warning-sign icon-white" aria-hidden="true"></span> Erreur
								</h4>
							</div>
							<div class="modal-body">
								<c:out value="${ error }" />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
			</c:if>
			<!-- /.modal -->

			<!-- MODAL -->
			<div class="col-md-12">
				<c:forEach items="${shops}" var="shop">
					<div class="col-md-12">
						<div class="" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="modal-login-label" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-toggle="modal" data-target="#modalRemoveShop${shop.id}">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h3 class="modal-title" id="modal-login-label">${shop.name}</h3>
									</div>
									<div class="modal-body">
										<form role="form" action="" method="post" class="login-form">
											<div class="form-group">
												<c:choose>
													<c:when test="${empty shop.images}">
														<a href="#" data-toggle="modal" data-target="#modalUploadImageShop${shop.id}"><img src="http://placehold.it/865x350" alt=""></a>
													</c:when>
													<c:otherwise>
														<div id="carousel${shop.id}" class="carousel slide" data-ride="carousel">
															<!-- Indicators -->
															<ol class="carousel-indicators">
																<c:forEach items="${shop.images}" var="image" varStatus="loop">
																	<c:choose>
																		<c:when test="${loop.index eq 0}">
																			<li data-target="#carousel${shop.id}" data-slide-to="0" class="active"></li>
																		</c:when>
																		<c:otherwise>
																			<li data-target="#carousel${shop.id}" data-slide-to="${loop.index}"></li>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</ol>
															<!-- Wrapper for slides -->
															<div class="carousel-inner" role="listbox">
																<c:forEach items="${shop.images}" var="image" varStatus="loop">
																	<c:choose>
																		<c:when test="${loop.index eq 0}">
																			<div class="item active">
																				<a href="#" data-toggle="modal" data-target="#modalUploadImageMelt${shop.id}"><img width="565" height="150" src='${imagesShopsLink}${shop.id}/${image.id}'  alt=""></a>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="item">
																				<a href="#" data-toggle="modal" data-target="#modalUploadImageMelt${shop.id}"><img width="565" height="150" src='${imagesShopsLink}${shop.id}/${image.id}'  alt=""></a>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</div>
															<!-- Controls -->
															<a class="left carousel-control" href="#carousel${shop.id}" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
															</a> <a class="right carousel-control" href="#carousel${shop.id}" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
															</a>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="form-group">
												<label class="sr-only" for="form-username">Description</label>
												<p>
													<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> ${shop.description}
												</p>
											</div>
											<div class="form-group">
												<label class="sr-only" for="form-username">Adresse</label>
												<p>
													<span class="glyphicon glyphicon-home" aria-hidden="true"></span> ${shop.adresse.fullAdress}
												</p>
											</div>
											<div class="form-group">
												<label class="sr-only" for="form-username">Téléphone</label>
												<p>
													<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span> ${shop.phone}
												</p>
											</div>
											<button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" onclick="initAutocomplete('${shop.id}');" data-target="#modalAddEditShop${shop.id}">Modifier</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%@ include file="modalUploadImageShop.jsp"%>
					<%@ include file="modalAddEditShop.jsp"%>
					<%@ include file="modalRemoveShop.jsp"%>
				</c:forEach>
			</div>
		</div>
		<%@ include file="modalAddEditShop.jsp"%>
	</div>
</body>
<!-- Metis Menu Plugin JavaScript -->
<script src="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.js" />"></script>
<!-- Morris Charts JavaScript -->
<script src="<c:url value="/resources/bower_components/raphael/raphael-min.js" />"></script>
<!-- Custom Theme JavaScript -->
<script src="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js" />"></script>
<script src="<c:url value="/resources/js/googleAdressSearch.js" />"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHWNArOBPWU4NbT6sMlENXfB5hGSjayfM&signed_in=true&libraries=places"></script>
<script type="text/javascript">
	var error = "${error}";
	if (error != null) {
		$("#myModal").modal('show');
	}
</script>
</html>
