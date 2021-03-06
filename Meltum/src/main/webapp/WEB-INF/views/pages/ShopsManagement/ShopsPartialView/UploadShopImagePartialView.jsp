<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="modal fade" id="UploadImageShop${shop.id}">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-header-primary">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="hideModal()">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-center" id="modalUploadImageShopLabel${shop.id}"><i class="fa fa-cloud-upload"></i> Uploader une image pour <strong>${ shop.name }</strong></h4>
			</div>
			<div class="alert alert-danger" id="myAlertFile" role="alert" hidden="true">La taille du fichier est trop grosse!</div>
			<div class="alert alert-danger" id="myAlertFiles" role="alert" hidden="true">La taille des fichiers est trop grosse!</div>
			<form:form role="form" action="/Meltum/ShopsManagement/UploadImageShop/${shop.id}" method='POST' modelAttribute="shopForm" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="form-group">
						<input type="file" name="file" id="fileToUpload" onchange="checkFileSize(this)" multiple>
					</div>
				</div>
				<div id="divBtnUpload" class="modal-footer">
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

			document.getElementById("divBtnWait").style.display = "none";
			document.getElementById("divBtnUpload").style.display = "block";
		}
	}
	
	function hideModal() {
		$('#myAlertFile').hide();
		$('#myAlertFiles').hide();
	}
	
	function buttonClicked(obj) {
		return false;
	}
</script>