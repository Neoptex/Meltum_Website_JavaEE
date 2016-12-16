<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/inscription.css" />" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form:form role="form" action="/Meltum/saveUser/" method='POST' modelAttribute="registerForm">
					<h2>
						Meltum<small> Inscription</small>
					</h2>
					<hr class="colorgraph">
					<div class="form-group">
						<form:input path="mail" type="mail" name="mail" id="mail" class="form-control input-lg" placeholder="E-mail" tabindex="4" />
						<form:errors path="mail" />
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<form:input path="password" type="password" name="password" id="password" class="form-control input-lg" placeholder="Mot de passe" tabindex="5" />
								<form:errors path="password" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<form:input path="confirmPassword" type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirmer le mot de passe" tabindex="6" />
								<form:errors path="confirmPassword" />
							</div>
						</div>
					</div>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-12 col-md-12">
							<input type="submit" value="S'inscrire" class="btn btn-primary btn-block btn-lg" tabindex="7">
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>