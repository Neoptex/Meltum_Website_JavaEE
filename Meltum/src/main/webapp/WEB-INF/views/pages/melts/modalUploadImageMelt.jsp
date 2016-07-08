<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for upload image melt -->
<div class="modal fade" id="modalUploadImageMelt${melt.id}" tabindex="-1" role="dialog" aria-labelledby="modalUploadImageMeltLabel${melt.id}">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="hideModal()">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalUploadImageMeltLabel${melt.id}">Upload une image pour le melt : ${melt.name}</h4>
			</div>
			<div class="alert alert-danger" id="myAlertFile" role="alert" hidden="true">La taille du fichier est trop grosse!</div>
			<div class="alert alert-danger" id="myAlertFiles" role="alert" hidden="true">La taille des fichiers est trop grosse!</div>
			<form:form role="form" action="/Meltum/melts/upload/${melt.id}" method='POST' modelAttribute="meltForm" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="form-group">
						<input type="file" name="file" id="fileToUpload" onchange="checkFileSize(this)" multiple>
					</div>
				</div>
				<div class="modal-footer">
					<button id="btnLoad" type="submit" class="btn btn-primary btn-lg btn-block">Upload</button>
				</div>
			</form:form>
		</div>
	</div>
</div>
<script>
	function checkFileSize(inputFile) {
		var maxOneFile = 5 * 1024 * 1024;
		var maxTotalSize = 12 * 1024 * 1024;
		var totalSize = 0;
		
		if (inputFile.files) {
			for (i = 0; i < inputFile.files.length; i++ ) {
				totalSize = totalSize + inputFile.files[i].size;
				if (inputFile.files[i].size > maxOneFile) {
					$('#myAlertFile').show();
					inputFile.value = null;
				}
			}
			if (totalSize > maxTotalSize) {
				$('#myAlertFiles').show();
				inputFile.value = null;
			}
		}
	}
	
	function hideModal() {
		$('#myAlertFile').hide();
		$('#myAlertFiles').hide();
	}
</script>