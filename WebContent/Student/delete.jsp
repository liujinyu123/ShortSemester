<%@page import="Dao.UserDao"%>
<%@page import="Dao.JBDao"%>
<%@page import="Bean.JB"%>
<%@page import="Bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
User user = new User();
user = (User)session.getAttribute("loginUser");
JB jb = new JB();
JBDao jbDao = new JBDao();
jb = jbDao.get(user.getId());
UserDao userDao = new UserDao();
userDao.delete(user);
jbDao.delete(jb.getId());
session.invalidate();
response.sendRedirect(request.getContextPath()+"/login.jps");
%>
    
</body>
</html>