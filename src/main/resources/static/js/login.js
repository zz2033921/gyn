$(document).ready(function () {
    $("#enter").click(function() {
        var username = $("#username1").val();
        var password = $("#password1").val();

        $.ajax(
            "/isUser",
            {
                method: 'post',
                data: {"username":username,"password":password},
                success: function (data) {
                        if(data.message=="success"){
                            window.location.href = "/index";
                        }
                        else{
                            window.location.href="/";
                        }
                },

            });
    })
})