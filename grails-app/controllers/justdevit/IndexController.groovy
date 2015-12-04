package justdevit

class IndexController {

    CrisisService crisisService
    int nbItemByPage = 5

    def index() {}

    def doSearchCrisis() {
        def offsetTmp = params.int('offset') ?: 0
        params.max =nbItemByPage
        def crisisList = crisisService.searchCrisis(params, nbItemByPage, offsetTmp)
        render(view: 'index', model: [crisisInstanceList: crisisList, crisisInstanceCount: crisisList.size(), itemsCount: crisisList.getTotalCount()])
    }
}
