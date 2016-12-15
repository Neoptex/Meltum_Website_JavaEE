<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="webjars/jquery/2.1.4/jquery.min.js"></script>
<link rel='stylesheet' href='webjars/bootstrap/3.3.5/css/bootstrap.min.css'>
</head>
<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
	<script type="text/javascript" src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>