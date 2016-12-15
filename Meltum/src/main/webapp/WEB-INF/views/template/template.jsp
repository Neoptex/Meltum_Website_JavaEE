<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="webjars/jquery/2.1.4/jquery.min.js"></script>
<link rel='stylesheet' href='webjars/bootstrap/3.3.7-1/css/bootstrap.min.css'>
<link rel='stylesheet' href='webjars/font-awesome/4.7.0/css/font-awesome.min.css'>
</head>
<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
	<script type="text/javascript" src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
</body>
</html>