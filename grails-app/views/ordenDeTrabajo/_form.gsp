<%@ page import="vermax.OrdenDeTrabajo"%>

<div
	class="fieldcontain ${hasErrors(bean: ordenDeTrabajoInstance, field: 'cliente', 'error')} required">
	<label for="cliente"> <g:message
			code="ordenDeTrabajo.cliente.label" default="Cliente" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id"
		from="${vermax.Cliente.list()}" optionKey="id" required=""
		value="${ordenDeTrabajoInstance?.cliente?.id}" class="many-to-one" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: ordenDeTrabajoInstance, field: 'detalle', 'error')} ">
	<label for="detalle"> <g:message
			code="ordenDeTrabajo.detalle.label" default="Detalle" />

	</label>
	<table>
		<thead>
			<tr>
				<g:sortableColumn property="cantidad"
					title="${message(code: 'detalleOrdenTrabajo.cantidad.label', default: 'Cantidad')}" />
				<th><g:message code="detalleOrdenTrabajo.servicio.label"
						default="Servicio" /></th>
				<g:sortableColumn property="lavado"
					title="${message(code: 'detalleOrdenTrabajo.lavado.label', default: 'Lavado')}" />
				<g:sortableColumn property="secado"
					title="${message(code: 'detalleOrdenTrabajo.secado.label', default: 'Secado')}" />

			</tr>
		</thead>
		<tbody>
			<g:each in="${detalle}" status="i" var="detalleOrdenTrabajoInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>
						${fieldValue(bean: detalleOrdenTrabajoInstance, field: "cantidad")}
					</td>
					<td><g:link action="show"
							id="${detalleOrdenTrabajoInstance.id}">
							${fieldValue(bean: detalleOrdenTrabajoInstance, field: "servicio")}
						</g:link></td>
					<td><g:formatBoolean
							boolean="${detalleOrdenTrabajoInstance.lavado}" /></td>
					<td><g:formatBoolean
							boolean="${detalleOrdenTrabajoInstance.secado}" /></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>

<div
	class="fieldcontain ${hasErrors(bean: ordenDeTrabajoInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones"> <g:message
			code="ordenDeTrabajo.observaciones.label" default="Observaciones" />

	</label>
	<g:textArea name="observaciones" cols="100" rows="2" maxlength="200"
		value="${ordenDeTrabajoInstance?.observaciones}" />

</div>


