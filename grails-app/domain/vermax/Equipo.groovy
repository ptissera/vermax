package vermax

class Equipo {
	String codigo
	String marca
	String modelo
	boolean esLavadora
	int duracionCiclo

    static constraints = {
		codigo blank: true, unique: false
		marca blank:true,nullable : false
		modelo nullable : true, blank: true
		esLavadora nullable :true, blank: true
		duracionCiclo  nullable : false, blank: true
    }

}
