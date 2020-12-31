<%@ page import="domain.Speler" %><%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 05/10/2020
  Time: 22:29
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
    <h2>Wedstrijd overzicht</h2>
    <p>Hier is het overzicht van de komende wedstrijdt. elke deelnemer heeft een naam, aantal punten en wins. Land
      van herkomst is optioneel. Dit overzicht dient alleen om de tussenstanden te zien en of bij te werken.</p>
    <%
      Speler winnaar = (Speler) request.getAttribute("winnaar");
      if (winnaar !=null){
    %>

    <p>Speler <%=winnaar.getNaam()%> is aan het winnen met <%=winnaar.getPunten()%> punten en met <%=winnaar.getGewonnen()%> overwinningen. </p>
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