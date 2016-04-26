package vermax

class Rol {
	
	String nombre
	String descripcion
	
	static hasMany = [usuarios: Usuario]

	static constraints = {
		nombre blank: false, unique: true
		descripcion blank: false, maxSize: 50
	}
   
	@Override String toString() {
		return getDescripcion()
	}

}
