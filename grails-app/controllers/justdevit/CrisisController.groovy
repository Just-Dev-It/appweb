package justdevit


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CrisisController {


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Crisis.list(params), model: [crisisInstanceCount: Crisis.count()]
    }

    def show(Crisis crisisInstance) {
        respond crisisInstance
    }

    def create() {
        respond new Crisis(params)
    }

    @Transactional
    def save(Crisis crisisInstance) {
        if (crisisInstance == null) {
            notFound()
            return
        }

        if (crisisInstance.hasErrors()) {
            respond crisisInstance.errors, view: 'create'
            return
        }

        crisisInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'crisis.label', default: 'Crisis'), crisisInstance.id])
                redirect crisisInstance
            }
            '*' { respond crisisInstance, [status: CREATED] }
        }
    }

    def edit(Crisis crisisInstance) {
        respond crisisInstance
    }

    @Transactional
    def update(Crisis crisisInstance) {
        if (crisisInstance == null) {
            notFound()
            return
        }

        if (crisisInstance.hasErrors()) {
            respond crisisInstance.errors, view: 'edit'
            return
        }

        crisisInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Crisis.label', default: 'Crisis'), crisisInstance.id])
                redirect crisisInstance
            }
            '*' { respond crisisInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Crisis crisisInstance) {

        if (crisisInstance == null) {
            notFound()
            return
        }

        crisisInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Crisis.label', default: 'Crisis'), crisisInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'crisis.label', default: 'Crisis'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


}
