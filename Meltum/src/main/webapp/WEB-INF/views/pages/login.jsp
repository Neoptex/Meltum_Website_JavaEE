<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="pr-wrap">
                <div class="pass-reset">
                    <label><spring:message code="login.email" /></label>
	                <input name="email" type="email" placeholder="Email" />
	                <input type="submit" value="Submit" class="pass-reset-submit btn btn-success btn-sm" />
                </div>
            </div>
            <div class="wrap">
                <p class="form-title"><spring:message code="login.signin" /></p>
                <form class="login" name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>
                <input id="j_username" name="j_username" type="text" placeholder="Nom d'utilisateur" />
                <input id="j_password" name="j_password" type="password" placeholder="Mot de passe" />
                <input name="submit" type="submit" value="Se connecter" class="btn btn-success btn-sm" />
                <input name="submit" type="submit" value="Se connecter avec Facebook" class="btn btn-primary btn-sm" />
                <input name="submit" type="submit" value="Se connecter avec Google" class="btn btn-danger btn-sm" />
                <div class="remember-forgot">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="_spring_security_remember_me" />
                                    <spring:message code="login.rememberme" />
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6 forgot-pass-content">
                            <a href="javascript:void(0)" class="forgot-pass"><spring:message code="login.forgotpwd" /></a>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
$(document).ready(function () {
    $('.forgot-pass').click(function(event) {
      $(".pr-wrap").toggleClass("show-pass-reset");
    });  
});
</script>