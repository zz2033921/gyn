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
        }
    });


});

/**
 * 保存一条推送消息
 */
function savePushNew() {
    let title = $('#push-title')
    let desc = $('#push-desc')
    let product = $('#sizeSelect')
    console.log(product.val());
    $.post('/admin/pushNew/save', {
        title: title.val(),
        desc: desc.val(),
        product: product.val()
    }, function (resp) {
        console.log(resp)
        if (resp.data) {
            //保存成功
            toastr.success(resp.message + ',即将前往添加商品图片', '提示');
            setTimeout(function () {
                window.location.href = '/admin/pushNew/addPushNewImg/' + resp.data
            }, 2000)
        } else {
            toastr.error(resp.message);
        }
    })
}











