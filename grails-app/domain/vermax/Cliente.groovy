package vermax

import java.util.Date;

class Cliente {
	String nombre
	String apellido
	String dNI
	Date fechaDeNacimiento
	String domicilio
	String email
	String telefono
	String celular
	String sexo
	Date fechaDeAlta

    static constraints = {
		nombre blank: false
		apellido blank: false
		dNI blank: true, nullable: true, size: 6..10
		fechaDeNacimiento blank: false, nullable: true, format: 'dd/MM/yyyy'
		domicilio blank: true, nullable: true, widget: 'textarea', maxSize: 200
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
