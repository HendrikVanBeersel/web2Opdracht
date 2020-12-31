<%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 29/11/2020
  Time: 18:42
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
    <h2>Update speler</h2>
    <c:if test="${not empty errors}">
        <div class="alert alert-danger">
            <ul>
                <c:forEach items ="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <form id="voeg speler toe" action="Overzicht?command=update"method="post">
        <label for="idnaam"hidden> </label>
        <input type="text" id="idnaam" name="idnaam" value="${speler.naam}"hidden>

        <label for="naam">Naam:</label>
        <input type="text" id="naam" name="naam" value="${speler.naam}" required>
        <label for="punten">Aantal punten:</label>
        <input type="number" id="punten" name="punten" value="${speler.punten}" required>
        <label for="gewonnen">gewonnen</label>
        <input type="number" id="gewonnen" name="gewonnen" value="${speler.gewonnen}" required>
        <label for="land">Land:</label>
        <input type="text" id="land" name="land" value="${speler.land}" required>
        <input type="submit" value="Submit">
    </form>

</main>
<footer>
            <span>Photo by <a
                    href="https://unsplash.com/@amandagraphc?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Amanda
                    Jones</a> on <a
                    href="https://unsplash.com/@amandagraphc?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Unsplash</a></span>
</footer>

</body>

</html>