package view;

import domain.Speler;
import domain.SpelerDB;

import javax.print.DocFlavor;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet( "/Overzicht")
public class OverzichtServlet extends HttpServlet {
    SpelerDB spelers = new SpelerDB();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String command ="home";
        if (request.getParameter("command")!=null){
            command=request.getParameter("command");
        }
        String destination;
        switch (command){
            case "home" :
                destination = home (request,response);
                break;
            case "overview" :
                destination = overview(request,response);
                break;
            case "voegToe":
                destination = voegToe(request,response);
                break;
            case "deleteBevestiging":
                destination = "deleteBevestiging.jsp";
                break;
            case "delete":
                destination = delete(request,response);
                break;
            case "zoeken":
                destination = zoek(request,response);
                break;
            case "updateBevestiging":
                destination = updateBevestiging(request,response);
                break;
            case "update":
                destination=update(request,response);
                break;
            case "topAantalSpelers":
                destination=topaantalSpelers(request,response);
                break;
            default:
                destination = "index.jsp";

        }
        request.getRequestDispatcher(destination).forward(request, response);

    }

    private String topaantalSpelers(HttpServletRequest request, HttpServletResponse response) {
        String aantal = request.getParameter("aantal");
        Cookie c =new Cookie("aantalTop",aantal);
        response.addCookie(c);

        ArrayList<Speler> lijst = new ArrayList<>();
        int x = Integer.parseInt(aantal);
        x = spelers.getSpelersLength()-x;
        int z=0;
        for (int i =0; i<spelers.getSpelersLength();i++){
            Speler a = spelers.get(i);
            for (int y =0; y<spelers.getSpelersLength();y++){
                Speler b = spelers.get(y);
                if (!(i==y)){
                    if(a.getPunten()>b.getPunten()){
                        z++;
                    }
                }
            }
            if(z>=x){
                lijst.add(a);
            }
            z=0;

        }
        request.setAttribute("topAantalSpelers", lijst);
        return overview(request,response);

    }

    private String update(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<String> errors = new ArrayList<String>();
        String naam = request.getParameter("idnaam");
        Speler speler = spelers.zoekSpeler(naam);
        setNaam(speler,request,errors);
        setPunten(speler,request,errors);
        setGewonnen(speler,request,errors);
        setLand(speler,request,errors);
        if(errors.size()==0){
            try {
                return overview(request, response);
            } catch (IllegalArgumentException exc) {
                errors.add(exc.getMessage());
            }
        }

        request.setAttribute("errors",errors);
        return "Update.jsp";



    }

    private String updateBevestiging(HttpServletRequest request, HttpServletResponse response) {
        String naam = request.getParameter("naam");
        Speler speler = spelers.zoekSpeler(naam);
        request.setAttribute("speler", speler);
        return "Update.jsp";
    }

    private String zoek(HttpServletRequest request, HttpServletResponse response) {
        String naam = request.getParameter("naam");
        Speler speler = spelers.zoekSpeler(naam);
        if (speler == null){
            String opmerking = "Speler bestaat niet";
            request.setAttribute("opmerking",opmerking);
            return overview(request,response);
        }else {
            request.setAttribute("speler", speler);
            return "gevonden.jsp";
        }

    }


    private String delete(HttpServletRequest request, HttpServletResponse response) {
        String naam = request.getParameter("naam");
        spelers.removeSpeler(naam);
        return overview(request,response);
    }

    private String voegToe(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<String> errors = new ArrayList<String>();

        Speler speler = new Speler();
        setNaam(speler,request,errors);
        setPunten(speler,request,errors);
        setGewonnen(speler,request,errors);
        setLand(speler,request,errors);
        if(errors.size()==0){
            try {
                spelers.addSpeler(speler);
                return overview(request, response);
            } catch (IllegalArgumentException exc) {
                errors.add(exc.getMessage());
            }
        }

        request.setAttribute("errors",errors);
        return "voegToe.jsp";



    }

    private void setNaam(Speler speler, HttpServletRequest request, ArrayList<String> errors) {
        String naam = request.getParameter("naam");
        try {
            speler.setNaam(naam);
        }
        catch (IllegalArgumentException exc){
            errors.add(exc.getMessage());
        }

    }

    private void setPunten(Speler speler, HttpServletRequest request, ArrayList<String> errors) {
        String punten = request.getParameter("punten");
        try {
            if( punten.isEmpty() ){
                throw new IllegalArgumentException("punten is geen getal");
            }

            int x = Integer.parseInt(punten);
            speler.setPunten(x);
        }
        catch (IllegalArgumentException exc){
            errors.add(exc.getMessage());
        }
    }



    private void setGewonnen(Speler speler, HttpServletRequest request, ArrayList<String> errors) {
        String gewonnen = request.getParameter("gewonnen");
        try {
            if( gewonnen.isEmpty() ){
                throw new IllegalArgumentException("gewonnen is geen getal");
            }
            int x = Integer.parseInt(gewonnen);
            speler.setGewonnen(x);
        }
        catch (IllegalArgumentException exc){
            errors.add(exc.getMessage());
        }

    }


    private void setLand(Speler speler, HttpServletRequest request, ArrayList<String> errors) {
        String naam = request.getParameter("land");
        try {
            speler.setLand(naam);
        }
        catch (IllegalArgumentException exc){
            errors.add(exc.getMessage());
        }

    }



    private String overview(HttpServletRequest request, HttpServletResponse response) {
        Cookie cookie = getAantalCookie(request);
        if (!(cookie ==null)) {
            request.setAttribute("requestCookie", cookie.getValue());
        }

            request.setAttribute("winnaar",spelers.winnendeSpeler());

        request.setAttribute("spelers", spelers.getSpelers());
        return "Overzicht.jsp";
    }

    private String home(HttpServletRequest request, HttpServletResponse response) {
        return "index.jsp";
    }
    private Cookie getAantalCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if(cookies == null)
            return null;
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("aantalTop")){
                return cookie;
            }
        }
        return null;
    }



}


