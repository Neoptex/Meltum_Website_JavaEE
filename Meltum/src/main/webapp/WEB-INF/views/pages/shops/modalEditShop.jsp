<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for add shop -->
<div class="modal fade" id="modalEditShop${shop.id}" tabindex="-1" role="dialog" aria-labelledby="modalEditShopLabel${shop.id}">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalEditShopLabel${shop.id}">Modification</h4>
			</div>
			<form:form role="form" action="/Meltum/shops/edit/${shop.id}" method='POST' modelAttribute="shopForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="name">Nom</label>
						<form:input path="name" type="text" name="name" id="name" class="form-control" value="${shop.name}" tabindex="4" />
					</div>
					<div class="form-group">
						<label for="description">Description</label>
						<form:input path="description" name="description" id="description" class="form-control" value="${shop.description}" tabindex="4" rows="5" />
					</div>
					<div class="form-group">
						<label for="street">Rue</label>
						<form:input path="adresse.street" type="text" name="street" id="street" class="form-control" value="${shop.adresse.street}" tabindex="4" />
					</div>
					<div class="form-group">
						<label for="city">Ville</label>
						<form:input path="adresse.city" type="text" name="city" id="city" class="form-control" value="${shop.adresse.city}" tabindex="4" />
					</div>
					<div class="form-group">
						<label for="postalcode">Code postal</label>
						<form:input path="adresse.postalcode" type="text" name="postalcode" id="postalcode" class="form-control" value="${shop.adresse.postalcode}" tabindex="4" />
					</div>
					<div class="form-group">
						<label for="phone">Téléphone</label>
						<form:input path="phone" type="text" name="phone" id="phone" class="form-control" value="${shop.phone}" tabindex="4" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success btn-lg btn-block">Appliquer les modifications</button>
				</div>
			</form:form>
		</div>
	</div>
</div>