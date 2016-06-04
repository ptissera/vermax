
<%@ page import="vermax.TipoServicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoServicio.label', default: 'TipoServicio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoServicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoServicio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoServicio">
			
				<g:if test="${tipoServicioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="tipoServicio.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tipoServicioInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoServicioInstance?.precioLavado}">
				<li class="fieldcontain">
					<span id="precioLavado-label" class="property-label"><g:message code="tipoServicio.precioLavado.label" default="Precio Lavado" /></span>
					
						<span class="property-value" aria-labelledby="precioLavado-label"><g:fieldValue bean="${tipoServicioInstance}" field="precioLavado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoServicioInstance?.precioSecado}">
				<li class="fieldcontain">
					<span id="precioSecado-label" class="property-label"><g:message code="tipoServicio.precioSecado.label" default="Precio Secado" /></span>
					
						<span class="property-value" aria-labelledby="precioSecado-label"><g:fieldValue bean="${tipoServicioInstance}" field="precioSecado"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tipoServicioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tipoServicioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
