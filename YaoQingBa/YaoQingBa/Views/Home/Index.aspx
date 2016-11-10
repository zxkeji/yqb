<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <link href="../../Content/public/css.min/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Content/default/css.min/home.css" />
    <script src='../../Content/public/js.min/jquery-2.2.3.min.js' type="text/javascript"></script>

    <script src='../../Content/default/js.min/home.js' type="text/javascript" charset="gb2312"></script>
    <title>首页</title>
</head>
<body>
    <div class="section">
        <%                         
            foreach (Dictionary<string, object> s in Model.list)
            {
                object a = s["values"];
                Dictionary<string, object> values = a as Dictionary<string, object>;                     
        %>
        <section id="<%=Convert.ToInt32(s["id"]) %>" class="sy_click">
            <div class="c_padding10px">
                <div class="c_paddingtop10px">
                    <img class="sy_titlepic" src="<%=values["p.image"].ToString()%>" />
                    <span class="sy_titlespan c_fontsize1"><%=values["p.nick"].ToString() %></span>
                </div>
            </div>
            <div style ="width:99%">
                <%if(values.ContainsKey("x.coverImage")) 
                    {%>
                <img src="<%=values["x.coverImage"].ToString()%>" />
                <%} else{%>
                <%} %>
            </div>
            <div class="c_padding10px sy_content">
                <div class="c_paddingtop12px c_fontsize2"><%=values["x.title"].ToString() %></div>
                <div class="clear c_paddingbottom5px">
                    <div class="c_left ">
                        <ul>
                            <li class="c_paddingbottom5px">
                                <i class="iconfont c_fontsize3">&#xe600;</i><a class="sy_contenta c_color999">
                                    <span><%=Convert.ToDateTime(values["x.beginTime"])%></span> 开始</a>
                            </li>
                            <li class="c_paddingbottom5px">
                                <i class="iconfont c_fontsize3">&#xe60a;</i><a class="sy_contenta c_color999">
                                    <span class="sy_addr"><%=values["x.address"].ToString() %></span></a> <div class="c_fontsize2 c_color9933 c_right sy_pay">￥<span><%=Convert.ToSingle(values["x.chargePrice"])%></span>起</div>
                            </li>
                        </ul>
                    </div>
                   
                </div>

            </div>
        </section>
        <%
            }
        %>
    </div>
    <div class="sy_bottom c_color999 c_fontsize1 c_paddingtop5px ">

        <div class="c_left   sy_bottom_details sy_home">
            <i class="iconfont ">&#xe601;</i>
            <div class="sy_bottom_text">
                首页
            </div>
        </div>
        <div class="c_left  sy_bottom_details sy_release">
            <i class="iconfont ">&#xe601;</i>
            <div class="sy_bottom_text">
                发布
            </div>
        </div>
        <div class="c_left  sy_bottom_details sy_my">
            <i class="iconfont ">&#xe601;</i>
            <div class="sy_bottom_text">
                我的
            </div>
        </div>

    </div>
</body>
</html>
