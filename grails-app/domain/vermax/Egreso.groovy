package vermax

class Egreso {
	static belongsTo = [rubro: Rubro, responsable: Usuario]
	String descripcion
	String proveedor
	Double monto
	Date fecha
	String nroComprobante
    
	static constraints = {
		descripcion blank: true, unique: false
		proveedor blank: true, nullable:true
		monto blank:false, nullable:true
		fecha nullable:true,  blank: true
		nroComprobante blank: true
		
    }
}
