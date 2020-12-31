<%@ page import="domain.SpelerDB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.Speler" %><%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 05/10/2020
  Time: 22:58
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
            <c:forEach var="speler" items="${spelers}">
            <tr>
                <td>${speler.naam}</td>
                <td>${speler.punten}</td>
                <td>${speler.gewonnen}</td>
                <td>${speler.land}</td>
                <td>
                    <a href="Overzicht?command=deleteBevestiging&naam=${speler.naam}">verwijder</a>
                </td>
                <td>
                    <a href="Overzicht?command=updateBevestiging&naam=${speler.naam}">update</a>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <p>Speler ${winnaar.naam} is aan het winnen met ${winnaar.punten} punten en met ${winnaar.gewonnen} overwinningen. </p>
        <form id="top spelers" action="Overzicht">
            <label for="command" hidden>command</label>
            <input type="text" id="command" name="command" value="topAantalSpelers" hidden>
            <label for="aantal">top aantal Spelers:</label>
            <input type="int" id="aantal" name="aantal" value="${aantal}">
            <input type="submit" value="Submit">

        </form>
        <table>

        <c:if test="${not empty topAantalSpelers}">
            <c:forEach items="${topAantalSpelers}" var="top" >
                    <tr>
                        <td>${top.naam}</td>
                        <td>${top.punten}</td>
                        <td>${top.gewonnen}</td>
                        <td>${top.land}</td>
                    </tr>
            </c:forEach>
        </c:if>
        </table>



        <c:if test="${not empty opmerking}">
            <p>${opmerking}</p>
        </c:if>
    </main>
    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>
</body>

</html>