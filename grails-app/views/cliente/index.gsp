
<%@ page import="vermax.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cliente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'cliente.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'cliente.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="dNI" title="${message(code: 'cliente.dNI.label', default: 'D NI')}" />
					
						<g:sortableColumn property="fechaDeNacimiento" title="${message(code: 'cliente.fechaDeNacimiento.label', default: 'Fecha De Nacimiento')}" />
					
						<g:sortableColumn property="calle" title="${message(code: 'cliente.calle.label', default: 'Calle')}" />
					
						<g:sortableColumn property="numeracion" title="${message(code: 'cliente.numeracion.label', default: 'Numeracion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: clienteInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "dNI")}</td>
					
						<td><g:formatDate date="${clienteInstance.fechaDeNacimiento}" /></td>
					
						<td>${fieldValue(bean: clienteInstance, field: "calle")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "numeracion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clienteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
