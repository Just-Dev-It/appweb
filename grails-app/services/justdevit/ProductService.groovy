package justdevit

import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.JSONElement

@Transactional
class ProductService {

    def searchProduct(String keyword, int minPrice, int maxPrice) {
        def rest = new RestBuilder()
        def res = rest.post('https://api.cdiscount.com/OpenApi/json/Search') {
            json '{' +
                    '  "ApiKey": "ff989475-6264-4289-afc4-0d39d7f62e32",' +
                    '  "SearchRequest": {' +
                    '    "Keyword": "' + keyword + '",' +
                    '    "SortBy": "relevance",' +
                    '    "Pagination": {' +
                    '      "ItemsPerPage": 5,' +
                    '      "PageNumber": 0' +
                    '    },' +
                    '    "Filters": {' +
                    '      "Price": {' +
                    '        "Min": ' + minPrice + ',' +
                    '        "Max": ' + maxPrice + '' +
                    '      },' +
                    '      "Navigation": "all",' +
                    '      "IncludeMarketPlace": false,' +
                    '      "Brands": [],' +
                    '      "Condition": "new"' +
                    '    }' +
                    '  }' +
                    '}'
        }

    }

}
