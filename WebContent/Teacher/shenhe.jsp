<%@page import="Dao.ShenqingDao"%>
<%@page import="Bean.Shenqing"%>
<%@page import="Dao.UserDao"%>
<%@page import="Dao.JBDao"%>
<%@page import="Bean.User"%>
<%@page import="Bean.JB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/WdatePicker.css" />
<link rel="stylesheet" type="text/css" href="../css/skin_/form.css" />
<link href="../umeditor/themes/default/_css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/global.js"></script>
<script type="text/javascript" src="../js/jquery.select.js"></script>
<script type="text/javascript" src="../js/WdatePicker.js"></script>
<script type="text/javascript">
window.UMEDITOR_HOME_URL = 'umeditor/';  // 请换成绝对路径
</script>
<script type="text/javascript" src="../js/umeditor.config.js"></script>
<script type="text/javascript" src="../js/editor_api.js"></script>
<script type="text/javascript" src="../umeditor/lang/zh-cn/zh-cn.js"></script>
<title>详细信息</title>
</head>
<%
      JBDao jbDao = new JBDao();
      User user1 = new User();
      user1 = (User)session.getAttribute("loginUser");
      JB jb1 = new JB();
      jb1 = jbDao.get(user1.getId());
      System.out.print("报考的学校是"+jb1.getSchool());
      System.out.print("导师姓名是"+user1.getUsername());
      //接收的是申请表中的ID
      int id = Integer.parseInt(request.getParameter("id"));
      System.out.print("接收的Id"+id);
      Shenqing shenqing = new Shenqing();
      ShenqingDao shDao = new ShenqingDao();
      shenqing = shDao.get2(id);
      JB jb = new JB();
      
      jb = jbDao.get(shenqing.getS_id());
      User user = new User();
      UserDao userDao = new UserDao();
      user = userDao.load1(jb.getU_id());
      System.out.print(shenqing.getIntroduction());
%>
<body>


<form method="post" id="login" action="${pageContext.request.contextPath}/ShenqingServlet?method=add" name="accfrm">
<div id="container">
	<div id="hd">
    </div>
    <div id="bd">
    	<div id="main">
            <h2 class="subfild">
            	<span>个人信息</span>
            </h2>
            
            <div class="subfild-content base-info">
            <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>姓名</label>
                	<div class="kv-item-content">
                    	<input type="text" value="<%=user.getUsername() %>" name="username" disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>学校</label>
                	<div class="kv-item-content">
                    	<input type="text" value="<%=jb.getSchool() %>" name="school" disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear time">
                	<label><span class="impInfo">*</span>出生年月</label>
                	<div class="kv-item-content">
                    	<input type="text"  value="<%=jb.getBirth() %>"name="birth" disabled="true"/>
                        <i class="time-icon"></i>
                    </div>
                    
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>年龄</label>
                	<div class="kv-item-content">
                    	<input type="text"  value="<%=jb.getAge() %>"name="age" disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>所属专业</label>
                	<input type="text"  value="<%=jb.getMajor() %>"name="major" disabled="true"/>
                    
                </div>
                
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>性别</label>
                	<div class="kv-item-content">
                    	<span class="choose">
                            <span class="checkboxouter">
                                <input type="radio" name="sex" value="男" id="nan"/>
                                <span class="radio" id="nan"></span>
                            </span>
                            <span class="text" id="nan">男</span>
                        </span>
                    	<span class="choose">
                            <span class="checkboxouter">
                                <input type="radio" name="sex" value="女" id="nv"/>
                                <span class="radio" id="nv"></span>
                            </span>
                            <span class="text" id="nv">女</span>
                        </span>
                        
                    </div>
                   
                </div>
                
                
                <div class="kv-item ue-clear">
                	<label>缩略图</label>
                	<div class="kv-item-content file">
						<span class="text"></span>
                        <input type="file" />
                        <input type="button" class="button normal long2" value="浏览.." />
                    </div>
                    
                </div>
                
               <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>研究方向</label>
                	<div class="kv-item-content">
                    	<input type="text" value="<%=jb.getDirection() %>" name="direction" disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>电话</label>
                	<div class="kv-item-content">
                    	<input type="text" value="<%=jb.getPhone() %>" name="phone" disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>QQ</label>
                	<div class="kv-item-content">
                    	<input type="text" value="<%=jb.getQQ() %>" name="QQ" disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
            </div>
                        <h2 class="subfild">
            	<span>报考学校</span>
            </h2>
            
            <div class="subfild-content remarkes-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>报考的学校</label>
                	<div class="kv-item-content">
                    	<input type="text"  name="bschool" value=<%=jb1.getSchool()%> disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>导师姓名</label>
                	<div class="kv-item-content">
                    	<input type="text"  name="dname" value=<%=user1.getUsername()%> disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                     <label><span class="impInfo">*</span>报考原因</label>
                	<div class="kv-item-content">
                    	<textarea placeholder="报考该学校的原因" id="reason" style="width:800px;height:240px;" name="reason" disabled="true"></textarea>
                    </div>
                </div>
            </div>
            <h2 class="subfild">
            	<span>个人介绍</span>
            </h2>
            
            <div class="kv-item ue-clear">
                     <label><span class="impInfo">*</span>个人简介</label>
                	<div class="kv-item-content">
                    	<textarea placeholder="个人特长以及获得的奖项" id="introduction" style="width:800px;height:240px;" name="introduction" disabled="true"></textarea>
                    </div>
                </div>
            
            <div class="buttons">
             <a href="reply.jsp?status=1&id=<%=shenqing.getId()%>"><input class="button" type="button" value="录取" /> </a>   
             <a href="reply.jsp?status=2&id=<%=shenqing.getId()%>"><input class="button" type="button" value="拒绝" /> </a>
            </div>
        </div>
        <input type="hidden" value=<%=jb.getSex() %> id="jb"/>
         <input type="hidden" value=<%=shenqing.getReason()%> id="jb1"/>
          <input type="hidden" value=<%=shenqing.getIntroduction()%> id="jb2"/>
    </div>
</div>
</form>
</body>
<script type="text/javascript">
var sex = document.getElementById("jb").value;
if(sex=="女"){
	document.getElementById("nv").checked=true;
	document.getElementById("nan").disabled=true;
}else{
	document.getElementById("nan").checked=true;
	document.getElementById("nv").disabled=true;
}

  var reason = document.getElementById("jb1").value;
  var introduction = document.getElementById("jb2").value;
  document.getElementById("reason").innerText=reason;
  document.getElementById("introduction").innerText=introduction;
</script>
<script type="text/javascript">
	$('select').select();
	showRemind('input[type=text],textarea','color5');
	UM.getEditor('content');
	
</script>
</html>
