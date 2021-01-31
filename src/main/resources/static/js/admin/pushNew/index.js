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
 * 删除单个推新历史
 * @param proId proId
 */
function deleteOnePushNew(pushId){
    swal({
        title:"是否删除?",
        text:"可以在回收站内可恢复",
        type:"warning",
        //是否显示取消按钮
        showCancelButton:true,
        //按钮内容
        cancelButtonText:'取 消',
        cancelButtonColor:'#b9b9b9',
        showConfirmButton:true,
        confirmButtonText:'确 认',
        confirmButtonColor:"#dd6b55",
        //点击返回上一步操作
        closeOnConfirm:false,
        closeOnCancel:true
    },function(){
        //正确按钮进行的操作点
        $.post("/admin/pushNew/deleteOnePushNew",{
            pushId:pushId
        },function (resp){
            if (resp.data){
                toastr.success(resp.message,'提示')
                setTimeout(function () {
                    window.location.reload();
                },2000)
            }else{
                toastr.error(resp.message,'提示')
            }
        })
    });

}
function batchDeletePushNew(){
    //批量删除
    let selects = [];
    let count = 0;
    $("input[name='inp-check-box']:checked").each(function () {
        if ($(this).prop('checked')) {
            //如果当前属性为checked
            selects[count++] = $(this).val();
        }
    });
    if (selects.length === 0) {
        swal("您没有选中任何数据，请选中后重试！");
    }
    console.log(selects);
    swal({
        title:"是否删除",
        text:"可以在回收站内恢复商品",
        type:"warning",
        //是否显示取消按钮
        showCancelButton:true,
        //按钮内容
        cancelButtonText:'取 消',
        cancelButtonColor:'#b9b9b9',
        showConfirmButton:true,
        confirmButtonText:'确 认',
        confirmButtonColor:"#dd6b55",
        //点击返回上一步操作
        closeOnConfirm:false,
        closeOnCancel:true
    },function(){//正确按钮进行的操作点
        $.post("/admin/pushNew/deleteBatchPushNew", {
            selects: selects,
        }, function (response) {
            if (response.data) {
                swal(response.message);
                setTimeout(function (){
                    window.location.reload();
                },2000)
            } else {
                swal("发生未知名错误，请重试","重新操作",'error');
            }
        })
    });
}

function showOnePushNew(pushId){
    window.location.href='/admin/pushNew/showOnePushNew/'+pushId;
}
function modifyOnePushNew(pushId){
    window.location.href='/admin/pushNew/modifyOnePushNew/'+pushId;
}





/**
 * 更新产品的信息
 */
function saleUpdateProduct(){
    let proId = $("#sale-proId").val();
    let proSalePrice = $("#sale-proPrice").val()
    let proRate = $("#sale-rate").val()
    console.log(proId+proSalePrice+proRate)
    $.post('/admin/product/sale/update',{
        proId:proId,
        proSalePrice:proSalePrice,
        proSalePercent:proRate
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