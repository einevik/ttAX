<%@page session="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head><title>Registration</title></head>


    <body>
    <jsp:include page="menu.jsp" />
    <h1>Registration</h1>

    <form name='f' action="${pageContext.request.contextPath}/register" method='POST'/>
    <table>
            <tr>
                <td>Surname:</td>
                <td><input type='text' name='surname' value=''></td>
            </tr>
            <tr>
                <td>First Name:</td>
                <td><input type='text' name='firstName' value=''></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><input type='text' name='lastName' value=''></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type='password' name='email' /></td>
            </tr>
            <tr>
                <td>Login:</td>
                <td><input type='text' name='login' value=''></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type='password' name='password' /></td>
            </tr>
            <tr>
                <td><input name="submitIn" type="submit" value="Sign Up" /></td>
            </tr>

        </table>

    </body>

</html>
