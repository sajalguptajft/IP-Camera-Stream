package viewchildvideo

import enums.UserRoleType
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes = 'username')
@ToString(includes = 'username', includeNames = true, includePackage = false)
class User implements Serializable {

    transient springSecurityService

    String username
    String password

    String firstName
    String lastName

    UserRoleType userRoleType = UserRoleType.Member

    String streamURL

    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false

    User(String username, String password) {
        this()
        this.username = username
        this.password = password
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this)*.role
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    String getUserType() {
        String roles = UserRole.findAllByUser(this)*.role*.authority.join(",")?.replace("ROLE_", "")
        return roles?.substring(0, 1)?.toUpperCase() + roles?.substring(1)?.toLowerCase()
    }

    static transients = ['springSecurityService']

    static constraints = {
        streamURL nullable: true
    }

}
