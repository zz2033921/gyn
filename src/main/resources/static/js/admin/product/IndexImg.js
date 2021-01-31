$(document).ready(function () {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "onclick": null,
        "showDuration": "400",
        "hideDuration": "1000",
        "timeOut": "7000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    let flag = true;
    $("#inlineCheckbox2").on('click', function () {
        if (flag) {
            $("input[name='inp-check-box']").prop("checked", true);
            flag = false;
        } else {
            $("input[name='inp-check-box']").prop("checked", false);
            flag = true;
        }
    });

});










/**
 * 设置首图
 */
function setProductIndexImg(){
    let proId = $("#pro-update-id")
    let src=null;
    $("input[name='img-item']:checked").each(function () {
        if ($(this).prop('checked')) {
            //如果当前属性为checked
            src = $(this).val();
        }
    });
    console.log(src);
    $.post("/admin/product/setIndexImg4Product",{
        proId:proId,
        indexImg:src
    },function (resp){
        if (resp.data) {
            swal(resp.message);
            setTimeout(function (){
                window.location.reload();
            },2000)
        } else {
            swal("发生未知名错误，请重试","重新操作",'error');
        }
    })
}