<script type="text/javascript">
    var childCount = ${ordenDeTrabajoInstance?.detalles.size()} + 0;
    <g:applyCodec encodeAs="none">
   	var servicios = '${raw(vermax.TipoServicio.list().encodeAsJSON())}';
   	</g:applyCodec>
   	servicios=servicios.replace(/\"/g,'"');
   	servicios=$.parseJSON(servicios);
   	var totalOrden = ${ordenDeTrabajoInstance.getTotal()};
	
    function addDetalle(){
      var clone = $("#patron").clone().find("tr")
      var htmlId = 'detallesList['+childCount+'].';


      clone.find("input[id$=id]")
             .attr('id',htmlId + 'id')
             .attr('name',htmlId + 'id');
      
      clone.find("input[id$=deleted]")
              .attr('id',htmlId + 'deleted')
              .attr('name',htmlId + 'deleted');

       clone.find("input[id$=new]")
              .attr('id',htmlId + 'new')
              .attr('name',htmlId + 'new')
              .attr('value', 'true');

       clone.find("select[id$=cantidad]")
       .attr('id',htmlId + 'cantidad')
       .attr('name',htmlId + 'cantidad')
       .on('change',itemHasChanged);
         
       clone.find("input:checkbox[id$=secado]")
       .attr('id',htmlId + 'secado')
       .attr('name',htmlId + 'secado')
       .on('change',itemHasChanged);
       clone.find("input:checkbox[id$=secado]")[0].checked = true;
       
      clone.find("input:checkbox[id$=lavado]")
              .attr('id',htmlId + 'lavado')
              .attr('name',htmlId + 'lavado')
              .on('change',itemHasChanged);
      clone.find("input:checkbox[id$=lavado]")[0].checked = true;

      clone.find("select[id$=servicio]")
      .attr('id',htmlId + 'servicio')
      .attr('name',htmlId + 'servicio')
      .on('change',itemHasChanged);


      clone.find('.del-detalle').on('click', deleteDetalle);
      
      var serviceID = clone.find("select[id$=servicio]")[0].value;
      var servicio = getServiceSelected(serviceID);

      var total = servicio.precioLavado + servicio.precioSecado;
      clone.find(".totalDetalle").text('$ ' + total); 

      clone.attr('id', 'detalle'+childCount);
      $("#childList").append(clone);
      clone.show();
      totalOrden += total;
      $(".totalOrden").text('$ ' + totalOrden);
      childCount++;
    
    }

    function getServiceSelected(serviceID) {
    	serviceID =	parseInt(serviceID);
	  for( var i=0, len=servicios.length; i<len; i++){
		if(servicios[i].id === serviceID) {
         return servicios[i];
		}
	  }
    }

    function itemHasChanged(){
        var prnt = $(this).parents("tr");
        var itemServicioID = prnt.find(".itemServicio")[0].value;
        var itemCantidad = prnt.find(".itemCantidad")[0].value;
        var itemLavado = prnt.find(".itemLavado")[0].checked;
        var itemSecado = prnt.find(".itemSecado")[0].checked;
        var servicio = getServiceSelected(itemServicioID);

        var total = 0;
        
        if (itemLavado) {
           total = servicio.precioLavado * itemCantidad;
         }
        if (itemSecado) {
        	total += servicio.precioSecado * itemCantidad;
        }
        totalOrden -= parseInt(prnt.find(".totalDetalle").text().substring(2));
                	            
        prnt.find(".totalDetalle").text('$ ' + total); 
        totalOrden += total;
        $(".totalOrden").text('$ ' + totalOrden); 

       }

  //bind click event on delete buttons using jquery live
    function deleteDetalle(){
        //find the parent div
        var prnt = $(this).parents("tr");
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if(newValue == 'true'){
            prnt.remove();
        }else{
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }
    }

</script>

<div>
	<table>
		<thead>
			<tr>
				<th>Servicio</th>
				<th>Cantidad</th>
				<th>Lavado</th>
				<th>Secado</th>
				<th>Total</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="childList">
			<g:each var="detalle" in="${ordenDeTrabajoInstance.detalles}"
				status="i">
				<g:render template='detalle'
					model="['detalle':detalle,'i':i,'hidden':false]" />
			</g:each>
		</tbody>
		<tfoot>
		<tr>
		   <th colspan="4"></th>
		   <th><span class="totalOrden">$ ${ordenDeTrabajoInstance.getTotal()}</span></th>
		   <th></th>
		</tr>
		</tfoot>
	</table>

</div>

