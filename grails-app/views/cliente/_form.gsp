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

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'domicilio', 'error')} ">
	<label for="domicilio">
		<g:message code="cliente.domicilio.label" default="Domicilio" />
		
	</label>
	<g:textArea name="domicilio" cols="40" rows="5" maxlength="200" value="${clienteInstance?.domicilio}"/>

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


