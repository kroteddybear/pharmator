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
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.apache.commons.io.FilenameUtils;
import org.primefaces.event.DragDropEvent;
import org.primefaces.model.UploadedFile;
import org.primefaces.model.chart.PieChartModel;
import tools.ConnectBDD;

@ManagedBean(name = "docM")
@SessionScoped
/**
 *
 * @author Teddy
 */
public class DocumentManaged {

    private Document selectedDocument;
    private UploadedFile file;
    private PieChartModel pie;
    private List<Document> validateDoc;
    private List<Document> rejectedDoc;

    public DocumentManaged() {
        selectedDocument = new Document();
        pie = new PieChartModel();
        validateDoc = new ArrayList<Document>();
        rejectedDoc = new ArrayList<Document>();
    }

    public List<Document> getRejectedDoc() {
        return rejectedDoc;
    }

    public void setRejectedDoc(List<Document> rejectedDoc) {
        this.rejectedDoc = rejectedDoc;
    }

    public List<Document> getValidateDoc() {
        return validateDoc;
    }

    public void setValidateDoc(List<Document> validateDoc) {
        this.validateDoc = validateDoc;
    }

    public UploadedFile getFile() {
        return file;
    }

    public void setFile(UploadedFile file) {
        this.file = file;
    }
    
    /**
     *
     */
    @PostConstruct
    public void init() {
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

    public void onDocValidate(DragDropEvent ddEvent) throws SQLException{
        Document doc = ((Document) ddEvent.getData());
        System.out.println("id = "+ doc.getId());
        this.validateDoc.add(doc);
        ConnectBDD b = new ConnectBDD();
        if (b == null) {
            throw new SQLException("Can't get database connection");
        }
        b.getMyStatement().executeUpdate("update link set PropertyValue='Validate' Where IdProperty=5 and IdObject="+ doc.getId() +";");
    }
    
    public void onDocRejected(DragDropEvent ddEvent) throws SQLException{
        Document doc = ((Document) ddEvent.getData());
        System.out.println("id = "+ doc.getId());
        this.rejectedDoc.add(doc);
        ConnectBDD b = new ConnectBDD();
        if (b == null) {
            throw new SQLException("Can't get database connection");
        }
        b.getMyStatement().executeUpdate("update link set PropertyValue='Reject' Where IdProperty=5 and IdObject="+ doc.getId() +";");
    }
    
    public String setDocument() throws SQLException {
        //File folder = new File("/UploadFiles");
        this.selectedDocument.setName(FilenameUtils.getName(file.getFileName()));
        String extension = FilenameUtils.getExtension(file.getFileName());
        this.selectedDocument.setPathway(FilenameUtils.getName(file.getFileName())+"."+extension);
        if(file != null) {
            FacesMessage msg = new FacesMessage("Succesful", file.getFileName() + " is uploaded.");
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
        
        ConnectBDD b = new ConnectBDD();
        if (b == null) {
            throw new SQLException("Can't get database connection");
        }
        try {
            /* Récupération des paramètres d'URL saisis par l'utilisateur */
            String paramName = this.selectedDocument.getName();
            String paramPathway = this.selectedDocument.getPathway();
            /* Exécution d'une requête de modification de la BD (INSERT, UPDATE, DELETE, CREATE, etc.). */
            b.getMyStatement().executeUpdate("INSERT INTO OBJECTS (ObjectsName, CreateDate, ObjectsPath) VALUES ('" + paramName + "',  NOW(), "+paramPathway+" );");
            ResultSet result= b.getMyStatement().executeQuery("SET @last:=LAST_INSERT_ID()");
            int ID = result.getInt("@last");
            b.getMyStatement().executeUpdate("INSERT INTO LINK (IdObject, IdProperty, PropertyValue) VALUES ("+ID+", 5,'InProgress');");
            b.getMyStatement().executeUpdate("INSERT INTO LINK (IdObject, IdProperty, PropertyValue) VALUES ("+ID+", 6,'"+extension+"');");
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
        PreparedStatement ps = con.prepareStatement("select * from OBJECTS inner join LINK on OBJECTS.IdObject=LINK.IdObject Where IdProperty=5;");
        //get customer data from database
        ResultSet result = ps.executeQuery();
        while (result.next()) {
            Document document = new Document();
            document.setId(result.getInt("IdObject"));
            document.setName(result.getString("ObjectsName"));
            document.setDate(result.getDate("CreateDate"));
            document.setStatut(result.getString("PropertyValue"));
            list.add(document);
        }
        return list;
    }

    public List<Document> getInprogressDocument() throws SQLException {
        List<Document> list = new ArrayList<>();
        //get database connection
        ConnectBDD b = new ConnectBDD();
        Connection con = b.getMyConnexion();
        if (con == null) {
            throw new SQLException("Can't get database connection");
        }
        PreparedStatement ps = con.prepareStatement("select * from OBJECTS inner join LINK on OBJECTS.IdObject=LINK.IdObject Where IdProperty=5 and PropertyValue='InProgress';");
        //get customer data from database
        ResultSet result = ps.executeQuery();
        while (result.next()) {
            Document document = new Document();
            document.setId(result.getInt("IdObject"));
            document.setName(result.getString("ObjectsName"));
            document.setDate(result.getDate("CreateDate"));
            document.setStatut(result.getString("PropertyValue"));
            list.add(document);
        }
        return list;
    }
    
    public void createPie() throws SQLException {
        this.pie = new PieChartModel();
        ArrayList<String> statList = new ArrayList<>();

        // Requete
        ConnectBDD b = new ConnectBDD();
        Connection con = b.getMyConnexion();
        if (con == null) {
            throw new SQLException("Can't get database connection");
        }
        PreparedStatement ps = con.prepareStatement("select PropertyValue from OBJECTS inner join LINK on OBJECTS.IdObject = LINK.IdObject inner join OBJECTSPROPERTIES on LINK.IdProperty = OBJECTSPROPERTIES.IdProperty WHERE PropertyName = 'Status' GROUP BY PropertyValue;");
        //get customer data from database
        ResultSet result = ps.executeQuery();
        while (result.next()) {
            statList.add(result.getString("PropertyValue"));
        }

        for (String it : statList) {
            
            ps = con.prepareStatement("select Count(*) as Count from OBJECTS inner join LINK on OBJECTS.IdObject = LINK.IdObject inner join OBJECTSPROPERTIES on LINK.IdProperty = OBJECTSPROPERTIES.IdProperty WHERE PropertyName = 'Status' and PropertyValue = '" + it + "';");
            //get customer data from database
            result = ps.executeQuery();
            while (result.next()) {
                this.pie.set(it, result.getInt("Count"));
            }
        }

        this.pie.setTitle("Documents status");
        this.pie.setLegendPosition("s");
        this.pie.setFill(false);
        this.pie.setShowDataLabels(true);
        this.pie.setDiameter(240);
    }
}
