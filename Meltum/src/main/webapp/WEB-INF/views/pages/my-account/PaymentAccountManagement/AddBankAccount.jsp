<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="modal fade" id="AddBankAccount">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-header-success">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center"><i class="fa fa-credit-card fa-fw"></i> Ajouter un compte bancaire</h4>
            </div>
            <form:form role="form" id="payment-form" action="/Meltum/mon-compte/PaymentAccountManagement/AddBankAccount" method='POST' modelAttribute="bankAccountForm">
                <div class="modal-body">
                    <div class="form-group">
                        <i class="fa fa-asterisk fa-fw text-danger"></i><label for="CardNumber"> Numéro de la carte</label>
                        <input type="text" pattern="[0-9]{16}" maxlength="16" path="CardNumber" name="CardNumber" data-stripe="number" id="CardNumber" class="form-control" placeholder="1111222233334444" required="required" title="1111222233334444"/>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="ExpirationDate"> Date d'expiration</label>
							    <input type="text" size="2" data-stripe="exp_month" class="form-control" placeholder="Month (MM)">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label><br></label>
							    <input type="text" size="2" data-stripe="exp_year" class="form-control" placeholder="Year (YYYY)">
							</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="SecurityCode"> Code de sécurité</label>
                                <input type="text" pattern="[0-9]{3}" data-stripe="cvc" maxlength="3" path="SecurityCode" name="SecurityCode" id="SecurityCode" class="form-control" placeholder="123" required="required" title="123"/>
                            </div>
                        </div>
                        <div class="col-md-6">
		                    <div class="form-group">
		                        <i class="fa fa-asterisk fa-fw text-danger"></i><label for="PostalCode"> Code postal</label>
		                        <input type="text" pattern="[0-9]{5}" maxlength="5" path="PostalCode" data-stripe="address_zip" name="PostalCode" id="PostalCode" class="form-control" placeholder="75000" title="75000" required="required" />
		                    </div>
		               </div>
                    </div>
                     <div class="form-group" hidden="true">
                        <form:input type="text" path="token" name="token" id="token" class="form-control"/>
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