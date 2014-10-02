package tools;

// une connexion à la BD
import java.sql.Connection;
// gestion des pilotes
import java.sql.DriverManager;
// erreurs
import java.sql.SQLException;
// une instruction
import java.sql.Statement;
// un resultat (lignes/colonnes)
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jeremygillet
 */

@ManagedBean
@SessionScoped

public class ConnectBDD {
    private Connection myConnexion;
    private Statement myStatement;
    
    private final String MYURL = "jdbc:mysql://localhost/pharmator";
    private final String MYUSER= "root";
    private final String MYPASSWORD= "root";
    
    
    public ConnectBDD(){
        if (testDriver()) {
            try {
                myConnexion = DriverManager.getConnection(MYURL, MYUSER, MYPASSWORD);
                myStatement = myConnexion.createStatement();
            } catch (SQLException ex) {
                Logger.getLogger(ConnectBDD.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("SQLException: " + ex.getMessage());
                System.out.println("SQLState: " + ex.getSQLState());
                System.out.println("VendorError: " + ex.getErrorCode());
            }
        }
        else
        {
            System.out.println("testdriver false");
        }

    }

    public boolean testDriver() {
        //   Chargement du driver JDBC pour MySQL */
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return true;
        } catch (ClassNotFoundException e) {
            System.out.println("Le driver n'a pas été chargé");
            return false;
        }
    
    }
    
public Connection getMyConnexion() {
        return myConnexion;
    }

    public Statement getMyStatement() {
        return myStatement;
    }
    
    
    
    public void close() {
        try {
            this.myStatement.close();
            this.myConnexion.close();    
        } catch (SQLException ex) {
           System.out.println("Mysql connection fermeture failed !!!");
        }
    }
   
}
