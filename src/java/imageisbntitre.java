/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author HP
 */
public class imageisbntitre {
    private String image;
    private String isbni;
    private String titre_oeuvre;

    public imageisbntitre(String image, String isbni,String titre_oeuvre) {
        this.image = image;
        this.isbni = isbni;
        this.titre_oeuvre = titre_oeuvre;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getIsbni() {
        return isbni;
    }

    public void setIsbni(String isbni) {
        this.isbni = isbni;
    }

    public String getTitre_oeuvre() {
        return titre_oeuvre;
    }

    public void setTitre_oeuvre(String titre_oeuvre) {
        this.titre_oeuvre = titre_oeuvre;
    }
}
