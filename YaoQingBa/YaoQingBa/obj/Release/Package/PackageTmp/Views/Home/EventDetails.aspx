<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <link href="../../Content/public/css.min/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Content/default/css.min/EventDetails.css" />
    <script src='../../Content/public/js.min/jquery-2.2.3.min.js' type="text/javascript"></script>
  
    <script src='../../Content/default/js.min/EventDetails.js' type="text/javascript" charset="gb2312"></script>
    <title>活动详情</title>
</head>
<body>
  
    <section>
<div>
        <img class="ed_head_bigpic" src="<%=Model.values["x.coverImage"].ToString()%>" /></div>
        <div class="ed_head_title c_padding10px c_border_bottom">
            <div class="head_title c_fontsize3"><%=Model.values["x.title"].ToString()%></div>
            <div class="head_date c_paddingtop8px"><%=Convert.ToDateTime(Model.value["firstTime"]).ToString("MM-dd")%></div>
        </div>
        <div class="ed_head_content c_padding20px c_border_bottom c_fontsize1">
            <ul>
                <li class="c_border_bottom c_paddingtop8px">
                    <i class="iconfont">&#xe600;</i><a href="#"><%=Convert.ToDateTime(Model.values["x.beginTime"]).ToString("MM-dd HH:mm")%> 至 <%=Convert.ToDateTime(Model.values["x.endTime"]).ToString("MM-dd HH:mm")%></a></li>
                <li class="c_border_bottom c_paddingtop8px">
                    <i class="iconfont">&#xe60a;</i>

                    <div class="title_addr"><%=Model.values["x.address"].ToString()%></div>
                </li>
                <li class="c_border_bottom c_paddingtop8px">
                    <i class="iconfont">&#xe606;</i><a href="#">已报名0人/不限制名额</a></li>
                <li class="c_paddingtop8px" id="title_pay" onclick="popupDiv('pay_type')">
                    <i class="iconfont ">&#xe605;</i><a href="#" class="c_color9933">免费</a> <i class="iconfont c_right">&#xe608;</i></li>
            </ul>
        </div>
        <div class="ed_head_user c_padding10px " id="bangdingshuju">
            <div class="c_paddingtop8px clear">
                <img src="<%=Model.values["p.image"].ToString() %>" />
                <div class="title_name c_fontsize1"><%=Model.values["p.nick"].ToString()%></div>
            </div>
        </div>
    </section>
    <section>
        <% foreach (Dictionary<string, object> cont in Model.val_content)
           { 
               %> 
        <div class="ed_content c_padding10px c_fontsize2">
            <div class="ed_content_text c_paddingtop8px "><%=cont["title"].ToString() %></div>
            <div class="ed_content_text c_paddingtop8px "><%=cont["tail"].ToString() %></div>
            <% if(cont.ContainsKey("photographList") )
               {
                ArrayList photographList = cont["photographList"] as ArrayList;
                foreach (Dictionary<string, object> photogl in photographList)
                {
                  %>  
                <img src="<%=photogl["address"].ToString() %>" />
            <% } }%>
           
            <div class="ed_content_text c_paddingtop8px "><%=cont["elabarate"].ToString()%></div>
        </div>
        <%} %>
    </section>

    <section>
        <div class="ed_enroll c_padding10px">
            <div class="ed_enroll_head c_paddingtop16px c_border_bottom c_fontsize1">
                已报名（<span>0</span>）
            </div>
            <div class="ed_enroll_details clear c_paddingtop16px">
                <div class="ed_no_enroll c_fontsize1 c_color999">还木有人报名，快来成为活动第一人吧</div>
                <ul style="display:none">
                    <li class="c_padding10px">
                        <img src="../../Content/default/images/titlehead.jpg" />
                        <div class="ed_enroll_name">华为</div>
                    </li>
                    <li class="c_padding10px">
                        <img src="../../Content/default/images/titlehead.jpg" />
                        <div class="ed_enroll_name">联想</div>
                    </li>

                </ul>
            </div>
        </div>
    </section>
    <section>
        <div class="ed_comment c_padding10px">
            <div class="ed_comment_head c_paddingtop16px c_border_bottom c_fontsize1">
                评论
                <a class="c_right ed_write_comment c_color9e9" onclick="popupDiv('comment_box')">我要评论</a>
            </div>
            <div class="ed_comment_details  clear">
                <div class="ed_no_comment c_paddingtop16px c_fontsize1 c_color999">还木有人评论，赶快抢个沙发!</div>
                <ul style="display:none">
                    <li class="c_padding10px  c_border_bottom">


                        <div class="c_paddingtop8px">
                            <img src="../../Content/default/images/titlehead.jpg" />
                            <div class="ed_comment_content">
                                <div class="ed_comment_name ">华为 <span class="ed_comment_date c_right">20个小时前</span></div>
                                <div class="ed_comments">评论多一点评论多一点评论多一点评论多一点评论多一点</div>
                                <div class="ed_comments_details c_padding10px">
                                    <ul>
                                        <li class="c_paddingbottom8px"><a>
                                            <div class=""><span class="c_color9e9">安得</span>：<span>追加评论</span></div>
                                        </a></li>
                                        <li class="c_paddingbottom8px"><a>
                                            <div class=""><span class="c_color9e9">安得</span>：<span>追加评论</span></div>
                                        </a></li>
                                    </ul>
                                    <div class="c_paddingbottom8px c_color999">查看所有评论<i class="iconfont ">&#xe608;</i></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="c_padding10px  c_border_bottom ">
                        <div class="c_paddingtop8px">
                            <img src="../../Content/default/images/titlehead.jpg" />
                            <div class="ed_comment_content">
                                <div class="ed_comment_name">联想<span class="ed_comment_date c_right">20个小时前</span></div>

                                <div class="ed_comments">评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点</div>
                            </div>
                        </div>
                    </li>
                    <li class="c_padding10px  c_border_bottom ">
                        <div class="c_paddingtop8px">
                            <img src="../../Content/default/images/titlehead.jpg" />
                            <div class="ed_comment_content">
                                <div class="ed_comment_name">联想<span class="ed_comment_date c_right">20个小时前</span></div>

                                <div class="ed_comments">评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点</div>
                            </div>
                        </div>
                    </li>
                    <li class="c_padding10px  ">
                        <div class="c_paddingtop8px">
                            <img src="../../Content/default/images/titlehead.jpg" />
                            <div class="ed_comment_content">
                                <div class="ed_comment_name">联想<span class="ed_comment_date c_right">20个小时前</span></div>

                                <div class="ed_comments">评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点评论多一点</div>
                            </div>
                        </div>
                    </li>

                </ul>
                <div style="display:none" class="more_comment c_paddingtop12px c_color999">查看更多评论</div>
            </div>
        </div>
    </section>
    <div class="ed_bottom_menu">
        <div class="ed_bottom_comment" onclick="popupDiv('comment_box')">

            <i class="iconfont ">&#xe602;</i>
            <div class="ed_bottom_text">
                评论
            </div>

        </div>
        <div class="ed_bottom_collect" id="ed_collect">

            <i class="iconfont ">&#xe603;</i>
            <div class="ed_bottom_text">
                收藏
            </div>

        </div>
        <div class="ed_bottom_enroll" onclick="popupDiv('enroll_box')">

            <i class="iconfont ">&#xe606;</i><a href="#">我要报名</a>


        </div>
    </div>
    <!--弹出评论框   -->
    <div class="ed_comment_popup" id="comment_box">
        <div class="c_padding20px">
            <div class="ed_comment_title c_paddingtop12px c_fontsize1">
                <a href="#" class="c_left" onclick="hideDiv('comment_box')">取消</a> 评论
                
                 <a href="#" class="c_right">确定</a>
            </div>
            <div class="c_paddingbottom18px">
                <textarea rows="4" cols="50" placeholder="评论内容：">
</textarea>

            </div>
        </div>
    </div>
    <!-- 点击报名弹出选择收费   -->
    <div id="enroll_box" class="ed_enroll_box">
        <div class="btn_cancel c_paddingtop8px"><i class="iconfont" onclick="hideDiv('enroll_box')">&#xe607;</i></div>
        <div class="ed_enroll_popup">
            <div class=" ed_enroll_title c_paddingtop16px c_border_bottom c_fontsize2">
                请在以下收费项目中选择
            </div>
            <div class="c_padding10px ">
                <ul>
                    <% foreach (Dictionary<string, object> affichecl in Model.afficheChargeList)
                       {
                            %>
                    <li class="c_border_bottom c_paddingtop8px clear">
                        <div class="c_left">
                            <div class="c_fontsize1"><%=affichecl["name"].ToString() %></div>
                            <div class="ed_enroll_qty">剩余：<span>166</span></div>
                        </div>
                        <div class=" ed_enroll_pay c_right ">￥<span><%=Convert.ToSingle(affichecl["money"]) %></span><input type="radio" name="sex" /></div>
                    </li>
                   <%} %>
                </ul>

            </div>

            <div class="ed_enroll_next">
                <div class="btn_next c_paddingtop12px ">
                    下一步
                </div>
            </div>
        </div>
    </div>

    <!-- 点击头部价格弹出类型收费   -->
    <div id="pay_type" class="ed_enroll_box">
        <div class="btn_cancel c_paddingtop8px"><i class="iconfont" onclick="hideDiv('pay_type')">&#xe607;</i></div>
        <div class="ed_enroll_popup">
            <div class=" ed_enroll_title c_paddingtop16px c_border_bottom c_fontsize2">
                收费类型
            </div>
            <div class="c_padding10px c_paddingbottom18px">
                <ul>
                     <% foreach (Dictionary<string, object> affichecl in Model.afficheChargeList)
                       {
                            %>
                    <li class="c_border_bottom c_paddingtop8px clear">
                        <div class="c_left">
                            <div class="c_fontsize1"><%=affichecl["name"].ToString() %></div>
                            <div class="ed_enroll_qty">剩余：<span>166</span></div>
                        </div>
                        <div class=" ed_enroll_pay c_right ">￥<span><%=Convert.ToSingle(affichecl["money"]) %></span></div>
                    </li>
                   <%} %>
                   
                  
                </ul>

            </div>

        </div>
    </div>
</body>
</html>
