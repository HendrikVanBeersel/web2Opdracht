package view;

import domain.Speler;
import domain.SpelerDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
            default:
                destination = "index.jsp";

        }
        request.getRequestDispatcher(destination).forward(request, response);

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
        String naam = request.getParameter("naam");
        String punten = request.getParameter("punten");
        String gewonnen = request.getParameter("gewonnen");
        String land = request.getParameter("land");
        String opmerking=" ";
        if(naam == null || naam.trim().isEmpty() || punten == null || punten.trim().isEmpty() || gewonnen == null || gewonnen.trim().isEmpty()|| land==null||land.trim().isEmpty()){
            opmerking = "niet alle velden zijn ingevuld!";
        }else {
            int x = Integer.parseInt(punten);
            int y = Integer.parseInt(gewonnen);
            Speler speler = new Speler(naam, x, y, land);
            spelers.addSpeler(speler);
        }
        request.setAttribute("opmerking",opmerking);
        return overview(request,response);
    }

    private String overview(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("spelers", spelers);
        return "Overzicht.jsp";
    }

    private String home(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("winnaar",spelers.winnendeSpeler());
        return "index.jsp";
    }


}


