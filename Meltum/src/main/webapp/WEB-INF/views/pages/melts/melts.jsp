<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Gestion des melts</title>

<!-- Bootstrap -->
<link href="<c:url value="/resources/bootstrap-3.3.7/css/bootstrap.min.css" />" rel="stylesheet">
<!-- Font Awesome -->
<link href="<c:url value="/resources/font-awesome-4.7.0/css/font-awesome.min.css" />" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="<c:url value="/resources/html5shiv/dist/html5shiv.min.js" />"></script>
      <script src="<c:url value="/resources/Respond/dest/respond.min.js" />"></script>
    <![endif]-->
</head>
<body>
    <br />
    <div class="container">
        <div class="row">
            <!-- Menu filtre shop sur la gauche de l'écran -->
            <div class="col-md-3">
                <button type="button" class="btn btn-success btn-lg btn-block" data-toggle="modal" data-target="#modalAddMelt">Ajouter un melt</button>
                <hr>
                <ul class="nav nav-pills nav-stacked">
                    <li class="${idShop == null ? 'active' : '' }"><a href="/Meltum/melts">Tous les shops</a></li>
                    <c:forEach items="${shops}" var="shop">
                        <li class="${idShop == shop.id ? 'active' : '' }"><a href="/Meltum/melts/${shop.id}">${shop.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-9">
                <div class="container">
                    <c:forEach items="${melts}" var="melt" varStatus="loop">
                        <div class=row>
                            <!-- Image -->
                            <div class="col-md-4">
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
                                                                <a href="#" data-toggle="modal" data-target="#modalUploadImageMelt${melt.id}"><img class="img-responsive" src='${imagesMeltsLink}${melt.id}/${image.id}' alt=""></a>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="item">
                                                                <a href="#" data-toggle="modal" data-target="#modalUploadImageMelt${melt.id}"><img class="img-responsive" src='${imagesMeltsLink}${melt.id}/${image.id}' alt=""></a>
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
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3>
                                            <a href="#">${melt.name}</a>
                                        </h3>
                                        <c:forEach items="${melt.tags}" var="tag">
                                            <span class="label label-info">${tag}</span>
                                        </c:forEach>
                                    </div>
                                    <div class="col-md-12">
                                        <h5>Prix conseillé : <del>${melt.prix_init}€</del></h5>
                                        <h4>Prix : ${melt.prix}€</h4> <i class="fa fa-cc-visa fa-2x"></i> <i class="fa fa-cc-paypal fa-2x"></i>
                                    </div>
                                    <div class="col-md-12">
                                        <h6>${melt.description}</h6>
                                    </div>
                                    <div class="col-md-12">
                                        <button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modalEditMelt${melt.id}">Modifier</button>
                                        <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modalRemoveMelt${melt.id}">Supprimer</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <%@ include file="modalUploadImageMelt.jsp"%>
                        <%@ include file="modalEditMelt.jsp"%>
                        <%@ include file="modalRemoveMelt.jsp"%>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%@ include file="modalAddMelt.jsp"%>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value="/resources/jQuery/jquery-3.1.1.min.js" />"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js" />"></script>
</body>
</html>
