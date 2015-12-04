package justdevit



import spock.lang.*

/**
 *
 */
class ProductServiceSpec extends Specification {

    ProductService productService

    void "test search"() {
        given:
            def keyword = "voiture"
            def minPrice = 12
            def maxPrice = 50
            def res = productService.searchProduct(keyword, minPrice, maxPrice)
        expect:
            assert res.Products.size() > 0
    }
}
