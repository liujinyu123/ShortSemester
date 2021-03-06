<%@page import="Dao.RuleDao"%>
<%@page import="Bean.Rule"%>
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
       int u_id = Integer.parseInt(request.getParameter("u_id"));
       System.out.print("接受的id是"+u_id);
       JB jb = new JB();
       User user = new User();
       JBDao jbDao = new JBDao();
       UserDao userDao = new UserDao();
       jb = jbDao.get(u_id);
       user = userDao.load1(u_id);
       String sex = jb.getSex();
       System.out.print("接收到的性别是"+sex);
       Rule rule = new Rule();
       RuleDao ruleDao = new RuleDao();
       rule = ruleDao.get(u_id);
       String rules = rule.getRule();
       String[] r = new String[3];
       System.out.println(rules);
       if(rules==null||"".equals(rules)){
    	   r[0]="";
    	   r[1]="";
    	   r[2]="";
       }else{
    	   
    	  String[] temp = rules.trim().split(" "); 
    	  r[0]=temp[0];
   	      r[1]=temp[1];
   	       r[2]=temp[2];
       }
       
     
       
%>


<body>



<div id="container">
	<div id="hd">
    </div>
    <div id="bd">
    	<div id="main">
            <h2 class="subfild">
            	<span>详细信息</span>
            </h2>
            
            <div class="subfild-content base-info">
            <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>导师姓名</label>
                	<div class="kv-item-content">
                    	<input type="text" value="<%=user.getUsername() %>" name="username" disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>所在学校</label>
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
                	<label><span class="impInfo">*</span>职位</label>
                	<div class="kv-item-content">
                    	<input type="text" value="<%=jb.getJob() %>" name="job" disabled="true"/>
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
            	<span>选生规则</span>
            </h2>
            
            <div class="subfild-content remarkes-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>条件一</label>
                	<div class="kv-item-content">
                    	<input type="text" value="<%=r[0] %>"  disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>条件二</label>
                	<div class="kv-item-content">
                    	<input type="text" value="<%=r[1]%>"  disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>条件三</label>
                	<div class="kv-item-content">
                    	<input type="text" value="<%=r[2]%>"  disabled="true"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
            </div>
            
            <div class="buttons">
               <a href="shenqing.jsp"> <input class="button" type="button" value="确认" /></a>
            </div>
        </div>
        <input type="hidden" value=<%=jb.getSex() %> id="jb"/>
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
  

</script>
<script type="text/javascript">
	$('select').select();
	showRemind('input[type=text],textarea','color5');
	UM.getEditor('content');
	
</script>
</html>
