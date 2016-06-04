package vermax



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CobroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cobro.list(params), model:[cobroInstanceCount: Cobro.count()]
    }

    def show(Cobro cobroInstance) {
        respond cobroInstance
    }

    def create() {
		Cobro cobro = new Cobro(params)
		cobro.fechaHora = new Date()
		cobro.ordenDeTrabajo = session.getAttribute("ordenSeleccionada")
		cobro.ordenDeTrabajo = OrdenDeTrabajo.findById(cobro.ordenDeTrabajo.id)
		cobro.monto = cobro.ordenDeTrabajo.getTotal()
        respond cobro
    }

    @Transactional
    def save(Cobro cobroInstance) {
        if (cobroInstance == null) {
            notFound()
            return
        }

        if (cobroInstance.hasErrors()) {
            respond cobroInstance.errors, view:'create'
            return
        }

        cobroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cobro.label', default: 'Cobro'), cobroInstance.id])
                redirect cobroInstance
            }
            '*' { respond cobroInstance, [status: CREATED] }
        }
    }

    def edit(Cobro cobroInstance) {
        respond cobroInstance
    }

    @Transactional
    def update(Cobro cobroInstance) {
        if (cobroInstance == null) {
            notFound()
            return
        }

        if (cobroInstance.hasErrors()) {
            respond cobroInstance.errors, view:'edit'
            return
        }

        cobroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cobro.label', default: 'Cobro'), cobroInstance.id])
                redirect cobroInstance
            }
            '*'{ respond cobroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cobro cobroInstance) {

        if (cobroInstance == null) {
            notFound()
            return
        }

        cobroInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cobro.label', default: 'Cobro'), cobroInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cobro.label', default: 'Cobro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
