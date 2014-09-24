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
    
    public void createPie() {
        pie = new PieChartModel();
         
        pie.set("Brand 1", 540);
        pie.set("Brand 2", 325);
        pie.set("Brand 3", 702);
        pie.set("Brand 4", 421);
         
        pie.setTitle("Simple Pie");
        pie.setLegendPosition("w");
    }
}
