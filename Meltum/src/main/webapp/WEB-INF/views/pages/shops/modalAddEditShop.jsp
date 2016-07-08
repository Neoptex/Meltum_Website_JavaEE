<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/jQueryPhone/build/css/intlTelInput.css">
<link href="<c:url value="/resources/css/modal.css" />" rel="stylesheet">
<!-- Modal for add shop -->
<div class="modal fade" id="modalAddEditShop${empty shop.id ? '0' : shop.id}" tabindex="-1" role="dialog" aria-labelledby="modalAddEditShopLabel${empty shop.id ? '0' : shop.id}">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalAddEditShopLabel${empty shop.id ? '0' : shop.id}">${empty shop.id ? "Ajout d'un shop" : "Modification d'un shop"}</h4>
			</div>
			<form:form role="form" action="/Meltum/shops/save/${empty shop.id ? '0' : shop.id}" method='POST' modelAttribute="shopForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="name">Nom</label>
						<form:input path="name" type="text" name="name" id="name" class="form-control" value="${shop.name}" tabindex="4" />
					</div>
					<div class="form-group">
						<label for="description">Description</label>
						<form:input path="description" name="description" id="description" class="form-control" value="${shop.description}" tabindex="4" rows="5" />
					</div>
					<div id="form-group">
						<label for="state">Quelle est l'adresse ?</label>
						<form:input path="adresse.fullAdress" id="autocomplete${empty shop.id ? '0' : shop.id}" value="${shop.adresse.fullAdress}" onFocus="geolocate()" type="text" class="form-control"></form:input>
					</div>
					<div class="form-group">
						<form:input path="adresse.street_number" type="hidden" name="street_number" id="street_number" class="form-control" value="${shop.adresse.street_number}" placeholder="Numero" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="adresse.street" type="hidden" name="route" id="route" class="form-control" placeholder="Rue" value="${shop.adresse.street}" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="adresse.state" type="hidden" name="administrative_area_level_1" id="administrative_area_level_1" value="${shop.adresse.state}" class="form-control" placeholder="Région" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="adresse.city" type="hidden" name="locality" id="locality" class="form-control" placeholder="Ville" value="${shop.adresse.city}" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="adresse.postalcode" type="hidden" name="postal_code" id="postal_code" class="form-control" placeholder="Code Postal" value="${shop.adresse.postalcode}" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="adresse.country" type="hidden" name="country" id="country" class="form-control" placeholder="Pays" value="${shop.phone}" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="loc.y" type="hidden" name="latitude" id="latitude${empty shop.id ? '0' : shop.id}" class="form-control" placeholder="Latitude" value="${shop.loc.y}" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="loc.x" type="hidden" name="longitude" id="longitude${empty shop.id ? '0' : shop.id}" class="form-control" placeholder="Longitude" value="${shop.loc.x}" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<label for="phone">Téléphone</label><br>
						<form:input path="phone" class="form-control" id="mobile-number${ shop.id }" value="${shop.phone}" type="tel" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" name="action" value="${empty shop.id ? 'add' : 'edit'}" class="btn btn-primary btn-lg btn-block">${empty shop.id ? "Ajouter" : "Appliquer les modifications"}</button>
				</div>
			</form:form>
		</div>
	</div>
</div>
<script src="resources/jQueryPhone/build/js/intlTelInput.min.js" charset="utf-8"></script>
    <script>
      $("#mobile-number${shop.id}").intlTelInput({
        defaultCountry: "fr",
        preferredCountries: ['fr'],
        utilsScript: "resources/jQueryPhone/lib/libphonenumber/build/utils.js"
      });
    </script>