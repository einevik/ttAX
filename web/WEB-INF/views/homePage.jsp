<%@ page contentType="text/html;charset=UTF-8" %>
<%@page session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
        <h3>Текущий пользователь : ${pageContext.request.userPrincipal.name}</h3>
    </c:if>

    <security:authorize access="hasAnyRole('admin')">
        <a href="${pageContext.request.contextPath}/users">Управление пользователями</a>
    </security:authorize>

</br>
</br>

<script language="JavaScript">
    function checkSearch() {
        $(document).ready(function() {
            document.VendorEditListForm.direction.value = "Search";
            $.ajax({
                data: $('#frmAPVendorEdit').serialize(),
                type: $('#frmAPVendorEdit').attr('method'),
                url: $('#frmAPVendorEdit').attr('action'),
                success: function(response) {
                    $('#testResult').html(response);
                }
            });
            return false;
        });
    }
</script>

</body>
</html>