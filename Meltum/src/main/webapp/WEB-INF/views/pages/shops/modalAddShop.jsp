<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary btn-lg btn-block">Ajouter</button>
				</div>
			</form:form>
		</div>
	</div>
</div>