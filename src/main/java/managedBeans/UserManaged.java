/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package managedBeans;

import beans.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import tools.ConnectBDD;

/**
 *
 * @author jeremygillet
 */
@ManagedBean(name="UserM")
@SessionScoped
public class UserManaged {

    private User currentUser;
    private boolean isAuthenticated = false;

    public UserManaged(){
        currentUser = new User();
    }
    public boolean isValidationComplete() {
        return isAuthenticated;
    }

    public void setValidationComplete(boolean validationComplete) {
        this.isAuthenticated = validationComplete;
    }

    public User getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(User currentUser) {
        this.currentUser = currentUser;
    }

    public String connexion() throws SQLException {
        String resultat = null; 
        ConnectBDD b = new ConnectBDD();
        Connection con = b.getMyConnexion();
        if (con == null) {
            throw new SQLException("Can't get database connection");
        }
        PreparedStatement ps = con.prepareStatement("select count(*) as nbutil, UserFirstName, UserLastName  from USERS where UserLogin = '" + this.currentUser.getLogin() + "' and UserPassWord = '" + this.currentUser.getPassword() + "'");
        //get customer data from database
        System.out.println("avant exec requete");
        ResultSet result = ps.executeQuery();
        while (result.next()) {
            int nbutil = result.getInt("nbutil");
            if (nbutil > 0) {
                this.isAuthenticated = true;
                this.currentUser.setFirstName(result.getString("UserFirstName"));
                this.currentUser.setLastName(result.getString("UserLastName"));
                               
                System.out.println("identify OK");
                resultat="success";
                
            }
            else {
                System.out.println("identify pas OK");
            }
                
        }
                System.out.println("resultat:"+resultat);
                
        return resultat;     
    }

}
