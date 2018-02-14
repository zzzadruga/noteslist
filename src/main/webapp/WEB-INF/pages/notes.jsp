<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <li><a href="/">Пункт #1</a></li>
    <li><a href="/">Пункт #2</a></li>
    <li><a href="/">Пункт #3</a></li>
    <li><a href="/">Пункт #4</a></li>
    <li><strong>Пункт #5</strong></li>
</ol>
<ul>
    <c:forEach var="note" items="${notesList}">
    <li>
        <a href="#">
            <h2>${note.title}</h2>
            <p>${note.text}</p>
        </a>
    </li>
    </c:forEach>
</ul>
</body>
</html>