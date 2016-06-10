<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for upload image melt -->
<div class="modal fade" id="modalUploadImageMelt${melt.id}" tabindex="-1" role="dialog" aria-labelledby="modalUploadImageMeltLabel${melt.id}">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalUploadImageMeltLabel${melt.id}">Upload une image pour le melt : ${melt.name}</h4>
			</div>
			<form:form role="form" action="/Meltum/melts/upload/${melt.id}" method='POST' modelAttribute="meltForm" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="form-group">
						<input type="file" name="file">
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary btn-lg btn-block">Upload</button>
				</div>
			</form:form>
		</div>
	</div>
</div>