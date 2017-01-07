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
</head>
<body>
<jsp:include page="menu.jsp"/>

<h3>Адрессная книга</h3>
&nbsp;<span class="status"></span>
<table class="tg">
    <tr>
        <td><input id="idLogin" name="idLogin" type="text" class="login" /></td>
        <td align="center" ><button id="addButton">add...</button></td>
    </tr>

    <tr>
        <th width="100">Пользователь</th>
        <th width="80">Написать</th>
        <th width="80">Удалить</th>
    </tr>

    <c:forEach items="${listAddressBook}" var="addressBook">
        <tr>
            <td align="center">${addressBook.recipient}</td>
            <td align="center"> <a href="<c:url value='/home/bool/remove/${addressBook.idAddressbook}' />" ></a></td>
            <td align="center"> <a href="<c:url value='/home/bool/remove/${addressBook.idAddressbook}' />" >Delete</a></td>
        </tr>
    </c:forEach>

</table>


</body>
</html>
