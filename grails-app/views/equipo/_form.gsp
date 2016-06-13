<%@ page import="vermax.Equipo" %>



<div class="fieldcontain ${hasErrors(bean: equipoInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="equipo.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" required="" value="${equipoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipoInstance, field: 'marca', 'error')} required">
	<label for="marca">
		<g:message code="equipo.marca.label" default="Marca" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="marca" required="" value="${equipoInstance?.marca}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipoInstance, field: 'modelo', 'error')} ">
	<label for="modelo">
		<g:message code="equipo.modelo.label" default="Modelo" />
		
	</label>
	<g:textField name="modelo" value="${equipoInstance?.modelo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipoInstance, field: 'esLavadora', 'error')} ">
	<label for="esLavadora">
		<g:message code="equipo.esLavadora.label" default="Es Lavadora" />
		
	</label>
	<g:checkBox name="esLavadora" value="${equipoInstance?.esLavadora}" />

</div>

<div class="fieldcontain ${hasErrors(bean: equipoInstance, field: 'duracionCiclo', 'error')} required">
	<label for="duracionCiclo">
		<g:message code="equipo.duracionCiclo.label" default="Duracion Ciclo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracionCiclo" type="number" value="${equipoInstance.duracionCiclo}" required=""/>

</div>

