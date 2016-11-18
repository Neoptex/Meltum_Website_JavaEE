<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>
<!DOCTYPE HTML>
<head>
<link href="<c:url value="/resources/css/navigation.css" /> " rel="stylesheet">
<!-- Custom Fonts -->
<link href="<c:url value="/resources/font-awesome-4.7.0/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
</head>
<body>
    <nav class="navbar-default navbar-inverse" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <%-- <div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand barnav" href="/Meltum"><img class="imgbrand" width="70%" height="100%" src="<c:url value="/resources/image/meltum.png" />" /></a>
			</div> --%>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="/Meltum">Accueil</a></li>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li><a href="/Meltum/melts">Melts</a></li>
                        <li><a href="/Meltum/shops">Shops</a></li>
                        <li><a href="/Meltum/mon-entreprise">Mon entreprise</a></li>
                    </c:if>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <c:when test="${pageContext.request.userPrincipal.name == null}">
                            <li><p class="navbar-text">Vous avez déjà un compte?</p></li>
                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Connectez-vous</b> <span class="caret"></span></a>
                                <ul id="login-dp" class="dropdown-menu">
                                    <li>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <form class="login" name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>
                                                    <div class="form-group">
                                                        <label class="sr-only" for="exampleInputEmail2">Email address</label> <input id="j_username" name="j_username" type="email" class="form-control" placeholder="Adresse E-mail" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="sr-only" for="exampleInputPassword2">Password</label> <input id="j_password" name="j_password" class="form-control" type="password" placeholder="Mot de passe" />
                                                        <div class="help-block text-center">
                                                            <a href="">Mot de passe oublié ?</a>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <button type="submit" class="btn btn-success btn-block">Connectez-vous</button>
                                                    </div>
                                                    <div class="checkbox text-center">
                                                        <label> <input type='checkbox' /> Se souvenir de moi
                                                        </label>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="bottom text-center">
                                                <a href="/Meltum/inscription" class="btn btn-warning btn-block">Inscrivez-vous</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul></li>
                        </c:when>
                        <c:otherwise>
                            <sec:authentication property="principal.mail" var="email" />
                            <li><a>Bonjour <strong>${email}</strong></a></li>
                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle fa-fw"></i> Mon compte <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/Meltum/mon-compte/mot-de-passe">Modifier mon mot de passe</a></li>
                                    <li><a href="/Meltum/mon-compte/PaymentAccountManagement">Gestion des comptes de paiement</a></li>
                                </ul></li>
                            <li><a href="<c:url value="/logout" />">Déconnexion</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</body>