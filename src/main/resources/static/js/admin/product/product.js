$(document).ready(function () {
    $(".dataTables-example").dataTable();
    $("#sizeSelect").selectpicker();
    $("#colorSelect").selectpicker();
    $(window).on('load', function () {
        $("#sizeSelect").selectpicker('val', '');
        $('#sizeSelect').selectpicker('refresh');
    });
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
    /**
     * 尺寸
     */
    $.ajax({
        type: 'get',
        url: "/admin/size/list",
        dataType: 'json',
        success: function (data) {
            console.log(data)
            let param = data[0];
            var select = $("#sizeSelect");
            for (var i = 0; i < data.length; i++) {
                if (data[i] == param) {
                    select.append('<option value="' + data[i].sizeId + '" >' + data[i].sizeDesc + '</option>');
                } else {
                    select.append("<option value='" + data[i].sizeId + "'>"
                        + data[i].sizeDesc + "</option>");
                }
            }
            select.selectpicker('refresh');
            select.selectpicker('render');
        }
    });
    /**
     * 颜色
     */
    $.ajax({
        type: 'get',
        url: "/admin/color/list",
        dataType: 'json',
        success: function (data) {
            console.log(data)
            let param = data[0];
            var select = $("#colorSelect");
            for (var i = 0; i < data.length; i++) {
                if (data[i] == param) {
                    select.append('<option value="' + data[i].colId + '" >' + data[i].colDesc + '</option>');
                } else {
                    select.append("<option value='" + data[i].colId + "'>"
                        + data[i].colDesc + "</option>");
                }
            }
            $('#colorSelect').selectpicker('refresh');
            $('#colorSelect').selectpicker('render');
        }
    });
    /**
     * 分类商品
     */
    $.ajax({
        type: 'get',
        url: "/admin/category/list",
        dataType: 'json',
        success: function (data) {
            console.log(data)
            let select = $("#categorySelect");
            for (var i = 0; i < data.length; i++) {
               select.append('<option value="' + data[i].catId + '" >' + data[i].catDesc + '</option>');
            }
            select.selectpicker('refresh');
            select.selectpicker('render');
        }
    });
});
/**
 * 保存一个商品分类
 */
function saveCategory(){
    let desc = $('#cat-name').val();
    $.post("/admin/category/save", {
        desc: desc,
    }, function (resp) {
        if (resp.data !== null) {
            toastr.success(resp.message, "提示");
            $("#cat-name").val('')
            $('#categoryModal').modal('hide');
            $('#categorySelect').selectpicker('refresh');
            $('#categorySelect').selectpicker('render');
            //查找所有的数据动态刷新到表格内
            refreshCategorySelect()
        } else {
            toastr.error(resp.message, '提示')
        }
    })
}
//动态渲染datatabls,保存尺寸信息
function saveSize() {
    let name = $("#size-name").val();
    $.post("/admin/size/save", {
        sizeDesc: name,
    }, function (resp) {
        if (resp.data !== null) {
            toastr.success(resp.message, "提示");
            $("#size-name").val('')
            $('#myModal').modal('hide');
            $('#sizeSelect').selectpicker('refresh');
            $('#sizeSelect').selectpicker('render');
            //查找所有的数据动态刷新到表格内
            refreshSizeSelection()
        } else {
            toastr.error(resp.message, '提示')
        }
    })

}
function refreshCategorySelect(){
    $.ajax({
        type: 'get',
        url: "/admin/category/list",
        dataType: 'json',
        success: function (data) {
            let select = $("#categorySelect");
            let deviceStr = "";
            for (let i = 0; i < data.length; i++) {
                deviceStr+='<option value="' + data[i].catId + '" >' + data[i].catDesc + '</option>';
            }
            select.html('')
            select.append(deviceStr)
            select.selectpicker('refresh');//对searchPayState这个下拉框进行重置刷新
        },
    });
}
function refreshSizeSelection() {
    $.ajax({
        type: 'get',
        url: "/admin/size/list",
        dataType: 'json',
        success: function (data) {
            let select = $("#sizeSelect");
            let deviceStr = "";
            for (let i = 0; i < data.length; i++) {
                deviceStr+='<option value="' + data[i].sizeId + '" >' + data[i].sizeDesc + '</option>';
            }
            select.html('')
            select.append(deviceStr)
            select.selectpicker('refresh');//对searchPayState这个下拉框进行重置刷新
        },
    });
}
function refreshColorSelection(){
    $.ajax({
        type: 'get',
        url: "/admin/color/list",
        dataType: 'json',
        success: function (data) {
            var select = $("#colorSelect");
            let deviceStr = "";
            for (let i = 0; i < data.length; i++) {
                deviceStr+='<option value="' + data[i].colId + '" >' + data[i].colDesc + '</option>';
            }
            select.html('')
            select.append(deviceStr)
            select.selectpicker('refresh');//对searchPayState这个下拉框进行重置刷新
        }
    });
}
function saveProduct(){
    let proName = $("#proName").val();
    let proDesc = $("#proDesc").val();
    let proBrand=$("#proBrand").val();
    let proPrice = $("#proPrice").val();
    let proNumber = $("#proNumber").val();
    let isHot = $("input[name='pro-hot']:checked").val();
    let isNew = $("input[name='pro-new']:checked").val();
    let size = $("#sizeSelect").val();
    let color = $("#colorSelect").val();
    let category=$("#categorySelect").val();
    //TODO:对空进行判断并给出提示
    $.post("/admin/product/saveProduct",{
        proTitle:proName,
        proDesc:proDesc,
        proBrand:proBrand,
        proPrice:proPrice,
        proNumber:proNumber,
        proIsHot:isHot,
        proIsNew:isNew,
        size:size,
        color:color,
        category:category
    },function (resp){
        if (resp.data!==null){
            //成功
            toastr.success(resp.message,'提示')
            setTimeout(function (){
                window.location.href='/admin/product/complete/'+resp.data.proId;
            },2000)
        }else{
            toastr.error(resp.message,'提示')
        }
    })
}

/**
 * 更新
 */
function updateProduct(){
    let proId = $("#pro-update-id").val();
    let proName = $("#proName").val();
    let proDesc = $("#proDesc").val();
    let proBrand=$("#proBrand").val();
    let proPrice = $("#proPrice").val();
    let proNumber = $("#proNumber").val();
    let isHot = $("input[name='pro-hot']:checked").val();
    let isNew = $("input[name='pro-new']:checked").val();
    let size = $("#sizeSelect").val();
    let color = $("#colorSelect").val();
    let category=$("#categorySelect").val();
    console.log(proId)
    console.log(proName)
    console.log(proPrice)
    console.log(proNumber)
    console.log(isHot)
    console.log(isNew)
    console.log(size)
    console.log(category)
    console.log(color)
    $.post("/admin/product/update",{
        proId:proId,
        proName:proName,
        proDesc:proDesc,
        proBrand:proBrand,
        proPrice:proPrice,
        proNumber:proNumber,
        isHot:isHot,
        isNew:isNew,
        size:size,
        color:color,
        category:category
    },function (resp){
        if (resp.data){
            //修改成功
            toastr.success(resp.message+',即将前往商品图片','提示');
            setTimeout(function (){
                window.location.href='/admin/product/showProImg/'+proId
            },2000)
        }else {
            toastr.error(resp.message)
        }
    })
}
function goImg(){
    let proId = $("#pro-update-id").val();
    window.location.href='/admin/product/showProImg/'+proId;
}








/**
 * 设置商品尺寸 abandon
 */
function chooseSizes4Product() {
    //批量删除
    let selects = [];
    let proId = $("#hidden-pro-id").val();
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
    $.post("/admin/product/saveSize4Product", {
        selects: selects,
        proId: proId
    }, function (resp) {
        if (resp.data) {
            toastr.success(resp.message, "提示");
        } else {
            toastr.error(resp.message, '提示')
        }
    })
}
//abandon
function getListOfSize() {
    $.get("/admin/size/list", {}, function (resp) {
        console.log(resp)
        //渲染datatabls表格
        $("#sizeTable").DataTable({
            destroy: true,
            //数据源
            data: resp.data,
            //取消搜索栏
            bFilter: false,
            bLengthChange: false,
            //给每列赋值
            columns: [
                {
                    data: 'sizeId', render: function (data, type, row, meta) {
                        return '<input name="inp-check-box" type="checkbox" value="' + row.sizeId + '">'
                    }
                },
                {
                    data: 'sizeId', render: function (data, type, row, meta) {
                        return row.sizeId;
                    }
                },
                {
                    data: 'sizeDesc', render: function (data, type, row) {
                        return row.sizeDesc === null || row.sizeDesc === undefined ? "" : row.sizeDesc;
                    }
                },
                {
                    data: 'createTime', render: function (data, type, row) {
                        return row.createTime === null || row.createTime === undefined ? "" : new Date(row.createTime).getDate();
                    }
                },
                {
                    data: 'updateTime', render: function (data, type, row) {
                        return row.updateTime === null || row.updateTime === undefined ? "暂无" : new Date(row.updateTime).getDate();
                    }
                },

                {
                    data: '', render: function (data, type, row, meta) {
                        return '<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#updateModal" onclick="showSizeP(' + row.sizeId + ')">修改</button>\n' +
                            '  <button class="btn btn-danger btn-sm" type="button" onclick="deleteSizeBySizeId(' + row.sizeId + ')">删除</button>';
                    }
                },
            ],

        })
    })


}
//abandon
function showSizeP(sizeId) {
    $.get("/admin/size/getOne", {
        sizeId: sizeId
    }, function (resp) {
        $("#size-name-update").val(resp.data.sizeDesc);
        $("#size-id-update").val(resp.data.sizeId);
    })
}

/**
 * 更新一个size abandon
 * @param sizeId
 */
function updateSizeP() {
    let sizeDesc = $("#size-name-update").val()
    let sizeId = $("#size-id-update").val()
    $.post("/admin/size/update", {
        sizeId: sizeId,
        sizeDesc: sizeDesc
    }, function (resp) {
        if (resp.data) {
            //保存成功
            toastr.success(resp.message, '提示');
            $('#updateModal').modal('hide');
            //查找所有的数据动态刷新到表格内
            getListOfSize()
        } else {
            toastr.error(resp.message, "提示");
        }
    })

}

/**
 * 删除size abandon
 */
function deleteSizeBySizeId(sizeId) {
    $.get("/admin/size/delete", {
        sizeId: sizeId
    }, function (resp) {
        if (resp.data) {
            toastr.success(resp.message, '提示');
            getListOfSize()
        } else {
            toastr.error(resp.message, '提示');
        }
    })
}
// abandon
function saveColor() {
    let colorName = $("#color-name").val();
    $.post("/admin/color/save", {
        colDesc: colorName
    }, function (resp) {
        if (resp.data) {
            toastr.success(resp.message, '提示');
            $("#colorModal").modal('hide');
            refreshColorSelection()
        } else {
            toastr.error(resp.message, '提示');
        }
    })
}
//abandon
function getListOfColor() {
    $.get("/admin/color/list", {}, function (resp) {
        console.log(resp)
        //渲染datatabls表格
        $("#colorTable").DataTable({
            destroy: true,
            //数据源
            data: resp.data,
            //取消搜索栏
            bFilter: false,
            bLengthChange: false,
            //给每列赋值
            columns: [
                {
                    data: 'colId', render: function (data, type, row, meta) {
                        return '<input name="inp-check-box" type="checkbox" value="' + row.colId + '">'
                    }
                },
                {
                    data: 'colId', render: function (data, type, row, meta) {
                        return row.colId;
                    }
                },
                {
                    data: 'colDesc', render: function (data, type, row) {
                        return row.colDesc === null || row.colDesc === undefined ? "" : row.colDesc;
                    }
                },
                {
                    data: 'createTime', render: function (data, type, row) {
                        return row.createTime === null || row.createTime === undefined ? "" : row.createTime;
                    }
                },
                {
                    data: 'updateTime', render: function (data, type, row) {
                        return row.updateTime === null || row.updateTime === undefined ? "暂无" : row.updateTime;
                    }
                },

                {
                    data: '', render: function (data, type, row, meta) {
                        return '<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#updateColorModal" onclick="showColorP(' + row.colId + ')">修改</button>\n' +
                            '  <button class="btn btn-danger btn-sm" type="button" onclick="deleteSizeBySizeId(' + row.colId + ')">删除</button>';
                    }
                },
            ],

        })
    })
}
//abandon
function showColorP(colId) {
    $.get("/admin/color/getOne", {
        colId: colId
    }, function (resp) {
        console.log(resp)
        $("#color-id-update").val(resp.data.colId);
        $("#color-name-update").val(resp.data.colDesc);
    })
}
//abandon
function updateColorP() {
    let colId = $("#color-id-update").val();
    let colDesc = $("#color-name-update").val();
    $.post("/admin/color/update", {
        colId: colId,
        colDesc: colDesc
    }, function (resp) {
        if (resp.data) {
            toastr.success(resp.message, '提示');
            $("#updateColorModal").modal('hide');
        } else {
            toastr.error(resp.message, '提示');
        }
    })
}
//abandon
function chooseColor4Product() {
    //批量删除
    let selects = [];
    let proId = $("#hidden-pro-id").val();
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
    $.post("/admin/product/saveColor4Product", {
        selects: selects,
        proId: proId
    }, function (resp) {
        if (resp.data) {
            toastr.success(resp.message, "提示");
        } else {
            toastr.error(resp.message, '提示')
        }
    })
}
