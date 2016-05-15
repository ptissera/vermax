package vermax

import java.util.Date;

class Cliente {
	static belongsTo = [barrio: Barrio]
	String nombre
	String apellido
	String dNI
	Date fechaDeNacimiento
	String calle
	int numeracion
	String piso
	String dpto
	String email
	String telefono
	String celular
	String sexo
	Date fechaDeAlta

    static constraints = {
		nombre blank: false
		apellido blank: false
		dNI blank: false, nullable: true, size: 6..10
		fechaDeNacimiento blank: false, nullable: true, format: 'dd/MM/yyyy'
		calle blank: true, nullable: true, widget: 'textarea', maxSize: 200
		numeracion blank:false,maxSize:20
		piso blank:true
		dpto blank:true
		barrio nullable:true
		email email:true, blank: true, nullable: true
		telefono blank: true, nullable: true
		celular blank: true, nullable: true
		sexo blank: false, inList: ["M", "F"]
		fechaDeAlta blank: false, nullable: true, display: false, format: 'dd/MM/yyyy'
    }
	def beforeInsert = {
		fechaDeAlta = new Date()
	}

	
		
	@Override String toString() {
		return getApellido() +", "+ getNombre()
	}
	
	
}
