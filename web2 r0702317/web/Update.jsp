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
    <jsp:include page="Header.jsp"/>
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

    <form id="speler aanpassen" action="Overzicht?command=update"method="post">
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
    <jsp:include page="footer.jsp"/>
</footer>

</body>

</html>