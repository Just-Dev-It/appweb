package justdevit

class Crisis {

    String name
    String location
    String hashtag
    String facebook
    static hasMany = [products: Product, actuality: Actuality]

    static constraints = {
    }
}
