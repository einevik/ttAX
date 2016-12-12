<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Регестрация</title>
</head>
    <body>
    <div style="border: 1px solid #ccc;padding:5px;margin-bottom:20px;">
        <a href="mainPage.jsp">На гланвую</a> |
        <a href="loginPage.jsp">Войти</a>
    </div>
        <h2>Регестрация нового пользователя</h2>
            <table>
                <tr> <td>Фамилия:</td> <td><input type="text" name="Фамилия"></td></tr>
                <tr><td>Имя:</td> <td><input type="password" name="Имя"></td></tr>
                <tr><td>Отчество:</td> <td><input type="password" name="Отчество"></td></tr>
                <tr><td>Email:</td> <td><input type="password" name="Email"></td></tr>
                <tr> <td>Login:</td> <td><input type="text" name="Login"></td></tr>
                <tr><td>Password:</td> <td><input type="password" name="Password"></td></tr>

                <tr><td colspan="2"><input name="submit" type="submit" value="Войти"></td></tr>
            </table>

    </body>

</html>
