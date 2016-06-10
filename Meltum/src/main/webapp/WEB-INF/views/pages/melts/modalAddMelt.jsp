<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>
<!-- Modal for add melt -->
<div class="modal fade" id="modalAddMelt" tabindex="-1" role="dialog" aria-labelledby="modalAddMeltLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalAddMeltLabel">Ajout d'un melt</h4>
			</div>
			<form:form role="form" action="/Meltum/melts/add" method='POST' modelAttribute="meltForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="shop">Shop associé</label>
						<form:select class="selectpicker" path="idShopLink" items="${shops}" itemValue="id" itemLabel="name" />
					</div>
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