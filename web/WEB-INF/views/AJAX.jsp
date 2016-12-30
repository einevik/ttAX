<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--<!DOCTYPE html>--%>
<link href="/resources/style.css" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/popup.js" />" type="text/javascript"></script>

<html>
<body>
<jsp:include page="menu.jsp"/>
<h2>Modal Example</h2>
<!-- Trigger/Open The Modal -->
<button id="myBtn" onclick="openWindow()">Open Modal</button>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h3>Изменить пароль</h3>
        <table>
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
    <%--// Get the modal--%>
    <%--var modal = document.getElementById('myModal');--%>
    <%--// Get the button that opens the modal--%>
    <%--var btn = document.getElementById("myBtn");--%>
    <%--// Get the <span> element that closes the modal--%>
    <%--var span = document.getElementsByClassName("close")[0];--%>
    <%--// When the user clicks the button, open the modal--%>
    <%--btn.onclick = function() {--%>
        <%--modal.style.display = "block";--%>
    <%--}--%>
    <%--// When the user clicks on <span> (x), close the modal--%>
    <%--span.onclick = function() {--%>
        <%--modal.style.display = "none";--%>
    <%--}--%>
    <%--// When the user clicks anywhere outside of the modal, close it--%>
    <%--window.onclick = function(event) {--%>
        <%--if (event.target == modal) {--%>
            <%--modal.style.display = "none";--%>
        <%--}--%>
    <%--}--%>
<%--</script>--%>
</body>
</html>