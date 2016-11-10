
$(function () {

    //登录
    $("#rl_login").click(function () {
        var username= $("#username").val();
        var password= $("#password").val();
        if(username==""){
            $(".rl_msg").text("用户名不能为空！");
        }else
        {
            if(password=="")
            { 
                $(".rl_msg").text("密码不能为空！");
            }else
            {
                if(username=="123"&&password=="123")
                {   
                    
                   
                    window.location.href = "/Home/Review?username=" + username;
                        }
                    
            
                else {
                    $(".rl_msg").text("用户名或密码不正确！");
                }
            }
        }

        
    })
    





    })