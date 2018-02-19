<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="stringDone" value=""/>
<c:if test="${!empty done}">
    <c:set var="stringDone" value="&done=${done}"/>
</c:if>
<c:set var="stringSort" value=""/>
<c:if test="${sort}">
    <c:set var="stringSort" value="&sort=true"/>
</c:if>
<c:url var="firstUrl" value="/notes/list?p=1${stringDone}${stringSort}" />
<c:url var="lastUrl" value="/notes/list?p=${totalPages}${stringDone}${stringSort}" />
<c:url var="prevUrl" value="/notes/list?p=${currentIndex - 1}${stringDone}${stringSort}" />
<c:url var="nextUrl" value="/notes/list?p=${currentIndex + 1}${stringDone}${stringSort}" />
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
    <li><a href="<c:url value="/notes/new"/>"><font color="#ffc"><strong>Новая заметка</strong></font></a></li>
    <c:if test="${empty stringDone}">
        <li><strong>Все заметки</strong></li>
        <li><a href="<c:url value="/notes/list?done=true${stringSort}"/>">Выполненные</a></li>
        <li><a href="<c:url value="/notes/list?done=false${stringSort}"/>">Невыполненные</a></li>
    </c:if>
    <c:if test="${!empty stringDone}"><li><a href="<c:url value="/notes/list"/>">Все заметки</a></li>
        <c:if test="${done == 'true'}">
            <li><strong>Выполненные</strong></li>
            <li><a href="<c:url value="/notes/list?done=false${stringSort}"/>">Невыполненные</a></li>
        </c:if>
        <c:if test="${done == 'false'}">
            <li><a href="<c:url value="/notes/list?done=true${stringSort}"/>">Выполненные</a></li>
            <li><strong>Невыполненные</strong></li>
        </c:if>
    </c:if>
    <c:if test="${sort == 'false'}">
        <li><strong>Сначала новые</strong></li>
        <li><a href="<c:url value="/notes/list?sort=true${stringDone}"/>">Сначала старые</a></li>
    </c:if>
    <c:if test="${sort == 'true'}">
        <li><a href="<c:url value="/notes/list?sort=false${stringDone}"/>">Сначала новые</a></li>
        <li><strong>Сначала старые</strong></li>
    </c:if>
</ol>
<ul>
    <c:forEach var="note" items="${notesList}">
    <li>
        <a href="<c:url value='/notes/edit/${note.id}'/>">
            <h2>
                <c:if test="${note.title.length() < 11}">${note.title}</c:if>
                <c:if test="${note.title.length() > 10}">${note.title.substring(0, 10)}...</c:if>
            </h2>
            <c:if test="${note.done}"><p><s>
                <c:if test="${note.text.length() < 20}">${note.text}</c:if>
                <c:if test="${note.text.length() > 19}">${note.text.substring(0, 20)}...</c:if>
            </s></p></c:if>
            <c:if test="${!note.done}"><p>
                <c:if test="${note.text.length() < 20}">${note.text}</c:if>
                <c:if test="${note.text.length() > 19}">${note.text.substring(0, 20)}...</c:if>
            </p></c:if>
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
        <c:url var="pageUrl" value="/notes/list?p=${i}${stringDone}${stringSort}" />
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