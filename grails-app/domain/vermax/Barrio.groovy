package vermax

class Barrio {
	String nombre

    static constraints = {
		nombre blank:false, nullable:false
    }
	
	@Override String toString() {
		return  getNombre()
	}
}
