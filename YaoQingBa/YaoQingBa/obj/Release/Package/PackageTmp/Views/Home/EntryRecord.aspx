<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
   
    <link href="../../Content/public/css.min/bootstrap.min.css" rel="stylesheet" />
     <link href="../../Content/public/css.min/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Content/default/css.min/EntryRecord.css" />
    <script src='../../Content/public/js.min/jquery-2.2.3.min.js' type="text/javascript"></script>
     <script src="../../Content/public/js.min/bootstrap.min.js"></script>
    <title>报名记录</title>
</head>
<body>
   <%  if(Model.issuccess==1){%>
    <div class="entry_record c_padding10px c_fontsize1">
        <div class="er_title c_fontsize3 c_paddingtop10px"><%=Model.eventname %>  <span class="pull-right er_phonetotal c_color666 c_fontsize1">共<%=Model.count%>条</span></div>
        <div class="er_content c_padding10px">
            <div class="er_computer">
            <table class="table table-hover">
  <thead>
     <th>姓名</th>
     <th>手机号</th>
     <th>是否收费</th>
       <th>金额</th>
      <th>时间</th>
  </thead>
  <tbody>
       <%   
                 if (Model.list == null) { }else
                 {
                 foreach (Dictionary<string, object> s in Model.list)
                 {
                     object a = s["values"];
                     Dictionary<string, object> values = a as Dictionary<string, object>;
                 %>
     <tr>
        <td><%=values["x.name"].ToString()%></td>  
        <td><%=Convert.ToInt64(values["x.phone"])%></td> 
         
        <td><%=Convert.ToBoolean(values["x.isCharge"])==false?"否":"是"%></td>  
        
         <td>￥<%=Convert.ToSingle(values["x.totalFee"]) %></td>  
          <td><%=Convert.ToDateTime(s["firstTime"]).ToString("MM-dd HH:mm")%></td>  
     </tr>
             <%
 }  }
        %>
 
  </tbody>
</table>
                </div>
            <div class="er_phone">
            <ul>
                  <%   
                 if (Model.list == null) { }else
                 {
                 foreach (Dictionary<string, object> s in Model.list)
                 {
                     object a = s["values"];
                     Dictionary<string, object> values = a as Dictionary<string, object>;
                 %>
                <li class="c_paddingtop10px c_border_bottom">
                    <div class="er_phone_line1 c_fontsize3"><%=values["x.name"].ToString()%>
                        <span class="pull-right ">
                        <%if(Convert.ToBoolean(values["x.isCharge"])==false){ %>
                        <span class="c_color666 c_fontsize1 c_fontblod">免费</span>
                        <% }else{%>
                            <span class="c_color9933 c_fontsize1 c_fontblod">￥<%=Convert.ToSingle(values["x.totalFee"]) %></span>
                        <% }%>
                            </span>
                        </div>
                    <div class="c_color666"><%=Convert.ToInt64(values["x.phone"])%><span class="pull-right" ><%=Convert.ToDateTime(s["firstTime"]).ToString("MM-dd HH:mm")%></span></div>
                </li>                             <%
 }  }
        %>
            </ul>

            </div>
        </div>
        <div class="pull-right er_computertotal c_color666">共<%=Model.count%>条</div>
    </div><%}else{%>
    <div class="c_fontsize3 c_padding10px c_norights" >没有权限</div><%} %>
</body>
</html>
