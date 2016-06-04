<%@ page import="vermax.Barrio" %>



<div class="fieldcontain ${hasErrors(bean: barrioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="barrio.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${barrioInstance?.nombre}"/>

</div>

