<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<link href="/resources/style.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>Username Availability</title>
    <script src="<c:url value="/resources/jquery.js" />" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".login").change(function(){
                var login = $(this).val();
//                Кол-во символов
                if(login.length >= 3){
                    $(".status").html("<img src='/resources/loading.gif'><font color=gray> Checking availability...</font>");
                    $.ajax({
                        type: "POST",
                        url: "checkAJAX",
                        data: "login="+ login,
                        success: function(msg){
                            $(".status").ajaxComplete(function(event, request, settings){
                                $(".status").html(msg);
                            });
                        }
                    });
                }
                else{

                    $(".status").html("<font color=red>Username should be <b>3</b> character long.</font>");
                }

            });
        });
    </script>
</head>
<body>
<jsp:include page="menu.jsp"/>

<div>
    <label class="flable">User Name :</label> <input type="text" class="login" />&nbsp;<span class="status"></span>
</div>
</body>
</html>
