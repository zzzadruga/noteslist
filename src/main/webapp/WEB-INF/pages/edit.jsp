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
</body>
</html>
