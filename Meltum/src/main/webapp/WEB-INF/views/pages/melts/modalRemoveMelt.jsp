<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for add melt -->
<div class="modal fade" id="modalRemoveMelt${melt.id}" tabindex="-1" role="dialog" aria-labelledby="modalRemoveMeltLabel${melt.id}">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalRemoveMeltLabel${melt.id}">Supprimer un melt</h4>
			</div>
			<form:form role="form" action="/Meltum/melts/remove/${melt.id}" method='POST' modelAttribute="meltForm">
				<div class="modal-body">
					<p>Êtes-vous sur de vouloir supprimer le melt : ${melt.name}?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
					<button type="submit" class="btn btn-primary">Supprimer</button>
				</div>
			</form:form>
		</div>
	</div>
</div>