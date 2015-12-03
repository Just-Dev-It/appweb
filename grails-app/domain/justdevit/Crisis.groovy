package justdevit

class Crisis {
    String id
    String name
    String location
    String hashtag
    String facebook
    static hasMany = [products: Product,actuality: Actuality]

    static constraints = {
    }
}
