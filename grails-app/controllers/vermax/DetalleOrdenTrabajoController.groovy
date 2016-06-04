package vermax



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DetalleOrdenTrabajoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DetalleOrdenTrabajo.list(params), model:[detalleOrdenTrabajoInstanceCount: DetalleOrdenTrabajo.count()]
    }

    def show(DetalleOrdenTrabajo detalleOrdenTrabajoInstance) {
        respond detalleOrdenTrabajoInstance
    }

    def create() {
        respond new DetalleOrdenTrabajo(params)
    }

    @Transactional
    def save(DetalleOrdenTrabajo detalleOrdenTrabajoInstance) {
        if (detalleOrdenTrabajoInstance == null) {
            notFound()
            return
        }

        if (detalleOrdenTrabajoInstance.hasErrors()) {
            respond detalleOrdenTrabajoInstance.errors, view:'create'
            return
        }

        detalleOrdenTrabajoInstance.save flush:true
		flash.message = message(code: 'default.created.message', args: [message(code: 'detalleOrdenTrabajo.label', default: 'DetalleOrdenTrabajo'), detalleOrdenTrabajoInstance.id])
		
		def ordenDeTrabajoInstance = request.session.getAttribute("currentOrden")
		if (ordenDeTrabajoInstance == null){
			println "es muy trola"
		} else {
		ordenDeTrabajoInstance.addDetalle(detalleOrdenTrabajoInstance)
		request.session.setAttribute("currentOrden", ordenDeTrabajoInstance)
		}
		redirect  controller: "ordenDeTrabajo", action: "addedDetalle", method: "POST"
    }

    def edit(DetalleOrdenTrabajo detalleOrdenTrabajoInstance) {
        respond detalleOrdenTrabajoInstance
    }

    @Transactional
    def update(DetalleOrdenTrabajo detalleOrdenTrabajoInstance) {
        if (detalleOrdenTrabajoInstance == null) {
            notFound()
            return
        }

        if (detalleOrdenTrabajoInstance.hasErrors()) {
            respond detalleOrdenTrabajoInstance.errors, view:'edit'
            return
        }

        detalleOrdenTrabajoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DetalleOrdenTrabajo.label', default: 'DetalleOrdenTrabajo'), detalleOrdenTrabajoInstance.id])
                redirect detalleOrdenTrabajoInstance
            }
            '*'{ respond detalleOrdenTrabajoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DetalleOrdenTrabajo detalleOrdenTrabajoInstance) {

        if (detalleOrdenTrabajoInstance == null) {
            notFound()
            return
        }

        detalleOrdenTrabajoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DetalleOrdenTrabajo.label', default: 'DetalleOrdenTrabajo'), detalleOrdenTrabajoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleOrdenTrabajo.label', default: 'DetalleOrdenTrabajo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
