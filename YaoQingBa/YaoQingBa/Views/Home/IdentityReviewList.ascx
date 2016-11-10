<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

 <div class="wc_list pull-left"  pageindex="<%=Model.pageIndex%>">
        
                      <ul class="nav nav-pills nav-stacked wc_list_details" count="<%=Model.count%>" >


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
  <ul class="pager" id="wc_page" >
    <li><a  id="wc_prev" >上一页</a></li>
    <li ><a id="wc_next" >下一页</a></li>
  </ul>
</nav>
  <%}
        %>
              
                 
 
                </div>
               
                <div class="wc_contentdetails pull-left" >
                    <%if (Model.list == null) { }else
                 { %>
                    <div class="wc_lefttitle">
                        <h3 class="wc_detailstitle">申请详情</h3>
                    </div>

                <div class="tab-content wc_detailsinfo">      
             <%   
                 foreach (Dictionary<string, object> s in Model.list)
                 {
                     object a = s["values"];
                     Dictionary<string, object> values = a as Dictionary<string, object>;
                 %>

                    <ul class="list-group tab-pane fade  " id='wc_detail<%=Convert.ToInt32(s["id"])%>'>
  <li class="list-group-item">金额：<span>￥<%=Convert.ToSingle(values["x.fee"])%></span></li>
 <li class="list-group-item">姓名：<span><%=values["it.name"].ToString()%></span></li>
 <li class="list-group-item">银行：<span><%=values["x.bankName"].ToString()%></span></li>
<%--<li class="list-group-item">卡号：<span><%=values["x.bankCard"].ToString()%></span></li>--%>
  <li class="list-group-item">时间：<span><%=Convert.ToDateTime(s["firstTime"]).ToString("MM-dd HH:mm")%></span></li>
<%if (Convert.ToInt32(values["x.state"]) == 0)
  { %>
 
 <li class="list-group-item">状态：<span>未打款</span></li>
<li class="wc_comfirm_cancel pull-left">

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#repulse_box">
                            打回
                        </button>
                        <button type="button" class="btn btn-primary wc_comfirmpay">确认支付</button>
                    </li>
                        <% }
  else if (Convert.ToInt32(values["x.state"]) == 1)
  {%>
                         <li class="list-group-item">状态：<span>已打款</span></li>
                              <%} else
                                {%>  
                         <li class="list-group-item">状态：<span>打回</span></li>
                        
                       <% } %> 
       </ul>
 <%
 }}
        %>
              
                </div>         
                       
             



                    
                </div>
                