$(function () {

    

//�ղ��л�
    $("#ed_collect").click(function () {
        var collect = $(".ed_bottom_collect .ed_bottom_text");
        $(this).toggleClass("ed_bottom_collect_hover");
        if ($(this).hasClass("ed_bottom_collect_hover")) {
            collect.html("���ղ�");
        } else {
            collect.html("�ղ�");
        }
    });
   
//��ѡ��
        var old = null; //��������ԭ���Ķ���  
        $("input[name='sex']").each(function () {//ѭ�����¼�  
            if (this.checked) {
                old = this; //�����ǰ����ѡ�У�����ö���  
            }
            this.onclick = function () {
                if (this == old) {//�������Ķ���ԭ����ѡ�еģ�ȡ��ѡ��  
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
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //����һ������Ŀ�������������ʽ����
    var r = window.location.search.substr(1).match(reg);  //ƥ��Ŀ�����
    if (r != null) return unescape(r[2]); return null; //���ز���ֵ
}


//����ģ̬��
function popupDiv(div_id) {
    // ��ȡ�����DIV  
    var $div_obj = $("#" + div_id);
    // �������Ļ�߶�  
    var windowWidth = $(window).width();
    // �������Ļ����  
    var windowHeight = $(window).height();
    // ȡ�ô���DIV�ĸ߶�  
    var popupHeight = $div_obj.height();
    // ȡ�ô���DIV�ĳ���  
    var popupWidth = $div_obj.width();

    // // ��Ӳ���ʾ���ֲ�  
    $("<div id='bg'></div>").width(windowWidth)
            .height(windowHeight).click(function () {
                //hideDiv(div_id); 
            }).appendTo("body").fadeIn(200);
    if (div_id == "pay_type") {
        // ��ʾ������DIV  
        $div_obj.css({
            "position": "fixed"
        }).animate({

            top: windowHeight / 4,
            opacity: "show"
        }, "slow");
    } else {
        // ��ʾ������DIV  
        $div_obj.css({
            "position": "fixed"
        }).animate({

            bottom: 0,
            opacity: "show"
        }, "slow");
    }
}
/*���ص���DIV*/
function hideDiv(div_id) {
    $("#bg").remove();
    $("#" + div_id).animate({

        bottom: 0,
        opacity: "hide"
    }, "slow");
}




//<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=����������������������������"></script> 
//<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script> 
//<script> 
//$(function(){ 
//    navigator.geolocation.getCurrentPosition(translatePoint); //��λ 
//}); 
//function translatePoint(position){ 
//    var currentLat = position.coords.latitude; 
//    var currentLon = position.coords.longitude; 
//    var gpsPoint = new BMap.Point(currentLon, currentLat); 
//    BMap.Convertor.translate(gpsPoint, 0, initMap); //ת������ 
//} 
//function initMap(point){ 
//    //��ʼ����ͼ 
//    map = new BMap.Map("map"); 
//    map.addControl(new BMap.NavigationControl()); 
//    map.addControl(new BMap.ScaleControl()); 
//    map.addControl(new BMap.OverviewMapControl()); 
//    map.centerAndZoom(point, 15); 
//    map.addOverlay(new BMap.Marker(point)) 
//}