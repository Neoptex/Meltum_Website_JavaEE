<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="/resources/css/mycompany.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/myaccount.css" />" rel="stylesheet">
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
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <h2 class="text-center">Modifier mon mot de passe</h2>
                <hr class="colorgraph">
                <form:form role="form" action="/Meltum/mon-compte/savePassword" method='POST' modelAttribute="changePasswordForm">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                <form:input path="oldPassword" type="password" name="password" id="password" class="form-control input-lg" placeholder="Ancien mot de passe" tabindex="5" />
                                <form:errors path="oldPassword" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                <form:input path="password" type="password" name="password" id="password" class="form-control input-lg" placeholder="Nouveau mot de passe" tabindex="5" />
                                <form:errors path="password" cssClass="error" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                <form:input path="confirmPassword" type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirmer le mot de passe" tabindex="6" />
                                <form:errors path="confirmPassword" />
                            </div>
                        </div>
                    </div>
                    <hr class="colorgraph">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <input type="submit" value="Enregistrer les modifications" class="btn btn-success btn-block btn-lg" tabindex="7">
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>
