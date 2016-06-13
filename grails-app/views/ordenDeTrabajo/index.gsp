
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
			<g:form autocomplete="off" url="[resource:ordenDeTrabajoInstance, action:'index']" method="POST" >
				<fieldset class="filtrarPor">
					<legend>Filtrar por</legend>
					<div class="fieldcontain">
						<label>Ordenes Creadas</label>
						<g:checkBox name="ordenesCreadas" value="${flash.ordenesCreadas}" checked="${flash.ordenesCreadas}"/><label></label>
						<label>Ordenes Iniciadas</label>
						<g:checkBox name="ordenesIniciadas" value="${flash.ordenesIniciadas}" checked="${flash.ordenesIniciadas}"/><br>
						<label>Ordenes Completado</label>
						<g:checkBox name="ordenesCompletado" value="${flash.ordenesCompletado}" checked="${flash.ordenesCompletado}"/><label></label>
						<label>Ordenes Entregado</label>
						<g:checkBox name="ordenesEntregado" value="${flash.ordenesEntregado}" checked="${flash.ordenesEntregado}"/><br>
						<label>Ordenes Cancelado</label>
						<g:checkBox name="ordenesCancelado" value="${flash.ordenesCancelado}" checked="${flash.ordenesCancelado}"/>
					</div>
					<fieldset>
					<g:submitButton name="create" class="save" value="Filtrar" />
				</fieldset>
					
				</fieldset>				
			</g:form>
			<table>
			<thead>
					<tr>
						<th>Numero</th>
						<th>Estado</th>
						<th>Cliente</th>
						<th>Fecha Creacion</th>
						<th>Fecha Inicio</th>
						<th>Fecha Completado</th>
						<th>Pagado</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${ordenDeTrabajoInstanceList}" status="i" var="ordenDeTrabajoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ordenDeTrabajoInstance.id}">${fieldValue(bean: ordenDeTrabajoInstance, field: "id")}</g:link></td>
					
						<td>${fieldValue(bean: ordenDeTrabajoInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: ordenDeTrabajoInstance, field: "cliente")}</td>
					
						<td><g:formatDate format="dd/MM/yyyy" date="${ordenDeTrabajoInstance.fechaCreacion}" /></td>
						<td><g:formatDate format="dd/MM/yyyy" date="${ordenDeTrabajoInstance.fechaInicio}" /></td>
						<td><g:formatDate format="dd/MM/yyyy" date="${ordenDeTrabajoInstance.fechaCompletado}" /></td>
						<td><g:checkBox name="pagado" value="${ordenDeTrabajoInstance.pagado}"
											disabled="true" readonly="true" /></td>
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
