package beans;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Teddy
 */

public class Document implements Serializable{
    private String name;
    private String statut;
    private Date date;
    private String pathway;

    public Document() {
        name=" ";
        statut=" ";
        pathway=" ";
    }

    public String getPathway() {
        return pathway;
    }

    public void setPathway(String pathway) {
        this.pathway = pathway;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
