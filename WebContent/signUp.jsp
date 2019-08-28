<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-left">
				账号注册
			</h3>
		</div>
	</div>
	<HR align=center width=100% color=#987cb9 SIZE=1>
</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form method="post" id="login" action="${pageContext.request.contextPath}/UserServlet?method=add" name="accfrm">
				<div class="form-group">
					 <label for="exampleInputEmail1">用户名</label><input class="form-control" id="exampleInputEmail1" type="text" name="username" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">密码</label><input class="form-control" id="exampleInputPassword1" type="password" name="password"/>
					 
				</div>
				<div class="form-group">
				 <label for="exampleInputEmail1">身份</label>
				<select name="p1" class="form-control">
                 <option value="学生">学生</option>
                  <option value="老师">老师</option>
            </select>
            </div>
				
				<div class="checkbox">
					 
				</div> <button type="submit" class="btn btn-default">注册</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>