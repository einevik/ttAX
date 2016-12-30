<%@ page contentType="text/html;charset=UTF-8" %>
<%@page session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<link href="/resources/style.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>${title}</title>
</head>
<body>


<jsp:include page="menu.jsp"/>

<c:if test="${pageContext.request.userPrincipal.name == null}">
    <h3>Войдите или зарегистрируйтесь.</h3>
</c:if>

<c:if test="${pageContext.request.userPrincipal.name != null}">

    <table>
        <tr>
            <td>Текущий пользователь : ${pageContext.request.userPrincipal.name}</td>
            <td><button id="myBtn" onclick="openWindow()">Изменить пароль</button></td>
        </tr>
    </table>

    <script src="<c:url value="/resources/popup.js" />" type="text/javascript"></script>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <table>
                <tr>
                <td><h3>Изменить пароль</h3></td>
                </tr>
                <tr>
                    <td>Старый пароль:</td>
                    <td><input type='text' name='username' value=''></td>
                </tr>
                <tr>
                    <td>Новый пароль:</td>
                    <td><input type='password' name='password' /></td>
                </tr>
            </table>
        </div>
    </div>

    <%--<script>--%>
        <%--var modal = document.getElementById('myModal');--%>
        <%--var btn = document.getElementById("myBtn");--%>
        <%--var span = document.getElementsByClassName("close")[0];--%>
        <%--btn.onclick = function() {--%>
            <%--modal.style.display = "block";--%>
        <%--}--%>
        <%--span.onclick = function() {--%>
            <%--modal.style.display = "none";--%>
        <%--}--%>
        <%--window.onclick = function(event) {--%>
            <%--if (event.target == modal) {--%>
                <%--modal.style.display = "none";--%>
            <%--}--%>
        <%--}--%>
    <%--</script>--%>

</c:if>
</body>
</html>