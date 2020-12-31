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
    <title>Wedstijdt gevonden speler</title>
</head>

<body>
    <header>
        <jsp:include page="Header.jsp"/>
    </header>
    <main>
        <h2>gevonden!</h2>
        <p>speler ${speler.naam} heeft ${speler.punten} punten.</p>
    </main>
    <footer>
        <jsp:include page="footer.jsp"/>

    </footer>
</body>
</html>
