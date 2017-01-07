<%@ page contentType="text/html;charset=UTF-8" %>
<%@page session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--<%@ taglib prefix="form" uri="http://java.sun.com/jsf/html" %>--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
            <%--<td><form:form action="/home/book" method="get" ><input type="submit" value="адрессная книга"></form:form></td>--%>
            <td><button id="myBtn">изменить пароль</button>&nbsp;<span class="status"></span></td>
        </tr>
    </table>
    <form:form action="/home/book" method="get" ><input type="submit" value="адрессная книга"></form:form>


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

    <h3>Messages:</h3>

        <table class="tg">
            <tr>
                <th id="itemSender" width="100"><a href="<c:url value='/home/sort_sender'/>">Отправитель</a></th>
            <security:authorize access="hasAnyRole('admin')">
                <th id="itemRecipient" width="100"><a href="<c:url value='/home/sort_recipient'/>">Получатель</a></th>
            </security:authorize>
                <th id="itemDate" datatype="timestamp" width="100"><a href="<c:url value='/home/sort_date'/>">Дата</a></th>
                <th id="itemTheme" width="100"><a href="<c:url value='/home/sort_theme'/>">Тема</a></th>
                <th id="itemText" width="100">Сообщение</th>
                <th width="80">Удалить сообщение</th>
            </tr>

            <c:forEach items="${listMessages}" var="messages">

            <tr onclick="myFunction(this)">
                <td align="center">${messages.sender}</td>
            <security:authorize access="hasAnyRole('admin')">
                <td align="center">${messages.recipient}</td>
            </security:authorize>
                <td align="center">${messages.date}</td>
                <td align="center">${messages.theme}</td>
                <td>${messages.text}</td>
                <td align="center"> <a href="<c:url value='/home/remove/${messages.idMessage}' />" >Delete</a></td>
            </tr>

            </c:forEach>

        </table>

    <script>

    </script>

</c:if>
</body>
</html>