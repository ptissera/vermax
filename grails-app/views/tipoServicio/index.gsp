
<%@ page import="vermax.TipoServicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoServicio.label', default: 'TipoServicio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipoServicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipoServicio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'tipoServicio.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="precioLavado" title="${message(code: 'tipoServicio.precioLavado.label', default: 'Precio Lavado')}" />
					
						<g:sortableColumn property="precioSecado" title="${message(code: 'tipoServicio.precioSecado.label', default: 'Precio Secado')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoServicioInstanceList}" status="i" var="tipoServicioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoServicioInstance.id}">${fieldValue(bean: tipoServicioInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: tipoServicioInstance, field: "precioLavado")}</td>
					
						<td>${fieldValue(bean: tipoServicioInstance, field: "precioSecado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoServicioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
