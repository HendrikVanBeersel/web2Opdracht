package domain;

public class Speler {
    private String naam;
    private int punten;
    private int gewonnen;
    private String land;
    public Speler(String naam,int punten, int gewonnen, String land){
        setNaam(naam);
        this.punten=punten;
        setGewonnen(gewonnen);
        setLand(land);
    }

    private void setGewonnen(int gewonnen) {
        if(gewonnen>=0){
            this.gewonnen = gewonnen;
        }
        else throw new IllegalArgumentException("gewonnen kan niet onder 0");
    }

    private void setNaam(String naam) {
        if(isValidString(naam)){
            this.naam = naam;
        }
        else throw new IllegalArgumentException("geen naam ingevuld");
    }

    private void setLand(String land) {
        if(isValidString(land)){
            this.land = land;
        }
        else throw new IllegalArgumentException("geen geldig land ingevuld");
    }

    public String getNaam() {
        return naam;
    }

    public int getPunten() {
        return punten;
    }

    public int getGewonnen() {
        return gewonnen;
    }

    public String getLand() {
        return land;
    }

    public void addPunten(int punt){
        punten+=punt;
    }
    public void subPunten(int punt){
        punten-=punt;
    }
    public void addGewonnen(){
        gewonnen++;
    }


    private static boolean isValidString(String input) {
        return (input != null) && !(input.trim().isEmpty());
    }

}
