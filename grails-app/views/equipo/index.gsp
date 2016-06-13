
<%@ page import="vermax.Equipo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipo.label', default: 'Equipo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-equipo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-equipo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'equipo.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="marca" title="${message(code: 'equipo.marca.label', default: 'Marca')}" />
					
						<g:sortableColumn property="modelo" title="${message(code: 'equipo.modelo.label', default: 'Modelo')}" />
					
						<g:sortableColumn property="esLavadora" title="${message(code: 'equipo.esLavadora.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="duracionCiclo" title="${message(code: 'equipo.duracionCiclo.label', default: 'Duracion Ciclo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${equipoInstanceList}" status="i" var="equipoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${equipoInstance.id}">${fieldValue(bean: equipoInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: equipoInstance, field: "marca")}</td>
					
						<td>${fieldValue(bean: equipoInstance, field: "modelo")}</td>
					
						<td>${equipoInstance.esLavadora?'Lavadora':'Secadora'}</td>
					
						<td>${fieldValue(bean: equipoInstance, field: "duracionCiclo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${equipoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
