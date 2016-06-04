
<%@ page import="vermax.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cliente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cliente">
			
				<g:if test="${clienteInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="cliente.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${clienteInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="cliente.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${clienteInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.dNI}">
				<li class="fieldcontain">
					<span id="dNI-label" class="property-label"><g:message code="cliente.dNI.label" default="D NI" /></span>
					
						<span class="property-value" aria-labelledby="dNI-label"><g:fieldValue bean="${clienteInstance}" field="dNI"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.fechaDeNacimiento}">
				<li class="fieldcontain">
					<span id="fechaDeNacimiento-label" class="property-label"><g:message code="cliente.fechaDeNacimiento.label" default="Fecha De Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaDeNacimiento-label"><g:formatDate format="dd/MM/yyyy" date="${clienteInstance?.fechaDeNacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="cliente.calle.label" default="Calle" /></span>
					
						<span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${clienteInstance}" field="calle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.numeracion}">
				<li class="fieldcontain">
					<span id="numeracion-label" class="property-label"><g:message code="cliente.numeracion.label" default="Numeracion" /></span>
					
						<span class="property-value" aria-labelledby="numeracion-label"><g:fieldValue bean="${clienteInstance}" field="numeracion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.piso}">
				<li class="fieldcontain">
					<span id="piso-label" class="property-label"><g:message code="cliente.piso.label" default="Piso" /></span>
					
						<span class="property-value" aria-labelledby="piso-label"><g:fieldValue bean="${clienteInstance}" field="piso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.dpto}">
				<li class="fieldcontain">
					<span id="dpto-label" class="property-label"><g:message code="cliente.dpto.label" default="Dpto" /></span>
					
						<span class="property-value" aria-labelledby="dpto-label"><g:fieldValue bean="${clienteInstance}" field="dpto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.barrio}">
				<li class="fieldcontain">
					<span id="barrio-label" class="property-label"><g:message code="cliente.barrio.label" default="Barrio" /></span>
					
						<span class="property-value" aria-labelledby="barrio-label">${clienteInstance?.barrio?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="cliente.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clienteInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="cliente.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${clienteInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.celular}">
				<li class="fieldcontain">
					<span id="celular-label" class="property-label"><g:message code="cliente.celular.label" default="Celular" /></span>
					
						<span class="property-value" aria-labelledby="celular-label"><g:fieldValue bean="${clienteInstance}" field="celular"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="cliente.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${clienteInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:clienteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${clienteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
