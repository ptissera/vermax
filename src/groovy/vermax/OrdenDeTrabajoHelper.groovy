package vermax

class OrdenDeTrabajoHelper {
	
	def static getDemora() {
		def ordenesPendientes = OrdenDeTrabajo.findAllByEstadoOrEstado(EstadosDeLaOrden.Iniciado, EstadosDeLaOrden.Creado)
		def equipos = Equipo.list()
		Double tiempoDeLavadoDiario = 0
		Double tiempoDeSecadoDiario = 0
		Double tiempoDeCargaLavadora = 5
		Double tiempoDeCargaSecadora = 8
		Double cantidadLavadoras = 0
		Double cantidadSecadoras = 0
		equipos.each {
			if (it.esLavadora) {
				tiempoDeLavadoDiario += it.duracionCiclo + tiempoDeCargaLavadora
				cantidadLavadoras++
			} else {
				tiempoDeSecadoDiario += it.duracionCiclo + tiempoDeCargaSecadora
				cantidadSecadoras++
			}
		}
		Double avgTimebyLavado = tiempoDeLavadoDiario / cantidadLavadoras
		Double avgTimebySecado = tiempoDeSecadoDiario / cantidadSecadoras
		
		Double lavadosPendientes = 0
		Double secadosPendientes = 0
		ordenesPendientes.each { ordenes ->
			ordenes.detalles.each { det ->
				if (det.lavado) {
					lavadosPendientes+=det.cantidad
				}	
				if (det.secado) {
					secadosPendientes+=det.cantidad
				}
			}
		}
		Double minutosLavadoPendiente = avgTimebyLavado * lavadosPendientes
		Double minutosSecadoPendiente = avgTimebySecado * secadosPendientes
		
		Double capacidadDeLavadoDiaria = ((8 * 60) / avgTimebyLavado) * cantidadLavadoras
		Double capacidadDeSecadoDiaria = ((8 * 60) / avgTimebySecado) * cantidadSecadoras
		Double diasDeEsperaLavado = lavadosPendientes / capacidadDeLavadoDiaria
		Double diasDeEsperaSecado = secadosPendientes / capacidadDeSecadoDiaria
		Double diasDeEspera = diasDeEsperaLavado > diasDeEsperaSecado ? diasDeEsperaLavado : diasDeEsperaSecado
		if (diasDeEspera % 2 != 0) {
			diasDeEspera++
		}
		return [diasDeEspera: (int)diasDeEspera, capacidadDeLavadoDiaria: (int)capacidadDeLavadoDiaria, capacidadDeSecadoDiaria: (int)capacidadDeSecadoDiaria, lavadosPendientes: (int)lavadosPendientes, secadosPendientes: (int)secadosPendientes]
		
	}

}
