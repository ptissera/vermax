<tr class="detalle-div"
	id="detalle_${i}">

	<td><g:select name="detallesList[${i}].servicio"
			id="detallesList[${i}].servicio" from="${vermax.TipoServicio.list()}"
			optionKey="id" optionValue="nombre" value="${detalle?.servicio?.id}" class="itemServicio"/></td>

	<td><g:select name="detallesList[${i}].cantidad"
			id="detallesList[${i}].cantidad" from="${1..10}" class="range"
			value="${detalle?.cantidad}" class="itemCantidad"/>
			</td>

	<td><g:checkBox name="detallesList[${i}].lavado"
			id="detallesList[${i}].lavado" value="${detalle?.lavado}"  class="itemLavado"/></td>

	<td><g:checkBox name="detallesList[${i}].secado"
			id="detallesList[${i}].secado" value="${detalle?.secado}"  class="itemSecado"/></td>

    <td><span class="totalDetalle">$ ${detalle?.getTotal()}</span></td>
	<td>
       <g:hiddenField name='detallesList[${i}].id' value='${detalle?.id}' />
       <g:hiddenField name='detallesList[${i}].deleted' value='false' /> 
	   <g:hiddenField name='detallesList[${i}].new' value="${detalle?.id == null?'true':'false'}" /> 
	   <span> 
		  <img src="${resource(dir:'images/skin', file:'icon_delete.png')}"
		style="vertical-align: middle;" class="del-detalle"/>
	   </span>
	</td>
</tr>
