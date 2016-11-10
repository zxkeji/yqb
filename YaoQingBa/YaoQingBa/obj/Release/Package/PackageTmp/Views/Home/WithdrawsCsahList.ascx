<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

 
                      <ul class="nav nav-pills nav-stacked wc_list_details" >


             <%   
                 if (Model.list == null) { }else
                 {
                 foreach (Dictionary<string, object> s in Model.list)
                 {
                     object a = s["values"];
                     Dictionary<string, object> values = a as Dictionary<string, object>;
                 %>

  <li  class="">
<a href="#wc_detail<%=Convert.ToInt32(s["id"]) %>" data-toggle="tab" rid="<%=Convert.ToInt32(s["id"]) %>">
    <div class="wc_ldtitle clear">
<div class="wc_ldname pull-left"><%=values["it.name"].ToString()%></div>
<span class="wc_ldtime pull-right"><%=Convert.ToDateTime(s["firstTime"]).ToString("MM-dd HH:mm")%></span></div>
<div class="wc_ldpay"> ￥<%=Convert.ToSingle(values["x.fee"])%></div>
<div class="wc_ldaddr"><%=values["x.bankName"].ToString()%></div>

</a>
</li>
</ul>
 <%
 }   %>  <nav class="wc_list_pager">
  <ul class="pager" id="wc_page" pageindex="1">
    <li id="wc_prev"><a href="#">上一页</a></li>
    <li id="wc_next"><a href="#">下一页</a></li>
  </ul>
</nav>
  <%}
        %>
              
 