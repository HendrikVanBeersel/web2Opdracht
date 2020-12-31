<%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 05/10/2020
  Time: 22:59
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
    <h2>Voeg speler toe</h2>
    <form id="voeg speler toe" action="Overzicht?command=voegToe"method="post">
        <label for="naam">Naam:</label>
        <input type="text" id="naam" name="naam">
        <label for="punten">Aantal punten:</label>
        <input type="number" id="punten" name="punten">
        <label for="gewonnen">gewonnen</label>
        <input type="number" id="gewonnen" name="gewonnen">
        <label for="land">Land:</label>
        <input type="text" id="land" name="land">
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