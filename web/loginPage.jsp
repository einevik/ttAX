<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Регестрация</title>
</head>
    <div style="border: 1px solid #ccc;padding:5px;margin-bottom:20px;">
        <a href="registrPage.jsp">Зарегестрироваться</a> |
        <a href="mainPage.jsp">На гланвую</a> |
        <a href="adminPage.jsp">Управление пользователями</a>
    </div>
        <h2>Авторизация</h2>
        <table>
            <tr> <td>Login:</td> <td><input type="text" name="Login"></td></tr>
            <tr><td>Password:</td> <td><input type="password" name="Password"></td></tr>

            <tr><td colspan="2"><input name="submit" type="submit" value="Войти"></td></tr>
        </table>
    </body>

</html>
