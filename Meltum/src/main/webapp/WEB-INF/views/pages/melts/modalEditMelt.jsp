<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal for add melt -->
<div class="modal fade" id="modalEditMelt${melt.id}" tabindex="-1" role="dialog" aria-labelledby="modalEditMeltLabel${melt.id}">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modalEditMeltLabel${melt.id}">Modification</h4>
            </div>
            <form:form role="form" action="/Meltum/melts/edit/${melt.id}" method='POST' modelAttribute="meltForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">Nom</label>
                        <form:input path="name" type="text" name="name" id="name" class="form-control" value="${melt.name}" tabindex="4" />
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <form:input path="description" name="description" id="description" class="form-control" value="${melt.description}" tabindex="4" rows="5" />
                    </div>
                    <div class="form-group">
                        <label for="name">Prix conseillé</label>
                        <form:input path="prix_init" type="text" name="prix_init" id="prix_init" class="form-control" value="${melt.prix_init}" tabindex="4" />
                    </div>
                    <div class="form-group">
                        <label for="name">Prix</label>
                        <form:input path="prix" type="text" name="prix" id="prix" class="form-control" value="${melt.prix}" tabindex="4" />
                    </div>
                    <div class="form-group">
                        <label for="Tags">Tags</label>
                        <form:select multiple="true" id="tagList${melt.id}" path="tags" style="display:none">
                            <c:forEach items="${melt.tags}" var="tag">
                                <form:option selected="selected" id="opt${tag}${melt.id}" value="${tag}"></form:option>
                            </c:forEach>
                        </form:select>
                        <script type="text/javascript">
																									
																								<%@ include file="js/tag.js"%>
																									
																								</script>
                        <div class="input-group">
                            <input id="valueTag${melt.id}" type="text" class="form-control" placeholder="Tag"> <span class="input-group-btn">
                                <button onclick="addInTagList('${melt.id}')" class="btn btn-default" type="button">+</button>
                            </span>
                        </div>
                        <div id="tagLabel${melt.id}" class="form-group">
                            <c:forEach items="${melt.tags}" var="tag">
                                <span id="span${tag}${melt.id}" class="label label-info">${tag}<a style="text-decoration: none"><i id="${tag}" class='glyphicon glyphicon-remove' onclick='deleteTag(this.id, "${melt.id}")'></i></a></span>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success btn-lg btn-block">Appliquer les modifications</button>
                </div>
            </form:form>
        </div>
    </div>
</div>