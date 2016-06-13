<%@ page import="vermax.Rubro" %>



<div class="fieldcontain ${hasErrors(bean: rubroInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="rubro.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${rubroInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rubroInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="rubro.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${rubroInstance?.descripcion}"/>

</div>

