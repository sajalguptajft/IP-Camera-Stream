package viewchildvideo

import enums.UserRoleType
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

class HomeController {

    SpringSecurityService springSecurityService

    @Secured("permitAll")
    def index() {
        render view: 'login'
    }

    @Secured(["ROLE_ADMIN", "ROLE_MEMBER"])
    def dashboard() {
        User currentUser = springSecurityService.currentUser
        User childOf
        Long parentId = params.parentId as Long
        if (parentId) {
            if (checkIfParent(currentUser, parentId)) {
                childOf = User.findById(parentId)
            } else {
                render text: "Access Denied!"
                return
            }
        } else {
            childOf = currentUser
        }
        List<User> children = UserChild.findAllByParent(childOf).child
        render view: 'dashboard', model: [children: children]
    }

    @Secured("ROLE_ADMIN")
    def register() {
        if (request.method == "GET") {
            List<User> userList = User.list()
            render view: 'register', model: [userList: userList]
        } else {
            User userMember = new User()
            userMember.firstName = params.firstName
            userMember.lastName = params.lastName
            userMember.password = params.password
            userMember.username = params.username
            userMember.streamURL = params.streamURL
            userMember.userRoleType = UserRoleType.Member
            userMember.save(flush: true, failOnError: true)
            UserRole userRole = new UserRole(user: userMember, role: Role.findByAuthority("ROLE_MEMBER"))
            userRole.save(flush: true, failOnError: true)

            UserChild userChild = new UserChild()
            userChild.parent = User.get(params.parentId)
            userChild.child = userMember
            userChild.save(flush: true, failOnError: true)

            redirect action: 'index'
        }
    }

    @Secured(["ROLE_ADMIN", "ROLE_MEMBER"])
    def viewStream() {
        User currentUser = springSecurityService.currentUser
        User videoOf
        Long userId = params.userId as Long
        if (checkIfParent(currentUser, userId)) {
            videoOf = User.findById(params.userId as Long)
            [user: videoOf]
        } else {
            render text: "Access Denied!"
        }

    }

    static boolean checkIfParent(User currentUser, Long parentId) {
        User findParent = UserChild.findByChild(User.findById(parentId))?.parent
        if (!findParent) {
            return false
        } else if (findParent == currentUser) {
            return true
        } else {
            return checkIfParent(currentUser, findParent.id)
        }
    }

}
