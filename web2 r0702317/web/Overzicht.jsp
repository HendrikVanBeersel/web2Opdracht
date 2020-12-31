<%@ page import="domain.SpelerDB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.Speler" %><%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 05/10/2020
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="nl">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="general.css">
    <title>Wedstijdt ranking index</title>
</head>

<body>
    <header>
        <h1>wiezen kampioenschap</h1>
        <img src="foto's/amanda-jones-P787-xixGio-unsplash.jpg" alt="foto van kaarten">
        <nav>
            <a href="Overzicht?command=home">index</a>
            <a href="Overzicht?command=overview">Overzicht</a>
            <a href="voegToe.jsp">Voeg toe</a>
            <a href="zoek.jsp">zoek speler</a>

        </nav>
    </header>
    <main>
        <h2>Het overzicht</h2>
        <table>
            <thead>
            <tr>
                <th>Naam</th>
                <th>Punten</th>
                <th>Gewonnen</th>
                <th>Land</th>
            </tr>
            </thead>
            <tbody>
            <%
                SpelerDB x = (SpelerDB) request.getAttribute("spelers");
                ArrayList<Speler> spelers = x.getSpelers();
            %>
            <%
                for (Speler speler : spelers) {
            %>
            <tr>
                <td><%= speler.getNaam()%></td>
                <td><%= speler.getPunten()%></td>
                <td><%= speler.getGewonnen()%></td>
                <td><%= speler.getLand()%></td>
                <td>
                    <a href="Overzicht?command=deleteBevestiging&naam=<%=speler.getNaam()%>">verwijder</a>
                </td>

            </tr>
            <%
                }
            %>

            </tbody>
        </table>
        <%
            if (request.getAttribute("opmerking")!=null){
        %>
        <p><%=request.getAttribute("opmerking")%></p>
        <%
            }
        %>
    </main>
    <footer>
            <span>Photo by <a
                    href="https://unsplash.com/@amandagraphc?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Amanda
                    Jones</a> on <a
                    href="https://unsplash.com/@amandagraphc?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Unsplash</a></span>
    </footer>
</body>

</html>