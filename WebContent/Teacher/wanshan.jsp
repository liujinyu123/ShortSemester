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
<title>完善个人信息</title>
</head>

<body>
<form method="post" id="login" action="${pageContext.request.contextPath}/JbServlet?method=update" name="accfrm">


<div id="container">
	<div id="hd">
    </div>
    <div id="bd">
    	<div id="main">
            <h2 class="subfild">
            	<span>完善信息</span>
            </h2>
            <div class="subfild-content base-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>您所在学校</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="所在学校" name="school"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear time">
                	<label><span class="impInfo">*</span>出生年月</label>
                	<div class="kv-item-content">
                    	<input type="text"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd '})" name="birth"/>
                        <i class="time-icon"></i>
                    </div>
                    
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>年龄</label>
                	<div class="kv-item-content">
                    	<input type="text"  name="age"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>所属专业</label>
                	<div class="kv-item-content">
                    	<select name="major">
                        	<option>计算机科学院</option>
                            <option>工商管理学</option>
                            <option>数学</option>
                             <option>物理</option>
                              <option>土木工程</option>
                        </select>
                    </div>
                    
                </div>
                
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>性别</label>
                	<div class="kv-item-content">
                    	<span class="choose">
                            <span class="checkboxouter">
                                <input type="radio" name="sex" value="男"/>
                                <span class="radio"></span>
                            </span>
                            <span class="text">男</span>
                        </span>
                    	<span class="choose">
                            <span class="checkboxouter">
                                <input type="radio" name="sex" value="女"/>
                                <span class="radio"></span>
                            </span>
                            <span class="text">女</span>
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
                    	<input type="text" placeholder="研究方向" name="direction"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>职位</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="职位" name="job"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>电话</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="个人电话" name="phone"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>QQ</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="QQ" name="QQ"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
            </div>
            
            <h2 class="subfild">
            	<span>备注资料</span>
            </h2>
            
            <div class="subfild-content remarkes-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>个人简介</label>
                	<div class="kv-item-content">
                    	<textarea placeholder="内容不多于500字" id="content" style="width:800px;height:240px;" name="description"></textarea>
                    </div>
                </div>
            </div>
            
            <div class="buttons">
                <input class="button" type="submit" value="确认" />
            </div>
        </div>
        
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
