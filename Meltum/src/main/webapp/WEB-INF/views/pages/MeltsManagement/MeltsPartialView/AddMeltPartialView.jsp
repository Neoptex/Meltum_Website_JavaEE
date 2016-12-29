<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="modal fade" id="AddMelt">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-header-success">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-center">
					<i class="fa fa-plus fa-fw"></i> Ajouter un melt
				</h4>
			</div>
			<form:form role="form" action="/Meltum/MeltsManagement/AddMelt" method='POST' modelAttribute="meltForm">
				<div class="modal-body">
					<div class="form-group">
						<i class="fa fa-asterisk fa-fw text-danger"></i><label for="shop">Shop associé</label>
						<form:select class="form-control" path="idShopLink" items="${shops}" itemValue="id" itemLabel="name" required="required" />
					</div>
					<div class="form-group">
						<i class="fa fa-asterisk fa-fw text-danger"></i><label for="name">Titre</label>
						<form:input path="name" type="text" name="name" id="name" class="form-control" placeholder="Titre de votre réduction" required="required" />
					</div>
					<div class="form-group">
						<label for="description">Description</label>
						<form:textarea path="description" type="text" name="description" id="description" class="form-control" placeholder="Une description détaillée de la réduction" rows="5" />
					</div>
					<div class="form-group">
						<i class="fa fa-asterisk fa-fw text-danger"></i><label for="nbrAvailable">Nombre de melt disponible</label>
						<form:input path="nbrAvailable" pattern="[0-9]{1,10}" type="text" name="nbrAvailable" id="nbrAvailable" class="form-control" placeholder="100" required="required" />
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<i class="fa fa-asterisk fa-fw text-danger"></i><label for="DateMinTime">Heure de début</label>
									<form:input path="DateMinTime" id="DateMinTime" style="position: relative; z-index: 100000;" type="text" name="timepicker" class="form-control timepicker" required="required" value="00:00" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<i class="fa fa-asterisk fa-fw text-danger"></i><label for="DateMaxTime">Heure de fin</label>
									<form:input path="DateMaxTime" id="DateMaxTime" style="position: relative; z-index: 100000;" type="text" name="timepicker" class="form-control timepicker" required="required" value="23:59" />
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<i class="fa fa-asterisk fa-fw text-danger"></i><label for="priceInit">Prix conseillé</label>
								<div class="input-group">
									<form:input path="priceInit" pattern="[0-9]+(\.[0-9]{0,2})?%?" maxlength="10" type="text" name="priceInit" id="priceInit" class="form-control" placeholder="50" required="required" />
									<span class="input-group-addon"><i class="fa fa-eur fa-fw"></i></span>
								</div>
							</div>
							<div class="col-md-6">
								<i class="fa fa-asterisk fa-fw text-danger"></i><label for="price">Prix</label>
								<div class="input-group">
									<form:input path="price" pattern="[0-9]+(\.[0-9]{0,2})?%?" maxlength="10" type="text" name="price" id="price" class="form-control" placeholder="25" required="required" />
									<span class="input-group-addon"><i class="fa fa-eur fa-fw"></i></span>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="Tags">Tags</label>
						<form:select multiple="true" id="tagList" path="tags" style="display:none" />
						<script type="text/javascript">
							
						<%@ include file="../js/tag.js"%>
							
						</script>
						<div class="input-group">
							<input id="valueTag" type="text" class="form-control" placeholder="Tag"> <span class="input-group-btn">
								<button onclick="addInTagList('')" class="btn btn-info" type="button">
									<i class="fa fa-plus fa-fw"></i>
								</button>
							</span>
						</div>
						<div id=tagLabel class="form-group"></div>
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
<script>
	$('#DateMinTime').wickedpicker({
		now : $('#DateMinTime').attr('value'),
		twentyFour : true
	});
	$('#DateMaxTime').wickedpicker({
		now : $('#DateMaxTime').attr('value'),
		twentyFour : true
	});
</script>