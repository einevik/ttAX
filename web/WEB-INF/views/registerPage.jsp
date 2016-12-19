<%@page session="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head><title>Регистрация</title></head>


    <body>
    <jsp:include page="menu.jsp" />
    <%--<h2>Страница регистрации нового пользователя</h2>--%>

        <form name='f' action="${pageContext.request.contextPath}/register" method='POST'/>
        <table>
                <tr>
                    <td>Фамилия:</td>
                    <td><input type='text' name='surname' value=''></td>
                </tr>
                <tr>
                    <td>Имя:</td>
                    <td><input type='text' name='firstName' value=''></td>
                </tr>
                <tr>
                    <td>Отчество:</td>
                    <td><input type='text' name='lastName' value=''></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type='password' name='email' /></td>
                </tr>
                <tr>
                    <td>Логин:</td>
                    <td><input type='text' name='login' value=''></td>
                </tr>
                <tr>
                    <td>Пароль:</td>
                    <td><input type='password' name='password' /></td>
                </tr>
        </table>
                <tr>
                    <td><input name="submitIn" type="submit" value="Зарегистрироваться" /></td>
                </tr>
    </body>

</html>
