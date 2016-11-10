<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

   
    <div class="withdraws_cash" >
        <div class="clear">
            <h1 class="pull-left"">材料审核</h1>
            <ul id="wc_paystate" class="nav nav-tabs pull-left  wc_tab " state="0">
                <li class="active" id="is_noreview">
                    <a  data-toggle="tab" href="#">待审核</a>
                </li>
                <li id="is_review">
                    <a  data-toggle="tab" href="#">已审核</a>
                </li>
                <li id="is_repulse">
                    <a  data-toggle="tab" href="#">已打回</a>
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
            <div class="tab-pane fade in active clear" id="wc_details">
              
                
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
