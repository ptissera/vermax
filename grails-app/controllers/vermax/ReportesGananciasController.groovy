package vermax
import groovy.time.TimeCategory

class ReportesGananciasController {


	def index() { }
	
	def result(){
		def fromDate = params.fecha - 1
		def toDate

		use(TimeCategory) {
			toDate = params.fecha + 1.month
		}

		def cobros = Cobro.findAll {
			(fechaHora > fromDate) && (fechaHora < toDate)
		}

		def egresos = Egreso.findAll {
			(fecha > fromDate) && (fecha < toDate)
		}

		Double totalIngresos=cobros.sum{ it.monto }
		Double totalEgresos=egresos.sum{ it.monto }
		
		if(totalIngresos==null){
			totalIngresos = 0
		}
		
		if(totalEgresos==null){
			totalEgresos = 0
		}
		
		def movimientos = []
	
		egresos.each{ mov ->
			movimientos << [fecha:mov.fecha, detalle: mov.rubro.nombre, , egreso: (-1 * mov.monto), ingreso:0]
		}
		cobros.each{ mov ->
			movimientos << [fecha:mov.fechaHora, detalle: mov.id, , egreso: 0, ingreso:mov.monto]
		}
		movimientos.sort{fecha:it.fecha}

		Double saldo = 0
		movimientos.each {
			saldo += it.ingreso +it.egreso
			it.saldo = saldo
		}

		[fecha: params.fecha, ingresos: totalIngresos, egresos:totalEgresos,saldo:saldo, movimientos:movimientos]
	}
}
