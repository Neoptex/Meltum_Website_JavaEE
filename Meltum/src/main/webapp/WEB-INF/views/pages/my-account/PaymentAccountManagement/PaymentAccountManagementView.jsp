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
<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
<script type="text/javascript">
  Stripe.setPublishableKey('pk_test_XxCK3uDnTPd2RJHLsHeALGW9');
</script>
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
<script type="text/javascript">
	$(function() {
	  var $form = $('#payment-form');
	  $form.submit(function(event) {
 	    // Disable the submit button to prevent repeated clicks:
 	    $form.find('.submit').prop('disabled', true);
	
	    // Request a token from Stripe:
	    Stripe.card.createToken($form, stripeResponseHandler);
	
	    // Prevent the form from being submitted:
	    return false;
	  });
	});
	
	function stripeResponseHandler(status, response) {
		  // Grab the form:
		  var $form = $('#payment-form');

		  if (response.error) { // Problem!

		    // Show the errors on the form:
		    $form.find('.payment-errors').text(response.error.message);
		    $form.find('.submit').prop('disabled', false); // Re-enable submission

		  } else { // Token was created!

		    // Get the token ID:
		    var token = response.id;

		    // Insert the token ID into the form so it gets submitted to the server:
		    $('#token').val(token);

		    // Submit the form:
		    $form.get(0).submit();
		  }
		};
</script>
</html>
