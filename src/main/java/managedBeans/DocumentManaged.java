/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package managedBeans;

import beans.Document;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
@ManagedBean(name="docM")
@SessionScoped
/**
 *
 * @author Teddy
 */
public class DocumentManaged {
    private Document selectedDocument;

    public DocumentManaged() {
        selectedDocument = new Document();
    }

    public Document getSelectedDocument() {
        return selectedDocument;
    }

    public void setSelectedDocument(Document selectedDocument) {
        this.selectedDocument = selectedDocument;
    }
    
    public void getDocument() throws SQLException {
        
    }
    
    public List<Document> putDocument() throws SQLException {
        List<Document> list = new ArrayList<>();
        
        return list;
    }
}
