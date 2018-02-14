<%--
  Created by IntelliJ IDEA.
  User: Nikolai
  Date: 14.02.2018
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notes</title>
</head>
<body>
<table>
    <tr>
        <th>Название</th>
        <th>Заметка</th>
        <th>Дата</th>
        <th>Выполнено</th>
    </tr>
    <c:forEach var="note" items="${notesList}">
        <tr>
            <td>${note.title}</td>
            <td>${note.text}</td>
            <td>${note.createdDate}</td>
            <td>${note.done}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
