
<%@ page import="vermax.Cobro"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<title>Reporte de Ganancias</title>
</head>
<body>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		</ul>
	</div>
	<div id="list-cobro" class="content scaffold-list" role="main">
	
		<h1>
			Reporte Ganancias
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:form url="[action:'result']">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'cobro', 'error')} required">
					<label for="cobro"> Seleccione un periodo
					</label>
					<g:datePicker name="fecha" format="MM/yyyy" precision="month"  value="${new Date()}" default="none" noSelection="['': '']" />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton value="Generar" name="generar" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
