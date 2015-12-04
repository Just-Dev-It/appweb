package justdevit

import com.fasterxml.jackson.annotation.*

/**
 * Created by Romain on 04/12/2015.
 */
@JsonAutoDetect(fieldVisibility=JsonAutoDetect.Visibility.ANY)
class Offers {
    String Id
    String Condition
    Boolean IsAvailable
    String ProductUrl
    Number SalePrice
    Seller	seller
}
