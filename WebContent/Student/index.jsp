<%@page import="Dao.UserDao"%>
<%@page import="Bean.User"%>
<%@page import="Dao.JBDao"%>
<%@page import="Bean.JB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/skin_/index.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/global.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
<title>首页</title>
<%
          List<User> list = new ArrayList<User>();
          List<JB> teacherlist = new ArrayList<JB>();
          //查询所有的老师的情况
          UserDao userDao = new UserDao();
          JBDao jbDao = new JBDao();
          
          //查询出所有的老师
          list = userDao.userList();
          System.out.print("老师的数量是"+list.size());
          for(int i=0;i<list.size();i++){
        	  JB jb = new JB();
        	  jb = jbDao.get(list.get(i).getId());
        	  teacherlist.add(jb);
          }
          
%>
</head>
<body>

<div id="container">
	<div id="hd">
    </div>
    <div id="bd">
    	<div id="main">
           
            
            <ul class="content-list">
            <%
            for(int i=0;i<list.size();i++){
            %>
                        	<li class="content-item system">
                	<h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <span class="setting" title="设置"></span>
                            <span class="report" title="导出"></span>
                            <span class="close" title="关闭"></span>
                        </span>
                    	<span class="title"><%=list.get(i).getUsername() %></span>
                        
                    </h2>
                    <div class="content-bd" id="1">
                 <ul class="content-list things">
                        	<li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="xiangxixinxi.jsp?u_id=<%=teacherlist.get(i).getU_id() %>">姓名：<%=list.get(i).getUsername() %></a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="xiangxixinxi.jsp?u_id=<%=teacherlist.get(i).getU_id() %>">所在院校：<%=teacherlist.get(i).getSchool() %></a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="xiangxixinxi.jsp?u_id=<%=teacherlist.get(i).getU_id() %>">职称：<%=teacherlist.get(i).getJob() %></a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="xiangxixinxi.jsp?u_id=<%=teacherlist.get(i).getU_id() %>">专业：<%=teacherlist.get(i).getMajor() %></a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="xiangxixinxi.jsp?u_id=<%=teacherlist.get(i).getU_id() %>">详细信息</a>
                            </li>
                        </ul>
                    </div>
                </li>
            <% 	
            	
            }
            %>


            </ul>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
	var minwidth = 282;
	resizeWidth();
	$(top.window).resize(function(e) {
       resizeWidth();
    });
	$(function() {
		$( ".content-list" ).sortable({
		  revert: true,
		  handle:'h2'
		});
		
	});
	
function resizeWidth (){
	if($('#main').width() / 3 < minwidth){
		$('.content-item').width(($('#main').width() / 2) - 15);
	}else{
		$('.content-item').width(($('#main').width() / 3) - 15);	
	}
		
}
</script>
</html>
