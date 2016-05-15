package vermax

class OrdenDeTrabajo {

	static belongsTo = [cliente: Cliente]
	static hasMany = [detalle: DetalleOrdenTrabajo]
	Date fechaInicio
	String observaciones
	String estado

	static constraints = {
		observaciones blank: true, nullable: true, widget: 'textarea', maxSize: 200
		estado nullable:true
		estado blank: true
	}
	def beforeInsert = {
		fechaInicio = new Date()
	}
}
