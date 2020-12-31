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
            <input type="int" id="aantal" name="aantal" value="${requestCookie}">
            <input type="submit" value="Submit">

        </form>
        <c:if test="${not empty topAantalSpelers}">
            <c:forEach var="speler" items="${topAantalSpelers}">
                <table></table>
                    <tr>
                        <td>${speler.naam}</td>
                        <td>${speler.punten}</td>
                        <td>${speler.gewonnen}</td>
                        <td>${speler.land}</td>
                    </tr>
                </table>
            </c:forEach>
        </c:if>


        <c:if test="${not empty opmerking}">
            <p>${opmerking}</p>
        </c:if>
    </main>
    <footer>
            <span>Photo by <a
                    href="https://unsplash.com/@amandagraphc?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Amanda
                    Jones</a> on <a
                    href="https://unsplash.com/@amandagraphc?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Unsplash</a></span>
    </footer>
</body>

</html>