
<%@ page import="vermax.Equipo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipo.label', default: 'Equipo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-equipo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-equipo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list equipo">
			
				<g:if test="${equipoInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="equipo.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${equipoInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipoInstance?.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="equipo.marca.label" default="Marca" /></span>
					
						<span class="property-value" aria-labelledby="marca-label"><g:fieldValue bean="${equipoInstance}" field="marca"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipoInstance?.modelo}">
				<li class="fieldcontain">
					<span id="modelo-label" class="property-label"><g:message code="equipo.modelo.label" default="Modelo" /></span>
					
						<span class="property-value" aria-labelledby="modelo-label"><g:fieldValue bean="${equipoInstance}" field="modelo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipoInstance?.esLavadora}">
				<li class="fieldcontain">
					<span id="esLavadora-label" class="property-label"><g:message code="equipo.esLavadora.label" default="Es Lavadora" /></span>
					
						<span class="property-value" aria-labelledby="esLavadora-label"><g:formatBoolean boolean="${equipoInstance?.esLavadora}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipoInstance?.duracionCiclo}">
				<li class="fieldcontain">
					<span id="duracionCiclo-label" class="property-label"><g:message code="equipo.duracionCiclo.label" default="Duracion Ciclo" /></span>
					
						<span class="property-value" aria-labelledby="duracionCiclo-label"><g:fieldValue bean="${equipoInstance}" field="duracionCiclo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:equipoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${equipoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
