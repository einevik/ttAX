<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<link href="/resources/style.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>Username Availability</title>
    <style type="text/css">
        .flable {
            color: black;
        }
        .status {
            font-family: verdana;
            font-size: 12px;
        }
        .login {
            color: blue;
        }
    </style>
    <script src="<c:url value="/resources/jquery.js" />" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#register").click(function() {
                var login = $("#login").val();
                var email = $("#email").val();
                var password = $("#password").val();
                if (login == '' || email == '' || password == '') {
                    alert("Please fill all fields...!!!!!!");
                } else if ((password.length) <=0) {
                    alert("Password should atleast 8 character in length...!!!!!!");
                } else {
                    $.post("regAJAX", {
                        login: login,
                        email: email,
                        password: password
                    }, function(data) {
                        if (data == 'You have Successfully Registered.....') {
                            $("form")[0].reset();
                        }
                        alert(data);
                    });
                }
            });
        });
    </script>
<body>
<jsp:include page="menu.jsp"/>
<h2>Modal Example</h2>
<!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<div class="container">
    <div class="main">
        <form class="form" method="post" >
            <h2>Create Registration Form Using jQuery</h2>
            <label>Name :</label>
            <input type="text" name="login" id="login">
            <label>Email :</label>
            <input type="text" name="email" id="email">
            <label>Password :</label>
            <input type="password" name="password" id="password">
            <input type="button" name="register" id="register" value="Register">
        </form>
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
</body>
</html>