<%@ page contentType="text/html;charset=UTF-8" %>
<%@page session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--<%@ taglib prefix="form" uri="http://java.sun.com/jsf/html" %>--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<link  href="<c:url value="/resources/style.css"/>" rel="stylesheet" type="text/css">
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
    &nbsp;
    <%--<form:form action="/ttAX/home/book" method="get" ><input type="submit" value="Адрессная книга"></form:form>--%>
    <a href="${pageContext.request.contextPath}/book">Адрессная книга</a>

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

        <table id="homeTable" class="tg">
            <tr>
                <th  width="100"><a href="<c:url value='/home/sort_sender'/>">Отправитель</a></th>
            <security:authorize access="hasAnyRole('admin')">
                <th id="itemRecipient" width="100"><a href="<c:url value='/home/sort_recipient'/>">Получатель</a></th>
            </security:authorize>
                <th id="itemDate" datatype="timestamp" width="100"><a href="<c:url value='/home/sort_date'/>">Дата</a></th>
                <th id="itemTheme" width="100"><a href="<c:url value='/home/sort_theme'/>">Тема</a></th>
                <th id="itemText" width="100">Сообщение</th>
                <th width="80">Удалить сообщение</th>
            </tr>

            <c:forEach items="${listMessages}" var="messages">
            <tr>
                <td class="itemSender" align="center" >${messages.sender}</td>
            <security:authorize access="hasAnyRole('admin')">
                <td align="center">${messages.recipient}</td>
            </security:authorize>
                <td class="itemDate" align="center" >${messages.date}</td>
                <td class="itemTheme" align="center" >${messages.theme}</td>
                <td class="itemText" style="color:blue;text-decoration: underline;"><a class="infoMessage">${messages.text}</a></td>
                <td class="openButtonSend" id="openButtonSend" align="center"> <a href="<c:url value='/home/remove/${messages.idMessage}' />" >удалить</a></td>
                <%--<td align="center"><input type="button" id="openButtonSend" class="openButtonSend" onclick="myFunction()" value="написать"/></td>--%>
            </tr>
            </c:forEach>

        </table>

    <dialog id="myDialog" class="home-modal">
        <h3>Информация</h3>
        <table method="post" name="send-form" id="send-password">
            <tr>
                <td><label>Отправитель</label></td>
            </tr>
            <tr>
                <td><input type="text" name="theme" id="from" disabled="true" readonly="true" value="" size="26" /></td>
            </tr>
            <tr>
                <td><label>Тема</label></td>
            </tr>
            <tr>
                <td><input type="text" name="theme" id="theme" disabled="true" readonly="true" value="" size="26" /></td>
            </tr>
            <tr>
                <td><label>Дата</label></td>
            </tr>
            <tr>
                <td><input type="text" name="theme" id="data" disabled="true" readonly="true" value="" size="26" /></td>
            </tr>

            <tr>
                <td><label>Сообщение</label></td>
            </tr>
            <tr>
                <td><div><textarea class="writeMessages" id="readText" disabled="true" readonly="true" ></textarea></div></td>
            </tr>

            <tr>
                <td><input type="submit" value="Отправить" id="sendButton">&nbsp;<input type="submit" value="Закрыть" onclick="closeDialog()"></td>
            </tr>
        </table>
    </dialog>

    <script>

//        $("#homeTable td").click(function(){
//            var row = $(this).closest("tr");    // Find the row
//            var itemText = row.find(".itemText").text(); // Find the text
//            alert(itemText);
//        });

    function closeDialog() {
        document.getElementById("myDialog").close();
    }

//        $("#homeTable td").click(function(){
    $(".infoMessage").click(function() {

        document.getElementById("myDialog").show();

        var row = $(this).closest("tr");    // Find the row
        var itemSender = row.find(".itemSender").text(); // Find the text
        var itemDate = row.find(".itemDate").text(); // Find the text
        var itemTheme = row.find(".itemTheme").text(); // Find the text
        var itemText = row.find(".itemText").text(); // Find the text

        document.getElementById("from").setAttribute('value',itemSender);
        document.getElementById("data").setAttribute('value',itemDate);
        document.getElementById("theme").setAttribute('value',itemTheme);
        document.getElementById("readText").value = itemText;

    });

    </script>

</c:if>
</body>
</html>