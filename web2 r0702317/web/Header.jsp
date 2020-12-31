<%--
  Created by IntelliJ IDEA.
  User: hendr
  Date: 27/12/2020
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<h1>wiezen kampioenschap</h1>
<img src="foto's/amanda-jones-P787-xixGio-unsplash.jpg" alt="foto van kaarten">
<nav>
    <a href="Overzicht?command=home" id="${home}">index</a>
    <a href="Overzicht?command=overview" id="${overview}">Overzicht</a>
    <a href="Overzicht?command=voegToePagina" id="${voegToePagina}">Voeg toe</a>
    <a href="Overzicht?command=zoekPagina" id="${zoekPagina}">zoek speler</a>
    <a href="Overzicht?command=logboekPagina" id="${logboekPagina}">logboek</a>
</nav>
