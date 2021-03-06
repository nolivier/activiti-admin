<%@ page import="adminom.ProcessInstance" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="bootstrap">
        <g:set var="entityName" value="${message(code: 'processInstance.label', default: 'ProcessInstance')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <r:require module="filterpane" />
        <r:require module="modal" />

    </head>
    <body>
        <div class="row-fluid">
            <div class="span12">
                
                <div class="page-header">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                </div>

                <g:if test="${flash.message}">
                <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
                </g:if>
                <filterpane:filterPane domain="ProcessInstance" additionalProperties="id" filterProperties="businessKey, status, startTime, endTime, processDefinitionId" showSortPanel="false" showTitle="false"/>    
                <filterpane:filterButton text="Filter data" />

                <g:form class="form-horizontal" action="manageMultiple">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>
                                    <g:checkBox id="select_all" checked="${false}"/>
                                    <r:script>
                                    $('th input:checkbox').click(function(e) {
                                        var table = $(e.target).parents('table:first');
                                        $('td input:checkbox', table).attr('checked', e.target.checked);
                                    });
                                    </r:script>
                                </th>
                                <g:sortableColumn property="id" title="${message(code: 'processInstance.id.label', default: 'ID')}" />
                                <g:sortableColumn property="businessKey" title="${message(code: 'processInstance.businessKey.label', default: 'Business Key')}" />
                                <g:sortableColumn property="order.orderID" title="${message(code: 'order.orderID.label', default: 'Order ID')}" />
                                <g:sortableColumn property="order.customerID" title="${message(code: 'order.customerID.label', default: 'Order ID')}" />
                                <g:sortableColumn property="processDefinitionId" title="${message(code: 'processInstance.processDefinitionId.label', default: 'Process Definition Id')}" />
                                <g:sortableColumn property="status" title="${message(code: 'processInstance.status.label', default: 'Status')}" />
                                <g:sortableColumn property="startTime" title="${message(code: 'processInstance.startTime.label', default: 'Start Time')}" />
                                <g:sortableColumn property="endTime" title="${message(code: 'processInstance.endTime.label', default: 'End Time')}" />
                                <g:sortableColumn property="duration" title="${message(code: 'processInstance.duration.label', default: 'Duration')}" />

                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <g:each in="${processInstanceInstanceList}" var="processInstanceInstance">
                            <tr>
                                <td><g:checkBox id="${processInstanceInstance.id}" name="selected" value="${processInstanceInstance.id}" checked="${false}"/></td>
                                <td>${fieldValue(bean: processInstanceInstance, field: "id")}</td>
                                <td>${fieldValue(bean: processInstanceInstance, field: "businessKey")}</td>
                                <td>${fieldValue(bean: processInstanceInstance, field: "order.orderID")}</td>
                                <td>${fieldValue(bean: processInstanceInstance, field: "order.clientID")}</td>
                                <td>${fieldValue(bean: processInstanceInstance, field: "processDefinitionId")}</td>
                                <td>${fieldValue(bean: processInstanceInstance, field: "status")}</td>
                                <td><g:formatDate date="${processInstanceInstance?.startTime}" /></td>
                                <td><g:formatDate date="${processInstanceInstance?.endTime}"/></td>
                                <td>${fieldValue(bean: processInstanceInstance, field: "duration")}</td>
                                
                                
                                <td class="link">
                                    <g:link action="show" controller="processInstanceDetail" id="${processInstanceInstance.id}" class="btn btn-small">Show &raquo;</g:link>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="form-actions">
                        <a href="#retry-confirm" role="button" class="btn btn-warning" data-toggle="modal"><g:message code='default.button.retry.label'/></a>
                        
                        <div id="retry-confirm" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Retry</h3>
                            </div>
                            <div class="modal-body">
                                <p>You are about to retry XXX process execution.</p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                <g:actionSubmit class="btn btn-warning" value="Confirm" action="retryListProcess" />
                            </div>
                        </div>
                        
                        <a href="#abort-confirm" role="button" class="btn btn-danger" data-toggle="modal"><g:message code='default.button.abort.label'/></a>
                        
                        <div id="abort-confirm" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Retry</h3>
                            </div>
                            <div class="modal-body">
                                <p>You are about to abort XXX process execution.</p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                <g:actionSubmit class="btn btn-danger" value="Confirm" action="abortListProcess" />
                            </div>
                        </div>
                    </div>
                    
                </g:form>
                <div class="pagination">
                    <bootstrap:paginate total="${ProcessInstanceCount == null ? ProcessInstance.count(): ProcessInstanceCount}" params="${filterParams}" />
                </div>
            </div>

        </div>
                    
    </body>
</html>
