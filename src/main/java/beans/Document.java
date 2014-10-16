package beans;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Teddy
 */

public class Document implements Serializable{
    private int id;
    private String name;
    private String statut;
    private Date date;
    private String pathway;
    private String type;
    private String author;

    public Document() {
        name=" ";
        statut=" ";
        pathway=" ";
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
