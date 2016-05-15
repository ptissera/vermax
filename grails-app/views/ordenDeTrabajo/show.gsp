
<%@ page import="vermax.OrdenDeTrabajo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordenDeTrabajo.label', default: 'OrdenDeTrabajo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ordenDeTrabajo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ordenDeTrabajo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ordenDeTrabajo">
			
				<g:if test="${ordenDeTrabajoInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="ordenDeTrabajo.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${ordenDeTrabajoInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeTrabajoInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="ordenDeTrabajo.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${ordenDeTrabajoInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeTrabajoInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="ordenDeTrabajo.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${ordenDeTrabajoInstance?.cliente?.id}">${ordenDeTrabajoInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeTrabajoInstance?.detalle}">
				<li class="fieldcontain">
					<span id="detalle-label" class="property-label"><g:message code="ordenDeTrabajo.detalle.label" default="Detalle" /></span>
					
						<g:each in="${ordenDeTrabajoInstance.detalle}" var="d">
						<span class="property-value" aria-labelledby="detalle-label"><g:link controller="detalleOrdenTrabajo" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeTrabajoInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="ordenDeTrabajo.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate date="${ordenDeTrabajoInstance?.fechaInicio}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:ordenDeTrabajoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${ordenDeTrabajoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
