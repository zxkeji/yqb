var Review = {
    Init: function () {

        var pageIndex = 1;
        var state = 0;
        $.ajax({
            type: "post",
            data: {},
            async: false,
            url: "/Home/WithdrawsCash",
            success: function (result) {
                $(".review_content").html(result);
                $.ajax({
                    type: "post",
                    data: { pageIndex: pageIndex, state: state },
                    async: false,
                    url: "/Home/WithdrawsCashList",
                    success: function (result) {
                        $("#wc_details").html(result);

                    }
                });
            }
        });


        //点击提现申请

        $("#r_withdraw").click(function () {
            var pageIndex = 1;
            var state = 0;
            $.ajax({
                type: "post",
                data: {},
                async: false,
                url: "/Home/WithdrawsCash",
                success: function (result) {
                    $(".review_content").empty();
                    $(".review_content").html(result);
                    $.ajax({
                        type: "post",
                        data: { pageIndex: pageIndex, state: state },
                        async: false,
                        url: "/Home/WithdrawsCashList",
                        success: function (result) {
                            $("#wc_details").empty();
                            $("#wc_details").html(result);

                        }
                    });
                }
            });




        });



        //点击身份审核

        $("#r_identity").click(function () {
            var pageIndex = 1;
            var state = 0;
            $.ajax({
                type: "post",
                data: {},
                async: false,
                url: "/Home/IdentityReview",
                success: function (result) {
                    $(".review_content").empty();
                    $(".review_content").html(result);
                    $.ajax({
                        type: "post",
                        data: { pageIndex: pageIndex, state: state },
                        async: false,
                        url: "/Home/IdentityReviewList",
                        success: function (result) {
                            $("#wc_details").empty();
                            $("#wc_details").html(result);

                        }
                    });
                }
            });




        });
        //显示上一页
        $("#wc_prev").on("click",function(){
            //$("#wc_prev").click(function () {
            var pageIndex = $(".wc_list").attr("pageindex");
            var state = $("#wc_paystate").attr("state");
            if (pageIndex == 1) {
                //noty提示
                alert("已经是第一页");
            }
            else {
                var pageIndex = Number(pageIndex) - 1;
                $.ajax({
                    type: "post",
                    data: { pageIndex: pageIndex, state: state },
                    async: false,
                    url: "/Home/WithdrawsCashList",
                    success: function (result) {
                        $("#wc_details").html(result);

                    }
                });
            }

        });

        //显示下一页

        $("#wc_next").on("click", function () {
            var pageIndex = $(".wc_list").attr("pageindex");
            var nextpage = Number(pageIndex) + 1;
            var state = $("#wc_paystate").attr("state");
            $.ajax({
                type: "post",
                data: { pageIndex: nextpage, state: state },
                async: false,
                url: "/Home/WithdrawsCashList",
                success: function (result) {
                    $("#wc_details").html(result);
                    var count = $(".wc_list_details").attr("count");
                    if (count == 0) {
                        alert("已经是最后一页！");
                        var pageindex = $(".wc_list").attr("pageindex");
                        var pageIndex = Number(pageindex) - 1;
                        $.ajax({
                            type: "post",
                            data: { pageIndex: pageIndex, state: state },
                            async: false,
                            url: "/Home/WithdrawsCashList",
                            success: function (result) {
                                $("#wc_details").html(result);
                            }
                        });
                    } else {
                        $("#wc_details").html(result);
                    }

                }
            });

        });

        //点击待支付/待审核
        $("#is_noreview").click(function () {


            $.ajax({
                type: "post",
                data: { pageIndex: 1, state: 0 },
                async: false,
                url: "/Home/WithdrawsCashList",
                success: function (result) {
                    $("#wc_details").empty();
                    $("#wc_details").html(result);
                }
            });

        });

        //点击已支付/已审核
        $("#is_review").click(function () {


            $.ajax({
                type: "post",
                data: { pageIndex: 1, state: 1 },
                async: false,
                url: "/Home/WithdrawsCashList",
                success: function (result) {
                    $("#wc_details").empty();
                    $("#wc_details").html(result);
                }
            });

        });

        //点击打回
        $("#is_repulse").click(function () {


            $.ajax({
                type: "post",
                data: { pageIndex: 1, state: -1 },
                async: false,
                url: "/Home/WithdrawsCashList",
                success: function (result) {
                    $("#wc_details").empty();
                    $("#wc_details").html(result);
                }
            });

        });











    }
}