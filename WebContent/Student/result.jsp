<%@page import="Dao.ShenqingDao"%>
<%@page import="Bean.Shenqing"%>
<%@page import="Bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<%
User user = new User();
user = (User)session.getAttribute("loginUser");
Shenqing sh = new Shenqing();
ShenqingDao shDao = new ShenqingDao();
sh = shDao.get3(user.getId());

shDao.statusUpdate1(sh);
%>
<body>
<table class="table table-striped">
    <thead>
    <tr>
        <th>编号</th>
        <th>内容</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    
    <tr>
   
        <td><%=sh.getId()%></td>
        <td>申请回复</td>
         <td>
           <%=sh.getReplystatus()%>
        </td>
        <td>
        
        	
        	<a href="replyinfor.jsp?id=<%=sh.getId()%>">详细信息</a>

                    
        </td>
    </tr>

   
    </tbody>
</body>
</html>