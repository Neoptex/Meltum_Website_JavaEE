<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<title>Nouveauté</title>

<link rel="stylesheet" href="<c:url value="/resources/css/vitrine/fancybox/jquery.fancybox-v=2.1.5.css" />" type="text/css" media="screen">
<link rel="stylesheet" href="<c:url value="/resources/css/vitrine/css/font-awesome.min.css" />" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/vitrine/css/style.css" />">

<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,600,300,200&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

</head>

<body>
	<!-- Page Content -->
		<c:if test="${not empty error}">
			<!-- Modal -->
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
							<strong>L'email ou le mot de passe est erroné !</strong><br> Nous vous rappelons que l'accès au site web est <strong>réservé aux commercants.</strong><br> Si vous
							êtes client, vous pouvez télécharger notre application sur les differentes plateformes mobile (iOS, Android et Windows Phone).
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</c:if>
		
		
		<!-- === MAIN Background === -->
	<div class="slide story" id="slide-1" data-slide="1">
		<div class="container">
			<div id="home-row-1" class="row clearfix">
				<div class="col-12">
					<h1 class="font-semibold">MELTUM</h1>
					<h4 class="font-thin">Disponible d&#232;s maintenant sur les trois principaux stores.</h4>
					<br>
					<br>
					
				</div><!-- /col-12 -->
			</div><!-- /row -->
			<div id="home-row-2" class="row clearfix">
				<div class="col-12 col-sm-4"><div class="home-hover navigation-slide" data-slide="4"><img src="<c:url value="/resources/css/vitrine/images/app-store-icon.png"/>"></div><span>APPLE</span></div>
				<div class="col-12 col-sm-4"><div class="home-hover navigation-slide" data-slide="3"><img src="<c:url value="/resources/css/vitrine/images/android-icon.png"/>"></div><span>ANDROID</span></div>
				<div class="col-12 col-sm-4"><div class="home-hover navigation-slide" data-slide="5"><img src="<c:url value="/resources/css/vitrine/images/windows-phone-icon.png"/>"></div><span>WINDOWS PHONE</span></div>
			</div><!-- /row -->
		</div><!-- /container -->
	</div><!-- /slide1 -->
	
	<!-- === Slide 6 / Contact === -->
	<div class="slide story" id="slide-6" data-slide="6">
		<div class="container">
			<div class="row title-row">
				<div class="col-12 font-light">Envoyez nous un <span class="font-semibold">message</span></div>
			</div><!-- /row -->
			<div class="row line-row">
				<div class="hr">&nbsp;</div>
			</div><!-- /row -->
			<div class="row subtitle-row">
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
				<div class="col-12 col-sm-10 font-light">Contactez nous via les moyens qui vous sont propos&#233;s</div>
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
			</div><!-- /row -->
			<div id="contact-row-4" class="row">
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
				<div class="col-12 col-sm-2 with-hover-text">
					<p><a target="_blank" href="#"><i class="icon icon-phone"></i></a></p>
					<span class="hover-text font-light ">+06 00 00 00 00</span>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2 with-hover-text">
					<p><a target="_blank" href="#"><i class="icon icon-envelope"></i></a></p>
					<span class="hover-text font-light ">meltum@meltum.com</span>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2 with-hover-text">
					<p><a target="_blank" href="#"><i class="icon icon-home"></i></a></p>
					<span class="hover-text font-light ">Paris, France<br>75000</span>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2 with-hover-text">
					<p><a target="_blank" href="#"><i class="icon icon-facebook"></i></a></p>
					<span class="hover-text font-light ">facebook/meltum</span>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2 with-hover-text">
					<p><a target="_blank" href="#"><i class="icon icon-twitter"></i></a></p>
					<span class="hover-text font-light ">@Meltum</span>
				</div><!-- /col12 -->
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
			</div><!-- /row -->
		</div><!-- /container -->
	</div><!-- /Slide 6 -->

</body>
<script>
	var error = "${error}";
	if (error != null) {
		$("#myModal").modal('show');
	}
</script>

<!-- SCRIPTS -->
	<script src="<c:url value="/resources/css/vitrine/js/html5shiv.js" />"></script>
	<script src="<c:url value="/resources/css/vitrine/js/jquery-1.10.2.min.js"/>"></script>
	<script src="<c:url value="/resources/css/vitrine/js/jquery-migrate-1.2.1.min.js" />"></script>
	<script src="<c:url value="/resources/css/vitrine/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/css/vitrine/js/jquery.easing.1.3.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/css/vitrine/fancybox/jquery.fancybox.pack-v=2.1.5.js"/>"></script>
	<script src="<c:url value="/resources/css/vitrine/js/script.js"/>"></script>
	
	<!-- fancybox init -->
	<script>
	$(document).ready(function(e) {
		var lis = $('.nav > li');
		menu_focus( lis[0], 1 );
		
		$(".fancybox").fancybox({
			padding: 10,
			helpers: {
				overlay: {
					locked: false
				}
			}
		});
	
	});
	</script>

</html>