<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<link href="/resources/style.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>Address Book</title>
    <script src="<c:url value="/resources/jquery.js" />" type="text/javascript"></script>
    <script type="text/javascript">

            $(document).ready(function () {
//                $(".login").change(function () {
                $("#addButton").click(function () {
//                    var login = $(this).val();
                    var login = $("#idLogin").val();
                    if (login.length != 0) {
                        $(".status").html("<img src='/resources/loading.gif'><font color=gray></font>");
                        $.ajax({
                            type: "POST",
                            url: "checkAJAX",
                            data: "login=" + login,
                            success: function (msg) {
                                $(".status").ajaxComplete(function (event, request, settings) {
                                    $(".status").html(msg);
                                });
                            }
                        });
                    }
                    else {
                        $(".status").html("<font color=red>not empty</font>");
                    }

                });
            });

    </script>
</head>
<body>
<jsp:include page="menu.jsp"/>

<%--<div>--%>
    <%--<label class="flable">User Name :</label> <input type="text" class="login" />&nbsp;<span class="status"></span>--%>
<%--</div>--%>

<%--<table>--%>
    <%--<tr>--%>
        <%--<td>Адрессная книга</td>--%>
    <%--</tr>--%>
        <%--<td><input id="idLogin" name="idLogin" type="text" class="login" /></td>--%>
        <%--<td><button id="addButton">add...</button>&nbsp;<span class="status"></span></td>--%>
    <%--</tr>--%>
<%--</table>--%>


<h3>Адрессная книга</h3>
&nbsp;<span class="status"></span>
<table class="tg">
    <tr>
        <td><input id="idLogin" name="idLogin" type="text" class="login" /></td>
        <td align="center" ><button id="addButton">add...</button></td>
    </tr>

    <tr>
        <th width="100">Пользователь</th>
        <th width="80">Удалить</th>
    </tr>

    <c:forEach items="${listAddressBook}" var="addressBook">
        <tr>
            <td align="center">${addressBook.recipient}</td>
            <td align="center"> <a href="<c:url value='/home/remove/${messages.idMessage}' />" >Delete</a></td>
        </tr>
    </c:forEach>

</table>


</body>
</html>
