<%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 25/10/2020
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="general.css">
    <title>delete bevestigen</title>
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
        <h2>bevestiging</h2>
        <p>weet u zeker dat u ${param.naam} wilt verwijderen</p>
        <form action="Overzicht?command=delete&naam=${param.naam}" method="post">
            <input class="delete" type="submit" name="bevestigen" value="bevestigen">
            <input class="delete" type="button" name="annuleer" value="annuleer" onclick="window.location.href='Overzicht?command=overview';">
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
