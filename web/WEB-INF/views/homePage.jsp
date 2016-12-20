<%@ page contentType="text/html;charset=UTF-8" %>
<%@page session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>${title}</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
    <c:if test="${pageContext.request.userPrincipal.name == null}">
        <h3>Войдите или зарегистрируйтесь.</h3>
    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h3>Текущий пользователь : ${pageContext.request.userPrincipal.name}</h3>
    </c:if>

    <security:authorize access="hasAnyRole('admin')">
        <a href="${pageContext.request.contextPath}/admin">Управление пользователями</a>
    </security:authorize>

</body>
</html>