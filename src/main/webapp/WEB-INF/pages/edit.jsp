<%--
  Created by IntelliJ IDEA.
  User: Nikolai
  Date: 15.02.2018
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Редактировать заметку</title>
</head>
<body>
<form:form modelAttribute="noteModel" method="post" action="${pageContext.request.contextPath}/notes/addNote"  accept-charset="utf-8">
    <form:input path="id" placeholder="ID" type="hidden"/><br>
    <form:input path="title" placeholder="Название" type="text"/><br>
    <form:input path="createdDate" placeholder="Дата" type="text"/><br>
    <form:input path="done" placeholder="Выполнено" type="text"/><br>
    <form:textarea path="text" placeholder="Описание" type="text"></form:textarea><br>
    <button>Обновить</button>
</form:form>
</body>
</html>
