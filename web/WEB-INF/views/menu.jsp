<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="border: 1px solid #ccc;padding:5px;margin-bottom:20px;">

    &nbsp;
    <a href="${pageContext.request.contextPath}/welcome">Home</a>

    <c:if test="${pageContext.request.userPrincipal.name == null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/userInfo">Sign In</a>

    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name == null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/register">Sign Up</a>

    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name != null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/userInfo">User Info</a>

    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name != null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/admin">Admin</a>

    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name != null}">

        &nbsp; | &nbsp;
        <a href="${pageContext.request.contextPath}/logout">Logout</a>

    </c:if>

</div>