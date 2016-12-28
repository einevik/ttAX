<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<link href="/resources/style.css" rel="stylesheet" type="text/css">
<head>
    <title>User Page</title>
</head>
<body>
<jsp:include page="menu.jsp"/>

<c:choose>
    <c:when test="${user.id==0}">
        <h2>Добавить нового пользователя</h2>
        <c:url var="addAction" value="/user/add" ></c:url>
    </c:when>
    <c:when test="${user.id!=0}">
        <h2>Изменть пользователя</h2>
        <c:url var="addAction" value="/user/edit" ></c:url>
    </c:when>
</c:choose>


<form:form action="${addAction}" commandName="user">
    <table>
        <%--<c:if test="${user.id!=0}">--%>
            <tr>
                <%--<td><form:label path="id"><spring:message text="ID"/></form:label></td>--%>
                <%--<td><form:input path="id" readonly="true" size="8"  disabled="true"/></td>--%>
                <form:hidden path="id"/>
            </tr>
        <%--</c:if>--%>
            <tr>
                <td><form:label path="surname"><spring:message text="Фамилия:"/></form:label></td>
                <td><form:input path="surname"/></td>
                <td><form:errors path="surname" cssStyle="color:red;margin:10px 0px;"/></td>
            </tr>
        <tr>
            <td><form:label path="firstname"><spring:message text="Имя:"/></form:label></td>
            <td><form:input path="firstname"/></td>
            <td><form:errors path="firstname" cssStyle="color:red;margin:10px 0px;"/></td>
        </tr>
        <tr>
            <td><form:label path="lastname"><spring:message text="Отчество:"/></form:label></td>
            <td><form:input path="lastname"/></td>
            <td><form:errors path="lastname" cssStyle="color:red;margin:10px 0px;"/></td>
        </tr>
        <tr>
            <td><form:label path="email"><spring:message text="Email:"/></form:label></td>
            <td><form:input path="email"/></td>
            <td><form:errors path="email" cssStyle="color:red;margin:10px 0px;"/></td>
        </tr>
        <tr>
            <td><form:label path="login"><spring:message text="Логин:"/></form:label></td>
            <td><form:input path="login"/></td>
            <td><form:errors path="login" cssStyle="color:red;margin:10px 0px;"/></td>
        </tr>
        <tr>
            <td><form:label path="password"><spring:message text="Пароль:"/></form:label></td>
            <td><form:input path="password"/></td>
            <td><form:errors path="password" cssStyle="color:red;margin:10px 0px;"/></td>
        </tr>
        <tr>
            <td><form:label path="role"><spring:message text="Права:"/></form:label></td>
            <td><form:input path="role"/></td>
            <td><form:errors path="role" cssStyle="color:red;margin:10px 0px;"/></td>
        </tr>
        <%--<tr>--%>
            <%--<td><form:label path="enabled"><spring:message text="enabled:"/></form:label></td>--%>
            <%--<td><form:input path="enabled"/></td>--%>
            <%--<td><form:errors path="enabled" cssStyle="color:red;margin:10px 0px;"/></td>--%>
        <%--</tr>--%>
            <td colspan="2">
                <c:if test="${user.id!=0}">
                    <input type="submit" value="<spring:message text="изменить"/>"/>
                    <%--<input type="reset" value="отмена">--%>
                </c:if>
                <c:if test="${user.id==0}">
                    <input type="submit" value="<spring:message text="добавить"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
<br>
<h3>Users List</h3>
<c:if test="${!empty listUsers}">
    <table class="tg">
        <tr>
            <th width="50">ID</th>
            <th width="100">Фамилия</th>
            <th width="100">Имя</th>
            <th width="100">Отчество</th>
            <th width="100">Логин</th>
            <th width="80">Пароль</th>
            <th width="120">Email</th>
            <th width="50">Права</th>
            <th width="60">Разрешение</th>
            <th width="25">Изменить</th>
            <th width="40">Удалить</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.surname}</td>
                <td>${user.firstname}</td>
                <td>${user.lastname}</td>
                <td>${user.login}</td>
                <td>${user.password}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td>${user.enabled}</td>
                <td><a href="<c:url value='/edit/${user.id}' />" >Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}' />" >Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>