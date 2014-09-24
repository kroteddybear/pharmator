/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package managedBeans;

import beans.Document;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import org.primefaces.model.chart.PieChartModel;
import tools.ConnectBDD;
@ManagedBean(name="docM")
@SessionScoped
/**
 *
 * @author Teddy
 */
public class DocumentManaged {
    private Document selectedDocument;
    private PieChartModel pie;

    public DocumentManaged() {
        selectedDocument = new Document();
        pie = new PieChartModel();
    }

    /**
     *
     * @throws SQLException
     */
    @PostConstruct
    public void init(){
        try {
            createPie();
        } catch (SQLException ex) {
            Logger.getLogger(DocumentManaged.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Document getSelectedDocument() {
        return selectedDocument;
    }

    public void setSelectedDocument(Document selectedDocument) {
        this.selectedDocument = selectedDocument;
    }

    public PieChartModel getPie() {
        return pie;
    }

    public void setPie(PieChartModel pie) {
        this.pie = pie;
    }
    
    public String setDocument() throws SQLException {
        ConnectBDD b = new ConnectBDD();
        if (b == null) {
            throw new SQLException("Can't get database connection");
        }
        try {
            /* Récupération des paramètres d'URL saisis par l'utilisateur */
            String paramName = this.selectedDocument.getName();
            /* Exécution d'une requête de modification de la BD (INSERT, UPDATE, DELETE, CREATE, etc.). */
            b.getMyStatement().executeUpdate("INSERT INTO OBJECTS(ObjectsName) VALUES ('" + paramName + "');");
            b.getMyConnexion().commit();
            return "success";
        } catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
            return "failed";
        }
    }
    
    public List<Document> getDocument() throws SQLException {
        List<Document> list = new ArrayList<>();
        //get database connection
        ConnectBDD b = new ConnectBDD();
        Connection con = b.getMyConnexion();
        if (con == null) {
            throw new SQLException("Can't get database connection");
        }
        PreparedStatement ps = con.prepareStatement("select * from OBJECTS;");
        //get customer data from database
        ResultSet result = ps.executeQuery();
        while (result.next()) {
            Document document = new Document();
            document.setName(result.getString("ObjectsName"));
            list.add(document);
        }
        return list;
    }
    
    public void createPie() throws SQLException {
        this.pie = new PieChartModel();
        int noVal = 0;
        int inProg = 0;
        int Val = 0;
        int archived = 0;
        
        // Requete
        ConnectBDD b = new ConnectBDD();
        Connection con = b.getMyConnexion();
        if (con == null) {
            throw new SQLException("Can't get database connection");
        }
        PreparedStatement ps = con.prepareStatement("select count(*) as Count from OBJECTS inner join LINK on OBJECTS.IdObject = LINK.IdObject inner join OBJECTSPROPERTIES on LINK.IdProperty = OBJECTSPROPERTIES WHERE.IdProperty;");
        //get customer data from database
        ResultSet result = ps.executeQuery();
        while (result.next()) {
            noVal = result.getInt("Count");
        }
        this.pie.set("Non validé", noVal);
        this.pie.set("En cours de validation", inProg);
        this.pie.set("Validé", Val);
        this.pie.set("Archivé", archived);
         
        this.pie.setTitle("Etat des documents");
        this.pie.setLegendPosition("n");
        this.pie.setFill(false);
        this.pie.setShowDataLabels(true);
        this.pie.setDiameter(100);
    }
}
