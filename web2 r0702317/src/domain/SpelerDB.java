package domain;

import java.util.ArrayList;

public class SpelerDB {
    ArrayList<Speler> spelers = new ArrayList<>();
    public SpelerDB(){
        Speler tom =new Speler("Tom",200,4,"België");
        spelers.add(tom);
        Speler jack= new Speler("Jack",50,1,"USA");
        spelers.add(jack);
        Speler ellen = new Speler("Ellen",100,3,"België");
        spelers.add(ellen);
        Speler josh =new Speler("Josh",-350,0,"England");
        spelers.add(josh);
    }

    public ArrayList<Speler> getSpelers() {
        return spelers;
    }

    public void addSpeler(Speler x){
        spelers.add(x);
    }
    public void removeSpeler(Speler x){
        spelers.remove(x);
    }
    public void removeSpeler(String naam){
        Speler x = zoekSpeler(naam);
        if(x==null){
            throw new IllegalArgumentException("Speler bestaat niet");
        }
        removeSpeler(x);
    }
    public Speler winnendeSpeler(){
        Speler speler1 = spelers.get(0);
        for (int i=1; i<spelers.size();i++){
            Speler speler2 = spelers.get(i);
                if (speler1.getPunten()<speler2.getPunten()){
                    speler1=speler2;
                }else if(speler1.getPunten()==speler2.getPunten()){
                    if (speler1.getGewonnen()<speler2.getGewonnen()) {
                        speler1 = speler2;
                    }
                }

            }
        return speler1;
        }

    public Speler zoekSpeler(String naam){
        for (Speler x : spelers){
            if(x.getNaam().equals(naam)){
                return x;
            }
        }
        return null;
    }
}
