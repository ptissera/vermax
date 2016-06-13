
<%@ page import="vermax.Egreso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'egreso.label', default: 'Egreso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-egreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-egreso" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'egreso.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="proveedor" title="${message(code: 'egreso.proveedor.label', default: 'Proveedor')}" />
					
						<g:sortableColumn property="monto" title="${message(code: 'egreso.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'egreso.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="nroComprobante" title="${message(code: 'egreso.nroComprobante.label', default: 'Nro Comprobante')}" />
					
						<th><g:message code="egreso.responsable.label" default="Responsable" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${egresoInstanceList}" status="i" var="egresoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${egresoInstance.id}">${fieldValue(bean: egresoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: egresoInstance, field: "proveedor")}</td>
					
						<td>${fieldValue(bean: egresoInstance, field: "monto")}</td>
					
						<td><g:formatDate date="${egresoInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: egresoInstance, field: "nroComprobante")}</td>
					
						<td>${fieldValue(bean: egresoInstance, field: "responsable")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${egresoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
