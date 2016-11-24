<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shops</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="/resources/css/ShopsManagement.css" /> " rel="stylesheet">

<link rel="stylesheet" href="https://openlayers.org/en/v3.19.0/css/ol.css" type="text/css">
<!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
<script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
<script src="https://openlayers.org/en/v3.19.0/build/ol.js"></script>

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
    <div class="container">
        <div class="row">
            <div class="page-header">
                <h1>Gestion des shops</h1>
            </div>
        </div>
        <div class="row">
            <!-- Menu filtre shop -->
            <div class="col-md-3">
                <div class="row">
                    <button type="button" class="btn btn-success btn-lg btn-block" onclick="initAutocomplete('0');" data-toggle="modal" data-target="#AddShop">
                        <i class="fa fa-plus fa-fw"></i> Ajouter un shop
                    </button>
                    <%@ include file="ShopsPartialView/AddShopPartialView.jsp"%>
                    <hr>
                </div>
                <div class="row">
                    <a href="/Meltum/ShopsManagement/diffusion" class="btn btn-primary btn-lg btn-block"><i class="fa fa-rss fa-fw"></i> Zones de diffusion</a>
                    <hr>
                </div>
            </div>

            <!-- Page Content -->
            <div class="col-md-9">
                <c:forEach items="${shops}" var="shop">
                    <%@ include file="ShopsPartialView/EditShopPartialView.jsp"%>
                    <%@ include file="ShopsPartialView/RemoveShopPartialView.jsp"%>
                    <%@ include file="ShopsPartialView/UploadShopImagePartialView.jsp"%>
                    <%@ include file="ShopsPartialView/DiffusionAreaShopPartialView.jsp"%>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-6">
                                    <h2 class="panel-title">${shop.name}</h2>
                                </div>
                                <div class="col-md-6">
                                    <div class="text-right">
                                        <button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#DiffusionAreaShop${shop.id}">
                                            <i class="fa fa-rss fa-fw"></i> Zone de diffusion
                                        </button>
                                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#UploadImageShop${shop.id}">
                                            <i class="fa fa-cloud-upload fa-fw"></i> Upload
                                        </button>
                                        <button type="button" class="btn btn-warning btn-xs" data-toggle="modal" onclick="initAutocomplete('${shop.id}');" data-target="#modalAddEditShop${shop.id}">
                                            <i class="fa fa-pencil fa-fw"></i> Modifier
                                        </button>
                                        <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#RemoveShop${shop.id}">
                                            <i class="fa fa-trash fa-fw"></i> Supprimer
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <c:choose>
                                        <c:when test="${empty shop.images}">
                                            <a href="#" data-toggle="modal" data-target="#modalUploadImageShop${shop.id}"><img src="http://placehold.it/250x250" alt=""></a>
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
                                                                    <a href="#" data-toggle="modal" data-target="#modalUploadImageMelt${shop.id}"><img width="565" height="150" src='${imagesShopsLink}${shop.id}/${image.id}' alt=""></a>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="item">
                                                                    <a href="#" data-toggle="modal" data-target="#modalUploadImageMelt${shop.id}"><img width="565" height="150" src='${imagesShopsLink}${shop.id}/${image.id}' alt=""></a>
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
                                <div class="col-md-6">
                                    <blockquote style="border-left-color: #1b809e;">
                                        <address>
                                            <p>
                                                <strong>Adresse :</strong>
                                            </p>
                                            <p>
                                                ${shop.adresse.street_number} ${shop.adresse.street}<br> ${shop.adresse.city}, ${shop.adresse.postalcode}<br> ${shop.phone}
                                            </p>
                                            <p>
                                                <strong>Description :</strong>
                                            </p>
                                            <p>${shop.description}</p>
                                        </address>
                                    </blockquote>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Modal error -->
        <c:if test="${not empty error}">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header header-error">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title text-white"><span class="glyphicon glyphicon-warning-sign icon-white" aria-hidden="true"></span> Erreur</h4>
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
    </div>
</body>
<script src="<c:url value="/resources/js/googleAdressSearch.js" />"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHWNArOBPWU4NbT6sMlENXfB5hGSjayfM&signed_in=true&libraries=places"></script>
<script type="text/javascript">
	var error = "${error}";
	if (error != null) {
		$("#myModal").modal('show');
	}
</script>
</html>