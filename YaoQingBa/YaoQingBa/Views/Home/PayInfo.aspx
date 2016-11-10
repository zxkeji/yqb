<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
   
       <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <link href="../../Content/public/css.min/common.css" rel="stylesheet" /> 
    <link href="../../Content/default/css.min/PayInfo.css" rel="stylesheet" />
     
    <title>PayInfo</title>
</head>
<body>
    <section class="c_padding10px pi_section">
        <div class="c_paddingtop20px">
            <div class="c_left pi_pic" >
                <img src="../../Content/default/images/titlehead.jpg" />
                
            </div>
            <div class="pi_visitinfo">
                <div class="pi_visitpay"><div class="c_fontsize3 c_left">￥<span>1.0</span></div><span class="pi_payproject" >报名费</span></div>
               
                <div class="c_paddingtop8px">美味冰淇淋</div>
                <div>10-11 17：39</div>
            </div>
        </div>
    </section>

    <section class="pi_section">
        <div class="c_padding10px">
            <div class="pi_wxpay clear">
                <div class=" c_left"><img src="../../Content/default/images/payweixin.jpg" /><span>微信支付</span></div>
                <input type="radio" class="c_right"/>
            </div>
       </div>
    </section>
  <div class="c_padding20px">
                <div class="btn_next c_paddingtop12px ">
                    立即报名
                </div>
            </div>
    <div>
        
    </div>
</body>
</html>
