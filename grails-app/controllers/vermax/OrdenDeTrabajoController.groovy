package vermax



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.apache.catalina.core.ApplicationHttpRequest

@Transactional(readOnly = true)
class OrdenDeTrabajoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OrdenDeTrabajo.list(params), model:[ordenDeTrabajoInstanceCount: OrdenDeTrabajo.count()]
    }

    def show(OrdenDeTrabajo ordenDeTrabajoInstance) {
        respond ordenDeTrabajoInstance
    }

    def create() {
        respond new OrdenDeTrabajo(params)
    }

    @Transactional
    def save(OrdenDeTrabajo ordenDeTrabajoInstance) {
        if (ordenDeTrabajoInstance == null) {
            notFound()
            return
        }

        if (ordenDeTrabajoInstance.hasErrors()) {
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
