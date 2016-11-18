<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="modal fade" id="modalAddMelt" tabindex="-1" role="dialog" aria-labelledby="modalAddMeltLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-success">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center" id="modalAddMeltLabel"><i class="fa fa-plus fa-fw"></i> Ajouter un melt</h4>
            </div>
            <form:form role="form" action="/Meltum/melts/add" method='POST' modelAttribute="meltForm">
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
                        <div class="row">
                            <div class="col-md-6">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="prix_init">Prix conseillé</label>
                                <div class="input-group">
                                    <form:input path="prix_init" pattern="[0-9]{1,10}" maxlength="10" type="text" name="prix_init" id="prix_init" class="form-control" placeholder="50" required="required" />
                                    <span class="input-group-addon"><i class="fa fa-eur fa-fw"></i></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="prix">Prix</label>
                                <div class="input-group">
                                    <form:input path="prix" pattern="[0-9]{1,10}" maxlength="10" type="text" name="prix" id="prix" class="form-control" placeholder="25" required="required" />
                                    <span class="input-group-addon"><i class="fa fa-eur fa-fw"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Tags">Tags</label>
                        <form:select multiple="true" id="tagList" path="tags" style="display:none" />
                        <script type="text/javascript">
																									
																								<%@ include file="js/tag.js"%>
																									
																								</script>
                        <div class="input-group">
                            <input id="valueTag" type="text" class="form-control" placeholder="Tag"> <span class="input-group-btn">
                                <button onclick="addInTagList('')" class="btn btn-info" type="button"><i class="fa fa-plus fa-fw"></i></button>
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