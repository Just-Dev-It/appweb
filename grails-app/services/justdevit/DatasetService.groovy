package justdevit

import grails.transaction.Transactional

@Transactional
class DatasetService {

    Crisis crise1, crise2

    def data() {
        crise1 = new Crisis(name: "crise1", location: "Toulouse", hashtag: "#nuitInfo", facebook: "http://truc.com").save()
        crise2 = new Crisis(name: "crise2", location: "Toulouse", hashtag: "#nuitInfo", facebook: "http://truc.com").save()
    }
}
