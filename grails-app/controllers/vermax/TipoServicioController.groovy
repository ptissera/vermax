package vermax



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoServicioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoServicio.list(params), model:[tipoServicioInstanceCount: TipoServicio.count()]
    }

    def show(TipoServicio tipoServicioInstance) {
        respond tipoServicioInstance
    }

    def create() {
        respond new TipoServicio(params)
    }

    @Transactional
    def save(TipoServicio tipoServicioInstance) {
        if (tipoServicioInstance == null) {
            notFound()
            return
        }

        if (tipoServicioInstance.hasErrors()) {
            respond tipoServicioInstance.errors, view:'create'
            return
        }

        tipoServicioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), tipoServicioInstance.id])
                redirect tipoServicioInstance
            }
            '*' { respond tipoServicioInstance, [status: CREATED] }
        }
    }

    def edit(TipoServicio tipoServicioInstance) {
        respond tipoServicioInstance
    }

    @Transactional
    def update(TipoServicio tipoServicioInstance) {
        if (tipoServicioInstance == null) {
            notFound()
            return
        }

        if (tipoServicioInstance.hasErrors()) {
            respond tipoServicioInstance.errors, view:'edit'
            return
        }

        tipoServicioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoServicio.label', default: 'TipoServicio'), tipoServicioInstance.id])
                redirect tipoServicioInstance
            }
            '*'{ respond tipoServicioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoServicio tipoServicioInstance) {

        if (tipoServicioInstance == null) {
            notFound()
            return
        }

        tipoServicioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoServicio.label', default: 'TipoServicio'), tipoServicioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
