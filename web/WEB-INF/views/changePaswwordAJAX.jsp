<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<link href="/resources/style.css" rel="stylesheet" type="text/css">

<html>
<body>
<jsp:include page="menu.jsp"/>
<h2>Modal Example</h2>
<!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<!-- The Modal -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <h3>Добавить нового пользователя</h3>
        <span class="close">&times;</span>
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
    </div>

</div>
<script>
    // Get the modal
    var modal = document.getElementById('myModal');
    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    // When the user clicks the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>