<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<html>
<head>
	<link href="<c:url value="/resources/css/mycompany.css" />" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<c:choose>
				<c:when test="${ not empty myCompanyForm.socialName}">
					<div
						class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
						<form:form role="form" action="/Meltum/mon-entreprise/saveCompany/${ myCompanyForm.id }" method='POST' modelAttribute="myCompanyForm">
							<h2 class="text-center">Mon entreprise</h2>
							<hr class="colorgraph">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<div class="form-group">
										<label class="control-label">Raison sociale : </label>			
										<p>${ myCompanyForm.socialName }</p>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<div class="form-group">
										<label class="control-label">Description : </label>			
										<p>${ myCompanyForm.description }</p>
									</div>
								</div>
							</div>
							<hr class="colorgraph">
							<div class="row">
								<div class="col-xs-12 col-md-12">
									<a href="/Meltum/mon-entreprise/modifier" class="btn btn-primary btn-block btn-lg">Modifier les informations</a>
								</div>
							</div>
						</form:form>
					</div>
				</c:when>
				<c:otherwise>
					<hr class="colorgraph">
							<div class="row">
								<div class="col-xs-12 col-md-12">
									<a href="/Meltum/mon-entreprise/ajouter" class="btn btn-primary btn-block btn-lg">Ajouter une entreprise</a>
								</div>
							</div>
					<hr class="colorgraph">
				</c:otherwise>
			</c:choose>
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