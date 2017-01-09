<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<link  href="<c:url value="/resources/style.css"/>" rel="stylesheet" type="text/css">
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
        <h2>Изменть права пользователя</h2>
        <c:url var="addAction" value="/user/edit" ></c:url>
    </c:when>
</c:choose>


<form:form action="${addAction}" modelAttribute="user">
    <table>
            <tr>
                <%--<td><form:label path="id"><spring:message text="ID"/></form:label></td>--%>
                <%--<td><form:input path="id" readonly="true" size="8"  disabled="true"/></td>--%>
                <form:hidden path="id"/>
            </tr>
            <c:if test="${user.id==0}">
            <tr>
                <td><form:label path="surname"><spring:message text="Фамилия:"/></form:label></td>
                <td><form:input path="surname"/></td>
                <td><form:errors path="surname" cssStyle="color:red;"/></td>
            </tr>
        <tr>
            <td><form:label path="firstname"><spring:message text="Имя:"/></form:label></td>
            <td><form:input path="firstname"/></td>
            <td><form:errors path="firstname" cssStyle="color:red;"/></td>
        </tr>
        <tr>
            <td><form:label path="lastname"><spring:message text="Отчество:"/></form:label></td>
            <td><form:input path="lastname"/></td>
            <td><form:errors path="lastname" cssStyle="color:red;"/></td>
        </tr>
        <tr>
            <td><form:label path="email"><spring:message text="Email:"/></form:label></td>
            <td><form:input path="email"/></td>
            <td><form:errors path="email" cssStyle="color:red;"/></td>
        </tr>
        <tr>
            <td><form:label path="login"><spring:message text="Логин:"/></form:label></td>
            <td><form:input path="login"/></td>
            <%--<td><div style="color:red;"><p>${message}</p></div></td>--%>
            <td><div style="color:red;"><p>${message} </p></div><form:errors path="login" cssStyle="color:red;"/></td>
        </tr>
        <tr>
            <td><form:label path="password"><spring:message text="Пароль:"/></form:label></td>
            <td><form:password path="password"/></td>
            <td><form:errors path="password" cssStyle="color:red;"/></td>
        </tr>
        <tr>
            <td><form:label path="confrimpassword"><spring:message text="Повтор пароля:"/></form:label></td>
            <td><form:password path="confrimpassword"/></td>
            <td><form:errors path="confrimpassword" cssStyle="color:red;"/><form:errors cssStyle="color:red;"/></td>
        </tr>
            </c:if>
            <c:if test="${user.id!=0}">
        <tr>
            <td><form:label path="login"><spring:message text="Логин:"/></form:label></td>
            <td><form:input path="login" readonly="true" disabled="true"/></td>
            <td><div style="color:red;"><p>${message} </p></div><form:errors path="login" cssStyle="color:red;"/></td>
        </tr>
        <tr>
            <td><form:label path="roles.role"><spring:message text="Права:"/></form:label></td>
            <td><form:input path="roles.role" /></td>
            <td><form:errors path="roles.role" cssStyle="color:red;"/></td>
        </tr>
            </c:if>
            <td colspan="2">
                <c:if test="${user.id!=0}">
                    <input type="submit" value="<spring:message text="изменить"/>"/>
                    <input type="submit" value="<spring:message text="отмена"/>" formaction="/users" formmethod="get">
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
            <%--<th width="50">ID</th>--%>
            <th width="100">Фамилия</th>
            <th width="100">Имя</th>
            <th width="100">Отчество</th>
            <th width="100">Логин</th>
            <%--<th width="80">Пароль</th>--%>
            <th width="120">Email</th>
            <th width="50">Права</th>
            <%--<th width="60">Разрешение</th>--%>
            <th width="25">Изменить права</th>
            <th width="40">Удалить пользователя</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <%--<td>${user.id}</td>--%>
                <td>${user.surname}</td>
                <td>${user.firstname}</td>
                <td>${user.lastname}</td>
                <td align="center">${user.login}</td>
                <%--<td>${user.password}</td>--%>
                <td>${user.email}</td>
                <td align="center">${user.roles.role}</td>
                <%--<td>${user.enabled}</td>--%>
                <td align="center"><a href="<c:url value='/edit/${user.id}' />" >изменить</a></td>
                <td align="center"><a href="<c:url value='/remove/${user.id}' />" >удалить</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>