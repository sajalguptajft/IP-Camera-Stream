import enums.UserRoleType
import viewchildvideo.Role
import viewchildvideo.User
import viewchildvideo.UserChild
import viewchildvideo.UserRole

class BootStrap {

    def init = { servletContext ->

        if (Role.count == 0) {
            Role roleMember = new Role(authority: 'ROLE_MEMBER')
            roleMember.save(flush: true, failOnError: true)
            Role roleAdmin = new Role(authority: 'ROLE_ADMIN')
            roleAdmin.save(flush: true, failOnError: true)
        }

        User userAdminExists = User.findByUserRoleType(UserRoleType.Admin)
        if (!userAdminExists) {
            User userAdmin = new User()
            userAdmin.firstName = 'Sajal'
            userAdmin.lastName = 'Admin'
            userAdmin.password = '123456'
            userAdmin.username = 'admin'
            userAdmin.userRoleType = UserRoleType.Admin
            userAdmin.save(flush: true, failOnError: true)
            UserRole userRole = new UserRole(user: userAdmin, role: Role.findByAuthority("ROLE_ADMIN"))
            userRole.save(flush: true, failOnError: true)
        }

        User userMemberExists = User.findByUserRoleType(UserRoleType.Member)
        if (!userMemberExists) {
            User userMember = new User()
            userMember.firstName = 'Sajal'
            userMember.lastName = 'Member'
            userMember.password = '123456'
            userMember.username = 'user1'
            userMember.userRoleType = UserRoleType.Member
            userMember.save(flush: true, failOnError: true)
            UserRole userRole = new UserRole(user: userMember, role: Role.findByAuthority("ROLE_MEMBER"))
            userRole.save(flush: true, failOnError: true)

            userMember = new User()
            userMember.firstName = 'Sajal'
            userMember.lastName = 'Member 2'
            userMember.password = '123456'
            userMember.username = 'user2'
            userMember.userRoleType = UserRoleType.Member
            userMember.save(flush: true, failOnError: true)
            userRole = new UserRole(user: userMember, role: Role.findByAuthority("ROLE_MEMBER"))
            userRole.save(flush: true, failOnError: true)
        }

        if (UserChild.count == 0) {
            UserChild userChild = new UserChild()
            userChild.parent = User.get(1)
            userChild.child = User.get(2)
            userChild.save(flush: true, failOnError: true)
            userChild = new UserChild()
            userChild.parent = User.get(2)
            userChild.child = User.get(3)
            userChild.save(flush: true, failOnError: true)
        }

    }
    def destroy = {
    }
}
