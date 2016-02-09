<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for add melt -->
<div class="modal fade" id="modalEditMelt${melt.id}" tabindex="-1" role="dialog" aria-labelledby="modalEditMeltLabel${melt.id}">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalEditMeltLabel${melt.id}">Modification</h4>
			</div>
			<form:form role="form" action="/Meltum/melts/edit/${melt.id}" method='POST' modelAttribute="meltForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="name">Nom</label>
						<form:input path="name" type="text" name="name" id="name" class="form-control" value="${melt.name}" tabindex="4" />
					</div>
					<div class="form-group">

						<label for="description">Description</label>
						<form:input path="description" name="description"  id="description" class="form-control" value="${melt.description}" tabindex="4" rows="5"/>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
					<button type="submit" class="btn btn-primary">Modifier</button>
				</div>
			</form:form>
		</div>
	</div>
</div>