package justdevit

import grails.transaction.Transactional

@Transactional
class DatasetService {

    Crisis crise1, crise2

    Product product1, product2

    Actuality actuality1, actuality2

    def data() {
        product1 = new Product(name: "Produit1", salePrice: 200).save()
        product2 = new Product(name: "Produit2", salePrice: 300).save()
        actuality1 = new Actuality(dateActuality: new Date(), textActuality: "coucou").save()
        actuality2 = new Actuality(dateActuality: new Date(), textActuality: "coucou 2").save()
        crise1 = new Crisis(name: "crise1", location: "Toulouse", hashtag: "#nuitInfo", facebook: "http://truc.com", products: Arrays.asList(product1, product2), actuality: Arrays.asList(actuality1, actuality2)).save()
        crise2 = new Crisis(name: "crise2", location: "Toulouse", hashtag: "#nuitInfo", facebook: "http://truc.com").save()
    }
}
