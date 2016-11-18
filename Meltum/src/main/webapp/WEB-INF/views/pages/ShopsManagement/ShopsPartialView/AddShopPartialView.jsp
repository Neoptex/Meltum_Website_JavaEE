<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/jQueryPhone/build/css/intlTelInput.css">
<link href="<c:url value="/resources/css/modal.css" />" rel="stylesheet">
<div class="modal fade" id="AddShop">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-header-success">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center"><i class="fa fa-plus fa-fw"></i> Ajouter un shop</h4>
            </div>
            <form:form role="form" action="/Meltum/ShopsManagement/AddShop" method='POST' modelAttribute="shopForm">
                <div class="modal-body">
                    <div class="form-group">
                        <i class="fa fa-asterisk fa-fw text-danger"></i><label for="name"> Nom</label>
                        <form:input path="name" type="text" name="name" id="name" class="form-control" placeholder="Le nom de mon magasin" required="required" />
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <form:textarea path="description" name="description" id="description" class="form-control" placeholder="Mon magasin est ..." rows="5" />
                    </div>
                    <div id="form-group">
                        <i class="fa fa-asterisk fa-fw text-danger"></i><label for="state"> Adresse</label>
                        <form:input path="adresse.fullAdress" id="autocomplete0" onFocus="geolocate()" type="text" class="form-control" required="required"></form:input>
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.street_number" type="hidden" name="street_number" id="street_number" class="form-control" placeholder="Numero" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.street" type="hidden" name="route" id="route" class="form-control" placeholder="Rue" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.state" type="hidden" name="administrative_area_level_1" id="administrative_area_level_1" class="form-control" placeholder="Région" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.city" type="hidden" name="locality" id="locality" class="form-control" placeholder="Ville" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.postalcode" type="hidden" name="postal_code" id="postal_code" class="form-control" placeholder="Code Postal" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="adresse.country" type="hidden" name="country" id="country" class="form-control" placeholder="Pays" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="loc.y" type="hidden" name="latitude" id="latitude0" class="form-control" placeholder="Latitude" readonly="true" />
                    </div>
                    <div class="form-group">
                        <form:input path="loc.x" type="hidden" name="longitude" id="longitude0" class="form-control" placeholder="Longitude" readonly="true" />
                    </div>
                    <div class="form-group">
                        <label for="phone">Téléphone</label><br>
                        <form:input path="phone" class="form-control" id="mobile-number" type="tel" />
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