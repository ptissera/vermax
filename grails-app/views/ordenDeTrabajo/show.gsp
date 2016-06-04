
<%@ page import="vermax.OrdenDeTrabajo"%>
<%@ page import="vermax.EstadosDeLaOrden"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'ordenDeTrabajo.label', default: 'OrdenDeTrabajo')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-ordenDeTrabajo" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-ordenDeTrabajo" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:if test="${ordenDeTrabajoInstance.pagado}">
			<div class="ordenPagada">
				<g:img file="pagado.png" />
			</div>
		</g:if>
		<ol class="property-list ordenDeTrabajo">

			<li class="fieldcontain"><span id="estado-label"
				class="property-label">Nro</span> <span class="property-value"
				aria-labelledby="estado-label"><g:fieldValue
						bean="${ordenDeTrabajoInstance}" field="id" /></span></li>
			<g:if test="${ordenDeTrabajoInstance?.estado}">
				<li class="fieldcontain"><span id="estado-label"
					class="property-label"><g:message
							code="ordenDeTrabajo.estado.label" default="Estado" /></span> <span
					class="property-value" aria-labelledby="estado-label"><g:fieldValue
							bean="${ordenDeTrabajoInstance}" field="estado" /></span></li>
			</g:if>

			<g:if test="${ordenDeTrabajoInstance?.cliente}">
				<li class="fieldcontain"><span id="cliente-label"
					class="property-label"><g:message
							code="ordenDeTrabajo.cliente.label" default="Cliente" /></span> <span
					class="property-value" aria-labelledby="cliente-label"> ${ordenDeTrabajoInstance?.cliente?.encodeAsHTML()}
				</span></li>
			</g:if>

			<g:if test="${ordenDeTrabajoInstance?.fechaCreacion}">
				<li class="fieldcontain"><span id="fechaInicio-label"
					class="property-label"><g:message
							code="ordenDeTrabajo.fechaInicio.label" default="Fecha Creada" /></span>

					<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate
							format="dd/MM/yyyy - hh:mm"
							date="${ordenDeTrabajoInstance?.fechaCreacion}" /></span></li>
			</g:if>

			<g:if test="${ordenDeTrabajoInstance?.fechaInicio}">
				<li class="fieldcontain"><span id="fechaInicio-label"
					class="property-label"><g:message
							code="ordenDeTrabajo.fechaInicio.label" default="Fecha Inicio" /></span>

					<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate
							format="dd/MM/yyyy - hh:mm"
							date="${ordenDeTrabajoInstance?.fechaInicio}" /></span></li>
			</g:if>

			<g:if test="${ordenDeTrabajoInstance?.fechaCompletado}">
				<li class="fieldcontain"><span id="fechaInicio-label"
					class="property-label"><g:message
							code="ordenDeTrabajo.fechaInicio.label"
							default="Fecha Completado" /></span> <span class="property-value"
					aria-labelledby="fechaInicio-label"><g:formatDate
							format="dd/MM/yyyy - hh:mm"
							date="${ordenDeTrabajoInstance?.fechaCompletado}" /></span></li>
			</g:if>

			<g:if test="${ordenDeTrabajoInstance?.fechaEntrega}">
				<li class="fieldcontain"><span id="fechaInicio-label"
					class="property-label"><g:message
							code="ordenDeTrabajo.fechaInicio.label" default="Fecha Entrega" /></span>

					<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate
							format="dd/MM/yyyy - hh:mm"
							date="${ordenDeTrabajoInstance?.fechaEntrega}" /></span></li>
			</g:if>

			<g:if test="${ordenDeTrabajoInstance?.fechaCancelado}">
				<li class="fieldcontain"><span id="fechaInicio-label"
					class="property-label"><g:message
							code="ordenDeTrabajo.fechaInicio.label" default="Fecha Cancelado" /></span>

					<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate
							format="dd/MM/yyyy - hh:mm"
							date="${ordenDeTrabajoInstance?.fechaCancelado}" /></span></li>
			</g:if>

			<g:if test="${ordenDeTrabajoInstance?.observaciones}">
				<li class="fieldcontain"><span id="observaciones-label"
					class="property-label"><g:message
							code="ordenDeTrabajo.observaciones.label" default="Observaciones" /></span>

					<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue
							bean="${ordenDeTrabajoInstance}" field="observaciones" /></span></li>
			</g:if>
			<g:if test="${ordenDeTrabajoInstance?.detalles}">
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
							<g:each in="${ordenDeTrabajoInstance.detalles}" status="i"
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
								<th><span class="totalOrden">$ ${ordenDeTrabajoInstance.getTotal()}</span></th>
							</tr>
						</tfoot>
					</table></li>
			</g:if>

		</ol>
		<g:form url="[resource:ordenDeTrabajoInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:if
					test="${ordenDeTrabajoInstance?.estado == EstadosDeLaOrden.Creado}">
					<g:link class="edit" action="iniciarLavado"
						resource="${ordenDeTrabajoInstance}">Iniciar</g:link>
						<g:if test="${ordenDeTrabajoInstance.pagado == false}">
					<g:actionSubmit class="delete" action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:if>		
				</g:if>
				<g:if
					test="${ordenDeTrabajoInstance?.estado == EstadosDeLaOrden.Iniciado}">
					<g:link class="edit" action="completarLavado"
						resource="${ordenDeTrabajoInstance}">Completado</g:link>
					<g:if test="${ordenDeTrabajoInstance.pagado == false}">
						<g:link class="edit" action="cancelarLavado"
							resource="${ordenDeTrabajoInstance}">Cancelar Orden</g:link>
					</g:if>
				</g:if>
				<g:if
					test="${ordenDeTrabajoInstance?.estado == EstadosDeLaOrden.Completo}">
					<g:link class="edit" action="entregarLavado"
						resource="${ordenDeTrabajoInstance}">Entregado</g:link>
					<g:if test="${ordenDeTrabajoInstance.pagado == false}">
						<g:link class="edit" action="cancelarLavado"
							resource="${ordenDeTrabajoInstance}">Cancelar Orden</g:link>
					</g:if>
				</g:if>
				<g:if test="${ordenDeTrabajoInstance.pagado == false}">
					<g:link class="edit" action="cobrarOrden"
						resource="${ordenDeTrabajoInstance}">Cobrar</g:link>
				</g:if>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
