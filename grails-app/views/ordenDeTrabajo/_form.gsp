<%@ page import="vermax.OrdenDeTrabajo"%>

<div
	class="fieldcontain ${hasErrors(bean: ordenDeTrabajoInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones"> Demora en dias habiles

	</label>
	<span>${flash.demora }</span>

</div>
<div
	class="fieldcontain ${hasErrors(bean: ordenDeTrabajoInstance, field: 'cliente', 'error')} required">
	<label for="cliente"> <g:message
			code="ordenDeTrabajo.cliente.label" default="Cliente" /> <span
		class="required-indicator">*</span>
	</label>
	
	<input type="text" name="search" id="search">
	<g:select id="cliente" name="cliente.id"
		from="${vermax.Cliente.list()}" optionKey="id" required=""
		value="${ordenDeTrabajoInstance?.cliente?.id}" class="many-to-one" />
<g:link class="create" action="create" controller="cliente" params="[regresarAOrden: 'yes']">Agregar Cliente</g:link>
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

<script>
	jQuery.fn.filterByText = function(textbox) {
	    return this.each(function() {
	        var select = this;
	        var options = [];
	        $(select).find('option').each(function() {
	            options.push({value: $(this).val(), text: $(this).text()});
	        });
	        $(select).data('options', options);

	        $(textbox).bind('change keyup', function() {
	            var options = $(select).empty().data('options');
	            var search = $.trim($(this).val());
	            var regex = new RegExp(search,"gi");

	            $.each(options, function(i) {
	                var option = options[i];
	                if(option.text.match(regex) !== null) {
	                    $(select).append(
	                        $('<option>').text(option.text).val(option.value)
	                    );
	                }
	            });
	        });
	    });
	};
$(function() {
    $('#cliente').filterByText($('#search'));
});
</script>
