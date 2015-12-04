package justdevit

import com.fasterxml.jackson.annotation.*

/**
 * Created by Romain on 04/12/2015.
 */
@JsonAutoDetect(fieldVisibility=JsonAutoDetect.Visibility.ANY)
class SearchResult {

    String ErrorMessage
    int itemCount
    int pageTotal
    int pageNumber
    List<SearchProduct> Products

}
