<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="modal fade" id="AddPaypalAccount">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-header-primary">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center"><i class="fa fa-paypal fa-fw"></i> Ajouter un compte paypal</h4>
            </div>
            <form:form role="form" action="/Meltum/mon-compte/PaymentAccountManagement/AddPaypalAccount" method='POST' modelAttribute="paypalAccountForm">
                <div class="modal-body">
                    <div class="form-group">
                        <i class="fa fa-asterisk fa-fw text-danger"></i><label for="email">Email du compte paypal</label>
                        <form:input type="email" path="email" name="email" id="email" class="form-control" placeholder="jean.dupond@mail.com" required="required" title="jean.dupond@mail.com" />
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