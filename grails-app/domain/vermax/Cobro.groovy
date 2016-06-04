package vermax

import java.util.Date;

class Cobro {
	
	static belongsTo = [ordenDeTrabajo:OrdenDeTrabajo]
	Date fechaHora
	Double monto
	String descripcion
	
	static constraints = {
		fechaHora blank: false
		monto blank: false
		descripcion nullable: true
	}
	
	@Override String toString() {
		if(getFechaHora()==null){
			fechaHora=new Date()
		}
		return getFechaHora().format("dd/MM/YYYY")
	}

   
}
