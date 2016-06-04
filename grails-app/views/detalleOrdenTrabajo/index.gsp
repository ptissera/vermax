
<%@ page import="vermax.DetalleOrdenTrabajo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleOrdenTrabajo.label', default: 'DetalleOrdenTrabajo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleOrdenTrabajo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleOrdenTrabajo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="detalleOrdenTrabajo.servicio.label" default="Servicio" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'detalleOrdenTrabajo.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="lavado" title="${message(code: 'detalleOrdenTrabajo.lavado.label', default: 'Lavado')}" />
					
						<g:sortableColumn property="secado" title="${message(code: 'detalleOrdenTrabajo.secado.label', default: 'Secado')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleOrdenTrabajoInstanceList}" status="i" var="detalleOrdenTrabajoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detalleOrdenTrabajoInstance.id}">${fieldValue(bean: detalleOrdenTrabajoInstance, field: "servicio")}</g:link></td>
					
						<td>${fieldValue(bean: detalleOrdenTrabajoInstance, field: "cantidad")}</td>
					
						<td><g:formatBoolean boolean="${detalleOrdenTrabajoInstance.lavado}" /></td>
					
						<td><g:formatBoolean boolean="${detalleOrdenTrabajoInstance.secado}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleOrdenTrabajoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
