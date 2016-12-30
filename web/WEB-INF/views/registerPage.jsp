<%@page session="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>

<head><title>Регистрация</title></head>

    <body>
    <jsp:include page="menu.jsp" />

    <form:form action="/regUser" modelAttribute="user">
        <table>
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
                <td><div style="color:red;"><p>${message}</p></div><form:errors path="login" cssStyle="color:red;"/></td>
            </tr>
            <tr>
                <td><form:label path="password"><spring:message text="Пароль:"/></form:label></td>
                <td><form:password path="password" /></td>
                <td><form:errors path="password" cssStyle="color:red;"/></td>
            </tr>
            <tr>
                <td><form:label path="confrimpassword"><spring:message text="Повтор пароля:"/></form:label></td>
                <td><form:password path="confrimpassword"/></td>
                <td><form:errors path="confrimpassword" cssStyle="color:red;"/><form:errors cssStyle="color:red;"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Submit" /></td>
            </tr>
        </table>
    </form:form>
    </body>

</html>
