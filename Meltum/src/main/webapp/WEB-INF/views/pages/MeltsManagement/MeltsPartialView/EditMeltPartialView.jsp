<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal for add melt -->
<div class="modal fade" id="EditMelt${melt.id}">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-header-warning">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center"><i class="fa fa-pencil fa-fw"></i> Modifier <strong>${melt.name}</strong></h4>
            </div>
            <form:form role="form" action="/Meltum/MeltsManagement/EditMelt/${melt.id}" method='POST' modelAttribute="meltForm">
                <div class="modal-body">
                    <div class="form-group">
                        <i class="fa fa-asterisk fa-fw text-danger"></i><label for="name">Titre</label>
                        <form:input path="name" type="text" name="name" id="name" class="form-control" value="${melt.name}" required="required" />
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <form:input path="description" name="description" id="description" class="form-control" value="${melt.description}" tabindex="4" rows="5" />
                    </div>
                    <div class="form-group">
						<i class="fa fa-asterisk fa-fw text-danger"></i><label for="nbrAvailable">Nombre de melt disponible</label>
						<form:input path="nbrAvailable" type="text" name="nbrAvailable" id="nbrAvailable" class="form-control" value="${melt.nbrAvailable}" required="required"/>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<i class="fa fa-asterisk fa-fw text-danger"></i><label for="DateMinTime">Heure de début</label>
									<form:input path="DateMinTime" id="DateMinTime${melt.id}" style="position: relative; z-index: 100000;" type="text" name="timepicker" class="form-control timepicker" required="required" value="${melt.hourMinuteMinTime}"/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<i class="fa fa-asterisk fa-fw text-danger"></i><label for="DateMaxTime">Heure de fin</label>
									<form:input path="DateMaxTime" id="DateMaxTime${melt.id}" style="position: relative; z-index: 100000;" type="text" name="timepicker" class="form-control timepicker" required="required" value="${melt.hourMinuteMaxTime}"/>
								</div>
							</div>
						</div>
					</div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="name">Prix conseillé</label>
                                <div class="input-group">
                                    <form:input path="priceInit" pattern="[0-9]+(\.[0-9]{0,2})?%?" maxlength="10" type="text" name="priceInit" id="priceInit" class="form-control" value="${melt.priceInit}" required="required" />
                                    <span class="input-group-addon"><i class="fa fa-eur fa-fw"></i></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <i class="fa fa-asterisk fa-fw text-danger"></i><label for="name">Prix</label>
                                <div class="input-group">
                                    <form:input path="price" pattern="[0-9]+(\.[0-9]{0,2})?%?" maxlength="10" type="text" name="price" id="price" class="form-control" value="${melt.price}" required="required" />
                                    <span class="input-group-addon"><i class="fa fa-eur fa-fw"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Tags">Tags</label>
                        <form:select multiple="true" id="tagList${melt.id}" path="tags" style="display:none">
                            <c:forEach items="${melt.tags}" var="tag">
                                <form:option selected="selected" id="opt${tag}${melt.id}" value="${tag}"></form:option>
                            </c:forEach>
                        </form:select>
                        <script type="text/javascript">
																									
																								<%@ include file="../js/tag.js"%>
																									
																								</script>
                        <div class="input-group">
                            <input id="valueTag${melt.id}" type="text" class="form-control" placeholder="Tag"> <span class="input-group-btn">
                                <button onclick="addInTagList('${melt.id}')" class="btn btn-info" type="button">
                                    <i class="fa fa-plus fa-fw"></i>
                                </button>
                            </span>
                        </div>
                        <div id="tagLabel${melt.id}" class="form-group">
                            <c:forEach items="${melt.tags}" var="tag">
                                <span id="span${tag}${melt.id}" class="label label-info">${tag}<a style="text-decoration: none"> <i id="${tag}" class='fa fa-times' onclick='deleteTag(this.id, "${melt.id}")'></i></a></span>
                            </c:forEach>
                        </div>
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
<script>
	$('#DateMinTime' + "<c:out value='${melt.id}'/>").wickedpicker({
		now : $('#DateMinTime' + "<c:out value='${melt.id}'/>").attr('value'),
		twentyFour : true
	});
	$('#DateMaxTime' + "<c:out value='${melt.id}'/>").wickedpicker({
		now : $('#DateMaxTime' + "<c:out value='${melt.id}'/>").attr('value'),
		twentyFour : true
	});
</script>