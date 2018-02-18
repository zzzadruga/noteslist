<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${empty stringDone}">
    <c:set var="prefix" value=""/>
</c:if>
<c:if test="${!empty stringDone}">
    <c:set var="prefix" value="&done="/>
</c:if>
<c:url var="firstUrl" value="/notes/list?p=1${prefix}${stringDone}" />
<c:url var="lastUrl" value="/notes/list?p=${totalPages}${prefix}${stringDone}" />
<c:url var="prevUrl" value="/notes/list?p=${currentIndex - 1}${prefix}${stringDone}" />
<c:url var="nextUrl" value="/notes/list?p=${currentIndex + 1}${prefix}${stringDone}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Список заметок</title>
    <link href="https://fonts.googleapis.com/css?family=Caveat" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>" />
</head>
<body>
<ol>
    <c:if test="${empty stringDone}">
        <li><strong>Все заметки</strong></li>
        <li><a href="<c:url value="/notes/list?done=true"/>">Выполненные</a></li>
        <li><a href="<c:url value="/notes/list?done=false"/>">Невыполненные</a></li>
    </c:if>
    <c:if test="${!empty stringDone}"><li><a href="<c:url value="/notes/list"/>">Все заметки</a></li>
    <c:if test="${stringDone == 'true'}">
        <li><strong>Выполненные</strong></li>
        <li><a href="<c:url value="/notes/list?done=false"/>">Невыполненные</a></li>
    </c:if>
        <c:if test="${stringDone == 'false'}">
            <li><a href="<c:url value="/notes/list?done=true"/>">Выполненные</a></li>
            <li><strong>Невыполненные</strong></li>
        </c:if>
    </c:if>
</ol>
<ul>
    <c:forEach var="note" items="${notesList}">
    <li>
        <a href="<c:url value='/notes/edit/${note.id}'/>">
            <h2>${note.title}</h2>
            <p>${note.text}</p>
        </a>
    </li>
    </c:forEach>
</ul>
<ol>
    <c:choose>
        <c:when test="${currentIndex == 1}">
            <li><a href="#">В начало</a></li>
            <li><a href="#">Назад</a></li>
        </c:when>
        <c:otherwise>
            <li><a href="${firstUrl}">В начало</a></li>
            <li> <a href="${prevUrl}">Назад</a></li>
        </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
        <c:url var="pageUrl" value="/notes/list?p=${i}${prefix}${stringDone}" />
        <c:choose>
            <c:when test="${i == currentIndex}">
                <li><a href="${pageUrl}" style="background-color: black;"><c:out value="${i}" /></a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:choose>
        <c:when test="${currentIndex == totalPages}">
            <li><a href="#">Вперед</a></li>
            <li><a href="#">В конец</a></li>
        </c:when>
        <c:otherwise>
            <li><a href="${nextUrl}">Вперед</a></li>
            <li><a href="${lastUrl}">В конец</a></li>
        </c:otherwise>
    </c:choose>
</ol>
</body>
</html>