<script type="text/javascript">
    var childCount = ${ordenDeTrabajoInstance?.detalles.size()} + 0;

    function addDetalle(){
      var clone = $("#detalle_clone").clone()
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
       .attr('name',htmlId + 'cantidad');
       
       clone.find("input:checkbox[id$=secado]")
       .attr('id',htmlId + 'secado')
       .attr('name',htmlId + 'secado');
       
      clone.find("input:checkbox[id$=lavado]")
              .attr('id',htmlId + 'lavado')
              .attr('name',htmlId + 'lavado');

      clone.find("select[id$=servicio]")
      .attr('id',htmlId + 'servicio')
      .attr('name',htmlId + 'servicio');

      clone.attr('id', 'detalle'+childCount);
      $("#childList").append(clone);
      clone.show();
      childCount++;
    }

    //bind click event on delete buttons using jquery live
    $('.del-detalle').on('click', function() {
        //find the parent div
        var prnt = $(this).parents(".detalle-div");
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
    });

</script>

<div id="childList">
    <g:each var="detalle" in="${ordenDeTrabajoInstance.detalles}" status="i">
        <g:render template='detalle' model="['detalle':detalle,'i':i,'hidden':false]"/>
    </g:each>
</div>
<input type="button" value="Add Detalle" onclick="addDetalle();" />
