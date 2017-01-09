<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--<!DOCTYPE html>--%>
<link  href="<c:url value="/resources/style.css"/>" rel="stylesheet" type="text/css">
<%--<script src="<c:url value="/resources/popup.js" />" type="text/javascript"></script>--%>
<%--<script src="<c:url value="/resources/changePassword.js" />" type="text/javascript"></script>--%>
<script src="<c:url value="/resources/jquery.js" />" type="text/javascript"></script>

<html>
<body>
<jsp:include page="menu.jsp"/>

<button id="myBtn">Open Modal</button>
    <div id="myModal" class="modal">

        <div class="modal-content">
            <span class="close">&times;</span>
            <h3>Изменить пароль</h3>
            <table method="post" name="password-form" id="form-password">
                <label>Current Password:</label> <br>
                <input type="password" name="password" id="password" value="" size="32" />
                <br>
                <br>
                <label>New Password:</label> <br>
                <input type="password" name="new-password" id="new-password" value="" size="32" />
                <br>
                <br>
                <label>Re-Enter Password:</label> <br>
                <input type="password" name="password-check" id="password-check" value="" size="32" />
                <br>
                <br>
                <input type="submit" value="Submit" id="passsubmit">
            </table>
        </div>

    </div>

<script>
//    Modal Window START
    var modal = document.getElementById('myModal');
    var btn = document.getElementById("myBtn");
    var span = document.getElementsByClassName("close")[0];
    btn.onclick = function() {
        modal.style.display = "block";
    }
    span.onclick = function() {
        modal.style.display = "none";
    }
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
//    Modal Window END

    $(function(){
        $("#passsubmit").click(function(){
            $(".error").hide();
            var hasError = false;
            var password = $("#password").val();
            var newpass = $("#new-password").val();
            var checkVal = $("#password-check").val();
            if (newpass == '') {
                $("#new-password").after('<span class="error"> Please enter a password.</span>');
                hasError = true;
            } else if (checkVal == '') {
                $("#password-check").after('<span class="error"> Please re-enter your password.</span>');
                hasError = true;
            } else if (newpass != checkVal ) {
                $("#password-check").after('<span class="error"> Passwords do not match.</span>');
                hasError = true;
            }

            if(hasError == true) {return false;}

            if(hasError == false) {
                $.ajax({
                    type: "POST",
                    url: "changePassword",
                    data: {newpass:newpass},
                    success: function(msg){
                        $(".status").ajaxComplete(function(event, request, settings){
                            $(".status").html(msg);
                        });
                    }
                });
            };
        });

    });

</script>
</body>
</html>