
<%@ page import="vermax.Cobro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cobro.label', default: 'Cobro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cobro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cobro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cobro">
			
				<g:if test="${cobroInstance?.fechaHora}">
				<li class="fieldcontain">
					<span id="fechaHora-label" class="property-label"><g:message code="cobro.fechaHora.label" default="Fecha Hora" /></span>
					
						<span class="property-value" aria-labelledby="fechaHora-label"><g:formatDate date="${cobroInstance?.fechaHora}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cobroInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="cobro.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${cobroInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cobroInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="cobro.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${cobroInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cobroInstance?.ordenDeTrabajo}">
				<li class="fieldcontain">
					<span id="ordenDeTrabajo-label" class="property-label"><g:message code="cobro.ordenDeTrabajo.label" default="Orden De Trabajo" /></span>
					
						<span class="property-value" aria-labelledby="ordenDeTrabajo-label"><g:link controller="ordenDeTrabajo" action="show" id="${cobroInstance?.ordenDeTrabajo?.id}">${cobroInstance?.ordenDeTrabajo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:cobroInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${cobroInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
