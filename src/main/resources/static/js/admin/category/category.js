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
 * 保存一个商品分类
 */
function saveCategory(){
    let desc = $('#cat-name').val();
    if (desc.length===0){
        toastr.info('请填写商品分类名称','提示')
        $('#cat-name').focus();
        return;
    }
    $.post("/admin/category/save",{
        desc : desc
    },function (resp) {
        console.log(resp)
        if (resp.data){
            $('#myModal').modal('hide');
            toastr.success(resp.message,'提示')
            setTimeout(function (){
                window.location.reload();
            },4000)
        }else{
            toastr.error(resp.message,'提示')
        }
    })
}

/**
 * 删除批量
 */
function batchDelete(){
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
        text:"",
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
        $.post("/admin/category/deleteSome", {
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

/**
 * 显示一个分类
 * @param id id
 */
function showCategory(id){
    $.get("/admin/category/get",{
        id:id
    },function (resp) {
        console.log(resp)
        $("#cat-id-update").val(resp.data.catId)
        $("#cat-name-update").val(resp.data.catDesc);
    })
}

/**
 * 修改一个商品
 */
function updateCategory(){
    let descElement = $("#cat-name-update")
    let id = $("#cat-id-update").val()
    let desc = descElement.val();
    if (desc.length===0){
        toastr.info('请填写商品名称','提示')
        descElement.focus();
        return ;
    }
    if (id!==null){
        //发出请求
        $.post("/admin/category/update",{
            catId:id,
            catDesc:desc
        },function (resp){
            console.log(resp)
            if (resp.data){
                $('#updateModal').modal('hide');
                toastr.success(resp.message,'提示')
                setTimeout(function (){
                    window.location.reload();
                },4000)
            }else{
                toastr.error(resp.message,'提示')
            }
        })
    }else{
        toastr.error('未知名错误，请稍后重试','提示')
    }
}

/**
 * 删除一个商品分类
 */
function deleteCategory(id){
    $.get('/admin/category/delete',{
        id:id
    },function (resp){
        console.log(resp)
        if (resp.data){
            toastr.success(resp.message,'提示')
            setTimeout(function () {
                window.location.reload();
            },4000)
        }else{
            toastr.error(resp.message,'提示')
        }

    })
}