<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div style="border: 1px solid #ccc;padding:5px;margin-bottom:20px;">

    &nbsp;
    <a href="${pageContext.request.contextPath}/home">Главная</a>

    <c:if test="${pageContext.request.userPrincipal.name == null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/login">Войти</a>

    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name == null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/registrationPage">Зарегистрироваться</a>

    </c:if>

    <security:authorize access="hasAnyRole('admin')">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/users">Пользователи</a>

    </security:authorize>

    <c:if test="${pageContext.request.userPrincipal.name != null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/logout">Выйти</a>

    </c:if>

    <%--&nbsp; | &nbsp;--%>
    <%--<a href="${pageContext.request.contextPath}/home/book">Адрессная книга</a>--%>

    <%--&nbsp; | &nbsp;--%>
    <%--<a href="${pageContext.request.contextPath}/addUserAJAX">ajax</a>--%>


</div>