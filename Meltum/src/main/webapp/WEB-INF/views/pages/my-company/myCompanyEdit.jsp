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


    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.css" />" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/css/timeline.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" />" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<c:url value="/resources/bower_components/morrisjs/morris.css" />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<link href="<c:url value="/resources/css/mycompany.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/mycompany.css" />" rel="stylesheet">
</head>
<body>
   <!-- Navigation -->
      <div class="navbar-default sidebar" role="navigation">
          <div class="sidebar-nav navbar-collapse">
              <ul class="nav" id="side-menu">
                  <li class="sidebar-search">
                      <div class="input-group custom-search-form">
                          <input type="text" class="form-control" placeholder="Search...">
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button">
                              <i class="fa fa-search"></i>
                          </button>
                      </span>
                      </div>
                      <!-- /input-group -->
                  </li>
                        <c:choose>
							<c:when test="${ not empty myCompanyForm.name}">
		                        <li>
		                            <a href=""><i class="fa fa-edit fa-fw"></i> Mon entreprise</a>
		                        </li>
	                        </c:when>
	                        <c:otherwise>
	                        	  <li>
		                            <a href="/Meltum/mon-entreprise/ajouter"><i class="fa fa-edit fa-fw"></i> Ajouter une entreprise</a>
		                          </li>
	                        </c:otherwise>
                        </c:choose>
              </ul>
          </div>
          <!-- /.sidebar-collapse -->
      </div>
      <!-- /.navbar-static-side -->
            
	 <div id="wrapper">
		 <div id="page-wrapper">
			<div class="row">
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<form:form role="form" action="/Meltum/mon-entreprise/saveCompany/${ myCompanyForm.id }" method='POST' modelAttribute="myCompanyForm">
						<h2 class="text-center">Mon entreprise</h2>
						<hr class="colorgraph">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="form-group">
									<form:input path="name" type="text" name="name" id="name"
										class="form-control input-lg" placeholder="Raison Sociale" tabindex="1" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="form-group">
									<form:textarea path="description" name="description" id="description"
										class="form-control input-lg" placeholder="Description" tabindex="2" />
								</div>
							</div>
						</div>
						<hr class="colorgraph">
						<div class="row">
							<div class="col-xs-12 col-md-12">
								<input type="submit" value="Enregistrer les informations"
									class="btn btn-success btn-block btn-lg" tabindex="7">
							</div>
						</div>
					</form:form>
				</div>
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
<!-- Metis Menu Plugin JavaScript -->
<script src="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.js" />"></script>

<!-- Morris Charts JavaScript -->
<script src="<c:url value="/resources/bower_components/raphael/raphael-min.js" />" ></script>

<!-- Custom Theme JavaScript -->
<script src="<c:url value="/resources/bower_components/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js" />"></script>