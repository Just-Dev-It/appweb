package justdevit

import com.fasterxml.jackson.annotation.*

/**
 * Created by Romain on 04/12/2015.
 */
@JsonAutoDetect(fieldVisibility=JsonAutoDetect.Visibility.ANY)
class SearchProduct {
    String Id
    String Name
    String Description
    String Ean
    String Brand
    String MainImageUrl
    Number Rating
    int OffersCount
    List<Image> images
    List<Offers> offers
}
