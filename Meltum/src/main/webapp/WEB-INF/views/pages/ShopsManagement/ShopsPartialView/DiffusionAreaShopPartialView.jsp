<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Modal for add shop -->
<div class="modal fade" id="DiffusionAreaShop${shop.id}">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header modal-header-info">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center"><i class="fa fa-rss fa-fw"></i> Zone de diffusion de <strong>${shop.name}</strong></h4>
            </div>
            <form:form role="form" action="/Meltum/ShopsManagement/diffusion/saveZone/${shop.id}" method='POST'>
                <div class="modal-body">
                    <h1>Mettre la map ici</h1>
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