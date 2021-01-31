$(document).ready(function () {
    //获取平台连接
    $.get('/platform/get',{},function (resp){
         let $platform = $("#platform");
         $platform.empty();
         let data = resp;
         let li="";
        for (let i = 0; i < data.length; i++) {
            li+='<li> <a href="'+data[i].platUrl+'" target="_blank">'+data[i].platName+'</a></li>';
        }
        $platform.append(li);
    });


})