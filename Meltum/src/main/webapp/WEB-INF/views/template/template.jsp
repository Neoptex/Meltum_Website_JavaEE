<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/3.3.5/css/bootstrap.min.css'>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Meltum</title>
</head>
<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
 	<tiles:insertAttribute name="body"></tiles:insertAttribute>
</body>
</html>