package vermax



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.apache.catalina.core.ApplicationHttpRequest

@Transactional(readOnly = true)
class OrdenDeTrabajoController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		def selector = []
		
		if (params.ordenesIniciadas == 'on') {
			selector << EstadosDeLaOrden.Iniciado
			flash.ordenesIniciadas = true
		} 
		if (params.ordenesCreadas == 'on') {
			selector << EstadosDeLaOrden.Creado
			flash.ordenesCreadas = true
		}
		if (params.ordenesCompletado == 'on') {
			selector << EstadosDeLaOrden.Completo
			flash.ordenesCompletado = true
		}
		if (params.ordenesEntregado == 'on') {
			selector << EstadosDeLaOrden.Entregado
			flash.ordenesEntregado = true
		}
		if (params.ordenesCancelado == 'on') {
			selector << EstadosDeLaOrden.Cancelado
			flash.ordenesCancelado = true
		}
		def result
		if (selector.size() == 1) {
			result = OrdenDeTrabajo.findAllByEstado(selector[0])
		} else if (selector.size() == 2) {
			result = OrdenDeTrabajo.findAllByEstadoOrEstado(selector[0], selector[1])
		} else if (selector.size() == 3) {
			result = OrdenDeTrabajo.findAllByEstadoOrEstado(selector[0], selector[1], selector[2])
		} else if (selector.size() == 4) {
			result = OrdenDeTrabajo.findAllByEstadoOrEstado(selector[0], selector[1], selector[2], selector[3])
		} else if (selector.size() == 5) {
			result = OrdenDeTrabajo.findAllByEstadoOrEstado(selector[0], selector[1], selector[2], selector[3], selector[4])
		} else {
			result = OrdenDeTrabajo.list()
			flash.ordenesIniciadas = true
			flash.ordenesCreadas = true
			flash.ordenesCompletado = true
			flash.ordenesEntregado = true
			flash.ordenesCancelado = true
		} 
		
        respond result
}	
	
	
	def show(OrdenDeTrabajo ordenDeTrabajoInstance) {
		respond ordenDeTrabajoInstance
	}

	def create() {
					flash.demora = (OrdenDeTrabajoHelper.getDemora()).diasDeEspera
		respond new OrdenDeTrabajo(params)
	}

	@Transactional
	def save(OrdenDeTrabajo ordenDeTrabajoInstance) {
		if (ordenDeTrabajoInstance == null) {
			notFound()
			return
		}

		if (ordenDeTrabajoInstance.hasErrors()) {
			flash.demora = (OrdenDeTrabajoHelper.getDemora()).diasDeEspera
			respond ordenDeTrabajoInstance.errors, view:'create'
			return
		}

		for (int i=0; i < 100; i++){
			def detalles = params.get("detallesList["+i+"]")
			if (detalles != null){
				def detalle = new DetalleOrdenTrabajo(
						cantidad: detalles.cantidad,
						servicio: detalles.servicio,
						secado: detalles.secado == "on",
						lavado: detalles.lavado == "on")
				if (detalle.hasErrors()) {
					flash.errors = detalle.errors
					respond ordenDeTrabajoInstance.errors, view:'create'
					return
				}
				ordenDeTrabajoInstance.detalles.add(detalle

						)
			} else {
				break
			}
		}

		// find the phones that are marked for deletion
		def _toBeDeleted = ordenDeTrabajoInstance.detalles.findAll {(it?.deleted || (it == null))}
		// if there are phones to be deleted remove them all
		if (_toBeDeleted) {
			ordenDeTrabajoInstance.detalles.removeAll(_toBeDeleted)
		}

		//update my indexes
		ordenDeTrabajoInstance.detalles.eachWithIndex(){det, i ->
			det.index = i
		}

		ordenDeTrabajoInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'ordenDeTrabajo.label', default: 'OrdenDeTrabajo'), ordenDeTrabajoInstance.id])
				redirect ordenDeTrabajoInstance
			}
			'*' { respond ordenDeTrabajoInstance, [status: CREATED] }
		}
	}

	def edit(OrdenDeTrabajo ordenDeTrabajoInstance) {
		respond ordenDeTrabajoInstance
	}

	@Transactional
	def iniciarLavado(OrdenDeTrabajo ordenDeTrabajoInstance) {
		if ( ordenDeTrabajoInstance.estado != EstadosDeLaOrden.Iniciado) {
			ordenDeTrabajoInstance.estado = EstadosDeLaOrden.Iniciado
			ordenDeTrabajoInstance.fechaInicio = new Date()
			ordenDeTrabajoInstance.save flush:true
		}
		respond ordenDeTrabajoInstance, view:'show'
	}

	@Transactional
	def completarLavado(OrdenDeTrabajo ordenDeTrabajoInstance) {
		if ( ordenDeTrabajoInstance.estado != EstadosDeLaOrden.Completo) {
			ordenDeTrabajoInstance.estado = EstadosDeLaOrden.Completo
			ordenDeTrabajoInstance.fechaCompletado = new Date()
			ordenDeTrabajoInstance.save flush:true
		}
		respond ordenDeTrabajoInstance, view:'show'
	}

	@Transactional
	def entregarLavado(OrdenDeTrabajo ordenDeTrabajoInstance) {
		if ( ordenDeTrabajoInstance.estado != EstadosDeLaOrden.Entregado) {
			ordenDeTrabajoInstance.estado = EstadosDeLaOrden.Entregado
			ordenDeTrabajoInstance.fechaEntrega = new Date()
			ordenDeTrabajoInstance.save flush:true
		}
		respond ordenDeTrabajoInstance, view:'show'
	}

	@Transactional
	def cancelarLavado(OrdenDeTrabajo ordenDeTrabajoInstance) {
		if ( ordenDeTrabajoInstance.estado != EstadosDeLaOrden.Cancelado) {
			ordenDeTrabajoInstance.estado = EstadosDeLaOrden.Cancelado
			ordenDeTrabajoInstance.fechaCancelado = new Date()
			ordenDeTrabajoInstance.save flush:true
		}
		respond ordenDeTrabajoInstance, view:'show'
	}
	
	@Transactional
	def cobrarOrden(OrdenDeTrabajo ordenDeTrabajoInstance) {
		session.setAttribute("ordenSeleccionada", ordenDeTrabajoInstance)
		redirect controller: 'cobro', action:'create'
	}


	@Transactional
	def update(OrdenDeTrabajo ordenDeTrabajoInstance) {
		if (ordenDeTrabajoInstance == null) {
			notFound()
			return
		}

		if (ordenDeTrabajoInstance.hasErrors()) {
			respond ordenDeTrabajoInstance.errors, view:'edit'
			return
		}

		ordenDeTrabajoInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'OrdenDeTrabajo.label', default: 'OrdenDeTrabajo'), ordenDeTrabajoInstance.id])
				redirect ordenDeTrabajoInstance
			}
			'*'{ respond ordenDeTrabajoInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(OrdenDeTrabajo ordenDeTrabajoInstance) {

		if (ordenDeTrabajoInstance == null) {
			notFound()
			return
		}

		ordenDeTrabajoInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'OrdenDeTrabajo.label', default: 'OrdenDeTrabajo'), ordenDeTrabajoInstance.id])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenDeTrabajo.label', default: 'OrdenDeTrabajo'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
