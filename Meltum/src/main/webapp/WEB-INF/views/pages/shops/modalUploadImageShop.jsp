<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for upload image shop -->
<div class="modal fade" id="modalUploadImageShop${shop.id}" tabindex="-1" role="dialog" aria-labelledby="modalUploadImageShopLabel${shop.id}">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="hideModal()">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalUploadImageShopLabel${shop.id}">Upload une image pour le shop : ${shop.name}</h4>
			</div>
			<div class="alert alert-danger" id="myAlert" role="alert" hidden="true">La taille du fichier est trop gros!</div>
			<form:form role="form" action="/Meltum/shops/upload/${shop.id}" method='POST' modelAttribute="shopForm" enctype="multipart/form-data">
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
		var max = 5 * 1024 * 1024;

		if (inputFile.files && inputFile.files[0].size > max) {
			$('#myAlert').show();
			inputFile.value = null;
		} else {
			$('#myAlert').hide();
		}
	}

	function hideModal() {
		$('#myAlert').hide();
	}
</script>