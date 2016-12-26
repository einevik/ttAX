<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<link href="/resources/style.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>Username Availability</title>
    <script src="<c:url value="/resources/jquery.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/addUser.js" />" type="text/javascript"></script>

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

</body>
</html>