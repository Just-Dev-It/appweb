package justdevit

import com.fasterxml.jackson.annotation.*

/**
 * Created by Romain on 04/12/2015.
 */
@JsonAutoDetect(fieldVisibility=JsonAutoDetect.Visibility.ANY)
class Seller {
    int id
    String name
}
