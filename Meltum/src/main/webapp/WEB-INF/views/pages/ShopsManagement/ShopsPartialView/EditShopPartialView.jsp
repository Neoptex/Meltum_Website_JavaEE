<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/jQueryPhone/build/css/intlTelInput.css">
<link href="<c:url value="/resources/css/modal.css" />" rel="stylesheet">
<div class="modal fade" id="modalAddEditShop${shop.id}">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-header-warning">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center"><i class="fa fa-pencil fa-fw"></i> Modifier <strong>${shop.name}</strong></h4>
            </div>
            <form:form role="form" action="/Meltum/ShopsManagement/EditShop/${shop.id}" method='POST' modelAttribute="shopForm">
                <div class="modal-body">
                    <div class="form-group">
                        <i class="fa fa-asterisk fa-fw text-danger"></i><label for="name"> Nom</label>
                        <form:input path="name" type="text" name="name" id="name" class="form-control" value="${shop.name}" required="required" />
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <form:input path="description" name="description" id="description" class="form-control" value="${shop.description}" rows="5" />
                    </div>
                    <div id="form-group">
                        <i class="fa fa-asterisk fa-fw text-danger"></i><label for="state"> Adresse</label>
                        <form:input path="adresse.fullAdress" id="autocomplete${shop.id}" value="${shop.adresse.fullAdress}" onFocus="geolocate()" type="text" class="form-control" required="required"></form:input>
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.street_number" type="hidden" name="street_number" id="street_number" class="form-control" value="${shop.adresse.street_number}" placeholder="Numero" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.street" type="hidden" name="route" id="route" class="form-control" placeholder="Rue" value="${shop.adresse.street}" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.state" type="hidden" name="administrative_area_level_1" id="administrative_area_level_1" value="${shop.adresse.state}" class="form-control" placeholder="R�gion" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.city" type="hidden" name="locality" id="locality" class="form-control" placeholder="Ville" value="${shop.adresse.city}" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.postalcode" type="hidden" name="postal_code" id="postal_code" class="form-control" placeholder="Code Postal" value="${shop.adresse.postalcode}" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.country" type="hidden" name="country" id="country" class="form-control" placeholder="Pays" value="${shop.adresse.country}" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="loc.y" type="hidden" name="latitude" id="latitude${empty shop.id ? '0' : shop.id}" class="form-control" placeholder="Latitude" value="${shop.loc.y}" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="loc.x" type="hidden" name="longitude" id="longitude${empty shop.id ? '0' : shop.id}" class="form-control" placeholder="Longitude" value="${shop.loc.x}" readonly="true" />
                    </div>
                    <div class="form-group">
                        <label for="phone">T�l�phone</label><br>
                        <form:input path="phone" class="form-control" id="mobile-number${ shop.id }" value="${shop.phone}" type="tel" />
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-md-9">
                            <button type="submit" class="btn btn-success btn-lg btn-block">Valider</button>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="btn btn-danger btn-lg btn-block" data-dismiss="modal">Annuler</button>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
<script src="resources/jQueryPhone/build/js/intlTelInput.min.js" charset="utf-8"></script>
<script>
	$("#mobile-number${shop.id}").intlTelInput({
		defaultCountry : "fr",
		preferredCountries : [ 'fr' ],
		utilsScript : "resources/jQueryPhone/lib/libphonenumber/build/utils.js"
	});
</script>