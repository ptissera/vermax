package vermax

import java.util.Date;

class Cobro {
	
	static belongsTo = [ordenDeTrabajo:OrdenDeTrabajo]
	Date fechaHora
	Double monto
	
	static constraints = {
		fechaHora blank: true, nullable: true
		monto blank: false
	}
	
	def beforeInsert = {
		fechaHora = new Date()
	}

   
}
