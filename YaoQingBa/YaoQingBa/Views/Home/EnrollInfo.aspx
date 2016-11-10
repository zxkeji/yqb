<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
   
       <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
     <link rel="stylesheet" type="text/css" href="../../Content/default/css.min/EventDetails.css" />
    <title>请填写报名信息</title>
</head>
<body>
    <section class="c_padding20px ">
        <ul>
            <li class="c_paddingtop18px">
               <div class="c_paddingbottom8px">
                   姓名
               </div>
                <div class="c_input">
                <input type="text"/></div>
            </li >
              <li class="c_paddingtop18px">
               <div class="c_paddingbottom8px">
                   手机
               </div>
               <div class="c_input">
                <input type="tel"/></div>
            </li>
        </ul>
         <div class="ed_enroll_next">
                <div class="btn_next c_paddingtop12px ">
                    立即报名
                </div>
            </div>
    </section>
</body>
</html>
