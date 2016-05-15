package vermax

class DetalleOrdenTrabajo {
	static belongsTo = [servicio: TipoServicio]
	int cantidad
	boolean lavado
	boolean secado

	static constraints = {
		servicio blank:false, nullable: false
		cantidad blank:false, range: 1..10
		lavado blank:false, nullable: false
		secado blank:false, nullable: false
	}
}
