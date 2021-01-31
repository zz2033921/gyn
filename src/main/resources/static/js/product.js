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
    //刷新页面的时候更新显示购物车的数量
    let products = $.cookie('productList')
    products = JSON.parse(products)
    $('.cart-button a span').text(products.length)
    $('.cart-area a span').text(products.length)

    $('#essenceCartBtn').on('click', function () {
        //读取cookie中的数据
        let products = $.cookie('productList')
        products = JSON.parse(products)
        console.log(products.length)
        let html = ''
        let sumMoney = 0
        for (let i = 0; i < products.length; i++) {
            let price = products[i].productPrice.slice(1,-1)
            console.log(price)
            sumMoney += parseInt(price,10)
            html += '<div class="single-cart-item">\n' +
                '                    <a href="#" class="product-image">\n' +
                '                        <img src="'+products[i].proImg+'" class="cart-thumb" alt="">\n' +
                '                        <!-- Cart Item Desc -->\n' +
                '                        <div class="cart-item-desc">\n' +
                '                          <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>\n' +
                '                            <span class="badge">' + products[i].proBrand + '</span>\n' +
                '                            <h6>' + products[i].proTitle + '</h6>\n' +
                '                            <p class="size">Size: ' + products[i].productSize + '</p>\n' +
                '                            <p class="color">Color: ' + products[i].productColor + '</p>\n' +
                '                            <p class="price">' + products[i].productPrice + '</p>\n' +
                '                        </div>\n' +
                '                    </a>\n' +
                '                </div>'


        }
        $('.cart-list').html(html)
        let summary = '<h2>付款明细</h2>\n' +
            '                <ul class="summary-table">\n' +
            '                    <li><span>原价:</span> <span>'+sumMoney+'</span></li>\n' +
            '                    <li><span>物流:</span> <span>免费</span></li>\n' +
            '                    <li><span>折扣:</span> <span>无</span></li>\n' +
            '                    <li><span>需付款:</span> <span>'+sumMoney+'</span></li>\n' +
            '                </ul>\n' +
            '                <div class="checkout-btn mt-100">\n' +
            '                    <a href="/check" class="btn essence-btn">去付款</a>\n' +
            '                </div>'
        $('.cart-amount-summary').html(summary)
    })
})

function add2Cart() {
    let product = {
        proId:$('#proId').val(),
        proBrand: $('#proBrand').text(),
        proTitle: $('#proTitle').text(),
        productSize: $('#productSize').find("option:selected").text(),
        productColor: $('#productColor').find("option:selected").text(),
        productPrice: $('.product-price').text(),
        proImg:$('.product_thumbnail_slides').find('img').attr('src')
    }
    //初始化一个列表，将这个商品添加到cookie中
    let products = $.cookie('productList')
    if (products === undefined) {
        //新建一个列表
        let products = []
        products.push(product)
        $.cookie('productList', JSON.stringify(products), {expires: 7})
    } else {
        //否则的话，判断是否已经添加过了
        let products = $.cookie('productList')
        products = JSON.parse(products)
        for (let i = 0;i<products.length;i++){
            if (products[i].proId === product.proId){
                toastr.error('商品已经加入过购物车，请勿重复添加！','提示：')
                return
            }
        }
        products.push(product)
        $.cookie('productList', JSON.stringify(products), {expires: 7})
    }
    toastr.success('商品已添加到购物车','提示：')
}