$(function () {

    

//收藏切换
    $("#ed_collect").click(function () {
        var collect = $(".ed_bottom_collect .ed_bottom_text");
        $(this).toggleClass("ed_bottom_collect_hover");
        if ($(this).hasClass("ed_bottom_collect_hover")) {
            collect.html("已收藏");
        } else {
            collect.html("收藏");
        }
    });
   
//单选框
        var old = null; //用来保存原来的对象  
        $("input[name='sex']").each(function () {//循环绑定事件  
            if (this.checked) {
                old = this; //如果当前对象选中，保存该对象  
            }
            this.onclick = function () {
                if (this == old) {//如果点击的对象原来是选中的，取消选中  
                    this.checked = false;
                    old = null;
                } else {
                    old = this;
                }
            }
        });
 
})

var id = getUrlParam('ID');

function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}


//弹出模态框
function popupDiv(div_id) {
    // 获取传入的DIV  
    var $div_obj = $("#" + div_id);
    // 计算机屏幕高度  
    var windowWidth = $(window).width();
    // 计算机屏幕长度  
    var windowHeight = $(window).height();
    // 取得传入DIV的高度  
    var popupHeight = $div_obj.height();
    // 取得传入DIV的长度  
    var popupWidth = $div_obj.width();

    // // 添加并显示遮罩层  
    $("<div id='bg'></div>").width(windowWidth)
            .height(windowHeight).click(function () {
                //hideDiv(div_id); 
            }).appendTo("body").fadeIn(200);
    if (div_id == "pay_type") {
        // 显示弹出的DIV  
        $div_obj.css({
            "position": "fixed"
        }).animate({

            top: windowHeight / 4,
            opacity: "show"
        }, "slow");
    } else {
        // 显示弹出的DIV  
        $div_obj.css({
            "position": "fixed"
        }).animate({

            bottom: 0,
            opacity: "show"
        }, "slow");
    }
}
/*隐藏弹出DIV*/
function hideDiv(div_id) {
    $("#bg").remove();
    $("#" + div_id).animate({

        bottom: 0,
        opacity: "hide"
    }, "slow");
}




//<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=··············"></script> 
//<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script> 
//<script> 
//$(function(){ 
//    navigator.geolocation.getCurrentPosition(translatePoint); //定位 
//}); 
//function translatePoint(position){ 
//    var currentLat = position.coords.latitude; 
//    var currentLon = position.coords.longitude; 
//    var gpsPoint = new BMap.Point(currentLon, currentLat); 
//    BMap.Convertor.translate(gpsPoint, 0, initMap); //转换坐标 
//} 
//function initMap(point){ 
//    //初始化地图 
//    map = new BMap.Map("map"); 
//    map.addControl(new BMap.NavigationControl()); 
//    map.addControl(new BMap.ScaleControl()); 
//    map.addControl(new BMap.OverviewMapControl()); 
//    map.centerAndZoom(point, 15); 
//    map.addOverlay(new BMap.Marker(point)) 
//}