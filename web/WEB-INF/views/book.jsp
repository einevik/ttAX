<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<link href="/resources/style.css" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/jquery.js" />" type="text/javascript"></script>
<html>
<head>
    <title>Address Book</title>
</head>
<body>
<jsp:include page="menu.jsp"/>

<h3>Адрессная книга</h3>
<form:form action="/home" method="get" ><input type="submit" value="Назад"></form:form>
&nbsp;
<form:form action="/home/book/add" modelAttribute="addressBook">
    <table>
        <tr>
            <td><form:label path="recipient"><spring:message text="Новый пользователь"/></form:label></td>
        </tr>
        <tr>
            <td><form:input path="recipient"/></td>
            <td><input type="submit" value="add..."></td>
            <td><form:errors path="recipient" cssStyle="color:red;"/></td>
        </tr>

    </table>
</form:form>

<table class="tg" id="tableBook">
    <tr>
        <%--<th width="50">id</th>--%>
        <th width="100">Пользователь</th>
        <th width="80">Написать сообщение</th>
        <th width="80">Удалить сообщение</th>
    </tr>

    <c:forEach items="${listAddressBook}" var="addressBook">
        <tr>
                <%--<td align="center" id="idRowBook">${addressBook.idAddressbook}</td>--%>
            <td align="center" class="recipient">${addressBook.recipient}</td>
            <td align="center"><input type="button" id="openButtonSend" class="openButtonSend" onclick="myFunction()" value="написать"/></td>
            <td align="center"><a href="<c:url value='/home/book/remove/${addressBook.idAddressbook}' />" >удалить</a></td>
        </tr>
    </c:forEach>

</table>

<%--<div id="myModal" class="modal" name="send-form">--%>
    <%--<div class="send-modal">--%>
        <%--<span class="close">&times;</span>--%>
        <%--<h3>Отправить сообщение</h3>--%>
        <%--<table method="post" name="send-form" id="send-password">--%>
            <%--<tr>--%>
                <%--<td><label>Кому</label></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td><input type="text" name="theme" id="whom" disabled="true" readonly="true" value="" size="26" /></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td><label>Тема</label></td>--%>
            <%--</tr>--%>

            <%--<tr>--%>
                <%--<td><input type="text" name="theme" id="theme" value="" size="26" /></td>--%>
            <%--</tr>--%>

            <%--<tr>--%>
                <%--<td><label>Сообщение</label></td>--%>
            <%--</tr>--%>

            <%--<tr>--%>
                <%--<td><div><textarea class="writeMessages" id="sendText"></textarea></div></td>--%>
            <%--</tr>--%>

            <%--<tr>--%>
                <%--<td><input type="submit" value="Отправить" id="sendButton"></td>--%>
            <%--</tr>--%>
        <%--</table>--%>
    <%--</div>--%>
<%--</div>--%>

<dialog id="myDialog" class="send-modal">
        <h3>Отправить сообщение</h3>
        <table method="post" name="send-form" id="send-password">
            <tr>
                <td><label>Кому</label></td>
            </tr>
            <tr>
                <td><input type="text" name="theme" id="whom" disabled="true" readonly="true" value="" size="26" /></td>
            </tr>
            <tr>
                <td><label>Тема</label></td>
            </tr>

            <tr>
                <td><input type="text" name="theme" id="theme" value="" size="26" /></td>
            </tr>

            <tr>
                <td><label>Сообщение</label></td>
            </tr>

            <tr>
                <td><div><textarea class="writeMessages" id="sendText"></textarea></div></td>
            </tr>

            <tr>
                <td><input type="submit" value="Отправить" id="sendButton">&nbsp;<input type="submit" value="Закрыть" onclick="closeDialog()"></td>
            </tr>
        </table>
</dialog>

<script>

    function closeDialog() {
        document.getElementById("myDialog").close();
    }

    $(".openButtonSend").click(function() {
        document.getElementById("myDialog").show();

        var row = $(this).closest("tr");    // Find the row
        var nameRecipient = row.find(".recipient").text(); // Find the text
        document.getElementById("whom").setAttribute('value',nameRecipient);
        $(document).ready(function () {
            $("#sendButton").click(function () {

                var sendText = $("#sendText").val();
                var theme = $("#theme").val();
                $.ajax({
                    type: "POST",
                    url: "/sendMessage",
                    data: {sendText:sendText, theme:theme, nameRecipient:nameRecipient},
                    success: function () {
                        document.getElementById('myModal').reset();
                    }
                });
                modal.style.display = "none";
            });
        });
    });
</script>

</body>
</html>
