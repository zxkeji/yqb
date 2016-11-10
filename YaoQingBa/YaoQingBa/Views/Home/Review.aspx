<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
      <meta charset="utf-8">
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=8">  
<link rel="stylesheet" type="text/css" href="../../Content/default/css.min/withdraws_cash.css" />
    <link href="../../Content/public/css.min/common.css" rel="stylesheet" />
    <link href="../../Content/public/css.min/bootstrap.min.css" rel="stylesheet" />
    <script src='../../Content/public/js.min/jquery-2.2.3.min.js' type="text/javascript"></script>
    <script src="../../Content/public/js.min/bootstrap.min.js"></script>
    <script src="../../Content/default/js.min/WithdrawsCsah.js"></script>
   
    <title>首页</title>
   
</head>
<body>
    <div class="review">
        <div class="r_head clear">
        <ul class="nav nav-pills pull-left c_fontsize2">
  <li role="presentation" class="active" id="r_withdraw"><a href="#">提现申请</a></li>
  <li role="presentation" id="r_identity"><a href="#">身份审核</a></li>
  
</ul>
    <div class="pull-right c_fontsize2">用户名：<%=Model.username %><a href="#" class="r_exit">退出</a></div>
        </div>
        <div class="review_content">
           
   </div>
        </div>
    <script>
        $(document).ready(function () {
        
       Review.Init();
    });
</script>
</body>
</html>
