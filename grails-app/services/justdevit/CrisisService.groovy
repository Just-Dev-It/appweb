package justdevit

import grails.transaction.Transactional

@Transactional
class CrisisService {

    def searchCrisis(def params, Integer max = 50, Integer offset = 0) {
        String stringToSearch
        if(params.stringToSearch != null){
            stringToSearch = params.stringToSearch
            stringToSearch = stringToSearch.trim()
        }
        def criteria = Crisis.createCriteria()
        def res = criteria.list (max: max, offset: offset){
            if (stringToSearch) {
                or {
                    like 'hashtag', "%${stringToSearch}%"
                    like 'location', "%${stringToSearch}%"
                    like 'name', "%${stringToSearch}%"
                    like 'facebook', "%${stringToSearch}%"
                }
            }
        }
        res
    }
}
