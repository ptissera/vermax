package vermax

class TipoServicio {
	String nombre
	Float precioLavado
	Float precioSecado

	static constraints = {
		nombre blank: false, unique: true
		precioLavado blank:false, nullable: false
		precioSecado blank:false,nullable: false
	}
}
