<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="resources/jQueryPhone/build/css/intlTelInput.css">
<!-- Modal for add shop -->
<div class="modal fade" id="modalAddShop" tabindex="-1" role="dialog" aria-labelledby="modalAddShopLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalAddShopLabel">Ajout d'un shop</h4>
			</div>
			<form:form role="form" action="/Meltum/shops/add" method='POST' modelAttribute="shopForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="name">Nom</label>
						<form:input path="name" type="text" name="name" id="name" class="form-control" placeholder="Nom" tabindex="4" />
					</div>
					<div class="form-group">
						<label for="description">Description</label>
						<form:textarea path="description" type="text" name="description" id="description" class="form-control" placeholder="Descritption" tabindex="4" rows="5" />
					</div>
					<div id="form-group">
					  <label for="state">Quelle est l'adresse ?</label>
				      <input id="autocomplete" onFocus="geolocate()" type="text" class="form-control"></input>
				    </div>
				    <div class="form-group">
						<form:input path="adresse.street_number" type="hidden" name="street_number" id="street_number" class="form-control" placeholder="Numero" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="adresse.street" type="hidden" name="route" id="route" class="form-control" placeholder="Rue" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="adresse.state" type="hidden" name="administrative_area_level_1" id="administrative_area_level_1" class="form-control" placeholder="Région" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="adresse.city" type="hidden" name="locality" id="locality" class="form-control" placeholder="Ville" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="adresse.postalcode" type="hidden" name="postal_code" id="postal_code" class="form-control" placeholder="Code Postal" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<form:input path="adresse.country" type="hidden" name="country" id="country" class="form-control" placeholder="Pays" tabindex="4" readonly="true" />
					</div>
					<div class="form-group">
						<label for="phone">Téléphone</label><br>
						<form:input path="phone" class="form-control" id="mobile-number" type="tel" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary btn-lg btn-block">Ajouter</button>
				</div>
			</form:form>
		</div>
	</div>
</div>
<script src="<c:url value="/resources/js/googleAdressSearch.js" />"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHWNArOBPWU4NbT6sMlENXfB5hGSjayfM&signed_in=true&libraries=places&callback=initAutocomplete"></script>
<script src="resources/jQueryPhone/build/js/intlTelInput.min.js" charset="utf-8"></script>
    <script>
      $("#mobile-number").intlTelInput({
        defaultCountry: "fr",
        preferredCountries: ['fr'],
      //onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
        utilsScript: "resources/jQueryPhone/lib/libphonenumber/build/utils.js"
      });
    </script>