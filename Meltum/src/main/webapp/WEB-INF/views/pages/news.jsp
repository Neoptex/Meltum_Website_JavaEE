<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <title>Nouveauté</title>
    <link href="<c:url value="/resources/css/news.css" />" rel="stylesheet">
    
</head>

<body>
    <!-- Page Content -->
    <div class="container">
		<c:if test="${not empty error}">
			<!-- Modal -->
			  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			      <div class="modal-content">
			        <div class="modal-header header-error">
			          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			          <h4 class="modal-title text-white"><span class="glyphicon glyphicon-warning-sign icon-white" aria-hidden="true"></span> Erreur</h4>
			        </div>
			        <div class="modal-body">
			          <strong>L'email ou le mot de passe est erroné !</strong><br>
			          Nous vous rappelons que l'accès au site web est <strong>réservé aux commercants.</strong><br>
			          Si vous êtes client, vous pouvez télécharger notre application sur les differentes plateformes mobile (iOS, Android et Windows Phone).
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
			        </div>
			      </div><!-- /.modal-content -->
			    </div><!-- /.modal-dialog -->
			  </div><!-- /.modal -->
		</c:if>
        <!-- Jumbotron Header -->
        <header class="jumbotron hero-spacer">
            <h1>Bienvenue</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
            <p><a class="btn btn-primary btn-large">Suivant</a>
            </p>
        </header>

        <hr>

        <!-- Title -->
        <div class="row">
            <div class="col-lg-12">
                <h3>Nouveauté</h3>
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Features -->
        <div class="row text-center">

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <img src="<c:url value="/resources/image/massage.jpg" />" />
                    <div class="caption">
                        <h3>Massage</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        <p>
                            <a href="#" class="btn btn-primary">Acheter!</a> <a href="#" class="btn btn-default">+ d'info</a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <img src="<c:url value="/resources/image/voiture.jpg" />" />
                    <div class="caption">
                        <h3>Voiture</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        <p>
                            <a href="#" class="btn btn-primary">Acheter!</a> <a href="#" class="btn btn-default">+ d'info</a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <img src="<c:url value="/resources/image/spectacle.jpg" />" />
                    <div class="caption">
                        <h3>Spectacle</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        <p>
                            <a href="#" class="btn btn-primary">Acheter!</a> <a href="#" class="btn btn-default">+ d'info</a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <img src="<c:url value="/resources/image/restaurant.jpg" />" />
                    <div class="caption">
                        <h3>Restaurant</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        <p>
                            <a href="#" class="btn btn-primary">Acheter!</a> <a href="#" class="btn btn-default">+ d'info</a>
                        </p>
                    </div>
                </div>
            </div>

        </div>
        <hr>
    </div>
    <!-- /.container -->
</body>
<script>
	var error = "${error}";
	if (error != null) {
		$("#myModal").modal('show');
	}
</script>

</html>