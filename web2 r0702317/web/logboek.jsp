<%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 27/12/2020
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="general.css">
    <title>Wedstijdt logboek</title>
</head>
<body>
    <header>
        <jsp:include page="Header.jsp"/>
    </header>
    <main>
        <table>
            <thead>
            <tr>
                <th>Code   </th>
                <th>Naam   </th>
                <th>Punten   </th>
                <th>ΔPunten   </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="event" items="${logboek}">
                <tr>
                    <c:forEach var="info" items="${event}">
                    <td>${info}</td>
                    </c:forEach>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </main>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>



</body>
</html>
