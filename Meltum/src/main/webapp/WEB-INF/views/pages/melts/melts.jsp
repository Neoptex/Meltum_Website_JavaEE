<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Melts</title>
<meta charset="utf-8">
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
		<div class="sidebar-nav collapse navbar-collapse">
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
				<li><a href="#" data-toggle="modal" data-target="#modalAddMelt"><i class="fa fa-plus fa-fw"></i> Ajouter un melt</a></li>
				<li><a href="/Meltum/melts/diffusion"><i class="fa fa-edit fa-fw"></i> Zones de diffusion</a></li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="row">
			<ul class="nav nav-tabs">
				<li role="presentation" class="${idShop == null ? 'active' : '' }"><a href="/Meltum/melts">Tous les shops</a></li>
				<c:forEach items="${shops}" var="shop">
					<li role="presentation" class="${idShop == shop.id ? 'active' : '' }"><a href="/Meltum/melts/${shop.id}">${shop.name}</a></li>
				</c:forEach>
			</ul>
			<!-- MODAL -->
			<div class="col-md-12">
				<c:if test="${melts != null}">
					<c:forEach items="${melts}" var="melt">
						<div class="col-md-6">
							<div class="" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="modal-login-label" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-toggle="modal" data-target="#modalRemoveMelt${melt.id}">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h3 class="modal-title" id="modal-login-label">${melt.name}</h3>
										</div>
										<div class="modal-body">
											<form role="form" action="" method="post" class="login-form">
												<div class="form-group">
													<c:choose>
														<c:when test="${empty melt.image}">
															<a href="#" data-toggle="modal" data-target="#modalUploadImageMelt${melt.id}"><img src="http://placehold.it/565x150" alt=""></a>
														</c:when>
														<c:otherwise>
															<a href="#" data-toggle="modal" data-target="#modalUploadImageMelt${melt.id}"><img src="${melt.image}" alt=""></a>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="form-group">
													<label class="sr-only" for="form-username">Description</label>
													<p>${melt.description}</p>
												</div>
												<button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#modalEditMelt${melt.id}">Modifier</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%@ include file="modalUploadImageMelt.jsp"%>
						<%@ include file="modalEditMelt.jsp"%>
						<%@ include file="modalRemoveMelt.jsp"%>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<%@ include file="modalAddMelt.jsp"%>
	</div>
</body>
<!-- Metis Menu Plugin JavaScript -->
<script src="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.js" />"></script>
<!-- Morris Charts JavaScript -->
<script src="<c:url value="/resources/bower_components/raphael/raphael-min.js" />"></script>
<!-- Custom Theme JavaScript -->
<script src="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js" />"></script>
</html>
