$(function () {



    //进入详情
    $(".sy_click").click(function () {
        var id = $(this).attr("id");
        window.location.href = "/Home/EventDetails?id="+id;
    });


})