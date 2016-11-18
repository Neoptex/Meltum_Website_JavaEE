<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gestion des comptes de paiement</title>
<link href="<c:url value="/resources/css/PaymentAccountManagement.css" /> " rel="stylesheet">
<link href="<c:url value="/resources/font-awesome-4.7.0/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="page-header">
                <h1>Gestion des comptes de paiement</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <button type="button" class="btn btn-success btn-lg btn-block" data-toggle="modal" data-target="#AddBankAccount">
                    <i class="fa fa-credit-card fa-fw"></i> Ajouter un compte bancaire
                </button>
                <%@ include file="AddBankAccount.jsp"%>
            </div>
            <div class="col-md-6">
                <button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#AddPaypalAccount">
                    <i class="fa fa-paypal fa-fw"></i> Ajouter un compte paypal
                </button>
                <%@ include file="AddPaypalAccount.jsp"%>
            </div>
        </div>
    </div>
</body>
</html>
