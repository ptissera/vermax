
<%@ page import="vermax.DetalleOrdenTrabajo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleOrdenTrabajo.label', default: 'DetalleOrdenTrabajo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleOrdenTrabajo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleOrdenTrabajo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleOrdenTrabajo">
			
				<g:if test="${detalleOrdenTrabajoInstance?.servicio}">
				<li class="fieldcontain">
					<span id="servicio-label" class="property-label"><g:message code="detalleOrdenTrabajo.servicio.label" default="Servicio" /></span>
					
						<span class="property-value" aria-labelledby="servicio-label"><g:link controller="tipoServicio" action="show" id="${detalleOrdenTrabajoInstance?.servicio?.id}">${detalleOrdenTrabajoInstance?.servicio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleOrdenTrabajoInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="detalleOrdenTrabajo.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${detalleOrdenTrabajoInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleOrdenTrabajoInstance?.lavado}">
				<li class="fieldcontain">
					<span id="lavado-label" class="property-label"><g:message code="detalleOrdenTrabajo.lavado.label" default="Lavado" /></span>
					
						<span class="property-value" aria-labelledby="lavado-label"><g:formatBoolean boolean="${detalleOrdenTrabajoInstance?.lavado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleOrdenTrabajoInstance?.secado}">
				<li class="fieldcontain">
					<span id="secado-label" class="property-label"><g:message code="detalleOrdenTrabajo.secado.label" default="Secado" /></span>
					
						<span class="property-value" aria-labelledby="secado-label"><g:formatBoolean boolean="${detalleOrdenTrabajoInstance?.secado}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:detalleOrdenTrabajoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${detalleOrdenTrabajoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
