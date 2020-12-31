<%@ page import="domain.Speler" %><%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 25/10/2020
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
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
        <h2>gevonden!</h2>
        <p>speler ${speler.naam} heeft ${speler.punten} punten.</p>
    </main>
</body>
</html>
