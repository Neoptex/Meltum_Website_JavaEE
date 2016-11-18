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
            <form:form role="form" action="/Meltum/mon-compte/PaymentAccountManagement/AddBankAccount" method='POST' modelAttribute="BankAccountViewModel">
                <div class="modal-body">
                    <div class="form-group">
                        <i class="fa fa-asterisk fa-fw text-danger"></i><label for="CardNumber"> Numéro de la carte</label>
                        <form:input type="text" pattern="[0-9]{16}" maxlength="16" path="CardNumber" name="CardNumber" id="CardNumber" class="form-control" placeholder="1111222233334444" required="required" title="1111222233334444"/>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="SecurityCode"> Code de sécurité</label>
                                <form:input type="text" pattern="[0-9]{3}" maxlength="3" path="SecurityCode" name="SecurityCode" id="SecurityCode" class="form-control" placeholder="123" required="required" title="123"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="ExpirationDate"> Date d'expiration</label>
                                <form:input type="date" path="ExpirationDate" name="ExpirationDate" id="ExpirationDate" class="form-control" required="required" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="FirstName"> Prénom</label>
                                <form:input type="text" path="FirstName" name="FirstName" id="FirstName" class="form-control" placeholder="Jean" required="required" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="LastName"> Nom</label>
                                <form:input type="text" path="LastName" name="LastName" id="LastName" class="form-control" placeholder="Dupond" required="required" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-asterisk fa-fw text-danger"></i><label for="Address"> Adresse</label>
                        <form:input type="text" path="Address" name="Address" id="Address" class="form-control" placeholder="24 rue des pommes" required="required" />
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="City"> Ville</label>
                                <form:input type="text" path="City" name="City" id="City" class="form-control" placeholder="Paris" required="required" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="PostalCode"> Code postal</label>
                                <form:input type="text" pattern="[0-9]{5}" maxlength="5" path="PostalCode" name="PostalCode" id="PostalCode" class="form-control" placeholder="75000" title="75000" required="required" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="PhoneNumber">Numéro de téléphone</label>
                        <form:input type="tel" pattern="[0-9]{10}" path="PhoneNumber" name="PhoneNumber" id="PhoneNumber" class="form-control" placeholder="0611223344" title="0611223344" />
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