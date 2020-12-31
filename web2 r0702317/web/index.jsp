<%@ page import="domain.Speler" %><%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 05/10/2020
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="nl">

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="general.css">
  <title>Wedstijdt ranking index</title>
</head>

<body>
  <header>
    <jsp:include page="Header.jsp"/>
  </header>
  <main>
    <h2>Wedstrijd overzicht</h2>
    <p>Hier is het overzicht van de komende wedstrijdt. elke deelnemer heeft een naam, aantal punten en wins. Land
      van herkomst is optioneel. Dit overzicht dient alleen om de tussenstanden te zien en of bij te werken.</p>
  </main>
  <footer>
    <jsp:include page="footer.jsp"/>
  </footer>

</body>

</html>