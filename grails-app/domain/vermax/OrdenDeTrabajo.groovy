package vermax


class OrdenDeTrabajo {

	static belongsTo = [cliente: Cliente]
	List detalles = new ArrayList()
	static hasMany = [detalles: DetalleOrdenTrabajo]
	Date fechaInicio
	String observaciones
	String estado

	static mapping = { detalles cascade:"all-delete-orphan" }

	def getDetalllesList() {
		return LazyList.decorate(
				detalles,
				FactoryUtils.instantiateFactory(DetalleOrdenTrabajo.class))
	}

	static constraints = {
		observaciones blank: true, nullable: true, widget: 'textarea', maxSize: 200
		estado nullable:true, blank: true
		fechaInicio nullable:true,  blank: true
	}
	def beforeInsert = { fechaInicio = new Date() }
	
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
