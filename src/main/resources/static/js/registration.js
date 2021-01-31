$(document).ready(function(){
    $('#register').on('hidden.bs.modal',function(){
        document.getElementById("registrationForm").reset();
        $("#register").find("input").removeClass("is-invalid");
        $("label.is-invalid").remove();
    });

    $("#registrationForm").keydown(function(event){
        if (event.keyCode == 13||event.keyCode == 27) {
            event.preventDefault();
        }
    });
    $("#registrationForm").validate({
        onkeyup: function(element) { $(element).valid(); },
        rules: {
            username:{
                required: true,
                minlength: 1
            },
            password:{
                required: true,
                minlength: 6
            },
            name:{
                required: true,
            },
            education:{
            },
            major:{
            },
            homePhone:{
                number:true,
                minlength: 10
            },
        },
        errorPlacement: function(error, element) {
            error.appendTo(element.parent().next("div"));
        },
        errorClass:"is-invalid",

        submitHandler:function(){
            user = $('#registrationForm').serialize();
            $.ajax(
                "/registrationOk",
                {
                    method:'post',
                    data:user,
                    success:function (data) {
                        alert(data.message);
                        $("#register").modal('hide');
                    }
                });
        }
    })


})