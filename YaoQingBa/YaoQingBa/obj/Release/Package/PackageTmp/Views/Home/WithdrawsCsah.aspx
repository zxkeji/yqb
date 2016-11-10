<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<YaoQingBa.Models.WithdrawsCashInfo>" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <link href="../../Content/public/css.min/common.css" rel="stylesheet" />
    <link href="../../Content/public/css.min/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Content/default/css.min/withdraws_cash.css" />
    <script src='../../Content/public/js.min/jquery-2.2.3.min.js' type="text/javascript"></script>
    <script src="../../Content/public/js.min/bootstrap.min.js"></script>
    <script src="../../Content/default/js.min/WithdrawsCsah.js"></script>
    <title>withdraws_cash</title>
</head>
<body>
     
     
    <div class="withdraws_cash" >
        <div class="clear">
            <h1 class="pull-left"">提现</h1>
            <ul id="wc_paystate" class="nav nav-tabs pull-left  wc_tab " state="0">
                <li class="active">
                    <a href="#no_pay" data-toggle="tab">待支付</a>
                </li>
                <li id="ispay_pay">
                    <a href="#pay" data-toggle="tab">已支付</a>
                </li>
                <li>
                    <a href="#repulse" data-toggle="tab">已打回</a>
                </li>
            </ul>
     
            <div class="btn-group pull-right wc_headbtn ">
                <button type="button " class="btn btn-info dropdown-toggle " data-toggle="dropdown">
                    全部
      <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                    <li>
                        <a href="#">本月</a>
                    </li>
                    <li role="presentation">
                        <a href="#">上月</a>
                    </li>
                    <li role="presentation">
                        <a href="#">最近三个月</a>
                    </li>
                    <li role="presentation">
                        <a href="#">全部</a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active clear" id="no_pay">
              <div class="wc_list pull-left">
                 
            <%Html.RenderPartial("/Views/Home/WithdrawsCsahList.ascx", Model); %>
                 
 
                </div>
               
                <div class="wc_contentdetails pull-left">
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

                    <ul class="list-group tab-pane fade  " id="wc_detail<%=Convert.ToInt32(s["id"])%>">
  <li class="list-group-item">金额：<span>￥<%=Convert.ToSingle(values["x.fee"])%></span></li>
 <li class="list-group-item">姓名：<span><%=values["it.name"].ToString()%></span></li>
 <li class="list-group-item">银行:<span><%=values["x.bankName"].ToString()%></span></li>
<%--<li class="list-group-item">卡号：<span><%=values["x.bankCard"].ToString()%></span></li>--%>
  <li class="list-group-item">时间:<span><%=Convert.ToDateTime(s["firstTime"]).ToString("MM-dd HH:mm")%></span></li>
<%if (Convert.ToInt32(values["x.state"]) == 0)
  { %>
 
 <li class="list-group-item">状态：<span>未打款</span></li>
<li class="wc_comfirm_cancel pull-left">

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#repulse_box">
                            打回
                        </button>
                        <button type="button" class="btn btn-primary">确认支付</button>
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
                
            </div>
            <div class="tab-pane fade clear" id="pay">
                           
            <%Html.RenderPartial("/Views/Home/WithdrawsCsahList.ascx", Model); %>
            </div>
            <div class="tab-pane fade clear" id="repulse">
                           
            <%Html.RenderPartial("/Views/Home/WithdrawsCsahList.ascx", Model); %>
            </div>

        </div>




    </div>



    <%--  弹出打回框--%>

    <div class="modal fade" id="repulse_box" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <p>填写理由</p>
                    <textarea class="form-control"></textarea>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                    <button class="btn btn-primary" type="button">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


    


    
</body>
</html>
