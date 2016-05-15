<%@ page import="vermax.DetalleOrdenTrabajo" %>



<div class="fieldcontain ${hasErrors(bean: detalleOrdenTrabajoInstance, field: 'servicio', 'error')} required">
	<label for="servicio">
		<g:message code="detalleOrdenTrabajo.servicio.label" default="Servicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="servicio" name="servicio.id" from="${vermax.TipoServicio.list()}" optionKey="id" required="" value="${detalleOrdenTrabajoInstance?.servicio?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleOrdenTrabajoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="detalleOrdenTrabajo.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="cantidad" from="${1..10}" class="range" required="" value="${fieldValue(bean: detalleOrdenTrabajoInstance, field: 'cantidad')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleOrdenTrabajoInstance, field: 'lavado', 'error')} ">
	<label for="lavado">
		<g:message code="detalleOrdenTrabajo.lavado.label" default="Lavado" />
		
	</label>
	<g:checkBox name="lavado" value="${detalleOrdenTrabajoInstance?.lavado}" />

</div>

<div class="fieldcontain ${hasErrors(bean: detalleOrdenTrabajoInstance, field: 'secado', 'error')} ">
	<label for="secado">
		<g:message code="detalleOrdenTrabajo.secado.label" default="Secado" />
		
	</label>
	<g:checkBox name="secado" value="${detalleOrdenTrabajoInstance?.secado}" />

</div>

