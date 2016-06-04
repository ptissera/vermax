package vermax


class OrdenDeTrabajo {

	static belongsTo = [cliente: Cliente]
	List detalles = new ArrayList()
	static hasMany = [detalles: DetalleOrdenTrabajo]
	Date fechaCreacion
	Date fechaInicio
	Date fechaCompletado
	Date fechaEntrega
	Date fechaCancelado
	String observaciones
	EstadosDeLaOrden estado
	boolean pagado

	static mapping = { detalles cascade:"all-delete-orphan" }

	def getDetalllesList() {
		return LazyList.decorate(
				detalles,
				FactoryUtils.instantiateFactory(DetalleOrdenTrabajo.class))
	}

	static constraints = {
		observaciones blank: true, nullable: true, widget: 'textarea', maxSize: 200
		estado nullable:true, blank: true
		fechaCreacion nullable:true,  blank: true
		fechaInicio nullable:true,  blank: true
		fechaCompletado nullable:true,  blank: true
		fechaEntrega nullable:true,  blank: true
		fechaCancelado nullable:true,  blank: true
		pagado nullable:true,  blank: true
	}
	
	def beforeInsert = { 
		fechaCreacion = new Date() 
		pagado = false
		estado = EstadosDeLaOrden.Creado
	}
	
	def float getTotal() {
		float total = 0;
		detalles.each{
			total +=it.getTotal()
			}
		 return total
	}
	@Override String toString() {
		return "Nro: " + getId() +" - "+ getCliente()
	}
}
