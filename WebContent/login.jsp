<%@page import="java.lang.String" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/skin_/login.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.select.js"></script>
<title>导师双选制系统</title>
</head>
<% 
    String usernameError = (String)session.getAttribute("usernameError");
    String passwordError = (String)session.getAttribute("passwordError");
    if(usernameError == null||"".equals(usernameError)){
    	usernameError ="";
    }
    if(passwordError == null||"".equals(passwordError)){
    	passwordError = "";
    }else{
    	out.print("<script>alert('密码不正确')</script>");
    }
%>
<body>
  <form method="post" id="login" action="${pageContext.request.contextPath}/UserServlet?method=check" name="accfrm">  
<div id="container">
    <div id="bd">
    	<div id="main">
        	<div class="login-box">
                <div id="logo"></div>
                <h1></h1>
                <div class="input username" id="username">
                    <label for="userName">用户名</label>
                    <input type="text" id="userName" name="username" />
                      
</div>
               
           <div class="input psw" id="psw">
           <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                    <span></span>
                    <input type="password" id="password" name="password"/>
                    
                </div>
                 <label>
				               
		                     </label>
                <div class="input validate" id="validate">
                    <label for="valiDate">验证码</label>
                    <input type="text" id="valiDate" data-validate="required:请填写右侧的验证码" />
                    <div class="value">X3D5</div>
                </div>
               
                <div id="btn" class="loginButton">
                    <input type="submit" class="button" value="登录"  />
                    <br/>
                    <br/>
                   
                     <p style="color:#D8bfd8">
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="signUp.jsp">还没有账号，立即去注册</a>
                    </p>
                </div>
                
            </div>
        </div>
        
    </div>
   
</div>
</form>
</body>
<script type="text/javascript">
	var height = $(window).height() > 445 ? $(window).height() : 445;
	$("#container").height(height);
	var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
	$('#bd').css('padding-top', bdheight);
	$(window).resize(function(e) {
        var height = $(window).height() > 445 ? $(window).height() : 445;
		$("#container").height(height);
		var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
		$('#bd').css('padding-top', bdheight);
    });
	$('select').select();
	
</script>

</html>
