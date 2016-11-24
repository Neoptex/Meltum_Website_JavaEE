<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for add shop -->
<div class="modal fade" id="RemoveShop${shop.id}">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-header-danger">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center"><i class="fa fa-trash fa-fw"></i> Supprimer <strong>${shop.name}</strong></h4>
            </div>
            <form:form role="form" action="/Meltum/ShopsManagement/RemoveShop/${shop.id}" method='POST' modelAttribute="shopForm">
                <div class="modal-body">
                    <p>
                        Êtes-vous sur de vouloir supprimer le shop : <strong>${shop.name}</strong> ?
                    </p>
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