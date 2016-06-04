<%@ page import="vermax.TipoServicio" %>



<div class="fieldcontain ${hasErrors(bean: tipoServicioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="tipoServicio.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${tipoServicioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoServicioInstance, field: 'precioLavado', 'error')} required">
	<label for="precioLavado">
		<g:message code="tipoServicio.precioLavado.label" default="Precio Lavado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precioLavado" value="${fieldValue(bean: tipoServicioInstance, field: 'precioLavado')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoServicioInstance, field: 'precioSecado', 'error')} required">
	<label for="precioSecado">
		<g:message code="tipoServicio.precioSecado.label" default="Precio Secado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precioSecado" value="${fieldValue(bean: tipoServicioInstance, field: 'precioSecado')}" required=""/>

</div>

