$(document).ready(function() {
    $("#register").click(function() {
        var login = $("#login").val();
        var email = $("#email").val();
        var password = $("#password").val();
        if (login == '' || email == '' || password == '') {
            alert("Please fill all fields...!!!!!!");
        } else if ((password.length) <=2) {
            alert("Password should atleast 2 character in length...!!!!!!");
            // $('#password').after('<p>Phone number has to be 10 digits long.</p>');
        } else {
            $.post("regAJAX", {
                login: login,
                email: email,
                password: password
            },
                function(data) {
                if (data == 'You have Successfully Registered.....') {
                    $("form")[0].reset();
                }
                alert(data);
            });
        }
    });
});

