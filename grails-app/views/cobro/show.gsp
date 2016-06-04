
<%@ page import="vermax.Cobro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cobro.label', default: 'Cobro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cobro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cobro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cobro">
			
				<g:if test="${cobroInstance?.fechaHora}">
				<li class="fieldcontain">
					<span id="fechaHora-label" class="property-label"><g:message code="cobro.fechaHora.label" default="Fecha Hora" /></span>
					
						<span class="property-value" aria-labelledby="fechaHora-label"><g:formatDate format="dd/MM/yyyy - hh:mm" date="${cobroInstance?.fechaHora}" /></span>
					
				</li>
				<li class="fieldcontain">
					<span id="fechaHora-label" class="property-label"><g:message code="cobro.fechaHora.label" default="Orden de Trabajo Nro" /></span>
					
						<span class="property-value" aria-labelledby="fechaHora-label">${cobroInstance?.ordenDeTrabajo.id}</span>
					
				</li>
				<li class="fieldcontain">
					<span id="fechaHora-label" class="property-label"><g:message code="cobro.fechaHora.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="fechaHora-label">${cobroInstance?.ordenDeTrabajo.cliente}</span>
					
				</li>
				</g:if>
			
				<g:if test="${cobroInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="cobro.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${cobroInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cobroInstance?.ordenDeTrabajo}">
				<li class="fieldcontain"><span id="detalle-label"
					class="property-label"><g:message
							code="ordenDeTrabajo.detalle.label" default="Detalle" /></span>
					<table>
						<thead>
							<tr>
								<th>Servicio</th>
								<th>Cantidad</th>
								<th>Lavado</th>
								<th>Secado</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${cobroInstance?.ordenDeTrabajo.detalles}" status="i"
								var="detalle">
								<tr>
									<td>
										${detalle?.servicio.nombre}
									</td>

									<td>
										${detalle?.cantidad}
									</td>

									<td><g:checkBox name="lavado" value="${detalle?.lavado}"
											disabled="true" readonly="true" /></td>

									<td><g:checkBox name="secado" value="${detalle?.secado}"
											disabled="true" readonly="true" /></td>

									<td><span class="totalDetalle">$ ${detalle?.getTotal()}</span></td>

								</tr>
							</g:each>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="4"></th>
								<th><span class="totalOrden">$ ${cobroInstance?.ordenDeTrabajo.getTotal()}</span></th>
							</tr>
						</tfoot>
					</table></li>
				</g:if>
			
			</ol>
			<g:form url="[resource:cobroInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
