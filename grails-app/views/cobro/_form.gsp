<%@ page import="vermax.Cobro" %>



<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'fechaHora', 'error')} required">
	<label for="fechaHora">
		<g:message code="cobro.fechaHora.label" default="Fecha Hora" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaHora" precision="day"  value="${cobroInstance?.fechaHora}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="cobro.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: cobroInstance, field: 'monto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="cobro.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${cobroInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'ordenDeTrabajo', 'error')} required">
	<label for="ordenDeTrabajo">
		<g:message code="cobro.ordenDeTrabajo.label" default="Orden De Trabajo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ordenDeTrabajo" name="ordenDeTrabajo.id" from="${vermax.OrdenDeTrabajo.list()}" optionKey="id" required="" value="${cobroInstance?.ordenDeTrabajo?.id}" class="many-to-one"/>

</div>

