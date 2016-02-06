<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
			<form:form role="form" action="/Meltum/changePassword/" method='POST' modelAttribute="changePasswordForm">
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<form:input path="oldPassword" type="password" name="password" id="password"
									class="form-control input-lg" placeholder="Ancien mot de passe"
									tabindex="5" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<form:input path="password" type="password" name="password" id="password"
									class="form-control input-lg" placeholder="Nouveau mot de passe"
									tabindex="5" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<form:input path="confirmPassword" type="password" name="password_confirmation"
									id="password_confirmation" class="form-control input-lg"
									placeholder="Confirmer le mot de passe" tabindex="6" />
							</div>
						</div>
					</div>
			</form:form>
</body>
</html>