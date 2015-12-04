package justdevit


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CrisisController {

    ProductService productService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    CrisisService crisisService
    int nbItemByPage = 5

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Crisis.list(params), model: [crisisInstanceCount: Crisis.count()]
    }

    def doSearchCrisis() {
        def offsetTmp = params.int('offset') ?: 0
        params.max = nbItemByPage
        def crisisList = crisisService.searchCrisis(params, nbItemByPage, offsetTmp)
        render(view: 'index', model: [crisisInstanceList: crisisList, crisisInstanceCount: crisisList.size(), itemsCount: crisisList.getTotalCount()])
    }

    def show(Crisis crisisInstance) {
        def products = crisisInstance.products.asList()
        def actualities = crisisInstance.actuality.asList()
        render(view: 'show', model: [crisisInstance: crisisInstance, products: products, actualities: actualities])
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
