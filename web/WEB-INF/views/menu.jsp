<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<div style="border: 1px solid #ccc;padding:5px;margin-bottom:20px;">

    &nbsp;
    <a href="${pageContext.request.contextPath}/welcome">Главная</a>

    <c:if test="${pageContext.request.userPrincipal.name == null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/userInfo">Войти</a>

    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name == null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/register">Зарегистрироваться</a>

    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name != null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/userInfo">Инфо</a>

    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name != null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/admin">Управление пользователями</a>

    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name != null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/logout">Выйти</a>

    </c:if>

</div>