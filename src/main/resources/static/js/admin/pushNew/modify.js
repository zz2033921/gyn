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
    $("#sizeSelect").selectpicker();
    $(window).on('load', function () {
        $("#sizeSelect").selectpicker('val', '');
        $('#sizeSelect').selectpicker('refresh');
    });
    /**
     * 尺寸
     */
    $.ajax({
        type: 'get',
        url: "/admin/product/list",
        dataType: 'json',
        success: function (data) {
            console.log(data)
            let param = data[0];
            var select = $("#sizeSelect");
            for (var i = 0; i < data.length; i++) {

                if (data[i] == param) {
                    select.append('<option value="' + data[i].proId + '" title="' + data[i].proTitle + '">' + data[i].proTitle + '</option>');
                } else {
                    select.append("<option value='" + data[i].proId + "'>" + data[i].proTitle + "</option>");
                }

                select.selectpicker('refresh');
                select.selectpicker('render');
            }
        }});




});

function updatePushNew(){
    let pushId = $('#push-id').val()
    let pushTitle = $('#push-title').val()
    let pushDesc = $('#push-desc').val()
    //以上是必须传输的。
    let transProduct = null;
    let product = $('#sizeSelect').val()
    let preProduct = $('#push-pro').val()
    if (product!==undefined){
        //用户已经选择了
        transProduct = product
    }else{
        transProduct=preProduct
    }
    $.post("/admin/pushNew/update",{
        pushId:pushId,
        pushTitle:pushTitle,
        pushDesc:pushDesc,
        transProduct:transProduct
    },function (resp){
        console.log(resp)
        if (resp.data){
            //保存成功
            toastr.success(resp.message+',即将前往修改商品图片','提示');
            setTimeout(function (){
                window.location.href='/admin/pushNew/modifyPushNewImg/'+resp.data
            },2000)
        }else{
            toastr.error(resp.message);
        }
    })
}
function updatePushNewImg(){
    window.location.href='/admin/pushNew/modifyPushNewImg/'+$('#push-id').val();
}








