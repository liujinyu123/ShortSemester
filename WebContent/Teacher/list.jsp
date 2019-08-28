<%@page import="Bean.JB"%>
<%@page import="Dao.JBDao"%>
<%@page import="Dao.UserDao"%>
<%@page import="Dao.ShenqingDao"%>
<%@page import="Bean.User"%>
<%@page import="Bean.Shenqing"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
background-color:#f2f9fd;
}

</style>
<body>
<%
List<Shenqing> list = new ArrayList<Shenqing>();
List<String>schoolList = new ArrayList<String>();
List<String> nameList = new ArrayList<String>();
User user = (User)session.getAttribute("loginUser");//获取登陆的用户
Shenqing sh = new Shenqing();
ShenqingDao shDao = new ShenqingDao();
list = shDao.get(user.getId());       //查询所有申请的记录
User user1 = new User();
UserDao userDao = new UserDao();
JBDao jbDao = new JBDao();
JB jb = new JB();                     
System.out.print("查询到的结果的大小："+list.size());
int count=0;
for(int i=0;i<list.size();i++){
	  if(list.get(i).getResult().equals("未审核")&&list.get(i).getStatus().equals("0")){
		 
		  count++;
	  }
}

//list为查询出的所有的申请记录
for(int i=0;i<list.size();i++){
	      user1 = userDao.load1(list.get(i).getS_id());
		  jb = jbDao.get(list.get(i).getS_id());
		  nameList.add(user1.getUsername());
		  schoolList.add(jb.getSchool());
		  
}
%>

<h4 align="left">
一共查询到了<span style="color:red"><%=list.size() %></span>条数据
</h4>
<table class="table table-striped">
    <thead>
    <tr>
        <th>编号</th>
        <th>学生姓名</th>
        <th>所在学校</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
     <%
     int j = 0;
    for(Shenqing shenqing:list){
    %>
    <tr>
   
        <td><%=shenqing.getId()%></td>
        <td><%=nameList.get(j)%></td>
         <td>
           <%=schoolList.get(j) %>
        </td>
        <td>
           <%=shenqing.getResult()
           %>
        </td>
        <td>
        <%
        if(shenqing.getResult().equals("未审核")){
        	
        	%>
        	<a href="shenhe.jsp?id=<%=shenqing.getId()%>">详细信息</a>
        	<% 
        }else{
        	%>
        	<a href="xiangxixinxi.jsp?id=<%=shenqing.getId()%>">详细信息</a>
        	<% 
        }
        %>
                    
        </td>
    </tr>
   <%
   j++;
    }
   %>
   
    </tbody>
</table> 
</body>
</html>