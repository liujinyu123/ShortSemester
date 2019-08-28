<%@page import="Dao.ShenqingDao"%>
<%@page import="Bean.Shenqing"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
<%
     //如果状态是1的话，说明被录用，如果状态时2的话，说明没有被录用
     int id = Integer.parseInt(request.getParameter("id"));
     
     Shenqing sh = new Shenqing();
     ShenqingDao shDao = new ShenqingDao();
     sh = shDao.get2(id);
     sh.setReplystatus("已读");
     shDao.statusUpdate1(sh);
%>
       
        <div class="kv-item ue-clear">
                     <label><span class="impInfo">*</span>导师回信</label>
                	<div class="kv-item-content">
                    	<textarea id="reply" style="width:800px;height:240px;" name="reply" ></textarea>
                    </div>
                </div>
                <input type="hidden" name="id" value="<%=id %>">
                
       
         <input type="hidden" name="Sreply" id="Sreply" value="<%=sh.getReply() %>" />
         <script type="text/javascript">
         var reason = document.getElementById("Sreply").value;
        
         document.getElementById("reply").innerText=reason;
         
         </script>              
</body>
</html>