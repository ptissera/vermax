<!DOCTYPE html>
<%@page import="vermax.OrdenDeTrabajoHelper"%>
<html>
<head>
<meta name="layout" content="main" />
<title>Lavanderia</title>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2.5em 0em 0em 1.7em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<div id="page-body" role="main">
	<g:set var="indicadores" value="${OrdenDeTrabajoHelper.getDemora()}"/>
		<table style="width: 500px; margin-left: 200px;">
			<thead>
					<tr>
						<th>Indicador</th>
						<th>Valor</th>						
					</tr>
				</thead>
				<tbody>
					<tr class="even">					
						<td>Demora aproximada actual para una nueva orden:</td>
						<td>${indicadores.diasDeEspera} dias</td>
					</tr>
					<tr class="odd">					
						<td>Lavados pendientes:</td>
						<td>${indicadores.lavadosPendientes}</td>
					</tr>
					<tr class="even">					
						<td>Secados Pendientes:</td>
						<td>${indicadores.secadosPendientes}</td>
					</tr>
					<tr class="odd">					
						<td>Capacidad de lavado diaria:</td>
						<td>${indicadores.capacidadDeLavadoDiaria}</td>
					</tr>
					<tr class="even">					
						<td>Capacidad de secado diaria:</td>
						<td>${indicadores.capacidadDeSecadoDiaria}</td>
					</tr>
				</tbody>
			</table>
	<h3>Favoritos</h3>
		<pulko:item controller="OrdenDeTrabajo" name="Orden de trabajo"
			action="index" image="icon_lavarropa.png" />
		<pulko:item controller="ReportesCobrosXPeriodo" name="Cobros por Mes"
			action="index" image="icon_cobrosxmes.png" />
		<pulko:item controller="Cobro" name="Cobro" action="index"
			image="icon_cobros.png" />
			

		

	</div>
</body>
</html>
