package vermax



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

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
	
	def addedDetalle(OrdenDeTrabajo ordenDeTrabajoInstance) {
		ordenDeTrabajoInstance = request.session.getAttribute("currentOrden")
		respond ordenDeTrabajoInstance, view:'create'
		return
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
	
	def addDetalle() {
		def ordenDeTrabajoInstance = request.session.getAttribute("currentOrden")
		if (ordenDeTrabajoInstance == null){
			ordenDeTrabajoInstance=new OrdenDeTrabajo(params)
		}
        request.session.setAttribute("currentOrden", ordenDeTrabajoInstance)
		redirect  controller: "detalleOrdenTrabajo", action: "create", method: "POST"
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
