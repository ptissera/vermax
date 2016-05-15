<%@ page import="vermax.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="cliente.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${clienteInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="cliente.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${clienteInstance?.apellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'dNI', 'error')} ">
	<label for="dNI">
		<g:message code="cliente.dNI.label" default="D NI" />
		
	</label>
	<g:textField name="dNI" maxlength="10" value="${clienteInstance?.dNI}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'fechaDeNacimiento', 'error')} ">
	<label for="fechaDeNacimiento">
		<g:message code="cliente.fechaDeNacimiento.label" default="Fecha De Nacimiento" />
		
	</label>
	<g:datePicker name="fechaDeNacimiento" format="dd/MM/yyyy" precision="day"  value="${clienteInstance?.fechaDeNacimiento}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="cliente.calle.label" default="Calle" />
		
	</label>
	<g:textArea name="calle" cols="40" rows="5" maxlength="200" value="${clienteInstance?.calle}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'numeracion', 'error')} required">
	<label for="numeracion">
		<g:message code="cliente.numeracion.label" default="Numeracion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeracion" type="number" value="${clienteInstance.numeracion}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'piso', 'error')} required">
	<label for="piso">
		<g:message code="cliente.piso.label" default="Piso" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="piso" required="" value="${clienteInstance?.piso}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'dpto', 'error')} required">
	<label for="dpto">
		<g:message code="cliente.dpto.label" default="Dpto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dpto" required="" value="${clienteInstance?.dpto}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'barrio', 'error')} ">
	<label for="barrio">
		<g:message code="cliente.barrio.label" default="Barrio" />
		
	</label>
	<g:select id="barrio" name="barrio.id" from="${vermax.Barrio.list()}" optionKey="id" value="${clienteInstance?.barrio?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="cliente.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${clienteInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="cliente.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${clienteInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'celular', 'error')} ">
	<label for="celular">
		<g:message code="cliente.celular.label" default="Celular" />
		
	</label>
	<g:textField name="celular" value="${clienteInstance?.celular}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="cliente.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${clienteInstance.constraints.sexo.inList}" required="" value="${clienteInstance?.sexo}" valueMessagePrefix="cliente.sexo"/>

</div>

