<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>User Info</title>
</head>
<body>
<jsp:include page="menu.jsp" />

<%--<h2>User Info Page</h2>--%>

<h3>Текущий пользователь : ${pageContext.request.userPrincipal.name}</h3>

</body>
</html>