<%@page import="Bean.JB"%>
<%@page import="Dao.JBDao"%>
<%@page import="Bean.User"%>
<%@page import="java.lang.String" %>
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
    JBDao jbDao = new JBDao();
    JB jb = new JB();
    jb = jbDao.get(user.getId());
    if(jb.getSex()==null||"".equals(jb.getSex())){
    	boolean flag = false;
    	String word = "欢迎登陆，请先完善个人信息";
    	session.setAttribute("jb", jb);
    	session.setAttribute("word", word);
    	session.setAttribute("flag", flag);
    	response.sendRedirect(request.getContextPath()+"/Student/information.jsp");
    }else{
    	response.sendRedirect(request.getContextPath()+"/Student/main.jsp");
    }
%>
</body>
</html>