/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.faces.bean.ManagedBean;

/**
 *
 * @author jeremygillet
 */

@ManagedBean(name="User")
public class User {

    private String firstName;
    private String lastName;
    private String login;
    private String password;
    private Boolean isValidator;

    public Boolean getIsValidator() {
        return isValidator;
    }

    public void setIsValidator(Boolean isValidator) {
        this.isValidator = isValidator;
    }
    
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String FirstName) {
        this.firstName = FirstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String LastName) {
        this.lastName = LastName;
    }
    
}

