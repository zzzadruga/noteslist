<%--
  Created by IntelliJ IDEA.
  User: Nikolai
  Date: 15.02.2018
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title><c:if test="${noteModel.id == 0}">Добаваить</c:if><c:if test="${noteModel.id != 0}">Редактировать</c:if> заметку</title>
    <link rel="stylesheet" media="screen" href="<c:url value='/resources/css/edit.css'/>" />
    <link href="data:image/x-icon;base64,AAABAAEAEBAAAAAAAABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAtBAQALQQEACoEBBAXAgGUFgQEtRkFBrQbBwe0HQgItR8KC7YgCwy2Iw0Nuh8LC74FAQFzAAAAAAAAAAAAAAAALwICACwCAgA8CQiHnkhL/7FVWP+1WFv/vmBi/8dnaf/Pb3D/1HN0/9l4ef/Vfn//Riwr5QYEBAgPCgkADwoJADEAAAAsAAAAXxkcy/CblP//u6T//r2p//+8qP//vqv//7yo//+8qf//v6r//8O4/2NHR+MKBQQGGhEQABoREAA+AAAAOAAAAogzNen8xqz///XZ//ju2f/69OL/+/Tk///88f///vn///z4/+3h3f86Li6+AAAAAAQBAQAEAQEAQQECADcAADOkT037/9O3///33/+dj4L/UU1J/46IjP/CsKv/6uDR/////v/NwcD/GQ0NgQAAAAAAAAAAAAAAAD0DBABLAQR6vWVb///evv//8dn/wrSj/1JYU/+Bp8D/G1en/1paev/v28n/pZGK+gMAAEUAAAAAAAAAAAAAAAAWAAAASQcLstJ3Y///5cP/8NrC/+nZwv+wp6f/jL/o/xev//8Bc9L/bXGi/2lIR+8AAAAZAAAAAAAAAAAAAAAAQAAAAmYSFNzjkXX//+3K/+fPtv/l0Lr/2sS2/1R9p/9s2ff/K87//wCa7P8NMW79AQADpwAAAAgAAAAAAAAAAD4AACyFISD1862L//vlxf/RuaT/xrKg/+3Ywf/Mvrn/Vouz/2zd8/9G8P//AcX7/wZRkP4DABDGAAAAHQAAAABDAAFimzcv/v7Bmf/eyK7/xa6a/9C/qP/Twq3/382z/7igm/9DaJv/ZM7r/1j9//8F3f//Amus/wAEIdoAAAA3TgIGmbpMOf/zwJj/1sKk/9C4nv/GlY3/y4eN/8eDjf/VkJT/1IKT/2Zbm/9Ys97/Yfb//xjf//9Dc6f/Dwks3FcKDcrKYUf/4L6Y/9O1l//Tlo3/8aKl//6ztP/+tLb//re5///Ewv/5uLr/g4C4/1Ou5f+t8vP/erDs/wYgbu19FRTvvnJT/8yihP/Ujof/96up//+3sv//trP//768///Gxf//2df///z6/+axvf83HFTlV329/Sdlyv8AAS2PhCEc/LZvWv/oq6D//8bA///Px///1M3//97X///m4f//7+n///r6/9CZrv5sGSuvIAANBgAAb3AAA1uPAAAbAokKCd+sQUD+x2Vk/cJkZvzBZmv8vmdw+79qdfu9aXb6wW5/+6ZWa/I7Bg98SQAKACkIHwAAAGgAAABQAAAAIQD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A4A8AAMAHAADABwAAwAcAAMAHAADADwAAgA8AAIAHAACAAwAAgAEAAAAAAAAAAAAAAAAAAAANAAAAPwAA//8AAA==" rel="icon" type="image/x-icon" />
</head>
<body>
<form:form modelAttribute="noteModel" class="contact_form" action="${pageContext.request.contextPath}/notes/addNote" method="post" name="contact_form">
    <form:input path="id" placeholder="ID" type="hidden"/>
    <ul>
        <li>
            <h2><c:if test="${noteModel.id == 0}">Добавить</c:if><c:if test="${noteModel.id != 0}">Редактировать</c:if> заметку</h2>
        </li>
        <li>
            <label for="name">Заголовок:</label>
            <form:input path="title" type="text" placeholder="Название" id="name" />
        </li><li>
        <form:input path="id" placeholder="ID" type="hidden"/>
        <c:if test="${noteModel.id != 0}">
            <label for="done">Статус:</label>
            <form:checkbox path="done" placeholder="Название" id="done" />
            <c:if test="${noteModel.done}">Выполнено</c:if><c:if test="${!noteModel.done}">Не выполнено</c:if>
        </c:if>
    </li>
        <c:if test="${noteModel.id != 0}">
            <li>
                <label for="date">Дата:</label>
                <form:input path="createdDate" type="text" name="date" placeholder="Дата" id="date" />
                <span class="form_hint">Формат "дд-мм-гггг чч:мм:сс"</span>
            </li>
        </c:if>
        <li>
            <label for="text">Заметка:</label>
            <form:textarea path="text" name="text" cols="40" rows="6" id="text" />
        </li>

        <li>
            <button class="submit" type="submit">Сохранить</button>
        </li>
    </ul>
</form:form>
<form class="contact_form" action="${pageContext.request.contextPath}/remove/${noteModel.id}" method="get" name="contact_form">
    <ul><li><button class="remove" type="submit">Удалить</button></li></ul>
</form>
</body>
</html>
