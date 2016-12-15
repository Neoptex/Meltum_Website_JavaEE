<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty error}">
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header header-error">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title text-white"><span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span> Erreur</h4>
                </div>
                <div class="modal-body">
                    <strong>L'email ou le mot de passe est erron� !</strong><br> Nous vous rappelons que l'acc�s au site web est <strong>r�serv� aux commercants.</strong><br> Si vous �tes client, vous pouvez t�l�charger notre application sur les differentes plateformes mobile (iOS, Android et Windows Phone).
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</c:if>