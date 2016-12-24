<%@page session="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>

<head><title>Регистрация</title></head>

    <body>
    <jsp:include page="menu.jsp" />

    <c:if test="${not empty message}"><div class="message green">${message}</div></c:if>

    <form:form action="/regUser" modelAttribute="user">

        <table>
            <tr>
                <td><form:label path="login"><spring:message text="Логин:"/></form:label> </td>
                <td><form:input path="login"/> </td>
                <td><form:errors path="surname" cssClass="error" /></td>
            </tr>

            <tr>
                <td><form:label path="email"><spring:message text="email:"/></form:label></td>
                <td><form:input path="email"/></td>
                <td><form:errors path="email" cssClass="error" /></td>
            </tr>
        </table>

        <br/>
        <input type="submit" value="Submit" />
    </form:form>
    </body>

</html>
