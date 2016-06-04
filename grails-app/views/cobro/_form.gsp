<%@ page import="vermax.Cobro" %>
<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'fechaHora', 'error')} ">
	<label for="fechaHora">
		<g:message code="cobro.fechaHora.label" default="Fecha Hora" />
		<span class="required-indicator"></span>
	</label>
	<g:formatDate format="dd/MM/yyyy - hh:mm"
							date="${cobroInstance?.fechaHora}" />
</div>
<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'ordenDeTrabajo', 'error')} ">
	<label for="ordenDeTrabajo">
		<g:message code="cobro.ordenDeTrabajo.label" default="Orden De Trabajo Nro" />
		<span class="required-indicator"></span>
	</label>
	${cobroInstance?.ordenDeTrabajo.id}
	<g:hiddenField name="ordenDeTrabajo.id" value="${cobroInstance?.ordenDeTrabajo.id}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'ordenDeTrabajo', 'error')} ">
	<label for="ordenDeTrabajo">
		<g:message code="cobro.ordenDeTrabajo.label" default="Cliente" />
		<span class="required-indicator"></span>
	</label>
	${cobroInstance?.ordenDeTrabajo.cliente}
</div>
<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'ordenDeTrabajo', 'error')} ">

<label for="ordenDeTrabajo">
		<g:message code="cobro.ordenDeTrabajo.label" default="Detalle" />
		<span class="required-indicator"></span>
	</label>
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
					</table>
</div>


<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="cobro.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: cobroInstance, field: 'monto')}" required=""/>

</div>



