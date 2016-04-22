<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for add shop -->
<div class="modal fade" id="modalRemoveShop${shop.id}" tabindex="-1" role="dialog" aria-labelledby="modalRemoveShopLabel${shop.id}">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalRemoveShopLabel${shop.id}">Supprimer un shop</h4>
			</div>
			<form:form role="form" action="/Meltum/shops/remove/${shop.id}" method='POST' modelAttribute="shopForm">
				<div class="modal-body">
					<p>Êtes-vous sur de vouloir supprimer le shop : ${shop.name}?
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-lg btn-block">Supprimer</button>
				</div>
			</form:form>
		</div>
	</div>
</div>