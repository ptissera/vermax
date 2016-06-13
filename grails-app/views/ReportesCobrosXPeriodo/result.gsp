
<%@ page import="vermax.Cobro"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="tituloPage" value="Reporte cobros por mes" />
<title>
	${tituloPage}
</title>
</head>
<body>

	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="home" action="index">Regresar</g:link></li>
		</ul>
	</div>
	<div id="list-cobro" class="content scaffold-list" role="main">
		<h1>
			${tituloPage}
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list cobro">

			<li class="fieldcontain"><span class="property-label">Total
					acumulado </span> <span class="property-value"> $ ${totalAcumulado}</span></li>
			<li class="fieldcontain"><span id="perfilDeSocio-label"
				class="property-label"> Total de cobros </span> <span
				class="property-value" aria-labelledby="perfilDeSocio-label">
					${cobroInstanceCount}
			</span></li>
			<li class="fieldcontain">
				<h1>Detalle</h1>
				<table>
					<thead>
						<tr>
							<th>Fecha/Hora</th>
							<th><g:message code="cobro.monto.label" default="Monto" /></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${cobros}" status="i" var="cobroInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:formatDate format="dd/MM/yyyy    -    hh:mm "
										date="${cobroInstance?.fechaHora}" />hs</td>
								<td>$ ${fieldValue(bean: cobroInstance, field: "monto")}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
			</li>
		</ol>
	</div>
</body>
</html>
