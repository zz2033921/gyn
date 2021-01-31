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

    /*打折折率计算*/
    $('#sale-rate').bind('input propertychange', function() {
        let $rate = $("#sale-rate")
        let $oldPrice = $('#sale-proPrice');
        if ($rate.val().length===0){
            //证明清空了
            $oldPrice.val(localStorage.getItem("price"));
        }else{
            console.log($rate.val())
            console.log($oldPrice.val())
            $oldPrice.val(localStorage.getItem("price")*$rate.val()*0.01);
        }
    });

});


/**
 * 查看商品图片
 * @param proId
 */
function showProductImgs(proId){
    $.get('/admin/product/getImgs',{
        proId:proId
    },function (resp){
        console.log(resp);
        let $indicators = $(".carousel-indicators");
        let indicators = '';
        let $inner = $(".carousel-inner");
        let inner = '';
        for (let i = 0; i<resp.length;i++){
            if (i===0){
                indicators+='<li data-slide-to="'+i+'" data-target="#carousel2" class="active"></li>'
                inner+='<div class="item active">\n' +
                    '                                        <img alt="image" class="img-responsive" src="'+resp[i].imgUrl+'">\n' +
                    '                                        <div class="carousel-caption">\n' +
                    '                                            <p>'+resp[i].imgTitle+'</p>\n' +
                    '                                        </div>\n' +
                    '                                    </div>'
            }else{
                indicators+='<li data-slide-to="'+i+'" data-target="#carousel2"></li>';
                inner+='<div class="item">\n' +
                    '                                        <img alt="image" class="img-responsive" src="'+resp[i].imgUrl+'">\n' +
                    '                                        <div class="carousel-caption">\n' +
                    '                                            <p>'+resp[i].imgTitle+'</p>\n' +
                    '                                        </div>\n' +
                    '                                    </div>'
            }
        }
        $indicators.html('');
        $indicators.append(indicators);
        $inner.html('');
        $inner.append(inner);
    })
}

/**
 * 删除单个商品
 * @param proId proId
 */
function deleteProduct(proId){
    swal({
        title:"是否删除?",
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
    },function(){
        //正确按钮进行的操作点
        $.post("/admin/product/deleteProduct",{
            proId:proId
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
function batchDeleteProduct(){
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
        $.post("/admin/product/deleteBatchProduct", {
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

function showOneProduct(proId){
    window.location.href='/admin/product/showOneProduct/'+proId;
}

/**
 * 设置首页展示商品
 */
function setIndexProduct(){
    let selects = [];
    let count = 0;
    $("input[name='inp-check-box']:checked").each(function () {
        if ($(this).prop('checked')) {
            //如果当前属性为checked
            selects[count++] = $(this).val();
        }
    });
    if (selects.length === 0) {
        swal("您没有选中任何数据，请选中一个商品后重试！");
        return ;
    }
    if (selects.length >1) {
        swal("您选中的行超过两个，请选中一个商品展示在首页。");
        return ;
    }
    let proId = selects[0];
    window.location.href='/admin/product/setIndexProduct/'+proId;

}

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
        proId:proId.val(),
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

/**
 * 获取商品价格和名字
 * @param proId proId
 */
function showProductPriceAndName(proId){
    $.get('/admin/product/getProductNameAndPrice',{
        proId:proId
    },function (resp){
        console.log(resp);
        $("#sale-proName").val(resp.proTitle)
        $("#proPrice").val(resp.proPrice)
        $("#sale-proPrice").val(resp.proSalePrice)
        $("#sale-proId").val(resp.proId)
        localStorage.setItem("price",resp.proPrice)
    })
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