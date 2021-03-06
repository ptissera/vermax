<%@ page import="vermax.OrdenDeTrabajo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordenDeTrabajo.label', default: 'OrdenDeTrabajo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-ordenDeTrabajo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-ordenDeTrabajo" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${ordenDeTrabajoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${ordenDeTrabajoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:ordenDeTrabajoInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${ordenDeTrabajoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
			<table id="patron" style="display:none;">
			<g:render template="detalle" model="['servicio': 2,'i':'_clone','hidden':true, secado: true, lavado: true]" />
			</table>
			<script>
			   function bindingEvents(){
		        $(".itemServicio").each(function() {
		        	  $(this).on('change',itemHasChanged);
		        });
		        $(".itemCantidad").each(function() {
		        	  $(this).on('change',itemHasChanged);
		        });
				$(".itemLavado").each(function() {
		        	  $(this).on('change',itemHasChanged);
				});
				$(".itemSecado").each(function() {
		        	  $(this).on('change',itemHasChanged);
				});
			   }
			   bindingEvents();
			</script>
		</div>
	</body>
</html>
