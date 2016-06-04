
<%@ page import="vermax.OrdenDeTrabajo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordenDeTrabajo.label', default: 'OrdenDeTrabajo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ordenDeTrabajo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ordenDeTrabajo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="observaciones" title="${message(code: 'ordenDeTrabajo.observaciones.label', default: 'Numero')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'ordenDeTrabajo.estado.label', default: 'Estado')}" />
					
						<th><g:message code="ordenDeTrabajo.cliente.label" default="Cliente" /></th>
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'ordenDeTrabajo.fechaInicio.label', default: 'Fecha Inicio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ordenDeTrabajoInstanceList}" status="i" var="ordenDeTrabajoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ordenDeTrabajoInstance.id}">${fieldValue(bean: ordenDeTrabajoInstance, field: "id")}</g:link></td>
					
						<td>${fieldValue(bean: ordenDeTrabajoInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: ordenDeTrabajoInstance, field: "cliente")}</td>
					
						<td><g:formatDate format="dd/MM/yyyy" date="${ordenDeTrabajoInstance.fechaInicio}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ordenDeTrabajoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
