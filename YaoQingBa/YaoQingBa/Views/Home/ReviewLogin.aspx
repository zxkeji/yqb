<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <link href="../../Content/default/css.min/ReviewLogin.css" rel="stylesheet" />
    <link href="../../Content/public/css.min/common.css" rel="stylesheet" />
    <link href="../../Content/public/css.min/bootstrap.min.css" rel="stylesheet" />    
    <script src='../../Content/public/js.min/jquery-2.2.3.min.js' type="text/javascript"></script>
    <script src="../../Content/public/js.min/bootstrap.min.js"></script>    
    <script src="../../Content/default/js.min/ReviewLogin.js"></script>
    <title>登录</title>
</head>
<body>
    <div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>登录</small></h1>
			</div>
			<div class="login-content ">
			<div class="form">
			<form action="#" method="post">
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="username" name="username" class="form-control c_margintop5px" placeholder="用户名">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon " ><span class="glyphicon glyphicon-lock"></span></span>
							<input type="text" id="password" name="password" class="form-control c_margintop5px" placeholder="密码">
						</div>
					</div>
				</div>
				<div class="form-group form-actions">
					<div class="col-xs-4 col-xs-offset-4 ">
						<button type="button" class="btn btn-sm btn-info" id="rl_login"><span class="glyphicon glyphicon-off" style="position:relative;top:3px;"></span> 登录</button>
					</div>
				</div>
				<%--<div class="form-group">
					<div class="col-xs-6 link">
						<p class="text-center remove-margin"><small>忘记密码？</small> <a href="javascript:void(0)" ><small>找回</small></a>
						</p>
					</div>
					<div class="col-xs-6 link">
						<p class="text-center remove-margin"><small>还没注册?</small> <a href="javascript:void(0)" ><small>注册</small></a>
						</p>
					</div>
				</div>--%>
                
			</form>
                <div class="rl_msg">
                  
                </div>
			</div>
                   
		</div>
         
	</div>
</div>
</body>
</html>
