<%@ page contentType="text/html;charset=UTF-8" %>
<%@page session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://java.sun.com/jsf/html" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<link href="/resources/style.css" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/jquery.js" />" type="text/javascript"></script>
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
            <td>Текущий пользователь : </td>
            <td style="font-weight:bold">${pageContext.request.userPrincipal.name}</td>
            <td><button id="myBtn">Изменить пароль</button>&nbsp;<span class="status"></span></td>
        </tr>
    </table>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h3>Изменить пароль</h3>
            <table method="post" name="password-form" id="form-password">
                <%--<label>Current Password:</label> <br>--%>
                <%--<input type="password" name="password" id="password" value="" size="32" />--%>
                    <%--<br>--%>
                    <%--<br>--%>
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



    <h3>Messages:</h3>
        <table class="tg">
            <tr>
                <th width="100">Отправитель</th>
            <security:authorize access="hasAnyRole('admin')">
                <th width="100">Получатель</th>
            </security:authorize>
                <th width="100">Дата</th>
                <th width="100">Время</th>
                <th width="100">Тема</th>
                <th width="80">Прочитать Сообщение</th>
                <th width="80">Удалить сообщение</th>
            </tr>

        <security:authorize access="hasAnyRole('admin')">
            <c:forEach items="${listMessages}" var="messages">
                <tr>
                    <td>${messages.sender}</td>
                    <td>${messages.recipient}</td>
                    <td>${messages.date}</td>
                    <td>${messages.time}</td>
                    <td>${messages.theme}</td>
                        <td><a href="<c:url value='/edit/${messages.idMessage}' />" >Read</a></td>
                        <td><a href="<c:url value='/home/remove/${messages.idMessage}' />" >Delete</a></td>
                </tr>
            </c:forEach>
        </security:authorize>

            <security:authorize access="hasAnyRole('user')">
                <c:forEach items="${listMessagesByLogin}" var="messages">
                    <tr>
                        <td>${messages.sender}</td>
                        <td>${messages.date}</td>
                        <td>${messages.time}</td>
                        <td>${messages.theme}</td>
                            <td><a href="<c:url value='/edit/${messages.idMessage}' />" >Read</a></td>
                            <td><a href="<c:url value='/home/remove/${messages.idMessage}' />" >Delete</a></td>
                    </tr>
                </c:forEach>
            </security:authorize>
        </table>

    <script>
//        Window START
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
//        Window END

        $(function(){
            $("#passsubmit").click(function(){
                $(".error").hide();
                var hasError = false;
                var password = $("#password").val();
                var newpass = $("#new-password").val();
                var checkVal = $("#password-check").val();
                if (newpass == '') {
                    $("#password").after('<span class="error"> Please enter current password.</span>');
                    hasError = true;
                }
                if (newpass == '') {
                    $("#new-password").after('<span class="error"> Please enter new password.</span>');
                    hasError = true;
                } else if (checkVal == '') {
                    $("#password-check").after('<span class="error"> Please re-enter your password.</span>');
                    hasError = true;
                } else if (newpass != checkVal ) {
                    $("#password-check").after('<span class="error"> Passwords do not match.</span>');
                    hasError = true;
                }

                if(hasError == true) {
                    return false;
                }

                if(hasError == false) {
                    $(".status").html("<img src='/resources/loading.gif'><font color=gray> Checking availability...</font>");
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
                    modal.style.display = "none";
                };
            });

        });
    </script>

</c:if>
</body>
</html>