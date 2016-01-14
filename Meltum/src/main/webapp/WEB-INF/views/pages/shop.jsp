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
                	<h6>Test sécurité</h6>
                </div>

            </div>

        </div>

    </div>
    <!-- /.container -->
</body>

</html>
