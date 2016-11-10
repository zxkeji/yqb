$(function () {



    //显示上一页
    $("#wc_prev").click(function () {
        var pageindex = $("#wc_page").attr("pageindex");  
        var state = $("#wc_paystate").attr("state");
        if (pageindex==1)
        {
            //noty提示
            alert("已经是第一页");                             
        }
        else {          
            var pageindex = pageindex - 1;
            $.ajax({
                type: "post",
                data: { pageindex: pageindex,state：state },
                async: false,
                url: Home / WithdrawsCsah,
                success: function (result) {

                }
            });
        }
        
        
        
        
    });
    //显示下一页
    $("#wc_prev").click(function () {
        var pageindex = $("#wc_page").attr("pageindex");
        var nextpage =pageindex + 1;
        var state = $("#wc_paystate").attr("state");
        $.ajax({
            type: "post",
            data: { pageindex: nextpage，state：state },
            async: false,
            url: Home / WithdrawsCsah,
            success: function (result) {

            }
        });


    });

    $.ajax({
        type: "post",
        data: { id: id },
        async: false,
        url: Home/WithdrawsCsah,
        success: function (result) {
                
        }
    });
 

})