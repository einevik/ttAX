<%@page session="false"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Access Denied</title>
</head>
<body>
<jsp:include page="menu.jsp"/>

<h3 style="color:red;">${message}</h3>
</body>
</html>