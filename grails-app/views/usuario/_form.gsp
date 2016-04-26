<%@ page import="vermax.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="usuario.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${usuarioInstance?.userName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${usuarioInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="usuario.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${usuarioInstance?.apellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'rol', 'error')} required">
	<label for="rol">
		<g:message code="usuario.rol.label" default="Rol" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rol" name="rol.id" from="${vermax.Rol.list()}" optionKey="id" required="" value="${usuarioInstance?.rol?.id}" class="many-to-one"/>

</div>

