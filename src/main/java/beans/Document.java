package beans;

import java.io.Serializable;

/**
 *
 * @author Teddy
 */

public class Document implements Serializable{
    private String name;

    public Document() {
        name=" ";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
