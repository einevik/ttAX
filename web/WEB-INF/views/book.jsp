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
        <th width="80">Написать</th>
        <th width="80">Удалить</th>
    </tr>

    <c:forEach items="${listAddressBook}" var="addressBook">
        <tr>
            <%--<td align="center" id="idRowBook">${addressBook.idAddressbook}</td>--%>
            <td align="center" class="recipient">${addressBook.recipient}</td>
            <td align="center"><input type="button" id="openButtonSend" class="openButtonSend" onclick="openSend()" value="отправить"/></td>
            <td align="center"><a href="<c:url value='/home/book/remove/${addressBook.idAddressbook}' />" >Delete</a></td>
        </tr>
    </c:forEach>

</table>

<form id="myModal" class="modal">
    <div class="send-modal">
        <span class="close">&times;</span>
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
                <td><input type="submit" value="Отправить" id="sendButton"><input type="submit" value="reset" id="btnReset"></td>
            </tr>
        </table>
    </div>
</form>

<script>

    var modal = document.getElementById('myModal');
    var span = document.getElementsByClassName("close")[0];
    var sendButton = document.getElementById('sendButton');

    span.onclick = function() {
        document.getElementById('myModal').reset();
        modal.style.display = "none";
    }
    window.onclick = function(event) {
        if (event.target == modal) {
            document.getElementById('myModal').reset();
            modal.style.display = "none";
        }
    }

    $(".openButtonSend").click(function() {

        modal.style.display = "block";
        var row = $(this).closest("tr");    // Find the row
        var nameRecipient = row.find(".recipient").text(); // Find the text
        var sendTxt = $("#sendText").val();
        var theme = $("#theme").val();

        document.getElementById("whom").setAttribute('value',nameRecipient);

//        $(document).ready(function () {
            $("#sendButton").click(function () {
                    $.ajax({
                        type: "POST",
                        url: "/sendMessage",
                        data: {sendTxt:sendTxt, theme:theme, nameRecipient:nameRecipient },
                        success: function () {
                            document.getElementById('myModal').reset();
                        }
                    });
                modal.style.display = "none";
            });
//        });
    });

</script>

</body>
</html>
