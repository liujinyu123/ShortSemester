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
      
      
       JB jb = new JB();
       User user = new User();
       JBDao jbDao = new JBDao();
       UserDao userDao = new UserDao();
       user = (User)session.getAttribute("loginUser");
      jb = jbDao.get(user.getId());
       
       
%>
<body>


<form method="post" id="login" action="${pageContext.request.contextPath}/JbServlet?method=update" name="accfrm">
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
                    	<input type="text" value="<%=user.getUsername() %>" name="username" disable="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>学校</label>
                	<div class="kv-item-content">
                    	<input type="text" value="" name="school" />
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear time">
                	<label><span class="impInfo">*</span>出生年月</label>
                	<div class="kv-item-content">
                    	<div class="kv-item-content">
                    	<input type="text"  name="birth" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd '})" />
                        <i class="time-icon"></i>
                    </div>
                        <i class="time-icon"></i>
                    </div>
                    
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>年龄</label>
                	<div class="kv-item-content">
                    	<input type="text"  value=""name="age" />
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>所属专业</label>
                	<input type="text"  value=""name="major" />
                    
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
                	<label><span class="impInfo">*</span>研究方向</label>
                	<div class="kv-item-content">
                    	<input type="text" value="" name="direction" />
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>电话</label>
                	<div class="kv-item-content">
                    	<input type="text" value="" name="phone" />
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>职称</label>
                	<div class="kv-item-content">
                    	<input type="text" value="" name="job" />
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>QQ</label>
                	<div class="kv-item-content">
                    	<input type="text" value="" name="QQ" />
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
            </div>
            <h2 class="subfild">
            	<span>描述</span>
            </h2>
            
            <div class="subfild-content remarkes-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>个人描述</label>
                	
                <textarea placeholder="个人描述" id="content" style="width:800px;height:240px;" name="description"></textarea>    
                </div>                          
            </div>      
            <div class="buttons">
              <input class="button" type="submit" value="提交" />
            </div>
        </div>
        <input type="hidden" value=<%=jb.getSex() %> id="jb"/>
        <input type="hidden" value=<%=jb.getDescription()%> id="jb1"/>
    </div>
</div>
</form>
</body>

<script type="text/javascript">
	$('select').select();
	showRemind('input[type=text],textarea','color5');
	UM.getEditor('content');
	
</script>
</html>
