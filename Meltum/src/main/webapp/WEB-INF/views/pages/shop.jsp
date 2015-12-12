<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <title>Boutique</title>
	<link href="<c:url value="/resources/css/shop.css" />" rel="stylesheet">

</head>

<body>

    <!-- Navigation -->
    <%@ include file="navigation.jsp" %>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead">Meltum</p>
                <div class="list-group">
                    <a href="#" class="list-group-item">Automobile</a>
                    <a href="#" class="list-group-item">Restaurant</a>
                    <a href="#" class="list-group-item">Informatique</a>
                </div>
            </div>


            <div class="col-md-9">
		
                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="<c:url value="/resources/image/carousel1.jpg" />" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="<c:url value="/resources/image/carousel2.jpg" />" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="<c:url value="/resources/image/carousel3.jpg" />" alt="">
                                </div>
                            </div>
                            
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="row">	
                	<c:forEach items="${ produits }" var="produit">
    					<div class="col-sm-4 col-lg-4 col-md-4">
                       		<div class="thumbnail">
                            	<img src="<c:url value="${ produit.picture }" />" alt="">
                            	<div class="caption">
                                	<h4 class="pull-right"><c:out value="${ produit.price }" />&euro;</h4>
                                	<h4><a href="#"><c:out value="${ produit.title }" /></a></h4>
                                	<p><c:out value="${ produit.description }" /></p>
                            	</div>
                            	<div class="ratings">
                                	<p class="pull-right"><c:out value="${ produit.reviews }" /> reviews</p>
                                	<p>
                                		<c:forEach var="i" begin="1" end="${ produit.rating }" step="1">
                                    		<span class="glyphicon glyphicon-star"></span>
                                    	</c:forEach>
                                    	<c:forEach var="i" begin="${ produit.rating }" end="4" step="1">
                                    		<span class="glyphicon glyphicon-star-empty"></span>
                                    	</c:forEach>
                                	</p>
                            	</div>
                        	</div>
                    	</div>
					</c:forEach>
                </div>

            </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <!-- Footer -->
    	<%@ include file="footer.jsp" %>

    </div>
    <!-- /.container -->
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

</body>

</html>
