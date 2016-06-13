package vermax



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EgresoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Egreso.list(params), model:[egresoInstanceCount: Egreso.count()]
    }

    def show(Egreso egresoInstance) {
        respond egresoInstance
    }

    def create() {
        respond new Egreso(params)
    }

    @Transactional
    def save(Egreso egresoInstance) {
        if (egresoInstance == null) {
            notFound()
            return
        }

        if (egresoInstance.hasErrors()) {
            respond egresoInstance.errors, view:'create'
            return
        }

        egresoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'egreso.label', default: 'Egreso'), egresoInstance.id])
                redirect egresoInstance
            }
            '*' { respond egresoInstance, [status: CREATED] }
        }
    }

    def edit(Egreso egresoInstance) {
        respond egresoInstance
    }

    @Transactional
    def update(Egreso egresoInstance) {
        if (egresoInstance == null) {
            notFound()
            return
        }

        if (egresoInstance.hasErrors()) {
            respond egresoInstance.errors, view:'edit'
            return
        }

        egresoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Egreso.label', default: 'Egreso'), egresoInstance.id])
                redirect egresoInstance
            }
            '*'{ respond egresoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Egreso egresoInstance) {

        if (egresoInstance == null) {
            notFound()
            return
        }

        egresoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Egreso.label', default: 'Egreso'), egresoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'egreso.label', default: 'Egreso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
