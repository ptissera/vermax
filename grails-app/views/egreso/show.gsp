
<%@ page import="vermax.Egreso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-egreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-egreso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list egreso">
			
				<g:if test="${egresoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="egreso.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${egresoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${egresoInstance?.proveedor}">
				<li class="fieldcontain">
					<span id="proveedor-label" class="property-label"><g:message code="egreso.proveedor.label" default="Proveedor" /></span>
					
						<span class="property-value" aria-labelledby="proveedor-label"><g:fieldValue bean="${egresoInstance}" field="proveedor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${egresoInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="egreso.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${egresoInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${egresoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="egreso.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${egresoInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${egresoInstance?.nroComprobante}">
				<li class="fieldcontain">
					<span id="nroComprobante-label" class="property-label"><g:message code="egreso.nroComprobante.label" default="Nro Comprobante" /></span>
					
						<span class="property-value" aria-labelledby="nroComprobante-label"><g:fieldValue bean="${egresoInstance}" field="nroComprobante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${egresoInstance?.responsable}">
				<li class="fieldcontain">
					<span id="responsable-label" class="property-label"><g:message code="egreso.responsable.label" default="Responsable" /></span>
					
						<span class="property-value" aria-labelledby="responsable-label"><g:link controller="usuario" action="show" id="${egresoInstance?.responsable?.id}">${egresoInstance?.responsable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${egresoInstance?.rubro}">
				<li class="fieldcontain">
					<span id="rubro-label" class="property-label"><g:message code="egreso.rubro.label" default="Rubro" /></span>
					
						<span class="property-value" aria-labelledby="rubro-label"><g:link controller="rubro" action="show" id="${egresoInstance?.rubro?.id}">${egresoInstance?.rubro?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:egresoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${egresoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
