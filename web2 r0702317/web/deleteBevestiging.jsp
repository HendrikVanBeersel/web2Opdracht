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
        <jsp:include page="Header.jsp"/>

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
        <jsp:include page="footer.jsp"/>

    </footer>

</body>
</html>
