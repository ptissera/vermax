<%@ page import="vermax.Egreso" %>



<div class="fieldcontain ${hasErrors(bean: egresoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="egreso.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${egresoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: egresoInstance, field: 'proveedor', 'error')} ">
	<label for="proveedor">
		<g:message code="egreso.proveedor.label" default="Proveedor" />
		
	</label>
	<g:textField name="proveedor" value="${egresoInstance?.proveedor}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: egresoInstance, field: 'monto', 'error')} ">
	<label for="monto">
		<g:message code="egreso.monto.label" default="Monto" />
		
	</label>
	<g:field name="monto" value="${fieldValue(bean: egresoInstance, field: 'monto')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: egresoInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="egreso.fecha.label" default="Fecha" />
		
	</label>
	<g:datePicker name="fecha" precision="day"  value="${egresoInstance?.fecha}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: egresoInstance, field: 'nroComprobante', 'error')} required">
	<label for="nroComprobante">
		<g:message code="egreso.nroComprobante.label" default="Nro Comprobante" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nroComprobante" required="" value="${egresoInstance?.nroComprobante}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: egresoInstance, field: 'responsable', 'error')} required">
	<label for="responsable">
		<g:message code="egreso.responsable.label" default="Responsable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="responsable" name="responsable.id" from="${vermax.Usuario.list()}" optionKey="id" required="" value="${egresoInstance?.responsable?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: egresoInstance, field: 'rubro', 'error')} required">
	<label for="rubro">
		<g:message code="egreso.rubro.label" default="Rubro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rubro" name="rubro.id" from="${vermax.Rubro.list()}" optionKey="id" required="" value="${egresoInstance?.rubro?.id}" class="many-to-one"/>

</div>

