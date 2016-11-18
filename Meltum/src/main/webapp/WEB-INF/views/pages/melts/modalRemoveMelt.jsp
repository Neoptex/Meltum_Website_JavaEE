<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for add melt -->
<div class="modal fade" id="modalRemoveMelt${melt.id}" tabindex="-1" role="dialog" aria-labelledby="modalRemoveMeltLabel${melt.id}">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-danger">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center" id="modalRemoveMeltLabel${melt.id}"><i class="fa fa-trash fa-fw"></i> Suppression</h4>
            </div>
            <form:form role="form" action="/Meltum/melts/remove/${melt.id}" method='POST' modelAttribute="meltForm">
                <div class="modal-body">
                    <p>
                        Êtes-vous sur de vouloir supprimer le melt : <strong>${melt.name}</strong> ?
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