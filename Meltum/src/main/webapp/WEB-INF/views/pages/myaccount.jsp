<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<html>
<head>
	<link href="<c:url value="/resources/css/myaccount.css" />" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form:form role="form" action="/Meltum/mon-compte/" method='POST' modelAttribute="myAccountForm">
					<h2 class="text-center">Modifier mes informations</h2>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12">
							<div class="form-group">
								<form:input path="socialName" type="text" name="socialName" id="socialName"
									class="form-control input-lg" placeholder="Raison Sociale" tabindex="1" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12">
							<div class="form-group">
								<form:input path="siren" type="text" name="Siren" id="Siren"
									class="form-control input-lg" placeholder="Siren" tabindex="2" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-12">
							<a href="#" class="btn btn-primary btn-block btn-lg">Changer votre mot de passe</a>
						</div>
					</div>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-12 col-md-12">
							<input type="submit" value="Enregistrer les modifications"
								class="btn btn-success btn-block btn-lg" tabindex="7">
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
$(function () {
    $('.button-checkbox').each(function () {

        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i>');
            }
        }
        init();
    });
});
</script>