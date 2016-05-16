<div id="detalle${i}" class="detalle-div"
	<g:if test="${hidden}">style="display:none;"</g:if>>
	<g:hiddenField name='detallesList[${i}].id' value='${detalle?.id}' />
	<g:hiddenField name='detallesList[${i}].deleted' value='false' />
	<g:hiddenField name='detallesList[${i}].new' value="${detalle?.id == null?'true':'false'}" />

	<g:message code="detalleOrdenTrabajo.cantidad.label" default="Cantidad" />
	<g:select name="detallesList[${i}].cantidad"  id="detallesList[${i}].cantidad" from="${1..10}" class="range"
		value="${detalleOrdenTrabajoInstance?.cantidad}" />

	<g:select name="detallesList[${i}].servicio"  id="detallesList[${i}].servicio"
		from="${vermax.TipoServicio.list()}" optionKey="id"
		optionValue="nombre" value="${detalle?.servicio?.id}" />


	<g:message code="detalleOrdenTrabajo.lavado.label" default="Lavado" />
	<g:checkBox name="detallesList[${i}].lavado" id="detallesList[${i}].lavado"
		value="${detalleOrdenTrabajoInstance?.lavado}"/>

	<g:message code="detalleOrdenTrabajo.secado.label" default="Secado" />
	<g:checkBox name="detallesList[${i}].secado" id="detallesList[${i}].secado"
		value="${detalleOrdenTrabajoInstance?.secado}"/>

	<span class="del-detalle"> <img
		src="${resource(dir:'images/skin', file:'icon_delete.png')}"
		style="vertical-align: middle;" />
	</span>
</div>