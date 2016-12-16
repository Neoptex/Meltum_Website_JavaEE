<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/site.css'>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/2.1.4/jquery.min.js"></script>
<link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css'>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/4.7.0/css/font-awesome.min.css'>
</head>
<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
</body>
</html>