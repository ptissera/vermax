package vermax

class DetalleOrdenTrabajo {
	static belongsTo = [servicio: TipoServicio]
	int index
	int cantidad
	boolean lavado
	boolean secado
	boolean deleted
	static transients = ['deleted']

	static mapping = { index column:"detalle_index" }

	static constraints = {
		servicio blank:false, nullable: false
		cantidad blank:false, range: 1..10
		lavado blank:false, nullable: false
		secado blank:false, nullable: false
	}

	def String toString() {
		return "${index}) ${cantidad}- ${servicio.nombre}" + (lavado?" - lavado":"") + (secado ?" - secado ":"")
	}
	
	def float getTotal() {
		float total = 0;
		
		 if(lavado){
			 total = cantidad * servicio.precioLavado
		 }
		 
		 if(secado){
			 total += cantidad * servicio.precioSecado
		 }
		 return total
	}
}
