
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
<body>
	<div class="content scaffold-create">
		<div class="nav" role="navigation"></div>
		<h1>Access to Site</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:form autocomplete="off" action="authenticate" method="post">
			<fieldset class="form">
				<div style="margin-top: 50px;"
					class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'userName', 'error')} required">
					<label for="userName"> <g:message
							code="usuario.userName.label" default="User" /> <span
						class="required-indicator">*</span>
					</label>
					<g:field type="text" name="userName" required=""
						value="${fieldValue(bean: userInstance, field: 'userName')}" />
				</div>
				<div style="margin-bottom: 30px;"
					class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} ">
					<label for="password"> <g:message
							code="usuario.password.label" default="password" />

					</label>
					<g:field type="password" name="password" maxlength="32"
						value="${usuarioInstance?.password}" />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="save" class="save" value="Ingresar" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
