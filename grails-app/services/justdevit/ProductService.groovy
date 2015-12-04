package justdevit

import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.JSONElement

import com.fasterxml.jackson.databind.*
import com.fasterxml.jackson.annotation.*

@Transactional
class ProductService {

    def mapper = new ObjectMapper()

    def searchProduct(String keyword, int minPrice, int maxPrice) {
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
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
        return mapper.readValue( res.text, SearchResult.class )
    }

}
