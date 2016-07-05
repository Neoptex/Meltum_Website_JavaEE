<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="<c:url value="/resources/css/modal.css" />" rel="stylesheet">
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
				<li><a href="#" data-toggle="modal" data-target="#modalAddShop"><i class="fa fa-plus fa-fw"></i> Ajouter un shop</a>
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
												<label class="sr-only" for="form-username">Description</label>
												<p>${shop.description}</p>
											</div>
											<div class="form-group">
												<label class="sr-only" for="form-username">Adresse</label>
												<p>${shop.adresse.street} ${shop.adresse.city} ${shop.adresse.postalcode}</p>
											</div>
											<div class="form-group">
												<label class="sr-only" for="form-username">Téléphone</label>
												<p>${shop.phone}</p>
											</div>
											<button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#modalEditShop${shop.id}">Modifier</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%@ include file="modalEditShop.jsp"%>
					<%@ include file="modalRemoveShop.jsp"%>
				</c:forEach>
			</div>
		</div>
		<%@ include file="modalAddShop.jsp"%>
	</div>
</body>
<!-- Metis Menu Plugin JavaScript -->
<script src="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.js" />"></script>
<!-- Morris Charts JavaScript -->
<script src="<c:url value="/resources/bower_components/raphael/raphael-min.js" />"></script>
<!-- Custom Theme JavaScript -->
<script src="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js" />"></script>
<script type="text/javascript">
var error = "${error}";
if (error != null) {
	$("#myModal").modal('show');
}
</script>
</html>
