<%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 25/10/2020
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>zoek speler</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="general.css">
</head>
<body>
<header>
    <jsp:include page="Header.jsp"/>
</header>
<main>
    <h2>zoek speler</h2>
    <form id="speler zoeken"action="Overzicht" method="GET">
        <label for="command" hidden>command</label>
        <input type="text" id="command" name="command" value="zoeken" hidden>
        <label for="naam">Naam:</label>
        <input type="text" id="naam" name="naam">
        <input type="submit" value="Submit">
    </form>

</main>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
