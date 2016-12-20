<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head><title>Авторизация</title></head>
<body>
<jsp:include page="menu.jsp" />


<%--<h2>Страница авторизации</h2>--%>
<!-- /login?error=true -->
<c:if test="${param.error == 'true'}">
    <div style="color:red;margin:10px 0px;">
        Неправильный логин или пароль!!!<br />
        <%--Reason :  ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}--%>
    </div>
</c:if>

<%--<h3>Введите логин и пароль:</h3>--%>

    <form name='f' action="${pageContext.request.contextPath}/spring_security_check" method='POST'>
        <table>
            <tr>
                <td>Логин:</td>
                <td><input type='text' name='username' value=''></td>
            </tr>
            <tr>
                <td>Пароль:</td>
                <td><input type='password' name='password' /></td>
            </tr>
        </table>
        <tr>
            <td><input name="submitIn" type="submit" value="Войти"/> или</td>
            <td><input name="submitUp" type="submit" value="Зарегистрироваться" formaction="register" formmethod="get" /></td>
        </tr>
    </form>

</body>
</html>