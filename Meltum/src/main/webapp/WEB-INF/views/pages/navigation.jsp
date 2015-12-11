<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!-- Navigation -->
<style>
.navbar-nav, .navbar-brand {
    padding-top:5px !important; 
    padding-bottom:0 !important;
    height: 60px;
}
.navbar {min-height:60px !important;}
</style>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/Meltum"><img width="70%" height="100%" src="<c:url value="/resources/image/meltum.png" />" /></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/Meltum">Nouveauté</a></li>
				<li><a href="boutique">Boutique</a></li>
				<li><a href="#">Mon panier</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<li><a>Bonjour <strong>${pageContext.request.userPrincipal.name}</strong></a></li>
					<li><a href="mon-compte">Mon compte</a></li>
					<li><a href="<c:url value="/logout" />">déconnexion</a></li>
				</c:if>
			</ul>
		</div>
		
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>