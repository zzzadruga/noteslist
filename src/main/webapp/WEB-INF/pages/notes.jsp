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
    <link href="data:image/x-icon;base64,AAABAAEAEBAAAAAAAABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAtBAQALQQEACoEBBAXAgGUFgQEtRkFBrQbBwe0HQgItR8KC7YgCwy2Iw0Nuh8LC74FAQFzAAAAAAAAAAAAAAAALwICACwCAgA8CQiHnkhL/7FVWP+1WFv/vmBi/8dnaf/Pb3D/1HN0/9l4ef/Vfn//Riwr5QYEBAgPCgkADwoJADEAAAAsAAAAXxkcy/CblP//u6T//r2p//+8qP//vqv//7yo//+8qf//v6r//8O4/2NHR+MKBQQGGhEQABoREAA+AAAAOAAAAogzNen8xqz///XZ//ju2f/69OL/+/Tk///88f///vn///z4/+3h3f86Li6+AAAAAAQBAQAEAQEAQQECADcAADOkT037/9O3///33/+dj4L/UU1J/46IjP/CsKv/6uDR/////v/NwcD/GQ0NgQAAAAAAAAAAAAAAAD0DBABLAQR6vWVb///evv//8dn/wrSj/1JYU/+Bp8D/G1en/1paev/v28n/pZGK+gMAAEUAAAAAAAAAAAAAAAAWAAAASQcLstJ3Y///5cP/8NrC/+nZwv+wp6f/jL/o/xev//8Bc9L/bXGi/2lIR+8AAAAZAAAAAAAAAAAAAAAAQAAAAmYSFNzjkXX//+3K/+fPtv/l0Lr/2sS2/1R9p/9s2ff/K87//wCa7P8NMW79AQADpwAAAAgAAAAAAAAAAD4AACyFISD1862L//vlxf/RuaT/xrKg/+3Ywf/Mvrn/Vouz/2zd8/9G8P//AcX7/wZRkP4DABDGAAAAHQAAAABDAAFimzcv/v7Bmf/eyK7/xa6a/9C/qP/Twq3/382z/7igm/9DaJv/ZM7r/1j9//8F3f//Amus/wAEIdoAAAA3TgIGmbpMOf/zwJj/1sKk/9C4nv/GlY3/y4eN/8eDjf/VkJT/1IKT/2Zbm/9Ys97/Yfb//xjf//9Dc6f/Dwks3FcKDcrKYUf/4L6Y/9O1l//Tlo3/8aKl//6ztP/+tLb//re5///Ewv/5uLr/g4C4/1Ou5f+t8vP/erDs/wYgbu19FRTvvnJT/8yihP/Ujof/96up//+3sv//trP//768///Gxf//2df///z6/+axvf83HFTlV329/Sdlyv8AAS2PhCEc/LZvWv/oq6D//8bA///Px///1M3//97X///m4f//7+n///r6/9CZrv5sGSuvIAANBgAAb3AAA1uPAAAbAokKCd+sQUD+x2Vk/cJkZvzBZmv8vmdw+79qdfu9aXb6wW5/+6ZWa/I7Bg98SQAKACkIHwAAAGgAAABQAAAAIQD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A4A8AAMAHAADABwAAwAcAAMAHAADADwAAgA8AAIAHAACAAwAAgAEAAAAAAAAAAAAAAAAAAAANAAAAPwAA//8AAA==" rel="icon" type="image/x-icon" />
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