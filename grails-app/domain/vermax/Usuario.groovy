package vermax

import java.util.Date;

class Usuario {
	static belongsTo = [rol: Rol]
	static fetchMode = [rol:"eager"]

	String userName
	String password
	String nombre
	String apellido
	Date fechaDeAlta
	Date fechaDeModificacion
	Boolean deleted

	static constraints = {
		userName blank: false, unique: true
		password blank: false, password: true
		nombre blank: false
		apellido blank: false
		fechaDeAlta blank: false, nullable: true, display: false, format: 'dd/MM/yyyy'
		fechaDeModificacion blank: false, nullable: true, display: false, format: 'dd/MM/yyyy'
		deleted black: true, nullable: true, display: false
		
	}

	

	def beforeInsert = {
		deleted = false
		fechaDeAlta = new Date()
	}

	def beforeUpdate = { fechaDeModificacion = new Date() }
		
	@Override String toString() {
		return getApellido() +", "+ getNombre()
	}
}
