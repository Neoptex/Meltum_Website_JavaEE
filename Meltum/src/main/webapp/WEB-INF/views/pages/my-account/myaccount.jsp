<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link href="<c:url value="/resources/css/mycompany.css" />" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.css" />" rel="stylesheet">

<!-- Timeline CSS -->
<link href="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/css/timeline.css" />" rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" />" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="<c:url value="/resources/bower_components/morrisjs/morris.css" />" rel="stylesheet">

<link href="<c:url value="/resources/css/myaccount.css" />" rel="stylesheet">
</head>
<body>

    <!-- Navigation -->
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Search..."> <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div> <!-- /input-group -->
                </li>
                <li><a href="/Meltum/mon-compte/mot-de-passe"><i class="fa fa-edit fa-fw"></i> Modifier le mot de passe</a></li>
                <li><a href="/Meltum/mon-compte/PaymentAccountManagement"><i class="fa fa-credit-card fa-fw"></i> Gestion des comptes de paiement</a></li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->

    <div id="page-wrapper">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <form:form role="form" action="/Meltum/mon-compte/" method='POST' modelAttribute="myAccountForm">
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$('.button-checkbox')
				.each(
						function() {

							// Settings
							var $widget = $(this), $button = $widget
									.find('button'), $checkbox = $widget
									.find('input:checkbox'), color = $button
									.data('color'), settings = {
								on : {
									icon : 'glyphicon glyphicon-check'
								},
								off : {
									icon : 'glyphicon glyphicon-unchecked'
								}
							};

							// Initialization
							function init() {

								updateDisplay();

								// Inject the icon if applicable
								if ($button.find('.state-icon').length == 0) {
									$button
											.prepend('<i class="state-icon '
													+ settings[$button
															.data('state')].icon
													+ '"></i>');
								}
							}
							init();
						});
	});
</script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.js" />"></script>

<!-- Morris Charts JavaScript -->
<script src="<c:url value="/resources/bower_components/raphael/raphael-min.js" />"></script>

<!-- Custom Theme JavaScript -->
<script src="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js" />"></script>