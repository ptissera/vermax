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
	<g:render template="detalles" model="['ordenDeTrabajoInstance':ordenDeTrabajoInstance]" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: ordenDeTrabajoInstance, field: 'detalle', 'error')} ">
	 <fieldset class="buttons">
<input type="button" value="Agregar Detalle" class="edit" onclick="addDetalle();" />
</fieldset>
	
</div>


<div
	class="fieldcontain ${hasErrors(bean: ordenDeTrabajoInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones"> <g:message
			code="ordenDeTrabajo.observaciones.label" default="Observaciones" />

	</label>
	<g:textArea name="observaciones" cols="100" rows="2" maxlength="200"
		value="${ordenDeTrabajoInstance?.observaciones}" />

</div>


