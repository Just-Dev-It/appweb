package justdevit

import grails.transaction.Transactional

@Transactional
class UserService {

    User getUserLoggingIn(String username, String password){
        if(username != null && password != null ) {
            username = username.trim()
            password = password.trim()
        }
        return User.findByUsernameAndPassword(username,password)
    }
}
